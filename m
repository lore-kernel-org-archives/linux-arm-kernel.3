Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6313ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhqR4cB2DTQTU2kVSYhK9MPXysPRwvenM4w/6aZJGls=; b=4e13rumjl1oKD5Ewlv7GFa5Uds
	VCjiduaBN5ASEXJOgGDJASC3XX+DeMMH4lz2WEQ15GbwzaAJv2cAVZNcQvUqCT+3UnNGnX3r5Oe+s
	DtvD8xjnzvjZfoh0kHWUsGUeN+ZmPI1zFu3ur4vPXgPLr9+2NTGBiTcICnKUesuFFc6oK2ueYoGH+
	TRkOcv/rfPwSeD5xe6omW6EKjPj/acQ4jcpcJVLfB26GzFlQBI1OA1z6oWav9DaTcQTRlm9wliPdn
	xGqKgwCMrAr0HOjOx2x4MPrG3ttyraBRwl2isYWOnu4JmmpowM0C/rEgpvbtn6vge5h7pLo46+7oy
	fY6qlFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvleq-000000033Nn-45Vz;
	Mon, 08 Sep 2025 23:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvg8Z-00000001MsH-3PnE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:58:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8C621692;
	Mon,  8 Sep 2025 10:58:34 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E47D3F694;
	Mon,  8 Sep 2025 10:58:36 -0700 (PDT)
Message-ID: <4ef6d9d0-cebc-4b51-a200-8b1c395030e4@arm.com>
Date: Mon, 8 Sep 2025 18:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] arm_mpam: Add cpuhp callbacks to probe MSC hardware
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-15-james.morse@arm.com>
 <CAL_JsqK5HZdyq_6rQibtmDE_H=gy+3aeCSCioA5MHR5+Gh_drQ@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_JsqK5HZdyq_6rQibtmDE_H=gy+3aeCSCioA5MHR5+Gh_drQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_105843_939209_558EA7AC 
X-CRM114-Status: GOOD (  26.00  )
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

Hi Rob,

On 27/08/2025 17:08, Rob Herring wrote:
> On Fri, Aug 22, 2025 at 10:32 AM James Morse <james.morse@arm.com> wrote:
>>
>> Because an MSC can only by accessed from the CPUs in its cpu-affinity
>> set we need to be running on one of those CPUs to probe the MSC
>> hardware.
>>
>> Do this work in the cpuhp callback. Probing the hardware will only
>> happen before MPAM is enabled, walk all the MSCs and probe those we can
>> reach that haven't already been probed.
>>
>> Later once MPAM is enabled, this cpuhp callback will be replaced by
>> one that avoids the global list.
>>
>> Enabling a static key will also take the cpuhp lock, so can't be done
>> from the cpuhp callback. Whenever a new MSC has been probed schedule
>> work to test if all the MSCs have now been probed.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 5baf2a8786fb..9d6516f98acf 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -78,6 +90,22 @@ LIST_HEAD(mpam_classes);
>>  /* List of all objects that can be free()d after synchronise_srcu() */
>>  static LLIST_HEAD(mpam_garbage);
>>
>> +static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
>> +{
>> +       WARN_ON_ONCE(reg > msc->mapped_hwpage_sz);
>> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> 
> These either make __mpam_read_reg uninlined or add 2 checks to every
> register read. Neither seems very good.

The mapping-bounds one is from before the ACPI table had the size of the mapping. I can
remove that one now.

The accessibility one really needs checking as getting this wrong will only occasionally
cause a deadlock if you get unlucky with power-management. I don't think we'd ever manage
to debug that, hence the check. The server platforms we'll see first aren't going to
bother with PSCI CPU_SUSPEND - but mobile devices will.

If the compiler choses not to inline this, I'm fine with that. Accesses to the device
mapped configuration are rare, and always via a resctrl filesystem access. I don't think
the performance matters.


>> +
>> +       return readl_relaxed(msc->mapped_hwpage + reg);
>> +}
>> +
>> +static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
>> +{
>> +       lockdep_assert_held_once(&msc->part_sel_lock);
> 
> Similar thing here.

If don't build with lockdep this costs you nothing.


>> +       return __mpam_read_reg(msc, reg);
>> +}
>> +
>> +#define mpam_read_partsel_reg(msc, reg)        _mpam_read_partsel_reg(msc, MPAMF_##reg)
>> +
>>  #define init_garbage(x)        init_llist_node(&(x)->garbage.llist)
>>
>>  static struct mpam_vmsc *
>> @@ -511,9 +539,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>         return err;
>>  }
>>
>> -static void mpam_discovery_complete(void)
> 
> It is annoying to review things which disappear in later patches...

It's a printk - its purpose was to show something happens once all the MSC have been
probed. That was supposed to make it easier to review as it has always has this shape from
the beginning. This patch adds the hardware accesses that do the probing, which happen
from cpuhp calls - which in turn moves this 'complete' work to be scheduled.
As this seems to be causing confusion I'll inline it so it doesn't look strange.


>> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
>> +{
>> +       u64 idr;
>> +       int err;
>> +
>> +       lockdep_assert_held(&msc->probe_lock);
>> +
>> +       mutex_lock(&msc->part_sel_lock);
>> +       idr = mpam_read_partsel_reg(msc, AIDR);
> 
> I don't think AIDR access depends on PART_SEL.

It doesn't, but as most registers do, it was just simpler to pretend it does.

I'll shove the __version in here instead, which will save taking the lock.


>> +       if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
>> +               pr_err_once("%s does not match MPAM architecture v1.x\n",
>> +                           dev_name(&msc->pdev->dev));
>> +               err = -EIO;
>> +       } else {
>> +               msc->probed = true;
>> +               err = 0;
>> +       }
>> +       mutex_unlock(&msc->part_sel_lock);
>> +
>> +       return err;
>> +}

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 6e0982a1a9ac..a98cca08a2ef 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -59,14 +60,14 @@ struct mpam_msc {
>>          * part_sel_lock protects access to the MSC hardware registers that are
>>          * affected by MPAMCFG_PART_SEL. (including the ID registers that vary
>>          * by RIS).
>> -        * If needed, take msc->lock first.
>> +        * If needed, take msc->probe_lock first.
> 
> Humm. I think this belongs in patch 10.

Yup, fixed.


Thanks,

James

