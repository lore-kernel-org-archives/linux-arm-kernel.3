Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A20F31E22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIIvMVaV8qE8drdDoy3orIwWiitdBwun+BeAUU71GJA=; b=3gglBsSZzWQ1Z5GCXiuk6lTYqv
	UQy4pfrjQVXUirSLsON0vBAbXQ6NNJf7Z7ykbHzp4f9Eafyu9M7kdQK51tIGWOGbXmXUD3d6p06Od
	YgWOkj6xUEbXaHGtEeXXWbjQPAE308TnG00CNJzCKn2+MF/tjsBxjfyDtm8MsL2CTm4oMttFnnVGk
	x0ch97bLfbu9pNlVT3fMXa766mZpbEXKBaRJWSCKYraqnYeiA5qCl/6oFjuylGaEuS9Yp/rjv6mQt
	qbSfRQ7FF2lkB29ubHcwn6d23Zqi+lLfL6leeDcIIzBz20GCSpya3jXwWGdC7xApSao1/PaEgooWR
	eZb28LTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqhe-0000000AjlB-37dr;
	Thu, 09 Apr 2026 14:49:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqhd-0000000AjkO-074k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:49:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACF242D95;
	Thu,  9 Apr 2026 07:49:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 165083F632;
	Thu,  9 Apr 2026 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775746191; bh=zEILdNNErAAbi/welUcKxk/5Wp5GJ77IpsQOPL7LSrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1kX+QgmLUUlSgBHiwQzMU3oVoNn3h4t2g3urYq0YxgFjxIrlHShxNZjasKRW/Zkx
	 wyZH/DY83em+qoRFWzT8E5BJanuuSY4gd2+1FNGmWCSYStunYBV57dSV9G/8VrnPea
	 dLSDV0+5zHP62kayzaqG6fGlSu/jUxZ5sJ6F5MEI=
Date: Thu, 9 Apr 2026 15:49:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Leach <mike.leach@arm.com>
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
Message-ID: <20260409144949.GT356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
 <f20b5a00-1d68-48d6-90c8-97dca2e279a4@arm.com>
 <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffe95710-cd52-484e-821e-a3d92ba17c33@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_074953_180367_3941592F 
X-CRM114-Status: GOOD (  27.23  )
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

On Thu, Apr 09, 2026 at 03:30:56PM +0100, James Clark wrote:

[...]

> > > > @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct
> > > > coresight_path *path)
> > > >       if (source_has_cb)
> > > >           return 1;
> > > > +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
> > > > +              coresight_ops(sink)->pm_restore_enable;
> > > > +    /*
> > > > +     * It is not permitted that the source has no callbacks
> > > > while the sink
> > > > +     * does, as the sink cannot be disabled without disabling
> > > > the source,
> > > > +     * which may lead to lockups. Alternatively, the ETM driver should
> > > > +     * enable self-hosted PM mode at probe (see etm4_probe()).
> > > > +     */
> > > > +    if (sink_has_cb) {
> > > > +        pr_warn_once("coresight PM failed: source has no PM
> > > > callbacks; "
> > > > +                 "cannot safely control sink\n");
> > > 
> > > This prints out on my Orion board on a fresh boot because of how
> > > pm_save_enable is setup there. Do we really need the configuration
> > > of pm_save_enable for ETE/TRBE if we know that it always needs
> > > saving?

Yeah, I can remove this check and always bind CPU PM ops for ETE.

> > > It also stops warning if I rmmod and modprobe the module after
> > > booting. Seems like pm_save_enable is different depending on how the
> > > module is loaded which doesn't seem right.
> > 
> > Thats because the warning is pr_warn_*once*()
> 
> I don't think so, I tested it with a printf instead of a warn once and also
> tested modprobeing straight after a reboot.

I am a bit surprised that Orion6 hits the CPU idle flow, as I observed
that idle states are not enabled on my board:

  # ls /sys/devices/system/cpu/cpu*/cpuidle
  ls: cannot access '/sys/devices/system/cpu/cpu*/cpuidle': No such file or directory

If you hit only once CPU idle notifier, it is good to add a
dump_stack() in coresight_cpu_pm_notify and print the "cmd" argument,
so we can know the calling coming from where.  I am a bit suspect it
might be a glitch in CPUIdle layer.

Thanks,
Leo

