Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRugIjdT4x5jSv9AQPh6LQWTqYwwVqefuxtjX8C3dcc=; b=Eu8RfIvUoABByLceB1DHFXsA6u
	PplEx9l3s2F5lv3ubQjrXgb/V90nqJnc1SjyYv/MV/F1ktgygrJoJwcUw75Yz8QMQrekBSW0psp1M
	jucCCHNna6ofLVeSnwSAsOnxzQJK8RH6u9A+rO6Vh5puWwAbX9XvmCcyse1o17oh12iyDL3eDunHr
	9oQaLOgG58nAAsGd4h056obnUy8FqGit+/a27xdVlDmWD3wm9TD3ex2EXQsWzuKE/0p3oaOejH9L7
	u7obm+WbAGtxHhIBVDeEZZFuPLwxxZnYAJ6OYbh/clU1k4beg91S4zHghsAeeNc81SNitkJetmNhh
	ysZU+ppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx2t-00000006BNB-0swR;
	Mon, 17 Aug 2026 13:06:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx2p-00000006BLg-3mQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:06:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DD361476;
	Mon, 17 Aug 2026 06:06:20 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F2E3F85F;
	Mon, 17 Aug 2026 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786971984; bh=ATkWfYmi41+1wjhUL20ADtcuZj1QqRuatkCKI4zuSs4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2CVA/nG71bbYbXIxOurknJ0LfY9QeLGt0wtmC6KdX6alfPAlXVWT3N1ga9iXlJ7T
	 6DMMA3R6XWD/PULNjgIunbPy4jMGp48QV0dy4MqaCdcVypPfMf8tD6SGlCESVWi4iX
	 GEtpSQiEAVnbLbZv9bK0SEqz6SM1Fgu/vB5JOKz0=
Message-ID: <7ca33f92-2ded-4749-ab67-2fb564919b99@arm.com>
Date: Mon, 17 Aug 2026 14:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume
 hvc
To: Will Deacon <will@kernel.org>, Bradley Morgan <include@grrlz.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, james.morse@arm.com
References: <20260809213615.11646-1-include@grrlz.net>
 <anr28wUlKjci8JPn@willie-the-truck>
 <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net>
 <anszjQ7jBeYDqesp@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <anszjQ7jBeYDqesp@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_060628_117458_3E98617F 
X-CRM114-Status: GOOD (  31.85  )
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

Hi Will,

On 8/11/26 15:37, Will Deacon wrote:
> On Tue, Aug 11, 2026 at 01:50:14PM +0100, Bradley Morgan wrote:
>> On 11 August 2026 11:18:27 BST, Will Deacon <will@kernel.org> wrote:
>>> [+Maz, Pasha and James]
>>>
>>> On Sun, Aug 09, 2026 at 09:36:15PM +0000, Bradley Morgan wrote:
>>>> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
>>>> vectors with an hvc, but never passes the arguments. x0 is not set to
>>>> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
>>>> dispatch falls through and returns without writing vbar_el2. EL2 is
>>>> left pointing at the trans_pgd copy of the vectors, a page that
>>>> swsusp_free() releases right after resume.
>>>>
>>>> Set the arguments up the same way __hyp_set_vectors() does.
>>>>
>>>> Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>>> trans_pgd_copy_el2_vectors")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>>>> ---
>>>>  arch/arm64/kernel/hibernate-asm.S | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/hibernate-asm.S
>>> b/arch/arm64/kernel/hibernate-asm.S
>>>> index 0e1d9c3c6a93..2baefe7a82d3 100644
>>>> --- a/arch/arm64/kernel/hibernate-asm.S
>>>> +++ b/arch/arm64/kernel/hibernate-asm.S
>>>> @@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4", 
>>> ARM64_WORKAROUND_CLEAN_CACHE
>>>>  	isb
>>>>  
>>>>  	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
>>>> +	mov	x1, x24
>>>> +	mov	x0, #HVC_SET_VECTORS
>>>>  	hvc	#0
>>>>  3:	ret
>>>>  SYM_CODE_END(swsusp_arch_suspend_exit)
>>> I'm having a really hard time figuring out what's supposed to be going
>>> on here!
>>>
>>> The original hibernation code added by James in 82869ac57b5d ("arm64:
>>> kernel: Add support for hibernate/suspend-to-disk") unconditionally
>>> set the vectors in the exception handler:
>>>
>>> +el1_sync:
>>> +       msr     vbar_el2, x24
>>> +       eret
>>> +ENDPROC(el1_sync)
>>>
>>> However, it _also_ set the vectors from C code in swsusp_arch_resume():
>>>
>>> +       if (el2_reset_needed()) {
>>> +               phys_addr_t el2_vectors = phys_hibernate_exit;  /* base */
>>> +               el2_vectors += hibernate_el2_vectors -
>>> +                              __hibernate_exit_text_start;     /* offset */
>>> +
>>> +               __hyp_set_vectors(el2_vectors);
>>> +       }
>>>
>>> Later, Pasha refactored the assembly so that it could be shared with
>>> kexec in 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>>> trans_pgd_copy_el2_vectors"), however this added arguments to the
>>> exception handler without updating the hypercall on the hibernation path.
>>>
>>> So I think we need to figure out:
>>>
>>> 0. Whether this code is actually broken atm (I have a feeling it might
>>>   happen to work)
>> Yes, since 788bfdd97434.
> Right, but did you manage to reproduce a crash? You're implying that this
> hasn't worked for five years, which makes me wonder why we bother to try
> to maintain this code!
> 
>>> 1. Why the original hibernation code set the vectors twice.
>> They do different jobs. The C call parks EL2 on the safe page copy
>> before the restore overwrites the current table. The asm call installs
>> the final __hyp_stub_vectors afterwards.
> I think I probably need to spend some time understanding how all this is
> supposed to work. I can't currently tell how we end up with the stub
> vectors installed to start with nor why we can't do all this from C code.
> 

Here is my understanding of how things work. Assuming nVHE mode, we
restore the previously saved image X from the currently running kernel Y.
I’ll use the suffixes _X and _Y for addresses belonging to the respective
images.

On the resume path, KVM teardown sets VBAR_EL2 to __hyp_stub_vectors_Y.

swsusp_arch_resume() then temporarily (re)sets VBAR_EL2 to trans_pgd_stub_vectors
while transitioning to image X:

|        if (el2_reset_needed())
|                __hyp_set_vectors(el2_vectors);


Currently, swsusp_arch_suspend_exit() attempts to restore VBAR_EL2 to
__hyp_stub_vectors_X:


|       cbz     x24, 3f         /* Do we need to re-initialise EL2? */
|       hvc     #0

where x24 is resume_hdr.__hyp_stub_vectors (in other words snapshot of
__hyp_stub_vectors from image X)

However, that request is ignored, so VBAR_EL2 remains pointing to
trans_pgd_stub_vectors

We re-enter the kernel X.

During KVM initialisation, we call __hyp_reset_vectors(). This is
handled by trans_pgd_stub_vectors, but ignored since HVC_RESET_VECTORS
is not recognised. We then call __hyp_set_vectors(), which is also
handled by trans_pgd_stub_vectors, but this time VBAR_EL2 get set to
__kvm_hyp_init_X.

From that point on, __kvm_hyp_init_X handles subsequent HVC calls,
including the later call that redirects VBAR_EL2 to
__kvm_hyp_host_vector_X during KVM setup.

The memory containing trans_pgd_stub_vectors is freed later by
swsusp_free(). That perhaps explains why we do not see any crash.

With the proposed fix, swsusp_arch_suspend_exit() successfully restore
VBAR_EL2 to __hyp_stub_vectors_X just before we re-enter kernel X, and
that vector is used for subsequent HVC calls.

__hyp_stub_vectors is similar to trans_pgd_stub_vectors (or another
way around?) - it handles both HVC_SET_VECTORS and HVC_SOFT_RESTART,
and ignores HVC_RESET_VECTORS.

So the fix makes sense to me. It also restores clear boundary between
the temporary resume mechanism and handing control over to the
restored image.

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


>>> 2. Assuming they only need to be set once, whether we can drop the hvc
>>>   from the swsusp_arch_suspend_exit assembly code entirely.
>> No. After the restore vbar_el2 is only writable from EL2, and the
>> temporary copy cannot stay. swsusp_free() frees it right after resume.
> Isn't vbar_el2 always only writable from EL2?
> 
>>> 3. Whether we can then drop the HVC_SET_VECTORS handling from this set
>>>   of vectors.
>>>
>> No, this hvc uses it, and so does kexec.
> Where does kexec use it? I could only spot it making use of
> HVC_SOFT_RESTART.
> 
> Will
> 


