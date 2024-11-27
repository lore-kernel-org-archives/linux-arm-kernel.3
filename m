Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7375DD6D233
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaSCewOAz1MC+uF5VfjhdECGUiSX1B4mUUKrmti1jEk=; b=f/1Q7vqMaFGlCu0EVlvQv+zt/C
	9hvg7U6imui4rnLf74UIJK62I48r9cUauQmtlMnxtCeruRMYtPNTJI/atxuNOao5YzjkNVo5d1ddz
	bRsjjlp5I4H5i4fcnONFe71Hf/PP1b2pe0aunz6wK84o1KDGKziicp0ldrDkLKOG029Kc97mAc2zb
	pqKfqw2Eim1DiigfAKSPN+b8x83y3w2EbZB8QO0N7ZkPyuRMHSIRxzkIDatC5XgvaBPKaCrlVTf8d
	K+UvjlJ4chsFNmpcYxB6OxjWXEOt+8lzv88Vu7T+LRvO+rNPiqRz4alsm+DEmxMs2wwx2Qhc0z0EC
	6VjYrj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGO4q-0000000Dz3Q-1JAY;
	Wed, 27 Nov 2024 19:51:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMwS-0000000DqlB-317F;
	Wed, 27 Nov 2024 18:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UaSCewOAz1MC+uF5VfjhdECGUiSX1B4mUUKrmti1jEk=; b=YHoRQ83YJxwE45xWRg+fmltKBw
	P9sUAHntd7dp5fHW6bqPUzlT16nywtrn51p7fmL7QM9bh86K5z4DxGoCrRPtYXyyTcvgU3XvlJihO
	sr1mqFMjQMMUHwDvfBlsw7tEz1stXm8XiwS/tDaAxjOTHhJ6U7k14zqvJptHZMC3wik/0AS74RdHK
	FZC8yG7K9EPj4jd2HbyuuBR8wedHeMUWzF0F8AD3GEnqi4pwi1TyoVhcuikI4hHUyqrrSCDr1XLRx
	xVL+0EsRaWQHy2Tgb1b8qdbLP7ceRbZe6L/YqVv1ZTMdkHZ27lXllOQ32l6/CeWl2HiKPrtfQ1B9U
	vDf7fRlw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMwP-00000001SkP-23ZF;
	Wed, 27 Nov 2024 18:39:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21288ce11d7so58145ad.2;
        Wed, 27 Nov 2024 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732732746; x=1733337546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaSCewOAz1MC+uF5VfjhdECGUiSX1B4mUUKrmti1jEk=;
        b=k76ZA9MNrtRiKht2OF3h7bYxLozyjzV6jBRHh3JB9W6+dnj7dL3I3khN8UlTLBaAoQ
         vq5deqY47tZyaejhMtvQDnV7/nDwZzyAsv0/rws0LUgAkcEi3bBeE9eI07QuaHQFj74W
         ApwTB+bJOytumkRQ8RNt5e/7ZPxpaJIztuaztXJULrXMi4ZtmXa+/ZvLupMTlXAeBGBe
         brPp2vVebMv1XGuCYt2ey/Nfswip7vXM3XdC0uvlh+tCIzze2p/i11cRu5NGEH1qlU/3
         bMvVQMI3eqespX+GMSSKNkmfn4B+Vq19622+rArH+sOBnMUvp8XFabeXdavCHjJVqkWR
         jB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732732746; x=1733337546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaSCewOAz1MC+uF5VfjhdECGUiSX1B4mUUKrmti1jEk=;
        b=jMcoJawMQdpJZ1h96/WiV+Of9J2CV+32wxqBUOIg8Kq+rWsI67xUpv3NSgOidHr0Pr
         gXeWt10pm0PDsV1eLfr3rVoFOUqIv5mB0FwlcexIKmuHPTlBOd+e6X5VYqXdUIOxS0VM
         wPTtIimfcQics23rsMFtcPR5nxS0fIEs4mN6502DSy1940CACCQTVJceqSPndgYIuopI
         EtuPucy3YvLAngPMxQkStHOmyABDlSUGi85yIqhUo5eYBalfTsgMBV0egvx6tFpEqGfz
         VKyJ97D5gsFRUg2hY6AaGMHoFOCQqimHfkWVtIUkfaLLYBcXl7bOfYyj+SnpNvUtBgnf
         Pw+A==
X-Forwarded-Encrypted: i=1; AJvYcCVN4gps34EQnXZjS0pdOJ7kdgkU1NXn/WjS19OHSxaGacCyzghl68KSfcGcBu8+A2ZqUE1yc6TWqccEUBHk11hHdA==@lists.infradead.org, AJvYcCWP1nd3rByQk5lebohNq20Kg6LtUmIq2+oW2+uVjiwVekrxdPTAOPMVYp0mG+eOX3ltf1dfQUdiAL5QrmL3hYy7@lists.infradead.org
X-Gm-Message-State: AOJu0YwcCXbdJZk4ykXttlfcUahWVY2HCiku+IJ/hdpFzwkv3X6IWX60
	hex2cDOdKab+/K2CFbeP3HBvC5J3D4bwHYeAa6wIa6Ur63RAcx62
X-Gm-Gg: ASbGncsfb0supJKhHSXQaIRo978G7PyCZECxRDUgIn00y8xa8m08UlytPauakupLCbV
	AI1+TpV7e6aGqbOGH6eihg7a9ANjTZToE0Jtz16qqvGEbhpemJeKjLpb7EOv/ZgbVHyKgqF8UoB
	sCk4+1Rp8kh8q1AHUHHh0/YfnlrRMrfGXvdaJwWmO8bGqA6t/UKtligAq8A59iJT1UcClVRTl1V
	4PjB9QzNJW6fnbTjUGmrzVkdA7bQI5555TXwWdl9ZNU8iG9
X-Google-Smtp-Source: AGHT+IGhx34DRsa8uxFgpl8ldbCeAEFgFfVZ5YwC6dpou4pfJOmsKdHkfpUchzoB3IylveFgpWYqRA==
X-Received: by 2002:a17:902:ce08:b0:20c:da66:3875 with SMTP id d9443c01a7336-2150175eb06mr64426315ad.24.1732732746107;
        Wed, 27 Nov 2024 10:39:06 -0800 (PST)
Received: from Emma ([2401:4900:1c94:da7e:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc21b5csm106070115ad.227.2024.11.27.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:39:05 -0800 (PST)
Date: Wed, 27 Nov 2024 18:38:59 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Aring <alex.aring@gmail.com>, 
	Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
Message-ID: <5wzekgv7ccja7ucz2w3byprltalflx4am24scecxjokra4t44g@ll56dfqotyoq>
References: <20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com>
 <bdze3425qwrtlvlairw2b4xiycpkmhirzhqn2jt6jngc3bu4ta@uo4nc2lnj4sf>
 <qb5sdh55yj7est52netydaauazgluej6hvvtutmmiw2bhglnpw@lq2cyg3hjhlw>
 <b81cd6bd-4a7e-4032-aa56-843793a0e0c8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b81cd6bd-4a7e-4032-aa56-843793a0e0c8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_183909_607166_A00EBD98 
X-CRM114-Status: GOOD (  26.90  )
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

On Sun, Nov 24, 2024 at 11:52:35AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2024 09:49, Karan Sanghavi wrote:
> > On Tue, Oct 29, 2024 at 08:10:23AM +0100, Krzysztof Kozlowski wrote:
> >> On Mon, Oct 28, 2024 at 04:44:12PM +0000, Karan Sanghavi wrote:
> >>> Convert the raspberrypi,bcm2835-power binding to Dt schema
> >>>
> >>> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> >>> ---
> >>> Changes in v4:
> >>> - Corrected misindentations and random differences.
> >>> - Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> <form letter>
> >> This is an automated instruction, just in case, because many review tags
> >> are being ignored. If you know the process, you can skip it (please do
> >> not feel offended by me posting it here - no bad intentions intended).
> >> If you do not know the process, here is a short explanation:
> >>
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> >> versions, under or above your Signed-off-by tag. Tag is "received", when
> >> provided in a message replied to you on the mailing list. Tools like b4
> >> can help here. However, there's no need to repost patches *only* to add
> >> the tags. The upstream maintainer will do that for tags received on the
> >> version they apply.
> >>
> >> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> >> </form letter>
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Dear Krzysztof,
> > 
> > I hope this email finds you well. 
> > I'm following up on the patch I recently submitted linked below.
> > https://lore.kernel.org/all/ZxEm-H-PjlQyXeOH@Emma/
> I don't understand why do you reply to this patch about other patch.
> Anyway, you got reply there.
>
Really sorry to attach the wrong link 
Please find the corret link below
https://lore.kernel.org/all/20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com/

Is there anything more left form my side for this patch as you have given the
reviewed by tag to it but still it hasn't been applied yet 


> Best regards,
> Krzysztof

Regards,
Karan.

