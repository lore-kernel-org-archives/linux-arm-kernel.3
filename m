Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D43C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cPsurSQCTJuh6URefwarH/f2msTgGmy2Fo3DfS7UiM=; b=rLdTJoWsANszerEfBkQmYhgeU8
	jEs4e2no26Q+VovE3OEutgp2Y6wsgGDn8s1mE4bJkK1Eur/05JPISQCOeQ7pbd2W6OJ6ZX/a0+TYx
	SjUiOSG3oXTCLn/iRJG6gRIw1E8gtsVnlckRAdpsJsnvjpaz6Bxm6dqWYH3TWb67aS5JrtSiMyG6Q
	QQvOmjK6o34pRiRuAPobnINmHVeutDEpFCD+LcUbwkB2szrprhXwv8q5h04wRIlOsXOK7nBOxexqI
	EWnPgLGp2b1BG3lt9S4Sdqp+3DLFT2Ecq0JGuIk4l1Rj7dtVGooDuTJkgaiQzVX4tZBVrYWtRf70G
	OCsiJgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSk-0000000A4jg-03mf;
	Mon, 04 Aug 2025 09:26:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir14-0000000A1Sm-2N2L;
	Mon, 04 Aug 2025 08:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297877;
	bh=BYlIvi6N1B4zZkudRep+yBSyFMv2TAT55xPmCHgg8Ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UMeLnFLlhxIsDh+1vjILNaFUWz2Ao8Cj3nIdLdKn+tM+b5dPaOc2KNTNCHabvB/bZ
	 f8PtG+ypH4ZuKB/MplnsrSYUU/nrqU+jdEsQ81s+4PFMHXiILEbtX8Xrf8V/3eyeeO
	 PRW8B2Qu5X5Oe/EUIydBpfYbS35kF3JTFOsSt6xJ2tueuWJekO2lGUM523bOdXah4U
	 uNZ3W5TAT0uur0BAcCfo+H3HufxnuNZJmLfFcNZBRYITI4aOyPgZ4ADCsNlMLpLA/k
	 EbZ1Dj4H8ziFv9IgNnYlo/W5p+qyEYth2cp7k1iYO9xlNXdFitrlPh2HUSST/1iTc5
	 iTKyI69Q7Gw7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B05917E04DA;
	Mon,  4 Aug 2025 10:57:55 +0200 (CEST)
Message-ID: <edaeb213-d1df-40bf-9538-9ea86198f3c2@collabora.com>
Date: Mon, 4 Aug 2025 10:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/mediatek: Add CCORR component support for
 MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-2-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250727071609.26037-2-jay.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_015758_758925_811022CB 
X-CRM114-Status: GOOD (  11.44  )
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

Il 27/07/25 09:15, Jay Liu ha scritto:
> Add CCORR component support for MT8196.
> 
> CCORR is a hardware module that optimizes the visual effects of
> images by adjusting the color matrix, enabling features such as
> night light.
> 
> The 8196 SoC has two CCORR hardware units, which must be chained
> together in a fixed order in the display path to display the image
> correctly. the `mtk_ccorr_ctm_set` API only utilizes one of these units.
> To prevent the unused CCORR unit from inadvertently taking effect,
> we need to block it in the mtk_crtc.c.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>

Please, remove that bogus "20220315152503 created" user that does not exist.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



