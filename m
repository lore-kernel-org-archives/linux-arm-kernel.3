Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB0CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2R4TGBm7viwGdAZzeA2gZfj3cLmF0LJxf08e1QQLPU=; b=ZsJ1fe+8CjueYSJ/jddIc0ISKq
	Pl+Kli0Tw0tSp+n9SjryK8ftlQVt+hmXhkKEPp1UcG+oLvZOntgJ/5Sy4LG+7ZEUcKFTb7QcfvBSn
	UhLkywZxX2mUX6VlZY34rN7kZtLvtRqG44eJE3tRsiDEZteI2xydeT3oBDp+yKUb2Bak1xRJ4JnlC
	0B9jAOhTmVWDv5r4evgSwFfRpX5hca5OFMrP3Ufz1QXnuLtEv1lwvypT8Tfzd53wUsnsmXAtd9hXF
	xAXWlfDOnI98NbyUftMxZfHKlNABklTsFAXk0cNnCgWGbioMvjdahAQiTfV71CTi7iUwbWvNV5q00
	LKH1bU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsdN-00000005tVv-3YDH;
	Wed, 30 Sep 2026 11:38:01 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsdK-00000005tVD-0Khi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:38:00 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 85EF57A07E4;
	Wed, 30 Sep 2026 07:37:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 07:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790768274;
	 x=1790854674; bh=k2R4TGBm7viwGdAZzeA2gZfj3cLmF0LJxf08e1QQLPU=; b=
	JJjY8F4yrLr93eCu74rGqk8b1vEUJHxXJoHeg8LfEa+Y4RATUtvcZWcyfYASG8sq
	ofGZA2SJwTnxal4tZwphml0eoboMu6FJaa0t3C2XmD48D1/cf8GNgEVe53+qO0+/
	/Ud2AycKoHE8RWPcqBGVjVSvcsF5VeAVoLUIeVOJCCsFe9mBV5rbLo+9lXibx296
	2wP33UmvZhEveetVRozrQJf4iO4IZ6/qOr+BMHm6sy+CpnvGBmV2ZQ83gHiHUGrd
	jziGkMbps+TldhoHf3FXyv9vPBOUHbAaEWyceWQU6gtJ3FQFTLrvPI7deU+NBBcy
	ku/Hr9PjptBRLxBhp73kDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790768274; x=
	1790854674; bh=k2R4TGBm7viwGdAZzeA2gZfj3cLmF0LJxf08e1QQLPU=; b=R
	9L97J6xMy+zpfx5eWQNtTFMJ3rrVx8z/EP5bDeL4lMBYK69Q1VzLfvlP0Iq+EILp
	g87WkJDm4pgIm7PiBEJfu/D1mwTtDQAi48AOoW46NmSH0oWTbVR/of6vECBS3Uur
	rv+tpw0HHJz7pR+RKWdr17m8CoXlsQTLQikwFNDOxvc7/Cuo8jAqHG7gXq5OS7/w
	SAG4Z2igOfTM27dI0/aMvDuWv916riDQ04En6Ud8Ur5Ag/8Ej9iwBrmj2DF9+Czy
	TsPKj3QoIFIeeA/sBXveffM9tGRYC9Rii5aIP7nEStts8cUK99Wu+pNIUh7LlvpG
	lfKS+IaQL/yIpVGfEY7FQ==
X-ME-Sender: <xms:jfS8ahgToA9lCjMBKFljCoJxgC2AfqThlWusVy8enxM_Fs16UyveoA>
    <xme:jfS8ag2F_r0RTX5zk-BLEMAPdKvR2P0FdfsQISnzqj4HjL2AK0x033XB5Yn1o8qUb
    IPFykyFbl0-tKxXUfcz3qC_acUcYXIOslXFeyxlbs91pPxmrSSzMBE>
X-ME-Proxy-Cause: dmFkZTEomL5bVq4uOtje4tnWmX75yuKh6S7Wo4Q53XUOcyr5YPVc9grLWlPQAB1EARQMZf
    RoDPtN8QjUV+vdwhizwsJNnWmjiflLssbcx7YLBfrARQx+wkIoc1sUb1jdk3ShotXVAvHT
    MGKbO+to1ZT5m+Y4VRDsuaIiSgSu/REYn/jFqT6sLat3o/XRdrkHfMzwt26blGyhLGH+Ge
    sfIjheXOYBzGoiW4ob4w0a1eW1+hpc0kvhr+vvy//Yfp3yRYg45SjVjPnR8o9woYITeAbn
    uP38TwUTtxzJ7qiZi3IWSmMpGh5d8s8qH13mDlaidzekg7wVnk9kP1vBPaykxvFjRfuBsL
    P0AzA5mM9XR6TBRfCYSVd99RzEjCA7pixYduipUOi/AiVGCyLxfvVO0CxFE//7eRhQuD+m
    tabxdVu05Wg574SIpt7z/h8wG72Ot/4rAE9txPw5lmWb9K2Cggcd2PHk9h2lCNSFL+f8N6
    QbdhtHSLNB4nXoiztgVY8k3EzFEgVvAHX/hdoUvCgqc+Am93uFQ648dtYgghAc23mAnybh
    KoZJxT1l4P25JuzDyPGc+eXxI0krVm/UP7cu8HBW0xa2iqfJXCgBkIyR/6gYYe+uIrhUEu
    hA2xgHYByNXa8Aq3a8rrNnkHVBX1iHxQjwFllluzwjuNqZI6Wn7yeyTf8InA
X-ME-Proxy: <xmx:j_S8aikRyDaSkdQ0s_1y8wB8fdHA4v8cV7GxJ3nQZGYQy75q_LY0Fg>
    <xmx:j_S8akHXJX_a1SQ5fxQQe2dbLH0awaczFGwSJ2fGNKw10dwv0R06Yg>
    <xmx:j_S8amGolY1wDOQNahSp-kRHCCHA3VrSyxpiFMxYw-grr9y8SKaHKA>
    <xmx:j_S8as32CmC8XqdtveVfXDLAq-fOXMOJz4Yejpj7-GLaD9DMbLtW0g>
    <xmx:kvS8aszb0oArWpPDaNcCEgy1fJLYMg38KI2MFTwoQAGULtfotXm9CrUW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A4FA232A008A; Wed, 30 Sep 2026 07:37:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAFgH-j8k6Zg
Date: Wed, 30 Sep 2026 13:36:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>,
 "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jason Li" <jason.li@cortina-access.com>
Message-Id: <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
In-Reply-To: <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043758_261048_D2865C8F 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Sep 30, 2026, at 13:01, Linus Walleij wrote:
> On Wed, Sep 30, 2026 at 12:57=E2=80=AFPM Fil Dunsky <filipp.dunsky@gma=
il.com> wrote:
>> On 30/09/2026 12:20, Krzysztof Kozlowski wrote:
>
>> > How is it different from Cortina Gemini?
>>
>> Apart from the vendor, they have little in common. Gemini (SL3516/
>> CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
>> FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
>> CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
>> SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
>> controller and NAND controller are different blocks from the Gemini
>> ones. So it cannot share mach-gemini or its drivers.

https://wikidevi.wi-cat.ru/Cortina explains a little more about the
timeline here.

As far as I can tell, both the Storlink/Storm Gemini SL351x/CS351x and
the original Cortina Systems CS75xx ended up in Cortina Access
when Realtek bought that business unit in 2015, but got discontinued
in the meantime:

https://web.archive.org/web/20150729020021/http://www.cortina-access.com=
/dhp

The rest of what was Cortina Systems at the time remained up in
Inphy and later in Marvell, who I assume hold the naming rights.

>> >> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)       +=3D cortina
>> >
>> > Arch should be rather per entire family, not one SoC.
>>
>> CS75xx is meant as the family (the vendor kernel covers the CS7522 and
>> CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
>> single part. Following Linus' suggestion of mach-goldengate, v2 will
>> use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.
>
> Put the rationale into the commit message, that's exactly what we want=
 to
> see in there.

How about making this one ARCH_CORTINA_ACCESS to match the 64-bit port
(saturn, venus) that Jason posted at
https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-5-jason.=
li@cortina-access.com/

I think this would be consistent with how we deal with other
acquisitions (storm->cortina, freescale->nxp, ...). I would
leave Gemini as-is because changing the name only causes problems,
but for the new platform I would use the current name of the company
that last sold them.
=20
      Arnd

