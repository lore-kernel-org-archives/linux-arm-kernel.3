Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA576CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=; b=FUhzAFrubfPfbSUPk0fwasUZyJ
	BpArLwd1cmZ/oRYQwBai3BIpTEjmDCs67+ddF5GyP682Ic9WM5FVSQ6sAZZ0L3ZPYKL2dPEvaEM99
	tG76vQHzrrM7KeX1suGBT4uHLWt6CP5MYzGiPCSY/+kefA5t2STnrzBIuE3HWLu1+ga57oSMfAjxi
	fFU/xlRzMR3Is8BdaxaJo7GcWmpmgwmENaW9UujOmDFxg6GZd9PneVYZn9wHe3vONDkWXwkuRQ9ep
	A72z+d/MWOvv+n9EigEncK9m8SMEZ1rtl7S5Bcg8ynfxmoA2YCciP8hZ7Sy8lcKsyWY1YJBXO+udD
	WF676dCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3o8-0000000Dz0b-3WZH;
	Mon, 15 Jun 2026 09:40:40 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3o4-0000000Dyym-2N0W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36da151a152so2155047a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516436; x=1782121236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=Kuvnx2amQmS1PFa30pamtq1DKQmh8Ue06pL0/VhgxbCBabzcFyfCqPRKx8pdIBr/HE
         C55f2oQDoQMHoSNcNUaWqU+zsLFMh+zCHIurd5agXvSB/DURSm/egcDd18LOSSJFkzmA
         WIx6HwJ13P1EQ5kgqsSHE8JuvcQfe3HgSb+Ie+FD6i2zozlTtrnOKUx3LSzjmpnLSomy
         0WZMm2iu8KhRrfftdBqe4pkpkH2wR+377UQGgKI1qrAIWkZ80j9b4K28Q0zhvSvpx9jO
         fr+3Ph61HkajPFDnfb5uH7faMIJtUEv18vh7O/Jo5LPom494a0L4EIBNrfQVo4jZrk6y
         JWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516436; x=1782121236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=lX4au1AH4AKw0MweLnytIMQFpMektcAdUapVPv50y1RkRd+oQKrC1UnuXiLgdwsIh4
         61jshisiKjfrZ0eT/h3Rlrkn8SHxy57aTEhX/8nkIz1KQxoE/pLoFoT15vW1h+hcs/lX
         3rdDMEuXhFEVoee/dGEZGJcBY1lW0V+C6Z/ToUEDR/YRbUgcAWhNA/Ckt7ocfbG6Wg0k
         V0k356qtmqLw/XUKJQ2qJgLr/1Rn9avD40CnGMvVzQHUlaSkM10eOzRjrQIhmKG23KKw
         XuysfcS9ifiCenl7thf2EOx6b/g3SY/sU4H4eKDEdwRLq0GqL91Pojt3P8x7lB2llW5W
         sK6A==
X-Forwarded-Encrypted: i=1; AFNElJ+JYLFKB2Xv1xHOeAT26xWX348syQIlJV+CLSli3rTxnuNoOYQJXtutbMQ9WxjzH9199OeQwS74NDTC3XEJxK+a@lists.infradead.org
X-Gm-Message-State: AOJu0YxcqHWlc6bLhU0oMNXatTe4YJGp/Dl3tC4GWV4fQVmQQSvnpO++
	SP8NmKQg0V5WFrDv+/43t65FHoKJeP/zXxbmsOM35e/0fM8Wb0+oRqu5
X-Gm-Gg: Acq92OEJV2jy5DMUXrX3KecCkEmPj6eI8F2JddynsimGk4x0H1SU2kHG6sWYK9T6Qjq
	Sjq7rU+JyjmPDDLMcDziZccdBwNP5XLahvkPzlNCYochIUmc/gKsjEnsChP6qzUCJ8tMFp+3QEb
	yG1z2ZYdpgSJDXowJTDtt4p0CV+HTv90Vcd3hHQhhhjjxn0K0YeaZBio5X68RBMIqdGcg18dx2e
	ymW/mILNvwCFji5vV4aXqjquew2UwzxnEbhroJCI9aJuh/oP1gE0iSZzq7s+qt5pjylWKSS4R8+
	Vk8J8oV3SJ3i7zcmU95MLB4TFbZsZFQem1Nt2saxfCrhzm4umpmx8tcG1G1u08mz1UoWa4E67+H
	W/qkVcKHn8cMx5g745oSSDiuTvmsrQHJxTCw7z9xO5qHjPqt2juho21y/taBcuadEYiReJgiY2l
	Ns1bDGppJe7J4f7V1V/YxXeDIjtmZbjADAMGzN7JOghHlzqK5INQdes1wXGw==
X-Received: by 2002:a17:90b:5623:b0:373:c536:6fc2 with SMTP id 98e67ed59e1d1-37c2bd5a9b0mr10221623a91.22.1781516435860;
        Mon, 15 Jun 2026 02:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:34 -0700 (PDT)
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
Subject: [PATCH v2 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:19 +0700
Message-ID: <20260615093824.115751-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024036_596648_30E63519 
X-CRM114-Status: GOOD (  11.99  )
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
 sound/soc/fsl/fsl_ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b2e1da1781ae..dc022976c982 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1218,13 +1218,13 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (reg > 0x7f)
 		return;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 write clk_prepare_enable failed: %d\n",
 			ret);
-		goto ret_unlock;
+		return;
 	}
 
 	lreg = reg <<  12;
@@ -1238,9 +1238,6 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	udelay(100);
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
-
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 }
 
 static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
@@ -1252,12 +1249,12 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 	unsigned int lreg;
 	int ret;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 read clk_prepare_enable failed: %d\n", ret);
-		goto ret_unlock;
+		return val;
 	}
 
 	lreg = (reg & 0x7f) <<  12;
@@ -1272,8 +1269,6 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
 
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 	return val;
 }
 
-- 
2.43.0


