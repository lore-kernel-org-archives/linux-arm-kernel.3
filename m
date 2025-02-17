Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1099EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+UsSXYo2ga0Tyi4tOLZzBPl69neKftwGKEChrHrVkU=; b=XNNTdv/WASrSDmr29Ny9oZDbvo
	NPrycUeJlBaHBYeSE0H2EfNUno27el7ICqfMBiDjO36rBJo1D8Z7d1vnRgBDOLVvy/K+hII4uDYw0
	bgSYqmOSDDTqqmOmk2XeBT23YzhlWX3Gt1GKNi/12xGKqdG8oFHzJbBSxttSp1poKU5MBO+2A+saz
	ecbq4GdKVD8hq/XlZrBzXENuL5S2T4EN3RlvTsR5WLnB2j87eHv3ngnOzIVSIngdbe2nSVYBkn8xW
	u80Wi9TSYwuEPRL3JvY7QWmfgszKTQc6JDNUwglkuO2nZlC4PDb0iN3/XjCjGQvRkbXApVy4IcY4r
	/uwHvqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1SG-00000004j5G-3N47;
	Mon, 17 Feb 2025 13:46:36 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1Qn-00000004iq3-0hCs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:45:06 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so2037855276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739799904; x=1740404704; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+UsSXYo2ga0Tyi4tOLZzBPl69neKftwGKEChrHrVkU=;
        b=E8hWtR9jDeFjKLaAWEXOtnEZdN/eW6WSc6Blhy1Hw0tAQKWWOGvppR1L2tmOACbq0M
         qBBdl2lmN/GQFu8rzYPGnHRlUF9iJDgoT/nq5SovGLZG98E76BVAZJ+Vzmuup077jV+o
         FrCfRmoTz5lxV+HiCR5KSluSmkXfKRGAlcIAfSVSOPX1SBOP56WfiASF96ikw2K1dmFh
         IaKaIfZSB1Lbud9lksTLtyJH4qW0DZHnDvoq5bGkJrwgN00UDLGbpUez8u23Q2FrW7YU
         zEMc0qdFjEIHD0Tb3XFYDeRgY/xM7LlAF/NMddcCFQUiTUAEqmBPKVHN7Oc5PJLFsb8g
         HM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799904; x=1740404704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+UsSXYo2ga0Tyi4tOLZzBPl69neKftwGKEChrHrVkU=;
        b=CD7/F/qmI+TB6/IJJ9Dc3lsS8N1r6hpueHRitZPgpGYbBiAYwLVo7V/hutP+xUGfWr
         brIElWY5SQCALk1DqG0nXzXORE+0qLIoSJ8zINadRDC6Qso+Qvb4FyhzAk51WcT0mgU2
         XiUZIInGr4hhx51b10RGgiFmanAJJT/oiW78Qt1Yp3qgfTXk7FoiqngfZUgmdaH6537k
         x0LwWYWguwk4qzmY/3cZei8/92azo4uf8kXykocgGEwDhJu8fl6uqegyulJ14Zx360HP
         k/lK2h7W3MHswZMXov9HqovyBbp0zO9izvDikkEZNMBSgWofAW/WB5l0evlneAulZMYh
         jqCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQzPFkoKvLmbgygRXQbP7TD0BoUoar0pRzquaQWYbPjnsq8TM16Gh5jRpBKFPnJNCJHRnIBwiutwRK/n2+PtfH@lists.infradead.org
X-Gm-Message-State: AOJu0YzlQynkyivEQSULPLDGqIVRF0LqX/4iuBMftEdbgLP2534Y7upr
	VcPyAhxua9pbAsSm7jsXnAk9AJ/p+2VC41WnPT4ImBhIUMpqcd/B/t+g4CECBSnCBf4qtmaFK0A
	/TWWM3JvNL0HlTk2wB0OOjmxKsabAL+EezhETLw==
X-Gm-Gg: ASbGncvscow7aFsQJUUz0YvSH2XsOjkfiKiXKvc6f3zDnUIxbRTOrrhCWSgXQSalfe5
	A8BI2SYhtEwfluVddwiLtWuZi/wel2AGKMsW2jVymYDAUesaQXWL0IPB7Z/4lrgz3r+n4Z04VKQ
	==
X-Google-Smtp-Source: AGHT+IFwm/mDqHth8/B/J2U9h8dFtorqOZBoT4t+LjnjdnozWXFMI7irJv+LBN7mF0tOQfF16XjitkQjg935Mk3+pG4=
X-Received: by 2002:a05:6902:27c4:b0:e5d:ce4f:66ba with SMTP id
 3f1490d57ef6-e5dce4f6a09mr4587750276.46.1739799903844; Mon, 17 Feb 2025
 05:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250210055828.1875372-1-keyz@google.com>
In-Reply-To: <20250210055828.1875372-1-keyz@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Feb 2025 14:44:28 +0100
X-Gm-Features: AWEUYZkhcOiOPHPRB32A0szYwISzmq1cUWV_OtOCbi8uCd62e9ysZ4rFpLd2LWo
Message-ID: <CAPDyKFor_kP1hcNC1YwLBjH=eaLG9qSyvOYvj+FQrNu8Piu2Dg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND] cpuidle: psci: Add trace for PSCI domain idle
To: Keita Morisaki <keyz@google.com>
Cc: linux-kernel@vger.kernel.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, aarontian@google.com, 
	yimingtseng@google.com, Dhruva Gole <d-gole@ti.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_054505_205660_367B3A73 
X-CRM114-Status: GOOD (  17.98  )
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

On Mon, 10 Feb 2025 at 06:58, Keita Morisaki <keyz@google.com> wrote:
>
> The trace event cpu_idle provides insufficient information for debugging
> PSCI requests due to lacking access to determined PSCI domain idle
> states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
> idle states the power domain has.
>
> Add new trace events namely psci_domain_idle_enter and
> psci_domain_idle_exit to trace enter and exit events with a determined
> idle state.
>
> These new trace events will help developers debug CPUidle issues on ARM
> systems using PSCI by providing more detailed information about the
> requested idle states.
>
> Signed-off-by: Keita Morisaki <keyz@google.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v1->v2: Split the ftrace event into two (psci_domain_idle_(enter|exit))
>         and rephrase the commit message accordingly. Rebased onto the latest.
> v2->v3: Add "Reviewed-by: Steven Rostedt"
> v3->v4: Add the Tested-by label
> v4->v5: Add "Reviewed-by: Dhruva Gole"
>
> Hopefully this patch gets attention from maintainers of
> drivers/cpuidle/cpuidle-psci.c too.
>
>  drivers/cpuidle/cpuidle-psci.c |  3 +++
>  include/trace/events/power.h   | 37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2562dc001fc1..dd8d776d6e39 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -25,6 +25,7 @@
>  #include <linux/syscore_ops.h>
>
>  #include <asm/cpuidle.h>
> +#include <trace/events/power.h>
>
>  #include "cpuidle-psci.h"
>  #include "dt_idle_states.h"
> @@ -74,7 +75,9 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
>         if (!state)
>                 state = states[idx];
>
> +       trace_psci_domain_idle_enter(dev->cpu, state, s2idle);
>         ret = psci_cpu_suspend_enter(state) ? -1 : idx;
> +       trace_psci_domain_idle_exit(dev->cpu, state, s2idle);
>
>         if (s2idle)
>                 dev_pm_genpd_resume(pd_dev);
> diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> index d2349b6b531a..9253e83b9bb4 100644
> --- a/include/trace/events/power.h
> +++ b/include/trace/events/power.h
> @@ -62,6 +62,43 @@ TRACE_EVENT(cpu_idle_miss,
>                 (unsigned long)__entry->state, (__entry->below)?"below":"above")
>  );
>
> +DECLARE_EVENT_CLASS(psci_domain_idle,
> +
> +       TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
> +
> +       TP_ARGS(cpu_id, state, s2idle),
> +
> +       TP_STRUCT__entry(
> +               __field(u32,            cpu_id)
> +               __field(u32,            state)
> +               __field(bool,           s2idle)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->cpu_id = cpu_id;
> +               __entry->state = state;
> +               __entry->s2idle = s2idle;
> +       ),
> +
> +       TP_printk("cpu_id=%lu state=0x%lx is_s2idle=%s",
> +                 (unsigned long)__entry->cpu_id, (unsigned long)__entry->state,
> +                 (__entry->s2idle)?"yes":"no")
> +);
> +
> +DEFINE_EVENT(psci_domain_idle, psci_domain_idle_enter,
> +
> +       TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
> +
> +       TP_ARGS(cpu_id, state, s2idle)
> +);
> +
> +DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
> +
> +       TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
> +
> +       TP_ARGS(cpu_id, state, s2idle)
> +);
> +
>  TRACE_EVENT(powernv_throttle,
>
>         TP_PROTO(int chip_id, const char *reason, int pmax),
>
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> --
> 2.48.1.362.g079036d154-goog
>

