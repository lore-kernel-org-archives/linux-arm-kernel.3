Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70535CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg9UIxtat/KHhFLBWuDokF+fLhHlfQUuBnNc+P1M2II=; b=nhtGwwNMH7YGwS7S1pzxXEpRUL
	M9gRpUawp4OA94W2Zm191oqfEQhi74g+HA0g27pWDvLf3sc4ZlRG/Fwdme20iPXnRkZePVQdMRbLm
	i1qgtsaOSyAsNV0vtcsLhsuXZHRH7V+ZSkU4EQ+HQl3HTBLbw/Wl1Is8OcuCKLOFKdzT/XA1Qx0nX
	0qERFDQVGJxqwi9hqxDt06kNdwkpM1ffHoQ5V3tk1Nnwp6ofujSe6yuaveGrQvTj1Iuw3FtJOxBmN
	VrCEWhHI9X8v1mEdtO5UTbU99zAbPK0NpyMJQr9GoWYuYmIb9vE5wTI4lXJFkCwZe2BGvvZ7tFn/x
	SsUVnRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZW0-000000069Rf-0DLb;
	Thu, 14 May 2026 17:06:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZVy-000000069Qx-0Gtz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:06:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50B9B2576;
	Thu, 14 May 2026 10:06:19 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51F33F836;
	Thu, 14 May 2026 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778778384; bh=ENKOlrf1bPvSzhWcRcK3QmmfRthDL8G7gm8zFoEiIAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qpigc/8r4y4RPNauKiUfaY4xwBCkD1TmTro3mJBVGxVvx2F+kQdh9xE+Fafxb3o63
	 zV2Ovw41NiJb5d+eNm1o5LNwO46EIcR5Ha1BNCZRUkceSzU5xpvgwpcn0fd//jLool
	 Gjpnrxz3/RhWSt7eiP4cZqrbGuuEgO9gJl8EgA0E=
Message-ID: <0efe369b-8a01-45b1-bd0f-4fdd4ebbb18a@arm.com>
Date: Thu, 14 May 2026 18:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 next 01/10] fs/resctrl: Fix MPAM Partid parsing errors
 by preserving CDP state during umount
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-2-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260413085405.1166412-2-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_100626_237687_225FA4C2 
X-CRM114-Status: GOOD (  21.62  )
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

Hi Zeng,

I think this should be a separate patch as its fixing a problem not adding a feature. It's
not actually relevant to the rest of the series.

On 13/04/2026 09:53, Zeng Heng wrote:
> This patch fixes a pre-existing issue in the resctrl filesystem teardown
> sequence where premature clearing of cdp_enabled could lead to MPAM Partid
> parsing errors.

resctrl changes need to go via tip, which has a bunch of rules about commit messages,
see Documentation/process/maintainer-tip.rst

You end up with a structure describing the current state, e.g:
| When resctrl is umounted it disables CDP,

what the problem is, e.g:
| CLOSID remain in the limbo list, and the mbm monitors continue to be read
| after umount. MPAM changes the meaning of CLOSID when CDP is enabled/disabled,
| resulting in out of bounds accesses.

Then, what you do about it, here you are:
| Throwing away the limbo list on umount.

(I don't suggest you take this wording - its just an example)

"this patch" is a phrase to avoid, acronyms like CLOSID need capitalising, etc.


> The closid to partid conversion logic inherently depends on the global
> cdp_enabled state. However, rdt_disable_ctx() clears this flag early in
> the umount path, while free_rmid() operations will reference after that.
> This creates a window where partid parsing operates with inconsistent CDP
> state, potentially makes monitor reads with wrong partid mapping.
> 
> Additionally, rmid_entry remaining in limbo between mount sessions may
> trigger potential partid out-of-range errors, leading to MPAM fault
> interrupts and subsequent MPAM disablement.

Can you give more details on this. I assume its going from CDP-disable to
enabled, means MPAM doubles the CLOSID from the stale limbo list, making it
out of range.


> Reorder rdt_kill_sb() to delay rdt_disable_ctx() until after
> rmdir_all_sub() and resctrl_fs_teardown() complete. This ensures
> all rmid-related operations finish with correct CDP state.


> Introduce rdt_flush_limbo() to flush and cancel limbo work before the
> filesystem teardown completes.

So, discard the state in the hope we don't need it again.
What happens if the filesystem is mounted again quickly afterwards?
Surely we get noisy bandwidth results for ~minutes afterwards?


> An alternative approach would be to cancel limbo work on umount

Sounds like a move in the right direction - having bits of resctrl still
taking CPU time when its not in use is surprising.

I'd love to eventually remove the limbo worker and have the RMID alloc code
search the limbo list for a clean RMID when a control/monitor group is created.
By deferring the work as late as possible, we do less work overall.


> and restart it on remount with remaked bitmap.
> However, this would require substantial changes in the resctrl layer to
> handle CDP state transitions across mount sessions,

This would be necessary if the limbo timer was stopped on umount too.
It also covers cases where you kexec and re-mount resctrl.

I think this is a good idea. I agree its more work.


> which is beyond the
> scope of the reqpartid feature work this patchset focuses on.

Was it a mistake to include it in this series then?


> The current
> fix addresses the immediate correctness issue with minimal churn.

I'm not a fan of papering over problems in resctrl. Could we do it properly
by rebuilding the limbo list at mount time as you suggested above?



Thanks,

James

