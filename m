Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A54D1D87E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 07:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=; b=GcyJGV3doTVAW7FXxiQ5PKvVXd
	TyQV6Yw/1adlyerIL/fe0CkRpShoRA+6CZBaxtu4MaFN9cV0Fy2plitRxmpQ8Gr47QYAoM0N1FiTy
	tjQQgFku488WmiZab/rtL63bLEazX4e9Oeq0TYAuFa/EuiA3jg41QMp1Pc3UNmJ2yxhxkYblhB7Ba
	5aLAHWFo1FfhZiaRSxjnTzAOrZUZgrayLAtl3B/HreY2B+6Z0v9SzofqjddoYRThH/3rG/VY3+Yrw
	6hPeGTgChpYyMzkNWqGWNJ0Lo1GPBIbNmBsESDqoGT6UXTPuxKKl28oo/Jf0XKLpHVIn6D30t/UuX
	voKQHTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Xo-00000007bWR-2c0Z;
	Thu, 04 Dec 2025 07:14:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Xm-00000007bW3-3rdV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 07:14:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468lie734680
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 07:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=; b=e+Phu7H9jZ2KiMcp
	2fxKKyJw0GVqKQFfutfDfVrDZFBrQJvfC5nc1Gqf+CVQ1NPUWYmv3Fr7SsT580OS
	nximFAtXy2KxXsoPv8q33pFrB6oX7i2waI+TWLjOqyKlg911DSJvvwr5A5EerBTD
	OvhIykmJtN880CNL++d6gW51957oBCg+6aD1wQ7+se5ffU0nWV9FMpbnfavUw1XW
	smZBVg3aPjX0ieU8ahJ0kIUKdg4Tj3c6NHnjekPcWRqu8B1ywR8vcAWo8k9JBcvD
	gPChlFBJIgrFq+Tbwdtq1UIGKkQ2483s1oiA2VXFtaHtxQKPkLCwm7aFng0dxQqk
	uvr2ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atr7yjcwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 07:14:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34943cc3221so1038521a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764832464; x=1765437264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
        b=gEjeW4FRNlrwnCZyeTl59Zo1FRWtifi5dRXrBvcOB2+9UQvlv9vtT7oCsitY2td49r
         qFhjhclpvcb0nFnQX/TpdotM60rz0MSpvmvPf/df9n9S6fWFOo2ZdrqtyMaPlTOTK4Os
         qfJ51PP95uf0gu4x3gLzVQB6xeWd1OHpegIRUUtnHHcWj8GkOa0fetugV1bkCGHVN4/U
         fd5q49iVHravLnXx71P7fPs3fSElfMW0YavKNPU4ny2OQT+SanXGQZ2sS5Cp/ExJcxz/
         BpdkDXREqmiG2tK5DywFF8ygVgANN5G/OBDRqCzPpRv5LkDD7sICY4KpwJevhLXxa1o0
         YE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764832464; x=1765437264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
        b=DSQgKE3sqDezvyPEMk6+a7TKptQdeymGbNmIKVpy1SHZ724SWwXFI3STDURbMUFU8+
         qbMAldIUUofExHRo0QXzr6ySrJr4PXRG7ZuwgYaHXhVFVoLDCZYQ3J3THcsuVtrDwKBU
         glGJdt4ykf6EiXC4IdxNLqj8zXIGKzvYeb6yZDXmZgSlNP+lXFRh52IWeiKLw7Fk8iNw
         EtKM3IpP5rMGlk1+rqDkUcGjCqznuBP1AAuWIpT2n1lSOqDj4m+a+F6BfD6pZzSD3a3k
         OtQ/oOMzo3CiZTD4sK7AYMo6Hb+L4UO1Es4o3iz9Lb6/ibRPs+eNxPmsaX+AbFJKeGfE
         oFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq+myqaw47esFeiXVqISRlJP16MU1ZRncSS1Gj4W9NZgu7vlBsY4TRlY9I/8XrlwEeXf7CY7BERpKsBL72JMmK@lists.infradead.org
X-Gm-Message-State: AOJu0YzcyHVBDJcRyh7YvzzWABwkqIFkfQJN37LpbccZ+DD4LX2b2bvs
	eyUN2Y7m09xaLfoz6exGlcXoUwxXaBp1B62xA+RRDFmYPFZEfMwl7acZnNZyoOv7KpyZ/3obJQX
	vu3lg2dYk290ZPv8sXQO74F0BQ2m2u9QiqBZrVlZPqKFBj9w1dDUwIaKcnN+bsLLLkMzWAZEX7D
	B0ng==
X-Gm-Gg: ASbGncuX+kl1+7ZmfMIVaiLlmcA6SJg5hSNvWs83TyN++RS/oPwK2d11RbPgnpvyblk
	wWdq7iSQb2+PmWrJjME759h9nNh2WagdtvZUrs5n25NpHUZsh2jwpqufHxW7rwI8O7jYxXEiMt1
	3B0jarPQoW3T9Ym6YBYB9ftZFjUc6ZPzb59i9JMLwgb8oidfvBibwWMQSRHzOV1VIWGmjWuYJ0I
	Trj1pHM3N2seKrCj3jzatd8w+/k3vXK6sYTmG0EYFO30nNTNAWTjvoYgIzp9W+OwuCoLUuOPbNT
	LAubGm9UnX4bQ2hHDediLHLCs+4yNguFXo5fD7CArYbPdaZOUapIIgIEf6cALpz3rFBCvi6j8ag
	+EuJOglghwc8kURuOZ5cnDBXOGCMUE8m4QO3vKw==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-349126f0736mr5893460a91.27.1764832464458;
        Wed, 03 Dec 2025 23:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMj8ey2LgMUls5vb/bDVMguHBOIr4pbhmoevWwLaJZ3BPPsbZLE6wlw8i1niGvDyiNmkNTEQ==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-349126f0736mr5893429a91.27.1764832463957;
        Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f398fa5sm889313a91.8.2025.12.03.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Message-ID: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:44:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8-idxw03rXqxYK1VkzxPyZDVAc3O15qm
X-Proofpoint-GUID: 8-idxw03rXqxYK1VkzxPyZDVAc3O15qm
X-Authority-Analysis: v=2.4 cv=ZMTaWH7b c=1 sm=1 tr=0 ts=693134d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JxPSEc7MvJ4Lh0wbHXUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NyBTYWx0ZWRfX93+6IGe+cDmU
 mZo6cz1DkwG52hf3mNS/X8qsGTO34ds5wYGCcNZHKmqLUuuG78MCc9RuytqaE6lmbxiz914AEFL
 tI2BVH2TD8dMXrku2sfnZmO6TZBsBqZuVa/Po/1R4DPyAYCutaXPndab9uzG96+6ZzPHMhFQTwl
 aTYdzUcRfItnt34pKVyOH+IRKczawm5n9aXTlVJK5nYehaSLS3LxJo3hW6Us+njUqJIKu+7GbRK
 EZzZqk3aCL0UhoKqyHwuJPiLEh0OnEbEHbQU0/aC7BctSAx1ohX462Ae4wtiXbAEPmdF2qQW3ny
 /uSkkTEQ4tDvFAsexb8/ChljECiBc+B7b11ulNr61TkwxsNwWcmNn5QU6+ULBS4TEINEeiqcf4m
 6gizwyaFJGaFVCR7Xu9dA0lqOA1VRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_231427_080406_8F296911 
X-CRM114-Status: GOOD (  20.86  )
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



On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>> Support the clock controller driver for Kaanapali to enable display SW to
>>> be able to control the clocks.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +/* 257.142858 MHz Configuration */
>>
>> This is a bit strange frequency for the boot config.

The lowest PLL configuration is used as boot config based on the
MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
lower frequencies as well.


> The frequency map lists this odd cookie as the lowest predefined config,
> perhaps it was pulled from there.
> 

Correct Konrad.

> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
> effort to use the m/n/d registers, instead relying on the PLL to re-clock
> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
> 

The m/n is not preferred in the cases where the PLL needs to slew to
derive a new VCO frequency. That is the reason to keep the divider
constant as much as possible to derive a particular frequency.

> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
> 

The lowest frequency requirement is 85.7MHz and the frequency is derived
using
257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz

there is no over-drive at RCG of MDP.

> Taniya, we've seen something like this in camera too. Is there a reason
> the frequency is being set this way?
> 

We start with the lowest frequency to configure the PLL and frequency
requirements are decided based on usecases.

-- 
Thanks,
Taniya Das


