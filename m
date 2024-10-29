Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4652AD3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBBr9PVNtdgQsTniZ2+GcCDI9QqqpSb+yyyMoN//IIw=; b=0etXifWgqXdciHwuQah+xOlXNm
	+Wiazxa4HbJLB2u3UpJ5urdc/D3AJPfrDjSO8/vh+A9ZOqEl3ETxO7V39I3CmPHspV/7XvGpZtpfC
	r37+HYuVB8IkEQ5bTK7eBjhBgEiTS0/cQoGbmtIyLPLWlK41IrBXy2+AArNVJPquygVs93KO/bORU
	szraT6PpHWFew/eM1afrH3Kwr+3gya6by9S6UVebQyL6tPcZKIbP3ve0OMqbEXld60Qk5z5t4WHqF
	laSemfbMC0gM5OpFrVIhueCvUTfQJ7GSTbPYcmJqSJkY6Qias+Do2vbkhqbfzBy0xYjxTSNgMt+yJ
	X+vEuStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5n5N-0000000EiPX-2ziO;
	Tue, 29 Oct 2024 14:20:41 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5n3j-0000000Ei74-3HQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:19:01 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e290222fdd0so4893463276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730211538; x=1730816338; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QBBr9PVNtdgQsTniZ2+GcCDI9QqqpSb+yyyMoN//IIw=;
        b=IO4JaoMD40Wr69wqFIIg870gi4atvwPrjKgKPfPgIcrpe60u412uQL9b4/PUff1ExM
         CYJiQpVPHE8xZBR6gnHBEqefQJv7ccBOIaHVzzb4/CD0CFFFOuKrgVxo+mI0Lk8Du3ce
         y0xP6CvycZWbpWB70qz9F1wLMG+C1Vh7QrxaGyu/HKlbpF04oBEvuJRdlPh050/0Lcvb
         4oVbh/mp0bKtwULWDx7zbeFpayHDSuWG8yoNvhTQzjsEruR2w2X/DPd8+WPTrvnulDbI
         WOi9nPgJ5QO4RjV8w50MRvTxxb+RS7MEFvQhW4ue/d1ULjTXSRKvNtAPv+gbKPwPu4rA
         jpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211538; x=1730816338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBBr9PVNtdgQsTniZ2+GcCDI9QqqpSb+yyyMoN//IIw=;
        b=DtBMrdOXaBX7vh1tA5jz4vYRYtorMChCLxtifd8uZyGPqtHXodoR3W0kzw/xis4G2N
         kfk1sVysJPtdUkIDo8ouDFxSQ6gxt7txmg/P4iyZ2qtmtJdE3v+SwSvY68oe3tbvab5I
         2/NKvDAnTttaATili1QITw5LjV1XJgkNo9/UwsHKDfGZsXjZA8+G9KCHqZSl26AlpnGB
         TichrNKxgkD8yN9QFRfFA2HHPmq/CMSEiIr15CEvb3aMnq2H2NMhhCpAgJQevo5maaOd
         TsFdqmp4Itmvd1hqyD8SfpM82YcwCAY9Qko8K6QpVRsxjipAVR5p16qTQ8yhMQAHAZxg
         lVBA==
X-Forwarded-Encrypted: i=1; AJvYcCUJTO06ln/4BkrGhH3OV1qGbuW29sd62g3n3ADq7/JA0kXK0EDe9kDw+pvQcsrg6iW5ik/UAyJoGdiI5PFd53lt@lists.infradead.org
X-Gm-Message-State: AOJu0YxCA8eT+nOg50Fmss10E4d5uME2XWB3FG+CgPLILEIklxJO8p4Y
	dWk+ij+8OQiS5ifEnHjamLUOygMpjCryzCNPBD6rR4nK7x8Wvjguzzpy1JSRgzpqPIGFLTVk+sm
	mA85hRAwYKkx0y1AAKSUlSEIUK+ccoQZVuaAYlA==
X-Google-Smtp-Source: AGHT+IF2dDM+2wHeikQnbusjP6tus4NSSa9hS97g++mzsFrCKMa6E+sBpWqeOs0vHXBac6MRluw4GV/WHJm4d3jAe9g=
X-Received: by 2002:a05:690c:4886:b0:6e3:3326:91e6 with SMTP id
 00721157ae682-6e9d8ad527bmr128784717b3.44.1730211537715; Tue, 29 Oct 2024
 07:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
 <20241028-qcom_ipq_cmnpll-v5-4-339994b0388d@quicinc.com> <crcbzpxjnbceilqccbwr7uyak6z6zdwr7mhfcyaw6vvpcce6ko@zrojbtqi4st4>
 <b5e6e81e-dab2-43d8-b52e-85b6cb0d0209@quicinc.com>
In-Reply-To: <b5e6e81e-dab2-43d8-b52e-85b6cb0d0209@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 16:18:44 +0200
Message-ID: <CAA8EJpoQO7=v8QWeH8MAgX4uU=m4VJqfC3J5PKyySM2TBcHWiw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_071859_851205_F162585F 
X-CRM114-Status: GOOD (  31.67  )
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

On Tue, 29 Oct 2024 at 15:31, Jie Luo <quic_luoj@quicinc.com> wrote:
>
>
>
> On 10/28/2024 11:39 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 10:04:11PM +0800, Luo Jie wrote:
> >> The CMN PLL clock controller allows selection of an input clock rate
> >> from a defined set of input clock rates. It in-turn supplies fixed
> >> rate output clocks to the hardware blocks that provide the ethernet
> >> functions such as PPE (Packet Process Engine) and connected switch or
> >> PHY, and to GCC.
> >>
> >> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> >> the internal WiFi block.
> >> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> >>
> >> The reference input clock from WiFi to CMN PLL is fully controlled by
> >> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> >> Based on this frequency, the divider in the internal Wi-Fi block is
> >> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> >> ensure output clock to CMN PLL is 48 MHZ.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
> >>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
> >>   2 files changed, 40 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> index 91e104b0f865..f026c2a9d0c0 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> @@ -3,7 +3,7 @@
> >>    * IPQ9574 RDP board common device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   /dts-v1/;
> >> @@ -164,6 +164,20 @@ &usb3 {
> >>      status = "okay";
> >>   };
> >>
> >> +/*
> >> + * The bootstrap pins for the board select the XO clock frequency,
> >> + * which automatically enables the right dividers to ensure the
> >> + * reference clock output to CMNPLL is 48 MHZ.
> >> + */
> >> +&cmn_pll_ref_clk {
> >> +    clock-div = <1>;
> >> +    clock-mult = <1>;
> >> +};
> >> +
> >>   &xo_board_clk {
> >>      clock-frequency = <24000000>;
> >>   };
> >> +
> >> +&xo_clk {
> >> +    clock-frequency = <48000000>;
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> index 14c7b3a78442..ad9cdb1f76db 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> @@ -3,10 +3,11 @@
> >>    * IPQ9574 SoC device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   #include <dt-bindings/clock/qcom,apss-ipq.h>
> >> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> >>   #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> >>   #include <dt-bindings/interconnect/qcom,ipq9574.h>
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> @@ -19,6 +20,12 @@ / {
> >>      #size-cells = <2>;
> >>
> >>      clocks {
> >> +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> >> +                    compatible = "fixed-factor-clock";
> >> +                    clocks = <&xo_clk>;
> >> +                    #clock-cells = <0>;
> >> +            };
> >> +
> >>              sleep_clk: sleep-clk {
> >>                      compatible = "fixed-clock";
> >>                      #clock-cells = <0>;
> >> @@ -28,6 +35,11 @@ xo_board_clk: xo-board-clk {
> >>                      compatible = "fixed-clock";
> >>                      #clock-cells = <0>;
> >>              };
> >> +
> >> +            xo_clk: xo-clk {
> >> +                    compatible = "fixed-clock";
> >> +                    #clock-cells = <0>;
> >> +            };
> >
> > What is the difference between xo_clk and xo_board_clk? Are there two
> > different crystals?
>
> The xo_board_clk of 24 MHZ is generated by applying another divider in
> HW (by 2), on top of the same 48 MHZ clock output from internal Wi-Fi.
>
> XO (48 MHZ or 96 MHZ)-->WiFi (mul/div)-->48 MHZ-->fixed factor divider 2
> by HW ---> xo_board_clk (24 MHZ)
>
> We may need to correct its clock chain representation. We will update
> xo_board_clk as a fixed factor (div by 2) clock, and refer to the 48 MHZ
> input clock, using a separate patch after the CMN PLL patch series
> review is concluded. Hope this approach is fine.

Yes, please. Don't try to 'shortcut' the hardware description.
Describing the actual hardware is the best way to work.

-- 
With best wishes
Dmitry

