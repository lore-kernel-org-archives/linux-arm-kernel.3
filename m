Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B020FA1FD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJaRtnu9dufbcNFmNi+BTTpizekEJVorhRTmEV2eCJc=; b=0qxr4YJrNDVDUaM12Eout9jSUc
	AnTF8SEPjELn9mU3n7dv+NBMXeiVUOaX0e47iPMt44LNF3msjjO6IuEHRmuupG+C4yYXI2YTvtcEV
	j6GJsLzBkm5bPIIanIaQel1Wyd9hieeT4IHWYCju8jv2MJXTLyM8wQFFtE/hSfQ+9fW5cIufv1xkt
	hRUO8SzTGCcCXHerdYXjrW/Yil2e+VrNanA91iZ8/yaWXIhAjIZy+asy46iColYRXJQceqwL9GvYp
	1bR7hX4+KWMGmzm3cTwRSkt8IzaPgANzLEUuRrrWqlqAk/i3FrtOaafSmZ3W95/XQlXPAiwktiNo5
	7o4i2y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaNz-0000000AVVg-0ecY;
	Wed, 22 Apr 2026 16:25:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaNs-0000000AVST-2TCT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:25:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA691F91;
	Wed, 22 Apr 2026 09:24:58 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84A613F23F;
	Wed, 22 Apr 2026 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776875103; bh=+KnBVwVQsum+9CObFDKz95hXpLV5Rw5969CJRIdIoIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k2g586JFM89yTYChnUIUHqyRBlz+btkGzp3IaaoiKKbQoyNJiZJ7qCqq7faO5UdDk
	 vy/iC/oj8l5ZGXZwtzUoiJ+rAmcwEuiu89yVeT7AUxX3DS6cm/RwXEa8fckmk1PX5p
	 A+CfMmP03d/ZnRSY7rJgxPzUMBSFkqROX8p0mAgM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	sudeep.holla@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	noodles@meta.com,
	sebastianene@google.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v2 2/4] tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in
Date: Wed, 22 Apr 2026 17:24:47 +0100
Message-Id: <20260422162449.1814615-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422162449.1814615-1-yeoreum.yun@arm.com>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092504_674545_4B92110D 
X-CRM114-Status: GOOD (  11.06  )
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

commit 746d9e9f62a6 ("tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when it's build_in")
probe tpm_crb_ffa forcefully when it's built-in to integrate with IMA.

However, as IMA init function is changed to late_initcall_sync level.
So, this change isn't required anymore.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 99f1c1e5644b..025c4d4b17ca 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -177,23 +177,13 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
  */
 int tpm_crb_ffa_init(void)
 {
-	int ret = 0;
-
-	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
-		ret = ffa_register(&tpm_crb_ffa_driver);
-		if (ret) {
-			tpm_crb_ffa = ERR_PTR(-ENODEV);
-			return ret;
-		}
-	}
-
 	if (!tpm_crb_ffa)
-		ret = -ENOENT;
+		return -ENOENT;

 	if (IS_ERR_VALUE(tpm_crb_ffa))
-		ret = -ENODEV;
+		return -ENODEV;

-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);

@@ -405,9 +395,7 @@ static struct ffa_driver tpm_crb_ffa_driver = {
 	.id_table = tpm_crb_ffa_device_id,
 };

-#ifdef MODULE
 module_ffa_driver(tpm_crb_ffa_driver);
-#endif

 MODULE_AUTHOR("Arm");
 MODULE_DESCRIPTION("TPM CRB FFA driver");
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


