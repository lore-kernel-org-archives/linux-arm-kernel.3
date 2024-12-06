Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11791E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMSODDuTWYMCqnQmcsCAgVDwoQ/gvjhGxVvo+2PJpAU=; b=U1UgtC06HCq4KTP+sftDnPh1si
	0EANzF4uIhRtaPJo/edTM6yfWxeQBP+g5mdR0B5oMzb3cRVbRvW9spdkEI0AU5GRS7pphjyAAZvhO
	n8nA7MQOlSbVmvvszzDENAqjkrHd+FYHAGN11MVzXGqpil7kpZbutDKw/AjXH+kg1UiMfdonoaiSP
	R37Fq8W5pwGFX9mMNDi+fgaFk/YRK556muRz+JuNrZ7Nphwjrce3If7J3xccZY+W1JPb2rBgagZE2
	kkwJqFUPBDHTgO5AG1XEyGtWfZeEYS3oU/kZDZGfE5HgI2Aw9jkV0blnIPz4XRcYcfqKNQZFmMCe9
	SbLBoK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT9f-00000000qoI-1OFQ;
	Fri, 06 Dec 2024 07:53:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT7l-00000000qTa-48Xm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 07:51:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa543c4db92so351462566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 23:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733471500; x=1734076300; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMSODDuTWYMCqnQmcsCAgVDwoQ/gvjhGxVvo+2PJpAU=;
        b=L8It9zt1NFclWBexz1jDq035h60CWP7B+Dl3o5knwLWbUXDwNIWSrI7u81c3hWD7Ay
         E8CHqpnE6Vw0oiUVeMy0o+gK2Lj9WXb8A8oLb/G+UJT5WLnAVWVlE+xXVfh1JkBL9GTl
         LZ6xNKyuoJSNOpW2MU6Ynt15T1j+V1FuNBlnSrtbcc3ldv0qssFA/qYKe+fZF2U9Uu0p
         eLH+ZbNogR+zsHDB6tC0dqzZ63cpGSa0oEwxByM6klXQrP33ChKxQMqkgyFmkRfXuOzE
         7lW8TkchRyJFzIFe58Oi+Kh7An7Br8E2nbnIzhPPqb3aeBFlJiGMGTI7Fbazq5Qzhbjk
         /KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471500; x=1734076300;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMSODDuTWYMCqnQmcsCAgVDwoQ/gvjhGxVvo+2PJpAU=;
        b=nlGPKN3FpXeLGLurjeSZ1P5Ds96Ki9kV45dK+DV+BrfgxhI/d7EE43csr67qROU2Af
         J5FckTS938jHTwesjBkLtBiZc1DeL3nCHXmIq12123w08Z9WYSKVJxmg5MYpuhyzYPw/
         y0YJPLuLdG5whkNt7myH5qcDKAEnTzy2lLt/FtwbvK1AeG3u3fHp1vYcHPiLT1eTvpxF
         s2TAfmHT23abIo4U78sZpibvnCShjDrRGXYhEC0rpkXp5DeHRb5Nyh8MJ5cSxG89aGPD
         MvP1YNetAOKOvnuI6OF7iPSg5xnlbRXbDz2vX6L5xWaS5IUoiKktLPc3NjISv+Vk2xU0
         gvNw==
X-Gm-Message-State: AOJu0YyekRLXAdL61MXgGvV1VIzlL8rtDT7f1Z/hIApG6mog19kG7Gl/
	OwgPw5ucwb22g+qSboxd0sq4vUc7i/iBMv7ED4cW6pQJVV0TMwM3BQOXCutGWZ0=
X-Gm-Gg: ASbGncv4w/nmUQKewp9rW+rS//U2NJQEjcK0mRkk8STDzPq8p+z7mNGmzrASYKonSi4
	LrglXN7tUr46YPUnUqLgk7+SfOY13d1pyDU4wFvWxHb+/xZAoFgpkVf1ppfOUEHzH3J+7CIeuS4
	vPRYqru4OlBZMG7fUyJDFW9pIEM30ZIRc2vozjiAmbGbDTqDxoAjcUSEH+FTIRntQoLxba348Km
	ZKFhDCOLvWkcmpkolkGUPM2jjUTF0lrUmEggnNrpKogr5Xp0w==
X-Google-Smtp-Source: AGHT+IEXnhfYAgg+zFyFvcMBx4BeVI9aw8zLvzM3EY4sd3zAvVXVgM9zAr4iiUvpyKcAKsgto/JFfA==
X-Received: by 2002:a17:906:2929:b0:aa5:1ef5:261e with SMTP id a640c23a62f3a-aa639fec9dfmr145411266b.17.1733471500236;
        Thu, 05 Dec 2024 23:51:40 -0800 (PST)
Received: from localhost ([41.66.99.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c3esm203780066b.68.2024.12.05.23.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 23:51:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 08:51:38 +0100
Message-Id: <D64GD0NCHTO3.2W6LZKBMNE8UU@fairphone.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_235142_026642_416EC3FC 
X-CRM114-Status: GOOD (  13.77  )
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

On Wed Dec 4, 2024 at 11:00 AM CET, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Hi Vikram,

This is working on QCM6490 Fairphone 5 smartphone with WIP drivers for
IMX858 and S5KJN1, thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 172 +++++++++++++++++++++++++++
>  1 file changed, 172 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 55db1c83ef55..e363996602d6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,178 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		camss: camss@acb3000 {
> +			compatible =3D "qcom,sc7280-camss";
> +
> +			reg =3D <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0accf000 0x0 0x1000>,
> +			      <0x0 0x0ace0000 0x0 0x2000>,
> +			      <0x0 0x0ace2000 0x0 0x2000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0accb000 0x0 0x4000>;
> +			reg-names =3D "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CLK>,
> +				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>;
> +			clock-names =3D "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_camera_ahb",
> +				      "gcc_cam_hf_axi",
> +				      "icp_ahb",
> +				      "vfe0",
> +				      "vfe0_axi",
> +				      "vfe0_cphy_rx",
> +				      "vfe0_csid",
> +				      "vfe1",
> +				      "vfe1_axi",
> +				      "vfe1_cphy_rx",
> +				      "vfe1_csid",
> +				      "vfe2",
> +				      "vfe2_axi",
> +				      "vfe2_cphy_rx",
> +				      "vfe2_csid",
> +				      "vfe_lite0",
> +				      "vfe_lite0_cphy_rx",
> +				      "vfe_lite0_csid",
> +				      "vfe_lite1",
> +				      "vfe_lite1_cphy_rx",
> +				      "vfe_lite1_csid";
> +
> +			interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe2",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects =3D <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_=
CFG 0>,
> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
> +			interconnect-names =3D "ahb", "hf_0";
> +
> +			iommus =3D <&apps_smmu 0x800 0x4e0>;
> +
> +			power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "ife0", "ife1", "ife2", "top";
> +
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +				};
> +
> +				port@3 {
> +					reg =3D <3>;
> +				};
> +
> +				port@4 {
> +					reg =3D <4>;
> +				};
> +			};
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible =3D "qcom,sc7280-camcc";
>  			reg =3D <0 0x0ad00000 0 0x10000>;


