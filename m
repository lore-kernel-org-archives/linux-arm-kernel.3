Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09FFC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry2yqY4fcB8r6JNTuIg6GJi9ZBAG4EVyeQwgDvrWgsM=; b=2TINxdguaXZBp8lJYwEy5Z7FYB
	OZKDDi4iWrMNAnxe6cb8pI2eJ1K1BKNaKYdEWs1d7gaWhP7NRmclD0AjsQi9kIWU3Yjf/MFdZWthO
	uOUl2aVAk6v5Ox2IecOrjC/Y/Oe6RkdG444my4k3SvtPZegOxuQdUkYFH2DbLVErAJ/VmrkWaFOip
	py6IPUB7SOSVCzw0h+AOrICiU7sbxNXTTLfyULYfmNKa2ELBxUGnXRIYpRwoC0CEI8zCFQ4YmPEJZ
	3G8bsjGPH47A+SdRcEkKKpA81h0rIsEnNQE6vzOa+/4JHf7luGYjGaGJlyMc/pA01B/itu0QLW3UX
	NfRbZTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKdi-00000009h9E-1pz1;
	Thu, 17 Jul 2025 09:10:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJzo-00000009ZaU-1tCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 08:29:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so616325a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752740978; x=1753345778; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry2yqY4fcB8r6JNTuIg6GJi9ZBAG4EVyeQwgDvrWgsM=;
        b=COBm3Pt9WDqQiTGH2JQGcOtRQM2094tXvANokpYGi9mWtW2hcnIn1nWOWPpnu1439/
         grAcz0kYqiJHafuJf3zkyu3WSv+f/CjrZ7woBtYbtSSYd6gBVY0f8eHepazTa+1M8iBH
         2SBfCWx46oFfKeiCTfoE8jRgxsipplOh2xGM9+kA027YAmXOQ4a0b1cbxMHhMl4ZK8IM
         OhL4rLnv7TLiDUToiv1whlHboU3aCqw1lEnpceexztbzt7ILCMijF0SNV8y/wTrSaVPK
         TkpTqogltb5zAINk8Ca2rgtIYIW2UuxfnBge+C2tkBbgkdQmvtvIkWEXoHnQrlwVwyIs
         PdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752740978; x=1753345778;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ry2yqY4fcB8r6JNTuIg6GJi9ZBAG4EVyeQwgDvrWgsM=;
        b=j3bcgubOhxGHnQ4ZKXXThfw+CtMNwMWOgMw54LCNOXUn2S8medmq/cOZ4+P94YKtfM
         6SLnhdd8isvalV6PkauVPhTZ+CNeGY1dvtDHhBitoGr9YVir9ZwhK9vYOc6Vg/Dmzxkc
         ykDOg+gNB/3kfnp+R5WQ15oHTUrKq5ptShhb94mBjvHvq+q4McQ3l9pgMggLNbwjzo4V
         pF3ymep6hLhtbYuIi2BIjTwNb9sNLOEj1IQlmOgXXiNoonnyHQa2cfhF1sUvKXKQmv3U
         2PP4S3O62sH+HKM/2RMVK8x13d20kadP/rbago5Izco/a8btSujTudHwYohB/rVY3rT3
         4AyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuYw9kft7ILY/HI395ExljSX4BGXVbg6IwDJZ8l4kK9KBIbS/WF3FWyjO3HeXia1wS29MPh7TDKF9nLxrgXnEV@lists.infradead.org
X-Gm-Message-State: AOJu0YySrHwcovGgrzKiwyj0ONPFPQUXdWtHIREN4TNXW4vNbHQoH7vB
	SxNygSwC/XNZ8bmANqC3AwrC4zxEZhPTIpWsF+qikRpvl4H57wbaDxPDS6ufMMZagiM=
X-Gm-Gg: ASbGncsRPB1zIwUoOH1PPFFwEfAptPTjuWqt9w4HXIN/NQOBkv4PkI4UU3FQwCFWpyD
	bEx7YEbYvZ3kjqudfKYT8WtAe9kLwxf/p0htLZWYYqMNf7IAdykiYNa4gZZg8453E9WdMYhsof6
	yVE8aeits5cenzhmdif+T39vKI+dckTr+VzU/pUchpKLxVMv3ACOxOR5bITdm3NrsOVLc7aWJE/
	wLJmYkXwZbrj/hiF8eUqC+mROnvADcsw4zsKI8bo11aGarUMRPIIvfWw6CXK/bl7UMTq30mNL1v
	LV46GuMzzOX/sUjrE593Zn0jxT4l+hshjdJ2CvGOKVoFYg9K/EXPKXhabuLDN8bz4hksgOcV0gO
	t8lL5t4hG86rUHzd+Ogx8ZlMY0GtIzyBVudrR3QN8A0498Eg2StGIlmRTxr67I+kgk38=
X-Google-Smtp-Source: AGHT+IE+TdhlMPh+u91g6pE8N6/1/E6+tgQ36t4anhpy9DrzlSFmbhQrj6aJo6OAcbvrAeM2GDcPYg==
X-Received: by 2002:a05:6402:35c4:b0:608:6501:6a1f with SMTP id 4fb4d7f45d1cf-61285916635mr4613521a12.1.1752740978021;
        Thu, 17 Jul 2025 01:29:38 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9796432sm9746425a12.73.2025.07.17.01.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 01:29:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 10:29:35 +0200
Message-Id: <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
In-Reply-To: <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_012940_510555_963690F4 
X-CRM114-Status: GOOD (  23.21  )
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

On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
> On 7/13/25 10:05 AM, Luca Weiss wrote:
>> Add a devicetree description for the Milos SoC, which is for example
>> Snapdragon 7s Gen 3 (SM7635).
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu =3D <&cpu0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu =3D <&cpu1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu =3D <&cpu2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu =3D <&cpu3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu =3D <&cpu4>;
>> +				};
>> +
>> +				core1 {
>> +					cpu =3D <&cpu5>;
>> +				};
>> +
>> +				core2 {
>> +					cpu =3D <&cpu6>;
>> +				};
>> +			};
>> +
>> +			cluster2 {
>> +				core0 {
>> +					cpu =3D <&cpu7>;
>> +				};
>> +			};
>> +		};
>
> I'm getting mixed information about the core topology..=20
>
> What does dmesg say wrt this line?
>
> CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n

[    0.003570] CPU1: Booted secondary processor 0x0000000100 [0x410fd801]
[    0.004738] CPU2: Booted secondary processor 0x0000000200 [0x410fd801]
[    0.005783] CPU3: Booted secondary processor 0x0000000300 [0x410fd801]
[    0.007206] CPU4: Booted secondary processor 0x0000000400 [0x410fd811]
[    0.008206] CPU5: Booted secondary processor 0x0000000500 [0x410fd811]
[    0.009073] CPU6: Booted secondary processor 0x0000000600 [0x410fd811]
[    0.010406] CPU7: Booted secondary processor 0x0000000700 [0x410fd811]

>
>> +	pmu-a520 {
>> +		compatible =3D "arm,cortex-a520-pmu";
>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +
>> +	pmu-a720 {
>> +		compatible =3D "arm,cortex-a720-pmu";
>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>
> See:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to a=
dd PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for=
 the ARM PMUs")

Sure, will take a look.

>
> [...]
>
>> +		gcc: clock-controller@100000 {
>> +			compatible =3D "qcom,milos-gcc";
>> +			reg =3D <0x0 0x00100000 0x0 0x1f4200>;
>> +
>> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&sleep_clk>,
>> +				 <0>, /* pcie_0_pipe_clk */
>> +				 <0>, /* pcie_1_pipe_clk */
>> +				 <0>, /* ufs_phy_rx_symbol_0_clk */
>> +				 <0>, /* ufs_phy_rx_symbol_1_clk */
>> +				 <0>, /* ufs_phy_tx_symbol_0_clk */
>> +				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
>> +			protected-clocks =3D <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
>> +					<GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
>> +					<GCC_PCIE_1_PHY_RCHNG_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> +					<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> +					<GCC_PCIE_1_PIPE_DIV2_CLK>, <GCC_PCIE_1_PIPE_DIV2_CLK_SRC>,
>> +					<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
>
> Does access control disallow accessing these on your prod-fused
> device?

Hm, taking another look, this property should probably be moved to
device dts.

Downstream has this in volcano.dtsi but volcano6i.dtsi (QCM6690?) and
volcano6ip.dtsi (QCS6690?) have a /delete-property/ for this, because
they have PCIe available.

I don't think this has anything to do with secure boot fuses, but I
don't think I have tried enabling these clocks on my SB-off prototype.

>
> [...]
>
>> +		usb_1: usb@a600000 {
>> +			compatible =3D "qcom,milos-dwc3", "qcom,snps-dwc3";
>> +			reg =3D <0x0 0x0a600000 0x0 0x10000>;
>
> size =3D 0xfc_000

Ack

>
> [...]
>
>> +
>> +			clocks =3D <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names =3D "cfg_noc",
>> +				      "core",
>> +				      "iface",
>> +				      "sleep",
>> +				      "mock_utmi",
>> +				      "xo";
>> +
>> +			assigned-clocks =3D <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +			assigned-clock-rates =3D <19200000>, <133333333>;
>
> Set the latter to 200000000 - your device doesn't have USB3, but the
> next person may lose their hair about tracking down why it doesn't
> work on theirs

Ah, I think I only checked the downstream reference which was patched to
be qcom,core-clk-rate =3D <133333333>; for FP6. The original file does
have:

  qcom,core-clk-rate =3D <200000000>;
  qcom,core-clk-rate-disconnected =3D <133333333>;

>
> [...]
>
>> +		pdc: interrupt-controller@b220000 {
>> +			compatible =3D "qcom,milos-pdc", "qcom,pdc";
>> +			reg =3D <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
>
> 1 per line, please

Ack

>
>> +			interrupt-parent =3D <&intc>;
>> +
>> +			qcom,pdc-ranges =3D <0 480 40>, <40 140 11>, <51 527 47>,
>> +					  <98 609 31>, <129 63 1>, <130 716 12>,
>> +					  <142 251 5>;
>> +
>> +			#interrupt-cells =3D <2>;
>> +			interrupt-controller;
>> +		};
>> +
>> +		tsens0: thermal-sensor@c228000 {
>> +			compatible =3D "qcom,milos-tsens", "qcom,tsens-v2";
>> +			reg =3D <0x0 0x0c228000 0x0 0x1ff>, /* TM */
>> +			      <0x0 0x0c222000 0x0 0x1ff>; /* SROT */
>
> drop the comments
>
> the sizes are 0x1000 for both regions for both controllers

Ack

>
>> +
>> +			interrupts =3D <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>
> pdc 26

You mean replace <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH> with
<&pdc 26 IRQ_TYPE_LEVEL_HIGH> (plus interrupts-extended)?

I assume you got this from internal docs, but just to mention,
volcano-thermal.dtsi contains GIC_SPI 506 (+ 507 for tsens1).

>
>> +				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names =3D "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors =3D <15>;
>> +
>> +			#thermal-sensor-cells =3D <1>;
>> +		};
>> +
>> +		tsens1: thermal-sensor@c229000 {
>> +			compatible =3D "qcom,milos-tsens", "qcom,tsens-v2";
>> +			reg =3D <0x0 0x0c229000 0x0 0x1ff>, /* TM */
>> +			      <0x0 0x0c223000 0x0 0x1ff>; /* SROT */
>> +
>> +			interrupts =3D <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
>
> pdc 27

same as above

>
>> +				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names =3D "uplow",
>> +					  "critical";
>> +
>> +			#qcom,sensors =3D <14>;
>> +
>> +			#thermal-sensor-cells =3D <1>;
>> +		};
>> +
>> +		aoss_qmp: power-management@c300000 {
>> +			compatible =3D "qcom,milos-aoss-qmp", "qcom,aoss-qmp";
>> +			reg =3D <0x0 0x0c300000 0x0 0x400>;
>> +
>> +			interrupt-parent =3D <&ipcc>;
>> +			interrupts-extended =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLI=
NK_QMP
>> +						     IRQ_TYPE_EDGE_RISING>;
>> +
>> +			mboxes =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +			#clock-cells =3D <0>;
>> +		};
>> +
>> +		sram@c3f0000 {
>> +			compatible =3D "qcom,rpmh-stats";
>> +			reg =3D <0x0 0x0c3f0000 0x0 0x400>;
>> +		};
>> +
>> +		spmi_bus: spmi@c400000 {
>> +			compatible =3D "qcom,spmi-pmic-arb";
>
> There's two bus instances on this platform, check out the x1e binding

Will do

>
> [...]
>
>> +		intc: interrupt-controller@17100000 {
>> +			compatible =3D "arm,gic-v3";
>> +			reg =3D <0x0 0x17100000 0x0 0x10000>,	/* GICD */
>> +			      <0x0 0x17180000 0x0 0x200000>;	/* GICR * 8 */
>
> drop the comments please

Ack

>
> [...]
>
>> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
>> +			clock-names =3D "xo", "alternate";
>
> 1 a line, please

Ack

>
> [...]
>
>> +		cpuss0-thermal {
>> +			thermal-sensors =3D <&tsens0 1>;
>> +
>> +			trips {
>> +				cpuss0-hot {
>> +					temperature =3D <110000>;
>> +					hysteresis =3D <1000>;
>> +					type =3D "hot";
>> +				};
>> +
>> +				cpuss0-critical {
>> +					temperature =3D <115000>;
>> +					hysteresis =3D <0>;
>> +					type =3D "critical";
>> +				};
>> +			};
>> +		};
>
> See:
>
> 06eadce93697 ("arm64: dts: qcom: x1e80100: Drop unused passive thermal tr=
ip points for CPU")
>
> (tldr drop non-critical trips for CPU)

Will take a look.

Regards
Luca

>
> Konrad


