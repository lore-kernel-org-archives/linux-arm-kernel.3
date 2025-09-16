Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E80CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNr3jSgck4Jl1pEEorXXSsO/QSdN0TeOX27XjWwmQk4=; b=gU9hciPJlDexVb9LCcZ0ARY5sR
	IGx8WNnH9om9v9UXBmKkTP4HJlR0EHeUfLgouvTzruKa2k9HuzFSHZwNm1VFkc64FdgSAG5BBPppR
	B6l3JbAEIS3E5BgSRmroLk7DsatImwG+gPLlm/G6pO6XRqqkRl9crO62nEy3iU+11f7q431TyU5pa
	R1j9GxR2ONYNvIYRkATL2ZzYKGx6HxjZxiBulp4mR5QKqs/ZoPsxxl1tphHWlesGw3NpMHLqLX61Q
	VB174q7V0NxCWmZ07TMTkZU7essXC26MYe8HjM4zhQKRfVZv4ghP/ubEuoEBFyIInRbbhYmh5zIuw
	T00+LaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd7r-00000009BcG-3Ugc;
	Tue, 16 Sep 2025 21:22:11 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd7p-00000009BZs-2VXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:22:10 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E98EC1D00013;
	Tue, 16 Sep 2025 17:22:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 17:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1758057727;
	 x=1758144127; bh=FNr3jSgck4Jl1pEEorXXSsO/QSdN0TeOX27XjWwmQk4=; b=
	UaKh37wlbPKHlBiGONx3UjBj5NgdojVqfo8d3QxGRsauJnwIXj2jgGCNgDCp25qa
	/B5KIWykoM13chpDfbneih6g5Zo+29Z/NtOgFFLKU0uJ4w7GtvepB2ul7AAQFB8p
	1+kvgKyD/JhPoojC2vUD/N5GPwIh9/7Lu6unmB3nhtDa0KWYVkdKBoXb5Y0s0w/a
	4WyXyWKs2RX3KC1rb66QyV1+xy6uHucOrU/iCLu+wMjBaZIApHT97VMbYdiN7IlW
	95YVLa2XxiJOGf2BYtLS89u6ElOGY+o8cr2+fyA5nEmaRc/UxmhD3jV5hYBEfV+s
	eyDA4UT/XOQN6QlG3nOS0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758057727; x=
	1758144127; bh=FNr3jSgck4Jl1pEEorXXSsO/QSdN0TeOX27XjWwmQk4=; b=E
	Z7tx/gMX+JHnfBo28xUh1LQhXMbww/GQURpZbheyiYKUde1AonfnGScS0+OYzFOv
	jzWuH0Lb28j67bJBhujQVR488bNfaWAu3EVAE9UL4pioiV5gv2ZF8/1SsnyMozGs
	acHErhAmLXUYwHlFYhBAeuCRkVz4KGg+08Ez5JOs2XPSJfIjhtI0rAbwY+iY+ybV
	pIXrasuNQRa8RkY57Gt/X11jQtj5TWkotsGWF3cNqJiX/I+VHJASeIJNCeIL6sh3
	BfsJiY4WTZSj0YvWDuSPeqieYXK4dWB9UMRWDPhPxyMajBwQCmb3BFfdNZQSQetH
	i9IqCVJ9LzbHqQJv6Sv3w==
X-ME-Sender: <xms:_tTJaAKQKp7Zx4a7W-0SuIKbrn4Bbn4qt7HlFyGLUFnS45Hr4me-3A>
    <xme:_tTJaPU3JOP9QYcDrO8NSjeqRuXYaH48mIe0V78puLRtATa_7psA-UUwPLauP5PJh
    noT7ED6IlmZQ4CLDow>
X-ME-Received: <xmr:_tTJaDZcvwkXms7lKTTYJvyhdOqy2qX2s3qBXipxcxf9KCGMawsg2CXnOsjjfkAgjI3F4gQR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegudeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnhephfekvdekvdfhtddvteehueeuleetjefhieehjeeuhfdtuddtvdeguddtkeevlefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfies
    tghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:_tTJaGwAbLGEIWQxH1_sErMKpB4r7kcgnDzjmrYpHY9WofmhEt3joA>
    <xmx:_tTJaD1zm9G09z0Bz4RuXAMs5vHrs9mDe4HL6Wkg2Q8vOtRzv0togQ>
    <xmx:_tTJaHl1f1GFfbgnQKogxvFKOQk8RaHDvyUO4u5Jt2wfqTCugEdmPQ>
    <xmx:_tTJaC-MWptvSdycC-vRg_NaG9Rd3YNHQsUMXVLnP6c_P9DPQgbnPw>
    <xmx:_9TJaPLRa3mNp1XgIDDKwGqhASuZQIht9nOJpR7B8O5flWLDdlVBYBJi>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 17:22:05 -0400 (EDT)
Message-ID: <e9b0d9c8-9117-4c75-93a7-1c334d823d99@bsdio.com>
Date: Tue, 16 Sep 2025 15:22:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
 <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
 <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
 <92bcdac9-44b1-4fc8-892a-01ef0ed0b7e0@bsdio.com>
 <3f5e82ec-d96e-4258-b117-9876313f5402@lunn.ch>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <3f5e82ec-d96e-4258-b117-9876313f5402@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_142209_844405_A6844276 
X-CRM114-Status: GOOD (  11.56  )
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

On 9/16/25 13:07, Andrew Lunn wrote:

> Now, it looks like all other aspeed-g5 boards also don't link to the
> PHY. But the driver does seem to support adding an 'mdio' node within
> the ethernet node, and listing the PHYs. Something like:
>
>         mdio {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
>
>                  ethphy0: ethernet-phy@0 {
>                          reg = <0>;
>                  };
>          };
>
> And then you can add a phy-handle to point to it.
>
> Then the question is, did Aspeed mess up the RGMII delays for g5? You
> can try phy-mode = 'rgmii-id' and see if it works.

I can't get that to work, with either 'rgmii-id' or 'rgmii'.

It says "Failed to connect to phy".


-- 
Rebecca Cran


