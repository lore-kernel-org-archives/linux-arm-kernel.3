Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C48C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6pBXTVHR9QU6qXSdZSZAmxkEn4hY2E0r+sj+/bLfjs=; b=3NY86XD+l01sgmSSj78vUc/1s4
	jgNb8gJ8pDSRllBvXjRh5Fd/nhLOrCif28fH8m5YuM+9NtTW0DngZnYqeY1/a0+QGIS2/mMkfYWrj
	dsTxm03lbFfZPo65V8spX3Am846kGWbBQkkAttuZ+j6nuM5RGOuVVbw0ZuylxNUhCeWp+fkr1f8wo
	EcnYYP3VyQl8P0gXinRn+6Dj9dglSll11lPXyaC4fI/BxNlFHMtIcNokxxvaqy4kerOEqg8zLrekX
	0kefGExYMoiAs+PlIpLPray8iwum9SfYdkmQBjLW5/L9SgDbdTOPKr8o51jVYxojGI+iOBzTJrT9q
	YfaYW4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2G-00000000NYB-3fCY;
	Tue, 25 Feb 2025 16:43:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmww8-000000005I3-1gZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:33:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54838cd334cso4755166e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497611; x=1741102411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6pBXTVHR9QU6qXSdZSZAmxkEn4hY2E0r+sj+/bLfjs=;
        b=CvBGn85RtApJ/Sd0MchSuey+mX8Yuc7QpxBJ2LZZeYA/5bJo10HfVgxY54fqi7s1AK
         1+ufFD2mDvRlfBZ9cZmkHJJp4WpsaHGZZpPbHhnEB2VCCBKBZjbUCPPuGR+DCSHy4QUr
         dVGWoro4ftNUOcDZMAvs2Y6V37G6PUJWDHWx/eOFGiQcB/1u007UGTxJq59hCKcGJg13
         9C/7ezRPoZhX/4WcakENLgG5kvnFWMybutUKgynFEi8LaSfGbSsmINLst3emhWcaO4ch
         1B9g+8DJQ57JIliZ0blp9YtOD/HXkflCCbNVqHxjqGiVgxm6mcEHdKKVL9fMtNuwXfjx
         0jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497611; x=1741102411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6pBXTVHR9QU6qXSdZSZAmxkEn4hY2E0r+sj+/bLfjs=;
        b=bkAHnmkhlP2hPBbCQsZGeHfVWsWMVPQciVXI85oBfT3ge/JW84Ygo4LIV7diwDjSKp
         29Ay5v/Zd9AD9puoYWiFNxpl/+QC1ps6XRh5tpoVtnxj26mxA88pD07TBjhop45usCgm
         UMS8w5RDueCKn4b7Cpm0xoLKOUZvWf1Fccqjcsc9PgA3T7G4TOM1ent8FLeqgqiaI5HC
         P12f+5nB6+3PH92X+7BlJpGykvV65Pc/jAxcXI7Zpwx9TMF0O8NYR7+cxnb2E1ENhwnV
         tULWcmC5PE7jGBIegO2vhqNw1CbHBi7SMxp64xljrdB4sCRHsalsjwZYvHoze8WjMqio
         4D5g==
X-Forwarded-Encrypted: i=1; AJvYcCVUbDOuXM3qSnWth2dqOP78GGX+YD24DUtyRb4u4qAaKRkSd+VkHdO2Nd5LK14PwSCoLDsB0uzp70scGDZLGGZz@lists.infradead.org
X-Gm-Message-State: AOJu0YxL4ZgXQLNHacZw6jf9g2T4RmqRS1/bXaXr/TKsk1GseIBf1BXL
	tLNSTaVhV23hOMgw3choT/Kz839xQNLevTPnkTh9ywzmC+g06UmrSWub+4N0oqxytx1PJs2CW6Z
	+zz2iZSi7lvV3y0AksejtTifgjNL0LAju28jX4Q==
X-Gm-Gg: ASbGncvw/hfwWWV0fnnZ0YzVC3HMPEylWVoOZjESDtsB+JUPXfvC+QQRJrt9wJGrNtg
	45YkVYXgbEnMqWxWsaBZljgS0UlZkO5uynfgjfriSZMEVfD2rYkH7Dt1VKb7JTyaUIkgy4Vempx
	K6C6N4gEk=
X-Google-Smtp-Source: AGHT+IEV90oaeu9UQxuAox5ozndHtPuNH0Ob263aEQeN5znD9xNa5kzTKRICNt8bxpmQgEzKtDBqpOJObQ7W05CiKtg=
X-Received: by 2002:a05:6512:e97:b0:545:c1e:6603 with SMTP id
 2adb3069b0e04-54838f7ad45mr6306343e87.50.1740497610771; Tue, 25 Feb 2025
 07:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-3-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-3-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:33:19 +0100
X-Gm-Features: AWEUYZmJsXDo98RLls1F3CtT0bdN8aQhWcPtJx3KNfEkQgsWeFCVIwFiC9YVgbc
Message-ID: <CACRpkdZ+6WHJ2N3vbzPUXSj9Y86nPwkg90uwCpVQoRZY_KbLTg@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: arm: Add Morello compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073332_444361_1FD15CC4 
X-CRM114-Status: GOOD (  11.38  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello System Development Platform.
>
> Note: Morello is at the same time the name of an Architecture [1], an SoC
> [2] and a Board [2].
> To distinguish in between Architecture/SoC and Board we refer to the firs=
t
> as arm,morello and to the second as arm,morello-sdp.
>
> [1] https://developer.arm.com/Architectures/Morello
> [2] https://www.morello-project.org/
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

