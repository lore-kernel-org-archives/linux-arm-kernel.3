Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB61CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IokSDhSQKkPKqVDUsmpbY8pfE2HypH7GPpU5B3pqfWE=; b=f3bCD61qb8SMryiC8EX3BmNXIa
	zJtSdEQoU6iEnRxDxZ1bX7ArhI/dMsU0d6CU5IDjwHKyFiEvc2l02IUrwd4fAobSf5LsXVlIlis7B
	7bTCkdaaAaD7xXrVBGpT972rSIP8jKZ6gZL4IUyXZpBW4dMiu4zLzcse0DBXdytJXBOAxToAIbaiR
	X5VTRofBu5Ud1BF9rP+Xedri1FL6KThIqFS+qd0AzTOJ+QAuWcYq85xef8Za+JAvjoZiWvSb+1DOM
	aOsPJSVMVHIPJoXI5Hcu+DT+8zBhPi/iosXeYyG3ZiPVGC4+W/Qx0I2Yi+WYQmd8/GHtn2MtX/9di
	zx/Xa+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZzK-0000000DOzP-1XoJ;
	Wed, 05 Nov 2025 09:39:34 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZzH-0000000DOz2-3abq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:39:33 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-94822ad1baeso484233639f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762335570; x=1762940370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IokSDhSQKkPKqVDUsmpbY8pfE2HypH7GPpU5B3pqfWE=;
        b=PmaF/suh50n8NGSPuijPyh7Rn19EF0R6SuoRf6DmyhiYViylJ+8ygy23vvYhJjP41Z
         ukm4lJ2jWu9ZKjZjj3Vtlj7gaUp8Sy6zJDz00ZMK0Kf7JaAgY8u8O36IR2sbxpO1NR60
         noEkiK76xrmYRuHu1qRPtjic9NyAH+G1aY22caufKaS7u6gb5UTFSJAEAwPxwyH2rTuL
         O7EgpOV0iVhWIgtZUZFNCpavgbye3EWppis9KptYhdT2LF8IS4SCJFh27Hbh3N2oumWl
         Ylc+8wZqYPHgBNsU62myG416FK/rmcX9EfBFuDaFuLL1X8ccUV5rUklghbfEBlBrjNep
         rSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762335570; x=1762940370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IokSDhSQKkPKqVDUsmpbY8pfE2HypH7GPpU5B3pqfWE=;
        b=ctdSg1Qdf7mPNkzpvHArbPXIo84zJ+96VgIxL4lrHuMHeyE+Hxb+pJuznmbQ7gB2fs
         LF1tVCtveIX+z3hLJ+dCPfy4gvf4gl9PAwiF++U2MSO1irAqeGiJQl+EUMFeVNRU9fBS
         q0IXGSSfl2zuK3/OvwElHg3izKyCzKJrN/X8lrjbf+WyFhZJJtzH+njgzg7DY4ELB9YT
         FJrz6RVamPXdpvR9cFXkEim8qAnLKzQHIzJFn3qnq+pNQgyiYUQkuLpVa/6hM955qY66
         eyaO/hcfh77vYz5825PT/Tq1r3AvHkRp7EjvqMe8LN01OsF/9HIDs+EM11A1a5ldjimh
         SYvA==
X-Forwarded-Encrypted: i=1; AJvYcCWwe4q0WHusqtT5SBVItfKJWZ0BS6QUNU1QiATBKagFDlAQcmIplVsE5R/OqFn4m+NO1KMrN5IeIbrkfaAl6u7t@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKCq5+wGJ2mslyu5up2ManEN9zUIsLWir5WzFyN7+If+wr/YR
	jzwql2iTHuJDekmaAv+n+N2Cu9pK2qEJpNW8i7gOeO5ktOJ3UrT51RJeA9G579Ch5PRw4EoFDz5
	NWOJaQtHJGHqhoaQ4XZkbjzdMU7Lnsn5bc9+ecmbD
X-Gm-Gg: ASbGncsN4EU4WT67Grhdt9bMGCuyWxq4sLQQXEwOu/Fx8N/DXgVS2Uun9yjuGu1/XhA
	Kl+7cD+Mgpo/pT18ktgLGAuESa08bis2eaon2hXpHbqL6bPHTy7KXt98M/TEcwhd4SDHKgx8qZw
	n/kH+qjS/AEvIuY47xkKvi2JKgN4kjMW7SQn34PyuPloJ7WnDlB4IzmfeVx6nTFBjzzOVYD+gPT
	JAAS2c1+ERJL+J4x4JXRZuwbsqplNTFvgSd4y6HCkRmxMEJ68/nmDLpRoLk7CoDlHRetphlsXXI
	9BX4nOT2F+75qfQWeN+GDRhngw==
X-Google-Smtp-Source: AGHT+IGXLbbRU5MhL2X6azrT9+Ed7fePpTvasCLz4jFrgzitDBWxITHaWT5lJQbLWmk2HCxh3hRCi/RttZSE4Xvr3cw=
X-Received: by 2002:a05:6e02:221a:b0:425:7534:ab09 with SMTP id
 e9e14a558f8ab-4334078f120mr35093715ab.7.1762335569928; Wed, 05 Nov 2025
 01:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20251017185645.26604-1-james.morse@arm.com>
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 5 Nov 2025 10:39:17 +0100
X-Gm-Features: AWmQ_bn8Nja5HuwDjw2eZbobrBQf02LNxNGny9JK1-OjQ312TKkOMmFAuKxVAX4
Message-ID: <CALPaoCjbDyvRbW2bcrhB3opF1ieDLhv1961Gr7vYv=k-nzC27Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/29] arm_mpam: Add basic mpam driver
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com, amitsinght@marvell.com, 
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com, baisheng.gao@unisoc.com, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013931_912614_2E90E6E6 
X-CRM114-Status: GOOD (  33.15  )
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

Hi James,

On Fri, Oct 17, 2025 at 8:57=E2=80=AFPM James Morse <james.morse@arm.com> w=
rote:
>
> Hello,
>
> A slew of minor changes, nothing really sticks out.
> Changes are noted on each patch.
>
> ~
>
> This is just enough MPAM driver for ACPI. DT got ripped out. If you need =
DT
> support - please share your DTS so the DT folk know the binding is what i=
s
> needed.
> This doesn't contain any of the resctrl code, meaning you can't actually =
drive it
> from user-space yet. Because of that, its hidden behind CONFIG_EXPERT.
> This will change once the user interface is connected up.
>
> This is the initial group of patches that allows the resctrl code to be b=
uilt
> on top. Including that will increase the number of trees that may need to
> coordinate, so breaking it up make sense.
>
> The locking got simplified, but is still strange - this is because of the=
 'mpam-fb'
> firmware interface specification that is still alpha. That thing needs to=
 wait for
> an interrupt after every system register write, which significantly impac=
ts the
> driver. Some features just won't work, e.g. reading the monitor registers=
 via
> perf.
>
> I've not found a platform that can test all the behaviours around the mon=
itors,
> so this is where I'd expect the most bugs.
>
> The MPAM spec that describes all the system and MMIO registers can be fou=
nd here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=3Den
> (Ignored the 'RETIRED' warning - that is just arm moving the documentatio=
n around.
>  This document has the best overview)
>
> The expectation is this will go via the arm64 tree.
>
>
> This series is based on v6.18-rc4, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driv=
er/v3
>
> The rest of the driver can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snap=
shot/v6.18-rc1
>
> What is MPAM? Set your time-machine to 2020:
> https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
>
> This series was previously posted here:
> [v2] lore.kernel.org/r/20250910204309.20751-1-james.morse@arm.com
> [v1] lore.kernel.org/r/20250822153048.2287-1-james.morse@arm.com
> [RFC] lore.kernel.org/r/20250711183648.30766-2-james.morse@arm.com
>
>
> James Morse (27):
>   ACPI / PPTT: Add a helper to fill a cpumask from a processor container
>   ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear
>     levels
>   ACPI / PPTT: Find cache level by cache-id
>   ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
>   arm64: kconfig: Add Kconfig entry for MPAM
>   ACPI / MPAM: Parse the MPAM table
>   arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
>   arm_mpam: Add the class and component structures for firmware
>     described ris
>   arm_mpam: Add MPAM MSC register layout definitions
>   arm_mpam: Add cpuhp callbacks to probe MSC hardware
>   arm_mpam: Probe hardware to find the supported partid/pmg values
>   arm_mpam: Add helpers for managing the locking around the mon_sel
>     registers
>   arm_mpam: Probe the hardware features resctrl supports
>   arm_mpam: Merge supported features during mpam_enable() into
>     mpam_class
>   arm_mpam: Reset MSC controls from cpuhp callbacks
>   arm_mpam: Add a helper to touch an MSC from any CPU
>   arm_mpam: Extend reset logic to allow devices to be reset any time
>   arm_mpam: Register and enable IRQs
>   arm_mpam: Use a static key to indicate when mpam is enabled
>   arm_mpam: Allow configuration to be applied and restored during cpu
>     online
>   arm_mpam: Probe and reset the rest of the features
>   arm_mpam: Add helpers to allocate monitors
>   arm_mpam: Add mpam_msmon_read() to read monitor value
>   arm_mpam: Track bandwidth counter state for overflow and power
>     management
>   arm_mpam: Add helper to reset saved mbwu state
>   arm_mpam: Add kunit test for bitmap reset
>   arm_mpam: Add kunit tests for props_mismatch()
>
> Rohit Mathew (2):
>   arm_mpam: Probe for long/lwd mbwu counters
>   arm_mpam: Use long MBWU counters if supported
>
>  arch/arm64/Kconfig                  |   25 +
>  drivers/Kconfig                     |    2 +
>  drivers/Makefile                    |    1 +
>  drivers/acpi/arm64/Kconfig          |    3 +
>  drivers/acpi/arm64/Makefile         |    1 +
>  drivers/acpi/arm64/mpam.c           |  384 ++++
>  drivers/acpi/pptt.c                 |  248 ++-
>  drivers/acpi/tables.c               |    2 +-
>  drivers/resctrl/Kconfig             |   22 +
>  drivers/resctrl/Makefile            |    4 +
>  drivers/resctrl/mpam_devices.c      | 2701 +++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h     |  661 +++++++
>  drivers/resctrl/test_mpam_devices.c |  389 ++++
>  include/linux/acpi.h                |   26 +
>  include/linux/arm_mpam.h            |   58 +
>  include/linux/platform_device.h     |    1 +
>  16 files changed, 4519 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/acpi/arm64/mpam.c
>  create mode 100644 drivers/resctrl/Kconfig
>  create mode 100644 drivers/resctrl/Makefile
>  create mode 100644 drivers/resctrl/mpam_devices.c
>  create mode 100644 drivers/resctrl/mpam_internal.h
>  create mode 100644 drivers/resctrl/test_mpam_devices.c
>  create mode 100644 include/linux/arm_mpam.h
>
> --
> 2.39.5
>

I applied this series and booted the kernel on a Google Cloud C4A host
(baremetal) and confirmed through sysfs that all MSCs were probed
successfully.

Tested-by: Peter Newman <peternewman@google.com>

Thanks!
-Peter

