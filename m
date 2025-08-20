Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D7CA0EFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=; b=wBGLVB8yLVBLJW4mVwz1lrKtYg
	nKjyXfG1NjaTEWC2vTz3L3oW5eOtSUN4g7atdhwRCxrTr6JmUeFvUFKspBkdwVdWK9tF7ca2SIjOe
	dQBgL9bVqIZ4AuzLXMnl3tEco72Q4EhdvqK7apNSf6eWtYEqeNF8QQon25MpX1h3qb8M4u7C9mbcn
	78hlVkDA/4j/YyWee3/UekM/lczjfZBEl/fUwE6Y3iFV26nF/sUzNLb/YvKQPLFdjeWOBf0Bb4Elx
	xs9fY+CqXLQFLcDR/FTdZhp2VPyleolTMWesM4PRAh7be8A9AHoTUT4yqFSEecfDAb0OuKbH8c6n1
	yGe5h+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogbn-0000000DHQZ-1dnJ;
	Wed, 20 Aug 2025 11:03:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoedh-0000000CotM-0EjP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:57:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p3iX021262
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=; b=epGuVVM3UEI+lpZ/
	GC3Gd49RLBjAts2KljoWNXZv1cVr+p/JIiFOTIni5sidKUiq8KP1lK9EODITlCKG
	do4i2ykChgNg+ODHLRPgfw/2uxIGrXvNag/dnw8nYBPZuadkJTjWfKqS2dEimX90
	VRxYcJHdH05LPhJCJKGZO3UvNU1hSJuditpdj8qQ4KkvscAWFiu7us+ZcZXANkYR
	oz/G+N7ALaYxtAwMeJeLgaOiiCtCrS7HX5rVM8sqc0Ju79vTt55maIT7bY9nf4we
	UnO0zqkurPhJR05+67EV2d164UT/MeAXMSDTmXfLQXtwX6WQKJgaAL+ChW0EZFrk
	DMzOVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52912pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 08:57:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445820337cso68792475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755680267; x=1756285067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=;
        b=eev9i3S4ntIGRx9FkAS9KvU5o4gaxRFZ8PeXPlXvChqQC8MMujBZfHvcNIE1p+KSbq
         ZkvhD3t1MLlcNw55Fm83MQpqlauKkSMiNplSVRGSchTnzDjzecJB4zD4yEQSt4s3lgnI
         EAd8+CtA8S5E2cIbOxzyKxMT5uoKK6uoDHSlLY1kiWiGFiD8r4yFXeZjGke8KlCezrRv
         jH9hYRKxusY4IJi4hju4zHsoNfm+8OoqE4SUji/LkUa1CO5U5kpvcb2UbcCKrTm6G3KF
         DQDPKmqFE7rPSwIP2Wn7t1KKh6uLeoXOTFlQEedfQEQkcQhnZfA+UheXC7724urFAn0R
         qQnw==
X-Forwarded-Encrypted: i=1; AJvYcCWtMBhC9oRJezMnhnGAoQrwAaH+EVw7ak5e3zVNqMhad+sr9nHhZufs9ZO2k67x6dy6qCotZiKMpsVIhWRxOOaK@lists.infradead.org
X-Gm-Message-State: AOJu0YwZXpqy9yAq2tF0h60y8C9uszwD+qvW+U8qoqJe9kU9DN8xLyuX
	O5PFW03BJI49elOANmLS+goegCwrSFzddcXSkU3FoVAOXDSymcMZBWAsL1nMxfh/EjT0OqRif5T
	FRG2KhW+YTKKt8LQvu/XT2Sn4zJH6Fx3qEsvOe1gysIzyfnLGfA8tUf0j190VVXYSfl1I/O7q8v
	nsbA==
X-Gm-Gg: ASbGncsjUvs5LskjODw3Wc+Nq32nfsYODeAgixRi2kSr1AcK7OzMauJflYIv+dy8xmc
	5M4DI4zsilQGm3SHlTincUFoZdbTHDFETeJ9U1qsuYvtwOlw6Vq+or5sYfhThYmYUG0o9W7n67k
	iNFIQlPs0Dmar1dI+4KZCzaI/RtMpoO0AgR49z5OQ+rFMVqCYChNZZrFYBK5Pwk+cqWtrYdtgIJ
	0x1Fi7EzGeYE6c+A7uXfDTN3SUO21ojd/sZF7O24xCHTWp8oAUIF6lhXha2lvB4T+5GsYFDs+Ey
	QzYh8AWHfgf6GttyrIuzOd+9CgMNaze28rZVyq3lKhaee5Y2ahsgwShO2rck/iWGOQKZKcwm1UW
	jNjQ2dAZ/nqq42Cdf3k6wmjgv5iBsbIiz
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id d9443c01a7336-245ef1728ddmr29789965ad.24.1755680267102;
        Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5sQXiIDgpXrdgQJsAaziiWnOkOwfxl+Waxq3t4y+pSVqgHGK5588qw9DsrKpoU1yq0lXcog==
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id d9443c01a7336-245ef1728ddmr29789735ad.24.1755680266607;
        Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed379e92sm20242905ad.65.2025.08.20.01.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Message-ID: <b1eb2ed6-9743-465e-9b2e-75d5a06c1497@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:57:38 +0800
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
 <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
 <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YeFAsm9ye2l-cdJKs6BTmNq8R-jvDKO2
X-Proofpoint-ORIG-GUID: YeFAsm9ye2l-cdJKs6BTmNq8R-jvDKO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX30XlXyA/fUHl
 ZmekIhyuzaxOTB6t7a9bvQzQ3Tjiod674e8Bxd2MKfBU2ClPCjg5UBbdZrrxW1yy8jmi2AFLyPD
 93G6pCgO68J24CecuxpQf52TtHGD0Sn5wtpGP+RLIXMja6OVPYsaTd5nxkzbOgQN+jPhC5U0VQX
 e1h1A0nqcv5feJxX0fY3oAVkzsuV9GCt47DNfIw2m3wDnzRG/inYycVVw+kT2VkYHmJQjPx/jbb
 pRisAAFO1thArPsQYzhaCCXB7fwuYWgh0rAM9gMYB0iItvyxmtzV4K1iMwKThH1cPVY1shlzkNy
 UxCuBMbNqxznN7yHR9vkLSKxCn/+MrnN+V+zgmDWgx7eU84n1l9BCUT+BiCdf+Vy95yTT3lkQlf
 NETxUdOSryRmJomeADCqylI6YMhdqw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a58e0c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DOxB7AakEuovRElI8tQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_015749_095671_4FD7930C 
X-CRM114-Status: GOOD (  23.22  )
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



On 2025-08-19 17:08, Krzysztof Kozlowski wrote:
> On 19/08/2025 11:04, Yijie Yang wrote:
>>
>>
>> On 2025-08-19 15:15, Krzysztof Kozlowski wrote:
>>> On 19/08/2025 08:51, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
>>>>> On 19/08/2025 08:35, YijieYang wrote:
>>>>>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>>
>>>>>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>>>>>> functionality.
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Why do you mix up DTS and net-next patches? This only makes difficult to
>>>>> apply it, for no benefits.
>>>>
>>>> The DTS changes and driver code modifications work together to achieve a
>>>> single purpose, so I included them in one patch series. Should I
>>>> consider splitting them into two separate series?
>>> Of course yes. You are just making difficult to apply this. Patches are
>>> completely independent and even your internal guideline asks to NOT
>>> combine independent patches.
>>
>> The challenge with splitting this series lies in the fact that it
>> attempts to reverse the incorrect semantics of phy-mode in both the
>> driver code and the device tree. Selecting only part of the series would
>> break Ethernet functionality on both boards.
> 
> And where did you explain that? Anyway, you did not achieve your goal,
> because you broke the boards still.
> 
> Your patchset is not bisectable and does not follow standard submission
> guidelines. DTS is always independent, please read carefully the docs.

The approach I'm taking will inevitably make the series non-bisectable, 
but I'll clearly note this in the cover letter in the next revision.

> 
>>
>> As you can see, I’ve CC’d noautosel to prevent this issue. Given the
>> circumstances, I’m wondering if it would be acceptable to leave the
>> series as-is?
> 
> NAK. Sneaking DTS into net-next is not acceptable.

Okay, I’ll split this series in the next revision.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


