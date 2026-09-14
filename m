Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE88C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=; b=jy6y6kgP6oO95YZ9LTUtS1SvRN
	O+gH4qcThFLd7ooyv1ejgmwdnH4daYABKMT040RAG701+5pBVJ4ORHowERjXXi1XCLjzqMuf35DUu
	+8XCDt0SACPPj2gtAWQDpUL8oZ9nruxx+xO37JWL4/MivUJUpV6bWROXOk/WzcUv/yoXywLyznfOY
	zIQNO4CDj5cek8HW1GaNzbV0K8DNgje9OuZt+BspltSra3w00qihQL1dypqxjQzukJksRjdoEI/t8
	cfP4Qhmq92XVojT4vrMUW5OwRjqfQKiEBuLM4Yhyap2rpvQxUvBmQB559p8Qm9rNiwu39E3VjhUAF
	PwFc6x2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60IP-00000002SDh-2R5l;
	Mon, 14 Sep 2026 06:36:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60IK-00000002SCa-1Iva
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789367759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=;
	b=NpINEak9Dm8E5k1jIxBKkJ50ayFoORINTJL+akUzuDKm0BERKEMQ/0NOuogiC09mRXM74P
	Oqo7DBhF/GunFQUTgiC0KGLzYofTJ/kyM7dt/2lw/qEA28BOOknMATNw/MDdK1c8WwSqmf
	PutD5hxA+s+DA0jTzWRVP6HeCMk6cT4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-xgZFsLdbPYyrEriKFiffDg-1; Mon, 14 Sep 2026 02:35:57 -0400
X-MC-Unique: xgZFsLdbPYyrEriKFiffDg-1
X-Mimecast-MFC-AGG-ID: xgZFsLdbPYyrEriKFiffDg_1789367756
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so886296a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367756; x=1789972556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=;
        b=UTctm7MrDQ/9kqJLlGMF5qjgm4UOy4wE2z6pi4G6y7BQLsRSrD5/oNRirVKa8ArWPD
         ORnOqNSNE9Of46rx/EWLMkLpDwU40NYTjV8T48z8x0q3NTYcN+Oc8y5BCQPnW9B0/KqU
         5gttJCyGxW4DCcu1qnxce++V0fApsPvd/PsKbsLmhtgGlm3ck2hMf+v6SAC2gaBIN+X5
         x3ww6HcSnIKMUlE2cG6INR/VK5HBq41/8wkRvw86kXwsWGO3Ok6hp939NM03zcvOMrpF
         Q48pTfM21qd0UdlfgS8iB/nx1FSB+pa6hGOLOh4ICITNG6HcObYlojizmnN1wc6i1dzb
         WYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHsq0TRDoS3mH7+Pl+Rz7GO7UEhNua7u6C8gNTQx5heqBNoDiorzN+tTmNkFWL65D/37OXDO9wjFOjt32hBoQO@lists.infradead.org
X-Gm-Message-State: AFuF++kJBWGHia/TNDPMaIhPvC83vJrwqjsM/uNMlW5rytP9EiZq2eaP
	e1jCFL27Wgf0465wZ7fyyT3jS47yItbqmSTgbtW1feTLq3zO6/WVRM0NVyfNr6aziwZHaMCzGPq
	UXO7Ij9ZzxygFKmEWmoxnGx1aQn5qnTEix/nEH7hFfl3p47QCgq+ty/XtZwdX4q0zifSFtA+eAd
	hz
X-Gm-Gg: AYBFou0Y0nmgbliPlLIlPOPSy4BEiMW0FO9G0awvbIZHW6uQ7Uz7z2kg7xQfo5rmYq1
	vdWwE8Tn71LBe/eTPYpg8znfiUndy1oCCS1349UhVpQrwXaFTpGcwjkgM4QTo7eWyllJ3OEYues
	W7zmO5Gxac7/eECma3dFG08zqCrYk/VxbwNgdVV4yjb1Ocp9RSG00B7e+NZEZf04ttK96wW2l31
	i0pdzfEpp/4nghTs4PRWleBMw8kkJedGzx3tWUYzsEcF06ijlKaDPa1xqoaPZd0EH4T/jqm7iU5
	9sYxpI5OZ87ADAsXFPG2Ov8AdSl8YBZ1eJTd21znze8EhAgxox2IrDf0DSeYXoudn99njVq/pzm
	L88dMD4UD+a6HCA2w+6Bxkxch8V5Ju/7UDXZn1FaIjA==
X-Received: by 2002:a05:6a21:9183:b0:3d7:3cab:c72e with SMTP id adf61e73a8af0-3db405340acmr2425192637.16.1789367756124;
        Sun, 13 Sep 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:9183:b0:3d7:3cab:c72e with SMTP id adf61e73a8af0-3db405340acmr2425136637.16.1789367755712;
        Sun, 13 Sep 2026 23:35:55 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4f4e5aa58sm505037a12.8.2026.09.13.23.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:35:55 -0700 (PDT)
Message-ID: <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Date: Mon, 14 Sep 2026 16:35:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara
 <andre.przywara@arm.com>, James Morse <james.morse@arm.com>,
 Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
 <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FEMGrtlgBOiy4asc-ag2EXvfFMFWWHpW-mPaFMn_d2M_1789367756
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233602_970139_127B27FB 
X-CRM114-Status: GOOD (  25.39  )
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

Hi Yin,

On 9/14/26 4:25 PM, Yin Li wrote:
> On 9/14/2026 2:14 PM, Gavin Shan wrote:
>> On 9/3/26 12:37 AM, Andre Przywara wrote:
>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>> error value.
>>>
>>> Check the returned value for this error condition, before passing the
>>> value on to other code, which would hide the negative number in some high
>>> value in the unsigned type.
>>>
>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ mpam_resctrl.c
>>> index 9d223057953ab..a5e661eff86d7 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>   /* Find the L3 cache that has affinity with this CPU */
>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>   {
>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +
>>> +    if (cache_id < 0)
>>> +        return -ENOENT;
>>>       lockdep_assert_cpus_held();
>>
>> find_l3_equivalent_bitmask() passes @cache_id to find_l3_equivalent_bitmask() as
>> a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly related
>> to this patch though.
>>
>> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
>>
>> can be:
>>
>> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
>>
> 
> Hi Gavin,
> 
> Thanks for pointing this out. I've made exactly this change in my MPAM
> DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
> changed from unsigned long to u32 there, along with the related cache-id
> variables.
> https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com/
> 
> I'm about to post v2 of that series and will make sure you're on Cc, in
> case you'd like to take a look.
> 

Thanks for head-up, please keep me on the cc list. I would like to review
if I get bandwidth, but no promise :)

I noticed RFCv1 series of DT support for MPAM was posted to linux-kernel@vger.kernel.org
instead of linux-arm-kernel@lists.infradead.org. Since MPAM is a arm64 feature, it's
reasonable to post the patches to linux-arm-kernel@lists.infradead.org at the same time.

MAINTAINERS doesn't indicates a maillist for MPAM patches in section "MPAM DRIVER". I guess it
would be something worthy to be added.

Thanks,
Gavin



