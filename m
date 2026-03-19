Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C521B1075274
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfKs2BH0fICucBFRbcNT7ldaAh9sxBg62pLBdYSdZS8=; b=1GAQKU8YnrDA8jKQ7GbQ6uCE1L
	h+oXSvuMSSaODO1FUoEW3hmeZG/adCXa23iHA8pKSmFHqp1YNOVjFTIr6hFCLY55GkjhHfu21oVYC
	ukcvNm7qnblND3J3bBp5HCnRYslkdUO2411DP+HG0bSosduGPUtjBPH1MOkZJgwV2cnNRSGh6AMEA
	33MRAKHFbfwSYN3InP+/jsea6R7cprmebu8BXvrj2D74V8DkOghy14Mb1Fki7SrMG1TycogtQ924Y
	lP5l8uoFNyxO7nWBPFgDVrZ/vefQeae0O1ass3xwibSkwwDoS6nJw/Q5qYG95YAaEFVp/mFdYnj2M
	9nLIAuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38ey-0000000AEXA-3sT7;
	Thu, 19 Mar 2026 08:23:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38ex-0000000AEWR-3Flt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 08:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UfKs2BH0fICucBFRbcNT7ldaAh9sxBg62pLBdYSdZS8=; b=EonoULfOqzlEXargYABcA4jBUq
	kJpK2NyAH2qaKz5EPAGMXO6lHOi7O7fIVZLp5Hz6OW6amZFuzjjizuhiEBdjLmxN2zf6Xe/A2O64u
	CC+VKW/Xv4t+2jiw3N+QroLiy7VcvklbNa3gQcAI13PbTkFtplCsfVTxxIu+Eejrz/lfOI0xALYjE
	5tbvOi/S7ZMAjyK9A6rs/r1kcOk9W1mAr+M2sLKm1M9ih+CIcnJ7q8lUMZU3obTm6uKPrTTIkQjUM
	SB0onF1VvTqX07F6ZzwfBx2oseRfNQi+tAvN/fs8MPo5Qz/WwOF9fQQPUiaWLu4o4ZnLI4M3H5/Dd
	DGTY8gFQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38eu-0000000D14b-3qJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:23:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so276981f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773908590; x=1774513390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UfKs2BH0fICucBFRbcNT7ldaAh9sxBg62pLBdYSdZS8=;
        b=mb6VWsvm5+LcxfYE++DbeL+t9vtOAoQCmyrvwJUeUdrXwaqhaWzL2bSXe53pZJmVgS
         altfWm8y4I2/47MZnl7f3SIZemIPkxHFJeCoG0bDEZ9dhtZIXr2POI5kZdlEVcx8jT+Y
         XP4HNkCZbbLgP4J14OQvDeIJL8qUyvfN24GrBGbMGSfwgurJs+iGdPCswhmps8xGD5TM
         FvMToGXe/hMGagaF0mFaILrS3eK3hwxOMSVserVv7p5Sd4akIV1TkZwkOUsud2CJl8f7
         TwsS5JwBnHKQbf19BQsYB31Gx6Cngm04SNPocoIm5aBjLOeXnZDVCEn7eAPq4EJGrgIB
         P1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908590; x=1774513390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfKs2BH0fICucBFRbcNT7ldaAh9sxBg62pLBdYSdZS8=;
        b=AWQ0LWj+ZiOZae354BOWekwcZf6uS/f34D/hbdxEqYno9c9xs24GiLIBcNuW4NEJA1
         Am3+6FrMzAXe80kKOLrudEB0rAYzqBjebXN5joXWxIBrDfOzgzC0Vsch4SpE6ygf6N6p
         4SYpBHg0R4e2NT2/inDaKhMMW1wGBtRhE4RGiL/5U3JZ9dzyat7U8OnkBa1N7aGhZPDf
         6T04czBKs/DeX9FZearZmBGafsC9x+jE780PvRhemiq1cdGxYV3JhROcSybyZq4J4YjX
         3HIcCCpQ2zX9gvNEQ3Yw///GCc/JugisZ0CjQZNo0cn9WFQjCJC8/Izj+Z9Zw/lr5fLz
         1Nlg==
X-Forwarded-Encrypted: i=1; AJvYcCXtQGWznIa5u6QWk/dHIS6AAp25N3oaY/+54qYPawWSH2pdO/n/ub06eNRDpqrfg2MhL5oG5k3J19BuQmVo2zZA@lists.infradead.org
X-Gm-Message-State: AOJu0YyWa45SsovojPMVM+BMaTByYILZeHYhqxNYRZO3ecIWN95mdxmF
	TP3yyiT9lbjLCWPRmjYsn0sQHY0fQNPrP/NbTz7sjrNqWU1LSHvTPx90
X-Gm-Gg: ATEYQzwEJkUH7XD8WGYbaK1yaTbhL4J3i807p8LyEPmWr6O6y5zgeHTWRsPxj46WNyJ
	hgvIl6gboHka+9bAFuFbmXzMjV7eJZ7o8ZFhMJ9w6HcXrLkHt3n58xFNN0rmSUjoD10A0o0RCEJ
	BAXI3MtqYKkBE1nXBGFrUBXhtDBndVzZGwZCVgOq2zWS5s43erk5ay1zxMqT65P/merm/a6tMwZ
	atA3b8IGGMEnIuG+ZCKdM/LQ7+LRj/Kfu8vngyIGmcPCfiVFxPyFo2d0qrlJ1HZiRExobnSolA9
	he7/U4IYkbbR55d0oBCfDvd1Y4N5tqCP6qCgvRh1YcpVWuUoc/lNGh0/kV69gwuPviqkARj3T+Q
	Gpxl6fCKwEWbK2xWmSc3NRFBwiBbrLGKbXwGpTpyEgZ0miL0Vw6/mHB3u6gYdliDyAbQ1Rx9AP1
	w/kZde1ZFR8cDWbnz56BawddxrDLXaxQT/KaW05oaa0/7/QJTM+qz0fbrjHkCXwEY=
X-Received: by 2002:a05:600c:c163:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-486f441b801mr116935825e9.4.1773908590354;
        Thu, 19 Mar 2026 01:23:10 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e1ab8esm35596225e9.35.2026.03.19.01.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 01:23:09 -0700 (PDT)
Message-ID: <59ae3126-1074-4ff3-9474-9419f1042bb9@gmail.com>
Date: Thu, 19 Mar 2026 09:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260317-armada-37xx-drop-usb-misc-reg-v2-1-ddff72114414@gmail.com>
 <875x6t5ska.fsf@BLaptop.bootlin.com> <87o6klcswc.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87o6klcswc.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082313_024189_CC81FB6C 
X-CRM114-Status: GOOD (  15.33  )
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

Hi Miquel,

2026. 03. 18. 11:51 keltezéssel, Miquel Raynal írta:

...

>>> When the nodes of the UTMI PHYs has been added to the SoC dtsi by
>>> commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
>>> UTMI PHYs"), the properties has been added to the USB host controller
>>> nodes also. According to the commit message this was intentional,
>>
>> Miquel will confirm that, after speaking with him, it appears to be a
>> mistake rather than an intentional act.
> 
> Indeed, I believe it is a leftover, the property should have been added
> only to the PHY nodes, not the host nodes.
> 
> The sentence above should be: s/intentional/unintentional/, the commit
> messages clearly states that PHY nodes were targeted, not the
> host. Plus, a follow-up commit adds the missing phy properties to the
> hosts, so clearly reaching this syscon through the host node directly
> does not make sense and was not intended.

Sorry, I assumed that it was intentional because the commit message explicitly
mentioned the USB host node.

> Once this single word fixed, you can add my

Will fix it, and send a new version.

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thank you for the review!

Regards,
Gabor

