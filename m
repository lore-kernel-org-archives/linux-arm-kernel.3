Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ADBFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=; b=YPFc5OhLtuxmrkfImX1s7O4Cv8
	zzc/PnFSQpXNVyJmsPfCLsRIoowgZvFGnYWhgRnzL0jir4G21EZTswxxGDCPrwZqYQ3BKizM/0brK
	kKJhxOvvetk3NTQry+7JD8ew2Vicb1RPVEJBxB6QU1wqu/cGi9yd8KtOg+BNjPhl5OfqA+IDjk3Hi
	MLasFPD9MFfHyxHKk4TWNWU+TgYaq48er0aCwKIiAWguX2LKyc6g0mYN2elObj+jJCY4ymBCQZrwI
	Le0aRZ7wa/lrnUIC5GVqgBcyHv32ulCbCZOkbPF4xOlXErsb/Qyii8D51WAVweEvy9Ba16I/m+Clu
	iZAUc2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0pN-00000003HUF-0SXS;
	Wed, 29 Apr 2026 09:03:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0pI-00000003HTU-0JkI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:03:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8psgo1728608
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=; b=IhMfS0ELdpvtPraQ
	H57I2K5mSNI/IJuWA1/r3p7anS6FEcknLRrf35mKOs2h/JHWOlziFHCtr+gJxiBk
	S3isj3DUE0unpQpmwJw6ypjLpLKr9v7eDdKqSmVnib4HhHu3JR3XCp9SJgpz+c7u
	bTKC0bx8u35D7rt70KN5oxxk0LYCQknwettvUPE/R5GyZO/Ya2d1+I5/hXPJ8GRo
	CYebPBRQkCQahV49lHvcmRg6YThnHyPK2ytMGMUTwlTGAADEqNvXyUD55pRvejsk
	0sR4rkX2DbbtZMnk7nacUoZWmY7YUJUGPllc9UR1v421wPgvdTB13wLt/wA0jnZC
	RKNd6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kr81n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:03:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b207ec027aso16672456d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453402; x=1778058202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=;
        b=jw+Hi5VyQp7jcTZnHwG4b807NXsFPVPc02BEpjSEQlVndv/w09PwiWmlzQOcAxGYXV
         3sbZRPN0yjyuHTt9Zycl/1naPXo5DloeWOC8HTgB2eFT65+nAIkxw8oirq/+A42lfUV8
         3Uxw+jKqGQp1LwFZyFx/gIHa0ND6zUbeyQwDKHm07XUjHktvvQDpAnSq1rwfeP7Be6g0
         HRz3PVMWkVZu1OBU2GoMOlN2jeV5yRk1NsHpyJ8qCYhu3lGmoeXROrAN2WAvt8pjypev
         IyejGd1Kz1nzOdl4mBjWa0aogbr8rGIANUYNnGVQ8Pm2p0mJbWZq6bUNDaO/n/P7kWXQ
         jKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453402; x=1778058202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j60wI/7DJPDXs0dSNvS8ZkxMZOvpfZ+OZ+03Vj5+YPA=;
        b=psTcnRHY9VHyMgppPDWuq6KAfzz/ymvWyFJ44bcDwB+pk5m6lSWU9o7TPM9qjauEpu
         k2kGnmgE5etJwmPyLlV8G/XPt5t0DSWmiUXfCIRH73kfkPHKBTF2bnsPTeEyC/tv3UuR
         GJQ0K3YDeu5fDFkCyufaCdoWQqEkBWwCihbRjGVB8nOW7BlhFHBH7zerAzMhvTF1LWMu
         BmmXM7rxpDEw4QakKD4Jy0xgSSpnz7fXWgWyBjkMxtEZyfgK7CpKTUVXmD4bVlXaqSo8
         ON97tNMp6JUgxSgzF2+CfW/Zh+Ew9pp16Yoy13bZLfPbxtHF48ko3bK22V3hTSkWzgfc
         uWKg==
X-Forwarded-Encrypted: i=1; AFNElJ+tmcoW0CbO9WsGd913hK5WQMGac0gix4oKZpJcUYS7Ic4fgw0t+7jtqMQYA9bqxi+KnEPGunTwCVSAxChSLCqI@lists.infradead.org
X-Gm-Message-State: AOJu0YyCGN2SjE3TxFRA7mQBTtkLzefye7nxOZn66rtE+rHJNepELW7n
	g7Nc0tvJqMmZddxJU3xhNE1ztonoF71wbkQZC7tpt4tCuNQ2IV/1sPZnh7z1w9rJEo+f91j2hvU
	lXnqL/7C9QeVdmU7EM0Pg8f4MGSR/0QPMMbe9kujrB6OV/GvV0H0Jw0uw0DZQU8XNwYRA4TKzlt
	16vQ==
X-Gm-Gg: AeBDiettEHmDsAH+MwkIlyS+jHU0vSJkJvHCdMnQo1/cEhT7904i29qbsbhlcP+lXug
	vTX9Zfgy+PT/2D1vZq4+4gYpUeQWvYDDLRyde3DcWxkkA0F+ClBbqbVFAkzmer8Rb1TX2dgdlMe
	iLCE0FPONlPymMjBgxvTfUfC+ibkAPjlSWUHdD78h2+CVq0X1OuEy515+ldmWNmPyFnXGjo8rgM
	CAw6je+RxheEXiVeKGnCboG3bo5YMZmtSvaaI9DJUqDpJW2wDoNz0WUJkAFS6cH4IEei1B7MPkS
	6FXgdhR+ePMXO+l+JF0NnQ9V/YnoAaqJ3sLtRfkJG505MbW2HlqhUtBuhkIfs0RgHsqyb/el10D
	VhGmKuHf/Be1Vs6RwuCoynxeCq7fqH579QX3UawEZWjbCRU+sFHw4HzydmIUFcGQ07SgtabxVYf
	5bI8RoqDnRz0HYsA==
X-Received: by 2002:a05:620a:3186:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8f7b50c55f6mr676044285a.5.1777453401907;
        Wed, 29 Apr 2026 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-8f7b50c55f6mr676040085a.5.1777453401336;
        Wed, 29 Apr 2026 02:03:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154d0dsm459716a12.14.2026.04.29.02.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:03:20 -0700 (PDT)
Message-ID: <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MCBTYWx0ZWRfXwph1gGPb5jBf
 9W+Pz/cDAt34KGHQNb9TiZjx/fXtcbtsvCE8byf+j4SGkMRcuIo4nIFS/7FDfbvYtdEURlT78SX
 iTVboJFrDksCow4Ey5tdeUxMd5vKDJxfnaAys14Uqk9B5M/D4DWnTNLiHRYg0jCRkC8q327p8yT
 VTiR9YfXEF5vk7lU1Y8/XMd9wjy+TFcWNg21t34DoswMi1obBuom2xB91RHLblNSBGEMQeH9hHd
 DzYGvkiE4slayXgaxArxpacjBTd8XPi7WNLKLspt1mXYeuQu/XDnjW/2Smd2/SPM6RTcJ7wHjej
 CVYI88Kr4riw3Q309vAFG3m8WQqvh5PoYOy+bBhKNsC/4z2hFNazepIVmt3As7sxr27ptp9KlLi
 XyBgGzuG48v5kHvp/awGN7+JzlXRAvjGDvNU9bCRe+HfQM/GlIAimZP5qdRMjym7280eCRJWKfo
 IT0cAJ0rmfMGcla2lhQ==
X-Proofpoint-GUID: Y1j2SP0I5MSBTxHc059BEP-3wZHw6rji
X-Proofpoint-ORIG-GUID: Y1j2SP0I5MSBTxHc059BEP-3wZHw6rji
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1c95a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1FqbTYD1fgV-DNYpyMEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020324_244425_F0E5C6A9 
X-CRM114-Status: GOOD (  22.80  )
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

On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
> There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
> SoCs when building ARM64 kernel, and vice versa.
> 
> This makes kernel configuration more difficult as many do not remember
> the Qualcomm SoCs model names/numbers and their properties like
> architecture.  No features should be lost because:
> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

>  drivers/soc/qcom/Kconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 62ce1c67d684..9a050ba1dbcb 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
>  	tristate "Qualcomm AOSS Driver"
>  	depends on MAILBOX
>  	depends on COMMON_CLK && PM
> +	depends on ARM64 || COMPILE_TEST

SDX65

>  	select PM_GENERIC_DOMAINS
>  	help
>  	  This driver provides the means of communicating with and controlling
> @@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
>  
>  config QCOM_GENI_SE
>  	tristate "QCOM GENI Serial Engine Driver"
> +	depends on ARM64 || COMPILE_TEST

OK

>  	help
>  	  This driver is used to manage Generic Interface (GENI) firmware based
>  	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
> @@ -45,6 +47,7 @@ config QCOM_GENI_SE
>  
>  config QCOM_GSBI
>  	tristate "QCOM General Serial Bus Interface"
> +	depends on ARM || COMPILE_TEST

OK

>  	select MFD_SYSCON
>  	help
>  	  Say y here to enable GSBI support.  The GSBI provides control
> @@ -53,6 +56,7 @@ config QCOM_GSBI
>  
>  config QCOM_LLCC
>  	tristate "Qualcomm Technologies, Inc. LLCC driver"
> +	depends on ARM64 || COMPILE_TEST

SDX65

>  	select REGMAP_MMIO
>  	help
>  	  Qualcomm Technologies, Inc. platform specific
> @@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
>  	depends on DRM
>  	depends on NET
>  	depends on OF
> +	depends on ARM64 || COMPILE_TEST

Probably OK?

>  	select AUXILIARY_BUS
>  	select QCOM_PDR_HELPERS
>  	select DRM_AUX_HPD_BRIDGE
> @@ -242,6 +247,7 @@ config QCOM_APR
>  	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
>  	depends on RPMSG
>  	depends on NET
> +	depends on ARM64 || COMPILE_TEST

This I think goes back to <2012 SoCs

>  	select QCOM_PDR_HELPERS
>  	help
>  	  Enable APR IPC protocol support between
> @@ -251,6 +257,7 @@ config QCOM_APR
>  
>  config QCOM_ICC_BWMON
>  	tristate "QCOM Interconnect Bandwidth Monitor driver"
> +	depends on ARM64 || COMPILE_TEST

This is OK currently, some arm32 targets have an older (unsupported today)
BWMON, I don't know if they would be using the same driver or not

>  	select PM_OPP
>  	select REGMAP_MMIO
>  	help
> @@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
>  
>  config QCOM_PBS
>  	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
> +	depends on ARM64 || COMPILE_TEST

MSM8909+PM660 exists and makes use of that

Konrad

