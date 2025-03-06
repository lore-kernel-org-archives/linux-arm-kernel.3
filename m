Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128BCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm2qV+PayrFKZi2Qr9jDYU/KnrvQXtIuUzSZ0SYEFfA=; b=ul29vHzA/RX5cYoV44/UgPtvRQ
	5EgvvIwWl2f3zZ31+WLQ0pYjkHrkFA9WQp6K2EsuzHWN9Bk9morA5H7OVQOXhsaoD/WREhCtmx3g2
	GrzLUJ+ATYl/Do+6lzbxhC5UFcrriHzJ3d9mjRq3qmdFTefqJ/fl4E7kBtkUh7u2YPuqK/LZ/TsOb
	3yFqpF6upzUOkHPp6MwRS6pXjz+eVNqa0wiMajP4aX8EuMIQnWW+uSMAj6cfSyelUyH6JikkbsX/j
	e279fhkU1Z9ME7mHW46d3SwujdrY7o3nwndYUQzFXh8I7+a+VdZfDCkoZa8bJ15aamZNyHhLFy9Td
	MflDZTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqK9i-0000000CQNB-1xGw;
	Thu, 06 Mar 2025 22:57:30 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqK86-0000000CQCW-0cDB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:55:51 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54964f8ce4bso1195988e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741301748; x=1741906548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm2qV+PayrFKZi2Qr9jDYU/KnrvQXtIuUzSZ0SYEFfA=;
        b=P5vNZ+UFE/ONpYTblJYJcwFihwJhoansHra1c7J+o3EAgcG/DFu5I2M74aRZoghVbG
         ADlLbv1rTHlZ/jMuA+pk4R0vWU06XiPjtzti8Q2jLevD8zyHlEGTyXh6Cnu6WsJTyRqb
         l4pI5BMcm9/6hTL7E5lSurQV+DYr+B4fmhtfVTbFQLe92Hd26dNBKUegDskvejB0KptD
         yJcmzQrQlxjTNh8AGHasrlbLarjWnADVZ6Ipejm2C76KEghmYQHX8AVtFIGVLB0UQbsk
         gIkuyNDi0crUpGYFUyJIIz/z0ioqy5r7qFDlMjkAye4vC7UIY9aKy89ywLX45pRBK/jA
         NyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741301748; x=1741906548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nm2qV+PayrFKZi2Qr9jDYU/KnrvQXtIuUzSZ0SYEFfA=;
        b=FF41z18pcUndfVakhwOpjnitGqfME0PGrmbcjn/p8KQz/ct6yPG5VcL0fO2JeAIluY
         kqsiSIVaYLglJg3qTbgjaYUqXRzc5vx8MG2HO8EntCBxWsyQoEnqaqFYAoA5yy6PzhvL
         TOvQ8VOqynGDx/bYO4Hneu1GKduKUBI7lLtaL1iAD/gEspvKUNz+KQBLVvqN8ZlWTjvn
         T+jQi3n5Hjdm6bfPuTUilv9Gsi3eAywz9ANNtut97CarvalzcfzYzO4qbrU6TysTPCWl
         83EJAl9BTLdajzNVTA0+1xOfMLOP8z7nubW8LxfgzTwJ2lwGWccVkynwslzvypqMvVFJ
         ruYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTHwehJ+v1vM5WCG6SdAlCkNTosNnSFm7+k6bMRUKp5vxtx25pWZqcbFnSNJe9zUKO+MRVvREP6tnzOtk0+jlf@lists.infradead.org
X-Gm-Message-State: AOJu0YzOMT8fZ7KsJthSBHVXfRwdnq3gF9pnZBKGqRvxuYWOZKJp3XOe
	zYfxzQ86PJvDbIZZ8DyOaujO9dYgTRtT0ocE+0t1TqK/RIPF/dHkm4mdDV+faIR6D4PF4KUF3Tu
	j1aefLAU6eZDx9dJWNUmdfR6O868=
X-Gm-Gg: ASbGncveQVq859OjkPrzaAutevuo/t2KuxrUfjyV8d0xmjC3oAlgLB3/nV7x9BL/dYo
	qCXLdg1rVrUtdOx9uKEKQS68CSciLqrS2/6u1kGvB40LOsLfFMSR0+QfIrCL6t39OxsMCo/NvZ/
	exhW7JoHeHDsbT9seKvXvQYE9eJKv3x2HyU89hMFja2MZwXnjUty0jr9tpyA==
X-Google-Smtp-Source: AGHT+IELLnqdwKJ1evQmnO6miMjCOF6kWpjNInySnrLYVu8W39JXHce4tfrcyF/HH/vVvtpBmKUXlY5IKpjWjhg+MpM=
X-Received: by 2002:a05:6512:1112:b0:549:4d7d:b61b with SMTP id
 2adb3069b0e04-54990eab0f1mr333594e87.35.1741301747365; Thu, 06 Mar 2025
 14:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20250306222359.797855-1-Frank.Li@nxp.com>
In-Reply-To: <20250306222359.797855-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Mar 2025 19:55:36 -0300
X-Gm-Features: AQ5f1Jrc9-FFNpCeyDExi95YGo2Kn5IirxDCaG51gdscsys4mOsD1AzjUc9N6UE
Message-ID: <CAOMZO5CL-qQSHuSoCtb+f_mqNG8vu4tTVDi-ThoHq+m9SeagxA@mail.gmail.com>
Subject: Re: [PATCH] ARM64: dts: imx8mp-evk: add ecspi2 support
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_145550_185691_1E3F25BB 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, Mar 6, 2025 at 7:24=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&ecspi2 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       num-cs =3D <1>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> +       status =3D "okay";
> +
> +       spidev1: spi@0 {
> +               compatible =3D "rohm,dh2228fv";

That's not a correct description of the hardware.

Conor's effort was to clean up the abuses of using "rohm,dh2228fv" to
get spidev support.

Please check:

fc28d1c1fe3b3 ("spi: spidev: add correct compatible for Rohm BH2228FV")

