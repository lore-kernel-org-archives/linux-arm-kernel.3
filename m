Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C32CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:To:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H7YkDeOWhZXlAgbp0NpKJaDQiY0Hatoq6Pxr37YFgk=; b=fp77+wz01XOSLsWoGnucQ73qn/
	wGOLpQmI/EDl6zzzDKJJxZrYJUAhexeFPW12GJ2UvPPgtSZokOZmGwo+hcN+ChoDbvdkrqCpWVRiU
	kilmo/2un/i8XmqZRSu3qfJJVmySvExbZomgDpiDFOwmv46fwbtTUtJEUPh4N1HUQDAdYnj43f1hU
	/YV6LPuKfMWxlZRjfrXxC+6xkfjyufiURL46nKP4JRoqTmLpncPayVIfpCHAcNE3qzu+6AI2oolft
	ssD5477DTsV95ge7TGOGxz2s1TGndkI8gcU9y8BpsdNacR9dZGie+S+gbhWIwUkLgYJ51gjaVJrrK
	D9dG8iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg2u-00000004YuA-2QHf;
	Wed, 20 May 2026 12:29:08 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg2q-00000004YtT-0sAu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:29:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gL9nZ4RCyzKHMSp
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 20:28:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 133E240570
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 20:28:54 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgAn71oBqQ1qIvH2Cw--.8428S3;
	Wed, 20 May 2026 20:28:51 +0800 (CST)
Message-ID: <61d30703-c737-4e66-bf96-68524904f37e@huaweicloud.com>
Date: Wed, 20 May 2026 20:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v8 next 01/10] fs/resctrl: Fix MPAM Partid parsing errors by
 preserving CDP state during umount
Content-Language: en-US
References: <c6b77292-4ac4-189f-66f6-300e03440788@huawei.com>
To: James Morse <james.morse@arm.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <c6b77292-4ac4-189f-66f6-300e03440788@huawei.com>
X-Forwarded-Message-Id: <c6b77292-4ac4-189f-66f6-300e03440788@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgAn71oBqQ1qIvH2Cw--.8428S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw48tw18Aw45KFW5JF17trb_yoWrAr4xpr
	WSgayakr4DXFyjkrs2vFyUZFWFvrZ3ZFZ8Jr15GrZ8A3s8ZryIgFWxKayruFZxurykC3WY
	vr48KFyDZr4DZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUsWSoDUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_052904_604316_52662346 
X-CRM114-Status: GOOD (  35.55  )
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


