Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95551CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc1Gm34EqV2pA6dA1kPjeED+FPxVyOiLoKM7TQSipKQ=; b=E5ik6QOt+60AjJnZwZzqPXa6Db
	MiyjUOwfRLyRboDoIM/dB4/w/ymOn3K/dUriOBctLKd4yX9UwLY3JU32ZvPAQYvhGx/yOs1qI5WnL
	Ww8FNJicuhXnU1oKpPRNm/qVOJ6sJjVooONF6UbxIRUIno9zLDkcpHSzTm/rX9aP3Yc96i8aJEMYH
	izkyXvUQDbD/26x/W52HTJs948aMVucdUdNULAde+Kp1jrYqjobFRkbjYAeWNzdOzxX04BzOo8LFS
	71jH5bDsopJzF6onGTI910EaJ47QkOOo8QuxBz45u1cryjwWpY3VMmYDOz7gepNby2qF92aFJdl0H
	aO7ktoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHVi-0000000AkJT-201y;
	Mon, 12 Oct 2026 15:00:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHVf-0000000AkHc-3yUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:00:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2F87169E;
	Mon, 12 Oct 2026 08:00:10 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 337CB3F673;
	Mon, 12 Oct 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791817214; bh=8NtkGDoD0oacwDzS0CgSBoq15Z6lRUN/PdlItQmGmFE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dc17l/GJ2ZpY749n5DOcZCH2iM6lV1y9aoppvsDsDO5Q3t96BV7ZQtONgXUrJ94GL
	 HRjhJjGJmEhaMn8IWNsl1H9tHqrIBVlwoZlhpbAh5RHuocxcRON/RE8au0oHu6xxQ/
	 W3zXbdIDQR7XzPffNpuU8CNM5FDlBL3Fhn3Gm8uI=
Message-ID: <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>
Date: Mon, 12 Oct 2026 16:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
From: Ben Horgan <ben.horgan@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: andre.przywara@arm.com, bot@kernelci.org, fenghuay@nvidia.com,
 gshan@redhat.com, james.morse@arm.com, jonathan.cameron@oss.qualcomm.com,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com,
 nathan@kernel.org, ndesaulniers@google.com, reinette.chatre@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
 <20261009163235.3-1-sashal@kernel.org>
 <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
Content-Language: en-US
In-Reply-To: <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_080016_159939_1D55418E 
X-CRM114-Status: GOOD (  18.51  )
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

+CC: Catalin, Will

Hi Catalin,

This is the clang build fix I mentioned. Just adding a note here as I missed to CC you before.

Thanks,
Ben

On 09/10/2026 17:59, Ben Horgan wrote:
> Hi Sasha,
> 
> On 10/9/26 17:32, Sasha Levin wrote:
>> Building arm64 allmodconfig with clang fails:
>>
>>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>>   of function declared with 'warn_unused_result' attribute
>>   [-Werror,-Wunused-result]
>>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
>>
>> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
>> through the MPAM-Fb firmware interface it returns false when called
>> from a context that cannot sleep. The mon_sel guard was defined with
>> DEFINE_GUARD(), which calls it unconditionally and discards the
>> result, so a guard(mon_sel) user would carry on without the lock and
>> release it on scope exit. The unconditional guard only exists as the
>> base for the conditional mon_sel_lock variant, which is the one
>> actually used.
>>
>> Define mon_sel_lock directly as a conditional guard class instead, as
>> posix-timers does for lock_timer: the constructor returns NULL when
>> the lock cannot be taken, and the destructor only releases a lock
>> that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
>> ACQUIRE_ERR() returning -EBUSY on failure, and there is no
>> unconditional variant left to misuse.
>>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>> Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
>> Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
>> Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
>> Assisted-by: LLM
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> Looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Thanks,
> 
> Ben
> 
>> ---
>> Changes in v2:
>> - Use an if statement in the destructor, as suggested by Ben Horgan.
>>
>>  drivers/resctrl/mpam_internal.h | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index ee7c3953a9b6c..1f86cc158100b 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>>  	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>>  }
>>  
>> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
>> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
>> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
>> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
>> +	     if (_T) mpam_mon_sel_unlock(_T),
>> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
>> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
>>  
>>  /* Bits for mpam features bitmaps */
>>  enum mpam_device_features {
> 


