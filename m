Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A9C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=; b=Lgs+kDcSTrvf3kSxUYeGS9lbI6
	eU2/aOAsrVcNPh1drmIe//Bi6vodurdMtO4uOVP2Okm/p4J0v/kSPEa+pOHadhJ98Yy2FijFn6DBg
	bYRQwt16h6M+ezAB67Z4JxoLerWNrfHgdomLMNKUNl01PIzU36uAVrx3MjiZyUronCx1tg5pcXz5X
	iiiQu+jW3rj1E1Gn3TubqeUiHcaCxq7/eLT7y8mavonCc2CKEALtzjZNAfkkvADfYOBnlD4azoGA9
	eUzfhnxovUDAf9wezbP2uwC97sas2/CH1ZZEfYRW+k3OchjS5A2+rt8JWrlH+xPTvteDlbTS2q64F
	zoXpOOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lMS-0000000BOOp-3gTC;
	Thu, 24 Sep 2026 15:27:48 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lMI-0000000BOJL-1wX0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:27:41 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so1777887f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790263656; x=1790868456; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=M4Rzg0xm18uxVZICCsbRmkAB/D3ZFHPVdxaiIsNP3svQkjUQ6s+y0iZi7oqVQ5y9jN
         nlze4Jd1SvtjhIVv0vKz0XKLdiZjmKxXZfKLHoJxp9O8u+h+7PHninQH+KDqsZEJXvmG
         1QvusOuBL2U3q8qAf4Z+ABjYa+KGni/G/k6VSuQeTd5CD/1MzUeBghbjDNLoJ1fbOC4O
         VS815F6FLQIPqSi8yBloffAY7SD756BII58FfBk7NBeBn/OZQ2RqDuB24dwLN/Tb0s36
         nyAC1dRk8NNIffHF/Vu5ySgxZvFeYgVT43a5olc4p6tSE0w9B9bw74ThrogXjlVabd1K
         naUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263656; x=1790868456;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=wd22KZkfCMPnveOjgBsMXTpIXTZ7a+kWQCdk+H0oc19w6h28ZdDWplYhJfAFzz3Mnp
         AbUxuCzcJhD3Z2rXFtJlz5KMLkejf0ejv1GleNVbCK8sOzV1NTYSE8dENw27MBITuzHu
         FufsW3Z3rdWi491hsRAL6GigyoABVjeJ2IbpkMAnntRXqGlZioOXSU3k8D6XAEet/1y/
         crniw5s3M367ePGBM9wQVY3300LbbuYDUaEzikIzy7BEH8qicIn3qAOXWqPFW3LhQhng
         12eocfFHfgiTMIVOAH4yEOSzxjHgVII3WhT3cX7yZlgAgks8qiu4SaR5p0MTh9RP2dIs
         Zn9w==
X-Forwarded-Encrypted: i=1; AKwUvBwWoQt2SgLODcJhtxNRWX9xuRiwFG5/v7dfz2/0MeIlRFKOQ/o5NjNQqBSZ8DX1VMCdfb90yruAGIG4VQrIRGkA@lists.infradead.org
X-Gm-Message-State: AFuF++lcIyaaaJIJKqyLeszC2hXvxAGfqjFPZ4gl3HJ41HDSj7pkhVQs
	HtOAvTegl34mMLBPECIEAc+u547Ld6WdOB7uWsmVjOAlSuzp1ZIphkuPN4VKHRcuazc=
X-Gm-Gg: AYBFou1/87/VROo3iXt1nC52M9JUFWE0xvyrZMXENbRJaIvOKQSx3A/6ParKcOV/N7k
	raCLOWVtRASP9PieCPOYCy5MPVjN92lordiXlKNXDL+kec0TONK9ARUtKbF/slETvH3Eq0+XyD4
	DgF5dN4iQgvZpko5dtzskUoIua/btU4GAa9/ScIyeNLeHvUjBxPLL2Nh16DiMdUV8Q8TJ8DdbKC
	MPj1j+qeWMsQtWQr6yx2U9Fusl7W5CP0+4B6PHysCgQ5EYUyGRGi2+yWN9P6E+CaywMOv4MCJjI
	pjfodTtzUfk7qDHEuxWbylCo3SgMI4acRgCHONFQ6JtBVa7lMyxYRU+Ytib2S2bIs19OABrH80q
	rZQZj+DvAG7XKT5OrB014VUMewlc4bAXxptgj6u5rWMiLU1mFazXIuUC32qBFvNPZDbcnhmD+mj
	ve/D5W23Gzx5kT882Tpx3i1nJ/EYjWQrcIg3psscNrlIvAh4cYQwH6hk3t3fA82nERHLq0ArhwQ
	D2+np0UL9bHBBDDwA==
X-Received: by 2002:a05:6000:1886:b0:486:e8fa:f9b7 with SMTP id ffacd0b85a97d-488716c12f0mr5112120f8f.13.1790263656324;
        Thu, 24 Sep 2026 08:27:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm16823010f8f.1.2026.09.24.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:27:35 -0700 (PDT)
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
In-Reply-To: <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
Date: Thu, 24 Sep 2026 17:27:31 +0200
Message-ID: <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082738_529139_81FEB8A4 
X-CRM114-Status: GOOD (  16.28  )
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

On jeu. 24 sept. 2026 at 14:54, Andrew Lunn <andrew@lunn.ch> wrote:

>> I've changed the phy-mode to plain rgmii which seems more in line with
>> what the PHY actually does.
>
> No, it is much messier than that.
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
> rgmii-id is very likely to be correct, if you were using a sane PHY.

It is not the PCB doing the delays so rgmii-id it is (in DT) - got it.

I dunno what is sane or not, but the allwinner dwmac drivers do set some
delays. sun8i-dwmac and sun55i-dwmac do so, even before this change.

If I understand correctly :

"""
When the MAC implements the delay, it must ensure that the PHY does not
also implement the same delay. So it must modify the phy-mode it passes
to the PHY, removing the delay it has added. Failure to remove the delay
will result in a non-functioning link
"""

IOW when the gmac has *-internal-delay-ps set and honors them, it should
also amend phymode seen by PHY to make sure it does not add its own
delays, should it ever be fixed ?

>
> But this PHY is going to cause you lots of problems.

We don't get to choose I'm afraid :)

>
>     Andrew
>

-- 
Jerome

