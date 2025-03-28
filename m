Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23BCC36017
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8SqECOv0O7fVnnTWDWZ8wyu7bAlxfC76iF8P0q8bMo=; b=42cSwamwnGYHY41+RGxSNHX01m
	wdEyJ/GzAlFUN3+4uIOv6elWDc4rl+d9x7LwA66PWVvUICKifBNW8VJCUZbybTWAyf/NQBB6WPtlF
	Jbfv4EkZ3QF5mb3uuBV2MF4XBwuzInYB/HhxzmqiDmVWgMQQiru5rlSVfnMBuMdJ+eNsvEwd5EC2G
	g+mkhrbggvNxyZdKDz29qiBAXfzewJkIPLmvMlSMiMQh9tl97PSZ+TVsQFvGIViTjBv9nJZHHNFCw
	dn8b7s3GhxYAyS3JQm+weUq1xfH4j5Y0mBV9zDIXPmUuAhwCIoKXTK4dYCZLGg4ztv3VKjMhdXuh8
	OWcllGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2D-0000000Dp7E-3g5I;
	Fri, 28 Mar 2025 15:54:17 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBIt-0000000DiKW-0ehA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:07:28 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4768f90bf36so24688971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174446; x=1743779246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8SqECOv0O7fVnnTWDWZ8wyu7bAlxfC76iF8P0q8bMo=;
        b=IJYsRN8PJuzFt1bUiElM6g1jV5Sq9qZEw1kGhOkAh++1/K5A7D7JVanBFQGCrPoBlN
         zBhS1lBlRSIK+2WjM26jqJOxA1YoWaqx+hQH3VtcUZ8zTQXdDjgmMOEzVkRIJ5B0/AaS
         AoYaRn/MYZvr9SAckcgWl1P9YAcySVw/y8qGyJD1czpMIONvwovu5PBsx4Gvj8PED9vN
         /QrN5F+fEpSb8o785UtirR62/iB+RhwPniJTG0vDL4f15kebfxm1C5xxsZAu0ibVDTkD
         tUw9rFdr0LBKONmsDe0OLRG86+BVY9VqHdJE1sB5xdMmp1rDxkoXLq7oaVSyk7nsdmcQ
         BoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174446; x=1743779246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8SqECOv0O7fVnnTWDWZ8wyu7bAlxfC76iF8P0q8bMo=;
        b=XDOUXe5FYBKVvSJQ0FEMTic3K7joH34ui+VuYTapbsJi1Pr+c4f69OboS8hyL+jocx
         tWVZmin/c1e0AzRN3B+XJcDxsoI/D8kfqD5pL37pd1ig4Yq5Q1IPiib3Tin5P1Fj/+/l
         LM8/mt4tSdZeksSqasVPdQxRuXZn+wd11pr7t8wCj2ipCvYcnpwPb9GdH2R5aL+NXyBQ
         XPfpTqEACwYNP2pQraaV4AJC7yR9c2chUaK1bGhoNdVM7kAPyjE+iDDbuPJSCzOehEaM
         h9U6aMu0sbEBGiz/6tA0PiJhFAS3YnqrFUHT3OXV3c1tlF4uDm35EoAqK6oLKnUQ1z6S
         jKRA==
X-Forwarded-Encrypted: i=1; AJvYcCXJe96ruXv9LyTvETNbu1wgR03ZlJm/Ud7v6cedK6eaqLZguXcS+S/xG9Oherxo+933myj2i3iV8GjN6GhPcfW1@lists.infradead.org
X-Gm-Message-State: AOJu0YxszLeVRXmpEH9Y+lJPezjhJHKofXt7WEdhEOByBUXL6ExFQdPc
	eNLcBT1P7H5PKVkpjCBEWzJ7Wh71PQzxJCq5BWAq3TbmwAj3jSrtYo76DYH45m35LVPda539Ups
	ljD5G2rnGN14jOaixBQ+AyigQ2X0=
X-Gm-Gg: ASbGncs4QN1ksz0AQcY1AabIVVvhXiYdgRCj107x0oFDlITiThjNpPwD1mrCLIEXTJ3
	1wgO4vI2wQtgkyQA5GdiGgrrHXetLnPkCZ/FQ00oF1Ud2yvia4/4/k3hidr143RZZzgICfEcRAS
	Di9vaxT7XRCuctFhnr4J4TQZ0ga+GLdVYsMVmrj4K2te5A0QqhhDv7drc6
X-Google-Smtp-Source: AGHT+IEFQp+Cby6HiGCfeAk7cmSpHEGKzP8//Qi1usTxz78XXYaOJxvsMppu3V273yn8LVP1qJjyhVwAo0Hz34FL160=
X-Received: by 2002:a05:622a:418b:b0:476:9474:9b73 with SMTP id
 d75a77b69052e-4776e206ff2mr122423331cf.42.1743174445583; Fri, 28 Mar 2025
 08:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <dab9b294-b635-4bd4-986d-0c0671eae6a2@kernel.org>
In-Reply-To: <dab9b294-b635-4bd4-986d-0c0671eae6a2@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:06:58 +0000
X-Gm-Features: AQ5f1JoruPtRoSZk--apVQ2hKRTdRqkBTHUcuumb74_fLpm1bI2BZKaLDy8CY00
Message-ID: <CA+V-a8v50bLCSWRDZ+CwV+1re3SApzFW5kx-T9sJb=kCJ45zKA@mail.gmail.com>
Subject: Re: [PATCH 14/15] arm64: dts: renesas: Add initial device tree for
 RZ/V2N EVK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_080727_193458_B8E33CD6 
X-CRM114-Status: GOOD (  10.61  )
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

Hi Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > +
> > +     sd1-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZV2N_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd1_pwr_en";
> > +     };
> > +
> > +     sdhi1_pins: sd1 {
> > +             sd1_dat_cmd {
> Follow DTS coding style.
>
Sure, I will do that.

Cheers,
Prabhakar

