Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFB0C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Krj4nGjzLocure3/yPi5CdWbov31+36/X35bUtBK+Q=; b=wtjOeuRoxD4w1W1MD9kjxkGaC6
	3QapNUqtfgzi4SRDMgnlQqyfI1wwNCcIIEmrj++9gypJyowi3KgGb1PwyElNzEn5WJO0RzECeq6T3
	GCyMangQmmEpW4L6JfLWiq14kCLHcVBKhFcADJ8uegPSVuZ4GNlvo/ULva0Q0uf2d9IYbx+DDXcfW
	xUVPvLM7iAMmZ0/g7Jc67p6KuQ46b95PfLJTdHNG/EVjkekvImvqZ36FQAp142vl4I1xihFFSoS8z
	YQ/LVoQrNE0p5sAURAsjwihtlfl00wVobTI1ThQe0ymRtoIKywvS9XBHkrzXu23oCbnUmthAN7UQJ
	HR7gFeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1Ga-0000000Cu10-2nYx;
	Fri, 25 Sep 2026 08:26:48 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1GY-0000000Cu0B-2sdD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:26:48 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso301748f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790324803; x=1790929603; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Krj4nGjzLocure3/yPi5CdWbov31+36/X35bUtBK+Q=;
        b=VQPBxd3TTpIQgKT722wtONS3amq+oKSXeh6myEp+i8UdSEbHP+QzAQ6t1xXYu0Tgoa
         7Oh8BkpZTxs6cZYPm8XusB4lih4FJyxxmRj3p4vVc2r8ckYPyNheq/pmfVU50kSEEGqb
         kdqO2LM+u8EUAk3cjHocmZ+iX77gc82VcFEjkc0kxJER/MCVgDCLW1/2Yx0hXtrnPmfi
         CfQIXkf8UsDuXErGcT68EhHust7JGIvzr3NKejumExcBMGKE0YpcdzKC+bLA0PZOwuZO
         uW/5YaAZH3ZKxExFQfP6IMWeYjAfhnAoUYq2K7o+vasFN496f92IT8agjTKvtA0fafa1
         6yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324803; x=1790929603;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Krj4nGjzLocure3/yPi5CdWbov31+36/X35bUtBK+Q=;
        b=15Ys0lXdmtpqDM0msJprw7iJ37FDs2qtFaR3qHVSCb6cAuDfzDG0vuuSc2nEYaVCst
         qvP8/t4xcb0ybsi9EbXq/mopKvizPTOjkYVq5epQ8cvbMrSj7J2mxeDtmpcvUzMf/72t
         SkAlJlkVPkE0zRgL2OGuBK9SAyg3MtqbRW6Ax+UNyf6pS/DwZMy/oB1CPJ99K4nTkewl
         4lvNqKNFw05+J3TyheOCUGH/uXH4GuR5Sf8XasNSwCPQ3y2fL9Tqb5o5Tcy6Fe/LYikX
         C7CvN2KjPF52gU3Uul2gv6doxP2bcSEgZYXsBg8F/gclJ0rIV4nDuRj3lyp+wEbUyU7P
         IZ/A==
X-Forwarded-Encrypted: i=1; AKwUvByOdSqPlAZj6yRxMesYYuFJxq7JTm/bIbdsoRIYJAHfjwmO4BTMO/9rE7LUj8U8KYOGmLFzlbFamzI3Ey17eaT7@lists.infradead.org
X-Gm-Message-State: AFuF++kkSqCWCu/rsTF55t1aPkx3w1KEi6v2BG9pNjL++jlguXPf6eIJ
	ygO0ifAGlAbSqrxOJken34Y+/fNgcBV3LRmF0gXvY/Dv12s8VhWu7PhaCAUQj1MMAbM=
X-Gm-Gg: AYBFou1iBx+69Y39vkDwh9nf9IRc4GSsUR8Fbp/nmwM4x6NVrHcgfBuHdc15H7Np7pT
	rDXe2KsafKtKYS91Ef7Y2gDFNUSJ+zcmirkY0h8cLcVmaNjoD8gGyfRX20nM44B9xsDbG+NU8J9
	pKW/XM+Mpq5EGSfPvy588OzMf28Ero3DO1z8vCRSiOEQ0iElLPmgNyCT9AztTzy2YnMoKUiTGMd
	sjDyvmtAqlv9qrRCsnO/KBOrmc+cF0BuNyh5dN9AwG8O46prt1UzWKm8cId6oV2W2nn2QUOyVw9
	zFWZYnk8XqkSITWU6dcBQEzFDX/yLvTuGfXkfTl4wfaAtqDCypakhGGUvU4eqfS5myZ5Q+mGks0
	ARXleAnAvKn3mchaKCVVsabH2nu+R2lkBeuKz1jw04mm+h9hjog2ux5a7CTWwHAlfX833/03f6a
	STkTQbq2KOgD3s/qrPFnL1lL1UvGRHxYT0Yhh6VRldSnI37/uxAY90PcWdWMZqZjSredWiQI7ac
	XjXGOCrqOGEnG8FuQ==
X-Received: by 2002:a05:6000:186c:b0:487:27f6:a4dc with SMTP id ffacd0b85a97d-488716b2633mr7795054f8f.44.1790324803297;
        Fri, 25 Sep 2026 01:26:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm7326486f8f.8.2026.09.25.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:26:42 -0700 (PDT)
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
In-Reply-To: <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
Date: Fri, 25 Sep 2026 10:26:38 +0200
Message-ID: <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_012646_752343_FDA22AB9 
X-CRM114-Status: GOOD (  43.87  )
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

On jeu. 24 sept. 2026 at 18:02, Andrew Lunn <andrew@lunn.ch> wrote:

>> It is not the PCB doing the delays so rgmii-id it is (in DT) - got it.
>
> Yep.
>
>> 
>> I dunno what is sane or not, but the allwinner dwmac drivers do set some
>> delays. sun8i-dwmac and sun55i-dwmac do so, even before this change.
>
> As the document i linked to says, doing small tuning delays is
> fine. We strongly prefer the PHY does the 2ns delay, if it can.

Understood.

>
>> If I understand correctly :
>> 
>> """
>> When the MAC implements the delay, it must ensure that the PHY does not
>> also implement the same delay. So it must modify the phy-mode it passes
>> to the PHY, removing the delay it has added. Failure to remove the delay
>> will result in a non-functioning link
>> """
>> 
>> IOW when the gmac has *-internal-delay-ps set and honors them, it should
>> also amend phymode seen by PHY to make sure it does not add its own
>> delays, should it ever be fixed ?
>
> You need to differentiate between small fine tuning delays, and the
> 2ns delay required by the RGMII standard. If the MAC is just doing
> fine tuning, you need to still pass PHY_INTERFACE_MODE_RGMII_ID so the
> PHY adds the 2ns delay. If the MAC is adding a big delay, you need to
> pass PHY_INTERFACE_MODE_RGMII to the PHY.

The PHY is one concern but the series here does not really address this
topic. DTS and board specific concerns will come later.

It is really just the MAC. So, how does the MAC is supposed to
make the decision to amend the PHY mode ? is there a threshold you'd
like to recommend for this differentiation ? 

>
> If you have the schematics, it would be good to confirm the strapping
> on the PHY, and add a comment in the DTS file about what is going on
> here.
>
> The other option i hinted at was use phy-mode = 'na'. I'm still
> considering this, it has some advantages.
>
> The problem with passing PHY_INTERFACE_MODE_RGMII or
> PHY_INTERFACE_MODE_RGMII_ID to the PHY is we have no way of knowing if
> the hardware is honouring it. It appears the board you are working on
> does the opposite of what we would prefer. I guess there are going to
> be other similar boards, but are they going to get a similar level of
> review and the issues spotted? Are they going to end up passing the
> wrong PHY_INTERFACE_MODE_RGMII value to the PHY?
>
> By making the PHY reject PHY_INTERFACE_MODE_RGMII* it makes it very
> clear something odd is going on here, and care needs to be taken. It
> will be very much in your face for DT writers, so they are more likely
> to get it correct.

We do need the information that the link is RGMII (not RMII or GMII) to
setup the MAC properly though. Aside from that, It is all fine by me.

>
> And if in the future we do find out how to control the PHY delays in
> software, boards using phy-mode = 'na' are safe, no change. Other
> boards which got passed review could well break. Been there, done
> that, don't want to repeat it.
>
>> > But this PHY is going to cause you lots of problems.
>> 
>> We don't get to choose I'm afraid :)
>
> Yes, you have just the first victim.
>
> It would be nice if somebody reached out to the vendor and asked if:
>
> Can the RGMII delays be configured in software?
>
> if not:
>
> Can the RGMII delay strapping be seen in software?
>
> If we know the strapping we can at least return EOPNOTSUPP if the
> requested does not match what the hardware is doing, and we get a
> clear indication of a problem.

I'll try to reach out, just in case. I have the schematics but without
the PHY doc, it does not help much.

Just to get back on topic, The problems you mention here are more PHY ones
when net support lands from this board in DT (I'll remember to Cc you of
that one when it comes)

For the MAC part here (and its bindings) it does not change anything,
unless I'm missing something. This series just adds support for a
another MAC variant in an existing driver.

>
>     Andrew

-- 
Jerome

