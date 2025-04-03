Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFA4C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Iy24XD19OHG6c0mXkPLe2OKXuKwhNbirvzeBC58z4=; b=t9PG1OahTT1LcbKZ3x9xH7kmnn
	Nv34PsRCngnqjzc6a/LHEiE31Sjw83UjHGuINem0VSeF1qf9wgcQjm1dUZp4af2z5Jp/T+7u6HNxT
	5njsiuSajGIvYsi9kN6sDeyMDKxaaHt4Wkrdb3ZIDshOB3lMGLIxY0mtjbcsd4M//CjGuAcAJJcPy
	neTfPi8xG4uZwSglbU2YT1z9fVRzRwZrF5q8l0whWLHp9frPcrEVkKFv3Wi/5p/SaRAHmAI6Qp9uY
	XNzjL3Ps7e6kjdoICgP/SeWFjcm82tYI3IdtmMYTQHpXhgQ/S+MjFFbyzTdVgSUls7/jANf5LmVx8
	9XI6vIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HWq-00000008UWr-24TF;
	Thu, 03 Apr 2025 10:10:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Giy-00000008NQw-2ryU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:19:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C6D106F;
	Thu,  3 Apr 2025 02:19:01 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C813F63F;
	Thu,  3 Apr 2025 02:18:56 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:18:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	d7271.choe@samsung.com, joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250403-rare-wasp-of-management-9bce59@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+3kwsesiXyC0hbO@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021901_037611_4116B6FE 
X-CRM114-Status: GOOD (  30.51  )
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

On Thu, Apr 03, 2025 at 10:30:42AM +0900, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 12:56:53PM +0100, Sudeep Holla wrote:
> > (Failed to find the original email, so reply on this instead)
> > 
> > On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> > > 
> > > The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> > > so we cannot rely on it in that context.
> > > We would like to use these suspend/resume functions during S2IDLE as well.
> > 
> > I have one orthogonal question. The s2idle will just use the deepest
> > cpuidle state registered. So if s2idle needs this save/restore of GICv3
> > ITS, how does that work when all the CPUs enter that idle state.
> > 
> > With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
> > bit confused as how it can work fine in normal cpuidle paths but no in
> > s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
> > s2idle little different but nothing to change this GICv3 ITS save/restore
> > requirement between cpuidle and s2idle.
> > 
> Hi Sudeep,
> 
> Thanks for asking.
> As a SoC vendor, we are using the Android kernel, which includes a vendor
> hook like the one below.
> 
> In this function, a vendor-specific handler attached to
> trace_android_vh_cpuidle_psci_enter is called.
> 
> 54 static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
> 55                                                     struct cpuidle_driver *drv, int idx,
> 56                                                     bool s2idle)
> 57 {
> 58         struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
> 59         u32 *states = data->psci_states;
> 60         struct device *pd_dev = data->dev;
> 61         u32 state;
> 62         int ret;
> 63
> 64         ret = cpu_pm_enter();
> 65         if (ret)
> 66                 return -1;
> 67
> 68         /* Do runtime PM to manage a hierarchical CPU toplogy. */
> 69         trace_android_vh_cpuidle_psci_enter(dev, s2idle);
> 
> Within the vendor-specific handler, if the current mode is S2IDLE and the
> CPU logical number is 0, the GIC ITS suspend function is executed.
> 

/me more confused.

Are you saying you have some cpuidle platform specific logic inside
trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
trace the entry into the state and nothing more.

In fact, it was recently added upstream as well.
Commit 7b7644831e72 ("cpuidle: psci: Add trace for PSCI domain idle")

Further you didn't explicitly answer my question. IIUC are you calling
GIC ITS suspend function unconditionally if its boot cpu ? Or is it
done only for s2idle ? If done only for s2idle, how does it work for
normal cpuidle entry to deepest idle state that matches the one entered
during s2idle.

-- 
Regards,
Sudeep

