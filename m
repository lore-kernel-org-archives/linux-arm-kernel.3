Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034DEE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2//9P0I4J3XvBkNzIbbNIA2dq470ULwziNwddPzImEE=; b=HqJgLUkqeV8ba1
	k4hdlXxjnpx2Of55mUeLcBwo4XTGC/Z+doAft8tiOMQ9iTJX2KfmXE6Zz/RgIJI1KY4dWKJcDBa9i
	RcpDx23ttHqtFNIoNb8pg8ImCc0QYba7tkb7RzT5ctciM8S59wb5g6qjeMt6hG7JtJ9W6OhFdsFCp
	mELnTOUhe2WjdDc44vHLF39rH5u3jxdK9Itb51jcxtKNV0xsO0IfLRgjWTTQdNdWTG8QDLi3ZbkUT
	NGYZlBxEzVEUXY6w1djFBnGBjPXk+R6GXalgXukctMUlR1Y/nO4QyZP3Xn5yafUNy/3AjeUIcXYxX
	+3HuGJwxMvcIvNtmqKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CMF-00000009Zsq-1JSC;
	Sat, 02 Nov 2024 11:31:55 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CKX-00000009Zln-3G5Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:30:12 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so959676e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547002; x=1731151802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2//9P0I4J3XvBkNzIbbNIA2dq470ULwziNwddPzImEE=;
        b=tQLcpeImxuc2OUxFk1gXu0cZwOtPAP1YrHkPyjZqeTKmRUKu1FuY5UL6iYysMmz6UP
         QOiSKUT/+p0xSDskYWkzFWrZxVY6eXulTSWsn77gb3USsVOEritp5p79Ydu2TLJU5mcy
         N2UfMGC2AaqQARwK2+N3ODbC7C+VGQOIj+VTSDko/pf73SF8Yi5P31NWZWTsIssimRaO
         pE/zfjnn2QdSafbQ+F2Q93NDb4xYPJhhyTUEyBnSZFUVuMNJ3PhBUEsZZRsijTWIU44m
         HsfWJIVCrrNs6aJ5TCtPl5gRVSeISTPZ/YVWNB3KeMed4NpyuUdU8NS91cHSeZwgNUsB
         JvUA==
X-Forwarded-Encrypted: i=1; AJvYcCUZvWYTBLFqlCEQTfF5/YYxFTzVXab5/+qLqIP2iTF3gUnAmNAWu9+hrzwNa+h1FlmCfhwKARhoxa+fG9KLRhnh@lists.infradead.org
X-Gm-Message-State: AOJu0YwxjxuOovQ8bWI6mWy53hevmyvwaPmEXR+uDH+keKmMTLbdJwFW
	5/qUgut9BW6374CW+gHVYACids8cnkoiAIblp/XUz9CBFIi10jO/xMAD0+5BHnQ=
X-Google-Smtp-Source: AGHT+IGLzNJs0rCHUHCFvZlvT/aoUYS1wvfxvanLA4kYf6aSjQRyU1lMFjFh8ylMz58xkFRB8GUM0w==
X-Received: by 2002:a05:6512:1306:b0:537:a745:3e with SMTP id 2adb3069b0e04-53b7ed1836cmr8158574e87.45.1730547001876;
        Sat, 02 Nov 2024 04:30:01 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde484asm862334e87.287.2024.11.02.04.30.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:30:01 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso20793381fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHnKLoS4/e9cbGdH+TE8MJiv5mNS/HItf187QNm/w7kiaWDY9BAuhTW6uwO750Vqf3o91x4iCZi+JDB4+nN+mN@lists.infradead.org
X-Received: by 2002:a05:651c:1508:b0:2fb:656b:4c69 with SMTP id
 38308e7fff4ca-2fd0df8886amr74910741fa.43.1730547000254; Sat, 02 Nov 2024
 04:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:29:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v66meMUPwOUr4Qutqu7TO-UwDtCdwOhwDv8JE_JMZi=58w@mail.gmail.com>
Message-ID: <CAGb2v66meMUPwOUr4Qutqu7TO-UwDtCdwOhwDv8JE_JMZi=58w@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] arm64: allwinner: A100: enable EHCI, OHCI and
 USB PHY nodes in Perf1
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_043009_843509_670B2642 
X-CRM114-Status: GOOD (  19.69  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> From: Yangtao Li <frank@allwinnertech.com>
>
> Add USB support on A100 perf1 board, which include two USB2.0 port.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
> Changes in V2:
>  - Add dr_mode here, instead of in the .dtsi
>
>  .../allwinner/sun50i-a100-allwinner-perf1.dts | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> index f5c5c1464482..2f8c7ee60283 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -7,6 +7,8 @@
>
>  #include "sun50i-a100.dtsi"
>
> +#include <dt-bindings/gpio/gpio.h>
> +
>  /{
>         model =3D "Allwinner A100 Perf1";
>         compatible =3D "allwinner,a100-perf1", "allwinner,sun50i-a100";
> @@ -18,6 +20,36 @@ aliases {
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       reg_usb1_vbus: usb1-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb1-vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               gpio =3D <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
> +               enable-active-high;
> +       };
> +};
> +
> +&ehci0 {
> +       status =3D "okay";
> +};
> +
> +&ehci1 {
> +       status =3D "okay";
> +};
> +
> +&ohci0 {
> +       status =3D "okay";
> +};
> +
> +&ohci1 {
> +       status =3D "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode =3D "otg";
> +       status =3D "okay";

Since you noted in the previous patch that OTG doesn't work if OHCI0/EHCI0
are enabled and probed before musb, maybe we should keep them disabled
for the time being?

You could leave a TODO item above the &usb_otg node.

ChenYu

>  };
>
>  &pio {
> @@ -178,3 +210,10 @@ &uart0 {
>         pinctrl-0 =3D <&uart0_pb_pins>;
>         status =3D "okay";
>  };
> +
> +&usbphy {
> +       usb0_id_det-gpios =3D <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> +       usb0_vbus-supply =3D <&reg_drivevbus>;
> +       usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +       status =3D "okay";
> +};
> --
> 2.47.0
>

