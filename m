Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6EDC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5o85IRwQAQol+2RyeyjqUcm77MQO6iNnucufEg6oxQ=; b=tvTr5L41xYwy3DKx4lAMJZwe7q
	eGCgu8srnN8YGPb3rqfb6pAlWTz27YAaxzgaUa5z5vFxpsivuP42wQmgRFoPgBTaCvFKw9i6x/wbR
	/kUXh69goLiipuT789T9+Y5xTSQV725fEVN7YZYyEZKZPZGGwJ3AgarpwK4Y42LNxmF2vVQlMvNnS
	Jlq/p19aHWWenmAjKwFdq8OYsFIch4bAbVviKJQLtY/ecRNHtz/0qaYFsGT858kge179W9o9CzQDS
	bn7pYQKKyWB1e/LChPWDvS/1QBMJJR/r2UbZB+85y2HbQktsWffJzb9NUiv2uOz4mdBddarDHjdAW
	DbojlNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0MF-00000006BwA-2eV4;
	Thu, 06 Feb 2025 11:47:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzkV-000000064iA-1ili;
	Thu, 06 Feb 2025 11:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840125;
	bh=8iUqAlvy20/ugHD4XAj0Q41lxITTOI+gRyQEhcW7HYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CZOj5nDpAp1zv5PZljzdV/FMlXFlD4v3Zb21YEOCZYH8SwwK1RMWv6skvvcp+rs3x
	 IAwmpG89URgjHBJppYniq8fjNyKVN8ZC4Dp6r5XEySURd+4gT5TuXtFz7rug+7SUfj
	 HYmnU8jzGNbEkijGY3BSh0bYiq8SnH5UzSGGSp47zjDk2z3uAeb21fk3nDy9M6wN4/
	 /94x3YHscS4uLMrCOFt1h3RKKvzpDr/WjLTK5Kj/Dn/ohZAlUX5GWs3bAVZbWfue3o
	 PjV5TjHdfugGkqgWe60+8NOAdWg/StUtwX/bSVa/uKnI0YDKhVMXm8bDa+ah4iYzNV
	 JIvftXuxIoGtg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B615617E0FCC;
	Thu,  6 Feb 2025 12:08:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 amergnat@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Subject: Re: (subset) [PATCH v7 0/6] Add display support for the MT8365-EVK
 board
Message-Id: <173884012467.110657.7286906897029273506.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_030847_626182_2AF39F6C 
X-CRM114-Status: UNSURE (   9.60  )
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

On Fri, 10 Jan 2025 14:31:10 +0100, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>   - HDMI
>   - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>   - OVL0 (Overlay)
>   - RDMA0 (Data Path Read DMA)
>   - Color0
>   - CCorr0 (Color Correction)
>   - AAL0 (Adaptive Ambient Light)
>   - GAMMA0
>   - Dither0
>   - DSI0 (Display Serial Interface)
>   - RDMA1 (Data Path Read DMA)
>   - DPI0 (Display Parallel Interface)
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[5/6] arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      commit: ec207ea7f6f9abb5b0c50394b02f434aa1ca7e52
[6/6] arm64: dts: mediatek: add display support for mt8365-evk
      commit: b7b5052f6b13061db179cf2f0f16c3334e27239c

Cheers,
Angelo



