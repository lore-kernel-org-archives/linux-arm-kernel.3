Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EE5CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=; b=ypJJCZRsheeD3RyNeEoBuAuE4n
	bXM+MuPrXtkqJy6itpDC9VkcDOvbUBhLTGAwJddH4Nb1aZ0+hzzAqutEbZnm0o/BaD8cP4u8V5GoM
	kWciKtiIgcbtqtsp4x+PSXLAtRhbZ37lJdaECysWTOPUphM/mvIKni+bIa2ayaTdX24QdPtUYJqVv
	klmoPuEtGfL3aZerAD+nGczNxOraUmQzyDMuC7xCOYODgFFS6da8i146S7ycVqpWIy4GrLLb/gHyB
	FWE/0e5Dwi+H6dSfZZ+ztSmoKSWUoZm5aXcmaoKIzILpfcpdrzc3agscrHcW9CAVHN7gKqy0dhp/w
	Ov4Jm1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbi-0000000H4q0-0U6n;
	Wed, 17 Jun 2026 10:34:54 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbf-0000000H4nW-1YX8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:52 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1622999eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692491; x=1782297291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=k3L4SzvCE9fv/ZLZ5ZRh6nEdkBtQEFg/bxbvyM7pEb716R2Saos2Kdvxnr7hpVRD9r
         6zgGUSMDktdmHrumOQg23hAKLwPvPFwWTw4KIiVFjNv32sr8qYNcbZp4hhSGuBNuULiq
         RR155uuKty+IKkhWZzzDZCVUrT0gpOwQ7lTV9+rhbhxhcbn7na6TkZIuweY2zqtLZupw
         lpIjU4VNs42A3/NtfAq6WCrpGiLd/FHegbgQ4amCxS33rnGF35ZFZS3NFyXAdckYrJA2
         jWIsgoAUE0hcknNTESVjM8E7UIH+kjYEv8TaM/KZqMtyPIV45ALpKXP7AoSWeMSDUukE
         QZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692491; x=1782297291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=XSbtCQutuSMXscORAljGVDE8Rk+88zO2XnT0/xW+oxsKzEhmx2UFF7qhysbTTW95DW
         P70/0FLST5OHeMJWs7QVw4ZqzvLbXMkqi9lbhuahqT+fZp+Bx4SpNmuWa5AcXcqFtWYM
         MujITLKQ49QK9XhpAwvh0MOudb+d4CeG2gp1Pl7aPS5n6Wc61dWHrfAzYGs8PrO5Slwb
         aj02eRRr34dtTTytxeryXmupd1iimW96LN5gt4mmLI7/OcncDrPXiNmtDTijkt9BOI0Z
         bQ4z5hU5ATbyn8UmTO5sstCNYu4PKImNpwaKzDL38ti6U5tKUegTZheatga7ySBtWZbp
         nJBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9QFyVEk282fRMYAiRkwUxcsT7mdx8blt2UxaONN4nKW3ldAC5yeYB/jy+gtDvWtVnuG1Vg5yr4ZJyro9dt12T@lists.infradead.org
X-Gm-Message-State: AOJu0YwOhwrBXeP1niiPll0SZcu67ZcETX1/APC+cpYFRhVZMIPZdkLC
	FLNniZY9Gp+00pYgnuf0Nv1bYok99ZLfRtMNpogVqGFRjdWw8Qysn6Xr
X-Gm-Gg: AfdE7cnVvK4S2eb5zYU3vbUAc7fwzjv/a9P/T699oH8NTPHoKrKDC5xf5dQWjKNzJMu
	YsOTW9zb5G7PGABtO/5FsLMTsR7xLUv7ie6D+pzAOpOrmFhxa2n1nr9s9J1qm/dQzapBn3ajbAP
	NVSbBvhBTjlHTxRUWdK183LqrjMNqRF4oGCijW1wC02+rScsP+Z41E/eMQxN+v2cSSlzixyQ7P3
	YANATJmG4daSLPV7mBrek36w8S6l3NNF3JU2oPJcE72gOT0apPl0OEDPFO092Qwo8ZsDZuYyLuG
	3prRpPFoleJF9nYpP+Z7krv34lAk7sdJWMW4CjBTOOvS8E5vnmVcVotPIfQhP5tAv/c82xG/Xcs
	KX/QUQv5T+1wPUz9jjBeK4DENa1wmd4I4AgGBCCmNkA3gg9/XrKnXQKf7D1mxiLKfhlcsB3Ozss
	+v4smKOI3Mq5pIXLh/fyCq3DiFpv/TBJiWxbLktCHLgCoB7bs=
X-Received: by 2002:a05:7300:230a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bca0e33bfmr2065004eec.34.1781692490637;
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/78] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:29 +0700
Message-ID: <20260617103235.449609-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033451_412681_1CD2845F 
X-CRM114-Status: GOOD (  10.99  )
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
 sound/soc/codecs/cs-amp-lib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..36da474f4370 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -83,10 +83,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0


