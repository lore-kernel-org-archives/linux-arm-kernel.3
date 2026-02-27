Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F83FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8f+jjLUuEPjOIj2EFH8Sf+p1khoKw+4tTQ8ZS3xXOc=; b=j0Lt4/UtRd+gH/f1wFrxKxDLSx
	1Snz6S04Hjg4PCpsqOF5DGzXE7XTV+rmYGFCrMwsZLacTgD35ROj+/phw3mtgvYu/32O+jngzZVNC
	MnmShpkN3oM0dYlQfw/JrosiXTgBnSdASV73hQc/086QdSFkDkBMv2KYEK1pt25b0aYtKFyzYWOXw
	I/LoNb/OoTsmCEb13nld+L4g5bXbK21c1zJYPdbZ4pueZXOCJ7B2eso49HpssP1M0J9Gz95ypbgRA
	W72w5bEVSq5V5pnQ1ZahMPthc5pyLh5RdhXcFfBE0B+BkIaVe7AG+IP2lL6p0aF8ZBRn+z3ZEYf4s
	m2Yg9zdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzct-00000008b2C-1Ecn;
	Fri, 27 Feb 2026 15:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcr-00000008b0n-2Qzw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=b8f+jjLUuEPjOIj2EFH8Sf+p1khoKw+4tTQ8ZS3xXOc=; b=FK/0hhJgc22ww04yhFBSvKhzj2
	V+YXnkRnd+I1szqT5Xcpo1J4dbgTk7Djct0FLvqDZf0EkT4tdkU9GjCCeMrfIKZu6Ez2tdnXy9dM5
	0+i2fnfyEvBq1tVSwr6HkPtsfsCXBqBfUtEb5UPz6btdv3iEzjNOeVAf7fEQAE1UB9I4rNv11dRBh
	oBqUaypEO7XDbgtlAaqH7X8z6mazsJKfQX4mNF19cBM5yJAcE4Hqqmx33NEkxOG4cFxaS0exj9H8w
	snyPQ/8P0mo1p6Z/MtQ4flQZP5ExI4GmGGTf7pc5SQVoRfs6CAmxWMerKFANNi7LLr7ZuJtq3jh67
	RRNP0Ilw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcm-0000000DLCw-0bRo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b8f+jjLUuEPjOIj2EFH8Sf+p1khoKw+4tTQ8ZS3xXOc=; b=qOupxukBeAYE/SA/shquQFNVe9
	6jeL8AZzJFjrkHHXcunJV4bwA2mb+iFB68xaWMlIz2qOZ3TIkHwh+aWPjACH1x1JmffJg583oxOpJ
	/NLq5y7Es1zxJC9GhwKauXzAJYjDiRzV5iZgPLOm+CS+kgNNcyHAetqyH7tfBa4nRZ0YjHIQSHyTL
	pmz6GnTRUCZXdHH4B8nzM4RKk1fF8IJLNe9LdybJqkq4+UHx0dk/ZJzX2aqgOAPqlmho1eMIENTiA
	X7oKBu6fQClfA6787HVOkMoxdcyreJ1O+0NnViv1GxTERp86dpQhHVKjt2p9ZPQe3dWpQz78mgg4m
	j7mg1NtA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59016 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvzci-000000000yX-2L0g;
	Fri, 27 Feb 2026 15:19:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvzch-0000000AwoC-3JkD;
	Fri, 27 Feb 2026 15:19:23 +0000
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 4/6] ARM: use BIT() and GENMASK() for fault status register
 fields
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvzch-0000000AwoC-3JkD@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 15:19:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151928_627460_D09E93F2 
X-CRM114-Status: UNSURE (   8.51  )
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

Modernise the fault status field definitions by using BIT() and
GENMASK().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index e95f44757dc9..d2bdedaefe14 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -5,12 +5,12 @@
 /*
  * Fault status register encodings.  We steal bit 31 for our own purposes.
  */
-#define FSR_LNX_PF		(1 << 31)
-#define FSR_CM			(1 << 13)
-#define FSR_WRITE		(1 << 11)
-#define FSR_FS4			(1 << 10)
-#define FSR_FS3_0		(15)
-#define FSR_FS5_0		(0x3f)
+#define FSR_LNX_PF		BIT(31)
+#define FSR_CM			BIT(13)
+#define FSR_WRITE		BIT(11)
+#define FSR_FS4			BIT(10)
+#define FSR_FS3_0		GENMASK(3, 0)
+#define FSR_FS5_0		GENMASK(5, 0)
 
 #ifdef CONFIG_ARM_LPAE
 #define FSR_FS_AEA		17
-- 
2.47.3


