Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F1D1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=; b=1KnIzR6NTvQH+aXTH72DkeErNu
	vH4sYSmge0zIr2WB2hhJZ767wlm5ychHwiIcSVOonhcg8wxCcWQmbpCyRAMAPfMlJlUY6mN5oD/ki
	dvigBU/WJFl4NhHgEa32meGATNzXUgEdz8ytOtLZEEN0EDIJ+WT7eExeUwPPpyv6IExLopGz9+9Yt
	FgyMhsgZe3Ds/uKBYPlMzTHQYVXsQvz54VjkVe0sbwdzXWIeb9ntdBFEKBcAewl9sI0fxRocmbh8c
	YQ/9X0+bd3xunnxfKcEFiVzNGj7WZ/rCOrJcQFLrUCq8g5wwVDQ1sU3FsvsA6a2BaCO2VLSnGbg9s
	t9Itfd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5jv-00000007lzY-0PVP;
	Thu, 04 Dec 2025 09:35:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5jt-00000007lzC-0CUF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:35:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468can599060
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 09:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=; b=n+24TaRmKX91GwTx
	tzgu+YT/FCb6pGv4/4Bnj6ysfFZXuyLJDsum2/sgeHJFjIKdWlXHnKgaMQsVZwZt
	gK5PO4imN5cPGCBPNCXVV6R0a7VLUDwkeTEuQZWWqfMh+rCv7mJAxHMamHPGMw+j
	mSJr5p0KiXW2eBhf0Fp3hPZV20J3v+IoZ8wka1QynMKAaahXFdHO0hGWYAjgNiea
	rarZhkEld6EAeOgC7BhOm47cxjAiSgZk74qRMyp4ZlhYBXICoUWvBd7BSngAJCgS
	CaUmghqP8+j0dwNQdlwhOLiNcd6PsLfR017TBIyGf/h/jzGGjF9WIcK032Wuv4qy
	k7Jyqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f0161b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 09:35:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso1298121cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840903; x=1765445703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=YNK2axS/5JnlB+F4sQihwwVeglVVHa4wabLJdt209Bu2Xtx/WhoA3qHQLTWMENL7dG
         UK3EEGwknEsNvKFqFh5pQR9Wulu5RAzQBE1ZOR3MJmO33WBj8ZIZABjdp3L3FXadqT/I
         ZRpWhgZjm9tYqciXl+JHe7cvG5nubAF7AiJgYhEvwoLVVWIbazBxcBriHRfnbLLDhfr4
         HnUO/UO9Wp8mY8fcnqvq4p1iGSlmod3qZtRtJ33Sk7gksxAsx4tCSAeuVfn8Uia8xPsJ
         kTWOqo7kxI0H6tGi2l60C/9G2wOgV0XtsxY2Qr8s8myqnQ26bZ8+IB+dYYs3jgnIY8mK
         RKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840903; x=1765445703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=CHAH7kWzK9FNYcM+nWso69sv6MLqnoJ+tUNnAPyL1WdDIjqVN1IZOqRuDrtJxpfRNj
         ltU3echkCcU3MFDqksxrVrVS47VXpKjeQCmV90IgtMaregexq5Wxw8wo2NvR6OBqF+9w
         HAEuCQGilLV17WvGP25bqOdWxYBOtTeo4Lfc904QaoOqUWMfczJXpQ95G6PXyszmIMcY
         CFHaPXoRrl21cCL3+8uSUhX5YnlFRrTteA1hLx0WicFMXtKWosWfniaqvJhrsfnvoe2/
         b/J//KPTq8GfGpaN+8EVJ6Zg9kxmnZHTy70Dg57iHnzmbq8u/m1Ee+b7lBKID2vJAZsK
         IZQA==
X-Forwarded-Encrypted: i=1; AJvYcCWIiEUSDHj0aO+1TfY5J+f8bY4L88wre2U8JEmJp3J8RxaBa0XyclRkVRbAKfRBITqLanLU8rDUGmtOIDe+v+Es@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx9nSvIiDKhhEEoIZ1K/ha0fbxVS6tyXwtXamqlTf/psOm4v64
	aOr+hqLp1Z1ZxVpB7vgGjdXHlY4AXfqJKO+GWxF7y/WqRWd7M3MCxOQi7slVRxVBoOyLHdsG5jM
	qVXFLAg5+s8eF5zx4fw4idx3k5iajKtT8fqirKvym7dXlevJ1ExnzMgGU8Tw9HZ1yn3E2anOUcJ
	YALA==
X-Gm-Gg: ASbGnctl2XCVtMreOckL6++UwOkC5AIHXfa+I4aKfcSbRjK1MQGH+NVnMbR1lJ7ZYJC
	TVKCnUFmOtph1UsPkFUG1vxNEOrr5RP3HxcpXHIroJ1zFTLtleIdWX6fgzn32m9ATPIRty5q32x
	h5SJCJvxz1jynEu9BlrgnEkgBk99x9IFQrARTVAG8tD7nZYR+xB/cWqGbtIp0FPSRZmaKib/RQA
	MTJzX15i4FTwziboEUsHN0oAV/7s0guJObnd7H2HFWkj1y3QW5xQbBR9e/z/LQl/KhJSGdAm2M8
	Eo2Proz2VOTJC/WeKTi8Ak6Yxt7EgwyrMX7KW9noexFjssVq00JXoAAlHB4Y+XD+YWk+U743oJh
	tS6FBMBSoT6Nr3XZIrJzYlcWYrMYVkGZd9eNIf8JEfBMlbleRFtYLAWZ+qVsl+rOI4Q==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162241cf.3.1764840902650;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+v1eNNwOOMBrWUNa6eWsNBTYHiNNTwNLR0pcIGD5JXevK1bZUv6tKavTcr9qRZQ7sGDnFA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162071cf.3.1764840902230;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412dec1sm758405a12.30.2025.12.04.01.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <69f7f357-d328-4559-be8a-81a9df790f0a@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
 <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
 <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TEMK-N3wdRIoq8XGzSwoZryEiwS5Ts_9
X-Proofpoint-ORIG-GUID: TEMK-N3wdRIoq8XGzSwoZryEiwS5Ts_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX8eocMEFK8xRb
 5SrXOSi0STi2JDWv//0kWAT1HIAvFZhQhkIl1THyM/u1+WkprrcHSSKXsJHZ4sK0529uDDimF8N
 R0YP+sd94yKKz6i2r0xemN1y6okMJ/eZH3c4j0ed+AXEeyHuE6teH55uj0OujgIXrnhpZtfZtY4
 yyE9L2yYM2P37zkgwK1jvBYA0b4jJPPqSNTrErBCKr5H6hI/m5l9uZVZmK2MLaqYI3J+D/LQSVM
 +DbeakQlqOMhKlgr7CGN6X+odMyMyb+NvKXkpZKn57VVUi59nTswGYS/R+9twHVTLFDFpOYNbeW
 i4cokUEkeHWKAdffX/k7NLPjqOkHhGhCFk5uIE8YOfdv6UVePt3wZWKlM7OdVyhI3BYJ38j5vEo
 aNtNkvjxS3Kktub8J2nql4BjoD+11Q==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=693155c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gmcpGffKwdJZmXMFCqgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_013505_231909_9D52432F 
X-CRM114-Status: GOOD (  24.96  )
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

On 12/4/25 8:14 AM, Taniya Das wrote:
> 
> 
> On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
>> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>>> Support the clock controller driver for Kaanapali to enable display SW to
>>>> be able to control the clocks.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +/* 257.142858 MHz Configuration */
>>>
>>> This is a bit strange frequency for the boot config.
> 
> The lowest PLL configuration is used as boot config based on the
> MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
> lower frequencies as well.
> 
> 
>> The frequency map lists this odd cookie as the lowest predefined config,
>> perhaps it was pulled from there.
>>
> 
> Correct Konrad.
> 
>> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
>> effort to use the m/n/d registers, instead relying on the PLL to re-clock
>> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
>>
> 
> The m/n is not preferred in the cases where the PLL needs to slew to
> derive a new VCO frequency. That is the reason to keep the divider
> constant as much as possible to derive a particular frequency.

OK this is roughly what I expected, thanks for the explanation.

> 
>> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
>>
> 
> The lowest frequency requirement is 85.7MHz and the frequency is derived
> using
> 257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz
> 
> there is no over-drive at RCG of MDP.

Sorry, you're obviously right, I don't know how I got it backwards..

>> Taniya, we've seen something like this in camera too. Is there a reason
>> the frequency is being set this way?
>>
> 
> We start with the lowest frequency to configure the PLL and frequency
> requirements are decided based on usecases.

I meant the rate-change-through-PLL-reclocking, but you've answered
that above

Konrad

