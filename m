Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2644C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=; b=uHuVZny4OdHOEl24+W6HvqqYJV
	/d9oWY5oPm7rnqf2fR7byYk1Ja61AJxZ/CalNwRSeDQaMLlKIaDeiE3t+5Nrk8C85+cjWkR9g66ca
	nIlWtsgvvv0HnDPco1B9sL3e4lLNNQxAWeNliVP3HnAChZtdfa94YD2ZwPzJicuyAFUvD1gHzg7So
	baueH/+esZvJejeQDkVJhC0ZpARMhA5ISfXakj6GjP6YnlNMwM1nyLw06ATfdxgWkgY7j5kZVpTwv
	JAjBExZUvl3e5G4q0RBbLRwJnC0vjzLLdYIIpxcqOywaNmQ5vRnfjPCQSp04QdF92Xtu0C5SVZQuv
	77CUFobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hrj-0000000H4H1-1r3q;
	Fri, 25 Apr 2025 12:09:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GD0-0000000Gidr-22Fa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:23:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TA7o023873
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=; b=JMwybUwp1KJ+ByIQ
	aGAGvjgeL8Om6a7lE1RsM/DvEmelbnmYongVRMpPDm43p43+IbVjpnkYTMbRO1eK
	5GMuqCPxOMOSs6Xu1ajBiLnel/K8rydEhiUbbpfZ6t/MGOtRSpSDGL2W0eanCV8O
	v+1hqh1eBnO7yHQQ0GH9OllvHuqU6vZ3eSSgYRGVBnfRBq/KvzsMunRg/uGYKkKB
	pnXTYvkia4eBMBOwjg14AECZmYRCV1SdCEyZdg/axjuulao8dRH+rvGA43HvfPq4
	sjTNIj0GPhZEXzZkeQAnlzonifaQp9ZssMGckLPEtY0n2Tg+HviMcujVNDqvDlrf
	gMSY8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1rna5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece59c3108so4964796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576580; x=1746181380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=;
        b=VgfdIUIAGt+0JrJI5bt+bOS+0QlFu/VOHFo/v9TPMIhWKN9+w7K8h4Le3uqp3V/AXq
         oCtDYxWuhpabGCYJhFL/XI3nE5SS2iFb5nnvYjnJM2qZ2c5bayRQSNKSO3Oz44TBsEuT
         8gMQ3vjcuW1LlakNKLVwP2rRpXNOu5+qS8MpgjNW2PHkb+0Al0PlYurI8naZbP2ZoWWB
         5F2wkPa0q6IU2djKE7O8VfWyDRJcYog7ENqqelh6aHDLE/seKL22cu8B3jvhg4e+hpMp
         SYqwNSpqm2SKYcmviwLhFuzwk/NH0E0/QKwtGqzZqjleZAyvqjTZe/rfBQ2pVH7OlTcN
         c4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/DowgLC5wp8wGSgosQQDf7c/UaWw+5OeG5xYp99vzuTBksK9ZZ/BfT7LkpMVhbUTN4mn4rePHFiHuV7xdd5iP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2jxz6QDVB/rn/6Pri9DPISu+2MOI7iTFxYfdkDpQ3blWPrYpI
	5Tb1QIAnYiCkjMo5Kzv5CrKtzlFDjcdzHgRQCutKFB8k5EByFjugBPTgagFvt5muCCV4ArIg4/d
	ZbluoNaT/4h7k6+5mEkXKw8C2dtVciZ+8hv4steB8p4qlgE6tMwFZSNPvCI+wZ7DAZCz2e9XZxw
	==
X-Gm-Gg: ASbGnct70WWj0YJC7fYgfcHmHW9jXRM6spWpt5w+W0Ijp2uE9jhxTXo0AInzGJFH7rz
	iNpEhZ487EQzc355KbmR1WW0iKRKcVN1Mv5vS0fWqXC/5PGJdSw3ojgJcK7LvxS0MbM3mTS1zx6
	wlwm2n4N+flBnY1aRRPuewMSEe+tNqGjWNTm0P1Ehg0apgyZtzUcQiv/CSNIY8cbLxWZpz3Ydi9
	PCBpH1zQ1ZfciUZ8jzzZhj/itLTNK2mFRpmXwLmdzkdD/UcsBYoKRA5zuXsRafP9KBoDuDfeHwG
	eQkTK9yWp6u+4UtLJZ0IS1xFasR2csP/GFUbC66j+SCeCC2q01dYt3ufuoNFC12Z
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058346d6.2.1745576580201;
        Fri, 25 Apr 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHRUw0T1iKaDp55HxB6gYCPliox//7FFtFtFVjRAOfeqf2fXtnDneqIM45D/HHTkZv9xn8g==
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058106d6.2.1745576579842;
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff45csm1082025a12.21.2025.04.25.03.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Message-ID: <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2leMVSwSDKull0jXUUrohVnyBaW3dU6c
X-Proofpoint-ORIG-GUID: 2leMVSwSDKull0jXUUrohVnyBaW3dU6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3NSBTYWx0ZWRfX5lTq8f/qbMWP wVi6IkYfXAQEw/H3+Sol2A6b0VMvIWZuCaHtaC/xd0dKol0zbMxprbqDwRVOGWI2sVYMqtmW+tK JxOqC/WSunelxKv7/RyeEHEwhayGUagbj75S2I4th325sr4gVmE/BS60iXUUE4CNS3adPW58qQ5
 OsBR/tlNVL8Z6tf93Acmqvb5GSXHtLXcUI0AjbsTB2Leq5c2++gjW1n05iXzpxFfhz2hX0SUJ92 LccxNTTNhXPlW28zOy0ik4QikuSpLEAQBv7BM8MXf9joEoYxTL4jsKL8yK7gN+lYFZo0Al5pP0J vXOJ+6mQuY02AiKEjlvZHWC+dNJsOT3AIDCdNp14onDsOQakhqRn9sSZYxlJnvzSMzq4azMBb8S
 XSEGtYmlSgA5QmqNRnASVwvPSviRR1SrNgrZpikO/zzGT+HWGeIzBUzfDpun3BCFT047RLZU
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b6285 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xscrbkT6CZb1QQ6CF7AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032302_561205_BA2AE977 
X-CRM114-Status: GOOD (  15.87  )
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

On 4/25/25 11:29 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {

@0,0 for PCIe adressing (bus,device)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

