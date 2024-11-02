Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD2E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM8HACUKl4ocuSlUDdw9y8YU3/9YMZaLj+z480woTi0=; b=zhC5CIK6uQG7i/3x/wL84wU+t9
	HD6LdxDvgPu/6VKdtBkn6d0T4gE38ToKSHaPWSud3rwiosMErridsYs4Rr9JM10hB7SZky2KoDe1A
	0625Ij+i67PX9Qiu/Vlud8zLbnfFeIeW1WG9hGE/h9ZObIJBhQEL4O4NCW6r6SxUKU7EBDmh2V0It
	9cQClnzbcGl8kVUxMKmBIX0z5FamXLDbNz/FhWkQ8zwbMbmbQAE4qj9yIdcsJnHgLr+dsL97Ybv2C
	HCXg1WKcM0IDj8N6guqpU1UH35lYm17om87abN4uOf/fdYmT7KDFps6D7SyEsVRAep7SYMJWZjfSd
	+zgr6tfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Aej-00000009Pag-3iVh;
	Sat, 02 Nov 2024 09:42:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AYM-00000009OiS-3857
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:36:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A24XFm5019714
	for <linux-arm-kernel@lists.infradead.org>; Sat, 2 Nov 2024 09:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM8HACUKl4ocuSlUDdw9y8YU3/9YMZaLj+z480woTi0=; b=LSZVSLXacyh0ddjd
	ae+mcmjmZMVkYhPno7rxKIYjDSq9omMggEyR+sMaeDE1Ri9KA+SdHmXenOiPvVyp
	vZZ+FkymvF1mplcFa6AI+s4Z0l4IRoynlDSNYB26d5PFeg6GNlsn7XAXLQixK1Sc
	Q/acs1Mde+1OOKTs2qz2mlrjd1AFv+kTnL76RVRO9NbjxkCE7df75JXVHpTSSoMe
	6PUmFCQ3GePFjVZHJh+0Zdt48pAu1HXtbQm9qqItGd1ZME7Iw8+URZKzQHhW3BlB
	Xf03G3HQ/BCIxZ66DJRFJ1tGiIS1QbCKGr9NdxVYn3Gxu/VkJpIKTrTh8DmyqEaJ
	21gPZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd5cgdr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 09:36:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so8396516d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730540169; x=1731144969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YM8HACUKl4ocuSlUDdw9y8YU3/9YMZaLj+z480woTi0=;
        b=jNg0G79oyKDlvd50wiyjveRJ+1MkBa/NbQBcFlXoIHE7j4Czu+ffjWMR70xPy/KuYK
         OUCSwnK1jhTlZN+SH6O/QoRvcZB0A6em2oaGjp8NJa4rdeByCqPjQnQ7vZ8zeG2KaB9V
         EQQnauaFM4JlbBdNTJMxjAg7xef/CRYEuRAi3sCVkjg87U4/yZeZmB6dVpNu6rVDOIV4
         bwYgJHPXnzi+gE+xCtRd255jND4DXb3JFOaL6ai+e5GPN0FBs8OkNckJoDFu7Krd0RpB
         h3a2rSs7COW5JA9OLZTHTqjAjDMtopRJrk/9hNtFvAdZDS91kMpFjp9TPRHcja9w4WN6
         elfw==
X-Forwarded-Encrypted: i=1; AJvYcCVQjIgJf/QaVv+8u2HVX+SLMQ3YILYHp1m5R4ONiYT3bc2cxNg1I6h7OpujzDj1uwg67cmutNejDXy9Q1767wdx@lists.infradead.org
X-Gm-Message-State: AOJu0YxWqTVKutft67kJ+lLgPk1TUUylrG7NvAalB0THl5cSbegONSoi
	TYxMotpxghYR9WlXBJ+smICE78pca4SwOSnO5teoKrvcdpNqjg+z8P/R1BjA4U1gSiY5LZHB/dB
	Zaap17YTP+q/nwlf/uyqi+ZYwNFpdZyObbzTOlRiwqcnVf9RbCVLrulLamtZMKrhWUzLGLiO7qw
	==
X-Received: by 2002:a05:620a:4091:b0:7a9:b52a:a6f2 with SMTP id af79cd13be357-7b193f080dcmr1729304085a.8.1730540169293;
        Sat, 02 Nov 2024 02:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpuZhSc/uUOWj0mnoU2gw1NJRB4sXHPQcGTLP8tl7/FwvWLjafzIamKU51fvqyvtbBO+7rA==
X-Received: by 2002:a05:620a:4091:b0:7a9:b52a:a6f2 with SMTP id af79cd13be357-7b193f080dcmr1729300985a.8.1730540168925;
        Sat, 02 Nov 2024 02:36:08 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565df86esm291855266b.112.2024.11.02.02.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:36:08 -0700 (PDT)
Message-ID: <c4407327-1060-4805-abb8-0c7bcb067ee4@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add base sm8750 dtsi and mtp and
 qrd dts
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-5-quic_molvera@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021232114.2636083-5-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9qJ3zZSqJgo79kNlmEA0_iHGoaMtO6IG
X-Proofpoint-GUID: 9qJ3zZSqJgo79kNlmEA0_iHGoaMtO6IG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_023618_855314_B5085766 
X-CRM114-Status: GOOD (  16.52  )
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

On 22.10.2024 1:21 AM, Melody Olvera wrote:
> Add base dtsi for the sm8750 SoC describing the CPUs, GCC and
> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
> reserved memory, interconnects, regulator, and SMMU nodes. Also add
> MTP and QRD board dts files for sm8750.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +&spmi_bus {
> +	pm8550ve_d: pmic@3 {

These usually go to a separate file each.. But I see why that would
be difficult here.

Lately I've been a fan of <socname>-pmics.dtsi. WDYT, Bjorn?

[...]

> +		apps_smmu: iommu@15000000 {
> +			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15000000 0x0 0x100000>;
> +

[...]

> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;

This is usually dma-coherent, you can determine that through a smoke
test

> +		};
> +
> +		intc: interrupt-controller@16000000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x16000000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x16080000 0x0 0x200000>;    /* GICR * 12 */

These comments are copypasted gen to gen and don't bring much
information atop what's in bindings

Konrad

