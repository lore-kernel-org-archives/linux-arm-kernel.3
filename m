Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F7CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPHRLle9I7Nd/qZunsQNy1JsrfMY8rVkIYFRWvNrhY8=; b=vwPdek5xourWFFvQ8NIPwVVs7y
	liaviSWGXd1g6EOYGWtnElc1hc0n1s7icsm1PvPZTTWkM3T/iWMzfkrPdp09xDOY+MwoLdZvCrWIr
	t+dy2lftNU7pTghevHkzK0SdfDE4BfqyQLj192Qfr69zVq/uTjzJPqCWZt/zylWNA2YEQjZLsawvH
	AmZnwCD4L7lzBQ3FWP+yXT9EO/hsQ762+bi5Ex28uxtHw5Ft3n5BrTEjgMHhPizJBx2Z65Ud378qu
	ELYea4yboa5LfDLgZm6L1mpDMQ+a1old4Qu06jsLgZL48OXbhOYgMF9rf7f0LJZgZJ5x0rqmqVycE
	ezXMoYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMBB-0000000Ckef-3Gbh;
	Tue, 02 Jun 2026 10:17:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMB8-0000000Ckao-2U9K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:17:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf02708e8fso38063485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395418; x=1781000218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPHRLle9I7Nd/qZunsQNy1JsrfMY8rVkIYFRWvNrhY8=;
        b=NEBkZkjEKvAJgcI3OgF1imMtqHvSWSRtSQpcPa/cqSthpJhdkey9lKDma1agYCW+fd
         JBratAntAyOvOc28SFYN183Xd+YeCQTKzsDzSrRU07InRuEq+k34rW9SWWXtFZ0gKj9X
         D9FaZx/7E4UcST+vcwKuaxFeDKt1sH8xOyeK/RVK0kVzv2Q0hUUfmiaxeJj5cN27oQhz
         k8w10yWZHsQOq89/vURHPPDljq38XqX11JNa9wPwsM+57craN9a/HIJ/AJzQX0M/47GI
         iDDVlJssjVyduolsAiFZpHIRRTsiLC0j4rYzowCNwAG4fuEW5T/USLBPbl7K1pkYv7ap
         DAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395418; x=1781000218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GPHRLle9I7Nd/qZunsQNy1JsrfMY8rVkIYFRWvNrhY8=;
        b=I9E7sA098tmBDiWSI2F4cTQcYfhF8vjRQpQLNK+wliTv3kn8/8VRFdq+Zkq2JsZWqa
         JiHPcUuQQntG3pkQSjLX7BJjqPyeRyAe3H35WD6eRJHOLfwCE7oWMQvjUo55Hf6m6qeD
         +m/iR4F2rcvjNeTfgL0tUwz+NV7/3B03koB7mplB9Y7bA98PcmzEPeJ7Sln8vjbPBrQh
         nTWOU0BBN5TyBQj4wLJQpymyArSkstTybI69+SnAt4tBIW2hZb9/0ujauQ+ugU4ej1oJ
         ByqTer7dJsQkIV0HLqg7mYHMIzNVNsk5egg0zwe/G/oxI/BMmF34DcPt5y1a9j84qn1+
         axUw==
X-Forwarded-Encrypted: i=1; AFNElJ9OuHhsH0xODAa5GHZ8zRaUJJHfw7Tl6JEjTy6qiWHXdWwLQHJabDBWByH6Rn+4xqeg4QnZ5gsU2UeaJvZ8nO5d@lists.infradead.org
X-Gm-Message-State: AOJu0YxlVAWuLPe3ZVaArbomjEcsbqlm5rI6KIh5i4UwTc6NJvt8ZGCR
	INI6mbWKjbjzHUL4urRlQiL6QHQmovORyudtjgaKQble6sAest/PwKmF
X-Gm-Gg: Acq92OGmuzOHsN0F4aYUHG8ef8zLO96lTexgc2qy5IMSHpLsbTJwaMI2e33GqyxAjGT
	0vI8dxZEtl5Nn9y/5+neQsk0RXaXzrMe0gET8+sw9FJePsgaj+O4r9e4lFHiTaMpGKGExFVrUs4
	/Rn3XY1xAYUjJidN8GMp8ClG85xmYaXjPld8jTI/YiBFmipnajvp+4FcM5nsS0k9kh/Qs/9NRAF
	ZdeRdYpaynhAGGvcPMndhwQwj+z8QQZX6HiSuL8SbhZPKu8/RrmgIPmqrbSs+AfLIhmFbwQ+cSE
	pMu+7pDh9llsIsFETKarlUzGGtZwAT5OZDidZE+S+qrUJbNzKKC+AkRgxJzXOP2JTFScmKozUtv
	4Nf339OdCqHLzZGKUHpPL2vVaeD4z0AfNvTree5WpuOWEE6wfu+KWJ32lVXSoo7he9aLZXQNT9J
	8pj/hhYRpIBfcT4HMvn8rkJY+ZR5sFUkqLznugzBZGTetOZNpNP/X+yXd21r/w+I9zPmNL
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr173447395ad.32.1780395417737;
        Tue, 02 Jun 2026 03:16:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v2 4/5] ASoC: rockchip: spdif: Restore regcache cache-only mode on sync failure
Date: Tue,  2 Jun 2026 17:16:07 +0700
Message-ID: <20260602101608.45137-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031658_668807_2FA75540 
X-CRM114-Status: GOOD (  12.59  )
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

If regcache_sync() fails during runtime resume, the driver disables the
clocks and returns an error. However, the regmap cache-only mode is left
disabled.
Restore cache-only mode in the error path so subsequent register accesses
continue to use the cache while the device is inactive.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260522103713.6C09D1F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.

 sound/soc/rockchip/rockchip_spdif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 8de5b76cfe79..7f15bc7f8f35 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -94,6 +94,7 @@ static int rk_spdif_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(spdif->regmap);
 	if (ret) {
+		regcache_cache_only(spdif->regmap, true);
 		clk_disable_unprepare(spdif->mclk);
 		clk_disable_unprepare(spdif->hclk);
 	}
-- 
2.43.0


