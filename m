Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B508FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=; b=zd1Qq1ryH4ZeGutvoR1Tz83kVE
	zAJfh1RttfbD2xIM2+W76/PpPuw9oNaDRZby+KWxBh0pVHnQaTyF6suzOrEweau83FaqWeIhD0zua
	Njm8VuDYtaqXpcUidxQMA7MsA6ZWh4mBHEADxWV1MTaPbcCCXjF0pfDOsjTil5sv1MRC2GbXVJVtj
	DQmzzN5wXFBlaV344CVDcTdvBMVkJAP1FT1bHgTSQ6UDbvSbG7WFQMV23zc3u7U1QbGAx4SErWA48
	xtOrHMUqRpvj0RHGg34ZP2a6z83s5s9TKray/2GFI+c6cDLWTBeodtU0o91vGHkKFfJdkruoA3Tpc
	q0plmYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7VC-00000003tc8-10uQ;
	Wed, 29 Apr 2026 16:11:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7V9-00000003tb7-2i7w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:11:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEjioP1641624
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 16:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=; b=Y31XWIluZdt38gEC
	Coizspg0MgFLj5kS38Ql4+JehnWcwk4+KG5j178MJdiWZRWHZLcM6Xll5EcW+arT
	AC6Dnmk+bgLQGK83gLPOchJpKa95saym6NnlkpFhgTuWJY5ax2eIPxcBco0YLpQx
	s/rw8M35nQn6WQq8pnmzGk7aujzNiOWYzrWHO5y2OC4kKqh6WsfHb9mtqJ7qZby9
	78LeeJxiAXA5xqig0ozHFA4BpXMOrFr4cztGu6TGEbe/SF3JNYl951fKYznasHIl
	T+fLRcuUx3k7O+8zWiMuEqARAgQ+XMSmMGV1eFs+dLuypwGHFQmkzHwfwBx8FlNu
	a9lRqA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82cua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 16:11:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479d900d222so17956968b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479062; x=1778083862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=;
        b=YKEqdzZYq8PY+DRnkFkw0k/fmrPeMIpxkX1Wq18fSN6USI1oZ5jyiPJaW8E4PqUzp2
         5WEAbSIZawaPRg3up4qbfBN/gqakCxB2u7casyGmOK4evIueJEpsAhuQBwj1qlFt8yVV
         J0oWPc4A3SoF9hIpNVMGWGR5Qxf38g2iH0lBoyeC6bKZ5eeqTaRj/ySc9c0dzCXWKVDs
         a+I2dduFEo+oZ7Ask10ogh23eWcSjGKA6hHuNbQ2dWzjfM+4qUstTYNxoZykSM6E0ppM
         FMV4Yu/bAiKau0VwJnsJ6PIhsRPa1MtkLTkaZlwB02xe2JUNV6gAybQpGqoZIYYOsqDN
         qx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479062; x=1778083862;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY9x3mxSjUPzImVqBR5MCsdTNqZKqCBeloJrD79EG8k=;
        b=C9bC5G8HwfAz9Q4+Cw8adghAB6hFE8rueV/TqvO/lHW/zSzZQ5Pw4GqU4UNvvclNew
         X+XdyUr/SbLWUIUFvzVEkiTtANX2hxK0nMuI9rZ8ggxkI5ut/T0i6WdErJ4dV/kY6/lx
         eit14XBhn2e5VVTUTnf5B9TmkW3hHgIg6HkubCu8bX1vB1w3OcBKyotiDxdricGphxRJ
         aCvD+D7U3yhLP8F4jR3unCNmD3zWdnDCX/m+Y/MQoJLVp73p7486RDpDAtGLQd+/+pTZ
         RpDOvmed1A8SQl2BAqe6vqttmugVvkOH1pyJjSUcklgn1/hr1PWnVxtdv0vAilthkAWN
         CDug==
X-Forwarded-Encrypted: i=1; AFNElJ9AznJZWPhyCj59Y3a11I6a9+wwE7EGwuQSEJjWuYtvsjz2zNjGTf1jAUbc3BlquJ26mnxCBKX4A53/YXEBZ3mX@lists.infradead.org
X-Gm-Message-State: AOJu0YyytcwxHWHIUDqnrq/V1CrUfe8WHTrGxkaSSDJNEOMJkVLvlM14
	lfAgLVSx/D8fcgkd4MXhb2rclr1BC+sG7QFLsNDzU2qitRTgwxCaAA8YYcYQqTGIzq6OdLiabCd
	vIFutv0cIVuoSJikBaUK1EWrP+kZDkMb80fH1x0Fh0RSY5DaZTR0Yv0nvFNunDBtqbaTUAR1Cmn
	CMbg==
X-Gm-Gg: AeBDiet25Zintox6bpBn3kinNtd/TCCiSSMrU+i4Wn29HMbON/RmQAcupBoBc7Qbf8k
	I7npE0M/ppR8APUQjEjTzYLFWk0YZo06GKPlEavlgPt7SU72tcNcoOWoanIQT+AdsCf8WTxb2+9
	1aFdzDdY45319xfTrKqNTv5m6+K6ZGzc4DAsFlRWU5ej3rhfPISo374l1C7HsYQq6wEzH0Zx+e+
	opBE4fuA0Gfg7PRwHbXONRmLGwhkOTmoBBCmkJAT6sQeyw6iVhaGTeZiYzkPnUwxDbl/OuT8tkM
	nc29knNmvqj4hK9f5xIQYveJsB6M/Fxn7PUNvhOilpqHLJMqLk92iKaR/jn/nCJOtLnCspg9YzK
	rbZp8RUWXRTnB4KxqwSojcoEuIgCTXBfWnxli3Fq+mGtlQ/oS5X0i1wgAfII=
X-Received: by 2002:a05:6808:c291:b0:467:112e:4590 with SMTP id 5614622812f47-47c29070abamr3945716b6e.46.1777479061815;
        Wed, 29 Apr 2026 09:11:01 -0700 (PDT)
X-Received: by 2002:a05:6808:c291:b0:467:112e:4590 with SMTP id 5614622812f47-47c29070abamr3945700b6e.46.1777479061311;
        Wed, 29 Apr 2026 09:11:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm6696228f8f.20.2026.04.29.09.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:11:00 -0700 (PDT)
Message-ID: <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
 <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EFUNsV5vMYw0h2IY2w0Zm0QStrkmT4Il
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22d96 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4qRup2qeAZOX9EWCK_8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: EFUNsV5vMYw0h2IY2w0Zm0QStrkmT4Il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX7+ZDtWQKqxnf
 9dR3QTWITd5V2DNmnc5RgtfQbSRZtC3xB8U/L08CvHlloeZ4Tvq6/7BGhVBBkLEFRHnrh90tido
 D2KsTvI223hflntFiUI7HxpC8TCXOEGNmlznn5tgtQnUWfmliVkKjVQvssh3Q2yOv/e/evpDG7o
 C6HXSD3xoYA3Z4V/QtIcJh3Qm/vRKdSZCBPCJjI74T/nD1QbxVoAKOTqzOCUsL9GEui5lEBp5dv
 R+m6xIeTSGI19baSrUz6VZRLBA4yV+/fN+d51rIQLC7JcXZxXX2cTxGD7IMieIBTLRlesNJaD9t
 ELOj8WFVJ0ayWaJWipGpQT8fyTJePX9ZAscCeIGJsGysMqXFA08e0E40Lovk04WoSEkulbG2wfr
 Eh8ckVPE8yidrOaSXd/ifgz4LzyMYJq2wcb22hrsLt5dJW5acHZFGgCPZKny4pRPwGQc0xfipx5
 oVmNE+rTssDMv950x6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_091103_808281_9BC99D74 
X-CRM114-Status: GOOD (  18.84  )
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

On 29/04/2026 11:06, Konrad Dybcio wrote:
> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>> The drivers for Qualcomm SoC components are covering a basic or
>> fundamental SoC blocks.  Usually they are required for booting or to
>> achieve basic expected functionality when running Linux.  These drivers
>> do not represent any sort of buses visible to the board
>> designers/configurators, thus they should be always enabled, regardless
>> how SoC is used in the final board.
>>
>> Kernel configuration should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
>>
>> Switch most of the Qualcomm SoC drivers to a default 'yes' or
>> 'module' for ARCH_QCOM, to match existing defconfig usage.
>>
>> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
>> multi_v7_defconfig.
>>
>> The change will however enable by default all drivers for arm or arm64
>> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
>> logical: if one selects ARCH_QCOM then probably by default wants to
>> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
>> be used for booting.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Please also add:
> 
> QCOM_RMTFS_MEM (required for modem)

It's in the patch.

> QCOM_SPM (cpufreq-adjacent on some platforms)

I assume only for arm, because none of arm64 compatibles are present in
upstream DTS.

> 
> Konrad


Best regards,
Krzysztof

