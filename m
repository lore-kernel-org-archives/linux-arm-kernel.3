Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8170BCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOHB9kJ9utzRCPCs3a28l8Lzpw7dq8/9A+Yy4nPtats=; b=NJRHiR6Te06eqGu2XTEOXuYcYL
	WtS1ApcAucAEWkwYGK0GUFPS23/GLMtRHVoVSP5o+wpVwK5nCBknHkc28C/zNaHhfdhcCHx2YrOB+
	INIg/DBFyNP84vbhXd/IKl8IOySSlPq79sB5rnFgRiU8nT0nc18d08lZ1igVe418ctw8hM5/SqhkT
	cPOcna+tHBHB9n0CQeZom29vfcZX8Askl6M8QPCAF7AG+MZ0zhsjmBdHYIRgb5UQRmBI0r9u4Wk6o
	22AXL86KSqWPTewCkZrSlTkg22ekLEwp2dcJinUFHhqwAleDTUj7rXMroNLKJrbs+A+BTx4BNOIGR
	Zod4oQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpud-000000084Lt-2LcA;
	Fri, 15 May 2026 10:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpuc-000000084LS-12RZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 10:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FOHB9kJ9utzRCPCs3a28l8Lzpw7dq8/9A+Yy4nPtats=; b=fIxE1Js9yku0T3xLh7J6lIz1Ty
	U7+zCBpDOqUkdZQ5ruLBiVplwoqJOQPD8dZ7tLvoi3JoQbU2zgA3lqzIH7LDzsr0zq8nht0mWmMlg
	LUKgnBAolmqd9AV5jXq1LGE2rrG5w05ZAYLMOtBwSLUj1pWeCxmYZ9raZdb8PsC8szIbzsc3cJOo1
	2Sw5YazqauXH92HEbqM59oOauyxTuHjkhyDZIoqWJ3bIPQv4JnpPLVfsCS4J+wgsw+X+/MEOBhcOb
	6/GmaOaiYNa1kCUfsP67lFrV4qqTtUKq2720UduZuoW4ri6jVptEpvZpklb15F10eZaMz9+79Mzcg
	kfcRwzoQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpuY-00000004uyZ-09I4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:36:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480EB22FC;
	Fri, 15 May 2026 03:36:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF6AF3F7B4;
	Fri, 15 May 2026 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778841412; bh=DcaLujhD8GzqFZWF7Lsqg/uxds9v5IVU/HlbuL0JRSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWwoPWjeGqtY8G7nPdGF/nrC/wpJdCpyDgdDuAKCsYb+C7l+UQxGxSJNaJf6qNosq
	 bx3pymVu+Yh73m9i+bcKuDTg/hqS4j4HxFkZB+9DJr8QwwLTp7zq3+luuAW2DfqO30
	 fpn6SbE2rH23OGrY+dj7B88YLy9znpRXVdfOwcz0=
Date: Fri, 15 May 2026 11:36:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 07/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <agb3QGmmAs8zv5/K@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-8-yeoreum.yun@arm.com>
 <20260515085354.GH34802@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515085354.GH34802@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_113654_741543_DBDBC967 
X-CRM114-Status: GOOD (  27.54  )
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

Hi Leo,

> On Wed, Apr 22, 2026 at 02:21:57PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> >   - Since active_config and related fields are accessed only by the local CPU
> >     in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
> >     remove the lock/unlock from the sysfs enable/disable path and
> >     startup/dying_cpu except when to access config fields.
> 
> Thanks for writing this up, which is helpful for understanding.
> 
> [...]
> 
> > @@ -918,40 +948,29 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >  
> >  	/* enable any config activated by configfs */
> >  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> 
> With the patch [1], we can move cscfg_config_sysfs_get_active_cfg() to
> smp call. As a result, all things for enabling cscfg can be in the
> same place.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-14-1c9dcb1de8c9@arm.com/
> 
> > -	if (cfg_hash) {
> > -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > -		if (ret) {
> > -			etm4_release_trace_id(drvdata);
> > -			return ret;
> > -		}
> > -	}
> > -
> > -	raw_spin_lock(&drvdata->spinlock);
> > -
> > -	drvdata->trcid = path->trace_id;
> > -
> > -	/* Tracer will never be paused in sysfs mode */
> > -	drvdata->paused = false;
> >  
> >  	/*
> >  	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> >  	 * ensures that register writes occur when cpu is powered.
> >  	 */
> >  	arg.drvdata = drvdata;
> > +	arg.path = path;
> > +	arg.cfg_hash = cfg_hash;
> > +	arg.preset = preset;
> 
> Connect with the comment above , don't need to pass cfg_hash/preset anymore.

This sounds like we're going to merge your patch first and then
apply this patch series. Isn't it compromised with Suzuki?
If so, I'll send this patch based on your own but if not,
We still need this code and it's the same comment for your own
in other patch.

> 
> > +	raw_spin_lock(&drvdata->spinlock);
> > +	arg.config = drvdata->config;
> > +	raw_spin_unlock(&drvdata->spinlock);
> 
> Seems to me, this is right way for locking - here we simply use
> spinlock for exclusive access config from sysfs knobs.
> 
> However, we avoid the config copy and directly access in SMP call?
> we still can use the raw spinlock in SMP call.

No we couldn't. for example, suppose cpu0 modifies
its own drvdata->data and holding lock, but other cpu try to enable
cpu0's etm4x if SMP call is entered before release lock,
It becomes deadlock situation. IOW, to grap the drvdata->spinlock in
the SMP call, all sysfs raw_spin_lock() should be changed into
raw_spin_lock_irqsave(). However this would make an unexpected latency
for modifying drvdata via sysfs, It should grab lock in here.

> 
> My suggestion is:
> 
> - First use a patch to move the drvdata assignment to SMP call and
>   remove spinlock;

> - Then, rebase this patch for moving cscfg into SMP call.
> 
> If so, we only need add a new field "arg->path", right?

Nope base on above.

> 
> 
> > @@ -1857,13 +1875,11 @@ static int etm4_starting_cpu(unsigned int cpu)
> >  	if (!etmdrvdata[cpu])
> >  		return 0;
> >  
> > -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
> 
> With the change [2], the starting and dying functions have been
> removed.
> 
> If you rebase patches on the top PM series, then you will not bother
> this. Anyway, this is right to remove spinlock for hotplug notifiers.
> 
> [2] https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-27-1c9dcb1de8c9@arm.com/

Agree but let me confirm the plan for merge.

-- 
Sincerely,
Yeoreum Yun

