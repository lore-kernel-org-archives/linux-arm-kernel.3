Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rwgxvSnprGAWf9EWr8JWBIb6a2h9+ICZqB+OetoyQc=; b=J9EsRpk+WK/6atpzFz7oSriMHo
	DdH9DsoURWtozon/tpA84/smbs214VeRI65rmgveuYVlmRODnp6rcV2xwKHgp9jzDp4nT6RIuF06W
	HWShzi21turhvcdzQNKt4yWG0lBoRupU8atmh9o5FLyfcH/QL4/BNIJ3rk2en0einvKkYmwXAqk6/
	e8qJ2QVbuu5WGKN10gFGlymJ0DF3IMu++RcFHR1qdypChKYmW6Tkc1ZS8sLSiVi9k9f/owkaq+l2s
	zD9XeDdVJYY/wkagPouP821wJQIvYrezUCPxK04MyiWSI5L1NgMV8z2zSkEigXno0uQz2V55hT6ja
	jItrbjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHft-0000000GmFK-0Mt5;
	Thu, 16 Jul 2026 08:42:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHfq-0000000GmEu-1VAr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 08:42:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF4C8339;
	Thu, 16 Jul 2026 01:42:24 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE8D53F7B4;
	Thu, 16 Jul 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784191348; bh=AkwPQwean6bJOLieEq5NCfM20lWebUz2uC3qETyOcvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o11U1Etg0MT7MzmigGKzPHOk8/Abs4lqfkEwGaDptWAWhO9fFwb3ADmFvpv+YOJ93
	 IxZn93adAI0GhCveDZb2RsxMijGjp2IDYkQiBxGcwyukDuocrB5nrROh9wxXhA6Bnz
	 cdKNBUyYYPN6/mANS6tBUos752Aug+zr/kCtAg/c=
Message-ID: <4e911af5-1604-4cf4-8a1d-1ec59bbb7939@arm.com>
Date: Thu, 16 Jul 2026 09:42:23 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 06/16] arm_mpam: propagate MSC read errors for
 __ris_msmon_read()
To: Lee Trager <lee@trager.us>, Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-7-andre.przywara@arm.com>
 <673b79c0-d2e6-44a6-a1a8-a2ff92f2ff53@trager.us>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <673b79c0-d2e6-44a6-a1a8-a2ff92f2ff53@trager.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_014230_471026_C542EC3E 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Lee,

On 7/15/26 20:52, Lee Trager wrote:
> On 7/10/26 7:45 AM, Andre Przywara wrote:
> 
>> @@ -1748,6 +1758,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>>   {
>>       int i;
>>       u64 val;
>> +    int ret = 0;
>>       struct mon_read mwbu_arg;
>>       struct mpam_msc_ris *ris = _ris;
>>       struct mpam_class *class = ris->vmsc->comp->class;
>> @@ -1760,10 +1771,14 @@ static int mpam_restore_mbwu_state(void *_ris)
>>               mwbu_arg.val = &val;
>>                 __ris_msmon_read(&mwbu_arg);
>> +            if (mwbu_arg.err) {
>> +                ret = mwbu_arg.err;
>> +                break;
>> +            }
>>           }
>>       }
>>   -    return 0;
>> +    return ret;
>>   }
>>     /* Call with MSC cfg_lock held */
> 
> 
> mwbu_arg is never initialized and __ris_msmon_read() only writes ->err on failure. If on a
> successful read mwb_arg.err tests stack garbage it can spuriously break ot of the loop, leaving the
> remaining monitors unrestored, and return a junk error code.
> 
> Setting `struct mon_read mwbu_arg = {};` matches what mpam_msmon_read() already does. Additionally
> val should be initialized to 0 too. __ris_msmon_reaD() does *m->val += now, and although the result
> is discarded here, KMSAN would flag the uninitialized read.
> 

Thanks for the bug report.

I have a proposed change here which aims to address this existing issue, [1]. Please could you check
and confirm whether this fixes the problem.

[1] https://lore.kernel.org/lkml/20260710115546.29644-8-ben.horgan@arm.com/

Thanks,

Ben

