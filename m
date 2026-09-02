Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08374C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwIFfSx+XD5a7sC0XmkVh7YDuYan2JuQeOfx7dPjlyo=; b=Lu5OFpzcIGFSTl52g9/0ylmauf
	QwTmA46v+5C+TxomRFo+ucI5FsMefwOvJv5HzxyS17TC60OBLRPp4Xpsx0+2oR4MX8Js3bx0ltL6g
	wzws39/C5VLp2Dcjy++2nfcdG/iX7ESeQuur+FnC1MMI5Y6apMm0/SUHCd083QLW26FUwfIDjDDQi
	vvsDo6Keij2i8UL6lBSgaQGD4hGgyqasz3Et732GAXB5tae9q1WyL523KsG+TWCxDLSQKIEI3feV7
	6JrVUJZqTaihJ3M9hCUNT/p5MmnM9NRWGoe2/lN+U6WOg96oN+9C2TsFdV2hgJkBiyI2J34+q+BkV
	Fr1Vorlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lNE-0000000ErCk-2sY3;
	Wed, 02 Sep 2026 13:51:32 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lNB-0000000ErBJ-3B67
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357084; bh=KwIFfSx+XD5a7sC0XmkVh7Y
	DuYan2JuQeOfx7dPjlyo=; b=Xw263usuTobwVu3ZPe3GlstVM9g/1kVc3YoGnI1soFturQ1jgK
	gCYoojyovu42EKY+2coXrAakDWF/3uYZrnG0YjxvN4rEHMGYbXP3O0b/TQts/4/RivKgwfv+lyt
	QgFTWY7I+9nNRug02aXcg6poYp1ZXDzRFrUvvalHuW9c2mjg1//bXxMBnFSzbR6NeI7lLtVJRAI
	aLSZI4xdCRog2qZFpcO0o51Hp8YXyP1zkMNmcGI0tJJ0CLCVaQXSOtViVJhzGLd8u9czR1CuKNA
	MRj8ovw2cB/CGt1l10yRWK1fyEL+8HCJe9K4vcrNHr+pmlvyA8q2PgLOU7Kf47MZjWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357084; bh=KwIFfSx+XD5a7sC0XmkVh7Y
	DuYan2JuQeOfx7dPjlyo=; b=GnxnxnYvr14CijySVZRt67D3Nlk2N6u7awJgjyDCVoGJ0pWF0W
	4/8R+bVe08vreAyjdhyGW3JFBTpfet9v0oCg==;
Date: Wed, 02 Sep 2026 14:51:22 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_065129_945278_A1773E2F 
X-CRM114-Status: GOOD (  19.08  )
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

On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
>> This comes out of the hibernate resume discussion where Will asked if
>> the restored kernel's hyp vectors are reinstalled before we come back
>> from swsusp_arch_suspend() and free the reserved pages. Rather than
>> answer with a one off fix, this series reworks resume to look like a
>> resume from idle, which makes the answer fall out on its own.
>> 
>> The series leans on Mark Rutland's old work for inspiration, he had the
>> same end goal in a branch from back then:
>> 
>>  
>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
>
>Most of the series seems to be a rebased of those patches, just with
>paraphrased commit messages and my S-o-B lines dropped. As commented on
>patch 4, I do not think that is appropriate.

Same question as patch 2

If you want your S-O-B added, ok fine, but yeah.

Do you think this series itself is good? 

>
>I'll take a more in-depth look shortly.

thanks!

>
>Catalin, Will, for the moment please do not pick these up.
>
>Mark.
>
>> The short answer to the question: yes, but only because the rework makes
>> resume look like a resume from idle. We enter cpu_resume() at the
>highest
>> available EL with the MMU off, and the resumed kernel installs its own
>> hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
>> else runs, so by the time swsusp_free() releases the trans_pgd copies
>> nothing points at them anymore.
>> 
>> The series is structured so the first patch stands alone as a stable
>> worthy fix for the missing hvc arguments. The rest is the cleanup: the
>> stale init_kernel_el() comment gets corrected, MTE tag pages get freed
>> after save instead of leaking on failed hibernates, the fragile
>> _cpu_resume() calling convention gets split, and the last patch reworks
>> hibernate to use the regular cpu_resume() logic end to end.
>> 
>> Everything object compiles and passes checkpatch and sparse. I could not
>> boot or run a hibernate cycle on real hardware here, so that still wants
>> doing before anyone gets excited.
>> 
>> Bradley Morgan (7):
>>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
>>   arm64: head: correct comment for init_kernel_el()
>>   arm64: hibernate: free MTE tag pages after saving
>>   arm64: hibernate: fix _cpu_resume() calling convention
>>   arm64: hibernate: use dcache_by_myline_op
>>   arm64: hibernate: only clean to PoC
>>   arm64: hibernate: use regular cpu_resume() logic
>> 
>>  arch/arm64/include/asm/suspend.h  |  1 -
>>  arch/arm64/kernel/head.S          |  6 +--
>>  arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
>>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
>>  arch/arm64/kernel/sleep.S         |  6 +--
>>  5 files changed, 88 insertions(+), 78 deletions(-)
>> 
>> -- 
>> 2.47.3

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

