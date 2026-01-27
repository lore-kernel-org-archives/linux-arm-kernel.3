Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C5D2F009
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=; b=j5SH9BazmOdEZ3RgTesU04q3dM
	+WWIsWqydoE11rP07Mm+w53HfLSLTKlX0VpPPdf921/GG8fiWg1V0/y9brqbz48Ij1OP21xWHtjpb
	a3IuQRdgOT4Vj1owvHsDWt0tZrSl1s9+v2l8rHX3rievQhjYVXIk9mp5Qpn7qWElfkPFZWwmzt+ur
	77b1kJGbhBtcMSPCC2kwYetiu4KRdaA0IVQ0zrwMuoZLH2zxMnCvi0j8iq6VIg2r9zvKZ963KWCU1
	fOHbea0V7oWASRo2ALxAq9k746TijL8LmufANWzEumH9T8NPsnQJLlJuWW3ouc/mQfVFswF43300G
	h47rTcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki5T-0000000EEhn-1wHj;
	Tue, 27 Jan 2026 12:22:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki5Q-0000000EEgv-2FRJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:22:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-432d2670932so5141330f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769516543; x=1770121343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=XU+lqzO2MqsByFhvWtDiJXTEEv9cDCC+phIPjunt72R3NyNhhF9OmqzECFiInLoM44
         ne4O1e4c0QMZxWMyIBX4i5pdtNhTJfagbGoaWMbhUxeJOLES7vfDdz7UGu1eeA+1rqHx
         rrldzNjWetS+xhCQN7VjnTGSkrAydORDlVUNSX1pAd1Q0x+/AksaF9RDaHY48eZ7pfoy
         pu7qSlMJgImZjUTeIJiHOE2/J8y98sfhKZh+/wVCu/imLwJNaCV2Jxta48Z6rJvsF0d/
         QU9isX5dEY8XaUG56Bu/avMZd7zi5UcTtDQhq1WC2sxeC5smZoalw0ZZBZrpr6PPfwoZ
         7MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516543; x=1770121343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=jGFJlGzsI3Y2fR76XS2ka6HiG31dPdwygqApCjIgZs9sUQkvSbJ0/9LIO2ViYTXyEP
         tuIfRLpKb1u0mACzkMJj1BuvvAXRycg9VkvnC6tUgM2T7NwOR37xH29zK/o0K+xvqpv/
         iQyVSslAu36rsgZyOaw/pDL5FqLY/0jVAgVh1kfUyQAPuuzfEesurta2wzwrAq3I4uko
         b29GVM+mOdP8v15pN7kew0hAUmu14DC4snQizuUr9QpvhUh+uOmsbNHpsPfHSp96/7SC
         /l4gwtgNfwUMSOCoKWYYjgsOtMgLHxnD/asN+i6vKW6IjoFcCS1eBZY6rrcJaKfo6mff
         w1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWie7d5OytzSNNx8HmjLprp857b0KGk4OZeJrGGAM7dgrwmkpQV19UZ6wImMx0g5RFGKw5bPqIDL3tdnzce0MQM@lists.infradead.org
X-Gm-Message-State: AOJu0YwUE+gjbaQ0V1Z/v4Zw8z7Q/obJI+yAVqesK86OwoFYBeAcqjpM
	mO0B2mhXJ93ZQoqrExh2jycinCsnbdSXl/gMO/u7XkJYr2hccQtPlv7C
X-Gm-Gg: AZuq6aJOo3l/VZ8ayqSYsroKXYp+azV5o4SoMxTQXpXmDf1nGfW/rjicYc1srOgLcD6
	G8cvVqdJGBbLx6akEHBUoNRC/mWpjdnl4u6V8wy2jtTTFzMaNs/I86KFqgNH7vtHJED6cYEj2So
	THb4sffZor2uniDIHrUBk6FUsjeFFt/Kn2gpL2noHtLQWJIhSzG54/VLrctO4rrTQb5XsaM5zIL
	V1RiWXckdy6+xJr5hGdpxSe4zwKIa1u2BNibrnxD+kzqeyHLqvzH5Gl5gAK+Ti07BrzCZ6uISYn
	rKq1CG9QPHDBlMhU7zfCkRqOkkXfRK9ivkL6mLYGh/vraX4YcbjO4wwKLV6KK1h4p90EtcWqctx
	H09NKBOjSlaZgaFSPGktkSAkfed/ZxUWKTA5mQJgDKs0MFVVavLdSX1Av5fmmcJlrq9b0py/PU+
	I9Fhvm+n0wxDs20+bO3y8zSi6RsksLXflJ09MtYVXQ7UU=
X-Received: by 2002:a05:6000:178a:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-435dd022574mr2376326f8f.12.1769516542309;
        Tue, 27 Jan 2026 04:22:22 -0800 (PST)
Received: from [10.25.216.67] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm41885074f8f.25.2026.01.27.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:22:21 -0800 (PST)
Message-ID: <c4f4a6cf-8511-44ac-8648-d8c4093e24d0@gmail.com>
Date: Tue, 27 Jan 2026 04:22:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
 <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_042224_592620_3048BCF1 
X-CRM114-Status: GOOD (  11.25  )
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


On 1/26/2026 8:40 AM, Frank Li wrote:
> On Mon, Jan 26, 2026 at 06:55:37AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add support for AONMIX MQS (i.e. MQS1).
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
> Chip's dtsi and board dts should be two patches.
>
> Frank


What's the rationale for this? Is this "rule" documented anywhere?

IMO, the DTSI-related changes are small enough that it doesn't justify

the split into different patches. The split would've made more sense

if we were touching more than 1 board.


