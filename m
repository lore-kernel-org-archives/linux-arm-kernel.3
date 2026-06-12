Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDEDCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=; b=BPpGFZjPjPRCJ9NjvNNp+z4kq4
	7C1MQEqTUQAAdspC/S27R/0Cp6L2s/rk+SjSc1s5NihXVu5C1ys3pLRJLDF3Lb6Ob1fFsnNP6p3T4
	B3Rc1ixaPqhd8l7uf66fXt/MFPRKfVn8vETqu/n1g3OR9XNEwJajop1ujoLLngiEQVhKBwyTO7fce
	4WW8RSbrnc0LnJzFppBkD/HHaWNNU+KJQRN03KFstwRW0RO5jjMTS/gJiK3I0t73zbIoe2X7/PwSL
	sRzqo78ogb7SkE+v7sOb5HXknlwxapqZsMsUSjFokC4z6nOuO2gvG8J3sthzD/OzMOiWQXo7+gKdF
	On67M0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vU-0000000Aycr-2uIv;
	Fri, 12 Jun 2026 13:28:00 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vS-0000000Aya9-004i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:59 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-13807d2f898so1086491c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270877; x=1781875677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=Jn2uijYnRajnqOPCVA/4ozf/iisQrbTnEgM5nD+Nx53rbMgNUx3lKWyoMAjwgSqsQZ
         qd3HrOF9dikEEy59KyV81GqkrvGbT9ntADwDsrCbnumsjPkeHi0mljPS0hzcuTzxDB0y
         PkVC4cPExXFjeXjNqvMjuxKWk+fktdrhpYQ14JUuTtqVIgkFq9b7dk9BW52+oQdMlUNZ
         6fbH03Sg0FgycAvpVDSMPc0eCkfNrqEVIcjRFnShQUx0yJPxTcYmUk0gR69DJekN77tM
         uYBykcG1Jotvfo5seOIH7yyLQZxK7ED4hwxnQM+lUo1BdrE5GMC/3HydtemJZMEx7pER
         q8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270877; x=1781875677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=kpqUsseyF7O6I9iRHgqDQFD7wN6JL7yuVjGt+hZX9/UwvMwzbLyPiOUP2uabeC+zPB
         eXVU3VLUjXqSeAQ7Z9QN2l4QqM64cwaRkFgk8uTUvU0oGGn1fQkFE1LWK1VbJaviGFN3
         fjkxARXRCI+m4kAzQ8D8xtyBr1TkBXlu7D/RCMVI3zyTBQfD4X+NvhRdtSHSRctkFA/r
         EvZDp8d/U/lyQmWY3c7+B41sBlj51y0L86TC1m/6FH0GfqxLiOzIPShN4eYj+aOCiNH5
         7v/kf2nYm7SBi4+CX/tN4wz3oNb+to8YlmUMF6VISyoAq0kaK28qN+pUpFEbNo+qxRPj
         +NpA==
X-Forwarded-Encrypted: i=1; AFNElJ/rABezs7RBDYL+p5G4cgeCrYXK6mx3gSuSdxwxw8n9EXuhK2WNPxjBdU6FkcxedFhlql7kC8otxYoFZ2w1dbYN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ttSlOLr/fmzaFjJR7C+PZ3/+DiZKPX/7qCl8DsmYMaYSWtWv
	ktdGKQ7DPvmxB4ztHlZR45q0Oz5KTwpZTYLoEET+UO3gz9lcJmiieuu9
X-Gm-Gg: Acq92OH8LzBOPmHenKH/IoaD+4iQH5XNCRhNGHFXyvCmMAohofbQAJOQBQNTqkt8GP8
	U/sVjdROJ8218Z55Ogd2n+f0J3lBQAGmxzrSZc7pC8JRLSEQnt+MajzraAg3q2EuOQpjLSV10iy
	eKDeZYvuhQAKyYj/f4ZXWya+NeHVjQN/P+0U1l0xvwT+PDr+GzrwU53+BYf9VNKEnFkvq3kmFBS
	OIa0GlLF6ntcgAsony3yM6lYB6eyekT7HYgVz4gw54GEHl37Ep28RDFoM3c0NoE23dmTBagsnNV
	TyDDxXM/3IDhrMlFvybECbTKqKT/u+0TU0FFD9mOivRXCTFGZ/gVdkeZ7gLpfyf4surlUlT08NJ
	tlHquPQXlwk5uxEgfsjVyyyW9ub0BZIzregriBdVRpYVgsmRBQ39fvUEhNcDSOzzrU3vlcepzTI
	Ovf4dlB+aHOUnIqIx/zaqy6DlItDx8ez8C0ShkVEWKtayx8u1qgQQxmnLQkQ==
X-Received: by 2002:a05:7301:6083:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-308200a883dmr1707604eec.25.1781270876974;
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
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
Subject: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:39 +0700
Message-ID: <20260612132639.78086-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062758_069661_3427A854 
X-CRM114-Status: GOOD (  13.55  )
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
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..80666da923d0 100644
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
+	scoped_guard(mutex_lock, &psc_dma->mutex) {
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


