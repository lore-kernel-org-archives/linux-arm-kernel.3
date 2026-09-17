Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DE3C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=; b=jlSI6Ij+HFY25FvWn7WJnqMKCv
	hjwPv7X6YBv77kJVhUpZF3ajudCruKG7nJySyucwkhq4K7Yhn78kDhXjD3MrrOSnyDB6TWOXNYnrA
	o4sgOBAas/d3Rd4KPUWHegp8eqXQiJ342lIuyjF1jHwRCFr+2n9drylhuqqbmXguVKEsFTagkrO4G
	nuZAu1aIrivZV/kAz63L9NjqqxayIznwO1KqWQqSvxvv3Ap86JisY0b+8fvz5279/Noc8uXfEf8cU
	KfDA98fVbe4yuX6TNzX8es0wi5Tdun0XsS+m9anPpaF5SH7YclXAlsek9CMrXuD+VJ5FsbTUX0zmH
	VCoLiLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x756u-0000000AdKv-2oDM;
	Thu, 17 Sep 2026 05:56:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x756r-0000000AdK9-3uxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789624596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=;
	b=X8AsyLeoczPyt1KXzNcNZaNf26eHtL7lBIYcLPlhxnSMYDrWLq6t0TpGN99mGwXzkDSQDK
	z+9bJiKmuPMlGcyj8DDlKlVg2uHUdeLk08hDvS5+6p0+j3I33OH887wTt+WiE89EVjf/7y
	lI9DnRwAMNY6HBSb++80fJ2DCW1QFNw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-AOeCfZXNMnenIW68mEZUtA-1; Thu, 17 Sep 2026 01:56:32 -0400
X-MC-Unique: AOeCfZXNMnenIW68mEZUtA-1
X-Mimecast-MFC-AGG-ID: AOeCfZXNMnenIW68mEZUtA_1789624591
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8699b293a80so582844b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624591; x=1790229391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=;
        b=f+vDwHDJIFWvNkXjUqVFVO33gJ9zcENH6t8kliUpObxgUE0/zDErzeNpV1WQyhApgj
         J41CQCWpYVbK+x9bNqh8lLj0nfCqfOC7BOpwtVis0d6gmb9GJBxiITF+8OGpjABvmI0b
         hiKvz6SmGHTVGF8HRygrn3R6kIcVp7CSXLK+3W6sGh7ievPPgdZqdm+LttOVl9fRw30F
         tb1guT4AjZ9q1F0W1tlG3KcO8IPA5HVKj9b7tOegUWLZXOpsTICwHrr8vY/Zz5hBbf8B
         3dhi4pmtQM9p8E35s/PU94y9B55mPnEsfr4iteaFvxBR4wW8eTP7HFvuGvkhuNxpU44E
         ortg==
X-Forwarded-Encrypted: i=1; AKwUvBxMZOQAG3sIEZ7dysoXBd2q8E001/cGEjnqpL49fGJDn/6Kp0YhWDlbenXxdnrHF9L0kEIdaFTKXNGmwKt9BeSX@lists.infradead.org
X-Gm-Message-State: AFuF++lpfk0xIJCsl2EVbGlGBu8SXNJ2rmuiaV31ByiL8VmEyX08S5ec
	40LsSwYN+MN8M9Z02lvfC73yL96sEFdnyrl3nN/Ufzz9G/YtF/IzmsXG0O6Ngcrr7NFJ9AeKs14
	QiznKDWmt7eB3EfVz4oGGi6Wn2ogbHQHbt3DMloYWV2/O2Gyi/S8o8eKhpsWBRv5X3+5NbRNJkq
	UtdUHIhRl6
X-Gm-Gg: AYBFou3l9XgpjyNHGBRm1B2VVIseRDKyl3Vd8O60XyGhYQMc1T6u+ks7NeuV0hWFnMv
	sfH++bWR4Q/pkEn+4dRy+S33PN4oeCZvbrhhGh42A8/nsdsnCfrXEmZFOZ9lSsmL09c+F3g5gae
	zDJiucZlg4tiwICkcePqHnU6cJT9YN9bTqiX6dnest6MiEvA1Zt/RxulRtiV7cg7s7szbxtv+hK
	BGxMVI/thKY/9IuX10uh9CeF/WH2qU0QHByPXedVs5g+EBVtOMA6lhb4G2PBuQQ2/E0dNzEp1EB
	3jXrE2aZ2CCwcC7UecGCXT+DCVU9kFb/qz3vy+7Ei/7fPls1KWTtY+NKnP2vkUn5iB/PD0NFdt2
	XaeuhmAF2PUMfzw/PisThL9m8fKbE+CYGHErCW+RZVw==
X-Received: by 2002:a05:6a00:bd0e:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-872372c313emr11817051b3a.5.1789624590920;
        Wed, 16 Sep 2026 22:56:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-872372c313emr11816999b3a.5.1789624590365;
        Wed, 16 Sep 2026 22:56:30 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2f7sm2262500b3a.6.2026.09.16.22.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:56:29 -0700 (PDT)
Message-ID: <dc160a37-5413-4dc0-bda9-ce75c388f665@redhat.com>
Date: Thu, 17 Sep 2026 15:56:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
 <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 86gZ8o4Bl256QPIYgTI6Nk--C478P-7JVRQRnyqRF1M_1789624591
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_225638_060965_6D8456B1 
X-CRM114-Status: GOOD (  18.38  )
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

On 9/16/26 11:34 PM, Andre Przywara wrote:
> On 9/16/26 11:49, Ben Horgan wrote:
>> On 07/09/2026 13:59, Ben Horgan wrote:
>>> On 02/09/2026 15:37, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> This looks good to me. Out of interest what led you to find this?
>>>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>
>> I seem to have been a bit hasty here.
>>
>> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
>> and that the value coming from dt or acpi can provid other valid values that would after this patch
>> be considered invalid.
> 
> Fair, and I can easily change the check to only check explicitly for -1.
> 
> But this is somewhat broken already, right? I mean the return type for the existing get_cpu_cacheinfo_id() has always been "int". It looks like this comes from the x86 world, where the cache IDs never get that large? I can have a deeper look, but my gut feeling is that this is practically irrelevant, since we barely see Aff3 at all, not to mention high values of it.
> 

I guess we also can exploit CACHE_ID flag in struct cacheinfo::attributes.
struct cacheinfo::id is valid only when CACHE_ID flag is set. So we would
introduce our own helper as below, where an extra return value to indicate
the (returned) cached ID is valid or not.

In drivers/resctrl/mpam_internal.h:

/* NULL is returned if struct cacheinfo::attributes don't have CACHE_ID set */
static inline bool mpam_cpu_cache_id(int cpu, int level, unsigned int *id)
{
         struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);

         if (!ci)
                 return false;
         
         if (id)
                 *id = ci->id;
         
         return true;
}

Thanks,
Gavin


