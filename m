Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80275C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu3NzZC3DqwPwk70qM5eC2Ef9BdjzWc2CjjgNaid4fo=; b=iy65uM7FOgdSaAlDm7Hw3gCQNa
	tIorX9KtcL3/3bNGCEgag9bCqiVFNpJQabxVkk/UAJ4TOSNZucYinJ08qpXItDxgsnIW1fCErtfBl
	AWym+sOczCdk/DfDdDKcfE2MJCHVGoHnY6+aZshf1wOPEJI7YY80KU1Q/OXvc3y1YHXXdQ5ptb2xM
	/0edrgymz923NDurt7qeW9KtX9bMmqEAeNltQ18on6fmA4jlLlY+0bx2YSeyOg/BUNqs5nJMWy3Fm
	pty4bGEU+aNBjh3EmYNpcX04YFsBuN3zo5rXE05AK1a8KOZiChTm4lSSjIY9355A1DypAtA8XI6M/
	MzeViyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEn21-0000000C93i-32X5;
	Tue, 13 May 2025 10:38:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmxG-0000000C88J-20eV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:33:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE62168F;
	Tue, 13 May 2025 03:33:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE5CB3F5A1;
	Tue, 13 May 2025 03:33:44 -0700 (PDT)
Date: Tue, 13 May 2025 11:33:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250513103340.GB26114@e132581.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
 <20250428162214.GG551819@e132581.arm.com>
 <aBSfqU9ssymM/yC5@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBSfqU9ssymM/yC5@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_033346_599725_EC933B24 
X-CRM114-Status: GOOD (  32.66  )
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

Hi Levi,

On Fri, May 02, 2025 at 11:34:17AM +0100, Yeoreum Yun wrote:

[...]

> > > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > > > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > > > >
> > > > >  	raw_spin_unlock(&drvdata->spinlock);
> > > > > +
> > > > > +	cscfg_csdev_disable_active_config(csdev);
> > > > > +
> > > >
> > > > In general, we need to split changes into several patches if each
> > > > addresses a different issue.  From my understanding, the change above is
> > > > to fix missing to disable config when disable Sysfs mode.
> > > >
> > > > If so, could we use a seperate patch for this change?
> > > >
> > >
> > > It's not a differnt issue. Without this line, the active count wouldn't
> > > decrese and it raise another issue -- unloadable moudle for active_cnt :(
> > > So I think it should be included in this patch.
> >
> > I read the code again and concluded the change above is not related to
> > locking and would be a separate issue: when we close a Sysfs session,
> > we need to disable a config on a CoreSight device.
> > Could you clarify what is meaning "unloadable moudle for active_cnt"?
> > I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
> > but have no clue why "active_cnt" impacts module unloading.
> 
> Yes. but it also related "by this patch".
> When the load config and "activate" configuration via sysfs,
> not only the cscfg_mgr->sys_active_cnt is increase but also
> "individual cscfg->active_cnt".
> This patch extends the meaning of "cscfg->active_cnt" includes
> "enable of configuraiton". so that cscfg_config_desc_put() prevent
> decrease "module reference" while holding individual active_cnt.
> That's why without this change, the "module reference" couldn't be
> decreased. The problem before this change is deactivation doesn't
> chekc cscfg->active_cnt but put module reference whenever it calls.

Thanks for explanation and it makes sense to me.

As we discussed, given this patch is relative big, let us divide into
three small patches for easier review.

- The first patch is to address that the sysfs interface misses to
  call cscfg_csdev_disable_active_config() for disabling config.

- The second patch fixes the locking issue for "config_csdev_list".
  As the "config_csdev_list" is protected by cscfg_csdev_lock, the
  cscfg_remove_owned_csdev_configs() function should use lock for
  exclusive operations.

- The third patch is to fix reference counter of a config module.
  The patch adds cscfg_config_desc_get() and cscfg_config_desc_put()
  in the config enabling / disabling flow for acquiring module
  reference counter.

Thanks,
Leo

