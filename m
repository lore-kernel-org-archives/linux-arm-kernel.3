Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343F1C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 00:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn8WiLTGM4hv5wednDE0sx/2wVCfhxDKPT1BSvqhfGk=; b=2T8TRr3VuBc42RzliYOyfCiSTw
	5Fsimso6YG1dkDC/hliaw/6OSuwxPEM04QsOKu/nwtsVDn7vh4e2TDzsuBPf4s9Sad6D+tDLjUCTg
	JovKZylsvNOCMe+pvl2zVHGvTY6mJgBCFsIHua11uvEp79dJrOLNikg+fc+EeGWPLJknXbDNt2pY8
	cITUXEbiQVgJ1Z3gNyggu4/mRrvmJQeLay2KFv9vmAPI0Xz3jisWSuc8gAW0R2kniyodJSxcFrbCm
	tVffDSGMLU4Tjp5ma65JJNM6FCOZB/ymUDu4ebOu/A4fA14e1st8gVlnJn+c6BhDHJfqDxRQKLQdM
	7LlB33bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OaL-0000000F9wn-05VP;
	Sat, 12 Apr 2025 00:19:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OYW-0000000F9r1-2ptS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 00:17:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so2560085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 17:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744417027; x=1745021827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn8WiLTGM4hv5wednDE0sx/2wVCfhxDKPT1BSvqhfGk=;
        b=UqLPLKukT7Dwe9PKTXA/qAPHMdFo1DKmkgUYgTTJibKk0edTBOG7pH6iPxNHnqmqLN
         nniFZfaaWtNpkxSJrp3Rb23fbCoQFaCnJ+WYlE8QVCQYmYJYWEZTvHnWcUtifsn8+Mwu
         tU2ZUqDUlPtd0aT5eG5BB8cbtMAjeK7byf0rDZFL5Gb5/0aVn1VhWplraSpsIJ3s95i8
         ARJns7ax5/HB4Pni1kdXeEfgonIusA1K2jjqRyABYIv8aBeXtBuaLh8/edqxoPpcBgWm
         K5jbaZ81QvV9IX8C38XtTdLXO1pifyLYNl2GgdqewS7IfvMYtOiuBu1JkYYBykwVqZS1
         pojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744417027; x=1745021827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn8WiLTGM4hv5wednDE0sx/2wVCfhxDKPT1BSvqhfGk=;
        b=T7s5JjdKPgAUaF+D9n4uhzwI3E5JvLq8pe9cL25iALD4MDc8EAcuAWXbxsZWfJiZL2
         tJ7YeFru7WGIs/g+5241vBTMLMmD06Q2oPQGFaJZskUtkiqAokmtS4MPI/AbATd67oum
         1+CdNkdvaM+jvh2O608dexs9jT8zuUMXSHTb0Jaywz8udkGkhSy1X3ZCOuqYohU9epyq
         /q4aEKo6bed+qqjCzq82OmIUn7Qkntol8Y3DoYAkkHCebGw3Y1PGV7DtkjD6niC3jTz+
         W+0UOoTue77CmPRBHQ12NcqoFcIKreWNNVBqxXaZXYnPZUpG6HNPe0baEwYPvsjNmZfh
         hFHg==
X-Forwarded-Encrypted: i=1; AJvYcCUU/7O15lf7I7UaVVSjtxIpuQLjvQU1zK8PxUyRD/X1u1397fsLGeqeLnzLZvHfAFfjKzOf6I4TL71ps6wZFbZU@lists.infradead.org
X-Gm-Message-State: AOJu0YxIyjBlHl90XTI6shQoTMPmNQ8wE45nC4wD1yCEiJ/uYp8VhBf2
	ta6lu75LtSNDPyICr4/YtQhlGyZhgzzltQYSlIgbtTPE3FGkLnp5
X-Gm-Gg: ASbGncuPtbmFu3N9EgH39Bv9MOs89hb/uTzsiDeJFI2yVbg8BeVYHaRMKRL/4WMUH9+
	fJxlCRTyCyPtkudyUUmBIJkKMLdFNX8a3BamGUahewovkK4AXwa4wBaST6P0NAsIrt+vaSVOIhv
	qzrcKk2vOev/inIitWnA7TrVoJ0JJngxWSZtX3gSmBp4eKz7uAHBSIBJznc020r7TGW3Q4qtHkJ
	KLhf9I4Qr0NuQXovOwdVaAGdTJ6x2irbE8JPC3nLl33bkNVSbyaXk7qACXlI6Zs+sqRo10x4RRE
	+TUeq2SigGlJutTJIabSA2e57+08
X-Google-Smtp-Source: AGHT+IFP5/uE1wxprdlHP/U5fFij1m37vhPv0nTX4r0GYg7cFdYJWHZCIpl23H+UvVaoTzpcrqlDDQ==
X-Received: by 2002:a05:600c:1e09:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-43f3a7d35a0mr17143235e9.0.1744417026275;
        Fri, 11 Apr 2025 17:17:06 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c43sm102425355e9.25.2025.04.11.17.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:17:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 03:17:03 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Use preferred node names for
 "simple-bus"
Message-ID: <20250412001703.qbbfhtb6koofvner@skbuf>
References: <20250226214751.3751865-1-robh@kernel.org>
 <20250226214751.3751865-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226214751.3751865-3-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_171708_718140_0E06C7F9 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Feb 26, 2025 at 03:47:49PM -0600, Rob Herring (Arm) wrote:
> The "simple-bus" binding has preferred node names such as "bus",
> ".*-bus", or "soc". Rename the Marvell platforms to use these names.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi     | 1 -
>  arch/arm64/boot/dts/marvell/armada-ap807.dtsi     | 1 -
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi     | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
>  7 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index 9603223dd761..6ec22eaaf816 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -78,7 +78,7 @@ soc {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		internal-regs@d0000000 {
> +		bus@d0000000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			compatible = "simple-bus";

Thank you for your patch, which is now commit
ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95.

I have an off-the-shelf Turris MOX board, which was shipped with a
U-Boot older than the commit linked below (does not contain it):
https://github.com/u-boot/u-boot/commit/bcf6971d536793eb99e12ff857cc018963d7cd46

and as such, is incapable of loading current mainline device trees,
which contain your change, because it is hardcoded to perform FDT fixups
based on paths such as:
#define ETH1_PATH	"/soc/internal-regs@d0000000/ethernet@40000"
#define MDIO_PATH	"/soc/internal-regs@d0000000/mdio@32004"
#define SFP_GPIO_PATH	"/soc/internal-regs@d0000000/spi@10600/moxtet@1/gpio@0"

which no longer exist.

Relevant portion of boot log:

## Flattened Device Tree blob at 04f00000
   Booting using the fdt blob at 0x4f00000
   Loading Device Tree to 000000003bf16000, end 000000003bf1e11e ... OK
ERROR: board-specific fdt fixup failed: FDT_ERR_NOTFOUND
 - must RESET the board to recover.

FDT creation failed! hanging...### ERROR ### Please RESET the board ###

Note that the hint about what is wrong is only visible with a serial
console which I happen to have. The board does not rely on it for normal
operation, which could pose a problem to typical users.

Just bringing this to everyone's attention. In the meantime, I'm going
off to figure out how to build and flash a new U-Boot using the steps at
https://github.com/turris-cz/mox-boot-builder.

