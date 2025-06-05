Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F59C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07Pr/3RW2zLHEhFDRanXb6IABI33Ahx5XZcAGV/Afqg=; b=sA310IksoWsHZ544lJlNV84IiK
	JNJzwIpr8GiBIinZF7peOsCK77yq/SGq6pEYlpwQC3Xxtg/oCQqoi0bUMIVIjYoS5SArHTu+hCBxz
	w1hOzX9DCeNYm2MQijmt3f9HAWJMVtPHNXa1mjitZrXnI+zBI5+VNlopVPH+s4OcZVDBW0ftEtGyY
	8OBMMwRKzRaNPCMwhtPLcVImoZjTTKnD/DGFOuV5jvLTCi+qa0kaeGmCpqY4zYtbzxH7WMqawl6Lu
	7dz6ad7i9S4VT3SBDjjEXJ2MmZ1w32h8fA3Aig4l0vur+lmX1TcdcRudGSNoKm5AmSqWPg34RLjms
	g+qX7hFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGAA-0000000GT36-0HQc;
	Thu, 05 Jun 2025 19:22:06 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNG81-0000000GSow-40c6;
	Thu, 05 Jun 2025 19:19:55 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a44e3928a9so14936801cf.2;
        Thu, 05 Jun 2025 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749151192; x=1749755992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Pr/3RW2zLHEhFDRanXb6IABI33Ahx5XZcAGV/Afqg=;
        b=Apf9RUT8I/qqPvHb23PBIURPiUEdEKCoEjHdAop35JKkgb+vUZGO9mzu5LPiUAi96m
         i4E7AZk0B7+jwe+H9nxdrM0ybiadRmNJRk/o7JEi+zoqR0cddMoQAyBJWWs1j8KScL+H
         SQxNSnNKguac+de7E7Q3V2Fo6dxpaHboLXX7CNdsvvTU7ERhuiT84LlvzPuv+mIH2V4+
         13/A94btPrGPgjt6zwoWMz0q0acpm8ls9hjYE+dEuHb6dI9DYavaYnp5i3m5EyPAr6AX
         PndU5qfi0FoRcNc9SfpYb1xwITFCXsK/KYU3x8qNPTpXeFLWEo09lzvXYK9hN+cvsxvd
         ozbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151192; x=1749755992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Pr/3RW2zLHEhFDRanXb6IABI33Ahx5XZcAGV/Afqg=;
        b=wbtGvMwV34CsTwA6udwau4WZ7NbtPLGrf4b3hzTtih47nFuXqvVIq8TOpFurEv0Dqp
         sR1/07gE77AYnqsUnm11tA13EjZ20MTPLL1NRxc4M8OvSetvRW/2NP5jUtjOf/vfKm3x
         fha/ckTQ3bzGERWyJjOlBcRvhGa8Tnb7UwGRJJetg1WqRo9QFwcpkcB0B9yb63oclxbw
         vThXokrfh6BPP5JUKhMYjvENDkf7HAnWHdMP/Hu/p/8golN80sl1U3psRzGp6rfzifEQ
         fFv/VkAhoSawA9vgGIBaYN2dZvfXwNwofOj047BDKBN+qTHrO5KHSXQWSgXMmFvTIOc4
         JyFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2VvA7BsqO6B85VK0HTXORf9yG/YuZGE3Gau/UQRxx8Q85SCa0LxtXtDD5CC7aDkvF6Bl9BMH7YnhRGkIwRrg=@lists.infradead.org, AJvYcCX8d+sIesI2wdnwu8ewu1u1FedMHi54A3HDg7X5AjrBBBWPvLG35+GrQyujK4o3L/h8VH3mj5A0JIvVdP9LD1c9@lists.infradead.org
X-Gm-Message-State: AOJu0YzDZNurMc60+iEEKmosDxRRLcaHsMcKIxcbb3P0lCBbaisxSyqw
	G4LBah9WJB6TR9Hk5pgu4aetF0x18omgKED5EyMYlBjnZ3h5YrowTTfPHNck5lfEWR2/MOJ4Jcw
	UMsghzTtuqdFaB1anMJzMT6JQWiHZQGk=
X-Gm-Gg: ASbGnct1DvM3dfyjYFKH25PWPM/3HnxSY9d3xc5mw82ai4oOAix5kHaRZFOiX+PD5rl
	W11CRXTvEWaahHvlX2a+3nAFnYh5grzL3Ae84cg6hwOGE+5y8HibYlLvj0++sp/H/jcR098z0gR
	wKRMOSSiy+K0Q5ZCJaQ5fwU4V6xjq4/tWH5D7T3oCiBUgU
X-Google-Smtp-Source: AGHT+IFCqGBmttXS2MNsvkjz2Oag4+7fLFaxxoaskycYOFPeR6iWx5WNapqSo9nz4/NLFcssJHKpXKF6je1fcsq0xWA=
X-Received: by 2002:a05:622a:581b:b0:4a4:4206:b6f3 with SMTP id
 d75a77b69052e-4a5b9e00ed4mr11050881cf.10.1749151192105; Thu, 05 Jun 2025
 12:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com> <20250425-rk3576-tsadc-upstream-v5-6-0c840b99c30e@collabora.com>
In-Reply-To: <20250425-rk3576-tsadc-upstream-v5-6-0c840b99c30e@collabora.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 23:19:39 +0400
X-Gm-Features: AX0GCFsHLRy0Dx5vZtQW6clXPjR-z7m8YaqdEawS_nTns43C_dVBSJ1PP5R5jWo
Message-ID: <CABjd4YwrraMC587sn1afA+pHGA-P25xhEMh7AJJQbQ5RwYJPsg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: rockchip: Add thermal nodes to RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_121953_995162_99C3EDC6 
X-CRM114-Status: GOOD (  23.16  )
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

Hi Nicolas,

On Thu, Jun 5, 2025 at 11:07=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Add the TSADC node to the RK3576. Additionally, add everything the TSADC
> needs to function, i.e. thermal zones, their trip points and maps, as
> well as adjust the CPU cooling-cells property.
>
> The polling-delay properties are set to 0 as we do have interrupts for
> this TSADC on this particular SoC.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 164 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 162 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index a6bfef82d50bc9b0203a04324d61e0f232b61a65..1c07ad78c9230f1e46b0ef881=
7834f58b19eb86b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/power/rockchip,rk3576-power.h>
>  #include <dt-bindings/reset/rockchip,rk3576-cru.h>
>  #include <dt-bindings/soc/rockchip,boot-mode.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  / {
>         compatible =3D "rockchip,rk3576";
> @@ -113,9 +114,9 @@ cpu_l0: cpu@0 {
>                         capacity-dmips-mhz =3D <485>;
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_L>;
>                         operating-points-v2 =3D <&cluster0_opp_table>;
> -                       #cooling-cells =3D <2>;
>                         dynamic-power-coefficient =3D <120>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_l1: cpu@1 {
> @@ -127,6 +128,7 @@ cpu_l1: cpu@1 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_L>;
>                         operating-points-v2 =3D <&cluster0_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_l2: cpu@2 {
> @@ -138,6 +140,7 @@ cpu_l2: cpu@2 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_L>;
>                         operating-points-v2 =3D <&cluster0_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_l3: cpu@3 {
> @@ -149,6 +152,7 @@ cpu_l3: cpu@3 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_L>;
>                         operating-points-v2 =3D <&cluster0_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_b0: cpu@100 {
> @@ -159,9 +163,9 @@ cpu_b0: cpu@100 {
>                         capacity-dmips-mhz =3D <1024>;
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_B>;
>                         operating-points-v2 =3D <&cluster1_opp_table>;
> -                       #cooling-cells =3D <2>;
>                         dynamic-power-coefficient =3D <320>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_b1: cpu@101 {
> @@ -173,6 +177,7 @@ cpu_b1: cpu@101 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_B>;
>                         operating-points-v2 =3D <&cluster1_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_b2: cpu@102 {
> @@ -184,6 +189,7 @@ cpu_b2: cpu@102 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_B>;
>                         operating-points-v2 =3D <&cluster1_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu_b3: cpu@103 {
> @@ -195,6 +201,7 @@ cpu_b3: cpu@103 {
>                         clocks =3D <&scmi_clk SCMI_ARMCLK_B>;
>                         operating-points-v2 =3D <&cluster1_opp_table>;
>                         cpu-idle-states =3D <&CPU_SLEEP>;
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 idle-states {
> @@ -436,6 +443,143 @@ psci {
>                 method =3D "smc";
>         };
>
> +       thermal_zones: thermal-zones {
> +               /* sensor near the center of the SoC */
> +               package_thermal: package-thermal {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsadc 0>;
> +
> +                       trips {
> +                               package_crit: package-crit {
> +                                       temperature =3D <115000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               /* sensor for cluster1 (big Cortex-A72 cores) */
> +               bigcore_thermal: bigcore-thermal {
> +                       polling-delay-passive =3D <0>;

I've tried these on my board, and it seems that with a zero here it
never stops throttling the CPU even after it cools down. I believe you
need something like <100> here, which is what I used on RK3588 for
similar reasons.

I think it's because the TSADC only fires an interrupt when the
temperature crosses the trip point, but the thermal governor also
needs to observe temperature trends and step up / step down the
cooling states depending on whether the system is cooling sufficiently
or not. So it needs to poll the temperature once the cooling device is
activated (passive in this case).

> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsadc 1>;
> +
> +                       trips {
> +                               bigcore_alert: bigcore-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               bigcore_crit: bigcore-crit {
> +                                       temperature =3D <115000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip =3D <&bigcore_alert>;
> +                                       cooling-device =3D
> +                                               <&cpu_b0 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_b1 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_b2 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_b3 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               /* sensor for cluster0 (little Cortex-A53 cores) */
> +               littlecore_thermal: littlecore-thermal {
> +                       polling-delay-passive =3D <0>;

polling-delay-passive =3D <100>;

> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsadc 2>;
> +
> +                       trips {
> +                               littlecore_alert: littlecore-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               littlecore_crit: littlecore-crit {
> +                                       temperature =3D <115000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip =3D <&littlecore_alert>;
> +                                       cooling-device =3D
> +                                               <&cpu_l0 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_l1 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_l2 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>,
> +                                               <&cpu_l3 THERMAL_NO_LIMIT=
 THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               gpu_thermal: gpu-thermal {
> +                       polling-delay-passive =3D <0>;

polling-delay-passive =3D <100>;

Best regards,
Alexey

