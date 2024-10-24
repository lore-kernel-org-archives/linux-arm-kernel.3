Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048DCE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4QktkhEtLSsXQwHnjJEKvlHWTA4VesoldoBjAPwBag=; b=eZ7dv/nrPR8rFmmVXhosRRCPw9
	8zft6cvmlJRWw4ywqUln1w4K9V6bpd2rU5DgkFshsh98+QemA18ktofkbDaB/AEvwEuixaDm2Hr8B
	gcemCrhAAJBG5+ic10rpX4DwxFihuVhfAtzOGErns/bHyQrS5nB6xZY7TqEpXY97ipfq601wJCEN1
	xWMQH9YV0uF2tCVoVm/uvJpn3viJFxovlSpLLgmuR6QO4uQRGTlGDkbuwZOC5yV15TS3AFinOvVbS
	tuOOn36C5p7bgeqgnbNCJULdB2RS+kDGjSiEKye2w8eAVoyB6QhN6MMrr4NNR+hs+mFaGTSMbvkSW
	eBedy4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zIb-00000000pjJ-47pm;
	Thu, 24 Oct 2024 14:58:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zFk-00000000pPK-35AW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF329339;
	Thu, 24 Oct 2024 07:56:24 -0700 (PDT)
Received: from [10.44.160.105] (e126510-lin.lund.arm.com [10.44.160.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 052A53F528;
	Thu, 24 Oct 2024 07:55:50 -0700 (PDT)
Message-ID: <80688edf-83dd-43c6-a1a8-b69acd30f5c3@arm.com>
Date: Thu, 24 Oct 2024 16:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org,
 dave.hansen@linux.intel.com, dave.martin@arm.com, jeffxu@chromium.org,
 joey.gouly@arm.com, pierre.langlois@arm.com, shuah@kernel.org,
 sroettger@google.com, will@kernel.org, linux-kselftest@vger.kernel.org,
 x86@kernel.org
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-4-kevin.brodsky@arm.com> <ZxoooqtuqTK5CAMR@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ZxoooqtuqTK5CAMR@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_075556_915946_64A30F8B 
X-CRM114-Status: GOOD (  18.07  )
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

On 24/10/2024 12:59, Catalin Marinas wrote:
> On Wed, Oct 23, 2024 at 04:05:09PM +0100, Kevin Brodsky wrote:
>> +/*
>> + * Save the unpriv access state into ua_state and reset it to disable any
>> + * restrictions.
>> + */
>> +static void save_reset_user_access_state(struct user_access_state *ua_state)
>> +{
>> +	if (system_supports_poe()) {
>> +		/*
>> +		 * Enable all permissions in all 8 keys
>> +		 * (inspired by REPEAT_BYTE())
>> +		 */
>> +		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;
> I think this should be ~0ul.

It is ~0u on purpose, because unlike in REPEAT_BYTE(), I only wanted the
lower 32 bits to be filled with POE_RXW (we only have 8 keys, the top 32
bits are RES0). That said, given that D128 has 4-bit pkeys, we could
anticipate and fill the top 32 bits too (should make no difference on D64).

>> @@ -907,6 +964,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  {
>>  	struct pt_regs *regs = current_pt_regs();
>>  	struct rt_sigframe __user *frame;
>> +	struct user_access_state ua_state;
>>  
>>  	/* Always make any pending restarted system calls return -EINTR */
>>  	current->restart_block.fn = do_no_restart_syscall;
>> @@ -923,12 +981,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  	if (!access_ok(frame, sizeof (*frame)))
>>  		goto badframe;
>>  
>> -	if (restore_sigframe(regs, frame))
>> +	if (restore_sigframe(regs, frame, &ua_state))
>>  		goto badframe;
>>  
>>  	if (restore_altstack(&frame->uc.uc_stack))
>>  		goto badframe;
>>  
>> +	restore_user_access_state(&ua_state);
>> +
>>  	return regs->regs[0];
>>  
>>  badframe:
> The saving part I'm fine with. For restoring, I was wondering whether we
> can get a more privileged POR_EL0 if reading the frame somehow failed.
> This is largely theoretical, there are other ways to attack like
> writing POR_EL0 directly than unmapping/remapping the signal stack.
>
> What I'd change here is always restore_user_access_state() to
> POR_EL0_INIT. Maybe just initialise ua_state above and add the function
> call after the badframe label.

I'm not sure I understand. When we enter this function, POR_EL0 is set
to whatever the signal handler set it to (POR_EL0_INIT by default).
There are then two cases:
1) Everything succeeds, including reading the saved POR_EL0 from the
frame. We then call restore_user_access_state(), setting POR_EL0 to the
value we've read, and return to userspace.
2) Any uaccess fails (for instance reading POR_EL0). In that case we
leave POR_EL0 unchanged and deliver SIGSEGV.

In case 2 POR_EL0 is most likely already set to POR_EL0_INIT, or
whatever the signal handler set it to. It's not clear to me that forcing
it to POR_EL0_INIT helps much. Either way it's doubtful that the SIGSEGV
handler will be able to recover, since the new signal frame we will
create for it may be a mix of interrupted state and signal handler state
(depending on exactly where we fail).

Kevin

