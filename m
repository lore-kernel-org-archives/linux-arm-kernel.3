Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E903DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/rts+XSP4AUuxd4FbsEWcN3eKOBuSMGFl0owa1wUt0=; b=K813Pe81m9NWiR2rE1gDC2KqOt
	777RO0aquaNwFXBzIkWzhO2E2L+3ZiOOH2mNcOpOA9u8enTPa7WNoHnsLbvwqHXGabO/IU3hvAtKC
	1y+r5+mz7DVs2Tr6fURLgb0P2dXB9znd3NzIz6xbq6epi/3BlLsLtJkcN+Hi37FQiEeLdnvhhWbBY
	8aMvO0Ufz40qUq7GzMRDQ/ECVtiirJXeP0ei9c/Cc+7Y1eZcazN3V5HvGxd83M2dLupDya5A0p+7n
	m7mS6Cb2u27iHxEaPWQpl45YjdxsffrYyPLyOy42Am6BSIX1O/OR8hsN350zntLPzgRX7Gj65wue3
	a0LUjBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRs9-0000000CYkK-3ILP;
	Tue, 17 Dec 2024 07:20:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRgJ-0000000CWtZ-2E1c
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 07:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b/rts+XSP4AUuxd4FbsEWcN3eKOBuSMGFl0owa1wUt0=; b=cfwt59TgYBT9dHtKtujVEGGwLJ
	ovYyW9Nds8YMZwKK4CXFseZTEnZxOyYp6jgQ1VlMUS/Q2oxb1i9H3RdCb4rDt5RtqsnScsmvwMBth
	RcTmJHWxc/W4FRAE5gFTAlwucMQV1RBEB2yOx2VNWk493Fw5JrhqQ8pFaTebB5Y5swNLWpiFwfeJy
	lQVVWKzfrcPKQ0KfrZ0G76sVn0uctHOjpzdobjQdGlKRCyvtG+79FY6zLexlTtnEXxy8gNd4aBceC
	xrpKNADq/wt4XobFdysbTBAS5AubX39QbuQwUhpHEOubAlINx9QWI+/i0tHitPYArKVohdB7R13/H
	slfDTXEw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRgG-000000051qY-0EF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1D8CA41DE8;
	Tue, 17 Dec 2024 07:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A640C4CED3;
	Tue, 17 Dec 2024 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734419262;
	bh=5pNv1T3alykB+CBmVUBDGGead9uQSVHWIwqxJDAEdLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhEJSAO0xDkczEnGSQrwYr7gbOUFKz1QFvbhU76Go4rxPIe041b/qSWNgT1X9JSqO
	 PM8N+tB3axhHT9yiVuY5pMhI5cPypp1z+8ttpGvyJt/rczfRQdNo+zA50tGMUZ0X+6
	 0mN/HCFStdqOYetFZzIHcrX4X024iwAOp/zEra9xq6Ll+zjVqnEWz/8HqNv3yIzrfW
	 bTYQVdEt23cxKHM+YYw/VpQv0Wld8VsgtYzYrqAP8ZZJFPm32yJA7ZOcysL7Cc/JPZ
	 K+pWKdUbbIxRE3YeXwWqr9DAEfBW0S+d6UPGbvW10OfxN98r9BWQds/1uLnav6XRCD
	 As3upYwGDgnjA==
Date: Tue, 17 Dec 2024 08:07:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Message-ID: <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_070744_696953_311BE406 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Dec 16, 2024 at 09:50:37AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Introduce the 'widgets' property, allowing the creation of widgets from
> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
> introduce the 'hp-det-gpios' property, which allows using headphone
> detection using the specified GPIO.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++

I have impression you are duplicating audio graph properties instead of
referencing proper schema, but considering that the bindings
audio-graph-card and audio-graph-card2 differ only by number "2" without
any description, not sure what is correct here.

Best regards,
Krzysztof


