Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83325C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=; b=OgSOqpz9SO2mbDrM9bad/d1SYk
	Mfiw1TLqSfdMqpbYzmc7AVyy+jh9idyPn3eyfiezh/b2oHRnBf9mmZX4nc99u+BJyVsuWliEYxcnn
	dlpxs/xNF8aVj0whKHWPyW3MLZRdrohC3PmzEavQ2qf9sYGDHBmTNI3x395vK3lCP+0zSqE7fntQ5
	vapnlOnkL3YAuppfZPgQabDV0rU9rJPuO9W2Fjj5QF6BxmenJ2Pv+sebKhnbZPF70IWeeVQUkC8Gn
	oepkoct/EnIvPAJSIW45TWQ3lBm3bkGHdVSfMspezq/EuFZC1hFEl7ehvNvSE/vPtZe7k1QgIN6oG
	UsvzF1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHxf-00000002NRB-1Lbf;
	Mon, 27 Jul 2026 09:49:27 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHxb-00000002NPr-2agc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:49:25 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81f3b227a4aso29671677b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145762; cv=none;
        d=google.com; s=arc-20260327;
        b=PjDXFMt6fjbrTiE8pw/WE44+gH8Zzhoo19CUDsGZt8UqMns0S3N2lEkFjhI/77ROaZ
         8L2v6lEffDQ3QurV+o8GecwlL4bTXtkyO6tNgRxFmGJ9QgGEAoVtvyjzsP909MTISvG+
         DbzJK4NLpoNI2J761DzDZlf1b1qzWdSg5Uckuj+uwNG1Fo6hglNUTWUwpZwH7mmd6Odl
         yr/MIJG4Pfz7szh4XK7TA1zcQs2SUfleAOvxx0YPZOVbdaIzf0319vCnqmjsmHg4Xx/F
         5tKQxfNFc10x5pGtuascfLD/d75N08fUG2bhgCLfnrxm1VZ8+kYBNrXm1dECYWvF5zM8
         X9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        fh=86BWRr4/qJVio5lVQBA4ALMl+GEMJDDd84ebNmsTCt8=;
        b=NP8DjhNzfWS3PkH9SO5W7PqI3ZvjF8TWlasuRpekjjx2dvLpMNvzRYmNcISQ89LX84
         JZ5RuI5rlQThDpuJPDSsHrQlI1tAuce69CJEjt7La5+ihysS41YKzfYKr2J/m3SjngWF
         UgOoLuKRB/ARxIIBKSQ8j4NQEQDl5k5p+HPaBw8hxgd2dvYYeGHgctxFzU9Jvmtf+sKC
         GIuelGv6LbMcPRZ/YtZLgyf3WWh7TmfXy0UAy4kusgKGducvXDodNwgfRF2ct6UH1p5E
         sQgqc08INESYyWSd/dTUltvwdjPyKsIzAKgspsrA0pfI0CnK+zmH5i21ZdxPnqmkWKLu
         o81Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145762; x=1785750562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=TSI4/I2iRMdcuwUTBFMSoRqeRL2BjUL7H/1pWdLzcGg+wruqjJzCKhHVGBmSf6DSfr
         JycaZiY8XtQ/TvArHQxglbz8zP105v182rgmHOvU+QheyFzC2YrbSProXEXmiwy2tP1T
         EdtptHMo0BnXfONrZSrBrOHLKCSa4NYcwF+Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145762; x=1785750562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=Z3IAIZnAZKxKfmWAerrI3yu+ha0IagBMlYawu5XYLQBaArCbtmYHb5dzSqAWI0umVG
         KD3sdAG2jTHPP/3TyWR4HYnH30oEqhMUJ2wtToU8qjsILrKLKwpFSG6kLx52FLjwlfgf
         pJqRLuzszB6oPBs4ifF6E5dUFmAxMDknk6dk6Os9fSV5mCq7BU2XVXUVY33CbgoA49B3
         uxRivmro3OyXPX5CYJA6A2EqJDKTt9yRsucJXQpvyH6lU9wAyjKOGjIflbOCvuqWcZSR
         qnKwrK828RDKM7eJqY+tiLZFbTas+12sXJPpEZ4kGFmxen7beMlQdMTx0ab4FeJm7cME
         vxFw==
X-Forwarded-Encrypted: i=1; AHgh+RqGd2a+y3R22AWM2/v4uc31CFeDBA6h7lbJ2mahEYe08R59BlTLLJAHNkpUHp6edMuabC3CoCcp4hJuOJDftKFd@lists.infradead.org
X-Gm-Message-State: AOJu0YzFH/nyD0MZPJaNMPa/xh0P/1oaSjGkwRdqpyu+hGdQG1lnCLPb
	QapGQuWtpmg00MQ1K1BZeZgLOPdfbI1iW7cFbCpFdLqC1n2m2aZEY93iVLfMNElJAaOzCPPKPln
	I5qGXSE9kRAbQkF61rONr10mxgqP2RI7lq0H2yLkt
X-Gm-Gg: AR+sD10fSkp2XPED8Pj9JFxUAJdHccGcGJZrt89NFpGDURGELDASNNZp2w8wJkyw7l4
	yRA9urtxW/xXo912fBTU/Mn4+jbc6gkwfwnC470RWf5yaZdlVo/W7HrDVPNRGr0o6Ur/SJ4VTJY
	tUA8XticRWB4SpYhsBNgr8HyG6B5WSGjL8QnUf01Jp1bagC0USOJkv1mwppzBoQEAFV8rZWvYzi
	I44lb/qhDb8EErldFHDIV3tFL5UwpLbjNwge+FoD8jHVd038d5rktIdE+0lAn+NUgvoRqkWsJXl
	6Y0W4lwwEVpMxW0=
X-Received: by 2002:a05:690c:3744:b0:80c:85c6:8982 with SMTP id
 00721157ae682-81f69e5c41fmr26771557b3.65.1785145762611; Mon, 27 Jul 2026
 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:49:10 +0800
X-Gm-Features: AUfX_mymWG_ASKh7iZ4RJYyJ6_dUoLJGXydzUsgaPikOadmqrflcGR-sfKa6ifw
Message-ID: <CAGXv+5EM5P-cY2VW9MXc_iSjwq=QY1-OaV-s6W8wD8YTUvFN0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial ports
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024923_694123_85F40964 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> On most MediaTek boards only serial0 is aliased, so the remaining
> enabled uarts get first-free ttyS line numbers from the 8250 core in
> probe order. When the console uart defers on its clocks another uart can
> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
> looks like a hang on the serial console, depending on probe order.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>  arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++

These are the only two MediaTek-based Chromebook designs that use
Bluetooth over UART and have a second UART enabled.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # kukui & asurada-hayato

