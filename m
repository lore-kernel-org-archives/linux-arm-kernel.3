Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9152DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=; b=AL24EnfQWxCpMVHaA38iV5VVgW
	JegtQMUxn//GTeNbQyaISl5cX1P+1Izf91d9VHroJgE+OLiqOLrpau/oe/kw+zdxuLNOvwI+536QW
	3NPoyMJa7NeQQsM8eHwAYE7sA+jQm0YRiApesIw+hLv9sEtT32QQPPcRHwUApogwxronsLC+x9naH
	73l90DkIM87+KtmRpN93MrGqRjEJPRaQ/KxI1qnGz4TlMwjuVWvc1PKOLgdSJ9DNkcMraO3PqO+hu
	lSxVzfR/l3T154IlWlryQjV7R73gxFjaad884RT7mNbi/r5F/PiArA9fpW+C0Rtrs59MWO4IY9bZs
	kzueWu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Rs-00000002TLi-3i1r;
	Mon, 14 Sep 2026 06:45:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Rq-00000002TL8-3KL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:45:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5irgq3196594
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=; b=mYBE8WCgc9lMuNFf
	xE8whSGS8UNjB64NOkMtwy8sj114x6Ni9I609rVDsDACyWbRB2Mw9aOtZcJGDIl/
	z537m9EWjkqAJWM6aSjhsovk4hkHkn5Jz1wd532+63VovBRtXzaTr4ThFD7/IoYI
	QHdOTJoJ/p2nwfVF4GC05FSJtDKE2dO8NnyxaSV7hfQwMLKepjiMS8JDUuyJwpes
	IIg46VKbSrYqYHV3HvOVbOP4muLm3U55qbPIUfcADi+pjbOBKXtLTbyL9K32gj/7
	rbkR8Rf2fTbaxwRLbmPd5wpROhfsHDiDWq3r83n1VhSfUO+SVob33msFISeshQy+
	Gfr/BA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdbtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso55245855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368348; x=1789973148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=;
        b=EFYg+A3xC32yJF0mt8+nYmTg7rqSmKeX6gxgn03OF5eI+zYYzqMaSFY/AS71aRmDuW
         BXtYZ8fdpd/JOVHitLVZm0tHTBq1PhWwzU9n++QvSSYpQd7t9HdtP3707pLY2zJyJEj0
         y7rJREfbyEn3ADioGLp1NaEIDL10pYzGJXdb/ThrJ7neJypEXnlBSl/vzZPsIkcVIENJ
         86gbtiKJyDHCZRxe4pjsVgGZJS9P9GYr3hbviXJEuMOZ+nTlSChERJ7yGvhdcVyX8uc7
         tZqnGiwQ4vcUTFfbJOOm4hQpHO+UVFj8nqUGpuY55PFS51Lu0zRFQY8EDCePW6d492+I
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368348; x=1789973148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=;
        b=lEXGvC6nhznEUca4lpVCf7+k6rJswSwu63zxEB979Z29T4FHQ5F8zkUBLYursXIJk5
         bt2YtWRqqqgcI/NQbzo88NUBvKi11Po19iB4GvdJPfakESNFnhvCx9p+FSz3vt6bFfc8
         dWAQ0c1HKsdtVvMEYEsZFs7ZwHMyJZth4zaL41YLcKwfKPTGQVgJLEI1Xdtz7NJFBg4C
         zuHAC09Jd7bP2jL9IHR4j3xd0xsKyqAi3oJBbL7fc5kzkkDpYgQvYMr3zyaCyG7X4jF/
         Rx2ogynSFoEh/bN54abbWE9v06flTJd8hsFP+f51IH7L8nrflMffYlWKmMD+xvJ7Lm9m
         sXAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl+7M1pdLGy3qYKPx8SZpZj10h9OMgkwoo3uam58ypBbrPa9HeLnUbSoxR9V0iGrc42PanorjOGKfgtCI6z9NV@lists.infradead.org
X-Gm-Message-State: AFuF++l0BgtG7m7HIq3GMHXJOmn33+VOx4ZUev6zb5sivRhhbjU2DOf4
	v5tOJ1ARzct0JQM9guCPHbFgKWx/mrHbE5mIjwLGCa3USXCgHSXIKt1T/aanrotrKXBPaJtpgjB
	e1lDinF/ZyLjx9VG3j+VBjtHsXzlcvxVpT+OVwwFMKGQgTQpriSow/lB9B9Y5dTJhTXLbmlMynF
	M/8Q==
X-Gm-Gg: AYBFou3z/WRyBiG+SA0DgFujvsG1Rcy1gECLgiMpYS2/YhshEc4+aJ+kOZI1NhoYiMF
	BfB76ca739wIXdTmqsP2icTHyIs0gxCZ6pu2I4VU/lgw8ATYUJ4dajQNgGpbVdwSDmlETV2LDKn
	Py3Z9i4AJgYN7WgICG8EGsqfuKoHdwGwLI99BdawwhzP3YBEbFx3Cs+Sa0zZ8JODVhXHOu+2v3D
	KvKgvh2XGeSRv5oY8SXr3iRC4wJqxnr64Cg7D0fLC9Yzw7AUOWDPdOdqcutDAD81VHdHP+QR/ZY
	MNsWV0YeFucKD8IlEcAXHBWMGKL4BZPCugr8b8TyA0tTUYea387JSL09NMAlVIvhBBRGmcx7uh2
	IXEtPNCuqMhX2BREBquUwcWmYdyPxKwHvWEE85CS4OrYFrXT/C4xq3JTTnqfuPx8=
X-Received: by 2002:a17:903:1b70:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2dd6c741e30mr27982055ad.20.1789368348608;
        Sun, 13 Sep 2026 23:45:48 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2dd6c741e30mr27981525ad.20.1789368348124;
        Sun, 13 Sep 2026 23:45:48 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb3f66sm42416135ad.35.2026.09.13.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:45:47 -0700 (PDT)
Message-ID: <bbfc7313-c4fa-4cd2-aa22-66e2cb0dfa20@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:45:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Gavin Shan <gshan@redhat.com>, Andre Przywara <andre.przywara@arm.com>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
 <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
 <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PM1LZIRZ8ZLOi8p_-Q_zy8zyHM2stETW
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7981d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=L7FipRsCem679_Rc0t8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX+ETxwefWSYSk
 0Kh5TYV+Rj3TyJ0bunXRcumcyALYQS5DrrUkQIRnqVa+GaP8RYm01yj+HFfEAclDRsNDrOS0iMD
 9OuuiA8Bqk/z8VOV66A3jOkN5XckHZs=
X-Proofpoint-ORIG-GUID: PM1LZIRZ8ZLOi8p_-Q_zy8zyHM2stETW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX+/6hYgCrjfEW
 vKQluEvTptUAbQFo6b+fVtG1TwEb6pEojPgnqedIPdZTSYzuLhOk1FyOQEJp/2WqWs8bpZPgvYj
 h8ZWt99sY9U3LZRc6vAi46K+QXD0Af5jtuabrp+xeXrxLndqioB9gQZybfX26H8dHcxjswSRAKX
 hbminNO71vTWR8OSyfux6EKxOyOX0ZAXQ7PJDW3xXE3ML14Jzu17+8lJpDqasAmMGYyUAyoUf3j
 yUHq1jO3nFcSTYLE9u7a3O0UTgOV85oOHaii8gyclx47rlItpsNl6FIyuG4xboJTPqRLGBpUgSM
 uAV6mUQx6JjNC8vvdMCu6xgsCsZqPGd6earvGj9V2BrU7yAdtQfoljXgVZpRhw354VfMJPINRNw
 jCSUDgs6lyoh7BuptuPDfKK6CTw2yW4w9sTUPDB16Z9a6uPD6wruZFwKbJX0qDGLlu0cBKdFXyd
 W8YjEeRSUh4kOADbe2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234550_975696_D378DD32 
X-CRM114-Status: GOOD (  32.01  )
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



On 9/14/2026 2:35 PM, Gavin Shan wrote:
> Hi Yin,
> 
> On 9/14/26 4:25 PM, Yin Li wrote:
>> On 9/14/2026 2:14 PM, Gavin Shan wrote:
>>> On 9/3/26 12:37 AM, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some 
>>>> high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' 
>>>> resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> ---
>>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>
>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ 
>>>> mpam_resctrl.c
>>>> index 9d223057953ab..a5e661eff86d7 100644
>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>>   /* Find the L3 cache that has affinity with this CPU */
>>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t 
>>>> tmp_cpumask)
>>>>   {
>>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +
>>>> +    if (cache_id < 0)
>>>> +        return -ENOENT;
>>>>       lockdep_assert_cpus_held();
>>>
>>> find_l3_equivalent_bitmask() passes @cache_id to 
>>> find_l3_equivalent_bitmask() as
>>> a 'unsigned long' argument. Actually, it can be 'u32'. It's not 
>>> directly related
>>> to this patch though.
>>>
>>> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
>>>
>>> can be:
>>>
>>> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
>>>
>>
>> Hi Gavin,
>>
>> Thanks for pointing this out. I've made exactly this change in my MPAM
>> DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
>> changed from unsigned long to u32 there, along with the related cache-id
>> variables.
>> https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6- 
>> ea6397bead59@oss.qualcomm.com/
>>
>> I'm about to post v2 of that series and will make sure you're on Cc, in
>> case you'd like to take a look.
>>
> 
> Thanks for head-up, please keep me on the cc list. I would like to review
> if I get bandwidth, but no promise :)
> 

Hi Gavin,

Thanks, will keep you on Cc for v2.

> I noticed RFCv1 series of DT support for MPAM was posted to linux- 
> kernel@vger.kernel.org
> instead of linux-arm-kernel@lists.infradead.org. Since MPAM is a arm64 
> feature, it's
> reasonable to post the patches to linux-arm-kernel@lists.infradead.org 
> at the same time.
> 

Good point on linux-arm-kernel — I'll make sure v2 goes to
linux-arm-kernel@lists.infradead.org as well.

> MAINTAINERS doesn't indicates a maillist for MPAM patches in section 
> "MPAM DRIVER". I guess it
> would be something worthy to be added.
> 

And agreed that the MPAM DRIVER entry in MAINTAINERS is missing an "L:"
mailing list, which is likely why get_maintainer.pl didn't pick up
linux-arm-kernel. I'll note this in the v2 cover letter so the MPAM
maintainers can decide whether to add it.

Thx and BRs,
Yin

> Thanks,
> Gavin
> 
> 

-- 
Thx and BRs,
Yin


