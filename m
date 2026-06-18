Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3BFCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=; b=GJJGUzY/1CuLtTZiKXpQZMv7wV
	qLhTwn8FD1iT47ma6YclupTOUUBDU6YNq6ncdEYvaWpemUSVGtul+nAm/ypclopslm48h6ob0NEAA
	JZa6uujg2piKKwJtzYMzsEijI1/mcoLsti7bofPA6MsczCs27ez6TNydn/KfgMgfLVDpGgYj5dIsf
	gKnm6RkbDC5Xcw8z5OlKrotLu3+mFMfud4KRdLGx8jq5/b9nY476LoeatwHT0bnSI61ZvEiQX3/q4
	iLkC1AtxSh6AUFGTiPTWgBqfv1JN3Ak/gkg4pvn5fnXruWqwRa8ZeDBAV0lRx5cGEpRvQo/6+zFx9
	yUiRUefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeR-00000001AaM-1tfV;
	Thu, 18 Jun 2026 11:11:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeO-00000001AWy-0myO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6ab886da6so5109045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781071; x=1782385871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=ENNQaRNe+HZSVgM2hNptiufGSlYrxFZcpwJ4Wz0eGY8SW3BVVCVtomlP2/Axisrns2
         t2iTrv5wc8TtufEzPCDzKC+zeBwxHcBWz3XqzKO0rPo/npkgL3tH087FIyFXJwL+4XIC
         H2apNjmXTYya8Bispl7ENoNArazKcn5ftG/18gnBf0RhhkImBPGwcaTnidkGmw2GRwAk
         uGEqck5lhQAx7S+Ipt7Bojt3+815qHlQQGAylzGpTPOuztHeyRrsc9k2hSZytxbDh6CY
         7DRIg/Latq+/YlfMdLMDzt57cYndLExN1amH430AyrCZKbJt9deTi2mewfE+GQuNdApd
         1TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781071; x=1782385871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=Xsy5QuIk6wghTcTANQuO0Zbjl7Xr/3X2TbfauVS0eJOdAxsWk/QNyFnsbmpXcZjArr
         VBr1MTY2cm+PX5JWCUHHxneDZVQ+JoeVJAX53SHel29WB//E0yYVcJ4XAlVfISpgjxqz
         5r/qrkwAQZzuER7cO3idBaACOgiYjJLH71bR5EfeyXHzaa9VZkkBLjlj54COxM/Xplo/
         bMQGdetHYscWo/+g4Me4hwnqH5RYF8/Q3iIHCl1B5zCym6hrZ1togEbBmrfaE1Huafpz
         LGydkQXvP/1qIFyUhJaPOzE4O2R58rqTiVB64Hk2GxxyCfcdJUVDgrVAuaoU+2fzucuF
         +WHw==
X-Forwarded-Encrypted: i=1; AFNElJ8weCRhRymjXjEsaQjwj1Q3IbB4JXyvoqWPL5bhZW3hOpH17XIObSj9B8Ukfk7QMv1i1xXmtFPwvUT2D2Zi4Mrj@lists.infradead.org
X-Gm-Message-State: AOJu0YxniMPFPlIrBjKApGgUC6Gr5nzx2e9vu5xHjizijf1CwGmWjzWa
	C3FKXfyDk4STKGxZvXjUp+S5mh87UNOFAcpeiCPtBzCU1BYr7q3o203i
X-Gm-Gg: AfdE7ckr+EqioHUPdaY8zKzgvq0coL8aeLXHaxUkJXHZ4mWwifjkPDsC6p3FcqGW6r7
	ZMoRLTyCzvrV9i48/33iQkVRLDS3qJ4skvE5nzxvMqfI8hG8lCAW62tvAF6B1L7LlDBCE6Zk/pS
	FsbMwDTCu5gYCztOynCq4t7UdCTrhh93aCNtl2NgxiH2lU4sUoC6ENeI5VsfwXy3Spj9/8ihs5O
	JFJuxdzUJnJ0xEYUSP0yVFpnBEcuFNnAb4BioLGjy9QduIzCbBowi8Ornn/xsxoGny3CgbSNN+1
	hEppmd4NJGS5BLJ3U7gthgLPt1p0VMhaYQD9A7DPHMVijLORE0UyGGmqvuORSVw2TRwfsUMwVn9
	k29xzhGPmbQfv84YXVNNNZ3tM+xw4vhVUUm7zA1pmkeR9ZotfjdT1jpLpiOGGaAzLdMjX7n4dJN
	jFZTK9GHfZM2vWqs5feKGyPFPYyX9HMyTb7pHipOMa1BQrwp4=
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr84967955ad.8.1781781071349;
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
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
Subject: [PATCH 73/78] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:22 +0700
Message-ID: <20260618110827.232983-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041112_274091_C2CC36C0 
X-CRM114-Status: GOOD (  11.29  )
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
 sound/soc/codecs/wm8958-dsp2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..b6e5f1beb2b4 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -864,9 +864,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +875,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +886,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0


