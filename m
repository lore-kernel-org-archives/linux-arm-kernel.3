Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36376C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG1bOt8IUbOOdwkN9+W7WbkC/YNxezey+sMvkLFdoso=; b=0gPgcTK3eTyMxKfvl4g1Fk3eB9
	gi39KTrQADDgXH0yfWTfkajt68SoW8EpVCZTa7Hk4cfZ6XovmWihkgYmAo4cOG1sUkcEAFJcnp6k9
	4TaVbqW+/OFOUmKXd5fkwraUjLGyQRnoWfnw2r3oAe5H3vxbZXezqRssC2SY4gE2MLhlOfMqVNGGe
	nGN+UZqfGH6DXMPIhVVa+PtGvAQu1eHEhF6W/dAjeRjo4yHJF2BuM2Q9F4qpwbfaBEDyP31fU9ozr
	Q6cWwO30HuBQ9oyoo153sCqmNa5ip6Ere3mPhStRoiAzqRZobVm5IK3t8fvOrRT2k4KGPAaXINdqD
	hw66coCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqb3R-0000000Fwgt-0Nt6;
	Sun, 02 Aug 2026 18:36:57 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqb3N-0000000FwfD-3776
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 18:36:55 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca92f36c4acso776301a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785695813; x=1786300613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aG1bOt8IUbOOdwkN9+W7WbkC/YNxezey+sMvkLFdoso=;
        b=IhXwRaDb08je22l6F+6mKbSaRn4ddD4GpKUSx+OSe61uvwkxQK6tPUm8quhLQQQjdl
         AIop3Qe4aTRjW15HYeJ+r/iuk6At0j31YMmJPw2dhJeROA1Kji7C/QC2pg5Ksdyojxfk
         PRChH/Bczfv5nCUdJaOcHpDvK2FD3IlXpaY3/7iiGpOQOWDnTG/8sWXczOLDas3XxpW+
         gwSZp1o5HvjNyczYpXO7otUOk+tEkG92tjXD2kYpx/7MBA87nc8NkZldvsanGKekpTwM
         SjBumj4v+PGQJbshXVyyfcPuH6tI9WYB8uCvEWMsMA2SuwpQxxXlki9r40OjeHCHeOwc
         dHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785695813; x=1786300613;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aG1bOt8IUbOOdwkN9+W7WbkC/YNxezey+sMvkLFdoso=;
        b=ggorNxUaSCmAjwQe1F8YMdY+L6uIe22piTkj53l6BkWpMufoXlobCcFl+evHplcQZi
         7mOmOw08pnnIBrcRIOumWwE4uVcdPshdb9S6noE7B9meV0x7fqUzQ17qVnBaUpnqlxl4
         72+5iAryJJS7rUEKXzDU6aOLD9QP6KDOKFHtXm9tkQ1ndiIZfKsUW9GwMg/Gpqvc6YE8
         Sa/umm+z3vB3GUP/NiSQBkGcuTJV0cINZ9Df3AJe+eT/PQ+sQnC1UReDwxIHOY85m1SL
         N9XCnEBzLlIwfzr8fvS0I1iaWE80wh4cwzQHtBO1NlTlwHaHlLr753fFm6TjmTDkt+de
         nnfA==
X-Forwarded-Encrypted: i=1; AHgh+RrQghHbb97/i49ayu7F3sijvm8UET/UoArEGNf2ZHpNfWlpCBWf1iJbDQK+eNWWQQoH9jHczb607VRwAUmJMelN@lists.infradead.org
X-Gm-Message-State: AOJu0YwLe+Fuzi3UvtMTNybGeIvv9Pjcytdt4sDq+5S/efq4f9+O6v3F
	3Wdj6B7HtZm5NCPud+6fSTYUSij7ok3wbPGsF7XhZsf+cxYPXnqJzzUs
X-Gm-Gg: AR+sD1381dqU/tciRsWU6ZGoauZw6XPL4pR6vT4Mg3e0YVSztLzbMePp8pX7LtYtmLz
	Mddk6YT51YA2hPOMkKod9ud4hTo+DzUs6/D1PNnMpyFRATgdtaAnYLc/cFhxLNqfnuvkxWhEmfY
	Siufo3KG0x9jdMQBRF1FQu8YhcdXfckhxo9ZqHjUOoQBLI6RWsD+qwMPxZs9UUiX1FJvOoKSO5r
	Qdkaooh2XB8hgBNsb/mtTTgWB0WGkRu0/6REA5OJAHD/6p1TxPuciF8UC7rCqCDxnVF53FQoxjZ
	nb5q/64+UxCWV2+puWUw+dUPEEIBXrN6N4AKlBu8GsfybKo9CIalt5EDMABUruXiEgfpLmBEIjm
	WBSAWmxzgY1OnxAHxVo0Ei3Ji+0TWMAY7YSqzVzKnhaw6Aioh1O+7W1H9y4PUFLwf137jGom0r/
	yS5Lo5Wmt3WYEpcbEIg3BdThdh3AdndoxOgF1GhIfrwRhRaUCMEhshcw==
X-Received: by 2002:a05:6a00:ad1:b0:847:9518:a6fe with SMTP id d2e1a72fcca58-84ee4824d25mr6884770b3a.26.1785695812531;
        Sun, 02 Aug 2026 11:36:52 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7ff7sm2615191b3a.49.2026.08.02.11.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 11:36:52 -0700 (PDT)
Date: Mon, 03 Aug 2026 02:36:43 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_05/10=5D_arm64=3A_dts=3A_rockchi?=
 =?US-ASCII?Q?p=3A_rk3568=3A_add_XPCS_and_fixed-clock_nodes?=
User-Agent: K-9 Mail for Android
In-Reply-To: <4106e359-aec0-4f38-b74f-e9757a48eebb@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-7-coiaprant@gmail.com> <2847036.GUH7pLUipS@diego> <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com> <0e9d16df-7332-446b-9321-ce3de3111ffa@lunn.ch> <CALj3r0guMmNRN4EBbKz7stPNMSqkLBvms643YXBEDMzqHHM=FA@mail.gmail.com> <4106e359-aec0-4f38-b74f-e9757a48eebb@lunn.ch>
Message-ID: <2810D16E-6D32-4D01-846A-65A853279603@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_113653_789821_7160DD48 
X-CRM114-Status: GOOD (  25.00  )
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

On August 2, 2026 11:19:37 PM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> wro=
te:
>On Sun, Aug 02, 2026 at 11:28:12AM +0800, Coia Prant wrote:
>> Hi Andrew,
>>=20
>> Thanks for the detailed questions=2E I've looked into the clock tree
>> more carefully=2E
>>=20
>> > Do you have documentation for these Combo PHYs?
>>=20
>> Yes, the information is available in the Rockchip RK3568 TRM
>> (Technical Reference Manual)=2E
>> The relevant clock tree details are also mentioned in upstream
>> discussions and patches=2E
>>=20
>> > Can these clocks be enabled/disabled?
>>=20
>> The 100 MHz input clock to the Combo PHY is a prerequisite for its oper=
ation=2E
>> It is generated by the SoC's internal PPLL and fed to the PHY through
>> a fixed divider=2E
>> It is not a gate that can be individually enabled or disabled by
>> software; it is part of the
>> PHY's fundamental operating conditions=2E
>>=20
>> > And how is the Combo PHY fed with a clock? Does it have an external o=
scillator/crystal?
>>=20
>> The Combo PHY is fed by an internal 100 MHz clock derived from the PPLL=
=2E
>> Specifically, the PPLL runs at 200 MHz, and this is divided by 2 to pro=
vide the
>>  100 MHz clock input to the Combo PHY=2E
>> So, it does not use an external oscillator or crystal for its main
>> reference clock;
>> it's generated internally by the SoC=2E
>>=20
>> To summarize:
>> - The 125 MHz clocks (xpcs_gmac0_clk / xpcs_gmac1_clk) are outputs
>> from the Combo PHY=2E
>> - The Combo PHY itself is clocked by an internal 100 MHz clock from the=
 PPLL=2E
>> - This is all internal to the SoC and does not involve a board-level os=
cillator=2E
>>=20
>> I hope this clarifies the clock architecture=2E
>
>So what is the purpose of the fixed-clock DT nodes?
>
>If you want to describe the hardware, is the PPLL in DT? Should you
>then add a fixed divider to give 100MHz? And then a fixed multiplier
>to give 125MHz?
>
>   Andrew

Hi Andrew,

Thanks for the follow-up=2E

The fixed-clock nodes (`xpcs_gmac0_clk` and `xpcs_gmac1_clk`) serve as
clock inputs to the GMAC controller=2E From the GMAC driver's perspective,
the 125 MHz clock is a fixed, external input=2E The fact that it's
generated internally by the Combo PHY from the PPLL is an implementation
detail of the SoC, not something the GMAC driver needs to be aware of=2E

In the device tree, the principle is to describe the hardware
interfaces, not the entire internal clock generation pipeline=2E The
PPLL configuration (200 MHz) is already set up in the CRU node via
assigned-clocks=2E The Combo PHY's internal PLL that generates 125 MHz is
part of the PHY's own operation, not something that the system clock
framework needs to manage or represent as a separate clock node=2E

If we were to fully model PPLL -> divider (100 MHz) -> Combo PHY PLL
(125 MHz) in DT, we would be overcomplicating the DT for no real gain=2E
It would also make board variations harder to handle (e=2Eg=2E, if a board
uses an external oscillator instead of the internal path, we'd have to
rewrite the entire clock tree)=2E This approach is consistent with how
other similar SoCs (e=2Eg=2E, pcs-xpcs-plat) handle fixed reference clocks=
=2E

I think keeping these as fixed-clock nodes is the right balance between
accuracy and simplicity=2E If you still have concerns, I can add a comment
in the DT to clarify that these clocks are outputs of the Combo PHY=2E

Thanks,
Coia

