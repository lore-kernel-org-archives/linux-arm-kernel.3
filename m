Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404CCC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=; b=yprWqJxFZ16vtxWD53gvgXfTjc
	kE1Ygbq246ogcngJYQey2s8eYHXBTSVAw05yF+ZVv6FzQhqi7GSy8HLD6Ieg7zXoOUUAuyeObSIFC
	8Ia5mZIInSaEJt9OpLiVS3oT6RYHu+HtvTAIHfOfDVMZeUveQViNMnbuV9kFEIfYvDduHBfHBfdZb
	7tCr2dWQGB/imnGWlxbaO6CkMzaxddkKVL2avC9rRILLW6iaBX/Zf6uVpZtueC+HMZfM0t+KGPZT5
	IZPH7dOxsaDuKg44UMPIDAWCOFGU6xgN+s9soWWCaxQcgAvljeHyFYR93k6A+j1XjLYtIPDPpTBvU
	NaYaXQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRk6-00000002XLP-1PKC;
	Tue, 29 Sep 2026 06:55:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRk4-00000002XKr-0wpp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:55:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47OYk319100
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=; b=ZfI66UMaKQJVqu0h
	3MOfB7OdWNiJXGesysBezRcUcr/Dd9HNYZrgrFVc8XgWj01cMlwKEq9BACjWnFQG
	KSkWr8KnbzK0uezN0EkMQgR3C3189kUg+zGjY7AtL7EVKax0d9ByGleDrY7fbGUE
	vRihdbd+yV2xo+xwKDj7OGFXXaJtAogDRlo/RB2NR6FydDVCeQnaKL0LVWyKCrP/
	dmZCadBHuiA87oBBtiz+qsDhS4KXT/3Mc56lfDVWtnw0Hpqa4d4KG7YpdLT2mqtQ
	zAmIOeMnKfTlT/uKNTfoWtWMO8L7rwvg2yZ8izI7j7+gJThFITGiksb6hntM2szC
	iIjU5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03jn2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:55:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so2796325a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664907; x=1791269707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=Ag2kruLD3hIfDLOOM4BSw77uL11xrlukHNeegl3cc6BGj+y7jRa1cMOuT+jtUY5Nuz
         EI4ZexHcuiRLumaRksidzZUSpdnLj6B78DFBI1+Txd47SfCs1UjllxZv6pKD5XzONAi7
         jmPEmOfQmDqJyP6+qBnqF1E+V1ri514zBoTQXiDxgyGXQ4k6fBpkQwlYqrl9UE9mPeDz
         q1vDm4W07wx05WRys1Hg9w3xkelp2wfzkXBg4tar1spCUMVe81HryaSeur24qYOUxMjy
         8TUNjrEIomkZi3fbSxqXgXOSDdfaBUGK9xCZ5RT7nLHOY/4+aI2WN/TLZsPJzfYAYgZ8
         4KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664907; x=1791269707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=lFD6Bgrihgl5YjigE5TtuKwJABBH6hE/k+itCpwG3KeaBfNCYa8r+/5PNoL6IGcP7L
         mTkYcUESoFTm+ud3qrOc7KlANmkylfg7svuupEqN3WFMufP7Iono6bM50+iqg5eSC2Yf
         F5JbFDox1cdtKy2Oxt70d5Nc6Is1fP77km3/3Bw+XCcCinaquMfsBf0+Fd0e7deHtIIt
         +D3GMypraX6+EQymbRnOHZOWtyzySaU48R7NscBU91weO8Cz2ICHDll7MEzekopaXcB/
         Gkj4bK0LgxVKzLdk4XIys/sVkw1LIMHNyj4gDsYeyZi2mnxrt6/uNbAE3f3Fp+f4zITJ
         IN0g==
X-Forwarded-Encrypted: i=1; AKwUvBwqDAbv7GRiJ+AAnYro1vD65+PJ0tuxs0M54vXQAjAk3TaTQu8BMVs3JvWUKOC02cy1oWWVMAHsuFlBKHvlPXqr@lists.infradead.org
X-Gm-Message-State: AFq9FYLBYKN+CNZ8E0Kokt28G6ATbr2+cgjcZw80AoQWlczmqjTA7eXC
	8+Rnt4d9CrG+1M5hgEZM4x5k7i3DXC44W2SRUL1+rDwrSZqftXCLP9uZJwOcJ8lTvyWir3pC1cF
	wdysrjJVQC5VkkZZs/m9dQcK501LG5KdCokyWuHWgD1vzgJn3qP4eS4IEYlJ0Vmoi/ijqShprQJ
	J/ig==
X-Gm-Gg: AYBFou3OPVSzKcgkO3BXbB/4Z/aNern5TK5oMsih8GTj5c7XhuQubqyzf3swBLySOEx
	z5e2/9aqqjmSlvwSrhZptgBdha3bV59Pl8DGIPdFfzkKwDIN83kQVsY6ta9gcesVLRYZVZiNkAn
	rlgqnj/WfzpHhtElH8Wzh68g16m4bMtG0nl+VFu7vou+CnSrwfI21P7AUM6vt1Wy+zvh4BpvKHY
	VFOK7wf9iK812UplVMOLKTX6vZ8J8N1NhnlnLU8o5SoHiaSsnNHiuQRWSIW4CiITp7c33MJbTTf
	HVG6KeqqaG32zPQqYLZ/viN3dw9BCWVp2oqR9dxLb4EZ1hxySkvni9uAmCT+S6hxFQQ+DedgV6/
	71RAV/R5SVEIYOMoIDVBirfTZqni3XHQ0XCetyf4Qf4giflRwa2m3vpDry6mTOen7TMzdQPEAC0
	y0dUJ65UiJKs83S4Vb12cs
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560097a91.30.1790664906890;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560071a91.30.1790664906414;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3713170a91.12.2026.09.28.23.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Message-ID: <ef5bc89d-3915-45ac-ae7e-da0aa1976c96@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX/Co3oI4KqzlI
 IfXZKvyW3vQujU1/siYz28QGiHU7njJSHcqQxMcVH8I7UgTVR+Nas9WjTa9CfCWSr/XUG7lfB1Y
 U3aiU10/rsKwjFaF1KvoDPM62IjZ8u0=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb60cb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX4ahlhaYon2Zj
 UmqQpNuJR/YG9dl0MHc6yYKWzwakvZd8ESVUTqGeUfD4Ce3lB8jX8CzlGcDchVNgtDAe+UgfSGk
 Sza3ZPdGoIto8dhdNFiKb/HNxwRxHCvkjS4xVQgO5uxk78YpV6f+vjH0T3Ytl4cNF6t4h8KarWu
 QT2lm1PfqFfpNX9mu2x/yv4kBSlr/MA0i3Z9qYj+B15+XkUFQIjTQaSKOAP/KLgelP+ZIs7MZPR
 JyV3AGHk/9eitfasSIGgD/52SZ90lXF2pOoPFGJxsw/tpZQhzDZoKs96soFuLp8yo9Ge1x7Y4Gc
 hvBglVCb+kN1xiqkfjpUcQsZlCYElVfVGvHuBppvO9VStCQgEL6hy9DfL+0tl2gUzgqx6peR3mU
 irhuaK+QcUxD0bQ/qnuJ6MwNm7f0qldTNwZLjqH7rVkFCi8BoRg97yrprD6DPpeEBEhO9OU3YBZ
 QAdynz+CHjxIju4VQrQ==
X-Proofpoint-GUID: zscirrb8H1ehWBkPCnpEzdDx3E1-WrCN
X-Proofpoint-ORIG-GUID: zscirrb8H1ehWBkPCnpEzdDx3E1-WrCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_235508_278913_895DDEA4 
X-CRM114-Status: GOOD (  15.70  )
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


On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0 0xffffffff>;
> that's just "ranges;"
>
> [...]
>
>> +		qup0: geniqup@9c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x009c0000 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;
> likewise here, you don't need to precisely limit this.
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


