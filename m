Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12443C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=; b=dS1ABdlqynI9B0FVIJ9N7dML0x
	rDHBkYtiunLmGgFbGYFbMMoSGH9nSg8R8TSc+QU2oCMr9yfERJf+ESEWCy7y7Jfto9KCyFXssZh1w
	7RLUEGuUBjyv8nphFVr8lz7VFJGatwJhI/7yIHj/8HKd/yfVJljIlYjBDDsdQvUFfsOSx+9ktRJVq
	oDs5gtGtPO6xR2tThkOuYj3emu4GcuEZoFTpZfUVp/6VK1nSY040HxsXA9lk6PtkdC6Aa/RjvFuQi
	karDyk7XHpeGhD32XuqYhMygIwOFpv0gzHZrnjg6WnXCAuBtnPAXgZTghqNP4idgeIE9bmteuTPUc
	EXreLD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92oY-00000005xPz-2g16;
	Tue, 22 Sep 2026 15:53:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92oW-00000005xNq-0Dr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:53:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjd4H898350
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=; b=NuMeLAuRxk12TzIe
	2IIKpHxD60B9aAf3ow+MH682YLp0nF6MS2HFAXX94vXONizlwGdqGAAN8sPJWzRg
	Gq9U9BEcMqtYxGyeZcoJHRdXXPjfWEKYhfaW82mTj7tzVT3UJGpzXdnzX5Az7ynb
	LUwkFaaqqddedNOJCQ6c+4ubxNthQFBXxxquvTjrvVD5uIQzbIwt62deMogHfY8C
	khe+yMHcpSwhrgpX8EZpa2sgiN5eKaNVnSncvYPVQpJmTS5cG1Si5f8ADGD3bwBX
	Z5QlZFbkrJKiizsw8ODUnvVcpZDrcDW3vrswzq0u/yc40XqZGiBcUblpn/jX5HwO
	FBIZtQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkkux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:53:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so240534e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092426; x=1790697226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=;
        b=QoxUX4QrHzSWkYmjjJigac1nU8W5h21I+CDVj7d8FKi+oemOXIvFM+C5EOrolguAus
         HRgbZWfRQj/h7wtEMvPnVwIXI5JNbIe44NO2VaaKjwnqpBzafqxYn1geQqDd5VhMzGiS
         ZMcLFsEL8F/yE2b4m9YVau4MLeMBVb+Ymc8aGDKI53DPDdCWwwAW9I09uec4V8CPYWAs
         Av+KJmKYV/5nZQDUkol1TarliB1ka/SKb1L3q/16XxrIaX8lru99voSVI+CepfqjiZfn
         UXANYuPWHOyein+GbZjp2ZAz6lIron3bx8yHKSJvyqLtJjr8OMNcyAGph4apEuqrzr3C
         NTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092426; x=1790697226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=;
        b=1hJgTb+06FSwdU1fdxe+K8zmd1o2FViAld14v1NT46kr1OpDsZ/bpxRdLTrzob/o5Z
         Osmtfc7PfEP2nq4bv5W+pq6mqENm2nTGVIB2GeQ2BxoLrDcuJjPvghuMYwAjYA3bYSYm
         KdlUBFTidah+J0tBkhrLFpMx5WMLUvbYeUpAOhgriqrBEKHWOEm6pAB5WXvgyg4ofanD
         2M0oyPXNdBFm1L9jUQ6tXJEzVQi7DIaojUa6Wcd89knjgmgvYMQm+839s9wJRKJsBh/S
         6I7UUp5IzbIElV/neI0K7jDlTVuEixbtFl0SZ9zhnPCE9R7HDs8Pv4CRA2kqpZGpSEKa
         MtxA==
X-Forwarded-Encrypted: i=1; AKwUvBxeH01orHqIZ1TmHVsVTuXiX24NP/6XnMi79OfoaHXH2+Jkh6ufr/8iRFRWNWLwQCYlyHSufzERgvpN/aj0wvH3@lists.infradead.org
X-Gm-Message-State: AFuF++mL4aJQd+Rj2Y/eTfSEGxhz4ARLuMPjVyTNBtHmpyQMfIlp1DYi
	c9LLszesyviuHL5G+Yc7PnWqoLpB8c3RcBGBrRvTrcAv0n3/7/Ky9CM6cXtd7u2S7LC2bn+7W6i
	Mm9lizIByVp8KMZErK6d6072ezHyuwNj4C4c2He3p09Az2rlQ5S7ZquRwbOplCK/RiKc3jTx4Vg
	IghA==
X-Gm-Gg: AYBFou38bARB0OAy9yHa5wuMrlRtxA+i2Wwa3B/xBW8PewnI0Zr/TycJN+ziv2bmTSp
	52SG2hHgCLWXnFpvWcG7yVFmiTxG5SPevj6xJ1FAOC2ez4GEjrr8lJbO9uiOPlSEtGeFmKfJHnC
	iFH6c3Kulj6MtU4Z2OLnAtQJvp26nzqeYVfg692OLhwoXkDtKA+4IiwrosEhFBOXeMtmqCpFmed
	Ldk5++eVGxdogdvWUt7rNlc6/qa6vO0Q5HbItYPZpQiNOFaLrkTyu0hq5UIqfJdM895kkuJuO/O
	JyvihRDlfqzb2h+tJfRccevlJ6zGky9omvsLFCz0n6NT7ySoRCma5WUQR3pzCvRNIdd2FtuumjV
	skdxwoeYsT6Yr54Ce2Lw3TQ==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6495486137.2.1790092426368;
        Tue, 22 Sep 2026 08:53:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6495425137.2.1790092425877;
        Tue, 22 Sep 2026 08:53:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5808dasm107428966b.23.2026.09.22.08.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:44 -0700 (PDT)
Message-ID: <578c26c4-a340-4158-aea8-40944a1067c2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2a48a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: me5xXMx49mEgcUs09ABuoIfxbZzFFOMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX+4/k1pyVNy3s
 cgcHwnushLFyQxTSd1rlH4CLOXAB8e1ZQTpeIZhd+Y0hoX0xJWiNY0Bv07yk0HDMz7EYui6IjCv
 /mrWRIrLAhtQtH/TT5PI5YDj1XWKmM0mm2LFv4aeua5KCBpzq/QBLketAYMPjbi/4e28W9OptvD
 ZjMaBjAzQIox+Wzh4e0MYSpimjVKTh94d+r+0oLFl4SEs+pdTYKU/n/p1qtW0ehHcy48iQ/jBq5
 EWUTpVnjHJiQjVFREUfD4d9s+DHrsXNx5noiVjFmHIHmZZJscbguUJlpGgALdCCoXUl1X+5w9pC
 IuxfEfiDP5kSH4xIimtQj49UcWwp6hZUxHGxx56X6LgZUpJ5DuICdhhP/BT9Tr/0efBlCaqWBat
 N92akr98oKa0ezzzOlAkE2/1urUx9OCjN+39C1HaNkA6/DDs2pujajtzNhBs0gkTIxXoM4EMPv9
 t/BK3yLz3IMgvEjZ9ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX8WWjPDF3x/6g
 WcZe4CTmxFa6TbBmlbw1/CeOFjDdswNADSe8k0qUnbgN3JfzIlF0mR44vwyjQjxnSsbQAu3b5RB
 XTcNEgqECfEPSSEb0oWEo6C2N5O6o8I=
X-Proofpoint-GUID: me5xXMx49mEgcUs09ABuoIfxbZzFFOMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085348_210561_6FC9A8D1 
X-CRM114-Status: GOOD (  13.34  )
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

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};

Likewise

Konrad

