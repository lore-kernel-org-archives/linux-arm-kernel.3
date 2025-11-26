Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC8ED10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMAlKyQZ4W1o56NI0K8gYAmxYW1legwujSD4ppPGA7A=; b=SIuyAAbH13iy7Img6f36QfDCD0
	Pak/aivfBIn2oPo55yvf1qLKkVnCt4oqiqRoyDW46uCQITPE6ruNzewtFLVHFULdudhTjBkKQ7np2
	fQOQZNHRaXHrAYp8xw8klJasUOmxNgDe9sPMbwSqHnCfNRJyzvT9UoLWsqkzKH0yegcEBXwApPPxI
	R+vMX41hP+Y2FEXVHkKMwgYcNQCT2zjAzm3K5jcrLywZYYCVY9BqxiLuCWFof1eol4JDX16ADpOND
	H4EwYXCGGrPuhEDLC6/5/4RK3Ogt/581gYBipHYPeLhS2WihD2pcmAuOH1Cxpv4ePUveLEd1a87l+
	beUC4jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGvF-0000000F96R-3l7R;
	Wed, 26 Nov 2025 14:55:09 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGvB-0000000F95P-02Aa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:55:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso7876859b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764168903; x=1764773703; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gMAlKyQZ4W1o56NI0K8gYAmxYW1legwujSD4ppPGA7A=;
        b=p6cyiFrAMgz8oUGvdCuuBPkB+iMTDS3Dv0J1gy2ei0MBjuOGV2H/UrSCOxFE0xMJrR
         77aajN2hUFVppnXUkNNMVaZb2NQxzp0tGIDzGaHs5K2d+QhPahtSpuphwrjqxuHwLTw8
         UGpl/WE+x4yV7UoHAd5k/8iyMKXhYIjik7R2nA6wzaW55FCbW+LCaoXpE1EaekaCOy9B
         2wqs7PQDS92b/SkaOq0z3hvarFLy3vMicuLpGJT4F7+SrZhcDBmAfSHKPLP5Re+g4GvK
         MFczr5z1Erw4jituMs36Fhmc0lfGQAqI4xt93x5YLBrH+gZwNKbrD0jErArsXT1Tc/4z
         xjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168903; x=1764773703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMAlKyQZ4W1o56NI0K8gYAmxYW1legwujSD4ppPGA7A=;
        b=M3QVtjP2/Zd4hYt1gx57l4FkxOUOZtsivef5RUXuAaFcBEU0AqlWMkGkJ5n+CPSTBp
         vz6p826fsbPaE6E95Cm35NCysRcn9tT2Eb/v5oabXaeWyVGYepjZX+zR9M74fx5FdA1b
         8BiccLZsp1npBg2Ps4W9vVKcnjlNY2GCd3svVtp3L34c2T3np3fwLL3ik2LSQhgBYeba
         2CjUcK6BJhMNt+QbSkDVlXahWCUw8fmd+lgrwrxjKkd86+WDoEtUop4Urpbn207G2chg
         R8298oy9Rzw0kqERAOUywJQ6gpaSwUADac1gzs01g1yLNLPw5NpWGdsG8kN8eWb0qek/
         MM5w==
X-Forwarded-Encrypted: i=1; AJvYcCV58MZn1ShDlNUrxvi+bBD+h7Bc8ZVbL9ZKno4rpXa+XMoKOGj/zjK/5q1yGp9afTUidQuU3sRm+St1rzvHGNi/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2DIRt/mDSGBA2rUYzK80SuKhVrROm54wRqyizRiQK+Ggk7J+z
	6VhKKgz5spkuCna60SFQvuBNAZnhnTlrITuhEDYcZGEM6AvKhOv/J0vVyr35t7vkJEn2FiDY7eE
	MI4+nJLl9Yai8khKehaLlW9PIQ7Sxjid/YQWWW39V
X-Gm-Gg: ASbGncsUDs9OqBx8/MozuMc6iNXaD2DbHNqlrxibDiYrHZkjbJb4T12MBA1/oRjOZmv
	M6VdH7vehNYYHXGpgCy7lU5Chtrpdh7kbJZK4sdUyPk/gFt6cMAWb2AuPzYoyrJfFWQf5mXDAuG
	HcNQ3Hj6myr4WyC28ei19gvtnu7nexjCRlpSqq91RNYj7OReyEWxbvx/hsbPJTeR2eWc+bUZy57
	UtdpdZpawRXPUhtCJDicLNpflrcIfg6fBd6Jc7gurNYQ4YPC8TPrSCi6Fp4GPzq8i31uKTkOTl9
	yW9POHgRmfU26ozS4RccycEEAIk=
X-Google-Smtp-Source: AGHT+IHBzLs9oB17QaQDXDcDSkt3GF6reTzmdGSXuSykjIbrozIhYaExrIXyN9YI1bM4Cxw+CXR/CG3RNk2OXQwp9cE=
X-Received: by 2002:a05:7022:690:b0:119:e569:fbb5 with SMTP id
 a92af1059eb24-11c9d864eebmr14056160c88.36.1764168902698; Wed, 26 Nov 2025
 06:55:02 -0800 (PST)
MIME-Version: 1.0
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu> <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
In-Reply-To: <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
From: Marco Elver <elver@google.com>
Date: Wed, 26 Nov 2025 15:54:26 +0100
X-Gm-Features: AWmQ_bkdcQGpEywajea9M9MaObnxb3B6H0v13jPKgL3UpjH7060tA1EcV-cDw3g
Message-ID: <CANpmjNOsSmKUxrLxTWYMD3RKnzSw5dfM=7QNJ02GMFG7BMeOGA@mail.gmail.com>
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
To: Breno Leitao <leitao@debian.org>
Cc: glider@google.com, dvyukov@google.com, usamaarif642@gmail.com, 
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, 
	john.ogness@linutronix.de, pmladek@suse.com, linux@armlinux.org.uk, 
	paulmck@kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_065505_053789_69425E03 
X-CRM114-Status: GOOD (  27.40  )
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

On Wed, 26 Nov 2025 at 15:13, Breno Leitao <leitao@debian.org> wrote:
>
> On Tue, Nov 25, 2025 at 08:02:16AM -0800, Breno Leitao wrote:
> > 6. Meanwhile, kfence's toggle_allocation_gate() on another CPU attempts to
> > perform a synchronous operation across all CPUs, which correctly triggers a CSD
> > lock timeout because CPU#0 is stuck in the busy loop with IRQs disabled.
>
> I've hacked a patch to disable kfence IPIs during machine shutdown, and
> with it loaded, I don't reproduce the problem described in this thread.
>
>         Author: Breno Leitao <leitao@debian.org>
>         Date:   Tue Nov 25 07:21:55 2025 -0800
>
>         mm/kfence: add reboot notifier to disable KFENCE on shutdown
>
>         Register a reboot notifier to disable KFENCE and cancel any pending
>         timer work during system shutdown. This prevents potential IPI
>         synchronization issues that can occur when KFENCE is active during
>         the reboot process.
>
>         The notifier runs with high priority (INT_MAX) to ensure KFENCE is
>         disabled early in the shutdown sequence.
>
>         Signed-off-by: Breno Leitao <leitao@debian.org>
>
>         diff --git a/mm/kfence/core.c b/mm/kfence/core.c
>         index 727c20c94ac5..5810afaaf6b4 100644
>         --- a/mm/kfence/core.c
>         +++ b/mm/kfence/core.c
>         @@ -26,6 +26,7 @@
>         #include <linux/panic_notifier.h>
>         #include <linux/random.h>
>         #include <linux/rcupdate.h>
>         +#include <linux/reboot.h>
>         #include <linux/sched/clock.h>
>         #include <linux/seq_file.h>
>         #include <linux/slab.h>
>         @@ -819,6 +820,21 @@ static struct notifier_block kfence_check_canary_notifier = {
>
>         static struct delayed_work kfence_timer;
>
>         +static int kfence_reboot_callback(struct notifier_block *nb,
>         +                                 unsigned long action, void *data)
>         +{
>         +       /* Disable KFENCE to avoid IPI synchronization during shutdown */
>         +       WRITE_ONCE(kfence_enabled, false);
>         +       /* Cancel any pending timer work */
>         +       cancel_delayed_work_sync(&kfence_timer);
>         +       return NOTIFY_OK;
>         +}
>         +
>         +static struct notifier_block kfence_reboot_notifier = {
>         +       .notifier_call = kfence_reboot_callback,
>         +       .priority = INT_MAX, /* Run early to stop timers ASAP */
>         +};

Just place it under the #ifdef CONFIG_KFENCE_STATIS_KEYS below, I do
not think this is required if CONFIG_KFENCE_STATIC_KEYS is unset.

>         #ifdef CONFIG_KFENCE_STATIC_KEYS
>         /* Wait queue to wake up allocation-gate timer task. */
>         static DECLARE_WAIT_QUEUE_HEAD(allocation_wait);
>         @@ -901,6 +917,8 @@ static void kfence_init_enable(void)
>                 if (kfence_check_on_panic)
>                         atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
>
>         +       register_reboot_notifier(&kfence_reboot_notifier);
>         +
>                 WRITE_ONCE(kfence_enabled, true);
>                 queue_delayed_work(system_unbound_wq, &kfence_timer, 0);
>
>
> Alexander, Marco and Kasan maintainers:
>
> What is the potential impact of disabling KFENCE during reboot
> procedures?

But only if CONFIG_KFENCE_STATIC_KEYS is enabled?
That would be reasonable, given our recommendation has been to disable
CONFIG_KFENCE_STATIC_KEYS since
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4f612ed3f748962cbef1316ff3d323e2b9055b6e
in most cases.

I believe some low-CPU count systems are still benefiting from it, but
in general, I'd advise against it.

> The primary motivation is to avoid triggering IPIs during the machine
> teardown process, mainly when the nbconsole is not running in threaded
> mode.

Thanks,
-- Marco

