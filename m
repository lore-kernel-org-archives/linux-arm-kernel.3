Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E9BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D65m3XwzD3+G6o9aIA7AzHARFpo35hhqSUK83lbemg0=; b=rN6G44HQoLpgbG9s69mWDO/Kuo
	CcY4a1iuKz8VZSB7iIK1kUVmj7tHey1rKhCls9++mevxTXS1yFki9mZa3Qo24fbLuHXm+df+oBLYw
	ZgBwNtBzBVSULMq/X5IF7rXH283rBf3cqC5ZjEDESy/ROee4SNp5FzqeZ4PNgho3mZxzTkrYq5xWE
	JDaRHCAAyMjZRUbM745OtDFGubDBHpdXLbYbqo5S8PkqV30T7yjK79ZKKfHtvQKL9uOm5vfvTeRpp
	qFOgbuPMUf+uSrUthm9ShsujrZz6fGFzEfeog32CNranmIqx4vSDOTbwuL56hdEK6J2Q6EUkn2HUh
	4Q5NOzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsXY-0000000CA6T-2sl8;
	Thu, 10 Jul 2025 14:46:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqqe-0000000Bqut-2EaX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:58:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED9891EA6;
	Thu, 10 Jul 2025 05:57:46 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09F73F66E;
	Thu, 10 Jul 2025 05:57:55 -0700 (PDT)
Date: Thu, 10 Jul 2025 13:57:52 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, ulf.hansson@linaro.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
	linux-rt-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Raghavendra Kakarla <quic_rkakarla@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH] cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y
Message-ID: <aG-40INpi05v3-fQ@bogus>
References: <20250709154728.733920-1-daniel.lezcano@linaro.org>
 <CAJZ5v0ixk5hZPPQc_1rDLMTzjh=KpMQF_A2U=HehMTuNSMQwtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ixk5hZPPQc_1rDLMTzjh=KpMQF_A2U=HehMTuNSMQwtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_055800_617541_53DE3DF6 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, Jul 10, 2025 at 02:43:10PM +0200, Rafael J. Wysocki wrote:
> On Wed, Jul 9, 2025 at 5:47 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >
> > Currently cpu hotplug with the PREEMPT_RT option set in the kernel is
> > not supported because the underlying generic power domain functions
> > used in the cpu hotplug callbacks are incompatible from a lock point
> > of view. This situation prevents the suspend to idle to reach the
> > deepest idle state for the "cluster" as identified in the
> > undermentioned commit.
> >
> > Use the compatible ones when PREEMPT_RT is enabled and remove the
> > boolean disabling the hotplug callbacks with this option.
> >
> > With this change the platform can reach the deepest idle state
> > allowing at suspend time to consume less power.
> >
> > Tested-on Lenovo T14s with the following script:
> >
> > echo 0 > /sys/devices/system/cpu/cpu3/online
> > BEFORE=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }') ;
> > rtcwake -s 1 -m mem;
> > AFTER=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }');
> > if [ $BEFORE -lt $AFTER ]; then
> >     echo "Test successful"
> > else
> >     echo "Test failed"
> > fi
> > echo 1 > /sys/devices/system/cpu/cpu3/online
> >
> > Fixes: 1c4b2932bd62 ("cpuidle: psci: Enable the hierarchical topology for s2idle on PREEMPT_RT")
> > Cc: Raghavendra Kakarla <quic_rkakarla@quicinc.com>
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> As per MAINTAINERS, this is for Ulf/Sudeep.
> 

LGTM, so

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I still prefer to hear from Ulf who has more knowledge and hands-on experience
with s2idle + PREEMPT_RT in case I am missing something.

-- 
Regards,
Sudeep

