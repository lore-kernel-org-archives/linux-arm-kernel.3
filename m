Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C72DC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=; b=A8DPj1PBPCpRLH6MTLsSwxaxpS
	XNGWhQEvsvFBqjTMbWPCkoTKYYcqbFruby93c3n7AgdvKo2HBxiYnF97hfmrpukGUxzzmDPJFnNXv
	f9hM+XbU8A0I7d+xSmEFhGQkj2/Q3fPY0CfKQHN1qjBhUQyFHnQHE3dLY5l4zWfQSlfyy6LlE5smh
	haXAyP1K/cWwspBd72c8//YkAk82jC2jenBaKFIemvlUzYwREWdYtIfGlLgSYGLVF+HBJEfaCNYFR
	QyeKpZhE6YUWh6iyW5pjbBNyVr3Eh9sfWK7BdfplXqt/RImy4q83ys/C3omAS4p2hov9YSYGQIJvD
	2SraVT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE0V-00000001mVR-1iyG;
	Tue, 04 Aug 2026 12:12:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE0T-00000001mUj-0ePZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:12:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a10a1a4b11so3094334a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845547; cv=none;
        d=google.com; s=arc-20260327;
        b=OFaA8DoEuVAuu4Hszth+Dwgvi6DUXBD0BEr0rjmYIuuBV8yvweZI28mbLa6OJT51pg
         SbIIFmGB+yOxIVqgvY/3tlKVfEQMyVkLJMxEw979Q3Gqj1QSJYcIq69AQZRw+R1lHm9p
         dK+6djnkPuE2U9HOYOpEmCY5q4o4bwCOJ9QLEBLawbO/UOxDHnQ1rYGPk6jMoyUzGr7R
         gwFvMXw0HVsqNRPhlDwaTUEXfLa/7lFK5KcKiAEnySBpL351LdqoigXyACYGwZzYTtKD
         I/9cf/B1vxgA+nlALa7DvvOtVY5J55wanWr4s622tKU8jKbdvymtPL1Bq2Afw7irQsQx
         lErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        fh=H4OgFBrOOvAKp2Vo74p0diiXXCBclrpI3bdOCWoekVQ=;
        b=XpBwpqEc/yhsf/KqnFJj8BeVamqUihzYLdkEkeVXE0LtHG5endCtp6/Z1pqj572cKi
         U/0IBQyBdDVH6Rl1rMun06cXd/rNf7wfP8lJV5qayWxoSXWVjyprZUz4+2hT6+Qkauff
         CSDJzYiELpKp/pLErWZ9F0McRTRYWfYub4bQV3oJ8J4Jt9rnt6X7RUnZ+BL38lxGQyPd
         jc9qacyJ2uPeKocCPDS9VRyE75VIBXkYcOpKRaZsAI75/hdF46cdDijJmVkc7C9EmKI9
         eVukf5j+xbxxET0OwBQeJzTTFF5vIZkBiFS40HLQdzZudOhU1Lf4mallWYiIslDyk/WO
         ZYCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845547; x=1786450347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        b=Nvphuv+ZDiGrcyyO6G/yhDEZmW5aWvQr0GzTL9T9To1zazlxXFVtCLl4WFti5y4quY
         879kbhklUgwcKBMeFUCrMwJTfPigAL/zbk4MpcCWleFPExtBP+BflU9W+7omonpPKqxx
         uyRfTpehJ5po5KdiUO0nWMwOhib2qigr+8zNhQKsKuz0fT0I+Ulzl4iGwcJUEAHm8jcT
         kAwC+tnOu3LDkMeCCTgRDeB47Jt8aBAqovsHYQIYziY2W9GKIJPHbGyL1+z+UUs79Zng
         acsBbHksqxlEA12KNyEvw+2wDvdsjsOHi1+bVUgb9bag2+oD1tBWT3nBamchHa0zKnw4
         nvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845547; x=1786450347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        b=VqKXRJldQtQkXxEQJkzQNYC/FGXUU93MSQ3SaiTjSnmDL6Xk4JMthndGwUGsVwen+S
         cGadvhccY4WLoiTctn41Qm20nKkDLVCZNiXcGz8lLgXDm7MdnDut1N4dgMVQ0+sLmcE5
         aTPWLqgtiWnh1QKPI5ApdytsopqvLpvJJHvtKs7l25fAEjECfaDJ/gapLRUid9D31gLO
         lwRDGJouSMguTqiVs/3bo4jnJKmdMQ//k80h5crjgxFqZ75YsCBi1gZVBxUCYIbfrQUj
         +PpyDvsmOk+O92u2lzBgLmdMRi3iEk86VKjCssLoOQGyI58j3Yuw1ONhDDgOFgwq9lT+
         c8/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1y3sSFd45iX+hDdX9vRMDHkfz5dJNBw/Q5TiQKGWLWyk5+qcNcDbyhbdsrJJrYWF54f9VAKM9HLN5giA2iL3W@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kKo1wKPz7tQYg+aH1xhXdGEaJWYGa0cvyZxvxOjHuR7n9rJM
	9WrX5xDEXBnI+hZxopAjWBxdk4ZXLBKExo76+h+rYlLzlLERqEq7+jwqoYvq5rmIIzpCGn91l/A
	Luy+71xrrZZI95JcIDSoENB+NkuqdB8W/wh2vuqRbLw==
X-Gm-Gg: AR+sD11R16APgp4bv7HspGHRPjk9ErStyBZ7/ghxNIM1T7Sv1cI3tJNt4vKK8I03qUy
	a/927CHWczUCjkpmbdc0ZU9ZzJ31vrffBFH9QhYtZi5F7E7vvtPNHdFV4aSprdHZYMkhcqEl5TL
	Bm1vXJE08pwJtqjjuTa0H0y6BK2zF1PY7XHick0y5zK1Is5YSVTvf7wpdhHQOXiMaPVfwwCrWxF
	USb1I1CCMTyYAiUsYt45Fku2w0Bcrl+4TgNG3R0Q959A3I28YKeUBMG0OyHOQS56mS9umyavOA0
	+ghlNw8v2TVCnXnovWlTfaJp4ojrQgsNGjg/dIE3C7HLNLSB5g2s6vLtA5IPkSa7k7z4fikTcPj
	q+PQ=
X-Received: by 2002:a05:6402:5bc7:b0:6a0:f9b2:4d5e with SMTP id
 4fb4d7f45d1cf-6a0f9b24eb6mr4339426a12.18.1785845547188; Tue, 04 Aug 2026
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:12:14 +0100
X-Gm-Features: AUfX_myz2rIr2To8pMiIrq3ny4dPMR2EiexQ93XXgjZCqitEJdVPlOyQLL_LX4E
Message-ID: <CADrjBPoaf7-tXMnvQFZ7fV25Lb8R=95PgDqbkjDBDT+XadBfHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_051229_253114_639AE9B5 
X-CRM114-Status: GOOD (  16.72  )
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

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>
>   [required-blank-lines] "status" must be preceded by a blank line
>   [property-order] property 'phy-mode' out of canonical order (should sor=
t before 'status')
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  6 ++++--
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/=
tesla/fsd-evb.dts
> index 9ff22e1c8723..73b6a25e0e4d 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -65,9 +65,10 @@ codec {
>  };
>
>  &ethernet0 {
> +       phy-mode =3D "rgmii-id";
> +
>         status =3D "okay";
>
> -       phy-mode =3D "rgmii-id";
>         fixed-link {
>                 speed =3D <1000>;
>                 full-duplex;
> @@ -75,9 +76,10 @@ fixed-link {
>  };
>
>  &ethernet1 {
> +       phy-mode =3D "rgmii-id";
> +
>         status =3D "okay";
>
> -       phy-mode =3D "rgmii-id";
>         fixed-link {
>                 speed =3D <1000>;
>                 full-duplex;
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tes=
la/fsd.dtsi
> index 5b06e2667b89..214d33ca7177 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -603,6 +603,7 @@ serial_0: serial@14180000 {
>                                  <&clock_peric PERIC_SCLK_UART0>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         samsung,uart-fifosize =3D <64>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -616,6 +617,7 @@ serial_1: serial@14190000 {
>                                  <&clock_peric PERIC_SCLK_UART1>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         samsung,uart-fifosize =3D <64>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -658,6 +660,7 @@ pwm_0: pwm@14100000 {
>                         #pwm-cells =3D <3>;
>                         clocks =3D <&clock_peric PERIC_PWM0_IPCLKPORT_I_P=
CLK_S0>;
>                         clock-names =3D "timers";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -668,6 +671,7 @@ pwm_1: pwm@14110000 {
>                         #pwm-cells =3D <3>;
>                         clocks =3D <&clock_peric PERIC_PWM1_IPCLKPORT_I_P=
CLK_S0>;
>                         clock-names =3D "timers";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -681,6 +685,7 @@ hsi2c_0: i2c@14200000 {
>                         pinctrl-0 =3D <&hs_i2c0_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C0>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -694,6 +699,7 @@ hsi2c_1: i2c@14210000 {
>                         pinctrl-0 =3D <&hs_i2c1_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C1>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -707,6 +713,7 @@ hsi2c_2: i2c@14220000 {
>                         pinctrl-0 =3D <&hs_i2c2_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C2>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -720,6 +727,7 @@ hsi2c_3: i2c@14230000 {
>                         pinctrl-0 =3D <&hs_i2c3_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C3>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -733,6 +741,7 @@ hsi2c_4: i2c@14240000 {
>                         pinctrl-0 =3D <&hs_i2c4_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C4>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -746,6 +755,7 @@ hsi2c_5: i2c@14250000 {
>                         pinctrl-0 =3D <&hs_i2c5_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C5>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -759,6 +769,7 @@ hsi2c_6: i2c@14260000 {
>                         pinctrl-0 =3D <&hs_i2c6_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C6>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -772,6 +783,7 @@ hsi2c_7: i2c@14270000 {
>                         pinctrl-0 =3D <&hs_i2c7_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C7>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -789,6 +801,7 @@ i2s_0: i2s@140e0000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&i2s0_bus>;
>                         #sound-dai-cells =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -806,6 +819,7 @@ i2s_1: i2s@140f0000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&i2s1_bus>;
>                         #sound-dai-cells =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -840,6 +854,7 @@ m_can0: can@14088000 {
>                                  <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -857,6 +872,7 @@ m_can1: can@14098000 {
>                                  <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -874,6 +890,7 @@ m_can2: can@140a8000 {
>                                  <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -891,6 +908,7 @@ m_can3: can@140b8000 {
>                                  <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -909,6 +927,7 @@ spi_0: spi@14140000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi0_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -927,6 +946,7 @@ spi_1: spi@14150000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi1_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -945,6 +965,7 @@ spi_2: spi@14160000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi2_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1007,6 +1028,7 @@ ethernet1: ethernet@14300000 {
>                                     <&eth1_rx_ctrl>, <&eth1_mdio>;
>                         local-mac-address =3D [00 00 00 00 00 00];
>                         iommus =3D <&smmu_peric 0x0 0x1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1026,6 +1048,7 @@ ufs: ufs@15120000 {
>                         pinctrl-0 =3D <&ufs_rst_n &ufs_refclk_out>;
>                         phys =3D <&ufs_phy>;
>                         phy-names =3D "ufs-phy";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1056,6 +1079,7 @@ ethernet0: ethernet@15300000 {
>                                     <&eth0_rx_ctrl>, <&eth0_mdio>;
>                         local-mac-address =3D [00 00 00 00 00 00];
>                         iommus =3D <&smmu_fsys0 0x0 0x1>;
> +
>                         status =3D "disabled";
>                 };
>         };
>
> --
> 2.53.0
>

