Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E73CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GufNFyqwUhwsqmPYDQUEYUYBFnCGryCVUFMcsORQp9g=; b=qQuXrymN15eBHsRgH0fGjyMyu6
	fz2OcCR548ZQaDFyKOtEQ5bT9ysxUYVKNgrUBjgvlWgX4fgOg3+Bt4wzQhPHASCLXY/lPLxkY7zts
	Y8Q2wvBsbnDAEGNNuuY15IJVRSpSP4BhVAPugLdyeoVQf52REx0oZYL+k46YIaFcCO79YDoCFUjJr
	tCpcaF2NLctadlBEYWldS8xonXUH8nGYcmwYh1rsD1vrEFcl0GmjiPF4y5Ku9DroHc9H2aHq61Wu/
	8I3m1TwlynnXO+WmvhTpvXmjMyrLKPsTNG1qXuONn+C+qFqmkyDVqTDff89idv7HvcWukV+y+kwTP
	mz3zfN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoXT-00000007qgd-0aEz;
	Fri, 15 May 2026 09:08:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoXQ-00000007qfZ-2QkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:08:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53951AC1;
	Fri, 15 May 2026 02:08:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E5A3F85F;
	Fri, 15 May 2026 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778836133; bh=xqBvTs0vc701P/gxxl80LddgYMr+meImWyE0A5hj94I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7x7b7NKffgrlsrz3nVIbwJKO3zU6rKx/f211626YFVUUZtGYFfcLth2RlYS3DvHN
	 q+BtNoh4PJ624qjAtru4DH3r7Y1vcsdPsrZunDiSP1CsIjGTmH+Awl2vFEsC9DxjC7
	 v6wYBVpBxiniQBoWRlkT7CL87M6EFrLrrJZ9Dgm8=
Date: Fri, 15 May 2026 10:08:50 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 08/13] coresight: etm4x: remove redundant call
 etm4_enable_hw() with hotplug
Message-ID: <20260515090850.GI34802@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-9-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-9-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020856_728926_4FE19856 
X-CRM114-Status: GOOD (  11.13  )
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

On Wed, Apr 22, 2026 at 02:21:58PM +0100, Yeoreum Yun wrote:

[...]

> +	/*
> +	 * Take the hotplug lock to prevent redundant calls to etm4_enable_hw().
> +	 *
> +	 * The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
> +	 * In other words, if etm4_enable_sysfs() is called between
> +	 * CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
> +	 * etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
> +	 * and then executed again in etm4_starting_cpu().
> +	 */
> +	cpus_read_lock();
>  	ret = smp_call_function_single(drvdata->cpu,
>  				       etm4_enable_sysfs_smp_call, &arg, 1);
> +	cpus_read_unlock();

This will cause double deadlock with the patch:
https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-6-1c9dcb1de8c9@arm.com/#t

I think we need to drop this one.

Thanks,
Leo

