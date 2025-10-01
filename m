Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BFACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOVuGpuSFPdypbs5HTkS2SK9CZW5abVYY3h4DD2Rl5c=; b=gE6Juob3BSr3TGBblY1VcJPNvc
	7iTThLymk1u3KwPn+fI1oi2rFcDCPKS1ejoBnO6u8/SqiJjAqFdOvSf4J9DI1b1zXUlaU+VZGnOax
	hGha4nE8NBSCOxg56dDP9z84u7UwtLuw4So2DDUkTknA9IEVdqfTxw0taqcV8BU74JVSvbUpPCSgJ
	UGvNNicG0P6DWJ5nTnQdGXGMGfGxEL14EtE7jT1+UwxSa2KZwXGvfN2EYk2z7KMKvthVNNpf/MdDo
	Lf5YDytlfU7LA7k4DrHND3HX7+LFOvRdDea0glRpbk4P0izLAB7htHahMbj44IjWLMpVYAa9bOEp4
	7c2HONKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3u27-00000007FUr-0DQC;
	Wed, 01 Oct 2025 10:26:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3u23-00000007FUU-2HQp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:26:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7491816F2;
	Wed,  1 Oct 2025 03:25:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160F53F66E;
	Wed,  1 Oct 2025 03:25:52 -0700 (PDT)
Date: Wed, 1 Oct 2025 11:25:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/31] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <20251001102551.GM7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-10-ea49e91124ec@arm.com>
 <CAJ9a7Vgk0Pj5c9AJBKa+wBNNZR6a7RCTUWqW0Trvksvt6fCBXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vgk0Pj5c9AJBKa+wBNNZR6a7RCTUWqW0Trvksvt6fCBXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_032559_711208_5D478265 
X-CRM114-Status: GOOD (  29.61  )
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

Hi Mike,

On Wed, Oct 01, 2025 at 09:48:06AM +0100, Mike Leach wrote:

> Hi Leo,
> 
> Overall I like the idea, but there are some minor issues that need addressing.

Thanks for review!

[...]

> > 3) Claim Tag Handling
> >
> >    The claim tag is acquired and released in normal flow, on the other
> >    hand, the claim protocol is not applied in CPU idle flow - it simply
> >    restores the saved value.
> >
> >    The claim bits serve two purpose:
> >
> >    * Exclusive access between the kernel driver and an external
> >      debugger. During CPU idle, the kernel driver locks the OS Lock,
> >      ensuring that the external debugger cannot access the trace unit.
> >      Therefore, it is safe to release the claim tag during idle.
> >
> >    * Notification to supervisory software to save/restore context for
> >      external debuggers. The kernel driver does not touch the external
> >      debugger's claim bit (ETMCLAIM[0]).
> >
> >    Based on this, it is safe to acquire and release claim tag in the
> >    idle sequence.
> >
> 
> Not sure I agree - in the original save restore the claim tag state
> was retained - so if an external claim was asserted it would not be
> lost.
> here if we do not retain the claim tag value, then an external state
> can be lost.

As described in PSCI (DEN0022F.b 1.3), section 6.8.1.3 "Saving and
restoring trace context", when ETMCLAIM[0] is set to 1 by the external
debugger, "The supervisory software will perform a save and restore
sequence of the trace context". So the supervisory software
(TF-a or EL2 hypervisor) should save and restore context (including
the claim bit) for the external debugger.

It does not make much sense to use the ETM driver to save and restore
only the claim bit while ignoring other registers. For a robust
solution, the supervisory software would be better place for the job.

> The debugger cannot access the device during idle/oslok, but it can
> detect that the device is powered down/oslocked and this potential is
> a change of behaviour from the external debug perspective, where a
> race to claim the resource now exists over powerdown were one did not
> before.

If we consider the supervisory software, then no race condition occurs.
As the supervisory software must run prior to the Linux kernel during
resume, it will safely restore claim bit for the external debugger.

Thoughts?

[...]

> > -       if (drvdata->nrseqstate) {
> > -               state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> > -               state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> 
> The TRCSEQSTR changes in use, but is not read back be the standard
> enable/disable flow. This does not matter in a normal enable/disable
> case, but in a save/restore we need to retain the current state.
> Probably should be added to the normal disable flow to read back this
> as we do with counters etc.

Good point.  I will update in next spin.

Thanks,
Leo

