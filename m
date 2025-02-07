Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F32C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 22:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZfGe16kUvK2uoRxcC6y7EgJPMLh571re/lSazxIgJM=; b=Iv4pnSGoPUKB3/i3d4X/3GmhEJ
	/SsgtDlwaqCNmM/Ee92qZHzq8l4Y4sg20hw3LwJ7MGbehiW3r4z4xir5eb4FzdynNUYNX2geTbo6j
	+W0q81V3XMlrGZaaqYPbZI5PjLOUGIVlWdvjQ6fuqy+vwmB2YDT5+BLuKf/WIL5ORHgZiU+KVJQQ6
	R9BWN5KfcPAmWBzLMced0Um4IolOGHD3TUd0uoaCAG6TcVKersB71UJPRAwghB15B4iQ7n8O9PkN4
	B0gRB/kH6WELzPxi+n4ojW5lQPJUo+CPGv5urdPJN6n2p4bn2NvWlyh5a/YvRR6S4WoQddJc00z9g
	8wXR0x5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXIs-0000000BSxv-2dco;
	Fri, 07 Feb 2025 22:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXHT-0000000BSZw-2WWM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 22:57:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Frbat002491;
	Fri, 7 Feb 2025 22:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZfGe16kUvK2uoRxcC6y7EgJPMLh571re/lSazxIgJM=; b=fZNuc1eGNlmoNg/5
	qDK91wAkkN/5wCvrluErMH0IpnTNFyrPUKMLxy3lvkM9x80+ybmcKDKl34nrqdWm
	03k91NVqkdyO3TIlMUKaJD2RQlMCiTEvMOwIZDRVHGl7DTbvgfuJal8j0ybbvthZ
	ka42/lsZfTM+/YG0ecS1gDkjLDb1c7MdntyDoEqMxSKhfxvfrG6jlF4OgOkh5sd5
	tN/CHc5CrY2wbAQ1uuGKqNVYN/RkbwoiZPpcVMh8eFQKsxRj4+bzK13YM+hdQHwW
	8i/h4t2VlSFKbB+9WOyvAK4pdb64m6B8zSAcmYSmHz0UFe7CxcNb1pDNW9w5c9c8
	V+J+/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nn7frx12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 22:56:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517Muq7q000546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 22:56:52 GMT
Received: from [10.110.94.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 14:56:51 -0800
Message-ID: <7cfdab48-a044-46f7-8700-46e3595d8690@quicinc.com>
Date: Fri, 7 Feb 2025 14:56:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the
 spectre_bhb_k24_list
To: Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: Roxana Bradescu <roxabee@google.com>,
        Julius Werner
	<jwerner@chromium.org>,
        <bjorn.andersson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Scott Bauer <sbauer@quicinc.com>, <stable@vger.kernel.org>,
        James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zFzCzlrlKLzDYaPtM8TJwd8ZbdgsZ1iU
X-Proofpoint-ORIG-GUID: zFzCzlrlKLzDYaPtM8TJwd8ZbdgsZ1iU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=907 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_145703_766742_1F30382F 
X-CRM114-Status: GOOD (  15.59  )
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

On 1/7/2025 12:05 PM, Douglas Anderson wrote:
> Qualcomm Kryo 400-series Gold cores have a derivative of an ARM Cortex
> A76 in them. Since A76 needs Spectre mitigation via looping then the
> Kyro 400-series Gold cores also need Spectre mitigation via looping.
> 
> Qualcomm has confirmed that the proper "k" value for Kryo 400-series
> Gold cores is 24.
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org
> Cc: Scott Bauer <sbauer@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.
> 
> Changes in v3:
> - Removed QCOM_KRYO_4XX_GOLD k24 patch.
> 
> Changes in v2:
> - Slight change to wording and notes of KRYO_4XX_GOLD patch
> 
>  arch/arm64/kernel/proton-pack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index da53722f95d4..e149efadff20 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
>  			{},
>  		};
>  		static const struct midr_range spectre_bhb_k11_list[] = {

LGTM. Sorry for the delay. 

Acked-by: Trilok Soni <quic_tsoni@quicinc.com>

-- 
---Trilok Soni

