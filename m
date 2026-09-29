Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE3CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=; b=KKYHHsKTMJ+0pk6y+LL91FDZHl
	1E1ZXN3B4a547Ph/pJ3KLqGcnEJ75TJ6eTWTBtM5cb0frTdInS7irA77zlIQbUtBZ1X8X9mnf1Vtp
	fPt+JvB5Lcfa76PQSW7uVoS8kQl2lpteGzzOMqsnp3I6v41hcLB82G3X4bhMMyjHGfXxEJiF6o+oY
	NZrNyJ8tiE4nCL8xXSduyAVhoQz+Us+zk1dR25sAT2pk86JyfmYPxUzXNbWMgGkdeloVzE/sgHzAu
	I8J4JxXadMd+AGJBVRBQQjTQrDYdj9B5+nStv4pRx7XX1g76Fecuu2M2jjQ9A7oYYYQJ5cEu0w74x
	jfGIye4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZPS-00000003tPW-0NDr;
	Tue, 29 Sep 2026 15:06:22 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZPO-00000003tNY-0gsM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:06:20 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso3392852f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790694375; x=1791299175; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=PDZtG6i4J62UlieR/XuDSXqwBA1a0quXRb1wYi7LVuGNHQDm7hclHvmJJXtSzs8Hc1
         FqD3+CJ+UYttsrW8J+/R203/aQJQqlM+NfkSv0EvUZ/vcA0/DUNaJ4+DNAm0+UAa6uog
         /E9IZLg4NU0Usv8V06mZed/HWBlZ0LjUBu2p30atF5IwdAe2RbeSatBATHXYI7RLDkWX
         futPPwUu9UCeN7eospbzsuU5op8jAz8VGrfeu2P9Joqg/g4QG9fmehsEg9LUoAKj23PW
         rhKSGFAAS1hBrNPM5ePmLm6MmajvZ4I8+tHb42smDf1wf3S4qyYUzh1rLJKMEuqSeZqF
         EEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694375; x=1791299175;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=rxN4Syqq4fC3fudU9Qk/xdq/f2a7foulFdfJXkkdDpY2ZlWRq6u6fc9dw917zw8yhy
         nQe9veDFlNr7c976mf1Avl8QXX2ov+FlW9Ixy7xEqsLfZ8XSTiFL5mENPJq0NLOOXNSl
         BnXuO24NPMHSqgwVwfm23xRarT9t9CcPqRe0RHmqx7xJjZ/HM/XnJ9ZYUbuNRRiN8pSn
         26Kqw817Dvy7qQ7UuLP5xfRlHBy2FdrFgJah3bhSQZ16UIvMpWzqAtDBWjG1lXhIdCdx
         RLBdoSDJOxrn1h1koryNnIjpuurX4B+KoDdCuYdABB4Wxa6UcO5xbeo//6ixp29t0giJ
         YZkA==
X-Forwarded-Encrypted: i=1; AKwUvBzKPkEahFFA5GUvZVQNUBvVVT1OyS0sP9h++V0raPLtuTlAtdewUV3Uj7lw1ZmfaHyej+h41xQHOSE1im4slNbZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKe4gW3hpT+bGssV0fz2d+3iAy/AynWg1/SGDEW64S2fh9xq1jj
	FXz7UV8eztbkJEZymb0fOomqzBHOgN8/z1LT4DPwk3trpiPAGq0U7a+EIHK+SoIxDow=
X-Gm-Gg: AYBFou2KgXS9IN7bRMvzQYGNpeyCnSmWg9v9eYxjM68ASBgPnCj+X251LPtelu6mY78
	jl4h5St99xlMwqf/EcBE7HcyBIutCCJgkj3S2a4cbtvDpJVo7b9OxKugYBTEGcRMLgDyKCO7Vyg
	LqfVX6f9gc9UUDnFPPQ6j3JOwX568A18gaR4F2uzi7dcW3w6y/albuY2WQ3ArdSy+Z55BbcP7I/
	ObtQK5j0EqU0drkKZ3KDMaSVSqWhevxZFvsZJiJJzACRGnKzt4bLYCPnjRBCJz20gybXBiFD3mg
	5INrBgbtSyl4oYCmh2sRCXXg77OXhMnwy5v7Hvq68by3Nfaqlfqlu2rEfe+BPr5rNPI4K9tSo0f
	xZQJMum6kL9x9CJfdBV1KwWearkIBbLGSmNh3yXKqU975PfUnSBe3lLVT3mzLPSzWvHJiEIStj1
	s8B5UzsRHj+4IZi4FUhzvCJF3wCzRBN9jIOXsJLdSdghbIBsBJ8hFZByhutcAD4Fz6wgiNqZpfl
	tt58MEdqqzzSsRlV1sesECQXbZIag==
X-Received: by 2002:adf:e19c:0:b0:487:799:c04a with SMTP id ffacd0b85a97d-48872a5c8dcmr29383832f8f.3.1790694375596;
        Tue, 29 Sep 2026 08:06:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f8edebsm4909091f8f.2.2026.09.29.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:06:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
Date: Tue, 29 Sep 2026 17:06:14 +0200
Message-ID: <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_080618_517993_75341177 
X-CRM114-Status: GOOD (  29.03  )
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

On ven. 25 sept. 2026 at 21:45, Andrew Lunn <andrew@lunn.ch> wrote:

>> > You need to differentiate between small fine tuning delays, and the
>> > 2ns delay required by the RGMII standard. If the MAC is just doing
>> > fine tuning, you need to still pass PHY_INTERFACE_MODE_RGMII_ID so the
>> > PHY adds the 2ns delay. If the MAC is adding a big delay, you need to
>> > pass PHY_INTERFACE_MODE_RGMII to the PHY.
>> 
>> The PHY is one concern but the series here does not really address this
>> topic. DTS and board specific concerns will come later.
>
> They are all interconnected. When phy-mode says 'rgmii-id', it is the
> MAC/PHY pair which needs to decide who adds the delay. If the phy-mode
> is 'na', how does the MAC know it needs to use RGMII, not MII, as you
> said.
>
> We need to keep the big picture in mind, otherwise you could go down a
> dead end, and a dead end which makes backwards compatibility really
> messy.

I agree with you with on all this. I understand this particular MAC/PHY
combo is sparking this discussion, Let's sort this out properly, no
rush.

I'm merely pointing out that the problem is not introduced by the code
submited here. Other MAC can set delays, Other MACs would need to handle
mis-behaving PHY too.

>
>> It is really just the MAC. So, how does the MAC is supposed to
>> make the decision to amend the PHY mode ? is there a threshold you'd
>> like to recommend for this differentiation ? 
>
> This is the first time we have had this condition. So it has not
> really been thought about too much. Maybe 1ns. That is the middle of
> the 2ns required by RGMII.
>
>> I'll try to reach out, just in case. I have the schematics but without
>> the PHY doc, it does not help much.
>
> From that i assume you missed the other emails. Somebody from ARM give
> a link to the data sheet. It documents the strapping. Search for the
> patch adding the PHY driver, it is in that thread.
>

Thanks for the heads up. So if I'm reading the doc correctly the PHY
adds 2ns
 * on RX if there a 4.7k pull-up on RXD0
 * on TX if there a 4.7k pull-up on RXD1

The schematics for the board are available here [1]

* 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
* 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?

I've cross-checked the HW, the resistors are actually fitted as the
schematic says they are.

With the HW setup, the MAC setup that works for me remains

	tx-internal-delay-ps = <1620>;
	rx-internal-delay-ps = <1800>;

I know it is not aligned with what it expected but still.

I've tried with
 * rx-internal-delay-ps = <0>. No Rx.
 * tx-internal-delay-ps at 1800ps, it still works with some TCP retries here and
   there on iperf3. 1980ps stalls after just a few packets.

[1]: https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf

> 	Andrew

-- 
Jerome

