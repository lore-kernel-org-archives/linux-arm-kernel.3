Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F029D70DEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjg0vsL9PIQrJqQc1ErY87Ss0UkRH1ifFtchX/4u0ic=; b=itxuN10g8lB1aPnoYKMwQQGJ/6
	pvGSP+2ItE6Xae2AfwYi3YxCQyzDrGRbFcRzqN6jJsXPsK10aGFmLfCpjr2gzqdNa9qzF/N5p56g5
	pnA+TeZt5nD7IRxXD4qoukZkATFZ/8jBguoy6Ir2/3dDQINM94lZdkqhkfFxxUMT3VZi01K3LHJce
	43iJDIRvyJXCgQ9jKDfSaUpmGEJMWDQLm2neR2FzUxfJTWQ10WTyL7jZ8IDE4AnXPoeLBAs4lt8fo
	/a43juOl82RS59N6KIw5pmh4mEpVDQ60tpnSlMA5FFA5FQRZu6IdGTb1+4ggoB8aUjXYj4UhHJQ/Q
	N0BVMpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGkvG-0000000GLVo-26lp;
	Thu, 28 Nov 2024 20:15:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGkuG-0000000GLLE-0NbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 20:14:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASIwlJe011852
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 20:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjg0vsL9PIQrJqQc1ErY87Ss0UkRH1ifFtchX/4u0ic=; b=geRFYmz/taaZ3vJk
	7vD6y0TyGs2eA6LSduINCHTOQALBNDZxPk57TDvKyowo96olEnJrG8mlBbWugAjP
	+sBFSbl1RwbsEvUBIuVxm54TwxNAnrzH9THp1OgkO60GSWLtrNONsXvVDxAWXtKG
	BtZLam2eFnNh9g0Q8zseHoZdVfcCihq58zAv3A9dhwXwY9+Msh7bB6OW/YLYgoD1
	MHav5nJhz+6kMcP1t/2ACR27/X4MkP8vhkZaPqKvimTXRR/GTarp/2XhrAmH4ry5
	xBkUisLEoCIw/u57QNAJnbqFWwnQtH1tiEJuSVKBigeEcjVIqmYk9u+yuGTCJtP3
	9t6/Xw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y03k8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 20:14:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-466c5605601so2361841cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 12:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732824869; x=1733429669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjg0vsL9PIQrJqQc1ErY87Ss0UkRH1ifFtchX/4u0ic=;
        b=ZCrT4zJYGxdAKIWStRXB5XuM8uMWooRnJ/aNyHF9jNbOwJ3tkx0Uisy0uyRdAgfP9c
         jRuBGyMWC1QHNBrbn/uWc0AZn8JpSkAlcpua1Gbz5lnYUGZmEoR7b+uaJGCOCaqXThZo
         d1KYfr3Dl3Jq6kyyBVCE2saq6Yo8/LQpm0WKxVAXN+LXodrRgcvhJyY2zglc/Y2FfQET
         se0nPUbQ0pW0aAGjqJXNlLeyPoDWqZetCbpeI482IAMlrrBD4TzdL2o3Y6Z7Z2IP1n6e
         hBciSoWQeO0bRMyKM17A41tgReFz050q94adHfHSxiwZNMps0A8gMJcb6dBAglENEYht
         mB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLemSWgRXoSkjMpuv/i15SQmvKIJihM/uUQhboYo+ePi1zBJANG9deUwGSvu8tjGy24Jtpzr10xFkoPkdg+jwG@lists.infradead.org
X-Gm-Message-State: AOJu0YzXORDkahutnItnm0s93/+SL9MkEzgNoJR/BEmMSmueKX+eAgLx
	Z0+b28Nwjds/1cCIB8QSTu5paoUW2VaDxK9lhV5cRSmk224mMFS4VGKrkO6JopT9C2pAlRjggAp
	uSjsjHoHAzkBrI74fnayIxA5/csN5I4dzBpdNxYrL17Y2Vwhri1CJcYX+0PQm6V8/5evoA31B7w
	==
X-Gm-Gg: ASbGncsj4zP7NI33+I9gNX46kDf7ofOgPmXLNoyU0q2OfMCpSw+AVpCczfp+oXMSzjX
	ovddAeddScxOXu/n+RTHp/DwsXpiG7iO3fPtJeRWKHUFxjG5igPtnH/pzJLNR9GEbKEwuOv3xgo
	QiYin6XdR/z345rbOjiQ6KPSYi3n3ZLH4+KYX95h8P1qerCx1YUAbplIILNDxKR4A9gCR8pW0/h
	7tcfZajHksIpcs9bNhdB36fq98HbGs0HsrKYAk1s9ahfgdiFm8OPJlBYi5TEFCPSOjDiX8TfAMK
	sUDgMJlZxn0P9xCRhiLW1PVELHCTTpk=
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr55782671cf.13.1732824868866;
        Thu, 28 Nov 2024 12:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJQMzZTd/mwyBiurFVOcv8v+qrOUQ80czSiwqfTqiVtFonMiHL9Th3LiaU5QNqC3afeeXn/g==
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr55782461cf.13.1732824868440;
        Thu, 28 Nov 2024 12:14:28 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e716fsm99165566b.108.2024.11.28.12.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:14:27 -0800 (PST)
Message-ID: <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
Date: Thu, 28 Nov 2024 21:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add QCS8300 platform
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wOVK98cVurpo08fLzLZu4VF5QXaYMVGL
X-Proofpoint-GUID: wOVK98cVurpo08fLzLZu4VF5QXaYMVGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_121432_250587_8EDBEE26 
X-CRM114-Status: GOOD (  17.89  )
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

On 28.11.2024 9:44 AM, Jingyi Wang wrote:
> Add initial DTSI for QCS8300 SoC.
> 
> Features added in this revision:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> Written with help from Zhenhua Huang(added the smmu node), Xin Liu(added
> ufs, adsp and gpdsp nodes), Tingguo Cheng(added the rpmhpd node), Kyle
> Deng(added the aoss_qmp node), Raviteja Laggyshetty(added interconnect
> nodes) and Cong Zhang(added the INTID of EL2 non-secure physical timer).
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

[...]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};

The MPIDR_EL1 register value (CPU node reg) suggests they are not
part of the same cluster (as you confirmed in the psci idle domains
description)

[...]

> +
> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <2>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			iommus = <&apps_smmu 0x100 0x0>;
> +			dma-coherent;
> +
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0

QCOM_ICC_TAG_ALWAYS, file-wide

[...]

> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
> +			reg = <0x0 0x01d87000 0x0 0xe10>;
> +			/*
> +			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
> +			 * enables the CXO clock to eDP *and* UFS PHY.
> +			 */
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&gcc GCC_EDP_REF_CLKREF_EN>;

Are you sure about this, or is this just copypasted from sa8775p?

[...]

> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */

Drop these comments

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +		};
> +
> +		memtimer: timer@17c20000 {

Unused label

[...]

> +	arch_timer: timer {

Ditto

Konrad

