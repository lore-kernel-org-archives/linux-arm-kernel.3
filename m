Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FD2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CljCLWxC3VuOUrt1/JUd1oMX4O4FgjwPAOwwS6aA++M=; b=tMDIgt1luqqn198dM0GPi1eY3g
	dL0ZUUpNzue90XmS3mu6ExKOdFvcwb3TEurfxRP2Mw07j2eMSsww2B4xIFZkztI36sL3plVp2GOnk
	LdAJQQuCBkJh+7gg3iGECZsECJSt+AZts/7m98rIRq2amSlk6z6uZRhL2tUU33TH/SF3giOalVdV5
	4+boHLQMueFkdmcpALHRbcEZzDM2o/XAaCZH0vF6Sj7z+oVoyd1uSEOaiOdOhtmj7assUbhHrFgs6
	7d0FkdVOoREQYD0zZ2tqqDfaX9f0f8QhciuIPrugXaXf4+B018ytVIw83bKH5XvOqvC8DZc2SOcEn
	izztQlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueS-00000006pZZ-3UGL;
	Mon, 18 Aug 2025 07:51:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unu2C-00000006ldH-353R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 07:12:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMuriD012495
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CljCLWxC3VuOUrt1/JUd1oMX4O4FgjwPAOwwS6aA++M=; b=HlF2kawC+j703on/
	tH5fytuhbAfUDjBtj0KO0CikZ2/NCfa+q9or3wRHbgqp13aUjx+Ud6kQCPRUpzBO
	9IveNJ1Y3to6RGWVghPNpGt8tPAeuuq59leOkbMqbcgUSoizMqyGpSdN/m2+N4Cc
	PfIYK65uQFyrOFX7EK9R0juooZhyIWJfz/c2Qm1U//3dps9ujo+qxbg4ZVaIstRe
	5nEB1W2xB5Mz8iCUczH85RGtwmdNHb92adpboptyWY+xlpZxse6U4KTAuL3F+odZ
	v+oWNt/Pj1bxVUQyWXrVykC64EWHpok9icoe4hgh1WpptpVuht+EK1gcxEEJrUoY
	Zq9xAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnbxsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:11:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47173bb3daso3101119a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 00:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501055; x=1756105855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CljCLWxC3VuOUrt1/JUd1oMX4O4FgjwPAOwwS6aA++M=;
        b=lPRLPHEpBXh5PV+sqLJDuvVmKrxk6I1Jh72Ce/q0MXy0Oaz62CWmvhwr/NLy1lD+ne
         1+zVe6UO9IR1B5NutdXp8SMbaTM2c+0pg9BER47FNzULW1qhp59X2X4kGh57ALZhhHiL
         1ypYsZh3QmnymYuT5JaqjONHSj1dcmAxyqOGpv5IaD87mOVMetk36VP1dndUNUH05GS5
         IWCUXIIFpRQUGrS64mVDaCeFvswIzzm4To4rI2E0KTXMNdSeojEhexWOaM1GMgHzrjz7
         LD3cpJ4JJQoJAlqR+rvpvumu9xFCbFLu+p976NEDcvS2ZDY+gyusdWLwgw4AZ1Ywyj6j
         YViQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3P4YJOyPSJP70tWWYyCysrpqKnLwjDfsmuRl7ijli2/SwpCn3m80Dfw2h9MGjEFpzkL83ysoRJz0PuosvaCYl@lists.infradead.org
X-Gm-Message-State: AOJu0YwbjGKnfZTpY2OqgseYdb6pgZEkCTM2F4up1frB9JV6TyPPxU98
	B4o8WtUS3LrmoUuj3KLlcCQ0V4zTRPPtw3KxEmJIJSygDKI0CmfrS8pvbShUAohpZXeRjn5ZNwt
	/Bn67udNVa+sNfytMiWMVozLUm3IG/XR6lKkFvg13o4sUbptuPjZWX9e0vGCYs3r5CmMF0wu8DS
	KdFQ==
X-Gm-Gg: ASbGncuvdk26uGgtAg99zmsqCEW0PRFDPko9IN8ogsnQSdV/cFUBWI5CEr5yawDM/hx
	Wo8YvhVH0To2xMtAf/0l5smmOy6Qd3xCF0cG6ARwb0VOcwFvDwKo5NnDG6isIRA5CAXq4/lDQUQ
	YbLzY2jUwqfQQ0i16HzJpshLA481+A8BIYOaa7I09Hq+hqAhLE92vVQm7dxTv7z+adyChM4m7bo
	6JNbSdxg6GqVYzHL45QlHB34t6RofTxy4zigxuAUBgOhHVKpGkdeJvFd5Wh2vRcLMQ9zWqIdold
	c2IOQCVcGCQYN5POeO2u+3fXW6cTu/qYXLCOdi3OjU8GPhzRi/wzA4uN3rwQVNFRKg==
X-Received: by 2002:a17:903:b8e:b0:240:9dd8:219b with SMTP id d9443c01a7336-24478fd2a8emr122795215ad.49.1755501054579;
        Mon, 18 Aug 2025 00:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm7LsS8pR5b68tpo9G2VcNmUMBXY1NQ7esD+UdwLtswNRa5j63VuLnVBb7Rr2C4YZHwcX2Nw==
X-Received: by 2002:a17:903:b8e:b0:240:9dd8:219b with SMTP id d9443c01a7336-24478fd2a8emr122794915ad.49.1755501054124;
        Mon, 18 Aug 2025 00:10:54 -0700 (PDT)
Received: from [10.64.16.151] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54f8b9sm72276985ad.130.2025.08.18.00.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:10:53 -0700 (PDT)
Message-ID: <77067ec1-4f1f-45d1-8027-4c7a6f66ecff@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 15:10:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
 <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX4sTmNiFM12cB
 w7+O3sp6xcStSUjAVxKKt8IEYcimdMeU4otduv6zJCWI/NF79l7XaasL83d2hHT/JuUpA/ei48T
 Eg+5uufZJ/DEvgY09FKr26OuMW8wh6QOUlm1b8jVHPRkBD/V9l7pRWasPLOGB6awNiERSL21yur
 bOLNmOnBC5KGhk/5/Lt1bcL0VlneDDphLCCi/1AI8ffhmA8UUyBb11fNvJt1+aSSTNhUYcb7eUb
 G/Z0xzQ/OVnN/Hy6QxdLMLXHz35ZbH0efUirhUxL1kpPXOlSLMbrEJJPLLM1Z1cXInXUo1CNEj7
 wThGAVmt1XhuplcKvfFtJ5CIuALc3qA5lM05j7xCwWWL8YtS+xpJEQ2n9k1Hv0v4I0pmuykmSoj
 cTFgpSY6
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a2d23e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qthNqDW-ekIAEVpD3OwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xGO0yCH5hsoJH33haC7hqzKfzoQc8SsB
X-Proofpoint-ORIG-GUID: xGO0yCH5hsoJH33haC7hqzKfzoQc8SsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_001200_897833_81142356 
X-CRM114-Status: GOOD (  15.33  )
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



On 8/18/2025 2:33 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 06:41, Fange Zhang wrote:
>> Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
> 
> Qualcomm QCS615 Ride
> 
> You are changing defconfig for all platforms, it's not your personal or
> company defconfig.

Thank you for the feedback. Yes, The change is intended to support the 
Qualcomm QCS615 Ride platform, which is now upstream-ready and actively 
maintained.
I believe enabling it as a module ensures it's available without 
impacting other platforms. While it's not currently used directly in the 
kernel, having it built as a module allows flexibility for platforms 
like QCS615 that may require it in future use cases.

> 
>>
> 
> 
> Best regards,
> Krzysztof


