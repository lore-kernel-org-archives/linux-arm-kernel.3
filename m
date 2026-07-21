Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9AC4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnbHbNUTcP8IECrrtpOzWQQXTItC7xDlCqP+cyeHrK8=; b=e6grNtk/EaTkeaY9GvrWeCMYzL
	jVn+ZdZVsGq/E+EF8S6udEKwIGWF8xCi/QiTVZ15wMK78BIuaRf7XK7lQxgGKlm5qAa5B/EYc23a3
	jXWAZeo/fesZ0Z3jBV6fLsEGVxKgjNawVplN9FHq2MEH004xF50IIbwXVg5w+UX/YgkiCXBtr2Trz
	3hZ0ypV0YlKTsJ2+1RJ5F3QT2cv8ZLuetJNAbg3ay3C5ohMjiS09V5g47argsVgW1lzB8tAGlZjhK
	KS1WbOkgoEI4wXplmHJxRNr+moX+XkLohzBpI46txiso9actpEVizy4CzOH+CmJu4z+zfLJutxwZE
	gON9eDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA5d-00000009TNz-0E0G;
	Tue, 21 Jul 2026 13:00:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA5Z-00000009TNR-3iQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:00:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 120EB152B;
	Tue, 21 Jul 2026 06:00:42 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0802E3F86F;
	Tue, 21 Jul 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784638846; bh=hysfiagx5e94Dj236TAnRcKcp+oUzY3blGRAEWMW+yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffttWdenelh0xayPG/WBGnxwMw4PtfZUv6tMbE6HT6DxumUsw69aKPLcJn8NRIuyZ
	 ROgjGp8+xoQ5Zz5qRX1HUXSibmzI6xp4obRa1lR7CbZ0NxaIQWii/FlYxHn/FXjGfE
	 IUVJoLgI0tqmbPfGObzEC8okPhB+++9yq0s6JLmE=
Date: Tue, 21 Jul 2026 14:00:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <al9tdvOxYb83zBxd@J2N7QTR9R3.cambridge.arm.com>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
 <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
 <05081037-9ed8-4e0d-8480-cfa45e950727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05081037-9ed8-4e0d-8480-cfa45e950727@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_060050_100113_DDCD355E 
X-CRM114-Status: GOOD (  24.80  )
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

On Tue, Jul 21, 2026 at 02:58:49PM +0530, Sneh Mankad wrote:
> 
> 
> On 06-Jul-26 2:46 PM, Sudeep Holla wrote:
> > On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
> >>
> >> Hi Sudeep,
> >>
> >> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> >>> (It is always good to cc all PSCI maintainer for any ARM64 CPU
> >>> hotpug/suspend related changes)
> >>>
> >>> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> >>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> >>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> >>>> retained. The hardware design on these SoCs forces a constraint to suspend
> >>>> and resume the system on boot CPU / CPU0.
> >>>>
> >>> And you fail to explain why they have that constraint.
> > 
> > I still need the above to understand the issue/constraint better.
> 
> Above mentioned SoCs have boot CPU fixed to CPU0 in HW, whenever SoC boots up/cold boots it starts with CPU0.
> 
> These SoCs support suspend to ram which leads to ACPI S3 similar state (where SoC is turned off and DDR is retained)
> PSCI SYSTEM_SUSPEND typically will be executed on boot core itself unless it is already offlined and non boot CPUs gets
> offlined using PSCI CPU_OFF.
> 
> As HW constraint always makes the SoC to boot with boot CPU, consider a scenario, where 
> 
> Boot CPU is already disabled / offline => suspend to ram is triggered => SoC enters ACPI S3 similar state (only DDR is retained and rest of the SoC is off)
> <So far good>
> 
> External wake up arrives (say power key press) => SoC starts booting with CPU0 => CPU0 becomes first one to "land" in kernel now. 

IIUC you're saying that Linux calls SYSTEM_SUSPEND on a CPU other than
CPU0, and the FW returns to Linux on CPU0. The HW constraints are
irrelevant; FW should be handling that transparently from the PoV of
the OS, and even if it always physically boots on CPU0, it should go
wake the other CPU, then offline CPU0.

Look at the PSCI spec:

  https://developer.arm.com/documentation/den0022/fb/

See section 5.20 ("SYSTEM_SUSPEND"), and in particular, the description in
5.20.1 ("Intended use"):

  To use this API, a calling OS must power down all but one core through
  calls to CPU_OFF. From this point on, the remaining core can call
  SYSTEM_SUSPEND, passing the necessary entry_point_address and
  context_id parameters to enable resumption on wakeup. A calling OS can
  use the AFFINITY_INFO function to ensure that all cores are OFF prior
  to calling SYSTEM_SUSPEND.

Note that there's no requirement that the OS calls this on a specific
CPU; just that all others are offline.

Further, note the sentence at the end of that section:

  The core which calls SYSTEM_SUSPEND is the one that resumes execution
  at the specified entry_point_address on wakeup.

... which means that waking up on another CPU is a violation of the
spec.

If we have to deal with broken FW, we can devise something, but this is
*certainly* a firmware bug.

Mark.

