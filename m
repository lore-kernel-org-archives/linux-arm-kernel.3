Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD06C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=; b=0lltdkaBo2feUJa3JiNNkqU2Bk
	JyZiFiuUejG1+r2oRnxLrEzpMiPH2rLAA1TTKQJwC2WMM1jFy5SEZG1dzn8gNdk4kfjTI07H4PQxE
	SHOlol2nJQONxUS8Izf9goxpLWGHAzin5Bxn22r1yB+8bJTRVX3DWIkUwf29Ujix8JYCDvIbWjqyX
	HFAKcyV8tZAhP9yA/6rq+H0GR4oqvG2upov/gLejal2w2O9AtRwFIU9GizJ/9aJhI0e7QpoHsamE1
	JmkJDSC4MrwckkJHyjIRutRciExTMBc8mX1GMkLfAN2CfnDpuKhZoCJfUYYf6LJb521WS+NohNeGl
	Dq7Krzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRqj-00000002Y5J-0Ybm;
	Tue, 29 Sep 2026 07:02:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRqf-00000002Y4z-3l5P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:01:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T472YI2686032
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=; b=irY5eqh8LFds3Wrn
	LL7dGqkqTzzsHl2HervKA/a8JLkEb0VPNMlnc7eUuIuk4w4O1Q1cezHOM3cyBZD1
	qyfkiJT05aunzs3UNulukqZfg7QYbjZJ9e0MdcWidmqrdWLbk7R+EWvLgOv3TLIY
	0ofVs73zKfZhLJjDQST2GqWiTP3g5SwO9K/v8dllOkgq6XP3BmjeEON+RN4az/Gn
	n9hfy9SZd2cQZ9950ILuVsWrpoAN2IyRYYjzp76vg3eHJZmXWMt9jGMGjo6jdNO+
	9TU/b+LW38jcOf8x8TAY2lpcK1xA/rgPDkVETvxrI2y76vgm70Y0cVuuO/jY/3Dl
	uBkZKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjhafc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:01:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so37524335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665316; x=1791270116; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=jL0nRN9fLRR5Q4cIRPZHZgf7VlF5ln1StRK8TCWPDgaiFOe9jvEvslf3TqANhirfXA
         PSKo3F8S0tkTpJDG/5hZBoCuyfo1Fz67vx0W574faUfyHJmW4WipaVT6J6aivZTlFCXq
         hPqFw6+uSxbU+xG0TAm7JeBXqObCw7SmrHf5w2fST8920a03+7MDjmD2LUx6OqkRtJV6
         y52a7fj3gRWnkBiFHGzBVKf709y9qkjxxlgC1t/O7eplWa/C76l1ZGQ7muBFJOEPRejF
         J9XusDsjZQvT9bR9sbry9vYK5mohLj8/jCjuDWp/1EPeLWv9TcmtOs86yuhZ4olw1Q/V
         f6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665316; x=1791270116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=u+qWeVdiQgje5amVzLlrA2K/TtKaEh1IcPDgPWeSmNpUfBw1diHsy2s8GwdlyDAJVj
         7AmgKTFlczTCwqqQlkL59Wv42jBMAQyxZWoP2P7VSkZkRa25xzwNi0lOcCok+LUrdAOA
         SfmvE2U0HPh7MOXOthlqANx/BIsRwfLflU6mc7WVwSY7gOe60a97QvPSUbmIFcVEfpOY
         j/xQ/Tue1+Ahvyb227Id2AuveVsQVGUHC8/0rrgCyABKrKAuhZCykUvbqj6+uiP+SSAK
         NCoWLVs8T0U7wyyVCyCW3H1doGlG+JwEFbKSv1LOZ8T8QMSygBrYvMhlIaRqWSnDliM8
         QqxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8smTrVu/78H2EFw4Pf38PlGI/nkk4DqlMBRITI0iad1OM15A0SHjwueftGFQCgsBU01+AsxVvEL0ylLSWOOEJ@lists.infradead.org
X-Gm-Message-State: AFq9FYI9TOOugeYYWehwYP2LU+6dEWeFfzT6wfUIYjDDeEDPC08ZhNle
	9JQjnl1Ed6tPzqArOmSdKLAdjrCLCVmNYDNVKzjpI3EyUlhXiVadOFFbrXvlRkNrnEuEvl/mccH
	ZI+M+7JLK/eAkfjmOTDp8WSP7hCXUzX/qyzw7YAZZXvyAM5ZIkmo+MX605CJ13sV5dhho0sJGlN
	5clQ==
X-Gm-Gg: AYBFou0AA79zPbUySL6nKTG5azEQ4DRuWqU2/AdXiutdRoUzPbIort8UMIVM48reneZ
	MR3heBsnax4/smz9gONdrdVOyDzdQqMRdV8yi0++XeEchcVc/o4TZwr40gX4NUAuq8/hGyuh69+
	K2A0Iy5oMuNLiZMFYj067blHNfWxZjqgiUjWiDDj4SCheGTxiGyQqoPByRAK4S3s+uNqdmUn0HS
	bnGHP7IQu0483ivnhMqX5jInepi8CKA8bog0p9k8+kJu6AhH0WB3HkD8ZMSu9hO048gMWYgMcnz
	MbnhyZtILrGP/Lf3xpz9fNBznhCcjPqzpQ+aQYJqWF7fYE5ie12HwCIbyPEymJeyBSxL3zFZECL
	sc1NRDQWRd08Cn5w+XblzkoIteKIAXiB4AlaUIvg6xTB5ViWp2PRo/LW+suLpjnaT1b4LA24bqf
	Wgr0UIECHrddI/8lP/oFhx
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031267a91.47.1790665315785;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031218a91.47.1790665315274;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm3763219a91.3.2026.09.29.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:01:54 -0700 (PDT)
Message-ID: <c29c1bd6-77b1-49e5-94b4-d8ec14346ce8@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:31:46 +0530
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
 <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXyfCm1S0q6iac
 ZABv4A0BP0V9LHpZPeWIpN10ilnOTB6NA1EgXk8p3gM+CVn73amUy7kP7pSHhoQz40kamZWR4Pd
 Kb0BzarbF73rFjAc9xdXzPDMhc1Ew1nUcxhMRRe4Qyxe9YSUWLfoQfxQX11eJfLaXEy/rkx6KZS
 tX6OEC2ntBMv/FiY5s1SMYGv3moXif/Ia7MqQlPV22zu/1hWfsOtbQlj5hBiC0GQMdgNkS9Yy61
 1MSlM3sclegeBvdqwmQ42hBWXlj0Z5RuLEI0KbA1Gy3189Zs7ojsHNQCjcLjRovLC7JQ5zBqJdv
 6gZcjmBRZkGE3+HEM6gdzihBRqy8juJaWkhlVu8BVWV5D41vxtB7BFhg3oh5spu74rsW8Odtbps
 YIROs7xePrm6QF0ggWHVIn+RleH7JrfAGp8L1TkmGy2+wG0fwM8bJCYEQfznRNHrI/fNnzzMz6b
 XNrAiM9aLIUN+MRH5Kw==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb6264 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX+PECD5vGfqg+
 wLnA5yiWBfQ0B8Ch/2Vjv5P6HilW+pBNhdLQl5HHnCSxvkLhUMgo+rbZHVs0zdhkoGKSbqwZU+m
 JCmScWC4rKSrsiyCTDj5F+h4gJ8p0eU=
X-Proofpoint-ORIG-GUID: ZB48iQkCqG4L1tkNqa-0yrj1yDzi0oOH
X-Proofpoint-GUID: ZB48iQkCqG4L1tkNqa-0yrj1yDzi0oOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_000158_089546_EC57625A 
X-CRM114-Status: GOOD (  15.72  )
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


On 9/3/2026 4:37 PM, Konrad Dybcio wrote:
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
> GPT found the following:
>
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,kuno-tlmm";
>> +			reg = <0x0f000000 0x400000>;
>> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 110>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
> This needs wakeup-parent = <&pdc>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 :
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


