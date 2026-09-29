Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20122CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gliMXdJJkSbMhSXEgRAl5Ekvovgp6Cfw/QE4Z+KNG5E=; b=zog+40uaanuLX5iv1boZoGh+8r
	59f9RFblYhz79WYGjrjH90xuojDAHOqUj+3ePumuf5d0lLh5G4SDewSoP8gNz7zem/KGNv10frett
	MV+12Rr7uUAeB0sMV7K5kuaGNql8YHrtiFzwjRV6xxxczFbVNbqfuIsRCI0p8d9JsEhPUyqIa6ohX
	+pq0fnKjRMMtzKG2ZArfm2pVrQFMbpfajx1x/iKS8moVpfLNgK9a7sS5PTaqeR1JogyyNHxusf0gf
	r2VP5iGfjBrPq0gLZjFzyCfFXCCvOVdHzFcv3pt8ZOWI5hz/Bqt4JBYXOc1MBNgloc17uBqQ0l7+B
	sa+22GlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbQY-000000049oK-2Nwt;
	Tue, 29 Sep 2026 17:15:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbQV-000000049nV-2W74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:15:37 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so28615025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790702134; x=1791306934; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gliMXdJJkSbMhSXEgRAl5Ekvovgp6Cfw/QE4Z+KNG5E=;
        b=IBCdT73KYWpJNrYOkhyMz+lW7N/hZ2y088NYPc5stFgHoQvNUDtOcZmVFAzkJu5hW/
         QCMkCeESLTKt06yYJ1GUxtf+/mW3Med98mSZ/dGHUGJVYbEbUO3NH0/OTdy+anP65m7I
         6KEoJeBmuw6W+ZFRGeKSJQ3BXLtLMtf0C46HpHtij1XLKidmp80bKVutU+6x8F6tFZOG
         ngNXQuZZLeiPGkXrkwb6x/C/BESMwyVhhJgsziUq5+rNNBvbPxY8pGkwd2fI5DquwM10
         JcQlOQ4eqVYlHsZtiLCHfvWtggLqd8XdpGXU0Fs/fd14hffU4h8A/tzS4+acJRmKPl7y
         kPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702134; x=1791306934;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gliMXdJJkSbMhSXEgRAl5Ekvovgp6Cfw/QE4Z+KNG5E=;
        b=0I9Z4hHjLQzs0wVAH8Fjs6xkJSsiAfhmmn6cHnVVeqv78wPFElsW74V6biYrjIpqK3
         idYng7PkREN1L83H5T2A0WHhBWqHRuQnoc4GRMkIeOuvFRuFvkXDt3lHp48A811DvcV3
         +d9vUYhXtDaNJqQuq9bhtLGMhDR1GUfhjEXWOCI39X35HbzqFPJo8LCdPcY7IBNgnFQM
         Fwh9Gqa5uPubD4GLXkPb2dsOlo+S7Qpj2NKUp3KroFN1IdwaPv2HeWPnBNuT9NFwGpbj
         hwgNpE37kxAs/x8sby9MavhATvEFK05ZN/gsK28FDNogbCZiBxg3UgJORHe9Ut4FwjHw
         SXNg==
X-Forwarded-Encrypted: i=1; AKwUvBzfMQur/EFzUYYiOb6UpHuXQ9g9kxLb1fuh2qugmCNoqAfhr+/EmxAemYMi9oAJX58sm8r1ZflfAV3E0PUQQJ5y@lists.infradead.org
X-Gm-Message-State: AFuF++k4IHmmfGWcz3b2S6FD0N/q6Ohq8jbAMdJ/Z1ka35T7sIxLT1vr
	AWQfdpXUmOlHLEC4QPJHONoRu4T3927l45OAlBNTZicVGGmYho9u+NQEmrAO5loHlWo=
X-Gm-Gg: AYBFou3+KO/74sdgM0+0Ubqn2y2PjP6EcxTYKVlu+jwo97x+Z6OH5LWw8MjD/zJ/WmT
	jHL6hNJ+BKOmZiO81Dgy0fRpiTf/ZGRzOOzdEwxTRDZmPQblwxVrY8Q5k3kmQKQ9wi+kuLA2L87
	StQRm7lxvTBJv1KaYgqqAVz7voNqqMRHcsWEzkWMtgpFzwp/BKE6Oxg3Qn53LkK6fy9P731iRzg
	FdSsfXDso9Tzr++MTCdnWKIZgeGl15gFNxzr2QoSYphmLPGpjdV/G+gpzTAmoVunA7SPwsIJhpX
	bZahy2jByDsQJKSq/qqCOTWJ/O47XzsObPVS/5GGmHNAUyHl8WqCev9cbr/EM8TUEAi40fNamu/
	igdhm9yr4DxRyU9VatUmXUEy1MZWBfI7rZIe412olc6BOmKg623GkDjeROjpTbjBBsQAHNcr64S
	Frits/AGep8CltVP6MzikgD6oYS5LxAU3HobymrqTjHKZhdcFVQAvOInHdSpYHt1lFFkdCGh7cY
	Mf6P6zWgTqFo8OvwQ==
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr125086635e9.9.1790702133757;
        Tue, 29 Sep 2026 10:15:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm101113665e9.13.2026.09.29.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:15:33 -0700 (PDT)
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
In-Reply-To: <93870bce-b18e-4eed-a9ca-1d01313c61a7@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
 <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
 <93870bce-b18e-4eed-a9ca-1d01313c61a7@lunn.ch>
Date: Tue, 29 Sep 2026 19:15:32 +0200
Message-ID: <1ja4p03rnv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101535_655415_CCDCE62C 
X-CRM114-Status: GOOD (  24.66  )
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

On mar. 29 sept. 2026 at 18:10, Andrew Lunn <andrew@lunn.ch> wrote:

>> Thanks for the heads up. So if I'm reading the doc correctly the PHY
>> adds 2ns
>>  * on RX if there a 4.7k pull-up on RXD0
>>  * on TX if there a 4.7k pull-up on RXD1
>> 
>> The schematics for the board are available here [1]
>> 
>> * 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
>> * 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?
>> 
>> I've cross-checked the HW, the resistors are actually fitted as the
>> schematic says they are.
>> 
>> With the HW setup, the MAC setup that works for me remains
>> 
>> 	tx-internal-delay-ps = <1620>;
>> 	rx-internal-delay-ps = <1800>;
>
> These values suggests there are delays on both Rx an Tx.

I did not mean to suggest :)

To be clear, we have no control over the PHY delay.
The strapping/doc says the PHY provide 2ns on Rx, none on Tx (presumably)

But I must add 1.62ns on Tx and 1.8ns on Rx through the MAC for the link
to work properly (the values above).

I don't have an explanation for this. I assume the PHY actually adds no
delay, maybe the strapping implementation is broken. Maybe the PCB the
already adds a little delay which is why the MAC just need to add a
little less than 2ns.

>
>> 
>> I know it is not aligned with what it expected but still.
>
> I'm flexible, if in the end this is what is required, that is fine. It
> will need a comment explaining why it is needed, why the guidelines
> are not being followed.
>
> Where i have real problems is with developers who don't respect what
> the guidelines say, even when their hardware could do what is
> asked. They just do the minimum to make it work, and call it done.
>
> The comment is then important, because i don't want developers using
> this as an excuse not to do the correct thing.

Sure, no problem. I'll add a comment in DT when I'll submit it,
explaining what we have found regarding the PHY strapping and effects.

>
>      Andrew

-- 
Jerome

