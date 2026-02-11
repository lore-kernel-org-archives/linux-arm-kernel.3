Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFADECD6C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=; b=i6hfrRe16p/KV3gvNY/MZIDYpn
	lCXgAhx3Yy3d5tfe5MHT2zXhXUPckVhVRC0VlTM07IWXIpNitCkN4Fr3JG5WLC7sD/gpirRwQx4Lq
	9VAsNwsFSJipxThj8tGqcY4HJqm2J4ARvSK9/oVLJTrF7uA4xP0e2VRqiMevug6s2jHPrj/l4vkaD
	euIo/Iir/7qSlyRcLtkoPdWw/8NdhpnhkzM3SHJmYDSjMATJWSHXuQ+DFun8223h5WVVZ+IGF31I4
	31ygfUSFaZl/jzzCQs3ZDl9UizfkG6tkxB4L8R7FgVnV0cRDXaJPovFoPkGpCF62E62eK0CGuOsLj
	YFH7lE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCnZ-00000000pbD-46t4;
	Wed, 11 Feb 2026 16:10:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCnW-00000000pao-3Jjd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 16:10:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BABfYX2396523
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 16:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=; b=LR+WysaTJo+GJCLG
	V4okYhQZAmJAvT7TcGVYe4h5Bkk8WpWdHKBM1X3evt1oVmvgpN5RbgquI260u61F
	zshpAG85Imk3/gxhcGjvE7rnaYXJqLgRxEC7ihrjJIw4bga3He2OSARNc9sFRzxj
	p8Dw6H/G3bFk1HAglxt5lnIJA2HbtN5xhDXpbDwJhBW0PWwUZEFmyZszz2kd2OPu
	xx1V1ZEDarqfjYwpM+0blZi+JnYyDNk+uTNolVvdrSO5K3ybIdYjjccV+i2pO1Wc
	2CKQ1sASuwp7P2tIDoit5OZBrgwZjHu87QrM9bbZsok4QJqhMTuo49VaziF0S4g+
	BzBs5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88wqkw5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 16:10:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6dde310601so3021131a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 08:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770826236; x=1771431036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=;
        b=j2bAsftSAHB85Lx7w7cruqLB4b3UnDD7GHrY/u2KSHXgMKOejSxsZLnZWR+BZ0LSNR
         r0LvvH4p/vNWSfqmUv8rybG8FU8UIj0quV7/F9YFJCg3rZ+mChNs0RrfW5QMWwfEV9l3
         Cu63owVVb84W1mqEW5HKKfsaDoqFhpCovfpEgeYDk26zABrLyWqFjtBp//Rj4ch5D/2F
         j3hiNUwgVIQk0gl7PWHE03fNJetU/PCabJJShjtsa+OgLYkA5VHj+M2avjtfHmVPezxS
         Ip165acGJCxaauxfM7OFtrkSK4wUdrtuWvKSIVI3wBWNS/38smo06G03KzwgpRVaRvcD
         LVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826236; x=1771431036;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=;
        b=tBj5XlaqJaPa8emJ/oDM8j18nUi+M+sjJRktJFmzqB1uTxJg1CVlhCxqCpaeAOVK8E
         7kgsfjV5LRIJF93jZfErYxF/oMQjg72oj2IbLEbliTkf2O0sRLxL5uKgWZPAn0PWteZa
         TJrcnyQrl6hQqTg/rp7It74KLlvR+NHVkhstUFFZRyGlUSWSNntoQYjK7GYT1D1vtkGY
         PVNLRLXGmTR21JXx0mvrSJ0J6bjhHfVPzNZsctfuumvb9BG75cgkQj6laxR3MQaKju/t
         0OMdC1eukziyhc7JQN8UsCV2LxyAu8vqiLeNAamB43uHNlyuwSHwxZW+Leos2jVqFAoR
         MBow==
X-Forwarded-Encrypted: i=1; AJvYcCVdqino72NRD0qo/JieF9L0jXNR05UgziMvu8TrxJPs8kS/uB5tBhMCwiMuUpOPqwAtI9qjssVJrNRfPjtiBsXo@lists.infradead.org
X-Gm-Message-State: AOJu0YwEF2PCBVlIOPQQ4WUryQg6iD4ef5qWhiV8Uj/Rs3jbluV992T9
	FiPBkGbX3kLZ1lE5voRyRSp7DgKMMEsdNO/CGMW7NM/UsfPC9syvapFemH1MyDHwgHsAWF0Eqtu
	eJAQq7ZuJFs6uHsgmEzZsVkqETm6UIcBgq91owFl9kKGsQ+BdPVZACYiPVEMrC+UbudfsP8fNBZ
	a/Ng==
X-Gm-Gg: AZuq6aKgCOBSJFHG6DYxkWIXcdx2HnFuFhQChGaaCRZRKf5buxX5hfFalokOZt99yB4
	wCOXOvcc+1mfhYJ5F8CuLFtNYwyIdm3bwREJ4LRaDSR5NMvHsiOt+Cfg38pXZ1nD3auVUnv5CWi
	72mnuOrcs+JNQYUg2LQxBvriaiF/cPnEklh1jpLwAccANaDaz5m8SNeUxlyvfp5YUcxAzq463ho
	z907XkIN3BA1y/tc69nvaRkbRjSF4MfqzpHcn6QswD4EbmisrXLX2x3DHJ6xfWjBKfFAouLNpKb
	t5QqktI3BxeIH2kSV6cNWx5b5Jz6al/0RFpu9gpHH/QcX2aBwEBQsn/fqbuqQwQIeIT9kelCPKb
	m6kfqzzJMJyhZf6nNuf6KmTNWgQIJTBcn/vOapvYlkc4U89JkICjn
X-Received: by 2002:a05:6a21:478a:b0:38d:7d8e:5062 with SMTP id adf61e73a8af0-394322dec17mr2632286637.34.1770826235737;
        Wed, 11 Feb 2026 08:10:35 -0800 (PST)
X-Received: by 2002:a05:6a21:478a:b0:38d:7d8e:5062 with SMTP id adf61e73a8af0-394322dec17mr2632247637.34.1770826235179;
        Wed, 11 Feb 2026 08:10:35 -0800 (PST)
Received: from [192.168.1.8] ([122.177.240.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ad84sm28188315ad.5.2026.02.11.08.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 08:10:34 -0800 (PST)
Message-ID: <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 21:40:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com> <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
 <aYsvacmKoLroXlrZ@google.com>
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aYsvacmKoLroXlrZ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyNCBTYWx0ZWRfX01VJrcGdNPKs
 1LJKbkgF52nWi4S5F3Sh19SZiNubsY+gDSgDT0oReO00G+9LheOLP5LVVWP1BcgbSojWiN4Z4p5
 WT8Mj3Ne/0KUxW8z17wMTMfeSZdxDH8TVaotf+aoakgl1h7Z70qoxu16YNKeW+ZAlts1ssgxb/5
 7iMFUtKxjX56MhBrYjLRHX9erO0O3c1uwOgqk3eDI5QRdSJU4XQ69C5B5ZPXJ8QOG5rEAvtAn8M
 RIQQXGHPTlyaRjpPl7Q2QoAykMDJ8AT0zj7bDEb4goCv8eC2px8nR6mL2ZfP5QHJZhNXt5EgRoU
 nCLML7a+9zTfV6NaIavWMiBWd4iWmCee+HnbLSOwT/zgCAEo+CDjxTcOmEacPdmZMz9EAWw364a
 Bbqkm6TNg7mqbOJD6cVKUbcQCMGBG05t/HkddFL5I4Kx5OjC6MwinLl2B+CgT8hgGqwijsNc28O
 /xCQLmxoTlepWOD1XhA==
X-Proofpoint-GUID: JMhDLQRYlz9uNEcgpQj7NXl5VsgCPJhd
X-Authority-Analysis: v=2.4 cv=W7Q1lBWk c=1 sm=1 tr=0 ts=698ca9fc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=AriDp7QaH+PBGn1cKZtmxA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=2sq3q3wKjKmezesidpQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: JMhDLQRYlz9uNEcgpQj7NXl5VsgCPJhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_081038_962260_E3D9AA55 
X-CRM114-Status: GOOD (  20.76  )
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



On 2/10/2026 6:45 PM, Pranjal Shrivastava wrote:
> On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
>>
>>
>> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
>>> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
>>>> [ +Pranjal as this might matter for v3 too... ]
>>>>
>>>
>>> Hi Robin,
>>>
>>> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
>>> "can of worms" regarding power races by leaning on these differences:
>>>
>>>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
>>>    event handlers are fully threaded. This allows us to call 
>>>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
>>>    the hardware to resume.
>>>
>>>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
>>>    pending gerrors in the suspend callback before the SMMU actually
>>>    powers down. Any GERROR interrupts received while the device was
>>>    suspended are treated as spurious and ignored.
>>>
>>> Thanks,
>>> Praan
>>
>> [1] refer to case where SMMU state is not retained during smmu device
>> power down, this I think is equally applicable for both context and
>> global faults.
>>
>> Since the ARM SMMU runtime resume triggers a device reset, any pending
>> faults would be cleared during resume. Here the solution can be to
>> handle both global and context faults before allowing the SMMU device to
>> suspend.
>> With this approach, any hard or threaded IRQ scheduled after the SMMU
>> device has suspended can be safely ignored.
>> One concern I see is iommu fault reporting to clients while handling
>> fault during smmu device suspend.
> 
> I believe by the time we've reached suspend it's safe to assume that all
> clients have been suspended. Thus, we could simply not report the error
> and instead scream by having a dev_warn_ratelimited about the situation.
> 

By reporting error I meant reporting the error to client with
report_iommu_fault(). I agree that if smmu device is being suspended the
dma devices should have suspended by now. If so, it should be safe to
just handle the fault excluding report_iommu_fault() in suspend path and
complete smmu device suspend. Will update in next patchset.

> Thanks,
> Praan
> 
>>
>> Thanks,
>> Prakash
>>
>> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
>>


