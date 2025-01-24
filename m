Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F1C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dqwYTTHItjIM6ghqeOt0STczPqUYZ5EwZI5o2uzaA0=; b=F1fdUaFMDzEBZN45WrTbczFBtu
	RCeNIVY2ireQwG/QB0cXBfalz0oXOIRczGZ1xf5fWZCfjALqORbeD9UFd3XpaTpOidYnMt06Usd9B
	qyJMAw3AwwFvwHjv9pocX9DReoeooHdLjQiNf8WxEq/r1VbTyKL9jZNf8DSGWKj2jpSp1+ZZemRXw
	2U79Pp4igIhihChRnnV8nI0OzziUpa86rYsNM0D6GShHpNY0k+StMTi2T5wCRqjrltAqwro8h5J9b
	P6NxckbTaCw3dTjizjwLap8JpQafobdP9Ng49movZ8GZTEb1cznexblls2Ms4mwHhY/btyjFEc56I
	EzH7CiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHWu-0000000EXH7-3S2c;
	Fri, 24 Jan 2025 11:07:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHVW-0000000EX8r-1eVR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 11:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63328A414DF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 11:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23191C4CEE6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737716749;
	bh=CBFb9cadK6CI8XSq0vtxlBS7O6t7I082PLHFx/6xqJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e2xss22X+GyHcg3L8RAGJnHI3wDEOvPUmDUd72VUO16PECn3RbKh71bUJsCjz4MHd
	 34alIyJ7KAOL1PhHPmxJ8W6ZekOE7ybWqTa8Yi/U5HZVx5iPXhA7OQsPv/iDuqwGdD
	 RIoAyWvWanAC5dkN7+Vej8NoM8kxx4GFamPhoe4GdoZ4pWSeVhC8DVAMStEOXmq/IH
	 b9xNJyKxptQn4ZmyTBB2eKnumhh359jLGlyW5QahtLgPUgFatOjU2FaacQhNvAWxZB
	 Q7fZYMvH/pSF/rbwsu8wZDf4msxdCVQ5/q+XOaDGzvw3VuUt/w/QtKOeNm+aFsPuEO
	 qOqYyDaSZwucA==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3eba7784112so1094579b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 03:05:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsTd6kwIeab7N+BBE118K7pzuqSMx4O62ITBejoGRs06Z023U8n0vceodNkzUHlAMHZvjZFtFUJkMfIQNchrA0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxyp7BMqSqhpQ1hy/SAogOitVNQbjlhQr2xtmDnAhSrbEP/KL1
	d2mizkd17B74H+vnA6YE2G4Bfx+bYuTT99uKkMV6e1JXZWjLzshhf8m8gELcfJEwEpOVo1KS9XM
	dg0YfvmLEW+teHEukeTXkcdbM3No=
X-Google-Smtp-Source: AGHT+IF9SQa/+bL5eAQooEMEc4F5um8UWTrom9xFFpSH41EcICfOloxWkQjjLH9ovO30qYEM+acRaxA2bbdUNAtBaco=
X-Received: by 2002:a05:6871:6187:b0:29e:4a13:603f with SMTP id
 586e51a60fabf-2b1c09e6ad7mr17574182fac.4.1737716748305; Fri, 24 Jan 2025
 03:05:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737707712.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 24 Jan 2025 12:05:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
X-Gm-Features: AWEUYZn3vDpFuQgrmPTKrUBYJK1_bLxZl9mOCsSZPYdX_ojBCvjxJpMU7z9GFhg
Message-ID: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Cristian Marussi <cristian.marussi@arm.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Hector Martin <marcan@marcan.st>, 
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Perry Yuan <perry.yuan@amd.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Sven Peter <sven@svenpeter.dev>, 
	WANG Xuerui <kernel@xen0n.name>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	arm-scmi@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_030550_562695_28C7A53F 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Jan 24, 2025 at 9:58=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Hello,
>
> The boost feature can be controlled at two levels currently, driver
> level (applies to all policies) and per-policy.
>
> Currently most of the drivers enables driver level boost support from the
> per-policy ->init() callback, which isn't really efficient as that gets c=
alled
> for each policy and then there is online/offline path too where this gets=
 done
> unnecessarily.
>
> Also it is possible to have a scenario where not all cpufreq policies sup=
port
> boost frequencies. And letting sysfs (or other parts of the kernel) enabl=
e boost
> feature for that policy isn't correct.
>
> Simplify and cleanup handling of boost to solve these issues.

I guess this depends on the previous series?

> Pushed here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boos=
t
>
> Rebased over few dependencies from PM tree, will push to the arm-cpufreq =
tree
> after merge window is closed.
>
> Viresh Kumar (15):
>   cpufreq: staticize cpufreq_boost_trigger_state()
>   cpufreq: Export cpufreq_boost_set_sw()
>   cpufreq: Introduce policy->boost_supported flag
>   cpufreq: acpi: Set policy->boost_supported
>   cpufreq: amd: Set policy->boost_supported
>   cpufreq: cppc: Set policy->boost_supported
>   cpufreq: Restrict enabling boost on policies with no boost frequencies
>   cpufreq: apple: Set .set_boost directly
>   cpufreq: loongson: Set .set_boost directly
>   cpufreq: powernv: Set .set_boost directly
>   cpufreq: scmi: Set .set_boost directly
>   cpufreq: dt: Set .set_boost directly
>   cpufreq: qcom: Set .set_boost directly
>   cpufreq: staticize policy_has_boost_freq()
>   cpufreq: Remove cpufreq_enable_boost_support()
>
>  drivers/cpufreq/acpi-cpufreq.c      |  3 +++
>  drivers/cpufreq/amd-pstate.c        |  4 ++--
>  drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
>  drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
>  drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
>  drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
>  drivers/cpufreq/freq_table.c        |  7 +++++--
>  drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
>  drivers/cpufreq/powernv-cpufreq.c   |  5 +----
>  drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
>  drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
>  include/linux/cpufreq.h             | 20 ++++++-------------
>  12 files changed, 35 insertions(+), 95 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>

