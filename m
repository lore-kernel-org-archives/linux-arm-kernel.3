Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6DCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=; b=uVacPj0IcFdHI+IZU4OCU0hj84
	jGfoeRdlvYUy/fRypDPclUvSibPDodlWXrC9y4G70EFzNmqZABaHwlKw+EIavDXswa3Y1CV9l+QZw
	z16YSAvqRIsSQwZE8fbDkshkO2wAAzj8m5gNty0XPBL0Y78gcG2Xkc2q31kSb9nF/c2Cskyxga4lG
	QKId+renZuE9gtiyBNjjvngaEFo2KrzJzEau6f7vBWdH4BEGWzoTO5QN3QKRfeT8Ivg3BIH7JhR6y
	Wi3smTG4XcB3+up2gAHk6DCycKRo+eBZbY0ZMiNy40y/ZnmGRIHyR4t7oTw/0gN6EbQq+KSgxBfXg
	1EOlp7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1v3-0000000AyEm-2duX;
	Fri, 12 Jun 2026 13:27:33 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1v1-0000000AyDP-2f1k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:32 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-137eb0d76beso1410161c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270851; x=1781875651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=mn5epMuAI6vSjBrRxn7UGizYnPFcD6ChIxX7oA3cZxE6Ym3P5Fxpt0/RUh74X1X31H
         AJA1KYzQH9+uOojzOr2LQ9gLHf/XKUFyhtQLpP3kYJje6Ad5f8ciFrtC6CLeGnLcDztf
         u7Z/1TNVgOQtsUlI5YX1rCqg2bQiUV/pmcxbovukR6Uf7bfFCNUS9TsLBFVLdNBZsUEK
         WyD54iMMQgjmYvj/y2XyM+0Unf5G9AiYrecBlAAWDsylZPoXCh6hiWE58zAssqtnJV8z
         4tAnnzYUZoBpb94CegQ3fKQE1S5dXrBwTxmin2TV69iq2Nt8FUaDk7PR9Oult/a5PEWH
         Zmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270851; x=1781875651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=sCZBaYmBssVcA/lG+KJdZkUaD3lCbMLFF9dzfB5srKhGkE0NPwO8v97dN4kI+7n7eb
         HzCr0m5G3i+6XEmtTRlp1bZQGsGS0+3IpjzSBRCrlsxJQ7RH8hpTMErqYlaKQ5dfnqZa
         yYfvSd1QlZ0QnHDdDGRhcorFlxW7XRsH3kpK3isTq359F8EhdOcBuQfxIc7/tWHtoTsL
         sAKOjizzj5uKdxsewtqfc2HkPEX9OOb1QfMVbYH+R4FDnefGPF4ksVIdE6J+LvmVtXhk
         sySVDKcmyprSrDJ9g4Gqa74iCPTJSNsmCpQFopSibzfNfNM2lR9EXiftteta6pzlOCCa
         B0NA==
X-Forwarded-Encrypted: i=1; AFNElJ90xnF7V+lBORd2dowv/Kk4p0eBcd2nq+FkuCYYjaidio+z+1J++GPN+qCC2GQlDA9BQKs301/pgYuF0894uHUn@lists.infradead.org
X-Gm-Message-State: AOJu0YydzEI0a348M3LgrO9LdDXV1NvUJJO3h6w5BcJgmR/86g6a95rw
	ludoXOVemFB9HyNK2QTZyDLlpYwlBTi7a5P3Fb0JD3U4YjdsVg6anLC8
X-Gm-Gg: Acq92OGJ3m4/2sl0J5qptkMUNhrzoulP95HbkqmLN0AhtPIv/DnVxIkcf3D7Bx4wokH
	0BT7fEvcnlydxveVVL+TGbXVjdkee6INnZwkwyutRRSd+HZe0a466fni6XpAGxrfsa10VZw2B10
	hVxcierV5XiDQJZ5loc5RH1KTn2sE5draOGMB3B8l2xFbRL/INNpL3mfGpuSz2d/vro8DZ7jmjV
	js0UAmyzAfi4iPjzNZVcdOhT3vf39BaM07V2vtXBZtoAsAuBkIal2PYT/hl/S7VMih52O3rdwPe
	N8edA43aOgC34G0L4BqJQCYHYnqc1raWCnNIhFfoZIMgNsyfSlh2rY5CSriuX4J1ZFSH2k20Vmj
	NL2ShWc+03vUFizPz2BAHzc8H1TpgGWkU91xiEmP/oRdtFCW4btiBRUVewgSwwC7MNvMWaPcF/7
	PYCIezt+uy6RfJttUjhGy8G/GdmJFeJo5XxP3se1xx6zNhvsM31kDRdCKfhQ==
X-Received: by 2002:a05:7301:9f09:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30820c2d782mr1373677eec.6.1781270850611;
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:30 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:34 +0700
Message-ID: <20260612132639.78086-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062731_675377_13DED9A0 
X-CRM114-Status: GOOD (  11.56  )
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


