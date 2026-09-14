Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C28C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=; b=BAf3p0WAR3MAjW7jynr46jjS8n
	DGqEPn8ibIavbXfvDgL/Lq5N9TOhm+2zkWDm+XweFkF5PAD19zGMFxED7Zqe+UdfdoakDXmlG+SVf
	oxl9ZF1Srlpid7z1pPoVlZTMDzzatEXO0aD38qZd94KeQafMYFVNX6pEAbuW0onPoMN2y/uvP7xAS
	tw/ZSgFOIownYVJGNK9b5qxDnZohE5qnuUPsEwNcCeDIgJ0FaGQP8DNuxgVUn9hfQhvgXUB6uSafG
	CFuqY10dFBmiK5ZB/hXg44NhaxLo9aDDR1RFJ33WvmkYz5H+Vu5CE0znY9fnLXMNJV4l00irjAOnS
	hp0OoehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x608N-00000002QrT-3C5A;
	Mon, 14 Sep 2026 06:25:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x608L-00000002Qr7-47HH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:25:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jUFi3842872
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=; b=Xh8DVKFuRsXOa/pP
	AWFK4LToMlM3fufR1w8G9l7jOTJMNsrWnVgzuuiRBudQLX9oRaOYqj9IsV51owh4
	wjDPTnUfoO6w3b3xYRd+9vpE3V8lCLHK/RYFaTowsTOhCc5fUtyh4CWzgdmUhm0v
	iOn2xn58ssb2xCt2zRhZCVoLZW1S+RJ+WGNlLRJFuiD5f4h4WibRa5d0cDC/NNFN
	rs/DX1qeryI3BOmJbRBjWq1zsk5HT7Wgg2YHSQG9mEgIq6LBvVCVIIL4rUA45ABR
	veqY1L9KEZNik2CrYdTUIiMaK48w/5FkjStezws5aCCmig2LL/heNuheRkoTunWS
	aONRRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5b06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:25:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5374479a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789367140; x=1789971940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=;
        b=EIc1Xw5WAW5ZIsU/T1d3r+jteNUdqonIC+LC4uzzHOCkm6mEd2Wzd5Fxfq94uVyI00
         FmzfsvbDnrFR1XBGPvQRwtkYU/5PtdTpQ0vVRTLMVyQC9vKgxFCoS2xFiP9xK+Xb6m5F
         95PSB6zghv1Yn4ijSbEok04qzs3b0ODK/2Lkkd/DMscLQcVPtcROfVnw311Hs1OeI9MS
         xskUghsZ4Hj0RLZozexqSZuFhrod+0BBTk7sRiLv3PPF5y9Buml7JxTlQQ0vuSYhT7P4
         vUNq/Xcg2vd2IFrxN5ZP7EkwIIm69THeN3jl3w9Wq62mA9RIMeg7+Gi4GAxybeOUaL8/
         kAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367140; x=1789971940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=;
        b=J2AzjyHz9IC4ecSKIDbJXn/CDa/KydijgO4LekdayXTF5lcLfrLnhg0bHrJetFXiQs
         ppv7IzrPbPRThH9GQPRbyJDj1F9vXFTGo4NicQDUkY9fJc3Afx+4natSE9RJvvzNVYE2
         vO/p3FHACeV4lw3nylRxhcg/6LRT1b7RbZYXPWoTTPpNo86aoEVTp7IaLL+8UUUu771j
         Ar+ArzK+BqvUNZLZVhnUKhpR2GqcEUeTuNUwmVNY+N+tgqJE+VHVpnYCfSbEXi4IZaAA
         yBn2z39b0FAdgNHpIHas3xL2wUrqRxtRT/4W5G5qS8ITceI9oMEFhrdC53GoW7OAo3Bk
         CIGw==
X-Forwarded-Encrypted: i=1; AKwUvBxTEL9CEoolKYqZfbRI1UIuDufa1iCdPk1dLd99iQ5U/9n0+mT3YbQgys2AQ+p2SBWnecxtqRyRGjFJKt50BzkR@lists.infradead.org
X-Gm-Message-State: AFuF++kva1WjsHl9EOvjSh48ZR/TFQf6as8Anh3d1hjhoVSU+tbOGZpy
	N/9RzKx340c/0HEmIj/FTqjImiPOzxbYY7VPOvaTXButzHuDYgWrPIXGZeW2Z1ua9cxvz8KD+bg
	HbmGGXr+qsY1fwzm1ouX7kFMBfqK3X/FHWtqYkeQ6HNZoG75v43bJ9Vyfwgh3VRQOOcK5HawhMf
	Zg5w==
X-Gm-Gg: AYBFou27cR5M5LSgHGZBALGPRmugBPXV9vJkT1oiA4sSMAe25DfBvka4qIs3Ba2fpyP
	Zqwamo7Gj6njS1MwNeqmA9uGI0zffaqla8YZApOJvvuoGWcGuiyX7fzaUUgq4MvKhgDbi53QOh4
	T7pnC2ZXORvOpfFxURunKvpqmTSvGYHyE4zf88WKQoGTjWxkQ4WIooR8QNXksoWjVFcg9ujAB/T
	eJ5P50e5nfaPUB6YYxy8R5oRUQdUpsG70yDZ/LPwRSmtYYfHd+N3LwQnfHNcrDtHiBRfqNwI32a
	1Nw5z7foY0NWlPvwm0PDavVwbqsCnlUwKgL0UQgK9wp6FKq0MiWbYrpwp0+TymEPiG9L8uDO80I
	Ty5SMvDsKDXZ6vDQHcGdxBOhk2h0gvM48X+qaSBb4MhDFxaQ0bQv/OcSGGAogjDs=
X-Received: by 2002:a17:90b:39cc:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39debf5f2a2mr2755644a91.4.1789367139862;
        Sun, 13 Sep 2026 23:25:39 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39debf5f2a2mr2755588a91.4.1789367139389;
        Sun, 13 Sep 2026 23:25:39 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm18760134a91.17.2026.09.13.23.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:25:38 -0700 (PDT)
Message-ID: <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:34 +0800
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fBGgbKy8eDsBueFhWFIoVCDOhaWqYBW8
X-Proofpoint-GUID: fBGgbKy8eDsBueFhWFIoVCDOhaWqYBW8
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa79364 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8
 a=TdcjmqNvtQ7Mihavh1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfX4eRNdcgrzAxE
 MMWUoU+kGKZNZE6h41elI6tFrigW79urhmuOjuonp4bHgqXG7mQImjnHNmfd+HejukjCNloQgnT
 Qx33PzQuIejs1ZTkb5hMChOTeDgeXpaSRjelrtGyzV95u/SQoPsvUVKdp+1x2olmLViNnd7EVlk
 4Yz8WgdUSz1YUcTy0tnfSAbJmAE48xOMwwO+fE8kVNN1pos7V9LRzAxniNR1rYkzqVBxU9zbFdG
 xhjbLLd1WHUo1hi0PVfJ865QdLPaUWbq4a8gkV2XzELKN/o+J1d7Jc5u0UjmDamUR70whtsaG/g
 IQAr7GosUIF7ECJXL2AEDMzBJqMftxUHssbMDWw5N3y8KGB0fVXzBMMRS7PzmGQOXgHgykr0UiI
 wIGCmYPOA8ctdTPAW+riwkoA4t16vbGtivGQ2WaBd8bCIpoYneA0mpASCr0G9nUyTkwBXUP7+Yw
 0SBHf2jNCV/mxCNEvxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfX9K3cJ+GSjiP7
 SCJTJq2jrEYrF3JH2gxLFfOysaP/dgieiK5+vFQiqcT5LScmrCJbaENH98DLLXPODz4fMjiDURq
 27khMWonf9WldjNObWgZgXIxLQ7eotA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_232542_158277_FB602938 
X-CRM114-Status: GOOD (  25.36  )
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



On 9/14/2026 2:14 PM, Gavin Shan wrote:
> On 9/3/26 12:37 AM, Andre Przywara wrote:
>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>> error value.
>>
>> Check the returned value for this error condition, before passing the
>> value on to other code, which would hide the negative number in some high
>> value in the unsigned type.
>>
>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ 
>> mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>   /* Find the L3 cache that has affinity with this CPU */
>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t 
>> tmp_cpumask)
>>   {
>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +    if (cache_id < 0)
>> +        return -ENOENT;
>>       lockdep_assert_cpus_held();
> 
> find_l3_equivalent_bitmask() passes @cache_id to 
> find_l3_equivalent_bitmask() as
> a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly 
> related
> to this patch though.
> 
> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
> 
> can be:
> 
> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
> 

Hi Gavin,

Thanks for pointing this out. I've made exactly this change in my MPAM
DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
changed from unsigned long to u32 there, along with the related cache-id
variables.
https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com/

I'm about to post v2 of that series and will make sure you're on Cc, in
case you'd like to take a look.

Thanks,
Yin



> Thanks,
> Gavin
> 

-- 
Thx and BRs,
Yin


