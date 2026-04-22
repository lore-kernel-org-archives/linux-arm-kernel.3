Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27197FA1FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G16Wr5UGS3BH+L8X0Ym+eqIeEfX1cXapr7I5ka7X4Us=; b=j/Q0F+VO7LEwiXYeeUSEDT4/En
	SqpdyMUeO6O9d/UrUkRZPiL5uMenCx2RmE86ul50JHsR/3x5mSjmBjDTWg56q8CmufhGxhwUiwdlS
	6y+iubg7A+2nwzsDON8lCZ/Ih3ul0+SxBfTmYjvSbcq8oe4erRPx+PXcUZB8DB+lMgqOMcZ6vtZWY
	UgmxbwMmquU1Q4uHzoSaQ1GsNdXyPpoo1wyDRHz3qTCRmMEyuKshfJJChGYQ1rVP3IZXugq6LkKsF
	IyJxH8aw7bHZDBALflqe9kgiNV4E22qc8zNgg1h2EWTEoR4Nx4P0ZSnv2aoKe6o/5+Am6Osr/e8cv
	fKZm6nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaO1-0000000AVWe-0VP4;
	Wed, 22 Apr 2026 16:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaNw-0000000AVUl-45DU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 205DB1F37;
	Wed, 22 Apr 2026 09:25:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E5013F23F;
	Wed, 22 Apr 2026 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776875107; bh=OznS5k+Y9tBwswJLbKpzM/l10Fd+kOv7XSaKZ/Nsp/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzTVtfGrgh+q1HyFQnBqATd+NWOiXVGKbY6NQxgybP/vyqhIv5ByWSbm9lfRGENC0
	 fSYA/lyhTzTz3EGMzvKH4rzhkwXNkM1IDkaQGw6s6ZxACKseghScFXtZDZJa4mJd3m
	 Wk5xtK8cywNdld7I98uuXIF0swLxZOeqWBz+okjY=
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
Subject: [RFC PATCH v2 3/4] firmware: arm_ffa: revert ffa_init() initcall level to device_initcall
Date: Wed, 22 Apr 2026 17:24:48 +0100
Message-Id: <20260422162449.1814615-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422162449.1814615-1-yeoreum.yun@arm.com>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092509_049607_21BD5D33 
X-CRM114-Status: GOOD (  11.72  )
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

commit 0e0546eabcd6 ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall")
changed the initcall level of ffa_init() to rootfs_initcall to address
an issue where IMA could not properly recognize the TPM device.

However, this introduces a problem: pKVM fails to handle any FF-A calls
because it cannot trap the FFA_VERSION call invoked by ffa_init().

Since the IMA init function level has been changed to late_initcall_sync,
there is no longer a need to keep ffa_init() at rootfs_initcall.
Revert it back to device_initcall.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..02c76ac1570b 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2106,7 +2106,7 @@ static int __init ffa_init(void)
 	kfree(drv_info);
 	return ret;
 }
-rootfs_initcall(ffa_init);
+device_initcall(ffa_init);

 static void __exit ffa_exit(void)
 {
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


