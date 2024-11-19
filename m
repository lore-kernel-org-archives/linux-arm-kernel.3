Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C907CD44153
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eExk5QIO/436rpcZuzOCrQYoIdZ68JYFAqYnMMc9VUQ=; b=1ATc0MkLkNXFgbXFjnvEFvYPIX
	4IV+adnpfAt+jDvoYTbhkisGWADBRvojO0Z2NMS+RGRIgGNV+KGZjGf4QC+PGxGrQVozd53sqtMvj
	KPJ0j74CUba2VVn1m+7wMPb8ve6sbUwwJhC5Wm91xyarpwHEscDMkNvzfg0tMZZGH4UtBsUMNx5KL
	KizwX4+QSknSpoGpClSx7DmqpO8ffQ2WV+p/qxwACIlueikNm6KwxO7FCW/fXBmzEZqMHSFbnseWL
	j6TQjUk8dbUcM2G52e4FOq3bdJVgFCnUnQhSs/86U/0iXuAiqwvBxf/wqubczRnaW/9TIi3WYocfO
	kB6Zdjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNYq-0000000COhI-3FyC;
	Tue, 19 Nov 2024 12:42:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNXl-0000000COXj-32Lk;
	Tue, 19 Nov 2024 12:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732020078;
	bh=cPzqU9OqmO7u8YLVierk+4DHkUIpDJShKogyzpU9sr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mdH2S+g9iIIUkwu6OK9t+P634eEtcTQhCLBRCd7DJ99o+FskSqjtk4SX+Zs6Ut0OT
	 67iPCFaxYUm+RX1DVCFGNhd1V3IAszwkm2jr68z06mTU7vYh5pVneieDjI5UpV9mZS
	 SfHIOVpCGCjLkuzOA35zzLcqisX2oOdyg0KNXavPyuh+DCf96343SovzFzxEZRq336
	 z8wZHzFYlMNi2L0tq99t0XAK8v0Nqo044pOxyvBzG+uDkh2OxalxW1bAkwJgGpFgbh
	 jvgE7HOTRye0az+pgV3rCOtmvGQpRdZdoCT9vlA3VwQSGuUHr9Gk7zpBKpBfA4YbV2
	 HEHme4PqsCZMg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E90117E365E;
	Tue, 19 Nov 2024 13:41:17 +0100 (CET)
Message-ID: <0dc25339-8806-4a59-8350-75eea5e826ab@collabora.com>
Date: Tue, 19 Nov 2024 13:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_044121_959011_209B1D01 
X-CRM114-Status: GOOD (  10.15  )
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

Il 19/11/24 09:16, Uwe Kleine-König ha scritto:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/mailbox to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Make a few indentions consistent while touching these struct
> initializers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



