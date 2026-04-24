Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5361FED3CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dUscyZYadGP/u9WJSSSuXzFvgisXZewFczcAHjysNQ=; b=iE2n5v2GA4UU1FULSLZi86whf0
	zkNVKHwMImY3Ob0mYSZO/YcVQ15FqRSR5JBS9bBfrdjEHSd3zF9IT4pQVKwBfA0ggZ018f2C1NMQv
	yRIAMGqc6AFl8r9M2seebDnhhlDatPknOMCtmhd1zxbfhC9P0PxJZ37p7UPxQfoATu6vHsG8SXynp
	elzUlPN+IJfZrkXEcNNcUHGaN/hpGPk0zdKIrzlmm0Y1njd/aMIqnTYcyLIat4VgqaRnSp883ACyo
	JqdGsPzlV6tutfVJZyT2stuaVHBtKGBk1Ryrqcejb9QxVbnVatUXRvMNy5e2KbYYUsHqKbH7IxwGJ
	ZRvw+Iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGVs-0000000DEL0-4Aqg;
	Fri, 24 Apr 2026 13:24:08 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGVr-0000000DEKW-1Fyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6dUscyZYadGP/u9WJSSSuXzFvgisXZewFczcAHjysNQ=; b=LjSajm/Lv1J/FIEsPkNqemQ0lr
	JJFDS8nLZIO94YyIh7OWBNGrSlWjeSmtNUZQkknrUVZq7gE0SnFxWN/dZmlDD5QiyI/dLzbze/k8b
	MNPROBK3V0WXzbMz5oWFEK8ogZ0ztwIUUQaYZ6VOJKTur2tdLsDhZ3WQIx3Kh0bEoII4eB5JpkgmX
	B6nfhnKJv4kysIQojZ/uPm/NTg0PLy80kFW5CSgaTgmo9sHz+x1Foh0Et+IYVGUEB2R2bPgpHviiM
	l7pULkqFsWeZlbn647tGJs1N07H4hsM5VGMeQ752exLP3MgQ64GVLFbFntFG7gUfmN62TvMP2Mn6I
	1xzVA0tw==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1wGGVp-0000000553V-3BUk;
	Fri, 24 Apr 2026 14:24:05 +0100
Date: Fri, 24 Apr 2026 14:24:05 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v3 1/4] lsm: Allow LSMs to register for
 late_initcall_sync init
Message-ID: <af480e33671b77da6555c1db8f6dea3c4fd4049d.1777036497.git.noodles@meta.com>
References: <cover.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777036497.git.noodles@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_062407_345949_A8D03D33 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yeoreum Yun <yeoreum.yun@arm.com>

There are situations where LSMs have dependencies that might mean they
want to be initialised later in the boot process, to ensure those
dependencies are available. In particular there are some TPM setups (Arm
FF-A devices, SPI attached TPMs) required by IMA which are not
guaranteed to be initialised for regular initcall_late.

Add an initcall_late_sync option that can be used in these situations.

[noodles: Split out from actual IMA changes]
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jonathan McDowell <noodles@meta.com>
---
 include/linux/lsm_hooks.h |  2 ++
 security/lsm_init.c       | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index d48bf0ad26f4..88fe105b7f00 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -166,6 +166,7 @@ enum lsm_order {
  * @initcall_fs: LSM callback for fs_initcall setup, optional
  * @initcall_device: LSM callback for device_initcall() setup, optional
  * @initcall_late: LSM callback for late_initcall() setup, optional
+ * @initcall_late_sync: LSM callback for late_initcall_sync() setup, optional
  */
 struct lsm_info {
 	const struct lsm_id *id;
@@ -181,6 +182,7 @@ struct lsm_info {
 	int (*initcall_fs)(void);
 	int (*initcall_device)(void);
 	int (*initcall_late)(void);
+	int (*initcall_late_sync)(void);
 };
 
 #define DEFINE_LSM(lsm)							\
diff --git a/security/lsm_init.c b/security/lsm_init.c
index 573e2a7250c4..4e5c59beb82a 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -547,13 +547,22 @@ device_initcall(security_initcall_device);
  * security_initcall_late - Run the LSM late initcalls
  */
 static int __init security_initcall_late(void)
+{
+	return lsm_initcall(late);
+}
+late_initcall(security_initcall_late);
+
+/**
+ * security_initcall_late_sync - Run the LSM late initcalls sync
+ */
+static int __init security_initcall_late_sync(void)
 {
 	int rc;
 
-	rc = lsm_initcall(late);
+	rc = lsm_initcall(late_sync);
 	lsm_pr_dbg("all enabled LSMs fully activated\n");
 	call_blocking_lsm_notifier(LSM_STARTED_ALL, NULL);
 
 	return rc;
 }
-late_initcall(security_initcall_late);
+late_initcall_sync(security_initcall_late_sync);
-- 
2.53.0


