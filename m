Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D5CCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsvKewNdj7IUFaN8tW/JH6YzfaLVipb7sTs8hNZNjn8=; b=Qp7rpCJJenkDtExq83TGIQDnqJ
	2v5ptUVBuA0zqTcf9z6dAxI+d8aJKVT3Sr1CS3OBPDCJR3J4p7mBV4UDel+w82QdSJtSxHCf4wiLb
	KLAflNvpgmRQcJdD4lWBDgp7DREkOaEa6EeueHezFNBbnkLnL4U+1kqN2A9m3F/Tolomh4bcipSFL
	DgAoHsNPqQ2KrZp2dmf/9QrX8NdNTynfhmZXjaO8WiDzDw+cYS0ulrp12q39kLQN3tZGGrDMl1oGK
	yBSXEf6fNzvivMEuRK0Iqs659lGLsSv53DZNnIGFZ4pKpEZSAo4/wLxvoGhoCbLHydKL+f+qNp53Q
	jG9SxThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq97-000000086FM-0Z7Y;
	Fri, 15 May 2026 10:51:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq92-000000086EZ-26vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:51:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 808EC22FC;
	Fri, 15 May 2026 03:51:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35D7A3F7B4;
	Fri, 15 May 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778842309; bh=i308YaLa2XqUHgRFuI+4TbGQ5hu3AgLatwRRKeUrvJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgpXdhSMfCVvXYdHIoyqKQO/oAJa0x3Do9b261C4yUGKt5pK+vETvn+gVykbIZ3gn
	 uf+ZF9ECqK4xRIvVmNS76fzd7Pmb3LLA08/SCizCewZxcK//eA2cD3PCej2fUhgt3S
	 qe+CiZ0ygBhVr9YK5ygKtsGVzmR+WdcMRdLED2M4=
Date: Fri, 15 May 2026 11:51:44 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 08/13] coresight: etm4x: remove redundant call
 etm4_enable_hw() with hotplug
Message-ID: <agb6wIhtvlruLZsv@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-9-yeoreum.yun@arm.com>
 <20260515090850.GI34802@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515090850.GI34802@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_035152_666725_13C504D3 
X-CRM114-Status: GOOD (  14.88  )
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

> On Wed, Apr 22, 2026 at 02:21:58PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > +	/*
> > +	 * Take the hotplug lock to prevent redundant calls to etm4_enable_hw().
> > +	 *
> > +	 * The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
> > +	 * In other words, if etm4_enable_sysfs() is called between
> > +	 * CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
> > +	 * etm4_enable_hw() may be invoked in etm4_enable_sysfs_smp_call()
> > +	 * and then executed again in etm4_starting_cpu().
> > +	 */
> > +	cpus_read_lock();
> >  	ret = smp_call_function_single(drvdata->cpu,
> >  				       etm4_enable_sysfs_smp_call, &arg, 1);
> > +	cpus_read_unlock();
> 
> This will cause double deadlock with the patch:
> https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-6-1c9dcb1de8c9@arm.com/#t
> 
> I think we need to drop this one.

As I asked on another thread, Are we're going to merge your patch first?
If not, we need to sustain it anyway.

Thanks.

-- 
Sincerely,
Yeoreum Yun

