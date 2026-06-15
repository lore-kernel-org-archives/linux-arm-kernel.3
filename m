Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE74CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=; b=dALew1L0+yiJxBzvVnsaX2gshJ
	HCr58bM2xr0MANl0G3Mz4M2VpJNEjXPGIdvbp6Fm2WTCqdQPWyMX+d96hAzJt9mzCAfGM9sEk7M2+
	eU0+NF2kxuTixcsK9LaW9PQfmqXEwdpzh96AC2+GTcUmr/KHDLKe6vQjuz2SPN8TWhCbiQ92hrdBM
	3cZ+LZmQBo879lHzKSkCWM0BWFNeJvAKRyN54Ew9P7j1LXaFox5u+C1SCvRvHtQ+f217hqlEw8kS+
	BqQKMAFFjJTsefH1E92RcrjwX5JeUVyFdq6cIV8ogSHMSXEf7XoAg5R9j+PMt5txS3HSYwwP4b70i
	NdEV4DNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3od-0000000DzKY-2wo8;
	Mon, 15 Jun 2026 09:41:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oZ-0000000DzHL-3fit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:41:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1935250a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516467; x=1782121267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=KX+P4uqwb4eKFwOU89T/WbUOe+AVqHslDP0yDOSqpTFj0B04zt0tzd7p6/eDFzj/Uf
         cGuW+bRLov42JAPc8dmRqy4vZ2wZ26MZuJvhU5DzdlGQFqoUnOjIPgCkrvIij1ciHMrZ
         RXbGswffkZuWN5fwIjLgcrVbg6TxG1deLTToJPpZGC98rqcsNRaAzgkFuOBVY8/UrHoY
         NeP0m8W++tIf5taW1Kldp2PT+Dct2mOKqgBJ0eILWx3nNVT26xl2mYIrSjpw8UIzMwhU
         mAQdeZ2bnh0HXuUufmM8DOkUEYmHBgvJeWwnRE7DOXbu13iAVbACJpq33r0EeMmhsuzU
         ZQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516467; x=1782121267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=Mxu+b4GPM3ZsX/JQtCrwATpxLg4C3z3Y4UweV+OsGXdC/Rfv1KqeUlexClbrUijs2q
         P/Zo1jA6wvw7Qoesi0vLJ2WGAmwTlX7ijpSm2H99+jAZh5mzrkhTKHGoUpm9l9i8tJyB
         FZPpw2uDN4X4j1UjytEllX1VVRpb/9Y+O6oG/TNEovon+2Nk9Ssx4FpgusETOjpkNfgJ
         JbDyOOWnyq8TBwhjMLSLRypdwpvmwISwx+XG2LQEauTOv6DpgxQML6r9UBUfAo+wPqgd
         7Dp8FA0NypNJwlIBUDe/h2N8eCceddV91Tl07tWIcJ+hd9d+dZaqNgSTti2bsBSyo/3M
         eRlA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZuE2GGJ+M0J4G1YoS1x1np2d3bllc+30Id+jrgcJi+dHnlH5KjMMNyv5bGUwxhEWHPdmJbrPGBv3IkVenKuz2@lists.infradead.org
X-Gm-Message-State: AOJu0YynDnDSYFzQ8sQFFpEeqrO5H+5kEhGMFbkjDbvI2KLR0KhS8wrZ
	Q0Je9lpDnKxTQQnxjsjexMqnd7006FCGUa5CdBN+rSBN98/chqdBVEPE
X-Gm-Gg: Acq92OFgu4twKKPQKVXZrJdetdbgaIh0Sam/+nbEwSUeQ5Ln7E8Nscuok+wfXXl4vvv
	DOeeNUSvL3DVKHcdws6po8/BpwoOCipbnHPqCSWa8P3bQas3eozvHUSlUQUIznuln/1S3Vc6Z7C
	vWs2F83pjkx3cg7aH+p6fydLnQLLkjwc6GynMPv+wRO7sNKEcM8gNHvP9uFaXyOe+EdjUeP+7pW
	CAzpYpixMkywax7cL5MrQ2AnCyI/fBVMzkpXfyyKZ+JnLYbPLNLhqWCWpoM3f9zmP9UoUWaU7bL
	BlZZ2XQWBh2uwWYMARDn97x3w2l4SzGdRziQfxNZ+JeEpQRlvMg710Sq3DaWSiAo3eWBBNrz3Ce
	nKNSxb4DgnRnv4gMF2Rj5AyFV39H2gdNF5UhHFu7dbcpi32HpNQX1cvV8vc4YKEk33BTQj6tlGg
	qDOxzEQuOK9SWzv03ApkFdzuloCpq9ElYTldNrUerdi5T02Acv27eUDGphrA==
X-Received: by 2002:a17:90b:4a11:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-37a01b3f8b6mr13135815a91.6.1781516466932;
        Mon, 15 Jun 2026 02:41:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:41:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:24 +0700
Message-ID: <20260615093824.115751-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024108_886860_36615E84 
X-CRM114-Status: GOOD (  14.10  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - psc_ac97_cold_reset(): Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).

 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..d4d9f5b6bc07 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -31,14 +31,13 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	int status;
 	unsigned int val;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command send status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (rdy)\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 
@@ -54,19 +53,16 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	if (status == 0) {
 		pr_err("timeout on ac97 read (val) %x\n",
 				in_be16(&psc_dma->psc_regs->sr_csr.status));
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	/* Get the data */
 	val = in_be32(&psc_dma->psc_regs->ac97_data);
 	if (((val >> 24) & 0x7f) != reg) {
 		pr_err("reg echo error on ac97 read\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	val = (val >> 8) & 0xffff;
 
-	mutex_unlock(&psc_dma->mutex);
 	return (unsigned short) val;
 }
 
@@ -75,52 +71,46 @@ static void psc_ac97_write(struct snd_ac97 *ac97,
 {
 	int status;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (write)\n");
-		goto out;
+		return;
 	}
 	/* Write data */
 	out_be32(&psc_dma->psc_regs->ac97_cmd,
 			((reg & 0x7f) << 24) | (val << 8));
-
- out:
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_warm_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_AWR);
 	udelay(3);
 	out_be32(&regs->sicr, psc_dma->sicr);
-
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_cold_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
-	dev_dbg(psc_dma->dev, "cold reset\n");
+	scoped_guard(mutex, &psc_dma->mutex) {
+		dev_dbg(psc_dma->dev, "cold reset\n");
 
-	mpc5200_psc_ac97_gpio_reset(psc_dma->id);
+		mpc5200_psc_ac97_gpio_reset(psc_dma->id);
 
-	/* Notify the PSC that a reset has occurred */
-	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
+		/* Notify the PSC that a reset has occurred */
+		out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
 
-	/* Re-enable RX and TX */
-	out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
-
-	mutex_unlock(&psc_dma->mutex);
+		/* Re-enable RX and TX */
+		out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
+	}
 
 	usleep_range(1000, 2000);
 	psc_ac97_warm_reset(ac97);
-- 
2.43.0


