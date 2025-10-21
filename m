Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA81CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2skBs5S1G3c3DMDi/JRL2JH47cdtT7pHnFkN2gye1FQ=; b=tjqFLS+MpR68U4VCQpYO25sAVi
	czMXikeOyLuL6ym73GRqVSjtoc3Omj1G6/P93V+wvtcY8jvxgKbDRSy8x6SmHKx4RqIVXySQAGT04
	ZiXcUILCqYIXxnq32iRGgRmQfftsoQa971w/5PyHE2Qp2MqNK/S+4m55xtE4b5eWZhiuD9E4n9vuw
	lca03BGT3QLEu+Gk9+9MGDmTlJQz8A7gsJwAa5SGECSUsMHpxzPz5QR0ihAD+hadYrCfs9W0VY3Nf
	N+jLr/Sp+BnFkJa5rBcYxIexnkfBwmTBb3Mrj5zBXJUPvpyB52RGWu9xRogE6cS20ZnIWzDWOGOBr
	PQB2VqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Q8-0000000GPQ1-2wcL;
	Tue, 21 Oct 2025 09:12:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Q6-0000000GPO0-1l2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:12:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8MOUx020184
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2skBs5S1G3c3DMDi/JRL2JH47cdtT7pHnFkN2gye1FQ=; b=k+L15qAjXWAOVR/F
	+hM/s39H1EXnOyhMaOdekvGa0kpiCv5bgqxMXqhzEDB/Ke6/Os9ltLy1GiifcsvY
	fuYCv0bZiUCfG9WQEX2ZX4hZFHI2taa3rABtGOkLWKNxLp+uhd+j6ptfPYZdAk9c
	rk6uEyFpfCAvQl55O/QOJpmMELYnvDy2/IEsZP5ig9rhKBSySxRpBAvZM2Ua/BHk
	R8sAwc68LNmHO0HfCqZg8HpHyw6zCCooSw9xdyedo8Mx2OTaNTJp22mWl2HpCRo4
	LmydbWBL/TOfLV28upWjgjU9wu1Saj9qAdgF5tqUT8PQ8OyiCxn30MzkwpOjlwqv
	RayY2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344045w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:12:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2909a67aed4so46860815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037950; x=1761642750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2skBs5S1G3c3DMDi/JRL2JH47cdtT7pHnFkN2gye1FQ=;
        b=UVOQsdxg0/KGl0VlN2Vnks78M/9X1OySROBbWDfhL+xjG21fJ9K1W2zLHswQunbuVn
         1ic+vneZjARPUF1YptuKpJtrmdnF7+SebZXbr56eTye9Z3NN9bXae6FNF5tVnPJ9m1Wh
         Zv2xRBn74ATxenTbShTqD+tBsGXO/gR/mREB/H1sHaUxt0n3icT8cfo9eR57IeaRNuHY
         7yLgyExETRGU5EdWzGU1SLTaTEUbLrBvLBF7dDo1MqVxqrbgpnACg9XIjijFTXO5QEzA
         soqJLVZDP47GuYoboC+LSKL7RXuV1C0+PMymTJ/x+UC51FNTkl/dH9DL6lOWGpDM//Lj
         Omyw==
X-Forwarded-Encrypted: i=1; AJvYcCUiS8/dwbGtALasFu3eJD8+v/R5HsS1ScIpZUfOmS0j9WFyfOys0E2rMSdNSFT1f0hBPhltObQpKmJr8nNZsLCG@lists.infradead.org
X-Gm-Message-State: AOJu0YxQILHu4uFBSzpvx9tXqPsetrU3TIKlaXSQzrh4vQ1PPRE/Hpua
	Q/YgrB/90apd/IEXCKLXd3Fqak+HLb92ROFvkafdUoraIgFWpgEzUoP1ItomVxWadFJWROZhctF
	RaGd2WinLQbIdEoopyxiNeK+ug90ZhBkdOgfQ9u9qDRkkjUdiNNeerbg7SeeOaO4tm2d9RCDtd/
	McHw==
X-Gm-Gg: ASbGnctEDzisOAFpqBhhA6Uim4qSbmzAW8hJpoewG/Xq4IPHy5y0WKM8IptvR23X+ia
	7pYjzLsYCmz83oG6SiVWZcy5WV0cSwaLufKbSnf8fEQbFdySsdZw6t+vRolv8z/W1kvSu8sn6kL
	3unHXhjw43BsuYbsTcnIW/UXRgBBwBL615G4zFsM7sTF52JxwbgSwaMrX/HJNchcVtZhdPsbbwR
	0FAGWMtFmx6U1F3G7d61Wr3KIE2JV5sB7oCkAZn7NmvYH3iKTUEm7hZLsYdiYR5kH/W5XiHjqWi
	LWenjVtmRWuT/wMmSiurnBKR3Da142RvY3/BY9+3kfod1f73AT8Ti9xfx7Lisn/JbBHAR4uZuer
	jzIy/uvhtY0bwjmc3jAYKK6TVCQ8=
X-Received: by 2002:a17:903:41c4:b0:24b:1585:6350 with SMTP id d9443c01a7336-290c6adc893mr224791795ad.11.1761037950348;
        Tue, 21 Oct 2025 02:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZaVIOlkJ8pTn567PHoYPwAkq1XUCUE6ub+TrFUWHUIKktOE63K2gBMcvWDAWpuvoYDa7eg==
X-Received: by 2002:a17:903:41c4:b0:24b:1585:6350 with SMTP id d9443c01a7336-290c6adc893mr224791345ad.11.1761037949686;
        Tue, 21 Oct 2025 02:12:29 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292472193acsm103402075ad.108.2025.10.21.02.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:12:29 -0700 (PDT)
Message-ID: <29af107c-0462-489b-ad3f-e39c7d990240@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:42:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <tv7zufiknf6ecnvefksgdborg4csqxyndb577crt3mzwzcxley@zlschj2txmzi>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <tv7zufiknf6ecnvefksgdborg4csqxyndb577crt3mzwzcxley@zlschj2txmzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p1RdU4VdAYV-FBPGdFG-bCkkbPpAWq0b
X-Proofpoint-ORIG-GUID: p1RdU4VdAYV-FBPGdFG-bCkkbPpAWq0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX23QIdbpxXr0r
 xwC1fD5lVDRlW+y79KdZl8z4b8G6ki92idXaZYQlaTJr1oT5SmhxBudiyRrF590zd/YC5tWsPHC
 8svwglSSb6OYQK3akBKb9Ca8NyKPzaA8yMFGNYSSKjxSsAo16ZZGj3j6+NfvNbampmxAQmVOPcj
 uK97CUGQ5Y3+fUX8QBqoOS4csFbLVOoFFIhkqfoPqXWdHP6AHjzhTitbUlbHpdH6jW8QjIMb5Xo
 UIizBQSipf4czwSgwPx0pirWx9I0Svx30K/X7pOMTxK7+Bg0NNo69oPqbHxL8590lgswVwoG/hh
 LwqOfkTUrRoa5pApS73xa0khatp2GmeEtTcxXC0/mWbpiQ03NG2JSiT8xXeWAhZqHjQuPuliSeA
 g/e0UTjq2lNdVTIRw5UkSEQxR7OEOg==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f74e7f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dklrOZhk_xOpRdAJBjUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_021242_468295_BE0072A8 
X-CRM114-Status: GOOD (  21.85  )
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



On 10/18/2025 3:11 AM, Bjorn Andersson wrote:
> On Fri, Oct 17, 2025 at 11:19:51AM +0530, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>
>>>>
>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>
>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>> system during boot.
>>>>>
>>>>>
>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>> module, so no, this is not a desired change and explanation is not only
>>>>> insufficient but actually incorrect.
>>>>>
>>>>
>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>> aligns to how it is on all other targets.
>>>>
>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vdd-hba-supply regulator, assuming enabled
>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vccq2-supply regulator, assuming enabled
>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>> unknown)
>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>
>>>
>>>
>>> I don't and I am testing regularly, so I assume you have incorrect
>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>> incomplete - you must explain the bug and provide proof that this is the
>>> correct fix for it.
>>>
>>
>> We have tried booting up recently and and that is what we observed. The
>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>> is picked from ufs partitions. I will add these fail & success log
>> snippets in the commit text.
> 
> Please don't, there's nothing useful in either log, so dumping them in
> the git history will serve no purpose.
> 

Sure, Bjorn, will let the team get the correct fix.

> Regards,
> Bjorn
> 
>>
>> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
>> ....
>> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
>> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
>> [    3.244707] scsi host0: ufshcd
>> [    3.255170] scsi 0:0:0:49488: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.272001] scsi 0:0:0:49476: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.287011] scsi 0:0:0:49456: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.304264] scsi 0:0:0:0: Direct-Access     KIOXIA   THGJFLT2E46BATPB
>> 0100 PQ: 0 ANSI: 6
>> [    3.331545] sd 0:0:0:0: [sda] 121774080 4096-byte logical blocks:
>> (499 GB/465 GiB)
>>
>>
>> Thanks,
>> Taniya.
>>

-- 
Thanks,
Taniya Das


