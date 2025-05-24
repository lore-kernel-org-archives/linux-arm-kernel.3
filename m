Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49826C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrCnX7ZGW71AQWL3Tr85Pt+nNECZZ216v6JjnroPo+c=; b=IrxNW2YAONGqzJgx1utceMoMJ6
	tOla3QuqS9U5D/iW0o3WETVGht3v8wPhbr0jIQfGO08NZukzWMbuPJRbyy9m9ZXjUla5vz4AJy1sl
	qe/TQBlz1wIl8FluGWQ5D5CU7+JUvicfxmX6vsHw/QBwZVGPbGBaqK+EKMnzduAAxFU9unvjkEAyG
	l+sBg5WP6KHEyTEduU4xOL/uxbdRqsR8VsDWM2deFlCLVSoQBv4WaPeiq2SVbtZtro6B/wEL7To21
	XM7eCZk6DyoLTlG6Q+pMi76LyJRzzUzHL6IlneTfjF1gg00gF0pzZFCEHnmu0ixLi7OvBnfsCU1Ab
	OFQOZIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIiO0-00000005NOO-2xQZ;
	Sat, 24 May 2025 06:29:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIiLv-00000005NIb-2P1N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 06:27:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad55ded6e84so13736666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748068046; x=1748672846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SrCnX7ZGW71AQWL3Tr85Pt+nNECZZ216v6JjnroPo+c=;
        b=xYcrmMUfDq10ulYfP5KvTQy1bRtEU3ft7U1cGZCXqCI1lgyBOus21l9Br0i6BKFYTB
         wUyGPL2yDvHEmz6gFpAahHw6aHRo3RARE5VVSGITRNLoi+UfHCRXgCtavzP8eZZliOEO
         NhdyrDqWTyBNJ5R6zZTh5pVB9RsdAFi3kzF49PJvzE5d9VEfPk6drFUww6Z6w9dHpa0T
         Wk57Woyf9hshxMQ9mvfchQ4wHpKiWgnFtFbUJoBi8ppISgiakWDGBBQi1ZKX7bRjkkZC
         RPAyHWwbTNykXCwBL62k6O+h9YK8amtzahFSzcI4PyS7CUtHeOaFXyw3U5BPRnSq/f7b
         DhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748068046; x=1748672846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrCnX7ZGW71AQWL3Tr85Pt+nNECZZ216v6JjnroPo+c=;
        b=UrewUQWOnYjwVC+X3Ek5ZKdkY+l1lcWgxqKvcMUU/9Rj8bqZqNQbJOHTfRFoQ1hipd
         xxV/ws+amjkOcxSaKC1skpqOr9xCBZyb9G04CxVdkMG7oibBvX3ucwgn6iEe/zb8yZQt
         DI4au1IzwsX0kD77id+5yaTwx165jEtUz5rNG/Asykg1uuV6oI3hq+7Afimsc3Ssp3ZN
         3q3QDv0/SCEo0FmXXN0Q1pyZt4b+DXbmqeO7K7ako2h6ICgZvBfUu+JzrOkxH68W+mlU
         /XjTAibIGiBqX7Ob+dDE6410q1QnNPk0C7eBTAGUzWx665L5nIOf6On+UUIjbxdJSSkh
         ChXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQsLFlCWmUvHqCwn3ZEnKnVIRukNveykpnngagON+1NLp15KLAwuWurbE9uDi0nfW7OLpLpQItz3pR4ZPKRTiy@lists.infradead.org
X-Gm-Message-State: AOJu0YwUSWuuZrOK+rne54Ztf7GWjZXKITBhgYskFdyBvLJkfzpmC4aI
	GEUipPkNWi8HIG5/q4rP3JQf85bC2avRB2yW9Fp8NgRQ2D2brf9FlZTV86Z9r3XmaSI=
X-Gm-Gg: ASbGncsl1K7I/Lk8RGU24VEsZL7C5uNg5VcV2mClNlYWC0HdjBBxPX+zt2wHtS6WhMR
	wg57YxJH2v8dqVGjikKIOSSNZzd9c2u9OdHgkjdp2gV+BdMBVLYh/M1DKcn7twmXpXEsmzZS8lw
	jQQ41ceDhuoX/yEjJTGGfeonc25Ijjdvhi8Oi74gAeHDz444DlHO3FBI7VRxTFwUo4JBJCChUSf
	w9lOVto3QyqKLp2R+cjYtYMW2L8OlPwgDVorFEB29dxf+GaJd06nku2aq6znEzsGBAHSyH3BxNG
	xaC3fGsqlAtRvfoQ0Q+wHADDPeCjivtKmJhkW5z2J5YCv5ezrijL2q21Yuk7sRrdvTGrkWw=
X-Google-Smtp-Source: AGHT+IFrGOHRDPV2gmNCJFm1ILCmmRF9v/HBorbGU1yfb5w8KGXInfeDVlK0y6rEslMoaySXGbfAkw==
X-Received: by 2002:a17:907:2e01:b0:ace:ef48:c7c1 with SMTP id a640c23a62f3a-ad85ae6d64fmr40696166b.0.1748068045678;
        Fri, 23 May 2025 23:27:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af2asm1357676766b.4.2025.05.23.23.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 23:27:24 -0700 (PDT)
Message-ID: <fdd10564-2041-4ee4-9546-fbcce12e1d52@linaro.org>
Date: Sat, 24 May 2025 08:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Frank Li <Frank.Li@nxp.com>,
 mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_232727_618156_BEB4AE90 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On 24/05/2025 01:22, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>> i.MX95 and keep the same restriction for others.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Krzysztof, will you take this one once the DTS part is ready ?
> 
No, that's a media patch, not a Samsung or any other subsystem I
maintain. I do not have write access to media tree.

Best regards,
Krzysztof

