Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1826CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=; b=FfKXxCyZclG2SB3ltUhpX+G23H
	9iC4iL4NY4xlC988RpiMO+brkp9h278D8q+3Orv4ZCpiJOj30mYnOnVVnK9uurx6Si3lNTjnZx6j2
	8NAf40J9BRwQjAy3V/BqLBJsfbsnXNlnXavbxm5GGNXSq1+RMYNCXVKD2lukFHOaOVZ8KEbjKazcn
	doDDhVR/h+P2fHCHHNobnFzYhMxIC+SBmzwb+ol4DcTiozv2QG1tvRxyeWT/FhaicTdDJoPUVFTVd
	yOdyAOiwgGZZ5I3p/vPIw9eU6PvAc24hEcp6h6PR0AxiB/84Ltmtep6k6GrQOc6MlgHnagDFvSvj1
	lF1FAzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIoI-00000009zev-1izX;
	Tue, 19 Aug 2025 09:39:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIGQ-00000009t2j-0Wre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:04:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Z1Z029790
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=; b=nb05A76YpPiOGSz2
	vwKgyfBmE6HTLMxdi6KMSAwl+lCIrsM15BUf4wC5FcFazt++cmigwggE66ZVHZ+Z
	LII/VhS37canuQuPj57BEoCVcQtDCQRHJZa1bDvjE7RmxNwQuI0qOdLDNEouVx1W
	RXipSQsgCZ2tXrvtKmTPYVnzEQY10R31absN9NHWNQ4LNLFpHAHGlrwczdPAbeZK
	8CvgKPFlbbnMT31my/tqNor12JVqpfefFg4bdNMJ7bIVA2gjNFoaNn6ovC/0KrYy
	e3hZjWpl7xsh7UcxJcedHUcNRbJkRpLhqe2wYrcCxtTZakAiMefhOTSv3tC8E9Lk
	zG1gJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mftej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 09:04:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-323766e64d5so1499403a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594257; x=1756199057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=;
        b=Jc5JDsk2PEmcSXGBe/CWcmgq5N0JxvLVgGtWEcf41Pybr2n2kOk9uIW3JvBoTcORFs
         DWnrO3ONBbf1TQM9RYwgFtcaxfQ+p04H9uA7G1y4MB0imoCN2XTTlJeRPQFy1uIMYmuP
         UVaE6sGHaMcU7ODBqB3CznX0m3RZIkdyD1iYxAl0FXZgKYkrTyJhbKRd1Ihjv/IQC8OS
         gEmmiX+OBPBFQ6tILIIIpsey3HIAeNJbo994hRKGF15WjEKhk8FnKtzM0UaFm7E+NIl9
         9D2i/o7ITIlsLR76/S8Q04bcZrCL3DOou3vBqVvCKO9d9FW+VHmkiPNG5qVazzKkJvhj
         RHWw==
X-Forwarded-Encrypted: i=1; AJvYcCWgj2q4Cdj9P8bhaCdghVEU4wbKnE8e6ggv5O418uFCm9ijPL0Ampux0C2ye3m5JAJLCraFcAqVLB5f68pPhfjE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Lrh1Sh8MZ+k7pxwdso1FjcldIxxnzkXq2rUnKYadu/uEXU9E
	7AzNOtJUGT1CVUI7/aChWv6SFuBZT1v3yLg1wbgn2aEpYuTS5T0RiIFvuAEKFzit7+sKhmYd/CW
	7LIKHx3QKkBVUdnOpezpNnbppsxh3V7zUJqCMVh+wjAlLziaiw47pruHuiNCPAb5WyIHiZNj3kj
	Pr5g==
X-Gm-Gg: ASbGnctgjollJyWjAjqdpYaEaBbjGpw8P9gWC/m7qP12sZJVO2t34vQ6T8b8nBYJBaw
	XINQXLTZ4wGcnz0PlatUOTuCdZ6weHUVVGMz112jh9mDVN/guxMo/r50lhmYvkYQr37wWkeG39f
	cSA+eOr3XdFkuTv50pBb7c1u/+sg7d1fac+thc/uhm7o2LmWVrmJJ/GqPpyAYhrCQ0GDOlJQI+v
	guCO6PoHDVWL5vb2mEfcTnBzxY2xEzC/iopV+0LUlY3Aa/qUJlvt8FhbbDofXZyEWMbc+IuWC/M
	oF5eHoDgU/b8tUpUC5ZeN7QTKnWVoIIizWiP6AaX4fXigxjc1ZxHk9zDPw462X0HxCxzb8/Q1IC
	c7Iadh1teyGq2/hIAGNM8Jn3Ls0JdqTQC
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id d9443c01a7336-245e0f2775amr16133855ad.21.1755594256729;
        Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkh7QwrfpTpI4CY81hIJagXgTCB6D+xkbxXMTtgq4VmPlFbLxOxb5dFrnqC4gKaobuk82+qA==
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id d9443c01a7336-245e0f2775amr16133355ad.21.1755594256080;
        Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f8d0sm102888145ad.100.2025.08.19.02.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:04:15 -0700 (PDT)
Message-ID: <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:04:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
 <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
 <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a43e11 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WpKivvdH6quKUe0GCQ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 99gCIYWGlRdKvmLxoVJKM9-1gNOR4xN7
X-Proofpoint-GUID: 99gCIYWGlRdKvmLxoVJKM9-1gNOR4xN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfXwCilkWuYA9r4
 xxnSkNTJIgraRGJeJqc0A1blRcVqnEqQ/Fs+rIeBRCSsTlUjySB8ay3hoN51C1DpkmFHewQrfPt
 iIlRrpw5ePAmR08TcUpzX7vtDwmebEcuUIc+bi3qLN9diW6fWgRUqdqv2zQuelJvMJvuQwY+vUN
 pvFwo50QbQ0P3wQkDjXa+c07NQEW63kJVSAU05hUOabNK0WbOdTeC9KC5o/QRH5DMzuiUqSXR6e
 5V85yMbq5alp5FUWt9bFHG4w5k9Pc2sj526ffgvG9fDtJmJ3R/QdFflWDLJoQJh1j8Ach9hHQLT
 idvXFBEJiM3yqxNeAib6DN7AHSYumGva4cEjjyVjDiB/TmG20B/+qDbzoQofd/AwobjFF7vaBkR
 yomPYY0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020418_232085_0CF56BC8 
X-CRM114-Status: GOOD (  18.43  )
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



On 2025-08-19 15:15, Krzysztof Kozlowski wrote:
> On 19/08/2025 08:51, Yijie Yang wrote:
>>
>>
>> On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
>>> On 19/08/2025 08:35, YijieYang wrote:
>>>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>
>>>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>>>> functionality.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>
>>>
>>> Why do you mix up DTS and net-next patches? This only makes difficult to
>>> apply it, for no benefits.
>>
>> The DTS changes and driver code modifications work together to achieve a
>> single purpose, so I included them in one patch series. Should I
>> consider splitting them into two separate series?
> Of course yes. You are just making difficult to apply this. Patches are
> completely independent and even your internal guideline asks to NOT
> combine independent patches.

The challenge with splitting this series lies in the fact that it 
attempts to reverse the incorrect semantics of phy-mode in both the 
driver code and the device tree. Selecting only part of the series would 
break Ethernet functionality on both boards.

As you can see, I’ve CC’d noautosel to prevent this issue. Given the 
circumstances, I’m wondering if it would be acceptable to leave the 
series as-is?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


