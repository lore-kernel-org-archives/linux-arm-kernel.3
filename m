Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCECC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXKOQkQL9RC0FGoQ3HdhI22YPVUnK1StjDiljx2Kpy4=; b=x0IjoEtm3HsixiRX4g8d6b/VvZ
	bLSXN9exM6Gmy/QMa1zZ/vpwxUgeX/J2ES55ZmfGqCN3dcUxGQ/bJyFvG5WUFvo/deKyorKNwo8MZ
	mLbsGLTSxnlEhhkVz7FloX8nj/yJ24ORY5rFZs+HV6MSoUgAj7ias3qtHPg6xC+FpEH2eMJNcR2dd
	feq37ic9NgHCvSoPGIkWgSp+OSTOw3bEjcJSCI0WhYbvNkAqNehRHoMnaCMTMCpfrTdgfDrityPfJ
	AlaNSJNJsIozyfVKFO9x4DOuGlanEVEDSOk4W0CfZ7dhK3ak28jmWf6Mp1ufm21wAIWtMWkScTOVD
	W9Zczq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCHf-00000009mv8-1jru;
	Tue, 21 Jul 2026 15:21:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCHd-00000009muC-2FOi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:21:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8E76152B;
	Tue, 21 Jul 2026 08:21:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92F7C3F58B;
	Tue, 21 Jul 2026 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784647284; bh=8tIZqKZC5uligLhDlUDw2ljDTmMQ/3tQL4faHidSgVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZtsWhbBV5+/vbr/nOiCEbiiH4MAYY1Ktg6JfACAVTBu7NRgvKKuEdYYh8nfprVmA
	 Nit5bbvaZ7YN86uI/XeQiS9BH8bJj7zxNFRg1oGtst/OFWo2TDlm7QL9TskeZpvCsr
	 4A5ml24A5JrulZSbsrcfjmdpMkHjEqLm6vGfEw1Y=
Date: Tue, 21 Jul 2026 16:21:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in
 coresight_cpu_pm_notify()
Message-ID: <20260721152121.GM3998092@e132581.arm.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_082125_707735_1A698A0C 
X-CRM114-Status: GOOD (  19.48  )
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

On Fri, Jul 17, 2026 at 12:41:54AM +0300, Mohamed Ayman wrote:

[...]

>  static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
>  {
>  	struct coresight_device *source;
> -	bool is_active = false;
> +	struct coresight_path *path = NULL;
>  
> -	source = coresight_get_percpu_source_ref(smp_processor_id());
> -	if (!source)
> -		return NULL;
> -
> -	if (coresight_get_mode(source) & mode)
> -		is_active = true;
> +	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
>  
> -	coresight_put_percpu_source_ref(source);
> +	source = per_cpu(csdev_source, smp_processor_id());
> +	if (source && (coresight_get_mode(source) & mode))
> +		path = source->path;
>  
> -	/*
> -	 * It is expected to run in atomic context or with the CPU lock held for
> -	 * sysfs mode, so it cannot be preempted to disable the path. Here
> -	 * returns the active path pointer without concern that its state may
> -	 * change. Since the build path has taken a reference on the component,
> -	 * the path can be safely used by the caller.
> -	 */

Please keep the comment, as it helps explain why the path pointer can be
returned and safely used by the caller.

> -	return is_active ? source->path : NULL;
> +	return path;

With above update:

Reviewed-by: Leo Yan <leo.yan@arm.com>

Just a thought: we could view this in two stages.

1) The first stage is building the CoreSight path, where we need to
   ensure the involved modules remain bound while the path is being
   established.

2) Once the path has been built and the device mode is enabled, we
   enter the runtime stage. From that point on, observing the device
   mode as enabled guarantees that the associated data structures
   can be accessed safely.

I would leave this to maintainers for a call in case any concerns on
lifetime management.

