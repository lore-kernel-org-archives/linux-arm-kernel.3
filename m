Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB0FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=; b=Vafe7k5kj2etOx0zA65lIOrH3r
	tadMycSGPWyqiCqh8mN0vJBjaN25gZFp5D+1Qxst6uQKHWQKIJe+05G+2NAb18JHIJGuep/LgHt5Y
	rBX1M8my1LP+73TGXeR1vwbTIEzpibhFfxpTzjc6QiXhbPBD3Vn4hdkNnCIHQ1omXuhANwRzjnUI/
	hK1THo99vq1Xba9jxRxSc9ID5d/gyvpYAdrTQQEbiEvbYUeCbtD2xUmXJFGEvafA9//MP9seRMpNn
	ofKblaOaFetZIXSY6ajJCycpH4QpBvw1aPdi54cdOpb0Xz/05Hn2qqeIBAjeovSTsEIXzZUSyi5mW
	FZkr2Y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznj9-00000008eCZ-2yAe;
	Tue, 10 Mar 2026 03:25:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznj7-00000008eAs-0lki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:25:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae4988e039so60248675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113144; x=1773717944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=VebyXercAqYVTAf4H1PhX60HbGE8UG2DnJDyTBxRAz7efS4Eo2SVVZx7QJSPB6TWcu
         Ek3v8qZoEgvj5ln/r/EiV2WpMD8Sx3CnOyWCyXhn/dgx5lpYzvmn0tqTHMXzDc3sWuZS
         wPNovrcI77e/0FNo231os+9NHTRfRKaxwzOfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113144; x=1773717944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=VeqGoRxkiFNPPlD/mRjmWeAdmXBY5HkM1CVtYRtNS6L690fdzxTa/rEqnda9ylEVZP
         aGP8NFaRdaUbAeB4yPD+sujIe5B+sUUYABoBTIbY213hitPK8WTqis4uz08b896ORIVQ
         nW14N4QVLgHUfSTiCW1HNfV4l61I57OVhBz48Wb44gNI3ygUovN27BfBlonLzXvRpsfF
         3oHK5mqzXl4y8R4Uvus+vEstx4kgmeUpCcSBZHtEy2fnuwGkmzTQM2DKQXZN7Ta/4g9a
         2ZiL4qFl69DLJeKOqSJ2IAz+RnlHrBHdEuuWGx4X5t/nw34Ga5fgaihcA/5fl9cQkih/
         DKjg==
X-Forwarded-Encrypted: i=1; AJvYcCV1nxT4eFickZ2dsDDUF/+VsfEnG7/ThzdXCDBUX5UaC7iykiwIzVXSS9e9edvS1RnQcx+oywSUQO3qzHdB/AyT@lists.infradead.org
X-Gm-Message-State: AOJu0YyqpHGLCkjuHZamsBiukbCrnJznzYBOuX2ue2xbtiKRTvOO166w
	TPDIyo4PmtZEZf0TLct54vS5iYcPe61hwF9yN/lCifyvz2ZmtI6sUHguL082OBwRzQ==
X-Gm-Gg: ATEYQzzsRoqyzHVU3QPMi+1Ybyrnps14GXoPCtCATofIa8ebJzx99kapb1Nx3+puq8H
	UPjQTVty09ZmfhTZ7BuUGreyxdn2a3Vh06LOARQ0SKeXxCF01jbqx5wbM+gmSNWtNj4vCeAIy5U
	XRtza5BP3jm/Sdya5A755M5aTRodomDj2zQWp1EvhXvcUoRqSin4f6ygw1UFxh4TagSdNuip5ao
	ZsEVuLymNQ6n75DOgpgo4GJJ05aKcxrfe+8l3v7IapM4GxTVednru7CoE7uy8YI0e94buJnqGtg
	8Xb5qyTXii9LD4QSmoni4UImIUrb+Nu8DkQmgMjzXR6Fb8gY8GTdJa6dNiYG1aGEIMv+2RVr7Dn
	i0qnHBVV5Gh38e7S5XDwHrxUCL3gXRpQ2N6V+1jJwNw6UpOk8AfucfCyijQRmdMTzoEY2/l2oj8
	t4jP+mkqZCx8mzMU23uFddursF1Puokcd5gOt2903qLpK11N3qYGUj/SBnydodEUz4FDztCo3Gz
	nfuPtf9
X-Received: by 2002:a17:903:2349:b0:2a0:d454:5372 with SMTP id d9443c01a7336-2aea1f2f79emr17542375ad.22.1773113144386;
        Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Tue, 10 Mar 2026 11:25:06 +0800
Message-ID: <20260310032511.2545500-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202545_225295_4F28505A 
X-CRM114-Status: GOOD (  15.40  )
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

If a dedicated DMA device is specified for the DRM device, then the
scatter list size limit should pertain to the DMA device.

Use the dedicated DMA device, if given, to limit the scatter list size.
This only applies to drivers that have called drm_dev_set_dma_dev() and
are using drm_prime_pages_to_sg() either directly or through the SHMEM
helpers. At the time of this writing, the former case only includes the
Rockchip DRM driver, while the latter case includes the gud, udl, and
the tiny appletbdrm and gm12u320 drivers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 51fdb06d3e9f..9b44c78cd77f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -859,7 +859,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
-		max_segment = dma_max_mapping_size(dev->dev);
+		max_segment = dma_max_mapping_size(drm_dev_dma_dev(dev));
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-- 
2.53.0.473.g4a7958ca14-goog


