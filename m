Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E0FFD5F8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=; b=nAdqKl5r7ZVsrp93Wc1DKj/4q1
	KB6XtWKVvOx0xklmts9ASk4kgkNkqub4NfeRMMMJu+IC1UV8IK7KsRKOiMYg/ysW9IH6uhum8E0JP
	a50fJmuIJ1Jftt1WUTdw0DYxEZyxMzETKpP0OtA4Z2/Vjl0kZGpasyU4ApLQNVV7oW3Wqpxv/EAue
	QF/DVsg51XrR8mQgF14s15zPI6LfnKHIyJks44N60zLzjLqJ/0gmV7oaotJTOgsMwVnn4HIVygu91
	BuehfZ/XiK8/7+iHIUuA1aItr3HM6z59Pujx/20frVZbB627FRFZ+I7W0D3jBSKt8BLY5hdw9BZaz
	a0RYXkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANT9-00000008RhF-3TgJ;
	Wed, 08 Apr 2026 07:36:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANT7-00000008Rgn-2CwN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:36:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63839Elq2412291
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=; b=P0K3k3cp7IqmZJQQ
	YQ7RGgCppWOOh2CBadHhcxzE8ak7D9xM6hpjmAei1mzpJwDU+2CFLxpy/Vaiz5Y8
	PvYq+UU9TGJcg+beHTmeNxHn4eZ+nncr/zsC0ee6T54A6FCWMAb2/mJ0aF55B3OW
	Op79Hj/HtYutQ5gCYBaDs/V+t4tKv+jWM+rEecgPW1URmcGCS7cWAkjiOHFLcUKn
	mCogtT9jE7FevmbibSNRuiymAZeI/IpBhwsMl58RTYNZJxx9zGFabxhIOCuaeyf0
	A+l8hPjUMJ8WzZTNfCgBiyAEBR866j2X9nYQBZdFlZr0fzxWoDQjOjWeZGtsToAE
	euOs9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vakre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 07:36:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b258636d16so60818155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633815; x=1776238615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=KLwkK9Us+8zMgrj4nmxZSNnDzH7ZfeLrAXuMX0TOKGjp5YGR2/5gl0u3uJ2PmE7Fy5
         GonqM9/j/jG8ZUyRPiBmAten11NmcjussWWUmxTJc21OwUZvOdidFm1oTQ8RZxqthtoF
         LMUmvukbMTRyAzLjkbtVtHkefBY7yzjxOLulr5lIaBT/5Qtt29QOxl6Ka9SyCiLIoQKc
         F4Va/SSdM+yCn/ncugrNNrkQ6HkQA7ojCq8IjeFMg6+C+jOcfEZDomDYaq/aPHSbROX/
         qFOTGBHdoImOxZtSQwaD+EU58/AEzJyGLsbyhuFIbGCowsO2Z82AymFu6ckhfrrW/ROr
         3MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633815; x=1776238615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=EiAQf0XesD1VF+xwIPF035i4OK1rKA5cCn+SrMl5lqMm8PFNgAkjlmyXhRJ6gaew+9
         18Jc47bhbK77hXAPFvE7HrONtI+443eLR2QLh8EMrFUMw2KatRi8AMVnA2jx+OIONCVr
         uGKODm40+6rZ2NrAq1BL8Binc0kqId7O0X3NvYqnO5QKuF+Ro2csJISCRHkmF0qq2LeD
         En83hNyvFCfyRGakIKYV3B6y8Z2+H9O5IfHwf0IjYIPF90P9qdB7y7Yda0xn4UfSR30z
         7sp3f/TvidB2e8WzqAs3rei5WPqG1CdtI8B+ya6gR5LQLJfauBr18YfVPzKAr7qrbo8Y
         IqMw==
X-Forwarded-Encrypted: i=1; AJvYcCW2m003av877ml2vElCZLucNytywZIcAsNxe0N4LNrWkStUbhKhMCB4gnq1qgbaWlLAtjg1hmPQWmTsLV1w2lmg@lists.infradead.org
X-Gm-Message-State: AOJu0YwoTofCdGyOF0rCEj9dp9lgq3l3BjplATIpnl6731A6whTv9a95
	e9extJMSVl4S6qSm75iZsk+WqtKIr1gDCtNliS1VWgWTdKbov67JoKUksOMpBv5HFxvrBuxtPJ6
	7ec7w7fZ0njMlKDqLFNaZME6cXEgUzzSWbZwQ1624OFLsRPJroGd/hEvKb2egqcfBX70kXff4YU
	D+LQ==
X-Gm-Gg: AeBDiet9LKaCvy9jKHkhWMqvAdKSFwBz0oaKztr4Sq0Yn4Iy1vcu0W6SMbp8h23slME
	8vy1NRevbEV0XqZIXwytqG36gJ1DU5Zd0h5OCV5t/sO7I4TmGA9BscvZaQ8u4WY9xQ0PQeih6i2
	PNr9EdwRYNMRZ06ICbTEFuJg9aC0kJviTVor1WZefrjKHCjeAdCA33Q8GQ4ZeUkJq03Q+FQCjjg
	jjO4064yYUSHzFLp1p628wB5g5dRhMG8Gnf2/UYjsD4Jxxbx93nIcFTa0yKKczJVi6Bt9uQ4NQt
	4XlMSNcs0HA6s4iv2oEea31tVQ7zU08SLX9+7tQvNLDGp7R7izx49vJpOyGlZTRernTKsOA0HJo
	MsR4M+LvUS/9hX/89XmZ6GGU2hwwt4Ab+zxSsaeYDr+u5ctu9mw==
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708445ad.23.1775633814978;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708055ad.23.1775633814473;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2adc8c4ecsm46328265ad.5.2026.04.08.00.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Message-ID: <3dcd713f-dce6-401b-8c1b-194313ec5e05@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 13:06:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
 <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2OCBTYWx0ZWRfX/Q9V4RnLSw00
 T+/itIcKYo02Xw+RYHgQ8HNhVjSQdGKYaYhp8FmXwqT4X5J+yXppkjyTQr9gVfFoe7t44ajwkbP
 e53S/lPWZcNnhWEWHe1sXOHxyPekPbG///6BZe9mTGDD0VZT0fL/zWcn7Wa8DQsvfng04nPjcRQ
 taCTmyzlC8prE+bilwxWRfDVxEpnc6zvAscp0zFMpLKuHWj3L8lNFYWy8qUUla7WDTm9GN/7nTj
 ne734YSr4xiWTgnKZ3899KudLd+kKZ7A22rQrEh7HwW66twSnzr1ueDWdt8DbcGelezw7tT3ZLJ
 +nQQQQmRwDYFlaZWEkoICgF63yp4BZIg94t6FbF4WaJQe/MfB7WhzS4L6/MwfxTyZUxqzVLWiKv
 fxkAsrpOFBNiWzaX7vMsnzfn82V+5UjWD87dAkQxNc2goiHdhLCBVSCB23ZxMaoQG4Fp6/pZ7/K
 THPi2HGoSTEh+1O2rRw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d60597 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f9sTazImdp3HmuBAhI8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yvL4Q6iGVZT6MfycG28G82Gtj16qDNZ-
X-Proofpoint-GUID: yvL4Q6iGVZT6MfycG28G82Gtj16qDNZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_003657_686512_C47B4DC3 
X-CRM114-Status: GOOD (  13.65  )
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



On 4/7/2026 7:10 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add compatible string for Eliza video clock controller and the bindings
>> for Eliza Qualcomm SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>
> 
> Although I already suggested that this was not tested (and you never
> replied where did you test it), but I also checked and this fails checks
> - constraints are mismatched now.

I will update the bindings for videocc.

-- 
Thanks,
Taniya Das


