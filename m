Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639DDE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3fULVCiFHHJMJ0GhUVexYzyGjwyjmaqKAkJOWoGmw4=; b=jlx0SdDmDKM9i1sR/17kBnQAjz
	StSIky+aD/FENERuta/tL/nZR6s6sJHf3dnaIu2jKoPCykIa0hJTmkzJLYRKDoCgom6xpz1T3LCol
	XDTPsKVrqjK+iDBsZ16Nn/9d7wsRFa5hi1ywmVaKq48P5dL5vT1NxHT5/9QGWo391AjMLGqfLqOwu
	mUkGInUSY/qhAbOEDax0lwEyCkIb2iOOBqUWUxHfO7zb/wuNTcVnRntd4R/jHTfB80ezGiYRjoqVt
	ZJegsJDJvSz0euZJh7VyViO9LGO4ShomDDnSiY0Si0Py6QD7ZHSA30fq9R0ZbQjzyaUA4Eg9z6Sme
	qMEMjIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHdq-00000000wuv-1e2m;
	Fri, 27 Dec 2024 21:13:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHce-00000000wo3-0wXL;
	Fri, 27 Dec 2024 21:11:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21a1e6fd923so27109325ad.1;
        Fri, 27 Dec 2024 13:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735333911; x=1735938711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3fULVCiFHHJMJ0GhUVexYzyGjwyjmaqKAkJOWoGmw4=;
        b=QGaa6UFNz7NMx4s+3Qw3a3EcJQTgRrxUOckI6VNWL549ZGViBIrjXk/R5RMkk51Bem
         EUuTjaSnso2usESUaiXZe6zth3R9CoJAy22KzpDDAmwjvsyfG8l9F8gPxc7Na6yBNeGJ
         N1BFXio1Vid/998mjTCnVRnCe7fDhSOPtDrx86lXn6J3r5/xG6z2OS+BGSZZggy1QGLQ
         PqBT22triifxWd4hwf6KxgXt5PUoaaWANRmz6y8Ngc1X9GcskMrzUZYgsWmrLeHD+OdZ
         6p/VVnP9dSjY7IaqA5sD9GG7fNdttO8uTFSZbY8ehAJrbFASKk35RC/Rwbbhynzez/YV
         HG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735333911; x=1735938711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3fULVCiFHHJMJ0GhUVexYzyGjwyjmaqKAkJOWoGmw4=;
        b=dZmOTkB7aKueDnxC7gnUpbdu7Y710J0ZE6Pwpr2fRI0MKaHnMj6MP+mB+IaQA5osgD
         Vz2sqJ+lRwvxrRiSG3BMIh11+OsUZ+fPaXaXMF0i+zxGZ51pQzw5Dq9iib5bXJ/jcIew
         3gAP0xfSFLDXdt1aUhfXzZwoY1YXAEFDZzUO5GZ6rREa6TsOK5mQLQuFuJkSkA7Gz5qY
         X9/YH9NAvK9WOtFycWvVxUoJpPFL8JrYyqfjHUZrzghxFGoWchD0LJih/XNmPFiT/cCT
         Mx0YVSbZUDj64a6KbKvb2H+zGcWm8VEZJ/k73zD2knBB1+jogPmwQjkxTVWYeFNl/Dsf
         sWMw==
X-Forwarded-Encrypted: i=1; AJvYcCVH+jwba7E8ElDVP+w0W1urlhTgpfLB861yC/Ln7DGoz20H96hjJzxbdmhfKoKsA+rKDlIalFNjatMxZh/E@lists.infradead.org, AJvYcCWi9zS1UnG+VAVLkOTaW1XDs4jJy3cobW94TJKNIr7wXh6rVnilxTxPnP9+N0cgkoY1mZKaHWpeNqHfyQcYPPD/Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZ9qFqJRKb0vRLhRaJPy40AfRkNtJvmL0WuMn7C7Yy1MwezKT
	0OG9T+tgHZ3/HQeUir3sMZ8+7eFA0QXEjMTeMUOkwuJjMwvSOywpiweaqh1roeAkqF33zu9nzAK
	LKy4YFo4/6amTGwoi8GUHQhb1vXw=
X-Gm-Gg: ASbGncvfwAeykU2iW1G4+0uzALWM0pw3EybGnL8UsF+XuS7idXp0F2rSRGjf1L9gqvs
	A7Iil9R4rfyZ6nwUeLICHoSPc0TC6Iusy0Vxq7MrTSt5kSv//41SFaaZL7e13OMKdZG2IoAI=
X-Google-Smtp-Source: AGHT+IGCfrmdKAEUNMf3z5m3vwsnLOvYuRrIEQmtrmmSUhupBO37Iqg7DE5f7EjXjnpdNGaWSs50IH4PVeaNoh6JaiQ=
X-Received: by 2002:a17:902:ef09:b0:216:2138:3ed1 with SMTP id
 d9443c01a7336-219e6ea2db6mr403735565ad.19.1735333911039; Fri, 27 Dec 2024
 13:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com> <20241226-amlogic-pinctrl-v2-3-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-3-cdae42a67b76@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2024 22:11:40 +0100
Message-ID: <CAFBinCCbipebu2sNseNqatfBYdsnW1ouccWBH3N0JTo6GjRG_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_131152_270141_79925759 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Xianwei,

On Thu, Dec 26, 2024 at 8:57=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +       if (of_property_read_u32(np, "mask", &bank->pc.mux_mask))
> +               bank->pc.mux_mask =3D 0xf;
I don't see any documentation for the mask property.
The discussion about the dt-bindings is still pretty heated.
Everything else is already part of the documentation (which is good!).
Please document his property as well (or remove the code to read it if
there's no need to have it dynamic).

This is not a full code-review. However, since the discussion about
the whole dt-bindings is still ongoing we need to make sure that
whatever we document in the bindings is actually all that we need to
write the driver.


Best regards,
Martin

