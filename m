Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EACC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM0LxhWS7WoqwNfrt1DjXdDre6/96mPxCXdCCzvVj2c=; b=G6OSCOPrlq/YNCuYEYOysuC6dB
	FJFzeJRRJtcUOPkpm40nQd0ETlhmR2EFmThHMRXDz/5VUask310VhLSzlk/WYRismWgYWGRBsfUpZ
	yNk00Ppt096frRZJN2Io8EiFv0fmGFjSLGb8iSRwzHl2HjOaDy02zTbn7EZwJCvqRYgk98glIwryK
	wCjiobpo2rX5s0fkPzyfq+W3YLP0V4T5N+07DFmn3X70lc6qlGBgR6zly4E6NIqqH5hKgU5tb64cS
	lMdbrgOibBl1T58iv/5SOUxU3EuSzOnW6vivt89qN3kqJj22dMG4OcXGJJ+Tdr0lpNSikXrNJsVVL
	8iYIvsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGMJK-000000067b6-3YSh;
	Sat, 17 May 2025 18:31:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGMHJ-000000067RL-2Fao
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 18:28:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HHkXQP003697
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WM0LxhWS7WoqwNfrt1DjXdDre6/96mPxCXdCCzvVj2c=; b=kUJ+dPzmPOUT1H2e
	4f3vdsTGtRsnkKqfAHQaVG6C4ia/O5UBXNhiKnvDXpWPJLOE8wn8fa8CHIPZQQxb
	fSI67sTTSEaWrXxCWefbK1Cx3sgo2vf5h4aT+tK3DdS2hSl459bt6NoowRStl2+b
	/h2tFib9F1xUpRbecSDNtJpNpCUDXjMtC6LvdcMwddbid/XMZE3ryN1bXKF8HJAU
	C5bG4XIDWLKhxV/J4eLeKfo2EgtcPupxMzNHPFEHE+10FNbRR26YKUPbLUwRsLcE
	Q0X3KOx3wUnNrDx9uYI7E4pzVzYbDZH2+iCSlw8sZdOTnae8wA8gvgD4dXGDq10U
	yg4NaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyh0pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 18:28:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso83004085a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 11:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747506533; x=1748111333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WM0LxhWS7WoqwNfrt1DjXdDre6/96mPxCXdCCzvVj2c=;
        b=kwSdJxleVTQGMtO562ehEpTb0FEjgHytbfzvXdK3KjFudXBuOEoNjgIo7dUU6Bi8Pk
         /2Rpl3JBDvkGmH5NLQwlIu4n93RvCsvC42z+cN07aph+mB2Sr8Q66VYkhxD5H7ksrNLs
         kC8F14Hq5Xhjpg0u8J1dGh+Cm9vRR5+0TY+HgZqmN7QktVa/SCK9kKjY2qrv0xxGRy7I
         HP6/RGOpRbZD5YP+BPykX2NxIJEryU4UpAk3pAls54qEQ19H7AqxtCurglONIThG0yEf
         wL5fT+xnjRbe91lbvvrKPiSoojUXEK8+PwZbUwfCYsmFOYT0FcIWZBTqJ2cLM0gyVOSg
         u59w==
X-Forwarded-Encrypted: i=1; AJvYcCUEhT2i8N0qJTl6xhTd3B4iH99kGYZsVbxv1ykjnLg0HEG8PirE8M/sOwEiprFmMxVV9huYfGm+7itC8o9z5UgW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gNm1BLbholzfyhfg7NrzMmK2DAq0FDt+aqrz+baGKR9eg5bl
	YQkguAQcVTwh6+VAiq6cINJL6O/i475nEaGdFtA+CHuvPSsbjeGzCJ2KklEv3uoDMN221X0ARNV
	PRNJBiftgcts7wGKOgSuq7+y3kwQgI4zusVu1qFEulZHkKEyFXptVuma0bwDKEgna58ybEtkjd1
	SLgg==
X-Gm-Gg: ASbGncvuwfBAMCgqjxqTt8+8mQ4fiKbWmjMHUWb9PsVf4TZie8ueha1eK3QBc2BjUq5
	mHog9tqN3z/MVA9cFPyzKByeKzu51kk92W09uYUU917elcPS+ze5XFvAKd9pbnmLkduXNV3uKcp
	sOb9bonqpPLgGmCgxwtBfzpH0BwEZrs1Kr5Lf1W7VZ9B0hvSpKC1BW+1GXfGCEprcMbiIRPtBQu
	CMzSk8AKU5+8PR7xD9K5zc7q5WmOP7hsBuBgy40JTAQoigf022ks+G1hjeUbaEPr2H/7NvAJW8k
	76gN19gO7bj4+hJTNmNn3YeNk8WvFJPX+o8lbCLqDBOAMY1h/J+KHSbn9HJwlo2Mcw==
X-Received: by 2002:ac8:5acd:0:b0:494:acf4:9572 with SMTP id d75a77b69052e-494ae232bd8mr46453681cf.0.1747506533380;
        Sat, 17 May 2025 11:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlFqFfxfLYXFiiljRHIXrnkNmpSimkZBjJ/iFwPezDkWXAt4BzxdvbnuBYSABObtqzWL8Xw==
X-Received: by 2002:ac8:5acd:0:b0:494:acf4:9572 with SMTP id d75a77b69052e-494ae232bd8mr46453431cf.0.1747506532951;
        Sat, 17 May 2025 11:28:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4c516dsm325677666b.154.2025.05.17.11.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 11:28:52 -0700 (PDT)
Message-ID: <6fa4959c-d733-4d50-904f-caf933e02da9@oss.qualcomm.com>
Date: Sat, 17 May 2025 20:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman> <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE4MyBTYWx0ZWRfX4MXwyPUGbL1S
 SuANxWWQ8+e0KX/jMUjSwDxpwEcWLo3tj9Ar2hIKmfF3v1dkLqWM3/cY2aNK11jQvlsyfuc8kon
 8JPreYjQazhq6bkjm24P/Lb4nWwKNYarX49Z1g8D/LXIuSUo4rLhTVXKlajmUVbQK5sWV2J43A7
 Sg1VEM91wqAyRkqMJ6IcxxNCFkpXBokNBAsCxM1jDRD1s9uxjJDhqZnGoKHaFTzVkiylRvdJ+f8
 GTsoDVyiOd++ZViJvp/rzBiF82MP/2aN/WFz4adcGQMXafb3LjfEJzDck85T1bD2LPmmb56h4qT
 1SFco8/q5EfmGHe0wyKkdm8hJ7eOLLsmJ0kcHVQ8iYBbzsffe5EQ9UrS0YmUgJBcxoTdaAQzl8w
 jhOjt/m7KM7A2tiW2d26i1myZ645okqiuLQVKJ5Iqdh8fKavQXUbLVHK3EMbwF6RPc0FxTU9
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6828d568 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=jJrOw3FHAAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=VM-KvOk4zruIL__GPFMA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: z6yhSvmPoXOqSxr3oN26dB3DFfclVsqM
X-Proofpoint-ORIG-GUID: z6yhSvmPoXOqSxr3oN26dB3DFfclVsqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_112857_686690_DED74831 
X-CRM114-Status: GOOD (  19.96  )
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

On 5/14/25 8:24 PM, Wesley Cheng wrote:
> Hi Vinod,
> 
> On 5/14/2025 1:33 AM, Vinod Koul wrote:
>> On 16-04-25, 15:45, Wesley Cheng wrote:
>>> Hi Vinod,
>>>
>>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>>
>>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>>> +					const u32 mask, u32 val)
>>>>> +{
>>>>> +	u32 write_val;
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	tmp = readl_relaxed(base + offset);
>>>>> +	tmp &= ~mask;
>>>>> +	write_val = tmp | val;
>>>>> +
>>>>> +	writel_relaxed(write_val, base + offset);
>>>>> +
>>>>> +	tmp = readl_relaxed(base + offset);
>>>>
>>>> Why are you using _relaxed version here?
>>>>
>>>
>>> No particular reason.  I think someone pointed this out previously, and I
>>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>>> non-relaxed apis comes down to preference in this case.
>>
>> Nope you cant! There _needs_ to be a specific reasons!
>> When you are doing read, modify, write, it is very important to know the
>> right version to use...
>>
> 
> I mean, its a write readback, which ensures the bus transaction is complete
> based on [1], hence why **in this situation** it is up to preference.
> 
> Otherwise, w/o the readback then we'd need to ensure writes are made
> depending on the required sequencing (in spots where the sequence is
> strictly defined), and that can be enforced using barriers.  If you feel
> like using the non-relaxed variant is preferred let me know.  I can replace
> it and remove the readback.

Readback is stronger on arm64, as otherwise the writes may be buffered and
not observable at the other endpoint even though the instruction has been
issued, even if a barrier has been issued

Some resources:

https://youtu.be/i6DayghhA8Q
https://lore.kernel.org/linux-arm-msm/20240618153419.GC2354@willie-the-truck/
https://developer.arm.com/documentation/ddi0487/latest sec B2.6.9

There's been a real bug observed (pun not intended):
Commit 2f8cf2c3f3e3 ("clk: qcom: reset: Ensure write completion on reset de/assertion")

Konrad

