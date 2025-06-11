Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3051C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3f2xmewGrA2fiX+ijKnJQ24Xtnklc8qk5NEda4Ofj4=; b=nLsRbnOtbW48LnOrA2AxIeLRj5
	mkl+0PThTEQ7oc67wAXls/ZJK9vjtSM2CjQPMCXl4OF0B4axJhkxu4aGI71kN6LaEQJmoeACt/5YD
	10fMizJF5opzv00n8Nyauum8ZxGXhWA00hyvhsH6gj3K5WQLbphPmVV90P/k3RTxip++hceZVYa0O
	lnStRWgEVdwvw/GqBAxdwQ/7GjQcPLRVyR9sdb5PVjNIpRNDmAvVrPTbMMNZ6DPwj96WJLGbqajn1
	LisbtB9mUdc3ryB+rtJrKjvF+T2EGrsE5ZxZzoLfnTEa0BZxQTOOo8m30D7yb/Vgqjv0uHoM5f4y7
	MhI96Fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU7f-0000000BV5j-2aoI;
	Wed, 11 Jun 2025 22:40:43 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRcH-0000000B74s-0czW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:00:10 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E70121140228;
	Wed, 11 Jun 2025 16:00:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 11 Jun 2025 16:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749672005; x=1749758405; bh=h3f2xmewGr
	A2fiX+ijKnJQ24Xtnklc8qk5NEda4Ofj4=; b=DbpyhmQyaU9k/kzsc8fDWHz7Q/
	tFXOLIszNs4w1FKCJL/iKWQ32T2lUaMZkl2pXirI6tg1SOP7putL45MH/v3r003+
	5eZCpm6yMwXRmZKkjw0bYQrOxI3NmTdaLloe3ci62ATNf3xvCa2LzPnZVTIW4ucj
	OKGiivPhABrsVQ2i/UHegmZog/KGHk4gp722C1mtA22+0e3t1PXo+F/VWyuwsUBt
	I9S8YG46jVvFtcCKRHQTPAehl2tr3svetVRs3zQC+AcQk8+qvTxYXSwh8mzNVdie
	rc6bQaF2+a/yDyldnuvFXVyyh/4dchyQwxBA5sNixmzG1h19QvFC6i50WEyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749672005; x=1749758405; bh=h3f2xmewGrA2fiX+ijKnJQ24Xtnklc8qk5N
	Eda4Ofj4=; b=AaQCpqQvaSmk7bfdLerLYRC3XDoNohomgNAmhV2CcfADUxqLX8F
	CMPymDI7MQR5GL8X1RkObHQsedOnLrEqCtXSGKDKtN3INYI7Uk9glbNLEmSmi9My
	vec+UE1W4QGbZcg44BGFU3rbT3S3Q/Pm3Ae9+WtN2ko/WplwFjZxEun7RXdSH/tR
	/GPD/8ZAMH/BpXbn2asIRx6HuN0hpXe60agEqRDMMW47OG7vtAmodz644bwJP4Tz
	xBWKEG4lmc18FUap5kL0WHsUEYh4XEd/fj9dss1S/TM2rwjVmrRqK2rJFbY6nnE6
	RXPnaX3kAuslqZ8K3ucsoPxtCsI7yobyeHA==
X-ME-Sender: <xms:ReBJaAcGqIsC-WnIsspIousoe8lBV7IfHHwvlbQXhz0apIfG6GN1xA>
    <xme:ReBJaCP3XlSnD-q8LQp3JJtFDXSwiG-8sbJLQIDxjX8MmCyD9Gu1FH3j9YuQaILyO
    U5YrImxWCIVePu4hZc>
X-ME-Received: <xmr:ReBJaBgEHWQDdgOwGw60AaZYDOtSmjCn7XEFzF1TLAO1G3EcCElTmpeBewvPp2eBlvSOdApXVkFir8Qd0jou5gLmIQszIxaVTuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedujedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtg
    homhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    hihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphht
    thhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrghrthgvnhdrlh
    grnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhi
    phgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnse
    hsuhhsvgdruggv
X-ME-Proxy: <xmx:ReBJaF-6C433O2_kPVtGT8tI1M-ODmgZGHNPuDzmhB1aPHrFG2uouA>
    <xmx:ReBJaMt4RwWye9hTEOOSVRJ4Shst3gl5IA3CGfLWjWOl-4qIiNn-MQ>
    <xmx:ReBJaMFs_1tSbjWqcLHBeEltbf_qsTNjbLJxByaNVXiFHpfRH5Wp6w>
    <xmx:ReBJaLNFALoQnckxNUfiTJKIhQ05vbyJckSyprsvOo-lTPBaIk80VA>
    <xmx:ReBJaNocCudOOzWtPPAj_j3L7S_yIWYfm86-yUNumJElYoIZ7chKcont>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 16:00:03 -0400 (EDT)
Date: Wed, 11 Jun 2025 21:59:59 +0200
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <20250611195959.GA3141695@robin.jannau.net>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_130009_560289_3AFFB476 
X-CRM114-Status: GOOD (  14.20  )
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

On Wed, Jun 11, 2025 at 07:32:17PM +0200, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add device tree entries for GPUs in M-series SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 198 insertions(+)

...

> diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
> index 87dfc13d74171f62bf3087401918d9d41eaac560..329bd084b63e3688547166a8d0c3d9ace5d6d937 100644
> --- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
> @@ -11,6 +11,10 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		gpu = &gpu;
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -378,4 +382,34 @@ nco_clkref: clock-ref-nco {
>  		#clock-cells = <0>;
>  		clock-output-names = "nco_ref";
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			reg = <0x0 0 0 0>;

all memory-regions with invalid address should be disabled. iirc the
kernel and/or u-boot will try to map those which does not end well.

Janne

