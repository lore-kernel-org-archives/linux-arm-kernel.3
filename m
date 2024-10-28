Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFFDD3399E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+z8XASNZGQHbKKQi7C+yR4QT87b6MBIhSum5HECC9Bc=; b=4uBG4iQMVpBrNJ1XuymFaiZ7Ud
	6oTXB1ve9onDi2oFXwHS8k3GXf2DVFgs5Rbv64u38lKN5gcsdFUl42rCZtdjLRynk9vvrJRoktHB0
	x/kCPX2HYQGuhonY/UhTzJfXZlLZIJ7ou2U59WTbM9o+DpCbMQDbMpEnnYyCriWhTPTgs7jutS9hR
	NQXKeF7b3mCYKFCCh3xXJtoICosZDOD/KOrg7LJq8M92WVyMHCIJ2mcbQgWhe0CSJk9YRuG3pOZYe
	60S7GQAJxqCr4fJm/OtvY9kUx/SBwnltPH/zcNRvhoxbVCV4LOHXe6XXfOs2XdRlx6VXOtGGtuWeY
	JGVKGEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkY-0000000BVz2-1auN;
	Mon, 28 Oct 2024 16:37:50 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SP8-0000000BSnE-1UGw;
	Mon, 28 Oct 2024 16:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730132141;
	bh=Y5PrnKl+xov67NmWMCJECcieIF0DUv2b3ykYEbx8x5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l/wPOq+xxyYFedu+WEJ0rZg1JY50dXJpynSAwmxIDynFhkezZOO+4EGB6er+YxY3d
	 Bozt4WRJxIhMId7Ou3Ze2WnSYmIBi0oUJ9mtNxRzI8R5nEaQgq99+oT1VL5h/ev0eb
	 fGGMEyGa29rW0v0D6R3eaULPCTufuZVgBtSycjnvS8rbss8eo44YOe+Kah269xXx2m
	 MSGTScr7CbXYMVPLgnL94QsNizBN1XVZJFflwz/FPV07vjWIr/Adl7oeSvSnhjK2O2
	 kc1MFhviqn9cEoXeus6x0S9V8dtP6idQplQ3Eq/FSZeOCHmTqeVa9QXzx0TogKmASd
	 4N5my0tp/wxYA==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 13:15:39 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yangtao Li
 <frank@allwinnertech.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Parthiban
 <parthiban@linumiz.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry
 Reding <treding@nvidia.com>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Yangtao Li
 <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon
 <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 06/13] phy: sun4i-usb: add support for A100 USB PHY
In-Reply-To: <20241024202216.6cded8c4@minigeek.lan>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-7-masterr3c0rd@epochal.quest>
 <20241024202216.6cded8c4@minigeek.lan>
Message-ID: <eda06e73559c5d12e430cda8f93a0204@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_091542_626454_4D619EDC 
X-CRM114-Status: GOOD (  19.97  )
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

On 2024/10/24 4:22 pm, Andre Przywara wrote:
> On Thu, 24 Oct 2024 14:05:24 -0300
> Cody Eksal <masterr3c0rd@epochal.quest> wrote:
>> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c 
>> b/drivers/phy/allwinner/phy-sun4i-usb.c
>> index b0f19e950601..a3942b2ee90b 100644
>> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
>> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
>> @@ -1006,6 +1006,16 @@ static const struct sun4i_usb_phy_cfg 
>> sun50i_a64_cfg = {
>>  	.phy0_dual_route = true,
>>  };
>> 
>> +static const struct sun4i_usb_phy_cfg sun50i_a100_cfg = {
>> +	.num_phys = 2,
>> +	.disc_thresh = 3,
> 
> This member is never used when .siddq_in_base is true (and yes, this is
> wrong for the H616 too), ...
> 
>> +	.phyctl_offset = REG_PHYCTL_A33,
>> +	.dedicated_clocks = true,
>> +	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
>> +	.phy0_dual_route = true,
>> +	.siddq_in_base = true,
> 
> ... which makes this whole description identical to the D1 version.
> So at the very least we wouldn't this new a100_cfg, but instead just
> point to the existing d1_cfg.
I did test on my board and confirmed simply using a D1 compatible works.
> And this also brings up the question whether we need a new compatible
> string. As it stands now, we could also use:
> 	compatible = "allwinner,sun50i-a100-usb-phy",
> 		     "allwinner,sun20i-d1-usb-phy";
> 
> and wouldn't need any driver changes at all. Which would have the neat
> side effect to make USB work already with v5.18 kernels.
> 
> The only downside is the somewhat weird ordering of the compatible
> strings, with the much newer chip as the fallback.
I plan to drop this patch in V2, in favor of just adding the 
compatible/fallback. Although it's odd ordering, I would think fixing 
the DTS of other device trees to remedy this would probably not be worth 
the hassle.
Thanks for pointing this out!

- Cody
> What do other people think here?
> 
> Cheers,
> Andre

