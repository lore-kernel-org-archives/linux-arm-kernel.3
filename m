Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE3CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=; b=KsEdaTPcSjVMY+u4LpwVyMc1b2
	XbiMtnAo6rFa3jI01MCwJMysvhpRO01sBknJcLyakudWY+P+ZjHHoXv3wB/VvsPZ7iNAhxR0irz4D
	kgpCLSWMA2YFRB08ZB+3PBINk01+Rdrz+Jr3axCO0XOF0Kh+N9GbDMr8wAOSM8f5bCeVmMGZiNcGS
	s+SnekrcYb7bRVC0bQhe4pbMW2CYnYleTsedCW57Dkyi/cfWhEPex9HaLSw1oPKPnDK95uFlshN5q
	z5SNvV9knScHjBX9rwsFXz6vypF+P561WKeaRkejeDhl0a9WhiB7E/gHmYe0OY1bR1QqBQ9do/D/6
	vsBFSFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqql-00000008DHx-1oY1;
	Fri, 15 May 2026 11:37:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqqj-00000008DH4-09RG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:37:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5U6aW4008246
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=; b=i0G1w3iiGt+l1TH3
	oYS90XLBaq84xhdxf3DYyTEdRej8PWnKPfut5Bd5uhKdnuLLJXBpmMXtBgLYijYg
	rGPMrcCzzn0KybjeARKrWT5M1dVXX+0S6Pt0xjXr4XJrAn5TIWZQAOoGzY3nKYKZ
	30OqePFCjBec2SkYBtiRXR0EBoyXlU10P+JNqvEEJkB/5xQaZuBXvMwRaTmfwF81
	7Cd2SyHEsn6tTQcjePIQBuxP7aTuSoMYVBA8o2Wk9oyCaMUFyytNrDVq1UkYdtcj
	3wMdvXsTHL1hUPgckIttp7PVgvKo4EHqshxLpNaTPkCvLxtfM8iDqJP2zJ5X0v7I
	7sj8AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su36e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:36:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90e0eae822dso81090885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845019; x=1779449819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=;
        b=bJxtczV6aFI6koJ97ht3V2H0QrQT/MUc0gnx2jNuVRZF69E6zbE7ErCUPtom406DRl
         UhMS0ZYsRDg/OK8RA7r7TdcbBm/pqgIyIZqICastbIo0MoFi3XbuImdBOFl5jURFIuY7
         3EEI7XzSh674+pKc6/PEFQijGTHkkErIKGH4PYaafFA2ICzzjC2J5iqeVYma0d9hNk6I
         dSd0GwKQ455LBX+no7jVmTRSxQ4bMpiOZREG7wQJMUxRj+AJRMlMeovnIaS672XtAJOC
         s2iLTfh8zWeivZri3qrQMoYMiWw9wh1K4qPfQTBuQ81WUauJrBWb+LyHrSSD+p6BJsxh
         d1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845019; x=1779449819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM/NbFmiLEWAvYr+8+d3jB+4yBVCuFLqojVlv8UBMsM=;
        b=agVXl3VsKy2b++OpUrOrM0V4eMKyXEVOx5uS7Z2bnzcnbGfANR9mHu8qEg7dWmwYZ6
         e6qdlekSfPsOJEnoX1DtAfy2GGIoLlSrb9Vv+4TQK/lLy1XWoqvGargJN4DXQkpyb1DN
         VSVb4y78asB3FMljjmBWou3Lun0TUFhQT9UHLwkiDfiXH3tGOFvPYsVeRMAm0PP+oZnd
         21mL5BnsjzjKH13H+OiGhkQZDC4KImmoc1tdXqc+FPevoblB4ogK4LX8SPqS5Kl9TN7d
         V/G+BuoICwZdWMH6fvl5njzGjwFrLHDYBXfbjetg7KNVjXtyfUK0JWaCyC8Y8dJsTC7x
         /aug==
X-Forwarded-Encrypted: i=1; AFNElJ9g479KIYM1lrkSEkYGCOHLTRbhAQB8UK4aZjxBIPLLUKN7SyNs/45tGkiB7dJfQZ0Z8hqYu49dPt0oBnv/L6bA@lists.infradead.org
X-Gm-Message-State: AOJu0YwXXYWROAVSQJBFdPYa0Ke88/xVD7EK4NMpWZmrzpQamLe3FwOm
	35r79a5P99zb4auManDQOsySLnYzPWPO1T7Iq9UuHarq5jECqYnBbLrW44C3WlVcCsE1kIa5wZO
	ju8v3ZNEcl//GK7rFNKoOiIOKiOAxRlut76Ly1m5pOYzwI+hsLGHdI9pDRHpMMRQoNHhUoEkqTE
	hEgg==
X-Gm-Gg: Acq92OHMts33iJVz9owF9xvm9rSk1dQTCAmpMU68A3qBDCZcW7mGIY4Nr4sjEWec+i9
	PzL0P6gqFdT7uvFSlTTebJApUFGUShKFY8ZgyNBETOkDUIu9yrbGoxHCU7J+EiL0DZ8oBBs0l+o
	lvik27vAU2OPLjo6s8cnnbx72arecpZ8Mhfb8djFsBZbXX+O4eOS9JtZpms/WM1bwHmoKnoRZhW
	f5dYkigSrdguXC22b6qaUShkdlbrGux/8A1FjgLH/VgPPtzMBQh+M/YCf30LyrXxTsyqVEmZa1I
	/8AYOeWvfnHYlRF+smW2nbTW6bYvGvn/eAyLhhEISCEhWtEQa0EPtAgnFg4KbSz85iKPo9LASay
	lg8dWiMiue9BdopYsZBQNTxceX59206hJtCZFoZ1DnRl1ih6i+RBju9sZ98Zi66TCNUP/BKQfC8
	2DD3J9CBJgtml7jg==
X-Received: by 2002:a05:620a:408d:b0:8cf:d953:b4ec with SMTP id af79cd13be357-911cfbd4627mr364063685a.3.1778845019129;
        Fri, 15 May 2026 04:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8cf:d953:b4ec with SMTP id af79cd13be357-911cfbd4627mr364060585a.3.1778845018636;
        Fri, 15 May 2026 04:36:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm1821078a12.22.2026.05.15.04.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:36:57 -0700 (PDT)
Message-ID: <3552d1bb-5d65-4036-8768-39fbfbadb046@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
 <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
 <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bf37cdd6-b863-4e59-9459-3247080955a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K_b5ClWJGz437t2g1ZMRjq0rpFcnc0M5
X-Proofpoint-GUID: K_b5ClWJGz437t2g1ZMRjq0rpFcnc0M5
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a07055b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x6jRW_0nKRSPf4FljCEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfXxRCCBQQUYb58
 OssXYCbCLErZUcv/Fj3avwSggudbtCXiyTTFypX54f4qVV2SdoYhjRqZCzN3arkPfQ6eTmG+QkS
 jlsVtJEZtzg8wUYKlQiOcNofmfHz/zOMTcxTHeOb2enaVAwRf/UZyThF14JfEQNBx1PyNQansM0
 +RxbUr/EhAwfPmSAn4Er2/PLmOL1OFofjnSYB+g4pcuUZmFrSAUavNXeIf3CPkIKvKjHUmUxFSG
 UvQPKFwlHHqoR8PAZp3oG+pBXQ2Uldb3NKl0Kk2WHKqz2qRhhzv9c5RkDEmb/JOaq35IHnGr+Ch
 DFHetmsxV7OGxQ3w0rMu78hHVJBZOXX9Jj6me5ZGhHOpxT1N5gzMUHVAHrrzex4LkY5/LC64FDa
 8LQP5Wr3hbzFfj6MJvqM6YLNQYJAp5sQQ5j2mAaUO6htNyFrenCMaZg2j4r8IqJikiuM+ij42+7
 ivktskhCvtNa1OKAaOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_043701_206298_D0664A57 
X-CRM114-Status: GOOD (  17.54  )
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

On 4/29/26 6:10 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:06, Konrad Dybcio wrote:
>> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>>> The drivers for Qualcomm SoC components are covering a basic or
>>> fundamental SoC blocks.  Usually they are required for booting or to
>>> achieve basic expected functionality when running Linux.  These drivers
>>> do not represent any sort of buses visible to the board
>>> designers/configurators, thus they should be always enabled, regardless
>>> how SoC is used in the final board.
>>>
>>> Kernel configuration should not ask users choice of drivers when that
>>> choice is obvious and known to the developers that answer should be
>>> 'yes' or 'module'.
>>>
>>> Switch most of the Qualcomm SoC drivers to a default 'yes' or
>>> 'module' for ARCH_QCOM, to match existing defconfig usage.
>>>
>>> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
>>> multi_v7_defconfig.
>>>
>>> The change will however enable by default all drivers for arm or arm64
>>> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
>>> logical: if one selects ARCH_QCOM then probably by default wants to
>>> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
>>> be used for booting.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Please also add:
>>
>> QCOM_RMTFS_MEM (required for modem)
> 
> It's in the patch.
> 
>> QCOM_SPM (cpufreq-adjacent on some platforms)
> 
> I assume only for arm, because none of arm64 compatibles are present in
> upstream DTS.

There will be a couple arm64 ones too, but due to their age they're on the
back burner.. Whenever Dmitry can get some time for the museum pieces

Konrad

