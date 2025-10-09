Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE512CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n//7VcZ/aKNBPnFMsyrQSNmvd7nLPUVCLsIiQJrqXU=; b=F3TFXfzN0Nxw4fcGFEpXVLKWzr
	SScEqkCqEs/Hsc/2SOjV3tkeHsncgtVDvd/EkjXbu3npL+/7O98E+hYJpnKNzaBkioOdqK2hVzXqL
	1wTRXQUWUswfpsxybWfVJr42gvLd2xdGChMoxFkYXAeESWfIK15+gaAS5wzmxr0EYK2No1BD1oQFJ
	rkSrd4LqkXcpbGfsQhYOcbfQoOmqTBFjwqjR7GIBYlfhJ0zk0cxIlGYZ/DQdJ518YnHbgZx7zKnYa
	g0KN3V/7cdExoxURXA7nsy9dWWvGSIf5I4E2S9JxJnHPkY+8zbnaWJ/rwLLM8ZFQ+mmW3iEEr6tPK
	N/Qat+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ulH-00000006qDX-3yHu;
	Thu, 09 Oct 2025 17:49:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ulF-00000006qCf-2GiR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 17:49:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0DA51762;
	Thu,  9 Oct 2025 10:48:56 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D06373F66E;
	Thu,  9 Oct 2025 10:48:59 -0700 (PDT)
Message-ID: <2e9ba7d2-1ecb-4573-87ec-812c7bac89e4@arm.com>
Date: Thu, 9 Oct 2025 18:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/29] arm_mpam: Add mpam_msmon_read() to read monitor
 value
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-24-james.morse@arm.com>
 <74afb5d1-850c-4e30-a9bb-9903a5193280@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <74afb5d1-850c-4e30-a9bb-9903a5193280@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_104905_655127_34E11C5C 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Fenghua,

On 25/09/2025 03:30, Fenghua Yu wrote:
> On 9/10/25 13:43, James Morse wrote:
>> Reading a monitor involves configuring what you want to monitor, and
>> reading the value. Components made up of multiple MSC may need values
>> from each MSC. MSCs may take time to configure, returning 'not ready'.
>> The maximum 'not ready' time should have been provided by firmware.
>>
>> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
>> not ready, then wait the full timeout value before trying again.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index cf190f896de1..1543c33c5d6a 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -898,6 +898,232 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)

>> +static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>> +{
>> +    int err, idx;

> Can err be initialized to some error code e.g. -ENODEV?

Feedback from Jonathan has led to numerous changes here.


>> +    struct mpam_msc *msc;
>> +    struct mpam_vmsc *vmsc;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    idx = srcu_read_lock(&mpam_srcu);
>> +    list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
>> +        msc = vmsc->msc;
>> +
>> +        list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
>> +            arg->ris = ris;
>> +
>> +            err = smp_call_function_any(&msc->accessibility,
>> +                            __ris_msmon_read, arg,
>> +                            true);
>> +            if (!err && arg->err)
>> +                err = arg->err;
>> +            if (err)
>> +                break;
>> +        }
>> +        if (err)
>> +            break;
>> +    }
> 
> comp->vmsc or vmsc->ris usually are not empty. But in some condition, they can be empty.

Really? There is no call to create a VMSC - only to create a RIS with a set of ids. If you
provide an ID for a VMSC that doesn't exist yet - it gets created for the RIS to be added to.

There was some defensive programming earlier, (and a comment that said it wasn't
possible). That was some left over debug.


> In that case, uninitialized err value may cause unexpected behavior for the callers.
> 
> So it's better to initialize err to avoid any complexity.

Not complexity - the risk is returning an uninitialised value.

After Jonathan's feedback, and my guess at to what Zheng is seeing, it looks like this:
----------%<----------
static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
{
	int err,  any_err = 0;
	struct mpam_vmsc *vmsc;

	guard(srcu)(&mpam_srcu);
	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
				 srcu_read_lock_held(&mpam_srcu)) {
		struct mpam_msc *msc = vmsc->msc;
		struct mpam_msc_ris *ris;

		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
					 srcu_read_lock_held(&mpam_srcu)) {
			arg->ris = ris;

			err = smp_call_function_any(&msc->accessibility,
						    __ris_msmon_read, arg,
						    true);
			if (!err && arg->err)
				err = arg->err;

			/*
			 * Save one error to be returned to the caller, but
			 * keep reading counters so that get reprogrammed. On
			 * platforms with NRDY this lets us wait once.
			 */
			if (err)
				any_err = err;
		}
	}

	return any_err;
}
----------%<----------


>> +    srcu_read_unlock(&mpam_srcu, idx);
>> +
>> +    return err;
>> +}


Thanks,

James

