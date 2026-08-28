Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDD7C61DD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=; b=ntycomsNPYDhh1lDfD3ve99WyS
	ffv6cHKKf9gofeXNxgxkJ+oL+uBxj1LAHoLm8QrNlOFttr7UnsSXDFwRcYE1lmQLNNTr/XMueAnnQ
	+DSkvNm0dooNc/AMKe6LLb8zHATC7dvVI2sqYhufjv/6BCKtdpL7tIJM2G0yXfWbhNt6HMjH2WJxG
	XhgNz8yQtey/6vBB3ucPpmKyq6Y7Rf5bJIP0w1P+6ZdbTZKSZa0PI8SpANQkJ449nPkpUboOGLItK
	I22b8wOFuE6fWg3nNJ/qXU+GxJrh/0t6BM/5RkEjhOq755ov0lT1br/gnEsGsp/i8k7cgZGdm36mY
	pVxw1cvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshW-00000005Qnz-3Rbc;
	Fri, 28 Aug 2026 09:16:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshI-00000005Qd5-3vIr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e27035206so700324b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908588; x=1788513388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=T0uizyD096MoUTECHI+78tLGlq83/0tw4gWPcpB6waQYtce9Q2tUqGPh+IXu8hw37j
         IGq+sF3FuKVnVKZ2BFxeGcN1RuGzAatKBE/egVlD38ELORg3+5VS/jrqGi2pPmpKEg53
         Us0E2IrRcljrP6E0hlSo7QXYPfMnrEnCQ0JNbvtLm1alOJOdqKh8Il3aiWHpqUhFzPFC
         IHy0SqpwDKGOqerssk2zHPPykLnFR0PV7wWjyAv/lTbEzBzGGQZ39u3AU85SKm1Iv2fZ
         wTtCJWR3MAKBdVEwOPWi8gXKDAkXM2PR7Ql2D5inbg6iJBMaJuTSCOpCO5P1uPeT0yUd
         lXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908588; x=1788513388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=KY7inj1a3I/wnby27nGXPjg3GzDMWre145Mpeo/v+xHBS1k/jHsJgZx8++TanFWAql
         lXV2Cd2zIGAL3n5aDsq7OkchERdN8GZNQ8WRfR9CP9n565K3QoYByCYD7w9ZMKQ9LU2Z
         tNEGPrHxf5uHUFoCPFmGUawRpsNK7eWoBvDXPupDusgk+a0ApojrHjzOtp3PtmLmc157
         CGrSMYD07lqDTPpjK3HhC6P6Vya+gZQ3wbLzl5xwQltD047gv4Cx5dkUszmzCpsq5KTw
         Syxz39CrHlomq5VcS/pZ2+baByclOYELnEAj45k8dyiqLU3Ql3720nUKKFBLzSm859Mx
         0B1A==
X-Forwarded-Encrypted: i=1; AHgh+RqlynFFHLgnIACzGJ1CDNZqkVx04wVjp+z6Jjjl/1onYAoAcIDUT5YY0Pq33KpfoNnPxxViwWzoysVgwC9eczME@lists.infradead.org
X-Gm-Message-State: AFuF++l1P6hMNXDBFbS76cpkKlS1j36sqOxob7vJZUC+OTsW7pEFfaUo
	mVMRN3tTgLflX69MwsRUG7tYyZg+2i4vZTKvfOm+cqy/qvmFXZ4AMFjI
X-Gm-Gg: AR+sD10AePy2m+ZFQ18voX1ZjidvjN27GkkE0g67L0F24wsRO5IzQlboGgBpuOIBChC
	QOMa2X7kIQwtaV5MhtTb6CbG3gPGeAWYpFtNGAo0i6+13YvHgc0/t/9NvtU/5yVBfy+qLSjaPd3
	LHx1en+Ujc0fH2YKvdnft77PAaFsCQaau/YeEFcYdBOL8wzVDoYXhC1LwJmidTR8HcU1gqWL8O4
	xRaejEW81R0m6UBD8YCP4OE8esMy0VIu1y/7xeU3dzB8dOZE9gUrm87ezNk6+uwoFy3crMG/xA3
	6PR02mIIGyKq6s954IWxvSA/EoNwH1nIETOiuTLvvz0LneOpbo1/1sJbRhO9MO0clROYZanZjBz
	5A5byGcAx7NKCh77ppJQRJ1t0ioe3yWAUgY+pOweIpCjAybmAhrfZTYCKCbfCy929Yw2IFCbzOO
	ws3F84D8rutwWgDLWkPf9Aj8NbSVrdh9J8giFqTWuarscqgvDI5lIXwpeZnNKlm8kY9lsmL03ae
	XJDAMN3RjB0CjJTLnEu54IEDJobK+Jbi9Nz+ByhZTj0cXFNaXgU5HLNWotwSDW4KFrYI8+9fIeK
	goip
X-Received: by 2002:a05:6a00:4c0f:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-856252523ebmr12427267b3a.0.1787908588234;
        Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Fri, 28 Aug 2026 16:15:31 +0700
Message-ID: <20260828091532.600047-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021628_988454_48045485 
X-CRM114-Status: GOOD (  11.98  )
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

Check the return value of regcache_sync() and restore cache-only mode
if synchronization fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..143386c54dd7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2743,7 +2743,11 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		return ret;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
-- 
2.43.0


