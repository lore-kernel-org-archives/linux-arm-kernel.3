Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05536C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ksfv3EfjOI2GzDAtuyZf4+GHBAlf/L+797z5FEAT+XU=; b=LhmiwbraEp3itZ5C34ap+7Xkbg
	Nh809PDXv20PPw4YkBfbtlZ/Z6N6H2q9MMXqg87tUCaY2IgWZADue9Wk1/bprrwhirQfjYd05GRXZ
	CyKbigM0wXTr1bTUr7TOH3Iwi6HUSoQjeQq18paB5YA0C5R3p7g65hZZ0KqEH2SQ3+g8zXSSn756n
	Fizsrczewo53a+jDxdVasDGGO4A0oOaqGqcg80AFSL2N3SIG2JKbaXAfXBk1z6zWICc9gL0r3hgxh
	Cia2wbXGTX9wkTomy4migKwVx+3tcDANGTEcxM0ZI+/NNg2rzoeoc9p8nHGzswEN1x7Mmn2L0QMug
	MwDTLQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvHJ-0000000Gjhx-3EpL;
	Sat, 08 Mar 2025 14:35:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvFC-0000000GjQQ-3SYR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 14:33:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528AwttA024306
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Mar 2025 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ksfv3EfjOI2GzDAtuyZf4+GHBAlf/L+797z5FEAT+XU=; b=RZoN4OB0VGzLP8dn
	1+FixeVlC6fBdYYsZLA3TmXiSeYcWoTj2pLVLKydWvgbLlb8kd4FDjvZ8CioP9aK
	9OOgEVl29SdfwVVoJIpUKp4g2cobhlkH+5eZtwN/nFcKNnTJ7Vj6QwJwZB/oyuG+
	/NixhdV1uJMGvSj8GW614VYdiEpv8F75D/SxjzzD2ljjUUjZrdWxAachRD8sRAxH
	CQ8uNyOv0ISzrvwzueRHNZX1Zj6eZidM8I7h3rk2L3K6FYj7UhAGTwRF21CsNhzX
	WSiceM3IUgRPaG03jIf7ezQw61EVG2D0+I1XxAgOfs2kiFDfZtXeuw1LLtUgHhtj
	jyHswA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6a8pct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 14:33:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f3c21043so7452576d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 06:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741444417; x=1742049217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ksfv3EfjOI2GzDAtuyZf4+GHBAlf/L+797z5FEAT+XU=;
        b=t3m0nl6Y0OC7woiGzhIiBI6wnctwERERUzvpaZGmQE9NTQ4QiPQ+dQwTFFFcyG125u
         3Z5727G/CTwFq45PVfGJ4hcv2NDnauHHBuMY/y8tGpy5SxrmDhJ1nbX9iUm6ofPYqlya
         wVqFqomzoSg2Mp+zMfykTeIAuFI09mkYDXq2sMEeIPW7QfxTuOtNeRK8I52GDYJ6WrC/
         ABuxp8dl7ffPmh/rkVuTGwNmm9kN9laShS2dBzZkJZ4LGfCfydG+MXNfZUjKjlfx8n/o
         H04ztycvEcoOj2TJPe3hQlg/pjtKSM42AWK9TeRlvdii/oWsrJL47DIRymtZE0EA8PkF
         7sVg==
X-Forwarded-Encrypted: i=1; AJvYcCVR3iSnM2L64WtVLf+3Zy/LtWTzprxixIDB1bhFctdQsfvUveBg8R6L5chW9nNGEugZSGvTm/LlfycR/bBjtEs+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt2468rw1N3fgkabd6PmPy7wc5/7cPpx1Xg8nYExGTPbm1QHYo
	Wpy4Gkc+g/Uus3AK5/kY5gOk/fRzS0OiRwDoDzWot9cwL27aFeVRwzfoa9qddoK2hoBig2KbJpw
	sLsOe0XKhuQgFr6ygG7Hran/zrzyValYGCak8atvqOKOLq2XNIECJZhTjE9ecKaXYKVpZRgO3/g
	==
X-Gm-Gg: ASbGnct/tbcabmHyP3bRBz9bzyLbGS+h6dmvxVgFagXJN8SkI/HE/RhmNNg4fub4pet
	M9/6iWoe1z/2GM7kTv6UHaJShEVmnSTKCIgXDG2kuNf/sSvlfRvU8jD9ENQPP8TPk2c8k6maOog
	3LVlGRcmTi7EvonzSc8iARUKeSJySYXLMwIyNLYCUTesaoL8/9ii19yuA3iBw1gP0Yu0z9ANYyv
	lHP/EyOgyfRE8VfQZ2+JYAyftdGS0yR3sup3+8UU+rtvFfWnNLHPGvAdd3B9WKOAEzLln1HpQNz
	7yDZ2HhKeLj5n86FqZ2shDaqJjffvqarQhbK26rFTkhwyZHTAxPd6GbGoHEF/LlMTi6vZg==
X-Received: by 2002:a05:622a:88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-47666f7bc60mr16609791cf.10.1741444416824;
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyEFW0H2hxCyi2WwfzN3+z4dl5ktT+/35092XkyZuW2tTKE2+hX9TWmWLNewQKFMc3jZEcnA==
X-Received: by 2002:a05:622a:88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-47666f7bc60mr16609591cf.10.1741444416516;
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394399aesm443169766b.30.2025.03.08.06.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
Message-ID: <d1fdbbcf-f3dc-4233-b2b8-af5102c1feb1@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] phy: qcom: Update description for QCOM based eUSB2
 repeater
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67cc5542 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=d_B6GAGhsxUSwkCc-B8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7Qi6yfu2sbSDlWz1Zel04j_88w0G6lzk
X-Proofpoint-ORIG-GUID: 7Qi6yfu2sbSDlWz1Zel04j_88w0G6lzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_063338_877472_B6E0D7DB 
X-CRM114-Status: GOOD (  22.12  )
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

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
> different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
> needs to be updated to remove associations to a specific vendor.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 846f8c99547fd5132feaa1e41093b8eab51714f9..f281e3b7f3f20b4a4bb1602be94b8a1b041a876f 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
>  	  on Qualcomm SOCs.
>  
>  config PHY_QCOM_EUSB2_REPEATER
> -	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
> +	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
>  	select GENERIC_PHY
>  	help
> -	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
> -	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
> +	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
> +	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
>  	  on Qualcomm SOCs.

I guess the repeater doesn't really check the vendor of the PHY, i.e. if
someone took a SMB2360 and hooked it up to any other eUSB signal, it would
happily crunch through them..

That said, I'm just spitting out words and this is probably good to inform
the user about the actual real-world usage

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

