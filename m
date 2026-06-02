Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B80BCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnLig1efP0TuJ12veBvKUYnUO2mrsAHX1oK+MYE3e7Q=; b=uu9d7gL45uWg+8m+BjqMad3ZJ2
	taGWyhEwt0PGpQXhKvOK9/zHt0kQrqybO4Qh46Z2kaFmhPMEW0k0elYvzC588BRPqFrfyiF5RqJHE
	l9WzCJA2nFFnIwOG0umatbIU61Wligq47sE8TxDYK+VRQi4FrOSVZiuKM5/qI3can5o3DlyrnjA9r
	a2LOTdriTAG2kQ3mCSgAodyUXhfwkFnpM9pD2f9q26xc4saY7uq4zJvYBDARbxQMOx1iW21pzVKhv
	nwPpfflVh58kULd7F1l0OBV9OTQuAQxhKvbLrBUf6c/FPcZNPxhCeVYPDSCOwbL7eZi7Gaej5wFe2
	MS+m1fWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVFa-0000000DiVY-1H45;
	Tue, 02 Jun 2026 19:58:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVFZ-0000000DiVN-04DI;
	Tue, 02 Jun 2026 19:58:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2073160098;
	Tue,  2 Jun 2026 19:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD89E1F00893;
	Tue,  2 Jun 2026 19:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780430287;
	bh=fnLig1efP0TuJ12veBvKUYnUO2mrsAHX1oK+MYE3e7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GoR/ooG3A23xypxe/2xIjqhXBgNQL6JSdsjAIy5mcUDJyifn889NEwPXaX9plNUoQ
	 95s+38nJXC3BmSI6OEEU9xfocEKCy4p3TuYErHQCifEiF5vj2uv69ycot9xDWNk8Uo
	 lKQgRWyKxyn1v7TCaUc4ZigPwyxw7+23CyRtPwNMCb9g0wGFAEmy64M2jxJBQRt77t
	 MCghHnNJMLBMEnrPwsa+jZT59Iykyxv3SbFGTk1qCENU3CeqW37zeThZjKl4tlDHWo
	 waTd9ltZGETh15fjYkBwNpQEtlbfYmE0w6t/84CMFfn9gIPvZkLqmeid/filaiA1Xz
	 GWL3TLidwOjjw==
Date: Tue, 2 Jun 2026 14:58:07 -0500
From: Rob Herring <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, kernel@collabora.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH 0/9] MT6365 PMIC support cleanup
Message-ID: <20260602195807.GA1062343-robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
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

On Wed, Apr 29, 2026 at 11:44:13AM +0200, Louis-Alexis Eyraud wrote:
> Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
> SoC, integrate the MT6365 PMIC, that is a MT6359P variant:
>  - Mediatek Genio 1200-EVK
>  - Mediatek Genio 700-EVK
>  - Mediatek Genio 510-EVK
>  - Radxa NIO-12L
> It is compatible with the MT6359 PMIC.
> 
> But both MT6365 PMIC support and compatibility were never expressed in
> the dt-bindings and there is no MT6365 include file as well.
> So, since these board support was introduced, their devicetrees use the
> mt6359 include file to enable this PMIC support. 
> 
> The goal of this series is to clean this support by adding the missing
> compatible strings for this MFD main and subdevices in the dt-bindings,
> and add a include for MT6365 definitions to replace the MT6359 include
> in these board devicetrees and for future ones (like Genio 520/720
> EVKs).
> 
> The series is based on linux-next tree (tag: next-20260428) and has
> been tested on Mediatek Genio 510, 700 and 1200-EVK boards.
> 
> ---
> Louis-Alexis Eyraud (9):
>       dt-bindings: mfd: mediatek: mt6397: Add rtc for MT6359
>       dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC support
>       dt-bindings: input: mediatek,pmic-keys: Add MT6365 support
>       dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC

Applied these 2 to fix warnings in linux-next.

Angelo, Apply the binding changes along with the .dts changes if they 
haven't been picked up yet.

Once again, Mediatek warnings are moving in the wrong direction. :(

Rob

>       arm64: dts: mediatek: mt6359: use proper compatible for rtc
>       arm64: dts: mediatek: add MT6365 PMIC include
>       arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definitions
>       arm64: dts: mediatek: mt8395-genio-common: use MT6365 PMIC definitions
>       arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC definitions

