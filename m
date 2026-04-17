Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F240F43680
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBjkQbQbLcv9KZJAHyprk4RR5s9yvIq6reuhxR6To2c=; b=YhTfg5KcgekCjFkCayjPgxEIsK
	BHxy9JVAqX2sMjtVOtc+WyQWOJFEe9nGrA4kHtqpC0Q4DWrwWB8Glm2Bcvu9VzeSYCznZoK+nvGwd
	iKXsSNce4tDLi54IfjTJISqwohqptJNGwcZ7OrA96R3GE9TmJ87DIcnEZD3Uz7ccj2VCLK0iK4WQ9
	p8WEPCaV1FUZjqhSR7+Oo9tOdy3DimH64mc7FO+H55RbnRk66l+1E/acet5cn9lsNK9NIYHYSZ0o2
	ZeITAPcBqHobjW/6OajVFeIR27zO8zHWlsXe4xUUKi5INfwrkiviJ8oemNne7KQ69NuC0SRBUmmO/
	MjUE9VIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf2Q-00000003ipe-0JLN;
	Fri, 17 Apr 2026 08:58:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDf2N-00000003ipH-1rp8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:58:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H6qHZp727583
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBjkQbQbLcv9KZJAHyprk4RR5s9yvIq6reuhxR6To2c=; b=aF42mgb3xxGRL26C
	5Z20j9IBCom1nHtCRm6xiuyPjGIaVzJAEwB3HUsrhqSZVz4Qe5bWD5+LOiVxSrk6
	8vohcKQO1fN2CrgAwQWteQuaJ4LJ2j/LfsxS0dqK4SaGP/dZb8dk+idzXJeGDzI+
	wnh78iXYTeeb9hTcAw/rijMDadyn4SzUXrrGUHLvmZsHJk5q2WEr5EhSVh4noaZP
	slByJs7hdu2W7LGWCNP9OspYsmTWZY3BM2Jwzi0/dTtN8clIDQANgSagXZqDZdWz
	h70tpMkeexU5SI4vCSrhzNx2hllGAyWfFszuRE/VM8slwYWKai0jDI7rEme/jXKA
	EGAx6Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqrgvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:58:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f5f48458eso326952b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776416333; x=1777021133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OBjkQbQbLcv9KZJAHyprk4RR5s9yvIq6reuhxR6To2c=;
        b=BeJUEDKMC15Jx1LNFcG4ThXPo5eausxAyN7KJSs6F9lf1O/jE67nzE0bBmgoRlOkhY
         yDa4Y0BOsefegXt3uG8m+DIbtzOhyFrjiMpqbVm21P83K+iv8xA/d3TMgHQ8RB52HaXE
         tLT67ilFNjYofLcz4XJLEjDFeMzV4rKFmS9ehxzYT+/+tVI73nENeSWILxLs5WewJXwz
         x+XS8CK5YsZal2/XBS4Pf5Inuk+qdP5xUOW5rKbnwKPPxfktQwDD0n6moec5UkOS/ln9
         YhkVRx4KaX7houjOTCEBbGBKZwVHpJM8WRMFTImHz0LCTEL/hQ0918Z6iqSXYEJOcOcr
         9egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416333; x=1777021133;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBjkQbQbLcv9KZJAHyprk4RR5s9yvIq6reuhxR6To2c=;
        b=RBnPsZViwoB2+uB+jD88Isl4KyT5pcfgiPHTg1DkG0614a1nP6N2vP17JKc6q8G7du
         OmHuabRA3ULozQTjj9+lxro8Yd2wFXdXU8khENxdKF0N/nuF1bdkQfOAJQcHnqof59U1
         Y3VCKUASVTRidiVWtJmwONRcZE9RmFxHsRnXUaJ+crQnF6ozrR3Hg1MB4hiomegvUfnn
         S3a8v45WAqRTT3L/rc5zzaoZw1AFq9pFbUE1Jspat+Sh2OK1+dOPj1HS6dbmOBP/7tgv
         tLj5l15WZs7kkjDY4pRdBUuDtZuATvTVtJmp7og//Sk82kpJPdOGmdCXunYmrkztrF4H
         MsKw==
X-Forwarded-Encrypted: i=1; AFNElJ/y34lh6iFh/ExMEpinCb1NGjzky0frg5ASyg3l/NY7D3d8MDHUQPInNppIJQAJQlGnt49QIy1aNSsDkH3Ff9Ix@lists.infradead.org
X-Gm-Message-State: AOJu0YyK/hnP6w/9r/YW+HPVvBBO8yQ0oL5wuYk/v1auazF7OC3+6ODd
	fhADPmww55bkCdVHWOLUBUM3T6Iu9JJbqj9AxRAQqInlUVgdwQpzYI9VVkIH6jSkg1Bzz9p1Z7P
	tb/QCu9xJt0qGW3EEFCYSoGqE87Ym8+ZydGXVPbMydz/fzupaIRFVIfcC9gSW9SZg5MI8iu4RyO
	ej5Q==
X-Gm-Gg: AeBDieswV9XCNyevmZUhAoMwlrWWorzbNW3jMGbtCcceMETf6g+2WxXvmP+ZEjlbwt1
	C4R5fIG+n7N9XXj/sfQksxdCi/qerNOjbGHn5CXrymS48LihO7nc1WUaYEcNxOjhW10cBHjPXTh
	qTsTbgBZfcEg5Hi/aKDTj8r6+LEiNg4Nmuj+sBJZ/6ABCcnPS+GEv6CajGKYwr86G8GLu32mM7e
	+hQyQV5amP6tjguNkO8uzp/RaAAxq/e6SxvQ2E4hmov7ttsukPPNQBcLlT75oLa6o6ezMkCxBCI
	n6OUC6H2MyWPQk7qC1HCc/Qw52/OqiHhqLJ1xLzH8eFpY5tLyrqy6FleFLFLecDGA+XoxlWx4uX
	wt6X4y2lt6Oca/L6kZXXF5dUKWG3xJ5KQ06dvLPTeCEH0/hBudIPV7eLte2UmmIhVBv+bBkBKQX
	GFg9Igfi8iP9jvrJVk4dfW
X-Received: by 2002:a05:6a00:1f09:b0:82f:5576:2860 with SMTP id d2e1a72fcca58-82f8c7ded1dmr2041537b3a.9.1776416332849;
        Fri, 17 Apr 2026 01:58:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f09:b0:82f:5576:2860 with SMTP id d2e1a72fcca58-82f8c7ded1dmr2041515b3a.9.1776416332341;
        Fri, 17 Apr 2026 01:58:52 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm1323635b3a.3.2026.04.17.01.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:58:51 -0700 (PDT)
Message-ID: <44addb42-e8b8-49f6-8b71-d89136e706da@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 16:58:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
 <e994bf83-a66c-453e-aee6-c15b6888499c@oss.qualcomm.com>
 <20260417084118.GP356832@e132581.arm.com>
 <61c957b5-6072-4936-a37f-84e9aad8f5e3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <61c957b5-6072-4936-a37f-84e9aad8f5e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4OSBTYWx0ZWRfX8RiEedsgLWBD
 sDB2BDyPOtx+vJyfozoyNt/gRVFxCjwa+VnzlsGCvVAL1TptgnNI7TmirFkluMTsdquwW3MLYhO
 vYOQjCsq/aHak4B3RtxgfZ7ht9ncgNcPHmVQDerZEdS3C1vBRi6b6r05iNliV1HOV/mCOvhVFTH
 B9K26KO9dowV+hqe6QQEce8f9QtrYoeO3cRFsJSFXv4oPK0/7Yv1zRFl1vIb4HzWaJ0VJ0e1fRy
 lA26wswkHIBQjLkvFMWXBsZIxIs2p05dDVdCGmZrU/EBNCXDPXpb2SJRXHTWNUkhC+B8r4WX7wZ
 +ZY6jALGF0QJ8U2Z88lG5N3c62N1lBtl3mj8pjnRnyjP9CFuyfuIF8zUOqTWvlfJFJjMGFq1iwW
 EgynNeLonHV05osNMgOI1fTK/sgd/N0GEKl7it6wXKbLrz6E1lzYdaeLpEV9H8+vB9cQttaQ5AT
 D8N+9Col7uMzCrU1CRQ==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e1f64e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mDRyvFsd6lRcwDeC3cAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: SbqULzdOwBrecXK6wzlphEiPmeJPVtOP
X-Proofpoint-GUID: SbqULzdOwBrecXK6wzlphEiPmeJPVtOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_015855_601819_E07813B8 
X-CRM114-Status: GOOD (  20.71  )
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



On 4/17/2026 4:51 PM, Jie Gan wrote:
> 
> 
> On 4/17/2026 4:41 PM, Leo Yan wrote:
>> Hi Jie,
>>
> 
> Hi Leo,
> 
>> On Fri, Apr 17, 2026 at 09:01:17AM +0800, Jie Gan wrote:
>>
>> [...]
>>
>>> ... we still need support static trace ID allocation in parallel for
>>> the dummy sources and we should not break this logic in future refactor.
>>
>> Just confirm what is the reason you need to use static trace ID for the
>> dummy sources?
>>
>> I am wandering if we could use dev->devt as trace ID for dummy
>> devices.  Since the device's MAJOR number is non-zero and occupies the
>> upper bits (see MINORBITS), it is naturally separated from the hardware
>> trace ID range.  If so, we even don't need to bother ID alloc/release.
>>
> 
> The data frame is generated by the dummy source(static TPDM, or some 

I shouldnt take TPDM as example here, TPDM is a special source device 
and it's trace data will be re-constructed in it's connected TPDA device 
with TPDA's trace ID.

We have some other dummy sources designed for the CDSP/ADSP/MODEM 
subsystems... which cannot be directly accessed by the kernel.

Thanks,
Jie

> other static devices, connected to a funnel or replicator, or TPDA 
> device) automatically(contained pre-assigned trace ID) and the data 
> trace is enabled by default. What we should do for the dummy source is 
> enabling its connected port in driver for outputting the trace data to 
> the connected device(funnel/TPDA/replicator etc...).
> 
> For this scenario, we cannot dynamic allocate trace ID for the dummy 
> source device. Because it's pre-assigned during the hardware design.
> 
> Thanks,
> Jie
> 
>> Thanks,
>> Leo
> 


