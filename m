Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E9D0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=; b=yhjCAWXOVCBQQ22l61KzsZ+w7E
	kiB4ORhYapVfKK8rYPxJg6OIpDOn0h1eXNmu89bxjxE7ZBRHr+ZACM8KzPUQNSIeCSUgpCgK8k1cQ
	Wf3MXgxEgCYo6ezaTi8yZQadZLJ5Mzmzu56LfPPgsVR1OH6jm2xOIMt3exkt4u1RUyPtsLrQa6ooN
	Z3/k976wLCLR3mnqkgbHSPi2eztk1nu35haUeszKRh7TGpoRKF7ay8mo4SmrCdL/zyMMoAsHszhUA
	UD4qVTSxxRAiEAymYnSgIkaQ5ObQ/ZlBx8Rx54bllvmR76ysLO4X621aF3JwyCMBB6s1Wa/N7Pfpm
	wjrgSGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LU7-000000043Ab-3FOF;
	Fri, 25 Oct 2024 14:40:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kwc-00000003vkb-0c4r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:05:39 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so22362971fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865136; x=1730469936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=u3GEc0ZEvEu/xkHgbPtJaXtdTz2UlXL+e3JR+Tpp73AbK3aM4gY3HB49DyGylGWWp3
         n5/Xralfj0LM+BTTVbcPqMSjoGsG9n1SYxpb3nYaJ8hhkBcdMn3DL9oje4CJG3mTN+sG
         FdHhpFweFY6iP8E0cPG9BHlo4U8QN5tMSw4wV8bQ+eT2f48G4qGKyE9LNyRjYOx2lQa2
         qB9qDWH7unFHOX3NQzicy25MU56PN0SX+5HqDW7mqBNghbTS87hIWpXMYve3F+TqmMEV
         H96hnRSzMCCgTxjSNAanuFWLxUivw/GR6aqfp4VMEEQlfbPbotrodg0o3EKCHFNrRnqE
         borw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865136; x=1730469936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=M2DRthgcmkToSmpkI5508q8BfdgHmREbCPuZYnsQfRcAZ4N3WnfY97dfmoYjA5QlQY
         lzQZfYaakCtTnrihXze3U0VEYO8zqfpEnmb7XOy4FwCvt4rrnCnZlB7Pfgv1AvOWbh+U
         arS/ViasHMs6znGQB/VpROz7SdI52VJCk2eIoEfSzAouHF8CyolKdxyB+m544N9ZmYFZ
         bUC+vx0IQHaKBGuIZZ9QGYzEU1Y3u0dkEkNGGK7n4+6T+hRXXtE3/j8NiorarpMSkySD
         OaLYPNs6bY5tlU9F5EdjwbaJxYKFEVkYN1tTOfxH7Y9w/pO0mEE8McAALqHZNjRBzR4j
         y2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQgjbmTkZz1+U6k1HawJBUU3z93MkIMT03QFZtOW8DBezTC96FhSsckbiMvrq3RR/N8+HafLHp2GAUfSiOPYDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5qW0/XOLn5P26V8UCms4zM+myhaSGNSNz3UZ2ZIqMa6sjUqJl
	loU4xOiLiQqWH1mAr6CLKvVsOmfQ24VFv0Mge1iU8OAjYSnXBxFcskCFyuyLF9Y=
X-Google-Smtp-Source: AGHT+IGPO2N8dVilguOrd+D3mg0S1fdvTrVMbg1ZQKzSI2X+KHFMOXe6V+CSQpm6d8eAH4CXe6TVWw==
X-Received: by 2002:a2e:4c0a:0:b0:2f6:4f17:aeaf with SMTP id 38308e7fff4ca-2fc9d586fc6mr34505861fa.45.1729865135784;
        Fri, 25 Oct 2024 07:05:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4612a5asm1984121fa.122.2024.10.25.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:05:34 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:05:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Message-ID: <g3wh3yjkzgdfwbj4hnabtmziwsmqn3cloffblhshrkgj3tx4h7@2w2ho2mvs5c6>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
 <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
 <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
 <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
 <32dbf7ee-1190-401c-b6b1-bc8c70a5158c@quicinc.com>
 <cqgkc3qpupbv47rqxiyhe2m466zxcxepyfcgyaieo2sggffprx@mstqi4pqoiqc>
 <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070538_218481_BD88A0C0 
X-CRM114-Status: GOOD (  47.22  )
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

On Wed, Oct 23, 2024 at 09:05:09PM +0800, Jie Luo wrote:
> 
> 
> On 10/18/2024 11:38 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 10:03:08PM +0800, Jie Luo wrote:
> > > 
> > > 
> > > On 10/18/2024 4:11 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
> > > > > > > The CMN PLL clock controller allows selection of an input
> > > > > > > clock rate from a defined set of input clock rates. It in-turn
> > > > > > > supplies fixed rate output clocks to the hardware blocks that
> > > > > > > provide ethernet functions such as PPE (Packet Process Engine)
> > > > > > > and connected switch or PHY, and to GCC.
> > > > > > > 
> > > > > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
> > > > > > >     2 files changed, 24 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > index 91e104b0f865..77e1e42083f3 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > @@ -3,7 +3,7 @@
> > > > > > >      * IPQ9574 RDP board common device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     /dts-v1/;
> > > > > > > @@ -164,6 +164,10 @@ &usb3 {
> > > > > > >        status = "okay";
> > > > > > >     };
> > > > > > > 
> > > > > > > +&cmn_pll_ref_clk {
> > > > > > > +    clock-frequency = <48000000>;
> > > > > > > +};
> > > > > > > +
> > > > > > >     &xo_board_clk {
> > > > > > >        clock-frequency = <24000000>;
> > > > > > >     };
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > index 14c7b3a78442..93f66bb83c5a 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > @@ -3,10 +3,11 @@
> > > > > > >      * IPQ9574 SoC device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     #include <dt-bindings/clock/qcom,apss-ipq.h>
> > > > > > > +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> > > > > > >     #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> > > > > > >     #include <dt-bindings/interconnect/qcom,ipq9574.h>
> > > > > > >     #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > @@ -19,6 +20,11 @@ / {
> > > > > > >        #size-cells = <2>;
> > > > > > > 
> > > > > > >        clocks {
> > > > > > > +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> > > > > > > +                    compatible = "fixed-clock";
> > > > > > > +                    #clock-cells = <0>;
> > > > > > > +            };
> > > > > > 
> > > > > > Which block provides this clock? If it is provided by the external XO
> > > > > > then it should not be a part of the SoC dtsi.
> > > > > 
> > > > > The on-chip WiFi block supplies this reference clock. So keeping it in
> > > > > the SoC DTSI is perhaps appropriate.
> > > > 
> > > > Then maybe it should be provided by the WiFi device node? At least you
> > > > should document your design decisions in the commit message.
> > > 
> > > This CMN PLL reference clock is fixed rate and is automatically
> > > generated by the SoC's internal Wi-Fi hardware block with no software
> > > configuration required from the Wi-Fi side.
> > > 
> > > Sure, I will enhance the commit message to add the information on the
> > > fixed reference clock from Wi-Fi block. Hope this is ok.
> > 
> > We have other fixed clocks which are provided by hardware blocks.
> > Without additional details it is impossible to answer whether it is fine
> > or not.
> 
> There is an XO on the board which supplies reference clock (48Mhz or
> 96Mhz) to the Wi-Fi block on the SoC. There is a multiplier/divider in
> the Wi-Fi block, which ensures the output reference clock of 48Mhz is
> supplied to CMN PLL block.
> 
> In summary, below is the path to receive the reference clock at CMN PLL:
> The clock path is .XO (48 MHZ/96 MHZ) --> WiFi (multiplier/divider) -->(48
> MHZ) --> CMN PLL.
> 
> There is no software configuration required for the entire path, as it
> is fully controlled by bootstrap pins on the board. There are bootstrap
> pins for selecting the selecting the XO frequency (48Mhz or 96Mhz) and
> based on this, the divider is automatically selected by HW (1 for 48Mhz,
> 2 for 96Mhz), to ensure output clock to CMN PLL is 48Mhz.

If the clock is always fixed to this frequency, then it's ok, thank you.

> 
> > 
> > > 
> > > > 
> > > > Also, I don't think this node passes DT schema validation. Did you check it?
> > > 
> > > Yes, the DT is validated against the schema, I have shared the logs
> > > below. Could you please let me know If anything needs rectification?
> > 
> > I see, you are setting the cmn_pll_ref_clk frequency in the
> > ipq9574-rdp-common.dtsi file. If the PLL is internal to the SoC, why is
> > the frequency set outside of it? Is it generated by multiplying the XO
> > clk? Should you be using fixed-factor clock instead?
> > 
> 
> Since the reference clock is controlled by bootstrap pins on the board,
> it may be appropriate to define the frequency for this reference clock
> in the board DTS. Given the clock tree described above, I will update
> the cmn_pll_ref_clk to define it as a fixed-factor clock as per your
> suggestion, with its frequency and factors configured in board DTSI.
> These values defined in rdp-common.dtsi will be default values that can
> be overridden if necessary by different boards. Hope this approach is
> fine.
> 
> In ipq9574.dtsi:
> cmn_pll_ref_clk: cmn-pll-ref-clk {
> 
>         compatible = "fixed-factor-clock";
> 
>         clocks = <&xo_clk>;
> 
> 	#clock-cells = <0>;
> };
> 
> xo_clk: xo {
> 	compatible = "fixed-clock";
> 	#clock-cells = <0>;
> };
> 
> In ipq9574-rdp-common.dtsi.
> &cmn_pll_ref_clk {
> 	clock-div = <1>;
> 	clock-mult = <1>;
> };
> 
> &xo_clk {
> 	clock-frequency = <48000000>;
> }

Sounds perfect, thank you!


-- 
With best wishes
Dmitry

