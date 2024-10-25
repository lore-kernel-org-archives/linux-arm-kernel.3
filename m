Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED23D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFXog9CzN1JbPT5MLjqR2YdEriiY44hNAsTYnjYNF1A=; b=0dh5BlY0bHNlWf0fRTyHam7q7p
	uAjT490w5dtufR+3Ax0ez7OG402UvYlyXf226N/8fF8h9vIs1/05WGD5b2Ibm2ny+cZMqlx2oqq66
	KPDA0Soj6cs3i53xXTlkAnhvkY5Zrz+mtJVGnypQx03NYsmeGvMu3Wn0za8vSbJOl/dH53weEVv4D
	F7aFHS3jaJbmesBTW1Q20U+4jkj3JK358LlGhWsVvnd6kNbA0YEJ/WdgDEiRrZ8PwUtyuE2dcvJav
	rCxjqErO/0tzkJ9TyloEYpjEBTzz0YOt1QPLLPe/Md13mhQpZsbffhw1sb3PFBu6pYhT0oLvTzY7g
	M3fawnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PqB-00000004weo-33cA;
	Fri, 25 Oct 2024 19:19:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PM3-00000004rD0-28m2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:48:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBjvGS015240
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 18:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFXog9CzN1JbPT5MLjqR2YdEriiY44hNAsTYnjYNF1A=; b=NcqtlBZx9dkCDGQl
	TfIVDtv5TzuNICmaIwYhQgZBLm/pQTEh3fESCfGPuGafOYkOWA1+wJsMRcbKc3TF
	mNOG0kbQ1BmRxYfQjLvF6IgQuvLA6G6Pkp5dVvc52QJiS8+yXXD7AfCATzZnfklN
	GXlKfhpli0nbnAYfLRlajt+eIriz3mC73mtpPQthBUu4ZYxqTQdV3iyw6JGMBCnT
	JpYuGzaUq5kEg8rpdJhAFVFJOyjEyj0j24+HzC6JUBfOuoanJfYruftYs7dJRgFu
	NVMZ8q+Yq3fXexAbBHHklWp6uzkIiR8b8s4LxXjU32+K2iNhmhB1jyEgpFF/GJ7S
	G4HAhg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j40f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 18:48:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so6767146d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 11:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729882073; x=1730486873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFXog9CzN1JbPT5MLjqR2YdEriiY44hNAsTYnjYNF1A=;
        b=tUZijwl/AUdS07ycrPFkLO7uLLg7nzVI/NI95U+zvl0dsghqGxhxbqJPb0MfsKnatg
         c9FItU+2oX3xyFOxpvix+BnZ7Z0Q49DP10P/KcQA7qQvCERK3HM098ComNZtXq+SY3ga
         sQ4d/P7QRf12y8c+B5s9ggKOLrqJKXtFa/nybgfe7/Gm3CMkkWav0TTTZq37VxiaUiyT
         U9TNh+todaxjNvsQIxxz+V69nLVfAobDpUYMOAiK9ZteEHrDwLEMIQYAmVsSyf+YhcH7
         kYb5GD7YgR6QIyAQ5ywHoA6G8JdrHz9lztpNIJ00dd9IYyIYT353syH66NwBSb+N3L/J
         HQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCXue2t2YZV7hGIORkAfkQLsDt27fWnGof4R8q0spVZtA38lRMSWq8AUn1oUww6WAF8UtuJDtFpwVK0qbzic2Kvj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9LO58hSCLbj8ky9VgQlFIrkNJeoLiix5IvInyqBHyd0fpk2Fa
	WZhVoNN/hxO0i2ms5miBfp9tu+fln1rMxbETWx4eI4Xqw4D94nTRJC1M2PrdYQGqoS9IVEiW696
	ezbktofxwzVejcqZGvGmzWiNOTeYh+q0hFQHzjVeOUXORk/l6ytKHszMPJaE56ZgSKbjyhR8aCQ
	==
X-Received: by 2002:a05:6214:194b:b0:6cb:f0f2:f56d with SMTP id 6a1803df08f44-6d185680265mr3059976d6.4.1729882073453;
        Fri, 25 Oct 2024 11:47:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdXcaShoo57RMGPsZA2dXvZ8ufIsmj4l3pV7Tjjs+OrGQgre4DCGpRASRUtkmM1ZVAtzCzA==
X-Received: by 2002:a05:6214:194b:b0:6cb:f0f2:f56d with SMTP id 6a1803df08f44-6d185680265mr3059836d6.4.1729882073055;
        Fri, 25 Oct 2024 11:47:53 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029a68sm97186366b.83.2024.10.25.11.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:47:51 -0700 (PDT)
Message-ID: <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017030005.893203-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zKuOxJKSNVAxoPqfLw9NYKj9YHvapUqd
X-Proofpoint-ORIG-GUID: zKuOxJKSNVAxoPqfLw9NYKj9YHvapUqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_114811_721636_178D521E 
X-CRM114-Status: GOOD (  17.66  )
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

On 17.10.2024 5:00 AM, Jie Gan wrote:
> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
> Funnel, TPDA, Replicator and ETM.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
> Already checked by command:dtbs_check W=1.
> 
> Dependencies:
> 1. Depends on qcs615 base dtsi change:
> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
> 2. Depends on qcs615 AOSS_QMP change:
> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4-quic_chunkaid@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>  1 file changed, 1632 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 856b40e20cf3..87cca5de018e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>  		};
>  	};
>  
> +	dummy_eud: dummy_sink {

Node names (after the ':' and before the '{' signs) can't contain
underscores, use '-' instead.

[...]

> +		stm@6002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x6002000 0x0 0x1000>,

Please pad the non-zero address part to 8 hex digits with leading
zeroes, across the board

This looks like a lot of nodes, all enabled by default. Will this run
on a production-fused device?

Konrad

