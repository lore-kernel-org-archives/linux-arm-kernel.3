Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53793C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc9wAy3ut+Vg9RzNHJrfHWG2bPYNxL7JOfNTz/yRTDQ=; b=ucf52oleEqF9MV6lcSDbx4mBN9
	lgVBQ7X8da0/b+Mw9q6opa72yelQAYv0xZj6JuEq4YpwuDtPLI3CFlmDDMNl8u/f7qnlJhmknsppm
	UTECEozgyiPi7JVW+/GebDIAdQJb9nqQAf3cV6yvaJQuQf7t4GBRevwxMMMM3G2o5eljYZiO50tui
	LaXne9OomfjeDyOC9Mp/V45HQ0bD0CFu4oAuH9Qkh5VV7ckj1d11heV6pOQ+bwYqZ5regz1OiPQxu
	WDXKfSj7ZZzDuMcr3gsTq/hpP/madQz2m3BWoaOWJWjoEm6JwkkYHqwYtWA7Ga9S5UsgFvYNQ2nEO
	0DI16g7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqo4-0000000GSPN-1UGf;
	Sat, 08 Mar 2025 09:49:20 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqmS-0000000GSKy-0546
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 09:47:41 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 651C21140084;
	Sat,  8 Mar 2025 04:47:39 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sat, 08 Mar 2025 04:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741427259; x=1741513659; bh=Tc9wAy3ut+Vg9RzNHJrfHWG2bPYNxL7J
	OfNTz/yRTDQ=; b=driDAFO0NZrxdvvwDA1O+Rk531jO9s8y56jo+o0AVsVC7/tq
	uX/Q4qakFhaS8GQSoJ9FaToMJL5MVDQlrLmY5ACe0BPGKp2AXoTO3kU/2Y9FxIjQ
	nKJxBZjeZtpEoFGqxjWHNfwG28cDWwMgExFZcUoAoxFbjHcBCvnnmZ7lNCdErJOZ
	2lfrpqrIqAVzEJF0H4YLXKvCLwoZ/IyTj+AsfU24ashrCLyH4KULq/8BC5a8hN4q
	WndRJhVKemvw1abZ2ircoIaCyQS5PZynnJnPiTAismUJ4rfdFUBZashH/dXTZ5P6
	/Jo7zoqxvJ1lXrlcInnyW+qreVTjR7wTqadbbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741427259; x=
	1741513659; bh=Tc9wAy3ut+Vg9RzNHJrfHWG2bPYNxL7JOfNTz/yRTDQ=; b=6
	YzQ5b65Lj6wAmvXzDLaFHAxp4O7c80P4+1TX+O0/CALxYIiA726EW8bgWnKLKF7V
	vovLzRVYyANHmWG6j9CyqbuaCzzXQgMCD4xpmDdRIr1xYjpzrUhDaU0zqSXdKUxk
	qh1s5AfuQfvmLfcxIiQKyyBLlq4exN3SHMatd5YUlu65MLgM3pioHnSJPLIy29/L
	q8OwlitUYbvARunwSfNRARJYkL3zuNTP83lZQS7snWz6D9VMOei1BYYbL6C9tY9g
	iY7Mpu3ZOHoBA0Hb+DPKVv73rysYUsqIZsAiSAOq+PFZT5/JfwKOE6oMoknx0kh4
	8pV6oxwR7aiivaIihd7pg==
X-ME-Sender: <xms:OhLMZ9efGwv-1PTaJNcei2Y4Tn9FlbL_YCxJahngoYQl7BXgDW9O7g>
    <xme:OhLMZ7NUiKCD9JiJ_GqJBqNEBMseyh-PcQf7_i-ihB58LsaZeO90JrpZksl6z9sf9
    MgGKzmAmu03qurD2Jc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrd
    hkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehtohifihhntghhvghnmhhi
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:OhLMZ2g6iRx_AzoIqsQUuwEoRy1-Zpberf9r-KcbDj4xMXxZ05iBWw>
    <xmx:OhLMZ2-6qr2kWU59ecNlencmmO076L71A_yCTHWEsgrlTdzJWB7qzw>
    <xmx:OhLMZ5vfyIGVu3hQm2yrhIDMhCpq3NpkbR1FUtsSzypxGm6aXqY9lA>
    <xmx:OhLMZ1ETN8n_jdwsZ8C9emPyNLs1J-O4bbkVxDRxlr9JKgdh1_6R7g>
    <xmx:OxLMZ1GcbORkHihKMIBCw_Li5G4ir0qsL0MoEtQr3m4ZVsR6QffoWJbH>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C6CB3BA006F; Sat,  8 Mar 2025 04:47:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 10:47:18 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Nick Chan" <towinchenmi@gmail.com>
Message-Id: <e7a253bf-8e8b-4845-a38f-51bc00ad677c@app.fastmail.com>
In-Reply-To: <20250307-spmi-v2-3-eccdb06afb99@gmail.com>
References: <20250307-spmi-v2-0-eccdb06afb99@gmail.com>
 <20250307-spmi-v2-3-eccdb06afb99@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add SPMI controller nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_014740_130830_37B36A3D 
X-CRM114-Status: GOOD (  13.55  )
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

Hi,


On Fri, Mar 7, 2025, at 21:09, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add device tree entries for the SPMI controller
>
> Reviewed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 7 +++++++
>  3 files changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi 
> b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 
> b1c875e692c8fb9c0af46a23568a7b0cd720141b..d544a35c8af414c583d38b040e1aa753902f1c93 
> 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -53,6 +53,13 @@ wdt: watchdog@2922b0000 {
>  		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> 
> +	nub_spmi0: spmi@2920a1300 {
> +		compatible = "apple,t6000-spmi", "apple,spmi";
> +		reg = <0x2 0x920a1300 0x0 0x100>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +	};
> +

Please keep the nodes ordered by their MMIO address.
The watchdog node above is at 2922b0000 and should come after
spmi@2920a1300. Please also check the other nodes you're adding
here.

>  	sio_dart_0: iommu@39b004000 {
>  		compatible = "apple,t6000-dart";
>  		reg = <0x3 0x9b004000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi 
> b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 
> 9b0dad6b618444ac6b1c9735c50cccfc3965f947..0f03dc808cf7c6b7d71afc79dd29d368f957f979 
> 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
> 
>  / {
>  	compatible = "apple,t8103", "apple,arm-platform";
> @@ -604,6 +605,13 @@ pcie_pins: pcie-pins {
>  			};
>  		};
> 
> +		nub_spmi: spmi@23d0d9300 {
> +			compatible = "apple,t8103-spmi", "apple,spmi";
> +			reg = <0x2 0x3d0d9300 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi 
> b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 
> 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..fecf70eba255c668757e2edfe25a4e9e7c0d0bad 
> 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -641,6 +641,13 @@ pcie_pins: pcie-pins {
>  			};
>  		};
> 
> +		nub_spmi: spmi@23d714000 {
> +			compatible = "apple,t8112-spmi", "apple,spmi";
> +			reg = <0x2 0x3d714000 0x0 0x100>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
>  		pinctrl_nub: pinctrl@23d1f0000 {
>  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
>
> -- 
> 2.48.1


thanks,


Sven

