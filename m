Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H7YkDeOWhZXlAgbp0NpKJaDQiY0Hatoq6Pxr37YFgk=; b=ECi3ruVilIi3sekARbFY27FeFh
	7F+n9XOHTF3315J58v1dd4qxM+mbZPcHz5x1RJPt1H/dzXhANH4mKX+X1nGPekxczvYUhiO0sxXN9
	6WuUXBB4OlKdVN3v89YoetKamwTbjP3TItHa5xBVrk7bCYL41Pz4/YiPLPq+a+b6VpjDpN9hajFq0
	hw1fkAZOwCOj+uELEtoYBy36+3UJGadgL7tK65vlUQpoTFZ/tXfe+OL9ALlw5GEWiNedOEX1L1oOn
	VLOwDlHDJM2D4gBqT4PgLot2G8ACKYHkJElzPoo33Weuz+f1DYz2lDCyDWAymBjBSRbhYu+OsT9bK
	m/+iayJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfqu-00000004XJ5-2zLm;
	Wed, 20 May 2026 12:16:44 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfqq-00000004XHv-3ecx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:16:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/H7YkDeOWhZXlAgbp0NpKJaDQiY0Hatoq6Pxr37YFgk=;
	b=gsFILtf/xlSSSXI76TAyq6KUO/L17BBUyEv1ooXqkqGKJuKgdyGDrqu+c9kmvjgHPW3WmGOfT
	GzAdItPMrNxTY0BEP2YmBxQGIVnHk2ZqTxUhgF1O7IAEqd90qUsakeEtA0M32Js2ubQHRyw9nfh
	82lRhhvN1zbMdxEfMHg/i9w=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gL9LG05Z8zKm9V;
	Wed, 20 May 2026 20:08:38 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id E0C444056E;
	Wed, 20 May 2026 20:16:21 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 20 May 2026 20:16:20 +0800
Message-ID: <c6b77292-4ac4-189f-66f6-300e03440788@huawei.com>
Date: Wed, 20 May 2026 20:16:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 01/10] fs/resctrl: Fix MPAM Partid parsing errors
 by preserving CDP state during umount
Content-Language: en-US
To: James Morse <james.morse@arm.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <tan.shaopeng@jp.fujitsu.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tglx@kernel.org>,
	<will@kernel.org>, <hpa@zytor.com>, <bp@alien8.de>, <babu.moger@amd.com>,
	<dave.hansen@linux.intel.com>, <mingo@redhat.com>, <tony.luck@intel.com>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-2-zengheng4@huawei.com>
 <0efe369b-8a01-45b1-bd0f-4fdd4ebbb18a@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <0efe369b-8a01-45b1-bd0f-4fdd4ebbb18a@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_051641_540746_3B67AC69 
X-CRM114-Status: GOOD (  34.53  )
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

Hi James,

On 2026/5/15 1:06, James Morse wrote:
> Hi Zeng,
> 
> I think this should be a separate patch as its fixing a problem not adding a feature. It's
> not actually relevant to the rest of the series.
> 

The intention behind this fix is that reqPARTID would end up the same as
the original PARTID, because the conversion between RMID and reqPARTID
relies on the `cdp_enabled` variable. Hence, I attempted to also
resolve this existing problem with the patch.

> On 13/04/2026 09:53, Zeng Heng wrote:
>> This patch fixes a pre-existing issue in the resctrl filesystem teardown
>> sequence where premature clearing of cdp_enabled could lead to MPAM Partid
>> parsing errors.
> 
> resctrl changes need to go via tip, which has a bunch of rules about commit messages,
> see Documentation/process/maintainer-tip.rst
> 
> You end up with a structure describing the current state, e.g:
> | When resctrl is umounted it disables CDP,
> 
> what the problem is, e.g:
> | CLOSID remain in the limbo list, and the mbm monitors continue to be read
> | after umount. MPAM changes the meaning of CLOSID when CDP is enabled/disabled,
> | resulting in out of bounds accesses.
> 
> Then, what you do about it, here you are:
> | Throwing away the limbo list on umount.
> 
> (I don't suggest you take this wording - its just an example)
> 
> "this patch" is a phrase to avoid, acronyms like CLOSID need capitalising, etc.
> 

Thanks for the details, I'll rework the commit to follow these
guidelines.

> 
>> The closid to partid conversion logic inherently depends on the global
>> cdp_enabled state. However, rdt_disable_ctx() clears this flag early in
>> the umount path, while free_rmid() operations will reference after that.
>> This creates a window where partid parsing operates with inconsistent CDP
>> state, potentially makes monitor reads with wrong partid mapping.
>>
>> Additionally, rmid_entry remaining in limbo between mount sessions may
>> trigger potential partid out-of-range errors, leading to MPAM fault
>> interrupts and subsequent MPAM disablement.
> 
> Can you give more details on this. I assume its going from CDP-disable to
> enabled, means MPAM doubles the CLOSID from the stale limbo list, making it
> out of range.
> 

Get it, I would explain that.

> 
>> Reorder rdt_kill_sb() to delay rdt_disable_ctx() until after
>> rmdir_all_sub() and resctrl_fs_teardown() complete. This ensures
>> all rmid-related operations finish with correct CDP state.
> 
> 
>> Introduce rdt_flush_limbo() to flush and cancel limbo work before the
>> filesystem teardown completes.
> 
> So, discard the state in the hope we don't need it again.
> What happens if the filesystem is mounted again quickly afterwards?
> Surely we get noisy bandwidth results for ~minutes afterwards?
> 
> 
>> An alternative approach would be to cancel limbo work on umount
> 
> Sounds like a move in the right direction - having bits of resctrl still
> taking CPU time when its not in use is surprising.
> 
> I'd love to eventually remove the limbo worker and have the RMID alloc code
> search the limbo list for a clean RMID when a control/monitor group is created.
> By deferring the work as late as possible, we do less work overall.
> 
> 
>> and restart it on remount with remaked bitmap.
>> However, this would require substantial changes in the resctrl layer to
>> handle CDP state transitions across mount sessions,
> 
> This would be necessary if the limbo timer was stopped on umount too.
> It also covers cases where you kexec and re-mount resctrl.
> 
> I think this is a good idea. I agree its more work.
> 
> 
>> which is beyond the
>> scope of the reqpartid feature work this patchset focuses on.
> 
> Was it a mistake to include it in this series then?
> 
> 
>> The current
>> fix addresses the immediate correctness issue with minimal churn.
> 
> I'm not a fan of papering over problems in resctrl. Could we do it properly
> by rebuilding the limbo list at mount time as you suggested above?
> 
> 

I discussed this with Ben earlier, and the remake bitmap approach was
actually his proposal:
https://lore.kernel.org/all/b95077d7-c036-4a8f-8e42-8f1dc0288075@arm.com/


Best regards,
Zeng Heng

