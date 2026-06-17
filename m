Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14341CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=; b=dDGgIFk0jVTb+cMOQeYYTmk8/i
	v95zAJmKPxiSaI9uCje0JnWSEtiBUOuR/VfkoaOWzUHAo0cM15zrxrlXkIM3hsvHAzQVZQ3oD12ER
	Y49JQviM8v8Ui72fX9Mi8Thj/mx4ZWKTilTdfOsQlGzm32aCt+uhLAr1kaj0IjINc9ql3yMu3q8eW
	d+nVs+FV96fLxVUBTQZM3RDOtNGzJdWR+BiRbxoUYNZQ9hEVnE2XoityIlLS1b+cmijb9nqhsZlYn
	qco6h2TPit6UAaIRFsY/6ZWWGZF3sKkN5hhYlw+X7478h5faCwsW/AJTEBao8sC+IVLweCtXxRE8K
	/lw+TzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndM-0000000H6Gv-2ZpO;
	Wed, 17 Jun 2026 10:36:36 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZndJ-0000000H6DH-0oCL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:36:34 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-137335bc3caso6885368c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692592; x=1782297392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=Gvqd2aHvJF45YyA+/TFhFSuPzSrgK+KySUr5bE1fjN3Ts4kf1et/e07ji8CiGQUyzW
         3CbpCDvIC6xPm+l6GRUnszE/7USHCbscS0e99HWGs1dKUTHzfRI380H52YI+6fbvDxgU
         wYNXemXeVTEsgpybtFdIH7RzRq6iw6nRlI0nYqlCet2cTRttoqb0RM8OcnZ2SwHVx7Ng
         JlZ8mSDnKszv2oxRDJhN84S/sbnx/1e7IXJC5IlIs5iCwyeRWU3cYKTTWqvsmI3gUeEJ
         7mtJJ4QJpj01HQaPF1dnwJ0+QB/QH+0c7+iYdEJlHAWDL/Gjv6sYyDag8uOT+Hlpwd41
         rgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692592; x=1782297392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=EhhDrI+La1RX9NvDxlt6iGGsz2RFXXaIP0m7VqeIdCsQSYSL2Cmp0K1wHWv8tE4OaM
         KXdisVvARBODP2LDmi+J5+7C6xvNYAO6sa402mmf5ipzafgtoJP6bbw1uswV3oRVBpeI
         mnjudcl/UKtnyqLgNzxfsZT0NepPVIJ3aH58DYlbn4BWVRle76/6DsG4iVPltKvOeKFM
         uJgkEoUN97tewND9e6BAfUiEPo9ygsROvRsx3BaHe/r0Vt6T8FYy5sQJnEae1oyAuDjM
         Jb4WKZZIZDz8j0MCzy8UMgw6cCHZ38S4u9aqJJVa/j8AXPrYKacLMVnj7jKTSVsUJ3DN
         4BXg==
X-Forwarded-Encrypted: i=1; AFNElJ+lDkMM66590yRdqjOXtHfkBlxGxoaLjkmqsXUvTtwLRN+Ngp30jzhnmN1WPb2QrT8nqxfhkS3bYUDiz+3KfkjK@lists.infradead.org
X-Gm-Message-State: AOJu0YzvsgnCK6Scw3+y6EVmHmses0hRK1/LOEPz0J2XAlgi5i745qNT
	jupcnF1gPAqpeFXqKpgiCy6tR/2NzLD/2hCzHjp3q7Qj9iALQ/o8LA/0
X-Gm-Gg: Acq92OH91TzM4J+eiW5Bw2zXD2RFNRur+3fQojZjomCEUWW51NwA548Xt1uUZKHQkoH
	NwtNYm/tyf+rr6r73jqZKHDXxJn5Janu6Rg5XUfE9l7lu3DpOUCzsoyIilgvZK/Y3BvjGjwcb2i
	KRY05P1sxn2u8W7d1LuudAyKYDvR8SY29aXLgufSygDch/pYr1pfjUNeGdTMXDN8MwaUpub34ly
	XaKf6+q8BIAK2IdPlBJdS9hgPfYdOEbflt1CC6+8c8YycNzO8nvjI3JZckNkZQtM/YWsUOQhcPZ
	RgXNc7qbk5/gsLMRqakWLdYqB3FUFA/5PDVHkLXLS4VojXywjdnwQRlDJvRurcK4EgptNRfJLCF
	IpCpRWny2MBvOiViNPBPPcKkSd2rBSFirITYPxLh+q943hNMG4x0iVok7MeahJDrv/jrFv6r8Ky
	Cqb8uy66ECeKfuwD0fB+kjqJOQWRI0TDAbdVaFX1+zzyvFctk=
X-Received: by 2002:a05:7022:fd08:b0:137:f532:e360 with SMTP id a92af1059eb24-1398f62354dmr1205523c88.3.1781692592243;
        Wed, 17 Jun 2026 03:36:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:31 -0700 (PDT)
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
Subject: [PATCH 23/78] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:40 +0700
Message-ID: <20260617103235.449609-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033633_239163_2ED12CE7 
X-CRM114-Status: GOOD (  12.77  )
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
 sound/soc/codecs/cs48l32.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..d45e339f76a7 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -236,15 +236,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2240,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2281,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0


