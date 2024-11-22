Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E8DE6916D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Foy2tHMWO7Mdo9OyIxUYccWGvClQ4YW33JceQ2tPYLQ=; b=wQ4NbfNKpDQummUHwocJXr3Xqz
	4iP2B4VYchAU1WJFGhWkmM4XYV+1zNjuUsrFSSZ1dJOO5S3Ojfc84Th9qXziHhaDvVYAqaXm6XjH0
	FjrS4qwVo1GsABTATUME746t9ctOZHCkBJqqG6gDV4MrZk16A5LBp+IEaUmUqUHBBUaoJyoKD16Oq
	U7EYPddy0RLEeIrcoBmVTUfR8Q6yt7KIwMR7IOlfPWy7fZmmgUt0TkB9nu/cSqt5bkOEODlvoiMOU
	WaRZkwWAUh19YovjhDFlb9NoSR6cvnIau5pozlV4q+k3RbXJOHMFp3A0DaHEk9TbzLdPUbX/4gIhi
	ctVw+lFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVTy-00000002ikr-29yl;
	Fri, 22 Nov 2024 15:22:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVT1-00000002ihL-3srb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 15:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68CF8A411F0;
	Fri, 22 Nov 2024 15:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5EDC4CECE;
	Fri, 22 Nov 2024 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732288866;
	bh=7pz32RbN7KvAwY8Z4VR7ySVX87cMIOLDDNQdlcRElAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma1GLpGcU49K7V4i4V697Y2v1F+5gFEzWWYfG5ikQE+epTRKFWCKoH1EKhBUlvgg5
	 Rmuxt/3KU1BnX25bq4mq4g/MgfNMmzgnc3Oz6kOk/ENKy4N0brAfguPHD6jmQ6fu+a
	 2Gc4fcqjhh4EkAyn8gWE5c06MQwMBq5ZRiGINmHPhF9nO7yBjnolYua+7MfjyPeQ18
	 NLTTzKlS3ZC3p/iuWeIRAJ0od+DZuaxN2wuVP+e2tY1c94VMmdNMZXYdLj/oWLG9Oj
	 z4miGV/9poZHenA3v3hzPb8qGGkOcXCoxFRhj1jbf3w9hm51XJGkYvPW3wEXf8VEvL
	 8W/a3r9HB3mWg==
Date: Fri, 22 Nov 2024 10:21:04 -0500
From: Sasha Levin <sashal@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, linux@armlinux.org.uk,
	arnd@arndb.de, samitolvanen@google.com,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.6 5/6] ARM: 9434/1: cfi: Fix compilation corner
 case
Message-ID: <Z0ChYA7bsmnZRI2d@sashalap>
References: <20241120140647.1768984-1-sashal@kernel.org>
 <20241120140647.1768984-5-sashal@kernel.org>
 <20241120151338.GA3158726@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241120151338.GA3158726@thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_072108_091769_B850A83D 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Nov 20, 2024 at 08:13:38AM -0700, Nathan Chancellor wrote:
>Hi Sasha,
>
>On Wed, Nov 20, 2024 at 09:06:35AM -0500, Sasha Levin wrote:
>> From: Linus Walleij <linus.walleij@linaro.org>
>>
>> [ Upstream commit 4aea16b7cfb76bd3361858ceee6893ef5c9b5570 ]
>>
>> When enabling expert mode CONFIG_EXPERT and using that power
>> user mode to disable the branch prediction hardening
>> !CONFIG_HARDEN_BRANCH_PREDICTOR, the assembly linker
>> in CLANG notices that some assembly in proc-v7.S does
>> not have corresponding C call sites, i.e. the prototypes
>> in proc-v7-bugs.c are enclosed in ifdef
>> CONFIG_HARDEN_BRANCH_PREDICTOR so this assembly:
>>
>> SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
>> SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)
>>
>> Results in:
>>
>> ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_smc_switch_mm
>> >>> referenced by proc-v7.S:94 (.../arch/arm/mm/proc-v7.S:94)
>> >>> arch/arm/mm/proc-v7.o:(.text+0x108) in archive vmlinux.a
>>
>> ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_hvc_switch_mm
>> >>> referenced by proc-v7.S:105 (.../arch/arm/mm/proc-v7.S:105)
>> >>> arch/arm/mm/proc-v7.o:(.text+0x124) in archive vmlinux.a
>>
>> Fix this by adding an additional requirement that
>> CONFIG_HARDEN_BRANCH_PREDICTOR has to be enabled to compile
>> these assembly calls.
>>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202411041456.ZsoEiD7T-lkp@intel.com/
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/arm/mm/proc-v7.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
>> index 193c7aeb67039..bea11f9bfe856 100644
>> --- a/arch/arm/mm/proc-v7.S
>> +++ b/arch/arm/mm/proc-v7.S
>> @@ -93,7 +93,7 @@ ENTRY(cpu_v7_dcache_clean_area)
>>  	ret	lr
>>  ENDPROC(cpu_v7_dcache_clean_area)
>>
>> -#ifdef CONFIG_ARM_PSCI
>> +#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_HARDEN_BRANCH_PREDICTOR)
>>  	.arch_extension sec
>>  ENTRY(cpu_v7_smc_switch_mm)
>
>This patch is unnecessary in branches prior to 6.10 (when ARM started
>supporting kCFI) because SYM_TYPED_FUNC_START() is not used here. I
>would just drop it for 6.6 and earlier.

Ack, will do.

-- 
Thanks,
Sasha

