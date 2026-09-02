Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14306C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh0jUY/UkhTVKIwfR038cHyUmi536MDRjqIhfBHdV9Y=; b=FlFEoRePIVwg3XjI3LIK2mZDPY
	X2sChkWP7MEmUKM+2WUxcJq0IN+MA+XY99jr9W4KdXKxXfy2IHFRr5QgHyx4Ccb47b1gb+p16YbjJ
	3bR4W4IRE2CdNwdjX2w9yB6rS21Eumi4LG36UKTL7QLsiUySKP+1EZZ1Uoy/KOiQCVdETB8OeeZ/n
	yqFFvZQ8659m1/Q9ICP73HFH6osaLk3v26Uk5GCOnA5rTMSqmFusTmwE1AEOnxiSahAjLfzCVY6RI
	8w/1QCwy/PKqaUSQs34PelAWLMYviPRK0B1veyTAzBtkLiaXKXY/NVsAoUjRSNmGlHMuquPKaArWu
	AlSLYxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lbW-0000000EtLu-3RI2;
	Wed, 02 Sep 2026 14:06:18 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lbU-0000000EtLA-1zGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357974; bh=Yh0jUY/UkhTVKIwfR038cHy
	Umi536MDRjqIhfBHdV9Y=; b=kEApHB3L3c/2qU7Q4iTJk1lqcnvdFlaCI2FzwKYIgUUiq8y9Yv
	d71Wynez6A7XQlCwi13FIFsvXC5ui+VYstPiyzkZ0ED9A+sME9W4rJYsTd/DVexZcX+eAfLH2bX
	JlKcE2wtN1QhXIpuxmfXaO+Ev13m7TupHejZ5Ni0gds863Fx0KM1tsrysWG3Ri0vu0wPadJVOyH
	3QkBUIZs0dU/ddjEAgzGsEH6fgFsWaehE5Iwa0RyKnfs7IYD7ipuwcvShKAxXJlL7lIJ5Kql8nn
	nsZPLYj8m5W+cyHqVhQKg8MpZOsxv1zHM/VFVVMUj1vaBiuK3JVxMNWuU1ysC7aGd9Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357974; bh=Yh0jUY/UkhTVKIwfR038cHy
	Umi536MDRjqIhfBHdV9Y=; b=SjnLnZzJB5zntGpbKnTzVZ8PAALKCHQGdxUjt9BZddML87CET/
	LNhOo5CqaDZr8KNMlO9ePlKzdptTqczXDxBw==;
Date: Wed, 02 Sep 2026 15:06:12 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com> <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org> <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <8294D170-3378-4411-8771-CB7D9ACBC38E@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070616_664645_6950104F 
X-CRM114-Status: GOOD (  24.86  )
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

On 2 September 2026 15:03:07 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
>> On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
>> wrote:
>> >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
>> >> This comes out of the hibernate resume discussion where Will asked if
>> >> the restored kernel's hyp vectors are reinstalled before we come back
>> >> from swsusp_arch_suspend() and free the reserved pages. Rather than
>> >> answer with a one off fix, this series reworks resume to look like a
>> >> resume from idle, which makes the answer fall out on its own.
>> >> 
>> >> The series leans on Mark Rutland's old work for inspiration, he had
>the
>> >> same end goal in a branch from back then:
>> >> 
>> >>  
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
>> >
>> >Most of the series seems to be a rebased of those patches, just with
>> >paraphrased commit messages and my S-o-B lines dropped. As commented on
>> >patch 4, I do not think that is appropriate.
>> 
>> Same question as patch 2
>> 
>> If you want your S-O-B added, ok fine, but yeah.
>
>As on patch 2, please read the documentation before continuing futher.
>

Ack.

>> Do you think this series itself is good? 
>
>No. At present I think it's in a worse state than it was in my branch,
>because portions have changed, with no rationale and no clear benefit.

Sorry. I'm sure the points you will bring up on review will go into V2,
andthen it should be better then.

>
>Hence my ask to Catalin and Will to NOT pick this up for now.
>
>Mark.
>
>> 
>> >
>> >I'll take a more in-depth look shortly.
>> 
>> thanks!
>> 
>> >
>> >Catalin, Will, for the moment please do not pick these up.
>> >
>> >Mark.
>> >
>> >> The short answer to the question: yes, but only because the rework
>makes
>> >> resume look like a resume from idle. We enter cpu_resume() at the
>> >highest
>> >> available EL with the MMU off, and the resumed kernel installs its
>own
>> >> hyp stub vectors into VBAR_EL2 through init_kernel_el() before
>anything
>> >> else runs, so by the time swsusp_free() releases the trans_pgd copies
>> >> nothing points at them anymore.
>> >> 
>> >> The series is structured so the first patch stands alone as a stable
>> >> worthy fix for the missing hvc arguments. The rest is the cleanup:
>the
>> >> stale init_kernel_el() comment gets corrected, MTE tag pages get
>freed
>> >> after save instead of leaking on failed hibernates, the fragile
>> >> _cpu_resume() calling convention gets split, and the last patch
>reworks
>> >> hibernate to use the regular cpu_resume() logic end to end.
>> >> 
>> >> Everything object compiles and passes checkpatch and sparse. I could
>not
>> >> boot or run a hibernate cycle on real hardware here, so that still
>wants
>> >> doing before anyone gets excited.
>> >> 
>> >> Bradley Morgan (7):
>> >>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
>> >>   arm64: head: correct comment for init_kernel_el()
>> >>   arm64: hibernate: free MTE tag pages after saving
>> >>   arm64: hibernate: fix _cpu_resume() calling convention
>> >>   arm64: hibernate: use dcache_by_myline_op
>> >>   arm64: hibernate: only clean to PoC
>> >>   arm64: hibernate: use regular cpu_resume() logic
>> >> 
>> >>  arch/arm64/include/asm/suspend.h  |  1 -
>> >>  arch/arm64/kernel/head.S          |  6 +--
>> >>  arch/arm64/kernel/hibernate-asm.S | 87
>+++++++++++++++++++------------
>> >>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
>> >>  arch/arm64/kernel/sleep.S         |  6 +--
>> >>  5 files changed, 88 insertions(+), 78 deletions(-)
>> >> 
>> >> -- 
>> >> 2.47.3
>> 
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

