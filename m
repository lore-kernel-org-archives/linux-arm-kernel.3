Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF43FD5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOnTk9a6lwE+fikfwNbQZenhWDbjRYFsjjyWWoDZ0tI=; b=1vYFO6Jmy7WRfQtuUTcjTvS/FG
	wKIDKQWJ+RDTG5a/qiEgjLN11AH/gcVfju6j98vDr++VlFuM3bxSuNlC8s4n9rIxL4EWlmtWgYxuf
	kM9rh1/qIQZwXA8J7ebgNHALZtemS3qP+SpmrZoCWZUIzZ3kUtwP3k1vL91Xuh9eFL2FCURo4JOFE
	xngniEPXJ0cUJUjUnLAT+Z4HLPDRi3NQgbjhPFbzB1lxFJ9q6AvEL4AXLS4H6v+NOeqYxOYzapmrc
	r0oXtNr/PD41WMUIXO2W0m9bcy869nmf90VY3EAK8nDRfWplOovgBTTCWE163FWiBT0wWuPIQ+H0y
	qfXqg3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t671a-00000000Abd-14Rm;
	Wed, 30 Oct 2024 11:38:06 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66bJ-000000005bE-00l0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:10:58 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb49c7d4deso4598481fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730286654; x=1730891454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOnTk9a6lwE+fikfwNbQZenhWDbjRYFsjjyWWoDZ0tI=;
        b=ltDtixSYpFv3lbyxOQADmG80XaoXk1MVik1C3YTU/OOYh51XOkHklBrhiqoZrdL19c
         Yr4lL1q081FzYp3JHvE2erHP+TN14XdORfiswfDMJjES3r11SgKMyBdub+AStUgu87ew
         uhTXWUGPkGvqQNQSQW5h5tGteSGVNvwcE9yGw7wqp9SMd849Zg2LPZv077tgLy5gS+P/
         ZAvX/9+lP396YS/v4pi2MJ51ngTzr6vTm5EZaVxALcg2h/VLCJjFF6Z+m33YxBhl24Rr
         c4sq3+jMVcwh8M1RH4wjNJv+qw2Gt/TN65AyEy4vNEHvBtx4wP0jYhjdovbB7IXstndz
         4HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286654; x=1730891454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnTk9a6lwE+fikfwNbQZenhWDbjRYFsjjyWWoDZ0tI=;
        b=a91iW0t4v4PU66ILCIAfUj6uaMO6XhmVGFrQpIfdQ0j2plP/DwIzCPJbOgv0XlbGXm
         rj0Fv8M1MZuVc5Ion8kfGWmKQPfsJ/Wf5687jKhwsMEkyO8bDq9hq2ZlAFaoIs9dZwGe
         QuH3oUbdOr9b1nQfFD5oTMMMw507aJ04wJGQqCKxfmbulXYjBD1dlanZTPrwF87clTOv
         LcBMZjoPCYkRB9YcK9up/FqeE8arwDE2A4VADmVHXq9y0G4gk38pAMUpyvRleUjE4aYb
         ANjtDn7OzNpOSsIxxIyvvoJVujiCOAkSK/XXvCbYi7LqmZhjtmohjE9hCpBYb6pU1REv
         SJ1w==
X-Gm-Message-State: AOJu0YytHI6cS8XdYvDLK3I8DnyVb/yFUyLbr1ReSasiRPWkOD+mr6Y/
	neyRflTcnhaPEIxZmRRuZmestLX+nJwOj6pxAPfU1TV3Law5aWRbqoCF6nsh0IM=
X-Google-Smtp-Source: AGHT+IEzJbN78pas3iBKE3f0DF1PHH7hK5iUIwcfZk1R7VOhJ+ChO8DW/VFwGmpEUrcrPWlQ5+q1rA==
X-Received: by 2002:a2e:a983:0:b0:2fa:d1f9:9fb9 with SMTP id 38308e7fff4ca-2fcbdf5bf6bmr22883061fa.2.1730286654441;
        Wed, 30 Oct 2024 04:10:54 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb818ff46sm227061e87.45.2024.10.30.04.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:10:53 -0700 (PDT)
Message-ID: <812499a0-b87e-45e3-b491-5f369b6de5ca@linaro.org>
Date: Wed, 30 Oct 2024 13:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_041057_088372_AE17B90A 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Vikram,

On 10/30/24 12:53, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

<snip>

> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domains-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply

These supplies shall be split into pad specific ones.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@acaf000 {

Unit address is not the first one from the list of addresses from,
reg values nor it even in the list.

I kindly suggest to sort the list of reg values in address increase
order, this will immediately make visible problems of this type.

> +            compatible = "qcom,sc7280-camss";
> +
> +            clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +                          "csi0",
> +                          "csi1",
> +                          "csi2",
> +                          "csi3",
> +                          "csi4",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "soc_ahb",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe0_lite",
> +                          "vfe0_lite_cphy_rx",
> +                          "vfe1_lite",
> +                          "vfe1_lite_cphy_rx";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +
> +            interconnect-names = "ahb", "hf_0";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domains-names = "ife0", "ife1", "ife2", "top";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0accf000 0x0 0x1000>,
> +                  <0x0 0x0ace0000 0x0 0x2000>,
> +                  <0x0 0x0ace2000 0x0 0x2000>,
> +                  <0x0 0x0ace4000 0x0 0x2000>,
> +                  <0x0 0x0ace6000 0x0 0x2000>,
> +                  <0x0 0x0ace8000 0x0 0x2000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0accb000 0x0 0x4000>;
> +
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";

reg and reg-names properties come right after the compatible property.

> +
> +            vdda-phy-supply = <&vreg_l10c_0p88>;
> +            vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };

--
Best wishes,
Vladimir

