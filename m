Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58820FD9E12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=; b=P5A7ODnRyXUfyCH6pd1IQK7Q+t
	eLJdJCGYMAOtj4XYf10OolZoSxPmnYVuVlaYokIdO2hpY1zv7L0yqyBL2xPT7gtrYf6YOgMbuUk+m
	u07QuU2vYeMoNWtg1NPnlFM6jxCkm7OJ9z27+2T6DmltkvYP5xS/ssyV+3fH7MuzfMTLKK/uDKPN8
	QhSvSIhzeSYbEZV53jNyJAeb+PMvPIxQWPZVc5qnPnhPgXhxLGkcXQubXuF20AMDE+9BFbEW4YyZP
	A/uD6F6qJDDBdXjx8G7/8JMY7rGmGnj17iCOwewAgII/JVAn7cjM3Z2u7fubtsxqMUqHI5GqtJFYp
	jMFDq9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvish-00000007Eyx-1qQa;
	Thu, 26 Feb 2026 21:26:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvise-00000007EyF-1iWI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:26:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ae239bd19eso1885605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141203; cv=none;
        d=google.com; s=arc-20240605;
        b=TgHtJUaKh5F/gCMusjIz+DiRzH4uo2pAYi5lqWrGlQhJ50wnLKfjdx9RhgxMyKgOty
         IkldAseRM2L7P+DZSl7ez31NtNWqATXY6/Qoz87yQiqlaF1hU0TR+EPALfdQQ8iW3fdH
         nWb/CSq2HC2F6BVIvyNFO7yV4JpI6XPEKuC1jVibxPfzBzTUgkd+sc0klZgJDeIesesb
         dghOWW6bX9LHuxZ+xVOHmfIsn/jZJ9EeeMbmSn+YmdhZja7zg5PGXkpmt83aR+71Mh2e
         Cd0oOcCJptARZUxVGSDtlCKIgyVlWA799tj0VakS8x/EYP2RtUXvdC+ol31u86bzSsVN
         6cyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        fh=zE7wBaXAKwQf97kCEDqwH2eiLeS2zSagNeaZvf3KCec=;
        b=Kp1Vlj7Lsdbd/EldBBeNGYDq27IOguKnzewMudhCBTz5xPvo0BDQkjV6iUDhmERz6o
         a46uAV46S5m/zEXrLd/SzlXEBU1vinCyeY7sq9WyJoIR6b626VB/BDcE7SJVV0fDqEWC
         TiBb39hoy4wOEyoBImkSmnkQdurJdldq3tfvDmwRvKWFX7Za/g8zQ/2XnZs1dsyk0Vbp
         AFNXB45+xxj/rN51+nRkvW4BunsIDDJESsF+txmLL/vpMa02zXGMUff8XgFRD/Mf2mHV
         0glFBkBv2Bwx+DTjDg8vrRBcb5Qy3XzLgSK7SF7nxBkFfv8/XhZKDZmT7RnHQjk1HjBy
         RZlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141203; x=1772746003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        b=SU78ggHl4MawWgNoQis/YiFYurcstI+9cj4+pExKGXxVOw6qIhl9X8rFjih0I4i2c+
         k/gvKFSSIh+wMQDbVHrWOFPJjZK8GMgX8r7Z/xA61hs3LuS1btGnxjmGgD5DHNdhLwiA
         A3ZL/wmkkm8F7tdZ6Z6td2lRga77wEj7cKKQG2pubk0lca/EV+d8uFCYbKFx6A2R8VlF
         03wJl5UfcT3ww9XxEGcnMdzPltaUphotQ28gUBdxGF65dfRA9p147HYZ+pBVJ92IFMwd
         2vzL/S4HBxt/wolS2xXoeCPrtPy181ClF6ftpyXNlrWclCn9gCdnjTsZZemoS6BxBBZr
         iZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141203; x=1772746003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        b=RrF8LZgjiHPA3BkCEaPj3M4qYMvwPcTJx3+/veMaBG84BQV1nSQFWObSO9dMN7N/+3
         c8F6Z3IY8maEylosnsGS4pEafpYkmq2EUoBfUmDvgoeDgty0pnTIahdpLvlRJzonrJDE
         3WFsKf8YNH4h91Ph8PsJ9reNWcEWRgp1Zb4kwrzT9+Z1NOOCThawgUSc2RelQnKF87su
         CUKdQ51TbkqzunUibE/aLoELeNV2kXZmamDrrt/9UC8nkCdN5xnIF0nGFXkvV9BS3bNd
         vGQzJZuB9tu6ifDI88Mz/p43LxAzqY9F5+X7CAM+SNClIIRxkNoEUIKCrD6E55lZaETd
         jEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUUeerqG4t/JEt6YOm6TZL+Ee8wo/Oy/y8e2Kr71t0IRAwZKSbU/a7+waVv/OfLM+2rbZ2zseXB7z/ahQv03iJS@lists.infradead.org
X-Gm-Message-State: AOJu0YySu6Y0VOQwwOPEcMt/z/9lAwqEQsvxM79vFWEBRbzyn5N1W5dC
	1CxKSqTAz9zAS6+Clzg5p4Sz9BUOW40ocye73fQqd5CLdTqcW0dojM2E8ypKuDtYV+khNykGgu1
	FvYnlfRTwrkvc5RpZhA4B+TUxf7kZC1U=
X-Gm-Gg: ATEYQzwSpJQ/09lfQDCDXlpwiCOteg9mkS+uoQWhaSn/g6el8PHMB5VFDuEepLl0Eys
	kbZdH3qEkWFLUldMcbULsZD/n9D10vZsHo5KVS6HkZVmDvw1tWwWBPvMDjx/4MTELW4m7BNcHH9
	uSGtRoXYM5nBVlHhsxcrFcURfgGqKL8unL+mrlD6AUTprjRWyMTkWUeqNP8Zs31eDGVwDeMQ8/y
	XQasbHpfd+yw3AP5vixKfsb4zjQ1cEyb5BJtclOd7JNbanQhX60qgeC9lt7EPt3vFmGlySut0q8
	d4dztF7HM/4gjZU5e/6NWWJZ5M5hSjiw9mgizzTU
X-Received: by 2002:a17:902:d592:b0:2ab:230d:2d96 with SMTP id
 d9443c01a7336-2ae2e3ce58bmr3604695ad.11.1772141202912; Thu, 26 Feb 2026
 13:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-2-nick@khadas.com>
In-Reply-To: <20260123022258.136448-2-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:26:31 +0100
X-Gm-Features: AaiRm510mQz5OMzE6LAMHDV7opdj7qiogaLj9z0r4G-Q4maIhZU0npcoFSphQrM
Message-ID: <CAFBinCBvwhvOwMJYuvVyubCi2KSGaRq3+RdX2fcj=7zLhSX+tQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: amlogic: meson-s4: add UART_A node
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132644_459199_41C90A57 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Nick,

On Fri, Jan 23, 2026 at 3:23=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
[...]
> +                               a_uart_pins: a_uart {
> +                                       mux {
> +                                               groups =3D "uart_a_tx",
> +                                                      "uart_a_rx",
> +                                                      "uart_a_cts",
> +                                                      "uart_a_rts";
> +                                               function =3D "uart_a";
> +                                       };
> +                               };
Can we please keep the split between rx/tx and rts/cts pins (as we
have it on other SoCs)?
It is likely that many boards follow the same path as Khadas VIM1S
(and Amlogic's reference design). For those boards that aren't it
would be great if they don't have to update meson-s4.dtsi.

>                                 i2c0_pins1: i2c0-pins1 {
>                                         mux {
>                                                 groups =3D "i2c0_sda",
> @@ -814,6 +824,18 @@ mdio0: mdio {
>                         };
>                 };
>
> +               uart_a: serial@fe078000 {
> +                       compatible =3D "amlogic,meson-s4-uart",
> +                                    "amlogic,meson-ao-uart";
> +                       reg =3D <0x0 0xfe078000 0x0 0x18>;
> +                       interrupts =3D <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>=
;
> +                       clocks =3D <&xtal>, <&clkc_periphs CLKID_UART_A>,=
 <&xtal>;
> +                       clock-names =3D "xtal", "pclk", "baud";
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&a_uart_pins>;
For consistency I also prefer if you could move this to
meson-s4-s905y4-khadas-vim1s.dts (patch 2)


Thank you!
Martin

