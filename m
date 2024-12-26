Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9033E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRLLDqrlbPXEKICsvAwtwaBpDU3ufkWk/NXlNBOvtWY=; b=oqY3OoL3vnhycrqHEfXCDutLPQ
	AyB8uyHBdjrXXDODvjpkr1l2I/XaozJGPCtr0pwuC6yeGJkP+DFPV+xOAWBIDhj/8G9zjh8Xe9RQD
	4UBC33vPfgXSEGz5QANwUkrE57bekDNS/c7eyDsDNE5SvLl/eAoOGtkhOGIairgmtpO71gNyHdshC
	wn4YjSwoAtMHC6EAXOBwC+44OskbxcH7AdrMC0p2e9V1BZCmIyJZf+E8m7TCVRFxqBORFN0L6bBGj
	g4rQZeT9EEML6H+/7w3z9W7cNN1lqZ2InrWSgAm6m8nP10NhaaneavQdZtwh8MOT3LqnWTdulTImh
	HMoSsNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQj0a-0000000FSBV-13F6;
	Thu, 26 Dec 2024 08:14:16 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQizN-0000000FS5I-48c3;
	Thu, 26 Dec 2024 08:13:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3FCE20003;
	Thu, 26 Dec 2024 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735200775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jRLLDqrlbPXEKICsvAwtwaBpDU3ufkWk/NXlNBOvtWY=;
	b=C795e/NznBHV8+JxDmoiOpaLAzDOSvu41rz1dgVWL3FkOaUy3+p0uED+cYFYy3TUEO5/J9
	c9itEWdsMuDh0dwqjsw8CNKGz7YVrEMC3T9MY9MpnSjBJHRBBcSV9Q1k95PQH5ce/TSzV2
	daelh+bTVEodiiilT4SOQfddBqbN9a5eKCdvfURt3M/FtVFs+ZjvyNGT6Z9k9M30thYfhf
	41QrUjxKR0wYHAZtj+RxUbtL1i0MS4Ce+yFvwrdthPQzW8dSLqO+Mvk+Ia5Q1CHojtF/IO
	82GEUfGLkf4rWs9riKTpk3bSByZNLZdM2wGAjyVw7kLyyR5kN/7uAzM6GrLUiA==
Date: Thu, 26 Dec 2024 09:12:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>, Rob Herring <robh@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
Message-ID: <20241226081253fbc6285c@mail.local>
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-2-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226050205.30241-2-val@packett.cool>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_001302_176961_61AE7CAA 
X-CRM114-Status: GOOD (  14.11  )
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

Hello,

On 26/12/2024 01:58:01-0300, Val Packett wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Your SoB is missing.

> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 86451f151a6ae..73103922978f7 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -38,6 +38,7 @@ properties:
>            - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
>            - mediatek,mt6358
>            - mediatek,mt6359
> +          - mediatek,mt6392
>            - mediatek,mt6397
>        - items:
>            - enum:
> @@ -66,6 +67,7 @@ properties:
>                - mediatek,mt6323-rtc
>                - mediatek,mt6331-rtc
>                - mediatek,mt6358-rtc
> +              - mediatek,mt6392-rtc
>                - mediatek,mt6397-rtc
>            - items:
>                - enum:
> -- 
> 2.47.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

