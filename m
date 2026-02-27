Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B2FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM89VooTCsyDyj3RpueyCnQialfJtSYcR3IS3wxm5tY=; b=FF58KWNA94yJdW+1mphwIlj0YW
	JbLBF+xmhp1t4NqHlj9C8heG4UiqZvQqZowWOenyIjWZv1+uDSUxAtTQoRAl1tzxBIqv/7vo8pmtd
	ufvZVywAeOJOYXf2z7I7cUWzjn/Itb/ZHWGxNTEMiJ/IUkf/vH2RfgRzeoi/PeMn5hovZHNa1G7Xw
	W/w1xn8iWiL2SkrM3mF8JBM0DRkgNd/nD5XTIngqUzRpenMvRBsaSytdBjKr4ba2s8BMSdvj3NA5V
	PUdM/8/DtAKYLQjgBKZ/qHs66PKWKXSh9P4bbpCbPXSGwXyHXB9szy1ThA0SxBeqQt8LjSG/DgNdX
	DYnQqxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcy-00000008b5j-2VeB;
	Fri, 27 Feb 2026 15:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcx-00000008b4v-402O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=jM89VooTCsyDyj3RpueyCnQialfJtSYcR3IS3wxm5tY=; b=VLap9P6qTqXZ6samdZFoxoW+1v
	acZtC2wSJGc8tpDIg1D+cv7myf3CLDSS3eJDZW84/yZMaEF7uiMPKKNeQSSYPZuoBuWIX+8iQ2t4W
	N6ajg7Ic1Lih+j+S1UP4tHwyRcuPW/fUuQuoJN9hLUSBKfquMO1E6SXbH3IIUPVZWa5LbywA598f1
	o4N8A9ixrSEce+f7vYOb0YPxUVXvnrrjlogKtr08WriMW/mmzzRZDvlhYwwC6MONeAjC9ymTQIN9K
	HY86r5Qkt+tX4512DSN3wqO2v3Igg7ZyrDs89lqCbevQbCZaAUAHHemdV7fckDqdtJnoS3bJmx8vW
	7IMI0pcw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcu-0000000DLFc-1KRc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jM89VooTCsyDyj3RpueyCnQialfJtSYcR3IS3wxm5tY=; b=rwVFDEHtxJ6vBL74EM3pjfnU/S
	YmPH7XxXkgtYQtgF5oSyYr6HOFRZFwYdlzRrQPx333VB7eTp238pnErCCxKP3NuZ9YRkfEFz08Mwd
	ax0n1YxolALwrXi8i+34P4ciQNGrvqM+RGvEE6ADyP4u7P6FRvO9kPPZ+kQj7vh6PVcL6v18zFsR/
	+RiQ3tFeckZfbD8RlA9q0Ef5hOrJ2AFcGNhhLx43a5AQHCGYyB+mJ4FkCL82ispETjyt2iuThr3Lm
	i+aLSKYG48CQupdKLIgLsj0+8iqGynyytXl5YL/CFvNuYjwB1AkU+TwYniMpo6q2ElqN1/uMlsg3m
	OnCjSA4w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47422 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvzcn-000000000ym-2YJu;
	Fri, 27 Feb 2026 15:19:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvzcm-0000000AwoI-3o9W;
	Fri, 27 Feb 2026 15:19:28 +0000
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 5/6] ARM: move FSR fault status definitions before fsr_fs()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvzcm-0000000AwoI-3o9W@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 15:19:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151936_511248_22E597C3 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

The FSR's fault status bits depend on whether LPAE is enabled. Rather
than always exposing both LPAE and non-LPAE to all code, move them
inside the ifdef blocks dependent on LPAE to restrict their visibility.
No code other than fsr_fs() makes use of these.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index d2bdedaefe14..44c0fad29cce 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -8,9 +8,6 @@
 #define FSR_LNX_PF		BIT(31)
 #define FSR_CM			BIT(13)
 #define FSR_WRITE		BIT(11)
-#define FSR_FS4			BIT(10)
-#define FSR_FS3_0		GENMASK(3, 0)
-#define FSR_FS5_0		GENMASK(5, 0)
 
 #ifdef CONFIG_ARM_LPAE
 #define FSR_FS_AEA		17
@@ -18,6 +15,8 @@
 #define FS_PERM_NOLL		0xC
 #define FS_MMU_NOLL_MASK	0x3C
 
+#define FSR_FS5_0		GENMASK(5, 0)
+
 static inline int fsr_fs(unsigned int fsr)
 {
 	return fsr & FSR_FS5_0;
@@ -29,6 +28,9 @@ static inline int fsr_fs(unsigned int fsr)
 #define FS_L1_PERM		0xD
 #define FS_L2_PERM		0xF
 
+#define FSR_FS4			BIT(10)
+#define FSR_FS3_0		GENMASK(3, 0)
+
 static inline int fsr_fs(unsigned int fsr)
 {
 	return (fsr & FSR_FS3_0) | (fsr & FSR_FS4) >> 6;
-- 
2.47.3


