Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FC1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gocZlng0p/reM2Z0HZmLyZtSompFACzks2JqqAmCik=; b=nACI/lyEg1VCTyq1iyDHe1Z6vz
	r1J5bzdvpfJTVpOsS6KlaejOe8TM+UFiHTDr8QCfsVBx9LccBk8xk9TeefWwYRRal6F8kLO19wq3l
	L+wAtOLtI2wVnO3zyM18GZPskAtKuaZHj6YUka6Chn5CtI/g9bkZdhG80xVRphlfhHfpEi0QsGmVR
	4dWhbS7vdkp+8O3uIm7ubSpD6BwF/2MZOPnxCHGfL25Onxv42AWF0TSRqPcK9zXhqnvVZ1D5eZ/95
	+yBZf//vh7oDOKbklphqqE6BBxgHlVKArjxTBI2izuXFqKbk3aSH9XCQozEOBVUBpsK9F8fpnbBVL
	PvQldcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM8p-00000002qjn-41hd;
	Thu, 19 Dec 2024 19:24:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM7j-00000002qW9-2KO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:23:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGIgKR005366
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gocZlng0p/reM2Z0HZmLyZtSompFACzks2JqqAmCik=; b=FWgzBYxRtam4oByW
	bKWLBbGsOHieOnUPWxryGwXo1P9eOM/nUNg+f38E62VtVvOiNaL5+R4Q/0l/SJLS
	Vt5uCH5oSKAJy/+MDBflWEuB7wIrcvQMY7Ukj1jWcSciGfSi7/2ZyCpUi3MhM/mj
	3lTtbE36Zy2XsdvhAlJsvuhAL6URK3EjstGcLlsmm+2fHfpcZFjbvujZ9AX0QBzz
	TmC1JDWPEpNgsuhmYXbcy5FLzvjKLRTikHC8FKK6AKR43PxyJsaOHoQF8UA1ghOM
	S7GuCf1HYz38M98GxQV9DB7SZ0wnhyEGfQOft+YFVWaG7jqpiKhEyXXMwcqXmEYK
	SaL3Xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw60f4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:23:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f85325c3so12968385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636229; x=1735241029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gocZlng0p/reM2Z0HZmLyZtSompFACzks2JqqAmCik=;
        b=Y1733kzl45Jb5Gjd4gVKQVm5reMAX0LsHRSNBJe/QP1+gOCdWENf8EpyPvf7tOWYUs
         Rvsia19/kSl4rX4/LvVG7NhArzn23sU0l2H2t3FH63Yc8plnQ04pd4o0uNgzGbdzRMVi
         CJXFmpmI2b8weYpaxMbkRMnG6QpzB6c/3GPAESAZwGBnWkOwLZ9N9ySf4mpIbNSgYiaZ
         Uazp/cm31JF36cdUzJbM7GQgF/hNFRFEvgGuac+OcNfGne66Wzv3C8ihJSOgVTuVhGJk
         6L4eopxqYuMgr7Hr/CnV5BJa0Ad576nx/tX3JJp7IoFiYGX40GN9fWoetezJgWtlmHXU
         iO3g==
X-Forwarded-Encrypted: i=1; AJvYcCUKF3pOGOv4h/yIy7tnpzWJTb2yHTgwJsP5GUSWJcRXt+doC1YxBnwMP23BOTJITRV0uS4rQa+1K41lBXFJdu6e@lists.infradead.org
X-Gm-Message-State: AOJu0YzflwIzpWBtmzDnZDSm1vITWsXPXDsqdgZ9BfpHh5arUq8Xfx27
	WfhEGCgmKSo9kzC8utlMyK0tQpClLSUJIpp6oSE7vKxy7kTIyUs8aBUcuBIYpFWhoNm8V/cnm+c
	7Gtesbf1aW2PpPCIaW3AnFqwbOTbQdHAChy0+DM3cBxI9KhBFSb7eF6FamqKrs1/LuonUemJ6/w
	==
X-Gm-Gg: ASbGncsw5AD239DIOm+KOJ5Jy78hKpnDtS08beJSsOTpLFr255eCZmHpyDTSN1bmKVC
	xwxM+5fgTQ+83SmskPKYtozil2rt0pRv70f3/U72JmFVAy780MMUt5aNSF4WL8fzWZ6lR2btXZg
	XgkNtGJ5/5aBMObo7gNqN4YhLP8lRrqfDT6AJ2hZW/K5RE2vrVCzc5BwHRePDpcC0A2pgozqyqg
	FdB8lBZeh2LC1X/C1Dm+BLfqVgR3WD9fJv/n+baSyq98STTW6naVKG47Jk7DojiQP2N+28dvRiU
	qELaPrEDJ6L31+ZaGS2tEIvRLY+Yt5x8Exg=
X-Received: by 2002:a05:620a:4511:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7b9ba7aae17mr4554285a.10.1734636229534;
        Thu, 19 Dec 2024 11:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM1BPlEJFAs9IGgICkS3iH2K9v9JTl8Ae4oc+exXVBSbnnU5Tx2jQefnOYgBTNxPPEtT3yjA==
X-Received: by 2002:a05:620a:4511:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7b9ba7aae17mr4552285a.10.1734636229107;
        Thu, 19 Dec 2024 11:23:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f828sm95661466b.19.2024.12.19.11.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:23:48 -0800 (PST)
Message-ID: <761f93a0-5894-402c-b39a-ce9a65707a55@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware/psci: Allow specifying an S2RAM state
 through CPU_SUSPEND
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-3-9fdd9a04b75c@oss.qualcomm.com>
 <ZzSiM6Pn6A9e1QUD@lpieralisi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ZzSiM6Pn6A9e1QUD@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qOo33DeOCCgH2KOfS-t9Ci7fw-NROEhP
X-Proofpoint-GUID: qOo33DeOCCgH2KOfS-t9Ci7fw-NROEhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_112351_720398_602CCAA6 
X-CRM114-Status: GOOD (  23.09  )
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

On 13.11.2024 1:57 PM, Lorenzo Pieralisi wrote:
> On Mon, Oct 28, 2024 at 03:22:59PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Certain firmware implementations (such as the ones found on Qualcomm
>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
>> through the CPU_SUSPEND call.
>>
>> This works exactly like SYSTEM_SUSPEND. The PSCI spec describes that
>> call as optional (and only introduced in PSCIv1.0), so not all
>> platforms expose it.
>>
>> Marking a DT-described "domain-idle-state" as such isn't currently
>> well accounted for in the PSCI idle topology infrastructure: the
>> cpuidle and genpd framework are deeply intertwined, and trying to
>> separate them would cause more havoc than good.
> 
> I don't understand what you mean here please elaborate.
> 
> The part of the story I understand is that you have a system (well,
> firmware for an extended set of systems) that does not implement
> SYSTEM_SUSPEND but can reach a S2R like system state through the
> CPU_SUSPEND call. Firmware works in OS-initiated mode, idle-states
> should allow you to define idle states that allow the system to
> enter the S2R state through CPUidle.
> 
> Please explain to me what's missing.
> 
>> Instead, allow the specifying of a single CPU_SUSPEND sleep param
>> under the /psci node that shall be treated exactly like SYSTEM_SUSPEND
>> from Linux's POV. As a bonus, this way we also don't have to fight
>> with the genpd idle governor to avoid taking the S3-like state into
>> consideration.
> 
> That's not acceptable. I want to understand what's preventing this
> system to enter that state through suspend2idle and the mainline code.

The answer to both is:

Linux doesn't get to know we're entering a S2RAM state and can't make
different decisions based on that, if said low power state is exposed
though cpuidle.

We e.g. can't expect all hardware to come back up functional after
entering such state.

Konrad

