Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E960DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovzNnQXCxxPbw+iTp1IpdqpMxWWHjLCLwy0mzBZVN9g=; b=cPewCB9zv8rpWFiWhcJ3HIoxvu
	RsYXDsYWU7Y2j5tmlISdeAEFwdwEo/oONBS7NNP7Se/2Qqz+71+oFlIDfb8jGZuw2rTk9lwW59l0O
	1jU+pzgwR9oUcvOEYSiUvhktS5XVOw4B85PVII+WZe2LukZjeYH8Sm3bYKmJMUeyRtj1K6qq6Gn4U
	bfI+BqhqSiobZQhgiEtEeIr21p0hyc8L4Fp+EVXf4wyPxJ0gvaLnYso0LeiHBvYWiPA+5obcBXWYT
	aVipaVHSF/NapDCCxcozLA2SvQKxEYxNWlkSqX98AJvTUdXLmAdzi6QEpCBqd6hn2xYkLa/km2cfG
	95pkzI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77II-000000060N6-2s7R;
	Tue, 22 Apr 2025 06:39:46 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77GO-00000005zj8-2GRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:37:49 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AD7232540212;
	Tue, 22 Apr 2025 02:37:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745303864;
	 x=1745390264; bh=ovzNnQXCxxPbw+iTp1IpdqpMxWWHjLCLwy0mzBZVN9g=; b=
	Lo2DLVmMK/FtFkrSOVOysOqzREOMr1h2WXPm4bq+fWBNsszfH5CVV3hK5FsUM7y0
	Jno5uxNT+SSWuKZJP2FWiBV/8kMGJ3O3QVAaWZcdi8sJrSoy7THRPgQV2FW6iruK
	dJpkMrWNEqzguuS5C1WWzNBkBnslFWTRnKKCGO4tT7Wd3U5ZadcjZehT/WbXCubW
	PFgwjHyEdMS3KaFqfIzKc7EMlbRECOnPVg8S5hB5cuvKzrvLpfC9Pms2qIUJ7ffS
	UEQHKiyivKKuf7RjtBg9g6ctMy6gkzCK9z+h27WQAHrtbutW/RwgpkNN0RNuHjKq
	+4/zXZ+OKzK0zr6iNeZ5ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745303864; x=
	1745390264; bh=ovzNnQXCxxPbw+iTp1IpdqpMxWWHjLCLwy0mzBZVN9g=; b=g
	1nYH05H51oIjk5R46oG9LPhrm5/wrbrkIQ2e/aa89VV95tBytMie7c78UkoSrT2b
	vuH+KNrnSq3TKXyM72a9/LOb4EmMtIHero0M8ApBOETcizLgt3HtRC383YsCQt2z
	8n8vrmeOGh2mCM2S5tjf5HnNUuEbXDu72ZG6CuxBCJdYR0JGkgg4SE2GZoFp5r9e
	Liurn/iFMuagnGh0e+oR7Q7pbBe1R8HckMAWsFSPq46y8l9Yv6ixMkbKgzWpb4qa
	+riOFr5h8o+/gXIVqTVH0e8q8D6pCchyv9R4e5of/13/HJeW9G3yB5p8S8domFar
	BRqwTq+eFhS/BJr9xN57A==
X-ME-Sender: <xms:ODkHaKc5Fv0UiaINKioA9VyP6u4bpXr5qgk38A2XyI6djMVF1YEMow>
    <xme:ODkHaEOyLPpD1P9G_w7K2zaHnZpHWkot7ZH6ylyJjwgPfIlRGY6QRc9-Y7HQV0grm
    Bd_glq3mI5taejNigU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithho
    fhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepsghjohhrnhdrrghnuggvrhhsshhonhesohhsshdrqhhurghltghomhhmrdgtoh
    hmpdhrtghpthhtohepjhhmsehtihdrtghomhdprhgtphhtthhopehnmhesthhirdgtohhm
X-ME-Proxy: <xmx:ODkHaLhwVBRyJg07EZNHIbYq1Hyah8xspwb4rCxMzi08lBp5X8oYVw>
    <xmx:ODkHaH-6vEO2sMoYo-SBySjBGbRCZkUDi0M7vFg4X3y96a-u6yKicA>
    <xmx:ODkHaGtGQbJu5EFY65_D40pBavmmADt_MFKkHZYcTSJiwULxGeyInA>
    <xmx:ODkHaOG5mcC0M8V9A0ROFAISTXUbN-PVUcFLy0TZ5wfHhmdYps7j4A>
    <xmx:ODkHaMkuJDzim2xw0GUFaQ4xjheGeuaDujDwZcaQ96ZVu59Na6ePsXSL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1FC72220073; Tue, 22 Apr 2025 02:37:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tafab3bbc3080752d
Date: Tue, 22 Apr 2025 08:37:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Judith Mendez" <jm@ti.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>
Cc: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Message-Id: <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
In-Reply-To: <20250421201055.3889680-1-jm@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_233748_637640_C5B2792D 
X-CRM114-Status: GOOD (  15.73  )
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

On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> default on am64x SK board.
>
> Signed-off-by: Judith Mendez <jm@ti.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

The patch seems fine to me, but you should address it at the 
TI K3 maintainers, so they know they should apply it and forward
it to the SoC tree. You have Nishanth and Vignesh in Cc already,
so I assume they will pick it up from here, just put them in
'To' instead next time and move Catalin and Will to 'Cc' or
leave them off entirely.

> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9e16b494ab0e2..1f7b97ff46a7e 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
>  CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>  CONFIG_CLK_RENESAS_VBATTB=m
>  CONFIG_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_OMAP=m
>  CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_TEGRA186_TIMER=y
>  CONFIG_RENESAS_OSTM=y
> @@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
>  CONFIG_INTERCONNECT_QCOM_SM8750=y
>  CONFIG_INTERCONNECT_QCOM_X1E80100=y
>  CONFIG_COUNTER=m
> +CONFIG_TI_EQEP=m
>  CONFIG_RZ_MTU3_CNT=m
>  CONFIG_HTE=y
>  CONFIG_HTE_TEGRA194=y
> -- 
> 2.49.0

