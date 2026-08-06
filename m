Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8F3C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYDtAASES468elSTBLIDdmGvVbZC7pKU/2qFW6TvMTI=; b=HJcCBLlZoWid8Gz6+1ZH0WwoDv
	XviGV6AA2h7FA+IJ4tH+AoIH8UgD9VZMs90MVZjNR5ScasdXGE8JhDhmVm5DFJ6cRg2B8fhx0j4Wz
	sFHeMYPz6yU9Z4e4MOR+QUuaKF0eUxMDdFh7g6irU7s/uMps+GxzCOyhzuN0tArshpZdupAMtIO9x
	fuoKHldj5sSbg4J83yUueppuGahMjS+rdFOgpEeuGosNkvqfvpahKsxqOJcCw/Q7vjBQELfGqzVVb
	UUXJEknH6Lvc4icN2XuXVoIxqTAjtazlm0Jsq910eU7HI/I3bp+v8LQJAno+B5/PSVm6093coaPuw
	KcolNqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYs-00000004xKA-2GLt;
	Thu, 06 Aug 2026 05:22:34 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYq-00000004xHG-0n49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:33 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2775173b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993751; x=1786598551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYDtAASES468elSTBLIDdmGvVbZC7pKU/2qFW6TvMTI=;
        b=YZt6gQ10T+eD9QR0gntXDnzLNPK4BX2pnIlJ890bqTe0WVxg2gHX2JYQ6SqvoqArnb
         MW9b7V2QV6WoXfjJAF7SUwe9PwTAXwggRK1Yrt1whQ4VD+O0bkHcBV7/RBAOy5zx5JNT
         0JtPSx/sJrlrBoR40JjmsYLeu7JiOP7Ny3G7LCmAxYaNv6lFXuVK7LtY2T2z8DVvTSYD
         4heJJWQP35FgLCKhfvS0GSdkwXN24BQBAmJs6slNC7s2mvwNV8xOwqCzkzKFiHRUdD1u
         xHxVopUS2OZJg+AoChrY5w2PaZ987XrO9upPqJD4rkyeIa/2gbNsLL/oG+0wdTnD3W2S
         oE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993751; x=1786598551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYDtAASES468elSTBLIDdmGvVbZC7pKU/2qFW6TvMTI=;
        b=q0xLWwPbApAGBgB7e/wzy0i20RMMI8Pb23G7/Lo34FpklH4KD9jvq6h+Taj6ctF3iD
         3FqHkgR1CkPY4vJ0AmVeElClhVMvcoy868v2eJFQ2NYBRT4fRWmHblEzhiTbCYH3dmGv
         dV8K3ChqNlIJM8feUoZg+D5LcPiFYR5Wkx3PgaYwpQSwPnATUDHE4cEazq6RL6ZiJJ3I
         uv8T2fZRG6RffA6Q/Z+XyggqGH8Qu/lDWuaSWzOoyhKuJkg9mffGOClGNByH9Q1CapUi
         th4A8zxHbeGYvFkXwRw3nVpw6ACcGF6g6DD7AuY0Q8Ppst6urVnEwv7YtLG1Kk7D0c0G
         DQSQ==
X-Forwarded-Encrypted: i=1; AHgh+RopMGOmIpVxybB67Rp93BT7/O/hcmSF8HSJD+/KPJwUYWwyFEsIzV9mlNY/W4mN/EhjMWY6++aUMuxVPIjzNk6m@lists.infradead.org
X-Gm-Message-State: AOJu0YwKVduR1Q8Crz8E3Vwhk+R9ngQ5C9ms6AkCMOtTxSu0UPaa14Al
	cOCRVKjiVTpsB5t1n2dM6xTY+0Va44wfUwAP3YnD5/i5zvDdluT5xKGF
X-Gm-Gg: AR+sD12u/amp9MmYHpHii428nEDHNSO3ep+63oYcGBnx9nEjAUfjStQMcTGXhuFa+rP
	oIMeZruY+3O2buVuMv1efFx4/w7vgceNo7YRM/AZBGSQNpcPlpnE+Xapcc/Bzeclhw1CpQil3rT
	aSIBiTbsnIOZGSulMkOBQO0P8Er6irh0zhWuw1gR/+kLW9njZPVdnWdqDjiYhNaTXa22Ta+cAZq
	7H3thWxwu3Tty0LJWsZDaAsBCn6rIKytPR+37QhTUzRU62UcwcJY+8VuDPW//Zn8wbs4XgIkFEL
	cpFD7rP6H1HoamOjHGrz6htZzmDlI49S4wv6i89csmLPZyzG2Jmy4mPkdW4xfQzB/u109Rrl31l
	861pWtIz9FjRaR6AaPiAXjB9pHiXi/oDR71tKmTBlFCHu88AvFpp+/qQ7y+ayshZ26RHk7vkcAL
	WMEzMoLV2vxnUdv6/WUfnjpYaWM4pmU9i4MyvyLswIB8V3yUltOI6Lg2hTRo/wk4Gsl1M3Nt1mQ
	M0jSsYq33tyjLZRNkDyh8kJOdjmb/9+BFm6llJoHVCM3s+DM1egowC9+P2zbo0A3dNCUkPhfQro
	aS8/
X-Received: by 2002:a05:6a00:4650:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-84f2dfd6b8emr12646865b3a.16.1785993751213;
        Wed, 05 Aug 2026 22:22:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/14] ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from devm_pinctrl_get()
Date: Thu,  6 Aug 2026 12:21:27 +0700
Message-ID: <20260806052136.21034-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222232_221718_C77A7F6A 
X-CRM114-Status: GOOD (  13.79  )
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

Return -EPROBE_DEFER from devm_pinctrl_get() instead of ignoring it and
continuing probe. This allows the driver to be reprobed once the
pinctrl provider becomes available.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 354430f916f9..261f36d4c2fd 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -790,7 +790,11 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	i2s->bclk_ratio = 64;
 	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!IS_ERR(i2s->pinctrl)) {
+	if (IS_ERR(i2s->pinctrl)) {
+		if (PTR_ERR(i2s->pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
+	} else {
 		i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
 		if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
 			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
@@ -799,8 +803,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 				return -EINVAL;
 			}
 		}
-	} else {
-		dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
 	}
 
 	i2s_pinctrl_select_bclk_off(i2s);
-- 
2.43.0


