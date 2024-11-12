Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A520D32D7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmEMMtf/H6NHxiwIDkXtkXjM/8+TQ4BBA2hjpYSmZBc=; b=Mh8lNXgQmdHnj1V+0Dgv5ICBQ3
	T+iQLxoCVUxKC8yMljXpDleerV+I0ttZlAEVTZv4bQ70VAqcL9rLc853VxA4vH6Uas1MwgCUVD7mZ
	dM3gRVlguRHH8DLeO2gYlm7eTHGEecozEr0dYatFLDvHQQycHs4PerDWJqq04bUtNac6hzdv1MbS/
	KbT2UOe5QPhDMloosrhld+y1n0NfLDkwPvha4w08KK9aMs2L0Sd8bLvIsZRJqlD+0XWQNG1WqQQ4A
	6LCA/AtjUTi+xIIQNtlYO88EdySHCYQQH55cLr/KVrHs5WyCPuQuErT05Orsgp7ap6yDTeGprWvu2
	wV4RInuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnKe-00000002thn-24Mg;
	Tue, 12 Nov 2024 09:37:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnGN-00000002pfo-3NST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:32:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e6c754bdso5397278e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731403958; x=1732008758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmEMMtf/H6NHxiwIDkXtkXjM/8+TQ4BBA2hjpYSmZBc=;
        b=JaRV71xsZBG/lMbm78hmb5BcrNYiynQlWfjIy4eBKIB1mXBxNLKSZiBuA6eD37dnI5
         snXO0htGS2k0Fxj3yKE0aXIY0rebkdD7/g4/oyPR6tzndfd0GA72Gisz4UZtt9DdnVyA
         pm8BfJlPvkDlwN5D+KAkNsJNLsgm5LC3jpg7x1GLv1JU6krH0sJVlCT9oc4BkuDs7Aoq
         VuJBfMT3XUEqPMStLd/Jg2ASOLzF2hkj5VrOv2ksDVzxnE9A1UhBbcf7oXsFJl0EyH2n
         wKYI3GWEi4WVBraa4Sb/v4BloapfbTpXFGfPyGVtf88v6+MWmp3rtAuqYVuB5HIa0P7z
         zenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403958; x=1732008758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmEMMtf/H6NHxiwIDkXtkXjM/8+TQ4BBA2hjpYSmZBc=;
        b=Ga/BcsVsfoQYsN9/RL3fYUimLEPALYqWeR3M/XHLrCdF3Q22fjsFfxw0TujxkYl79c
         PgkL7igy92E3Ffb0gczVzRSHe5LWNPBaBgMaYRX0Z7uG3lL2P8flHge7N6XPPLVq4JXX
         aUx+SjKXg7w75MYFf5ENKRysD9vMQK9xZkfWU14XfKNobiAWmhqlF4EsHC5OufW6tMEA
         PCmZl5o4R5dmqbzTgHh9QW1oWY4Hi8Q1zdQUbM4HXZJ5OIxIvabeYDbwLELXXGclBcQ2
         XK++AxJufNP5hRPltXC5J8n8LIxPO7Xk4lrtmjXB48dCDcaRaH2HKpOShr3/oW8X/pRk
         7Bzg==
X-Gm-Message-State: AOJu0YwzYb7KwdDLU1GCFXcXMI555r+cgeCHJiHajLYMelUS1ONrD6Wi
	/XzbVPqhcxnb15ynTjnziwqzmVg2Ax1mn00jgpQHHs5hW8Z+RQ7+
X-Google-Smtp-Source: AGHT+IEGzMD4CQHrVZz7i2b8hgEFwUsv2cHjAkR8UPEY/r2EfFd9HA1jM+513+OHfjzmbNs4ECZmuA==
X-Received: by 2002:a05:6512:1255:b0:539:fcba:cc6d with SMTP id 2adb3069b0e04-53d8626c818mr6835328e87.42.1731403957725;
        Tue, 12 Nov 2024 01:32:37 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a721csm1833134e87.160.2024.11.12.01.32.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 01:32:36 -0800 (PST)
Date: Tue, 12 Nov 2024 10:32:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112103229.566b1ff3@foxbook>
In-Reply-To: <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_013244_264619_DCCE22DF 
X-CRM114-Status: GOOD (  27.56  )
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

Hi Linus,

On Tue, 12 Nov 2024 02:15:19 +0100, Linus Walleij wrote:
> We are trying to locate the issue, which I think is the same as this
> but not sure:
> https://bugzilla.kernel.org/show_bug.cgi?id=219247

You can verify by asking the reporter to run the crashing program under
strace. If SIGSEGV follows a failed cacheflush, it's my bug most likely.

A straightforward repro of this bug:
gdb
GUILE_JIT_THRESHOLD=0 gdb
GUILE_JIT_THRESHOLD=-1 gdb

Expected outcome: segfault, segfault, shows command prompt.

> I have been trying to replicate it on a Chromebook but didn't get so
> far yet because the installation is pretty idiomatic :/ also there is
> only appears in a single Qt program and not as predictable as here.

My bug also appears in a single program ;) This system works fine, but
any JIT is broken by this kind of bug. The failure may be random if the
caches resynchronize by a fluke, but with gdb it was every time so far.

> But. It appears the code is issuing cacheflush() which I guess ends
> up in arm_syscall() here:
> 
>         case NR(cacheflush):
>                 return do_cache_op(regs->ARM_r0, regs->ARM_r1, regs->ARM_r2);
> 
> To here:
> 
> static inline int
> do_cache_op(unsigned long start, unsigned long end, int flags)
> {
>         if (end < start || flags)
>                 return -EINVAL;
> 
>         if (!access_ok((void __user *)start, end - start))
>                 return -EFAULT;
> 
>         return __do_cache_op(start, end);
> }

Yep. I added printks here and it is particularly the call to
flush_icache_range() from __do_cache_op() which returns -EFAULT.

> Here userspace access should be fine because we have entered a
> syscall from userspace. I tried to emulate the situation with this
> program:
> 
> #include <stdlib.h>
> #include <stdio.h>
> #include <errno.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <sys/mman.h>
> 
> #define NR_cacheflush 0xf0002
> 
> /* libgcc */
> extern void __clear_cache(void *, void *);
> 
> int main (int argc, char **argv) {
>   void *addr;
>   int ret;
> 
>   printf("Test()\n");
>   addr = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC,
>               MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
>   if (addr == MAP_FAILED) {
>     printf("mmap() failed\n");
>     exit(1);
>   }

This seems incomplete, there is no __clear_cache(). But if you add it
at the end then yes, it should fail. Confirm it with strace.

> I added prints in the cacheflush trap:
> 
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 480e307501bb..400650519bd1 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned
> long end) static inline int
>  do_cache_op(unsigned long start, unsigned long end, int flags)
>  {
> +       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
>         if (end < start || flags)
>                 return -EINVAL;
> 
> -       if (!access_ok((void __user *)start, end - start))
> +       if (!access_ok((void __user *)start, end - start)) {
> +               pr_err("ACCESS NOT OK\n");
>                 return -EFAULT;
> +       }
> 
>         return __do_cache_op(start, end);
>  }

You also need to check what __do_cache_op() returns.

Regards,
Michal

