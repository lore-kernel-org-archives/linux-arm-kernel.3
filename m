Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E34E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VAUnAOqDKD/w7nsfXSvt4pC3AXzpCBYpE3jsdeI1ag=; b=pDhbmSUN9Vfa1YAOG7OlKRniGM
	xeoa0FpxrpK5DqAWv+2iaqNYjXh+x2mBm61SuhTkn0v+mD+opjtpEfsOP6w4JdD7pV28suAC6JEEq
	qzOaduCurMlKtYaehqXEo8lZPpoh2GcCeveUd2ln5Kd0wYhDIvMmPh7wOA9YmSYWJmQpAtAN0gkCf
	keJgamwbzEDQNsOPEd/+NZh016wn/nD3Yeg/z0afyaMHdpzn6rYKpXCzIS0W+XnHr6LLY9YE2rsQb
	vCng9TXU5amCLWF+RkScthsKMqoOsN92GYtAh7jw16otbeWe+QolZyUHcV67WYXpr3cRwWWhLCiks
	FiRNmoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOO5O-000000039l1-0LFy;
	Thu, 19 Dec 2024 21:29:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOO4G-000000039dQ-3CYg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 21:28:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGGkaj011025
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 21:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VAUnAOqDKD/w7nsfXSvt4pC3AXzpCBYpE3jsdeI1ag=; b=KGU3Prd77RQ/ARn1
	UbzGSNkfE7ojalLZbAX2gFWUCHWV3WmJqjZ7ifLrsfNKziWEG5UHF2VTjN3QW9zi
	D0aqMvbtyK7768hr9iaQFzK7BzXBCAM+B2dKDHcspKdWSIJYVPMNDSS+Bl+evt4+
	z8sEmKCFYcbvAcpOB55tK6/iFC/y3lX7h81Cw95Tw/RynVHiF1URyFJy6ajUN3Gn
	q9S46kZiOpPk0ppJk0lIL06beV5DjLKDGTMXWaNQpOh1aBVGA6DmqbgNeN3YEHde
	Cl59q9AVJou+LilCK7sXpKanrINu4Kxi/XTPYL+50k48UXiyAVZbZxxHvf5IHOra
	Ahd8TQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpvagq7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 21:28:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso3689456d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 13:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734643701; x=1735248501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VAUnAOqDKD/w7nsfXSvt4pC3AXzpCBYpE3jsdeI1ag=;
        b=S2Qqw2o0bD8z3kOVO9rbcP320tqu1PLEjvv7m3d/QikLRWNZ4Okj3vynwGJe8eCPlv
         6iyPXIXyGrCDKd9C/H/yII0rSE13mIodVdpe+fDfBsmf3UKyCg3KVfDqt1iQu1sBu/ed
         IV5ogaH/gI95UhKiUgYBYYP9RU/dwYvp44vbnUDwWg4hn3Fkl2fUkuUHsXrVb7AnR3Tu
         oMWOZ99WZCpjYrXhBw1nHeeCOC5Y+sQbbckWVDV6O8LMLYpQnW0l0TZY/ZW1qHlnvW5G
         tO+o7E7de6DZbmstLUAo+3c2LqcazL2NKVmClpbqxl6Wj/Y+b4DhsG0TrXz+d0CX91Uu
         C1AA==
X-Forwarded-Encrypted: i=1; AJvYcCUy14VU5DlqKBCmbV8IMJE/nkl1mcs4QwTmKATs3jZSgj7vDN/1m1IL/8/hZZGGdNcjnKMyhW0VruBhiXbdOPJe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1AALtIGmJ625VKZDaERjORuQUM0BR5dqZEmhX3+3ffj0Jp1NV
	xh/RKkV9eGpp2aGWoXHycPVNKzqZjDiRqv0o3pLYEgJ3Wfli51V8pPVLwk7BrPhKTas+jQojST2
	2P8jnfGnbcIsoW4Q+Guo3p4fHf7nIpaNwlR2tWt0ozr67iAS5YX5LGclvXttquP4gWwKK6krnzw
	==
X-Gm-Gg: ASbGncvwY8nHT1ktweD6aPVTJEeBLzWV/626hRIssL7D6DtfdBY0qWNrQBlhA0E51tP
	vfLJXcfE/PYolGL1DcAGwKhQW3mOaaADQRJA9fayMlTNicXijmZJziUCy052My8O3+9ilG5aqfr
	d4IoGssqmTYTi2mYEZ0HDMYSILcca+YscJWCwcSLRB40JPrq8xvhBq2MgcjBPihhEDzc3QHgKRU
	V4pTBPOdKICM1MLDkPPGhltIQG0a4ItgmGmFegYX5+z698sTa6dKRPYm0TU947gRNcpomj6Pr6i
	NuRrFnrMtJUAhZYTo2YhyiKcmCwYMW8w66U=
X-Received: by 2002:a05:6214:2a89:b0:6d8:8cb0:b403 with SMTP id 6a1803df08f44-6dd233acd65mr2590466d6.11.1734643700670;
        Thu, 19 Dec 2024 13:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJnIn0G4+Wnlxs6LmziXnXITZL4O7KHJ/pJ3YBrBe8olWnjoRqJWPN5SOL8KlIfXyMXzRSAA==
X-Received: by 2002:a05:6214:2a89:b0:6d8:8cb0:b403 with SMTP id 6a1803df08f44-6dd233acd65mr2590216d6.11.1734643700234;
        Thu, 19 Dec 2024 13:28:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed718sm1056008a12.62.2024.12.19.13.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 13:28:19 -0800 (PST)
Message-ID: <fb9d117e-77bd-4a01-a738-f72d07f6b84c@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 22:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Jie Luo <quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
 <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
 <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rIgX32WudectbW-TVlOK0e-MadAsop-q
X-Proofpoint-GUID: rIgX32WudectbW-TVlOK0e-MadAsop-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_132824_920642_5A17A6E4 
X-CRM114-Status: GOOD (  23.93  )
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

On 18.12.2024 12:17 PM, Jie Luo wrote:
> 
> 
> On 12/13/2024 6:30 PM, Jie Luo wrote:
>>
>>
>> On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
>>> On 7.11.2024 10:50 AM, Luo Jie wrote:
>>>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>>>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>>>> block routing channel.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/ arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> index 78f6a2e053d5..9a8692377176 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>>>       clock-mult = <1>;
>>>>   };
>>>> +/*
>>>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>>>> + * from WiFi output clock 48 MHZ divided by 2.
>>>> + */
>>>>   &xo_board_clk {
>>>> -    clock-frequency = <24000000>;
>>>> +    clock-div = <2>;
>>>> +    clock-mult = <1>;
>>>>   };
>>>>   &xo_clk {
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/ dts/qcom/ipq9574.dtsi
>>>> index 8246a00a3e3e..25aed33e9358 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>>>           };
>>>>           xo_board_clk: xo-board-clk {
>>>> -            compatible = "fixed-clock";
>>>> +            compatible = "fixed-factor-clock";
>>>> +            clocks = <&ref_48mhz_clk>;
>>>
>>> This must be squashed with the previous patch, you can't introduce
>>> code and replace it immediately afterwards.
>>>
>>> Konrad
> 
> Hi Konrad,
> 
> Looking at this comment again, there may have been some
> misunderstanding. We are not introducing xo_board_clk in patch 4 of this
> series. xo_board_clk is a pre-existing node.
> 
> As part of this additional patch 5, we wanted to address Dmitry's
> comment earlier in v5 (reference to comment below), by converting the
> xo_board_clk as well to a fixed-factor clock. So it is better to keep
> this change as a separate patch in my view. Hope this is OK.

Oh okay..

What's the difference between xo_board_clk and xo_clk then, if the
divider is accounted for in xo_board_clk?

Konrad

