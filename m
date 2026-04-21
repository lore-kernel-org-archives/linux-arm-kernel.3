Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E09F8FA7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVskjFQn8LGLg0wyQDRTc2q4IyQ/3vmBYkuiI0CLoK0=; b=d5DvAzYK8MyepTC+CMJcK7b29S
	s9UhDKLl87ravLtOHLSH1rv1ZFe4sSFnq9hLOb33uSMXtPbzObz4A4DPC/pWgc/uv2va8uDp2eNFT
	QwI5mhIWG61g7i2DEA4BDAhX6Z4xfxudkumBwu8OFheJ3KORhc5+8nUs8Z7mi3HGOdsKKIeu0PkqJ
	aMu2Z0MKkcmhHmXeLqxplFbEGa9DSrV8B1g+y8/gdMYlhKCAT6JjtKuDvMkimogoOvTily1EV/cXu
	MSWz+GmmGSrnuKRvnx0SN/Nk/RCrY0N0nTMNncy6hiT54O0p4W37nHAGeMCugBl0GWMa3WG46yhL5
	wjuuK6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBgH-00000008hyg-2Co3;
	Tue, 21 Apr 2026 14:02:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBgD-00000008hyK-1w7Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:02:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E4A22573;
	Tue, 21 Apr 2026 07:02:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 758C73F7B4;
	Tue, 21 Apr 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776780137; bh=UxOuyvqjssBcp1emTpPrTkHhq/tnIYeB21ckVfqA9hY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gv7m+V87Vw0axaDcNsT9EZElZp2PBUxga27N8/nnNqzlCNW4IZK9QEz2a29vFu7ou
	 xsZQMCUxflZ0lvKvNzncI1yPY7NWujZL8/rB4pZsLnQbHwhSB/E40KsBZRoYaDAVlu
	 0JCwe9MNpUyz0IIl07CzuHfVM+Zdkw+sekHM6a9A=
Date: Tue, 21 Apr 2026 15:02:14 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <aeeDZnrp2KxC5TB2@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-8-yeoreum.yun@arm.com>
 <20260421104601.GB929984@e132581.arm.com>
 <aedcDEpBAnAieSRX@e129823.arm.com>
 <20260421132842.GC929984@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421132842.GC929984@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_070221_637111_2C8F9EA7 
X-CRM114-Status: GOOD (  24.54  )
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

> On Tue, Apr 21, 2026 at 12:14:20PM +0100, Yeoreum Yun wrote:
>
> [...]
>
> > > >   - There is a risk of corrupting drvdata->config if a perf session enables
> > > >     tracing while cscfg_csdev_disable_active_config() is being handled in
> > > >     etm4_disable_sysfs().
> > >
> > > Similiar to above, cscfg_csdev_disable_active_config() is not
> > > protected in etm4_disable_sysfs().
> >
> > This is not true.
> > at the time of etm4_disable_sysfs() "mode" is already taken
> > (whether sysfs or perf). In this situation, it's enough to
> > call cscfg_csdev_disable_active_config() before chaning
> > mode to DISABLED.
>
> To be clear, I am trying to understand issue _before_ your patch.
> Without this patch, cscfg_csdev_disable_active_config() is not
> protected by the mode.

Right.

[...]

> > > > @@ -1386,6 +1401,7 @@ static void etm4_init_arch_data(void *info)
> > > >  	drvdata = dev_get_drvdata(init_arg->dev);
> > > >  	caps = &drvdata->caps;
> > > >  	csa = init_arg->csa;
> > > > +	config = &drvdata->active_config;
> > >
> > > Should we init drvdata->config instead so make it has sane values ?
> > >
> > > In other words, drvdata->active_config are always set at the runtime,
> > > so don't need to init it at all, right?
> >
> > No. at least when the initialise, I think we should fill the its
> > contesnt with the "etm4_set_default()".
> >
> > That's why the consequence call etm4_set_default() called with
> > active_config and config is coped with the default configutation.
>
> I'm concerned that some config fields may be reused across sessions.
> For example, a sysfs session copies drvdata->config into
> drvdata->active_config, and later a perf session may reuse stale
> values. The same issue can happen in the reverse direction.
>
> A clean approach would be to treat drvdata->active_config as
> per-session state:
>
>   1) clear drvdata->active_config at session start
>   2) apply the session-specific config
>      2.1) sysfs: use drvdata->config
>      2.2) perf: use event config

>   3) then apply configfs configuration
This is not true.

In case of "perf", it always clear the "active_config" with 0x00
before enable. so it wouldn't.

In case of sysfs we don't need to worries about since
"config" field saves everything and this is applied into active_config.

So, your issue doesn't exist in this case.



--
Sincerely,
Yeoreum Yun

