Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A327C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=; b=YzTz9KQypU1aYkkO5rjOmB/Vi9
	gP9zpn6wDIs6M2cCdEQPuXfWq7Nxikbxvba3YMgEMTZS3zhhuegXeCNBplLa9KYg6BPM8S7NwH484
	nC/Bw4L6Oi1xoz/Oi/SF3voF17w94MMR79t0GWrI8pSE+ABHh7S8pb2wLmqDQSKL4F4a2Ce073VCk
	BUFzjcP1N4bDFCK9o5iCPtS291z5POSuPHS9lgZfU4Ccpb/ksHDhYwM8hPbhXKXpuFk0YUGI9LSws
	nvC6iMDjxGDqQz9g6NzEQxULEl+OWwDhnVasZrb+uyAZ+rTSBb6LVn/vZSmrp5rTnrMt/X43dSM0y
	4+eBFgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zxq-00000002QJG-1iME;
	Mon, 14 Sep 2026 06:14:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zxn-00000002QIv-3AkH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789366486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=;
	b=Q+U0hxknzk81zD962ixpY+1GoQUkTgODlIS8nfOPyTjZO49ivthEGhNiXW2+/cABgevKHh
	ZNfRuPoRnsdOvfgfRZ8SZiibq7udRs+GV1N6pChA4ZqJs2OyDkC47KBXVjtDspfbbkkR1c
	5qXGuvf377RrnFPabRLadd+zwTN1FNI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-_M9F1mGxMaul7uU9hEXKVA-1; Mon, 14 Sep 2026 02:14:44 -0400
X-MC-Unique: _M9F1mGxMaul7uU9hEXKVA-1
X-Mimecast-MFC-AGG-ID: _M9F1mGxMaul7uU9hEXKVA_1789366483
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so3354095a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366483; x=1789971283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=;
        b=sfeCTvhWSmqdrWEB3HjXdkcuYFnlqIiNM3IC2iDUUqBDUonVwLh01IlG9EdaiUtj9q
         85m9s1NhOC9zTzkzh3EhUafkFTzcCPfRZPrAoAtvDWE/SC3foVL5K86lqksLgZAZBipU
         LRlUYbXBNRJ/iZneflQcR9R3/xXUmoTPsP2yL7bWhPIRTl9tClYRytyBIoKeM3mP4C9l
         +pCGC36qB58HPDn4/fQhqxEnbuI+UBwWHKFZXszmHsKca1M1O+JjqTkbv7i9qGt4hZNc
         Z8yy8dZbztXXcmZ1Kg20KXb/V7bFNWa51dEcupgFu0YPdjAL4vAgoL8um+0PNAmC+6P+
         fYcA==
X-Forwarded-Encrypted: i=1; AKwUvByYK4aVn4Sj9K0d2udGtxqBAR1PdQwk7hQ0NP9gDbf3Hs4FSzuVAIRzv6qdSsIwhIt1Yd3mWYzEX4NljZw8Y1Y/@lists.infradead.org
X-Gm-Message-State: AFuF++kdVBQRyjBNSsbAxTeFT1obV28j0d+KoA7L5Qah4A5iXwV9ZV8H
	LLaH8G+2rQqPWn5MBlIryg/Ln9I74qCjRzxgM4nZOkaXhetIhWanZ2mxkZJEvTXc2ztP5DD7RCh
	OAbvqhuxUub4sJPQusxl3wbBFIR1YHk9AWCn5XQJIeIPNbc0pLAwXhmVtE0rZgWstyJB2ICv8G2
	Rj
X-Gm-Gg: AYBFou1Jqk83MuCk3uCuXU3ugMHWjX1U/nPteKKCucKLqM77KoOkQnIXoE3kO++b8hv
	HKcVa7E0TskHvY3JEyr+yHRxoH3RVDUUvGiMqS/GGSnZ1s5e75IfB8NwXJhQ41/+AwuAdTjAZQ8
	BrwZms1TYwGP0HlPCM3031nt6RaTxegv7VJ8ho7zRUxU1GhJyeSNJ7Qcnt43giyBhRrQlyvZ+YY
	3MeqpuHSJUwKlUQRCobf3NnhJ4vqrgZGfY+mUEq8ma7uqSMnB6hdvEthzAjs8NUPTrba294yAFh
	/HFTV8Lsjse7mVM7ebRMdjgw/5xuI/xUJwThycYze1WooVrd/cGqk6fn5V0h380LG2+uyg5hQSZ
	yT9iR0ZqpuEDlGiKlpV3dbxKmJWsEJPw3CPg2Va1pWQ==
X-Received: by 2002:a05:6a20:7283:b0:3da:d45b:3930 with SMTP id adf61e73a8af0-3db4047e387mr1757616637.3.1789366483426;
        Sun, 13 Sep 2026 23:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3da:d45b:3930 with SMTP id adf61e73a8af0-3db4047e387mr1757559637.3.1789366482958;
        Sun, 13 Sep 2026 23:14:42 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab0dsm4311139a12.6.2026.09.13.23.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:14:42 -0700 (PDT)
Message-ID: <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
Date: Mon, 14 Sep 2026 16:14:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QHysZv6mf1ZLffPbL_YUU8_SlJpKn6n5s0ShqWM5_nA_1789366483
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_231447_879164_0268AEF5 
X-CRM114-Status: GOOD (  19.28  )
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

On 9/3/26 12:37 AM, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>   /* Find the L3 cache that has affinity with this CPU */
>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>   {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>   
>   	lockdep_assert_cpus_held();
>   

find_l3_equivalent_bitmask() passes @cache_id to find_l3_equivalent_bitmask() as
a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly related
to this patch though.

int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);

can be:

int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);

Thanks,
Gavin


