Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaGjkAopaAQGIONFxxCbjojwL121uVVm+SlSEpngTxQ=; b=qGlgN4sEN695lUJuB+B66I8BCM
	eeFtPHtSxuSgK8J7sts/N7fQq/LzVH2XnpkBX6cu56DAaGGlLsdeJQvofFjGRHJG9g6CiQdA6UpuP
	cPVhKnO6GjW+uB7/8u4JiZ1ALbstqchiqgpQeBd2l4MPzsKQErb12o2EpFMmnEQ1akunyNZRkAL8z
	XUgAZizMgA1DDVfvKgoit5oGavzXrkx122+OtES7C/j29uip1xTjgzorIn7tR0C4mmAQq2yh6ci1h
	oRaak7cWEKku2ofIfz8tvroNI/7YP16RakEr26UaEheL6aJpJyRkM3t1CZa6p6xZ70cREDV0oRfoG
	g6zFBefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy26-00000000NJX-1iJo;
	Tue, 25 Feb 2025 16:43:46 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwvP-000000005CJ-04mG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:32:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30797730cbdso56946141fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497565; x=1741102365; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaGjkAopaAQGIONFxxCbjojwL121uVVm+SlSEpngTxQ=;
        b=qJ4ovcmTw7DpacXV3wOlHgOMoE8hAqztWz6c7kvkHuza/xWqczp0Kr3zu5cBnxWNVY
         m6NK8eRDzEOo9c9aMC3Meklj4zoSDZtv5fOOw3GKkd0sJ61jsL0YAA6zfoL0rPEybjnN
         tmA6VPv+PlH3Hvibt6CPzj2HBOuvDEx3cf4ZEEPeT6rnd/OAH0x/TL7l6IfFpBrHSBRX
         C/C1o2FQiX8p5CCEfcCK+E1G4r38mPixvYS0cWvEEXFJBx8mVt2IyR6KdZ5bvgJ5Ntur
         60oTp9pSbK8mtW42UOp9kqcmrPaep33+IMsiWvnv3FO2U6shsJa6twMvz+3iV6Vfw1z8
         CG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497565; x=1741102365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaGjkAopaAQGIONFxxCbjojwL121uVVm+SlSEpngTxQ=;
        b=OZ/x3JuniCt08PShoJULDdl1HtgSbrUHHX8uFlPHU9aD+/T43zhEgMuTOCRg6+nWtD
         h1Vp1RKysVXUpD/7d3hfgCax78/xdkQb4I+mslYhICODKc/E5oGr6gMXfggmUEnZl3dy
         2MWKXnMgKLvfnbuk5/LESYNEd+exc+sJ/eEwd+O0jJSzptGWZmSw3w+sYVxhLM4BWY4h
         XfzWGX6bwhHyz2bK0Bnz4liGLpKlI9iJqIVnSny2mVKOAGnpvkKuLzND2MGSlViJISJK
         8QW7WQfHCTbnyrwaFB/oEKoz53Q5BjbE+hYjbve1xX1p1GPWMPSkrC8f3d1mAzeyYycw
         xfNg==
X-Forwarded-Encrypted: i=1; AJvYcCU8TIaUv+3C2q2uMq2/fk+StBw318rNN7BubY7svgaq+79kCSCydVlWmQQ4gblYz2pk7VDxSsEDS+3Hj3xxseDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy73zkIsHEXJHy1RRUcBj9QafccxHFXDrDvjB6vphralewDuivY
	IrM6CXQSO8LNy84zpaV6RHrE/FFZxZa2U4TTTWyV/DwKUoiS0BDh8xYVAvDq9pYFi4nFyJ/+Xuy
	NspPhGH+yOZj74hFkzFWss/X9cFShzFsAG9ztJw==
X-Gm-Gg: ASbGnctKKrgwio3lpFNDvsgpjjxWadTdgbPnndvj2gq9NBtW5y1lk1TYBTNmiIXnMAG
	sdMSz844aULBEKtko06jut/wa7nqi1kJF4qR0JPtz4dpcg4MWEbx7CQEogjDbRXXz/wxVD5bkOR
	b5ASHxFxs=
X-Google-Smtp-Source: AGHT+IFPvks1R+N+fJTEiOsOCgQ3Uu2uCdasHK1zA3TfJnFONKyVeOK09rw3k8OZE9RdybF4r8mkRiLMaKmtj/CzaGo=
X-Received: by 2002:a05:6512:ac4:b0:545:ba7:26f2 with SMTP id
 2adb3069b0e04-54838f7b2e2mr6507774e87.53.1740497565136; Tue, 25 Feb 2025
 07:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-4-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-4-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:32:34 +0100
X-Gm-Features: AWEUYZngCJXkldRqEiu37vm6Vs1F2om2wUYZ7-KT8x5LplRl6N4turQDfjA0U0s
Message-ID: <CACRpkdayJv5Js0trEgHbV1nM6CS-Og-eab00AFC7JWxuk9daTA@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: arm: Add Morello fvp compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073247_054000_004515F2 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello Fixed Virtual Platform.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

I see my v6 and v7 patches are mingled. Sorry for any double-review tags.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

