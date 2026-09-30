Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9FCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNLolCCSprjS9gDFysHmR4iYUAVzMebm4KKYm3+MJFU=; b=USyOrr5NEsV36iC3LVC/yC3q0s
	OOnkJ1owYvurk6gqUuUOf9s1g/q5ApOM93N9ondcH/ZkmfV92RrKw9d56iaJhBu7F9bk//PU/zEK+
	2FiMTFCx2M7Uz6j6LwJSeET2CZKnS2fhjhF0tH3y8IPFtMMnYc/GqnuhzT5hVIK0tFuNif4iV6Jhk
	uGN1Jce22FxQS08N7RKzAnjfWifEQEU2mct8mnrWIQ6EeXvPPTfojcx+dsWQd9fQYirWTGjck6Cmg
	o875ViYW+xMLd/TVEJpOxSztHYKo6lKYnC0/NA5QQfp+ZDRbFY0mVRyt/Es/kHhoXwfiJca5b4Vcd
	TYSWk6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq1o-00000005UI0-2aEi;
	Wed, 30 Sep 2026 08:51:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq1n-00000005UHc-0zPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:51:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 682E5600D4;
	Wed, 30 Sep 2026 08:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED16A1F000FF;
	Wed, 30 Sep 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790758262;
	bh=vNLolCCSprjS9gDFysHmR4iYUAVzMebm4KKYm3+MJFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gGC6QK0STaiFiNQXPAxH+ZqdSjcVchiBvSUAD8WlEpL9rg7ILudOYTJl3G97KXhrB
	 JuZfGgTeNpXIfelVXlrRVxGiv36A35caWFBHfbRDpYKm691r462r8Aws14vQam3h69
	 YlD5UDeS+0PhjEmrjmSzZxo/pd0Dr1CerJBlULyQcvnKxiQmwjoXeocPQNYLZeZyPz
	 RVDAxc+v9K3nTwc+FS3AVLS9t1G/SYt5HhRk/CUgCnIsbupYyu0gRrGOUkbPsBkEoO
	 jO27YsHrQbwa6/cXGNa4NzZ8PqFaMryvcGBvh22BZldUecSEpr4W1gS7m8yuREdjvT
	 ssH78JMe/v1BQ==
Date: Wed, 30 Sep 2026 09:50:58 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ
 enabled during system suspend
Message-ID: <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
 <20260930033657.312266-2-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930033657.312266-2-finley.xiao@rock-chips.com>
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

On Wed, Sep 30, 2026 at 11:36:57AM +0800, Finley Xiao wrote:
> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
> SCMI clock and power-domain operations still need to work in the noirq
> phase of system suspend: genpd may power off a device's parent domain
> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
> scmi_power_state_set() and waits for the firmware reply via the mailbox
> RX IRQ.
> 
> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
> the suspend_noirq callbacks, so the combined interrupts are already
> masked at that point and the SCMI transfer times out while waiting for
> the reply.
> 
> Both the PBX and MBX combined interrupts are requested as threaded
> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
> that firmware replies are delivered, and the PBX combined IRQ, used
> for txdone by IRQ when not in polling mode, needs the same treatment.
> 
> IRQ threads are not frozen during system suspend, so with
> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
> noirq phase.
> 
> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
> SCMI remains functional throughout the suspend/resume cycle.
>

Looks good to me. Just to confirm, the expectation is to just have the
IRQs functional during suspend/resume cycle only and *not to wake up* the
system right ? If you need wakeup, you need to do more work.

For this change,

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Jassi,

Please pick this up for next cycle when you are at it. Thanks!

-- 
Regards,
Sudeep

