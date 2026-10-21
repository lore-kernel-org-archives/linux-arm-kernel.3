Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=18P8HIV/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ROUpxDbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyRQ78BggroJWNa9YaJncJCpDhOnB5oue8lGhRg38uw=; b=18P8HIV/h6Kt5HJw/DhDksLNVb
	R+WbEqnlwxw7Q8lzOAmlxWiZhkaiLbQL8R5/V9Owfzh3rgYVJMHVhH08c61cPuE6OMfeIICOMGr7D
	WRnTySUTZyUJuJ7Ea8ygN7BJ0tAArxPFY3TnoZrAEUez7TkZcC1BtFB6vOx3N+ewOP/GnLLpvZM+R
	7ePYiHV2UawUSp8c4KhVgcinLMiwhA8UiOlYPfPM08zoLVQIL/BEt8ANuzZqxy2ZasIF2CAhWKIaU
	Q0jMCVJrNJBa6SuJhgOn6PbxTg/D/M/gD6SNE9cUnbq1orxqZzl80oeQ8WmiXY+FcGcC8BfSC59pQ
	Al14RJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJToj-0000000Bdaa-3Tzv;
	Wed, 21 Oct 2026 10:45:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJToh-0000000BdZz-1awy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:45:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E191D16F8;
	Wed, 21 Oct 2026 03:45:02 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13AD03F7D8;
	Wed, 21 Oct 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792579506; bh=nZ42BZQjh4uy5EZzLEdYqHCNeRbeEy9OOB18/q0M518=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROUpxDbwu71P5kfieQdrfW7it2k2Nv6Bk89dy2okv34Ra1vf5eN45Prhjr5xaVk+V
	 yWR0T3p7OKati2Yn2DaWXcx+2TmzHQiJ+lBDTa0AI5cKmGRBd6NbylqjvTUVkn8CcF
	 6lP5BpLxc7Q1qk+T3pNRlvn3WskZU+S3SbRvvjfQ=
Message-ID: <d1efef72-5cd5-41f6-8389-53b62490e4b9@arm.com>
Date: Wed, 21 Oct 2026 11:45:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Andre Przywara <andre.przywara@arm.com>, Ping Li
 <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
 <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034507_508270_5E6EDE86 
X-CRM114-Status: GOOD (  22.99  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

On 21/10/2026 10:26, Andre Przywara wrote:
> Hi,
> 
> On 10/20/26 13:48, Ping Li wrote:
>> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
>> iteration, but the four error paths that return after failed
>> MPAMF_MON_SEL register accesses do so without releasing it.
>>
>> Take the lock with the conditional mon_sel_lock guard class instead,
>> so all exit paths release it.
> 
> many thanks for spotting this!
> 
> Similar lines were in the last patch version sent out, but as Ben mentioned, this somehow conflicted
> with the other MPAM changes, so it got accidentally removed.
> The original version always returned -EIO, but we now always use this error code inside mpam_fb.c

For consistency we should always return -EIO on the locking failure as that's what's done in all the
non-AQUIRE() cases. However, I do think this fix is ok as it is and that at some point down the line
we can update the conditional guard to enforce this.

DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
	     if (_T && !IS_ERR(_T)) mpam_mon_sel_unlock(_T),
	     mpam_mon_sel_lock(msc) ? msc : ERR_PTR(-EIO), struct mpam_msc *msc);
DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);

Thanks,

Ben



> already, so there is no difference, and this version here is more future-proof, should we lift the
> restricted range of errors handled in the future. So:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> Thanks!
> Andre
>>
>> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 48adc49b833c..c067b6d57d71 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>>       struct mpam_class *class = ris->vmsc->comp->class;
>>         for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> -        if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> -            return -EIO;
>> +        ACQUIRE(mon_sel_lock, guard)(msc);
>> +        ret = ACQUIRE_ERR(mon_sel_lock, &guard);
>> +        if (ret)
>> +            return ret;
>>             mbwu_state = &ris->mbwu_state[i];
>>           cfg = &mbwu_state->cfg;
>> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>>           cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>>           mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>>   -        if (!mbwu_state->enabled) {
>> -            mpam_mon_sel_unlock(msc);
>> +        if (!mbwu_state->enabled)
>>               continue;
>> -        }
>>             val = 0;
>>           mbwu_arg = (struct mon_read) {
>> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>>           ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>           if (ret)
>>               return ret;
>> -
>> -        mpam_mon_sel_unlock(msc);
>>       }
>>         return 0;
>>
>> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
> 


