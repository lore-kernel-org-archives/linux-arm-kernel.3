Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A50FA0C57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ5BzGVQSU8eIw86iiLL2NgRXQNUii1dibwQjNfxA4U=; b=uFetaXvzWpe0laT7guXaXCSE3B
	m0w/WLeI+APdRL08KRtANUw1nBHbwofGZhjvAvfv4qYM1UUyU/YzEVefv4lSEpBDywG1zmdEG0HSe
	9r/iXFnVNn3LvwF3JptRhPjX4lQgCfI4ymlAfwXxIs57FL/sokFBN6DWXCFnqiAY9gYxpw+BwxMPL
	g4WiWpbsrXLaVjSGxZrSipc4QIhlDn0iGYr9zV07sWNOkTkiMS1AntbudnEdcZqvnfEOli1HkexA4
	qh3MKuse1VQiGMi8yQvhd34CXzwXW43l3lxKyLWkrymMRwkDmGShnKPmB+UomIbSObtqLGz/09rH5
	QUDAjyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvsg-00000000qJF-2agw;
	Wed, 15 Apr 2026 08:45:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvse-00000000qIq-0Peo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:45:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4f5fG3059058
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 08:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZ5BzGVQSU8eIw86iiLL2NgRXQNUii1dibwQjNfxA4U=; b=ohnlKZkCIyUqm2KU
	m/8lfvmCmEgfcHBQIiS7AYXufyQZyT3R8PwovaOO+lBpiaZmP/Y/EswEvEKbmY+w
	o+ZRlR3vY2saaHeNCnBC7ebijweXXHfMAnHo2574jdKIpuo+Z56DcQR/gBHrMwjk
	REKX9ULvcBEGh5fmaAfhYhG2hVa0GR4AEvTHCJ49leVPL4oiRrRs2FnoojhtXaXd
	02V+NVbAcHAM0t+TpaSx++QL1RjcViigPCH/6puqzZnyTw1f1PZOKJt+wWB0zffc
	K0FXzwlpcaeRqOvG7+TBATUYVOOUYkJMRRbmro1NBUuaQk4gD5dl4Cj4zs4h+NkX
	qGDPow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhteptdxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 08:45:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9278587bso6438209a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776242750; x=1776847550; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZ5BzGVQSU8eIw86iiLL2NgRXQNUii1dibwQjNfxA4U=;
        b=X53RlIhnVTpXQ2sMYzPDDAgANiRjA9HR6KO96nu4iFSbmI59yPlxWNkp808xrJolEw
         +635ku3Xe31h9polij8/NHOIa19ApDnn753a5qo0hSZwiLWLk2Y7tmouByYe6Ku1LVyy
         IeLC6fkjqyjwxMbOo2DicuU/Sonh6GQh2dp4J5u3abkdfwMBhOiZeah4ESgSNrs8JNAD
         qiy7nVyKxXH33g/4WRyGk6P1PdYiuNkViKcTvqNUV8rq/mFpM4fnEfKassI7rmf1NUT1
         WFZtInnN2pulkN9NGOVx2sLp1zb+n8M2/OlZ/CnSsyQ5uVenGqR8+/34yntFevldb9wd
         bmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776242750; x=1776847550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ5BzGVQSU8eIw86iiLL2NgRXQNUii1dibwQjNfxA4U=;
        b=qmwZ4LvbJetLkV+g3Og1SlGt8wiCODbOBEnnXecUAnW4oFmmP3/uTjRCKIfjRJ46oL
         A0bM0v5eroa6l4zQdo0r+Hn1ThWSBq6wp74s6tVUn7Z05rH1EqT2uocOAKBGVt6hzNG4
         Y7CxdP3yiV5tUNEX3XkvqFDnljrbkzrCuU6/6pfEnXQZUJF9R4DG/Q3R0++PY4/2z+D3
         zYTBb0gEjrJMlWduftXVdHdEsfHu8/o8A8LyD6RQoSF+h9di/8nU8t87SHCIMdYffPJu
         WAQBGcrn5Ajv1pWaZzWDCp9TDe4L1mxI2qwtdibUpOeZXDgC0eRm1Vnkk5F+fb0/RRvk
         L4bA==
X-Forwarded-Encrypted: i=1; AFNElJ/VHGObFn1emFK0068sMpdjqCS5eQm1+4LdL4U8yVN0RY1FW7JLweMHeM2NN3dgxSDdi6hHYJEwGa3wbtmGsqp8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt/UIj23JeLHFG/h898qLwmU2kz8qNNCVioGAMlaVex5J2y7OY
	ulRnGUwrfVDhel0k8Sxp/Ja4jEtjixPXI830I0KszjiyVdcNWurI43CuYVhMbaIJoaborZFKG0C
	G1dV4d4QGUG7rHDyM29pzarK1tIEFqPmvs4xKdcRVcLp4/IZ4m7aIjEz2hsEMxxecHqpW+Zlv6e
	Gugg==
X-Gm-Gg: AeBDievCcvRo01U/39ZskwYdUgpImjShUDt8i0PRThaKen1+/lzZgmfvdwfwqlu61G0
	kOmM4Ih6N/zs58Xstoj0f1uWCin9wGH8uSBvbnRTbFcY19GV48JVY/mD4Q+TfyAvY6eAJ4SDhOs
	tVgzqw+1+Tp2V0YTZ5brGViHlLI4T1+BYxGB9zNo18JNdPEOmQFvRh95ZsxUoxs4FAFyLrAZPXg
	jKitzlJwu09L03X5D7TYE9ZRQhOSWRYNtiL/abuT+ZELAuNyx61vQGm/DLXuL9Ao5FENdwq+jBE
	3z8YXq82eQZpv+Ky/LOMlJsBppV+geVnwkWDEOuRauBjOXwry71KRnkHGlGMgggt1o3aI5aPAxR
	a0rBQwxvgiw9rMFt4wqKDspXmP3ORYYth7/jxlCbAZ13feATHTfPC5LiTYmM62xf7VAtb5eyK80
	PKo4JgnmptDBM=
X-Received: by 2002:a17:90b:4d10:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-35e42847a40mr20927978a91.26.1776242749904;
        Wed, 15 Apr 2026 01:45:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4d10:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-35e42847a40mr20927964a91.26.1776242749454;
        Wed, 15 Apr 2026 01:45:49 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd3230ee5sm1292243a91.15.2026.04.15.01.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:45:48 -0700 (PDT)
Message-ID: <d871bc3a-c104-4e8f-8104-898b957af79c@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
To: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
        mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com> <ad5wVVnUw1jnkCdn@e129823.arm.com>
 <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
 <20260415072933.GH356832@e132581.arm.com> <ad9FxS86FTqxu00d@e129823.arm.com>
 <20260415083224.GJ356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260415083224.GJ356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ISmeJY6R2_AGWVNcABpAY-Vuj06gZvqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3OCBTYWx0ZWRfXyHOH4VAqpCYk
 INmoiMaRb8C/jGj3KbacrhlFK7BkP9eh0DjheYn+6K0EidnA0mkVHeplO7ZIn89dJbnDikya4aY
 GAiL1Y5IiPcy1kyy4d22f7SP6mXK8zbH02SI+4TaP2kSSUIEfnMMq1zoI6GGMGsOVZYpTOmK9p7
 uV7y5eK4KLwNVC7RaIRVzLPKs2EYIztcN2ywfTvXoLGYLjMsfzr552U495uGVQbe/bNY2czZ1TX
 VC/c3fJQGm6CZzhttisNg65NAPjSUNGyHl95D3l4nfNothbWdRD34Kpdog1aJ3+atvYVN1RbGBN
 WibZ2kSft6WvSnTBrnWtW1WPtrtBkWCixLABqyABD33oXcu54KqFUjpgFknXL/o58bSbktUHNzZ
 pIs14SS0ASCZ3k6svu3P8+jDNSZZts15hsAC4Qi+BvAjcKqi95Z0LQ/GqG2rQSSks6nZgGwvzzS
 JKwYKlID6OokPeEjxiw==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df503e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6anqEM3ORI0LkIs7FgEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ISmeJY6R2_AGWVNcABpAY-Vuj06gZvqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_014552_266978_CF98AC8A 
X-CRM114-Status: GOOD (  18.53  )
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



On 4/15/2026 4:32 PM, Leo Yan wrote:
> On Wed, Apr 15, 2026 at 09:01:09AM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
>>>> What I am thinking is as SoCs continue to grow more complex with an
>>>> increasing number of subsystems, trace IDs may be exhausted in the near
>>>> future. (that's why we have dynamic trace ID allocation/release).
>>>
>>> Thanks for the input.
>>>
>>> I am wandering if we can use "dev->devt" as the trace ID.  A device's
>>> major/minor number is unique in kernel and dev_t is defined as u32:
>>>
>>>    typedef u32 __kernel_dev_t;
>>>
>>> And we can consolidate this for both SYSFS and PERF modes.
>>>
>>
>> When I see the CORESIGHT_TRACE_ID_MAX:
>>
>>   /* architecturally we have 128 IDs some of which are reserved */
>>    #define CORESIGHT_TRACE_IDS_MAX 128
>>
>> I think this came from the hardware restriction for number of TRACE_IDs.
>> In this case, clamping the device_id to trace_id seems more complex and
>> reduce some performance perspective.
> 
> Sigh, my stupid.  Please ignore my previous comment, let us first fix
> ID leak issue.
> 
> Given Jie's comment on the use-out issue, it is valid for me especially
> if a system have many dummy tracers.  We can defer to refactor it
> later (e.g., use separate ranges for hardware and dummy tracers).
> 
> thanks for correction!

Just share some info:

With my memory, The ARM AMBA ATB Protocol Specification defined a 7-bit 
width field for the trace ID, that's where the 128 comes from. (in each 
frame, we also have 7-bit field for containing the trace ID)

Thanks,
Jie


