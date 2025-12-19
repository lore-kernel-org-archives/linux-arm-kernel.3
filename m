Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC432D711D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 01:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=; b=d/2RbryJfhOf+1FPLyLUvyIzJM
	xx7Et3aSO/wlRaiob+wSV9tYx+UBwbRsvWXBrZ62lYRbIFIPgoCVG6mXJX3RMhh0iEb/Xggj0c2mk
	H9a71oO0UVpx6CWaS0dTDL4FZt74jiSRVFH51UDdtd653vgTCgyDN5GOymCmYemzol/bLLPOmCW8d
	zQmrgYJx1ylcA/4FQzlX3DratjsxIfEZdiuI1EaPDxaKDvvwrgVatju0kSoKujWjy6gCmweBbXKbZ
	H1b0nToRObBuJXbpwk29eStLXSaho5PL2FloUWKrvA73zwSb8iVJzrPln7t6T5kJXYqgTHhRVXyON
	V8echaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPdZ-00000009SF3-36lX;
	Fri, 19 Dec 2025 01:50:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPdW-00000009SDe-27eB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 01:50:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIMg8uP3541135
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=; b=kXewOonaKO6yCrcr
	7gAhuwJrSPaEY5iHJXkG1uxEPquBbWWxtXF1+UhF2Wx/EBq5wabqNgiw7maTMruA
	TAqp9mmjgRNaZ9J/NK+B6wwxKBfLUAodVtRUalwmatBoEuicSF4X4+NPHs9H2Xc2
	ksJDPZmPxQDibhHMorJqREK8aXJTjsvAp/fm2oSks17O0bAr6mrsiVT7HgYTtE+J
	2oXCiYohCH97MlJ2PXDcY16rcpUR7AomtTZih1+Lq0IrLsDo3f5QsDt3NRrcUM8G
	altotbF/7UEkUBdIuqHBYXO6FDwUSJsawsGgtKtQn8jAwtcLxM/8JYvGFvyM4BgR
	u/RvEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e8su3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:50:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso1750120b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 17:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766109027; x=1766713827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=;
        b=FfDM+6JUwGfjgjDjS+krezQ46yGStg6s3Ubpwg6NWNREUNB5CIPwDa2ixrhqJUNhZx
         ohn3GcObhAut3OvnuPKKjyvBcVxPGtC5LYiyfL3Njn1kaz7sKWGwxYBUTwJBlzp28aN2
         5LRwtB8QZ1spzdaMXoRZsPYSy651pC7jz1+iKzN2Zv4NvMd6bQykW6BTXTB3s1cF18uT
         sGHJFZNlWeU/7Fu9SevpokotNGoRWh9+R2On6MWbKMqysQj64OApY+G27qrAg1ZkIsao
         YYSVi0y+3fZX3H3zawonr8SiIgi141BfTPpnGQL7TGlWmSqfhM8bcjQAUCJyjtdLO9Q9
         a3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109027; x=1766713827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=;
        b=SjYvw7XeOXMQnHVDv7AJbCkzwSzyTn9Lylbwx3GEM6gsc6CmSUGN6nzw9s3kCqFEM2
         1RyTcYn/MoMWgSvyKQ0F937Fp1814EAy3lJPkzTMa3YBBdRRBpEvjtIecsrdI82btNQ8
         OHZ2A1MJ95i4nPjlWCull7RxPSCN0dLe0AFDmeadijlkUVENbvYuhfOUdOsE63sej0T/
         IdHESzDV7gJrc8ODhaVMDgnYTpmZlN5vwNoLBYeIiq3GfPnFurgTnk0U1zutPmETPgEZ
         4BXz76dEJ3QhDJrg/aPtP0freo62jDU5EUyw801XD+O4np1AXHKJzpELURpSGAxiQNPV
         RupA==
X-Forwarded-Encrypted: i=1; AJvYcCUI8jhhngx6MaJsQmYK1JcLadiLrwFMnOwWhfR6AmYrncRScLuEHU4ZB3M0QQch4HsPtujyHwxyiyhFAJpVWGDz@lists.infradead.org
X-Gm-Message-State: AOJu0YzDX4MRorrO7DWhbkrN8yz1G6yyQo5fpA0D6Zo9rXuMQeL0tnmT
	RTrOP6gKIv9w2ddmepexCYnpkF2oXlufVQfTeG49b2MC0FRkYHV6fnq9IPB654WEb5RtHX4JDrC
	UvaQg4nRzSqlAhC4Gecw9aN+EaAV/zk3PAg9XLniT8aabA1B8zkt1BHEHeWEJkg3KqU2OehLaGQ
	brSQ==
X-Gm-Gg: AY/fxX6/bRHzWFwGICnAC00Teuu82WcXi6gjYTs0ZRW6HQCh+oGV6tDtMncWXc6JwgM
	c+A2pNt1wE4ox4RKKuIuvQCkkoAlIil2SiJQyzG9vAxCBQRh4Y0GhP6D1F2CDB6pvMOewNjjfg3
	1REc8PNnh8DzAiycS2XJV/3tD/wGMaV/Q1tb58vxcAJ8gghFeWeWGIEkFdI32uan1ZTcr6Dhnbh
	VL36ACiAMqwjCLG+TLDJmE0GsrExQUaMNc39EVOkOP4hiW/3Nb8CKcyGyDdaKy9KFs0BUMpxYVv
	u1xdIMAtV+4BvbQoQTmuq8m21cJuBoV6ELE28DU6LudApfsbEftL9PpVb+WVhGXTc7UPXO+n9bL
	RA5h5zS9TSqdDkRSCpBmrJMECT74lKsjrIs3mVBt+MFnoXBUp/5mr3NEAcRJSiY7cOMwsgmgJ8T
	CsmSwj2CVf
X-Received: by 2002:aa7:9301:0:b0:7e8:4587:e8b5 with SMTP id d2e1a72fcca58-7ff65f78aacmr1242190b3a.40.1766109027218;
        Thu, 18 Dec 2025 17:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH97khf7iYUM3NJRGaT7+S3mpVjpomkGCij9OOBYjEiHynxY+nzs5snhowicWJSLEzj+HtI2w==
X-Received: by 2002:aa7:9301:0:b0:7e8:4587:e8b5 with SMTP id d2e1a72fcca58-7ff65f78aacmr1242162b3a.40.1766109026671;
        Thu, 18 Dec 2025 17:50:26 -0800 (PST)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm568706b3a.40.2025.12.18.17.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 17:50:26 -0800 (PST)
Message-ID: <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 09:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218104027.GA1790402@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251218104027.GA1790402@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAxMyBTYWx0ZWRfX8ydPXl+yDCmH
 epp5N9FryGdPOKRfMMQV/WGo6ASoXFMo4jkbC720Jm7KLP5fDEYLipExdIgcKVZTI54wG3XHZ5e
 73XX7ivYyeZMxlYdbrlLls5TWIZxyLkQaqRkWVCciM87HNdDtPvBm8sDIlHtqcudsAvDIBByftU
 qJmD+IrL8k1Uc8BugyyyznmN3c6uyLT2WwWVRSUqGhrEW+u3l1A9sNdq+LWQ4v3t6FLwBVXeDVA
 spkA0HSsmzrlR3mLgxsHQsYSat6LvSLeBb1OCOaR6JgfPFjWShNtngW0qywA7AQeUgWrX9gJ3g7
 oxsLLFNHCF2TvfS+JJTgrI6aBW7J4IPah/wt2tsSiAdamuqqP3o6vmuIhMKpul+lkvGNIG14Gp5
 i24Jch5LG3nVGvM39nqNFDALJ/njx+/0oZJ2bRRte95/T4svuIjopa4dNJd4YmuIMyXghqQES6E
 8lagy4teaY1b6vT2PtA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6944af64 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CT3mT5stn3mpJVhV_EcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7JEvD0Ect5LiNdOSmdRmTpaqJIDWjU-T
X-Proofpoint-GUID: 7JEvD0Ect5LiNdOSmdRmTpaqJIDWjU-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_175031_370590_254E807E 
X-CRM114-Status: GOOD (  27.69  )
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



On 12/18/2025 6:40 PM, Leo Yan wrote:
> Hi,
> 
> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Coresight ML wrote:
> 
> [...]
> 
>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>   (initialization, enablement, sysfs reads) are always executed on a
>>   powered CPU within the target cluster.
> 
> This is concerned as Mike suggested earlier.
> 
> Let me convert to a common question: how does the Linux kernel manage
> a power domain shared by multiple hardware modules?
> 
> A general solution is to bind a power domain (let's say PD1) to both
> module A (MOD_A) and module B (MOD_B).  Each time before accessing MOD_A
> or MOD_B, PD1 must be powered on first via the pm_runtime APIs, with
> its refcount increased accordingly.
> 
> My understanding is the problem in your case is that the driver fails to
> create a relationship between the funnel/replicator modules and the
> cluster power domain.  Instead, you are trying to use the CPUs in the
> same cluster as a delegate for power operations - when you want to
> access MOD_B, your wake up MOD_A which sharing the same power domain,
> only to turn on the PD_A in order to access MOD_B.
> 
> Have you discussed with the firmware and hardware engineers whether it
> is feasible to provide explicit power and clock control interfaces for
> the funnel and replicator modules?  I can imagine the cluster power
> domain's design might differ from other device power domains, but
> should not the hardware provide a sane design that allows software to
> control power for the access logic within it?
> 

It is due to the particular characteristics of the CPU cluster power domain.
Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
cluster.
It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
the upstream Kernel.


> General speaking, using smp_call_function_single() makes sense if only
> when accessing logics within the CPU boundary.
> 
> P.s., currently you can use "taskset" as a temporary solution without
> any code change, something like:
> 
>   taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source


This can address the runtime issue, but it does not resolve the problem during the probe phase.

thanks,
Yuanfang> 
> Thanks,
> Leo


