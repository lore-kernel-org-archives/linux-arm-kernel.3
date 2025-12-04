Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA72D20682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYBPcepONpHvCLLvCGFW5DmNEw2yqgttigWufQoSyCA=; b=FeCjp7y4XnnWNEJdGdtWA/gKh5
	n8VGy+cqqmREnuIdsUFyriO/WMlZLAB6sToCnjGAvOKQ3+pGZGsQ/0dygC9hsgSiCmaQ4OFXpMT0f
	szdsFHHZX5DbUMy/mlTVzYZgltn8k1/AKJ5N8JK0LkUYLVWzmaCDfYKllVE6u5omgBO7mDijHbrUk
	Ouq1P5hs16fO/uGpZ9Y6Xy6RnkaaErGDxB0YwqcB/mekGV2Z0i3hWcXAMGXIJIRMwZGr6twu32Zqq
	yqzSC0uwefLpIrKW4ZWCS0PJ3Q90SN8qQzJf61Z2K/5f++b8XD+QZbWLC8EkATJWsVLoVZPWDZqPq
	8opl1/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9CH-000000082Zj-0mfU;
	Thu, 04 Dec 2025 13:16:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9CD-000000082XE-3Hi9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:16:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779cd413b4so520075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764854191; x=1765458991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYBPcepONpHvCLLvCGFW5DmNEw2yqgttigWufQoSyCA=;
        b=Ukw9bCaYymfV9MynHtWxJMYAs1C4vpLkF8oR8zXEPyjC1AzrwI0BTq4eg66WiFZQ1z
         13eRFLMGFWZYL+1WbE0K3pgcpTach9OO13a5inAieQakynOsn+NoyTjoXHplk3WONYyy
         Y17N7pqNdTm2cmMfSnLWVRsJyzZ8Jt/5LxXICKfvDjy4NDAYOpPP/lKo6KxMBaV3MWZZ
         qTFZ2DBLtdBjxoFE8vSpuedZ6B65fx0ABY+Vp1jvt3nJsk3WIz27Lr57Q0cGBAuAbb6Q
         aJ/OkYT1j6VmKWZCJjQMaZhGtnP4KNJHA0p/mnYSX+ILWl7HtnVaXEcuZ29T+n19kSp+
         9qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854191; x=1765458991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYBPcepONpHvCLLvCGFW5DmNEw2yqgttigWufQoSyCA=;
        b=Cv96BEr545xXa55IbQ2ObluI6YjLybP9y+gmsBqkkoc2dS3pzjknXjxT6mb8YB2xr9
         dG2hSd0zlM2aWt9wdf8fyfk6N/Op2H171sTjNJh9Fc5HahZ+6B7FpRolPYYCTEwXjPSk
         hmlcFLQN2kWqn2LjwtTF17ZdfnIjR7n0ESpxn9EWcBzWgVXcKPtZygBv/AAYo89TnkVs
         ZDd82EOYfS3tliS4lEZ5vM7UWB9EpegXF/LzwpEEZ6O8jouq/KqnNOFq8rtJBfOFzcYq
         IDY/Gbe+kMCitPZdWB/6Gmkt/NqCtxOgsTVGGsUyZNq7baEIfTOsMp8DYqDSDafpxZrL
         5uog==
X-Forwarded-Encrypted: i=1; AJvYcCUH/BhJcTI0GrwSKWP+NwfvoHJtVhW6/QAKV/VwQk9b5YqGaaeXT0M6J7E9SwRS7TI2IgZfKpksmi+W1++J3QvW@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQZI2RCOYrnSnRZr66SChQWdhRR8QzFt4QDiGR7KazFI/G3Du
	76fRqT2bOWLzQ4hXyvQwffpg1/m1AHHvA96t6usRmCdSY53uGJ82QUBX
X-Gm-Gg: ASbGncsMsRrI8HWc7W6nN7DLnvb23+F2MCJHwxs0l3dr6/P0WT8CNskd1peBFwZKP+1
	nV8O4NT8vHJiSGXZ8UjeM4JYbw0Q2jvNY57mcvXbYXtBcXUkU9JtUAc1akyKb7TybV43lIDyYW8
	W3affWyd8Nrblwt4WMrw+OEPr1UZJTcHWayM1nY2ntjNHQBRJl/XNP4O5lOL3P/mKZ3MMXu/0Rj
	nHMVevvMMZmOFxvUvvh5nPFOmCDMaS7c7dAhzk9TPKaqt1YHPo8QNKfXcix8k/yAQmIZyNhmPam
	4ZkVEgd/EMWDSpo9+xcfW0ERRMkj4/rZe2hXtxYISXM65rFj9J9jZRMGCkze6kfzjnEthzIB1ZC
	CH7U+tj7GF55hgz/cteUbJSS+W3uiDFfuEN9kP7BvpRITjO9qcbQyy2rqWodXf6Y1ByFh28K6vk
	gQ7SU=
X-Google-Smtp-Source: AGHT+IFuZ7+wVEvS7Cd555ZEuGrZTUFUukCrdVsUSca1c9TMkHOJ8JsWJb68xbR/p3vOu4Jb3bTkMw==
X-Received: by 2002:a05:6000:2f86:b0:42b:3e0a:64b9 with SMTP id ffacd0b85a97d-42f756a2d9amr3255858f8f.6.1764854190568;
        Thu, 04 Dec 2025 05:16:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9032sm2926996f8f.1.2025.12.04.05.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:16:29 -0800 (PST)
Date: Thu, 4 Dec 2025 15:16:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204131626.upw77jncqfwxydww@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS7Zj3AFsSp2CTNv@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051633_846800_A6BF705F 
X-CRM114-Status: GOOD (  41.66  )
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

On Tue, Dec 02, 2025 at 12:20:31PM +0000, Daniel Golle wrote:
> On Tue, Dec 02, 2025 at 12:52:44PM +0100, Frank Wunderlich wrote:
> > Hi,
> > 
> > Am 01.12.25 um 08:48 schrieb Krzysztof Kozlowski:
> > > On 30/11/2025 21:17, Andrew Lunn wrote:
> > > > On Sun, Nov 30, 2025 at 10:07:31AM +0200, Vladimir Oltean wrote:
> > > > > On Sun, Nov 30, 2025 at 02:11:05AM +0100, Andrew Lunn wrote:
> > > > > > > -		gpiod_set_value_cansleep(priv->reset, 0);
> > > > > > > +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> > > > > > > +		gpiod_set_value_cansleep(priv->reset, is_active_low);
> > > > > > I think you did not correctly understand what Russell said. You pass
> > > > > > the logical value to gpiod_set_value(). If the GPIO has been marked as
> > > > > > active LOW, the GPIO core will invert the logical values to the raw
> > > > > > value. You should not be using gpiod_is_active_low().
> > > > > > 
> > > > > > But as i said to the previous patch, i would just leave everything as
> > > > > > it is, except document the issue.
> > > > > > 
> > > > > > 	Andrew
> > > > > > 
> > > > > It was my suggestion to do it like this (but I don't understand why I'm
> > > > > again not in CC).
> > > > > 
> > > > > We _know_ that the reset pin of the switch should be active low. So by
> > > > > using gpiod_is_active_low(), we can determine whether the device tree is
> > > > > wrong or not, and we can work with a wrong device tree too (just invert
> > > > > the logical values).
> > > > Assuming there is not a NOT gate placed between the GPIO and the reset
> > > > pin, because the board designer decided to do that for some reason?
> > jumping in because i prepare mt7987 / BPI-R4Lite dts for upstreaming when
> > driver-changes are in.
> > With current driver i need to define the reset-gpio for mt7531 again wrong
> > to get it
> > working. So to have future dts correct, imho this (or similar) change to
> > driver is needed.
> > 
> > Of course we cannot simply say that current value is wrong and just invert
> > it because of
> > possible "external" inversion of reset signal between SoC and switch.
> > I have to look on schematics for the boards i have (BPI-R64, BPI-R3,
> > BPI-R2Pro) if there is such circuit.
> 
> I'm also not aware of any board which doesn't directly connect the
> reset of the MT7530 to a GPIO pin of the SoC. For MediaTek's designs
> there is often even a specific pin desginated for this purpose and
> most vendors do follow this. If they deviate at all, then it's just
> that a different pin is used for the switch reset, but I've never
> seen any logic between the SoC's GPIO pin and the switch reset.
> 
> > Maybe the mt7988 (mt7530-mmio) based boards also affected?
> 
> There is no GPIO reset for switches which are integrated in the SoC,
> so this only matters for external MT7530 and MT7531 ICs for which an
> actual GPIO line connected to the SoC is used to reset the switch.

I get the feeling that we're complicating a simple solution because of a
theoretical "what if" scenario. The "NOT" gate is somewhat contrived
given the fact that most GPIOs can already be active high or low, but OK.

If this is blocking progress for new device trees, can we just construct,
using of_machine_is_compatible(), a list of all boards where the device
tree defines incorrect reset polarity that shouldn't be trusted by the
driver when driving the reset GPIO? If we do this, we can also leave
those existing device trees alone.

