Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF49C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOXV6KBmY8hmHm3fVz/Lr38YoXuL+7PPP+/f6A0XEsA=; b=JCU1A6o8cpE1RYD/jAjZfR3MJ/
	RhwkK9IMtJc6wRZjC7Cnp3kJ6JgKSpMMLsKJVC0DZYHZLT97MeXZQodMzu0gs/PAU/KYFjhDbhWSL
	ZaKj8mJ5Mn5DMAMVUi/p74hWbqD7UvETTsu6Vx80mcHgPqD79OpayuVyba+/9PWZd1gqwu6L8x+bB
	A+1eoyMoV0LXn9JNr/ZBRWL6KT3hl1TFkn4T2KC+yBGmiDKjGSMf6rlaSBUjIJChhUMM6l7wykpod
	2997UZb4v1kASVcNOE/wQ8Tl+anU2x9mHENto2nN4OVlfyqLyFTqVSX/7/TSmkVDp7knpA798jERD
	n0QJ4D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7Zf-00000008TD1-2uIb;
	Wed, 16 Jul 2025 19:13:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7W2-00000008SmC-1oPT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D7F46579
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 19:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EEFC4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752693005;
	bh=5ONk/dhgxzx4BEgIyWuPo/yrDaN7XiSUNZxPs1Nfnis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pNDV1bihDjCd/R4DTX17sdlI8xs4hNrne1rmuOO3P1ISN/Tr8d4lkvhljqml2ce/p
	 ebayJ7XL4JzqRet2zO/UD4heFIJCYduOgf2GnCFigntkNjuqh56uA5ADnksjaUsC0R
	 bCfzCOmMZ7XzdfgGlcu4i2zxerQH5UQPBFO5UkjZ7cA7+OPJfrEkJFVtVR0TY39uqN
	 mOw85vwd3mDC1RfYtBbALcc2HtCha7psNR4GwC7aQD7JH981Hxe38lvmQ+RqKVPzQz
	 NNujmMt4ejV60SLjZ/EOA+R67XdT0VSfnMMUSzUNePPmW/RVmJVg3lHEbJh/3iX4nd
	 jRIeIM+fezu6A==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-615a02ebcc7so52687eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:10:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVddDlDLGGJPV0vb7TJhTiQa0vGn5XX0T+WNF6ijnUexaZdHxcJA0gjGrnFHEqp+HY2+sGa2NR+cxOTrmqq2R6T@lists.infradead.org
X-Gm-Message-State: AOJu0YzmpqyhvNI7Pcexm3qHXOtPb4Mk9E3vqvmheUG4qmN9pTi9ajC+
	a/vlZ5gVtxQ2UHs/4tsk6ByCd+nkzlHxmcV2JEtyeFFNfP2AxG+r29n3rnGsypMwpE1ZnsAGOU8
	2emXSgqmBiagG928N3KDcCsC8NhmDR5c=
X-Google-Smtp-Source: AGHT+IF3+GPKGX9g9hYSOvtBePiC6ouh/Pa+vawVOjx2y0KZXvQTfL0WJR+bmcWjTV/eg7Dfl887GmDhIhlgJ7nbE9U=
X-Received: by 2002:a4a:a5cb:0:b0:615:9c11:a072 with SMTP id
 006d021491bc7-6159ff4340amr2510895eaf.8.1752693004962; Wed, 16 Jul 2025
 12:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250714114212.31660-1-xueshuai@linux.alibaba.com>
In-Reply-To: <20250714114212.31660-1-xueshuai@linux.alibaba.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Jul 2025 21:09:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gmuBwCXovP7WvmUss7midrJdPXNDCbhTV0tCWMb_V2ZQ@mail.gmail.com>
X-Gm-Features: Ac12FXzuJJVotxHfi5JXQgRoZINZEL1SjopFGDk1sL5TkrIFpGNDE-craBpu6EI
Message-ID: <CAJZ5v0gmuBwCXovP7WvmUss7midrJdPXNDCbhTV0tCWMb_V2ZQ@mail.gmail.com>
Subject: Re: [PATCH v19 0/2] ACPI: APEI: fix potential hardlockup due to
 infinite SEA excepction loop
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: catalin.marinas@arm.com, sudeep.holla@arm.com, guohanjun@huawei.com, 
	lpieralisi@kernel.org, linux-acpi@vger.kernel.org, yazen.ghannam@amd.com, 
	mark.rutland@arm.com, mingo@redhat.com, robin.murphy@arm.com, 
	Jonathan.Cameron@huawei.com, bp@alien8.de, rafael@kernel.org, 
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com, 
	tanxiaofei@huawei.com, mawupeng1@huawei.com, tony.luck@intel.com, 
	linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com, 
	tongtiangen@huawei.com, gregkh@linuxfoundation.org, will@kernel.org, 
	jarkko@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, linux-edac@vger.kernel.org, x86@kernel.org, 
	justin.he@arm.com, ardb@kernel.org, ying.huang@linux.alibaba.com, 
	ashish.kalra@amd.com, baolin.wang@linux.alibaba.com, tglx@linutronix.de, 
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com, 
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com, 
	zhuo.song@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_121006_522133_7F71E6C7 
X-CRM114-Status: GOOD (  54.47  )
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

On Mon, Jul 14, 2025 at 1:42=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
> Dear maintainer:
>
> I am writing to respectfully request your review and consideration for me=
rging
> this patch series, which addresses potential hardlockup due to infinite
> SEA excepction loop ( see bellow for details).
>
> As noted by @Catalin,
>
> > James Morse is listed as reviewer of the ACPI APEI code but he's busy
> > with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
> > maintainers, hopefully they can help.
>
> This patch series has undergone extensive review through 19 iterations Re=
ceived
> 13 'Reviewed-by' tags from various reviewers. Notably includes review app=
roval
> from arm64 ACPI maintainer Hanjun Guo.
>
> The patches have been thoroughly tested and refined based on community fe=
edback.
> I believe they are ready for integration into the mainline kernel.
>
> I would greatly appreciate your time in reviewing these changes and
> providing your ack if you find them acceptable for merging.
>
> Thank you for your continued support and maintenance of the kernel.
>
> changes since last v18:
> - add reviewed-by tag for patch 1-2 from Hanjun
>
> no code changes since last v18:
> - drop a mm/hwpoison patch which is merged into mainline
>
> changes singce v17:
> - rebase to Linux 6.13-rc7 with no functional changes
> - add reviewed-by tag for patch 1-3 from Jane Chu
> - add reviewed-by tag for patch 3 from Yazen
>
> changes singce v16:
> - add reviewed-by tag for patch 1 and patch 2 from Yazen
> - rewrite warning message for force kill (per Yazen)
> - warn with dev_err in ghes (per Jarkko)
> - add return value -ENXIO in memory_failure comments  (per Yazen)
> - Link: https://lore.kernel.org/lkml/20241104015430.98599-1-xueshuai@linu=
x.alibaba.com/
>
> changes singce v15:
> - add HW_ERR and GHES_PFX prefix per Yazen
>
> changes since v14:
> - add reviewed-by tags from Jarkko and Jonathan
> - remove local variable and use twcb->pfn
>
> changes since v13:
> - add reviewed-by tag from Jarkko
> - rename task_work to ghes_task_work (per Jarkko)
>
> changes since v12:
> - tweak error message for force kill (per Jarkko)
> - fix comments style (per Jarkko)
> - fix commit log typo (per Jarko)
>
> changes since v11:
> - rebase to Linux 6.11-rc6
> - fix grammer and typo in commit log (per Borislav)
> - remove `sync_` perfix of `sync_task_work`  (per Borislav)
> - comments flags and description of `task_work`  (per Borislav)
>
> changes since v10:
> - rebase to v6.8-rc2
>
> changes since v9:
> - split patch 2 to address exactly one issue in one patch (per Borislav)
> - rewrite commit log according to template (per Borislav)
> - pickup reviewed-by tag of patch 1 from James Morse
> - alloc and free twcb through gen_pool_{alloc, free) (Per James)
> - rewrite cover letter
>
> changes since v8:
> - remove the bug fix tag of patch 2 (per Jarkko Sakkinen)
> - remove the declaration of memory_failure_queue_kick (per Naoya Horiguch=
i)
> - rewrite the return value comments of memory_failure (per Naoya Horiguch=
i)
>
> changes since v7:
> - rebase to Linux v6.6-rc2 (no code changed)
> - rewritten the cover letter to explain the motivation of this patchset
>
> changes since v6:
> - add more explicty error message suggested by Xiaofei
> - pick up reviewed-by tag from Xiaofei
> - pick up internal reviewed-by tag from Baolin
>
> changes since v5 by addressing comments from Kefeng:
> - document return value of memory_failure()
> - drop redundant comments in call site of memory_failure()
> - make ghes_do_proc void and handle abnormal case within it
> - pick up reviewed-by tag from Kefeng Wang
>
> changes since v4 by addressing comments from Xiaofei:
> - do a force kill only for abnormal sync errors
>
> changes since v3 by addressing comments from Xiaofei:
> - do a force kill for abnormal memory failure error such as invalid PA,
> unexpected severity, OOM, etc
> - pcik up tested-by tag from Ma Wupeng
>
> changes since v2 by addressing comments from Naoya:
> - rename mce_task_work to sync_task_work
> - drop ACPI_HEST_NOTIFY_MCE case in is_hest_sync_notify()
> - add steps to reproduce this problem in cover letter
>
> changes since v1:
> - synchronous events by notify type
> - Link: https://lore.kernel.org/lkml/20221206153354.92394-3-xueshuai@linu=
x.alibaba.com/
>
> ## Cover Letter
>
> There are two major types of uncorrected recoverable (UCR) errors :
>
> - Synchronous error: The error is detected and raised at the point of the
>   consumption in the execution flow, e.g. when a CPU tries to access
>   a poisoned cache line. The CPU will take a synchronous error exception
>   such as Synchronous External Abort (SEA) on Arm64 and Machine Check
>   Exception (MCE) on X86. OS requires to take action (for example, offlin=
e
>   failure page/kill failure thread) to recover this uncorrectable error.
>
> - Asynchronous error: The error is detected out of processor execution
>   context, e.g. when an error is detected by a background scrubber. Some =
data
>   in the memory are corrupted. But the data have not been consumed. OS is
>   optional to take action to recover this uncorrectable error.
>
> Currently, both synchronous and asynchronous error use
> memory_failure_queue() to schedule memory_failure() exectute in kworker
> context. As a result, when a user-space process is accessing a poisoned
> data, a data abort is taken and the memory_failure() is executed in the
> kworker context:
>
>   - will send wrong si_code by SIGBUS signal in early_kill mode, and
>   - can not kill the user-space in some cases resulting a synchronous
>     error infinite loop
>
> Issue 1: send wrong si_code in early_kill mode
>
> Since commit a70297d22132 ("ACPI: APEI: set memory failure flags as
> MF_ACTION_REQUIRED on synchronous events")', the flag MF_ACTION_REQUIRED
> could be used to determine whether a synchronous exception occurs on
> ARM64 platform.  When a synchronous exception is detected, the kernel is
> expected to terminate the current process which has accessed poisoned
> page. This is done by sending a SIGBUS signal with an error code
> BUS_MCEERR_AR, indicating an action-required machine check error on
> read.
>
> However, when kill_proc() is called to terminate the processes who have
> the poisoned page mapped, it sends the incorrect SIGBUS error code
> BUS_MCEERR_AO because the context in which it operates is not the one
> where the error was triggered.
>
> To reproduce this problem:
>
>   # STEP1: enable early kill mode
>   #sysctl -w vm.memory_failure_early_kill=3D1
>   vm.memory_failure_early_kill =3D 1
>
>   # STEP2: inject an UCE error and consume it to trigger a synchronous er=
ror
>   #einj_mem_uc single
>   0: single   vaddr =3D 0xffffb0d75400 paddr =3D 4092d55b400
>   injecting ...
>   triggering ...
>   signal 7 code 5 addr 0xffffb0d75000
>   page not present
>   Test passed
>
> The si_code (code 5) from einj_mem_uc indicates that it is BUS_MCEERR_AO
> error and it is not fact.
>
> To fix it, queue memory_failure() as a task_work so that it runs in
> the context of the process that is actually consuming the poisoned data.
>
> After this patch set:
>
>   # STEP1: enable early kill mode
>   #sysctl -w vm.memory_failure_early_kill=3D1
>   vm.memory_failure_early_kill =3D 1
>
>   # STEP2: inject an UCE error and consume it to trigger a synchronous er=
ror
>   #einj_mem_uc single
>   0: single   vaddr =3D 0xffffb0d75400 paddr =3D 4092d55b400
>   injecting ...
>   triggering ...
>   signal 7 code 4 addr 0xffffb0d75000
>   page not present
>   Test passed
>
> The si_code (code 4) from einj_mem_uc indicates that it is BUS_MCEERR_AR
> error as we expected.
>
> Issue 2: a synchronous error infinite loop due to memory_failure() failed
>
> If a user-space process, e.g. devmem, a poisoned page which has been set
> HWPosion flag, kill_accessing_process() is called to send SIGBUS to the
> current processs with error info. Because the memory_failure() is
> executed in the kworker contex, it will just do nothing but return
> EFAULT. So, devmem will access the posioned page and trigger an
> excepction again, resulting in a synchronous error infinite loop. Such
> loop may cause platform firmware to exceed some threshold and reboot
> when Linux could have recovered from this error.
>
> To reproduce this problem:
>
>   # STEP 1: inject an UCE error, and kernel will set HWPosion flag for re=
lated page
>   #einj_mem_uc single
>   0: single   vaddr =3D 0xffffb0d75400 paddr =3D 4092d55b400
>   injecting ...
>   triggering ...
>   signal 7 code 4 addr 0xffffb0d75000
>   page not present
>   Test passed
>
>   # STEP 2: access the same page and it will trigger a synchronous error =
infinite loop
>   devmem 0x4092d55b400
>
> To fix it, if memory_failure() failed, perform a force kill to current pr=
ocess.
>
> Issue 3: a synchronous error infinite loop due to no memory_failure() que=
ued
>
> No memory_failure() work is queued unless all bellow preconditions check =
passed:
>
> - `if (!(mem_err->validation_bits & CPER_MEM_VALID_PA))` in ghes_handle_m=
emory_failure()
> - `if (flags =3D=3D -1)` in ghes_handle_memory_failure()
> - `if (!IS_ENABLED(CONFIG_ACPI_APEI_MEMORY_FAILURE))` in ghes_do_memory_f=
ailure()
> - `if (!pfn_valid(pfn) && !arch_is_platform_page(physical_addr)) ` in ghe=
s_do_memory_failure()
>
> If the preconditions are not passed, the user-space process will trigger =
SEA again.
> This loop can potentially exceed the platform firmware threshold or even
> trigger a kernel hard lockup, leading to a system reboot.
>
> To fix it, if no memory_failure() queued, perform a force kill to current=
 process.
>
> And the the memory errors triggered in kernel-mode[5], also relies on thi=
s
> patchset to kill the failure thread.
>
> Lv Ying and XiuQi from Huawei also proposed to address similar problem[2]=
[4].
> Acknowledge to discussion with them.
>
> [1] Add ARMv8 RAS virtualization support in QEMU https://patchew.org/QEMU=
/20200512030609.19593-1-gengdongjiu@huawei.com/
> [2] https://lore.kernel.org/lkml/20221205115111.131568-3-lvying6@huawei.c=
om/
> [3] https://lkml.kernel.org/r/20220914064935.7851-1-xueshuai@linux.alibab=
a.com
> [4] https://lore.kernel.org/lkml/20221209095407.383211-1-lvying6@huawei.c=
om/
> [5] https://patchwork.kernel.org/project/linux-arm-kernel/cover/202405280=
85915.1955987-1-tongtiangen@huawei.com/
>
> Shuai Xue (2):
>   ACPI: APEI: send SIGBUS to current task if synchronous memory error
>     not recovered
>   ACPI: APEI: handle synchronous exceptions in task work
>
>  drivers/acpi/apei/ghes.c | 88 +++++++++++++++++++++++++---------------
>  include/acpi/ghes.h      |  3 --
>  include/linux/mm.h       |  1 -
>  mm/memory-failure.c      | 13 ------
>  4 files changed, 55 insertions(+), 50 deletions(-)
>
> --

Both patches applied as 6.17 material with some minor edits in the changelo=
gs.

Thanks!

