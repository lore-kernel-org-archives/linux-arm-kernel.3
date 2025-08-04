Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B32C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96GM457l/d/bHxJQEkE/zozx8y9NLt+R/nqgYYzYfvg=; b=rgo7AGHJtxbWMBHPmefyz1FmyQ
	BAfXxz8HNchIndPLOBhqESDIS1IlJnStUnlsxYyUhz5vmjcWDofnojclR6vxJnNfCi1iGG44h7rUq
	acJsnO+T0Ukal4XMeyt1BdVe99oCVuCdGLsDLp/krrO5y/DMc7W4uQVzM1naFXMMCS5LKqERdhq1p
	/UE2pNZ/Sh4+roZAQfd3ESplO8Cx+D7iHOwKk5oV2rxJgcznLR84KSYELz5/VHvDRw4HemAtOEzAB
	dj7iObV7L6I016RR+QNU8wjn7Dr9DPyKedvla9QkhfvtNhPPOZu1PN6Pw/dQXGdZPemlwsawAvGCs
	HcIfn97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir0i-0000000A1N2-2ys2;
	Mon, 04 Aug 2025 08:57:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsx-00000009zey-2D3d;
	Mon, 04 Aug 2025 08:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297374;
	bh=v9lomfM7rbZjRE8grQ/cTNg/PFAYWz1Hl/I0KQp90wM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nizeyTGxFerOSNofcf6J2JzRD6zmQIg0IE1yFArqpJvFVFsQOzmVzb/nWbep/qnRs
	 ls0QMiUMmIX/9bJJhRy8IUD0ibqJ3VJ5nfx7PyejeuZkJ7SiO1GC0Fcrrq7K5UaKTz
	 /Fic1IyANDXU1LttGRe6CWAdBZ5HfYM2A3kzfWUSjVNO+dIDPlHWHSMs1U9f6y6UYz
	 gYKfheWv7ZsyP0XN/oTTMOLi2Aiuq0HFGjWAsqU6gNHEexiH/kQafUo9VS7FLQFfmv
	 hxjeB9kF7vW4o4KiM8fiEzSIrfm9y4fempXMuErvloTXKsbwfPVlLcSZkFa494E0Sv
	 FVwg/Ry7GaVxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA0F917E1110;
	Mon,  4 Aug 2025 10:49:33 +0200 (CEST)
Message-ID: <8508db81-eea3-4d2f-96d5-e669edd6a25e@collabora.com>
Date: Mon, 4 Aug 2025 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] pwm: mediatek: Initialize clks when the hardware
 is enabled at probe time
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-14-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-14-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014935_747102_FA29DA00 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> When a PWM is already configured by the bootloader (e.g. to power a
> backlight), the clk enable count must be increased to keep clock usage
> balanced. So check which PWMs are enabled during probe and enable the
> respective clocks.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



