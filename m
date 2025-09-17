Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3fU+OW1aHvFOhKqWGc4QBtk4YHBAS6m3X0BGR7nsbs=; b=2Ie9S2eUtUH32V2ZxW8Ny5Qqth
	UgR6MvJCVI4z9cr9oXThr7VITSfllKZOFJkWjVnUYgdMwNWg6GNFHgEX2WqTtj4tF8AXTX/+JH3Qy
	HTk3fznYU2okdm9GRg7nPzWw0T4GcjiNv2NmqbIV4Mg3XNmqti+omx3p4vIwRAGE+TAHd/l604wHh
	d/VBVx5XjDPpi729cMu1wPwfdZFSNbxGn7vJJP0t0ge+OxwvHolHaedWXBdqI9/RaZKCQsCVuUQJ7
	zksUrhCPG4YKTjAGHL6u+c7xEJWWqwB5a1UHOImRXus2WxGEsBSS+vpmYGZEi4fuXTD7ayY2/bLII
	gSFy2O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrCv-0000000BJQ4-1LcA;
	Wed, 17 Sep 2025 12:24:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrCr-0000000BJKm-0BWh;
	Wed, 17 Sep 2025 12:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758111842; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q68E3Z19CmGATN2uXRmC/UWrwhm3IQhTTkcYcFlWhU3jeeY+MXiI1/D6MCOGNIQJOMe59TmfLyH5obGGMXtOOgRaeGz79SBAiHu5joWYvB1d4h/9Abr/HTrQA2Zv75/IfE/PN4BQgvUoZ7XAtk8s6NvpaN7FwBamnfoBYRCicXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758111842; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B3fU+OW1aHvFOhKqWGc4QBtk4YHBAS6m3X0BGR7nsbs=; 
	b=cBCmp/5y3FwpTboHp4WHkTa10Jlrh9Wr8xRPR9MYmdbyEND779kTlW8KIvam+x4hDnOIyieuzofaMydG/5lS2hItnKb0RmPfaU8Oq07qoAExgvy7BRexJSHHeiqsTq+P6qf5J8Bq6vwLd1EGRuwEJHU/zXs8Yj5bgbz8USdRmAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111842;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=B3fU+OW1aHvFOhKqWGc4QBtk4YHBAS6m3X0BGR7nsbs=;
	b=WyKfIQWiUq9iiu9lK+TVXojrP2088W+GOrFWjeKvC+UlQ5u5uvKUcXP5yHm5E1ph
	8WfokkFKjgTFX3MhBYYjhyr4ulg3UlJ8grlmcqB60X1lakXt+fsySKpHA5O1fgqrtv5
	gW5QUByC/uvyi0TvN7B17Nzh6YTLM1TMX5P3ST5A=
Received: by mx.zohomail.com with SMTPS id 1758111840208937.3337263629903;
	Wed, 17 Sep 2025 05:24:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:40 +0200
Subject: [PATCH v3 09/10] drm/panthor: add no_clocks soc_data member for
 MT8196
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-9-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_052417_125125_D326E62C 
X-CRM114-Status: GOOD (  16.77  )
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

While panthor does not try to do anything untoward with the core clock
outside of increasing its enable/disable count, the spirit of using DT
to describe hardware, not what drivers need, informs us that on the
MT8196, panthor should work without one, as the true owner of the clocks
in this case is the performance-domain.

Add a boolean to the soc_data struct that tells panthor whether on any
given SoC, it can leave even the core clock NULL. Set it to true for the
MT8196 soc_data instance.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 3 +++
 drivers/gpu/drm/panthor/panthor_device.h | 3 +++
 drivers/gpu/drm/panthor/panthor_drv.c    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index c7033d82cef55c940adc8434231cac6c5a20c288..581901a8e64fdb0946f20af593489fefde1cc05f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -43,6 +43,9 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 
 static int panthor_clk_init(struct panthor_device *ptdev)
 {
+	if (ptdev->soc_data && ptdev->soc_data->no_clocks)
+		return 0;
+
 	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
 	if (IS_ERR(ptdev->clks.core))
 		return dev_err_probe(ptdev->base.dev,
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f32c1868bf6d782d99df9dbd0babcea049c917e0..cc8485afdaf865edc89a36823ba75c588a040e0b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -40,6 +40,9 @@ struct panthor_soc_data {
 
 	/** @asn_hash: ASN_HASH values when asn_hash_enable is true. */
 	u32 asn_hash[3];
+
+	/** @no_clocks: True if clock control is external, not by panthor. */
+	bool no_clocks;
 };
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4d59d94c353c3ca76f4b98a411c8f8284efafd08..3583ec955a85fe6e383839ec2bde017e1c6a995c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1687,6 +1687,7 @@ ATTRIBUTE_GROUPS(panthor);
 static const struct panthor_soc_data soc_data_mediatek_mt8196 = {
 	.asn_hash_enable = true,
 	.asn_hash = { 0xb, 0xe, 0x0, },
+	.no_clocks = true,
 };
 
 static const struct of_device_id dt_match[] = {

-- 
2.51.0


