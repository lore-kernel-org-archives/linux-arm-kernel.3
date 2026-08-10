Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B09C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05YK56mFtHrEuaFcPHkzwDatIY9V5n4yQHJVl624XGE=; b=lN+z8WWpQrZxs3GOuDtvbxLzQ+
	zfxSnG7XvnxaPVwKLpqkHz2aQUdPSspbcLgiJr05WJadUsrpTu3yg8HQrN3KmOwBPbjtmAGlk4Y2r
	t34lFIMdRacS6FwKkEuj2kRpW0lroH5HiJJzK46x487vudSvk1N0IdPYJkAEbfCc9fqo4TyZYxOf5
	qyg2Ht/3Co4D8gG1sEQuBz6tKWZb/95pb1JBqR1CSysPqOljueXo/KcdYlFZPjXvIvPQtdO7n0LJ1
	TpIWPh3DrXy3mafUodCptgyIJJyWV/ss7mSUiQbOtoHAQnP6zlqXHrRLnPpyt8G91G8FbFO4qwW3L
	xw4PesOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSAL-0000000CIkw-1HXS;
	Mon, 10 Aug 2026 15:43:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSAK-0000000CIkY-1yFk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4CC3600C8;
	Mon, 10 Aug 2026 15:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429381F00A3A;
	Mon, 10 Aug 2026 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376631;
	bh=05YK56mFtHrEuaFcPHkzwDatIY9V5n4yQHJVl624XGE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=JGd314SSxzNTgV0kF8sv7E9q+qKl1lRuwsg5ipHPh+VTTLODwZYeVepO+PsqzkZzz
	 j2LgdoiGtZocYdYBH3E4SjYLaKizcrROSG8fTglPdFk1f2yYAzC41O4xSUc2gL+Q9Q
	 ZkLSxPrytGsuPowWdY+as4vcqC8F4Ar2vEhvWa4RRX0sXcPk4eF0ZgnZNTGW3GjquA
	 yETuQLMrhDP7vX0DPaTWW4zP1lVGMaSZqQPs9fg8FuyEj7djUezUwuwXh6JSxyrM9J
	 8sBsHYq9lHOWhEf3tShXLwEsHu3h6Nh2gp+lrZhZ3HWIKubu/ZlNKRxGvSs1Dl++Ws
	 JftpWElfY0u1A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id BE685198005A;
	Mon, 10 Aug 2026 11:43:49 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 11:43:49 -0400
X-ME-Sender: <xms:s_F5agwMLUhYZRg7a6-YjKHLqhoi66bPpSn_jXW6MP0-BUdBgOEO7g>
    <xme:s_F5avG8n5LTYaWYEQu2N-3e6dIKi0xH0lEpvJP2TCw_Wp2Fqy1lawWMofRuEH4zA
    TETZk5ytkhmSQHdPPWAcs3Ojg2-xykMM3DcQiEoOmSLKl2JCTJeUCHJ>
X-ME-Proxy-Cause: dmFkZTE74I8Lt/EZObcXqeW81Rvt2Zx8ARAuW+8n/TWZEgPsKNrz4nphPQ4lIEyYiB6h7S
    LHagim+WOIAmy5azWIBETOPfib40UL/0ozB491E5MorMU177tGnxDh9l+Jqge+hmwo+d6n
    VAaeJIZwhxAD4Dkoj1dxXOekxc33Mb84Jeb9ifb1o7D7qLKmdjxhT7io/G0LoK20+R0CvN
    7l1e9FDUhMXofKEhRIwi+F5FCtHiHpkh1cTu2nyS+QYvK3H262SQ6x9KMc9MYQzeRHD3WQ
    TkYj2QWtG+J3eHBnJOZFlSeSuMf6zyg2EfFU7HlOFG/WJJW0LaD2CRmNarCxnh2COZ0+ar
    WUpFZ9uRTfizBsuQNtK4Qk6lreTQCwt+LWezxZv9CAc2ItG8uqSMwliec4lEtOxoCXfEMI
    cJTNz5dpkr+/W45/CCDMCAP5+BsgNDsd90Q3WlapahV6DTbRhGxSeovuEJofpwobpkUyga
    MQluz5pQegqYqr2Dyo8mHRRrhz7dxYJPO3hYsawn7dlfctSI4W1NAeFSs/+dj76wezZCEQ
    4ZBVZAATlREqE7wblGh+9agiZM74waIVktQY3bdraPr/jh1Q22rWyWCyA5Adcntjy99Kdz
    J1tPxunSAeJtnvSbfw34gMU0y1Hbbfpt3zBh2H6BecQGvUVky8nAk5zmmAeg
X-ME-Proxy: <xmx:tfF5amunpkCOZAILHtXzL4Dk2W8-a7fNblfAS0Z0GrXrFisBNQ19YA>
    <xmx:tfF5agYgkG-J9jnh2-gc0L3tRARmLUIQSxCcsIFruael4gJMlmh42Q>
    <xmx:tfF5amA2KzgIM8kcgKKj-RxgnixTUEuAIZ61JG-7CHxuQkLMJt52ng>
    <xmx:tfF5ag8dYi8LbZVW7Yl07DxJDTf7bnA6zkPn7CNyGK7mJ9ya4yP7OQ>
    <xmx:tfF5aqTVvOelbF-JMfmP9HL83XYq7fLJd8uzWGhjAPblJvdIHauynxJ7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A58372F81643; Mon, 10 Aug 2026 11:43:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 17:43:27 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>
Cc: "gus bourg" <gus@bourg.net>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <1473a7a8-7e96-4c7e-9973-98682b3f6999@app.fastmail.com>
In-Reply-To: <anmwTDnFR2cgxkqR@willie-the-truck>
References: <20260806000144.3388823-1-gus@bourg.net>
 <anXMug2_-vZl_pZ7@willie-the-truck>
 <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com>
 <anmwTDnFR2cgxkqR@willie-the-truck>
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly under SW
 PAN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Mon, 10 Aug 2026, at 13:04, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 04:56:00PM +0300, Ard Biesheuvel wrote:
>> 
>> 
>> On Fri, 7 Aug 2026, at 15:16, Will Deacon wrote:
>> > On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
>> >> From: Gus Bourg <gus@bourg.net>
>> >> 
>> >> When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setup()
>> >> installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and only a
>> >> return from exception ever puts it back: check_and_switch_context() skips
>> >> the register write by design ("Defer TTBR0_EL1 setting for user threads to
>> >> uaccess_enable() when emulating PAN"), and __switch_to() does not touch it
>> >> either. switch_mm() updates only thread_info->ttbr0.
>> >> 
>> >> Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services without
>> >> disabling preemption") the runtime call is preemptible, so the EFI worker
>> >> can now be scheduled out inside that window. An involuntary preemption is
>> >> harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and restore
>> >> the state around the exception. A voluntary reschedule is not: it performs
>> >> no return from exception, so the worker resumes with another task's
>> >> TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a level 0
>> >> translation fault.
>> >> 
>> >> There is such a preemption point in arch_efi_call_virt_setup() itself,
>> >> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
>> >> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
>> >> preempt_check_resched().
>> >
>> > Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() so
>> > that this preemption point doesn't interfere?
>> >
>> 
>> Either that, or tweak the logic so that the switch is done eagerly in
>> this particular case (untested):
>> 
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -266,7 +266,7 @@
>>          * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
>>          * emulating PAN.
>>          */
>> -       if (!system_uses_ttbr0_pan())
>> +       if (!system_uses_ttbr0_pan() || mm_is_efi(mm))
>>                 cpu_switch_mm(mm->pgd, mm);
>>  }
>
> I think I'd prefer to avoid special-casing this, if we can. I was just
> thinking of the diff below.
>

I think that should work, yes. I don't think we dereference any EFI runtime
pointers after coming back from the firmware call, so even if there are any
voluntary preemption points lurking (in the pr_err() inside
efi_call_virt_check_flags(), for instance), they should not trigger an access
that hits TTBR0.




>
> --->8
>
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 30cd7f804398..0ec90fd1754e 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -184,6 +184,8 @@ void arch_efi_call_virt_setup(void)
>                 efi_virtmap_load();
>         }
> 
> +       __efi_fpsimd_begin();
> +
>         /*
>          * Enable access to the valid TTBR0_EL1 and invoke the errata
>          * workaround directly since there is no return from exception when
> @@ -191,8 +193,6 @@ void arch_efi_call_virt_setup(void)
>          */
>         uaccess_ttbr0_enable();
>         post_ttbr_update_workaround();
> -
> -       __efi_fpsimd_begin();
>  }
> 
>  void arch_efi_call_virt_teardown(void)

