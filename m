Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB15CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N+5/nHLfNzpH0boX8DeOhGOdzLAP79fhn+X+phaP9A=; b=1Y68sNlVz8gqd3j3kK1cOqXL9a
	e1vjndGMyXYekclYRd517ANh4mOja+3pLSecwWnnjmaxgPlNh0pJRRjT4JGEUfK9hJLw50Gv9/wlq
	IRcdMvWYavRGaoArmkbQwITMO9zgUg1vdz/A8o0aKzPUDigaHGzcKxFhDUAD4+sK7mnkacc2Bm2Ce
	XiUj2wq8rHlnAGJAd6WekTwWUNlsuW3F3WhC8SHm2ShMG2FqAyd//RHLMmATYAu+dUNaC6rqW3os6
	szlHcatN7n7BfKiWltqRcyicDBSFMo9bB2OL+miFHt5kDwqPVrcNko3B/YZ4wm4T5ZIDAxp10eAJS
	ZoxuMUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx7K-00000006xM1-2Ogx;
	Tue, 09 Sep 2025 12:06:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtpB-00000005bml-2CQr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:35:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso41435085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757406935; x=1758011735; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6N+5/nHLfNzpH0boX8DeOhGOdzLAP79fhn+X+phaP9A=;
        b=P6raaxavN6XaUNtQh5NWS4oETxTOc77m+isDVPqCBsy3jubZezuhIhR9PYeD/2FPqi
         HMDHrr3rP7oQdcKp9BCX02boIGT1RKyG6zTpo2D0dtb0BYoHwuvaRa4Tji383w6ZxDoL
         cNX4uAjTa9Vekmtqk6aA3gfs8EJ9xxibv0hHhXpQDbIAN2N+X3y7vuFJ+uWUjmKdsvDq
         sTi81+fjbXuvjkAB+31zpNYUtBTOuyscnDatZ2f9xk4fEsaXEmciTpECvycywI8AERoE
         al86ftiLyxse35aO3m3YdHB6gXfOD+qVJgrvi1Wasez0Y+jwAiY2sBCI5TPPXiXWtPM4
         uCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757406935; x=1758011735;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6N+5/nHLfNzpH0boX8DeOhGOdzLAP79fhn+X+phaP9A=;
        b=aPPE4vJZM19fytCszNK/vh+UlzlE09ZokfMt+JLEtlVF8V0kUfWbYAIuffbQYlm4q1
         QH6iYSbwKioO9u4k7hO52xJUIxS+LXBo0X0P6+nQXnCUGuO4Xrpx9PBlCFD9WopWEX06
         7j19au4JVnJRyfxmHMgdNWkreqG4CJVnRix7dVvwn4m5aDObRDuk3eLEy9kgNvk8uYNT
         eyc/ZEVqtdYeKYOzRsE8dYVfQOxgPAARkuOJ6hG98uCMdxgiz0Co4Xh/TyJXfq934609
         0NytUnZo1ZfoV/JtMaSp3EQvEpEQu44gyv2pC16i1nAe1lRarA66RqOVoniMuhNtuk8s
         /lrA==
X-Forwarded-Encrypted: i=1; AJvYcCVWzRm/iuMaRsOvxvoUHvEuC9zYI935VJJWm7V4kdbtsTpupC9l23dWSf20N/aShBq4BBfcG7hqxVZN33nQJDhg@lists.infradead.org
X-Gm-Message-State: AOJu0YxGZIIxcdfnPKGTt7tQk8qh147OEIlbbKa0YfKOfufK2QW/ITMu
	zgXTwqWzBICG5uTaihaZQJ+qu5czwCqQDF+26I9ZH0CnP2UY+JQR5SHLPznd3bnMveI=
X-Gm-Gg: ASbGncsXueVXiydQHY/3UD08D3qSHvqORrq1VstE6dNfmdm+ubT/FYY8ZycePlDVBZF
	wdKspbNYMdiGTIpEO6GT3Kyz0ZuBBqSYuHnVnMHbvGl8phTeWOh8lRLtxQT3lS0nmUT87DtApvc
	R5ZnpDLLZxQLa1/0tzlA2ASHd091XCmpPUOWVByAfQEWP+Zthz2OQ3BnkpaUIkUswlQl9gRnSiA
	pOmyhglUddpQk9ZXHzfUl3F9q8TrFM90Uy8opm9IdWdmEmIK5FSAhoRLdHIkuHBC50hb691+IAn
	xrm4zlIYYhhOsb3ERUXwl4rpPcJElQXnSjeslysRR8FoFmyqZAeJIUmV2QvrBCoFp8W3cyKaL5Y
	RM4HKySX3xRfYCt5pSljyEk+Ekg==
X-Google-Smtp-Source: AGHT+IFBJ3Z0uXfcWdYuPkWDAS7urMN/Se5ouLEUwPSzoQV8nlN7XUEIwwIC+Zikwt2F+t1XNTI3SQ==
X-Received: by 2002:a05:6000:2311:b0:3b9:14f2:7edf with SMTP id ffacd0b85a97d-3e2ffd7f634mr11493663f8f.1.1757406935303;
        Tue, 09 Sep 2025 01:35:35 -0700 (PDT)
Received: from localhost ([195.52.61.108])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45decf8759esm27587495e9.23.2025.09.09.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:35:34 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a707a77f03150ec3fb16fcc412142aea8aa18ba4074642abf5aac27f6969;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 09 Sep 2025 10:35:26 +0200
Message-Id: <DCO4RGJBMTRM.1XNHG5EHBPS24@baylibre.com>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Enable Main
 UART wakeup
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
 <khilman@baylibre.com>, <a-kaur@ti.com>
X-Mailer: aerc 0.20.1
References: <20250904212827.3730314-1-k-willis@ti.com>
 <20250904212827.3730314-2-k-willis@ti.com>
In-Reply-To: <20250904212827.3730314-2-k-willis@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_013537_706562_3D130C3B 
X-CRM114-Status: GOOD (  17.96  )
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

--a707a77f03150ec3fb16fcc412142aea8aa18ba4074642abf5aac27f6969
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 4, 2025 at 11:28 PM CEST, Kendall Willis wrote:
> The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
> is enabled. Add the necessary pins needed to wakeup the system. Add the
> system idle states that the Main UART can wakeup the system from.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/=
boot/dts/ti/k3-am62x-sk-common.dtsi
> index 13e1d36123d51..72801cf890d20 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -163,14 +163,26 @@ &phy_gmii_sel {
> =20
>  &main_pmx0 {
>  	/* First pad number is ALW package and second is AMC package */
> -	main_uart0_pins_default: main-uart0-default-pins {
> +	main_uart0_tx_pins_default: main-uart0-tx-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
> -			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
>  			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
>  		>;
>  	};
> =20
> +	main_uart0_rx_pins_default: main-uart0-rx-default-pins {
> +		bootph-all;
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
> +		>;
> +	};
> +
> +	main_uart0_rx_pins_wakeup: main-uart0-rx-wakeup-pins {
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (D14/A13) UART0_RXD=
 */
> +		>;
> +	};
> +
>  	main_uart1_pins_default: main-uart1-default-pins {
>  		bootph-pre-ram;
>  		pinctrl-single,pins =3D <
> @@ -342,8 +354,12 @@ &wkup_uart0 {
>  &main_uart0 {
>  	bootph-all;
>  	status =3D "okay";
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&main_uart0_pins_default>;
> +	pinctrl-names =3D "default", "wakeup";

I think you may need to add this to the DT binding of the uart device
as well.

Best
Markus

> +	pinctrl-0 =3D <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_defau=
lt>;
> +	pinctrl-1 =3D <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_wakeu=
p>;
> +	wakeup-source =3D <&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
>  };
> =20
>  &main_uart1 {


--a707a77f03150ec3fb16fcc412142aea8aa18ba4074642abf5aac27f6969
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaL/mzhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNd
gQEA/hNMsUFW+UdVLmVgndckJZ2RHI3dvWGZDIfL72MfMQoA/2/x9L5Jzg9n5J48
Fc4ax/6ykv5Jx18pJrptLgYJLloP
=LJUi
-----END PGP SIGNATURE-----

--a707a77f03150ec3fb16fcc412142aea8aa18ba4074642abf5aac27f6969--

