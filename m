Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361EDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrdhtZOC+ncwVP4lGZN2yhfRYMK2CtL5hHp30Z+P7H8=; b=QK8FSMS64OZ7idYLb8ppr9B8qQ
	bB3uD0tjbOF4jdIcXTQYuMJBRdcu+gf0X7bMWrMaCwgJZUUWOzbp9N20tG8qBoE3yFEaRds6VTKx8
	Ag+QaV0rD38s3qS2WyMS7t5meWZBk1UeKLhmfZVEO9CYo7Gz8S+GjO+uM3aKrRmvn8fLKyKVBqj5B
	sG+PuaaAXqEmbY9hAyjpBLSZZLxO7CuYC8SAXR+drnSruAfJ2M3/GbmZy+e1gI/BzQNeDFKYGCXp4
	qGJ5Fty+O615Y1gFAM0XGfV+0L9jC00W2kIFNrYjLpfx1WeAP6D552sdrU5Vzn0rDtPJ1OzMgaJsW
	3wTkF3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoJ4-00000007nQa-1Fjc;
	Fri, 15 May 2026 08:54:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoJ0-00000007nMJ-3Cqz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:54:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B913A3597;
	Fri, 15 May 2026 01:53:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74DF93F7B4;
	Fri, 15 May 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778835238; bh=J8r6ADKH+Z5jHPKFi221LwI804qFaj/OEXhMifsRm1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYwqtNHRgV7X0NnglSahkmOSmX4kBAm5TsswoqpLf9Oc93QrO5CgE2VLEomxTv7v0
	 fA4cmIjcQFypMNutkhynOOZyD8dXTqlT63ac/9/zAlv4aCCasnchDLvr7HKOsDkO5Y
	 zkipzpiAom0xRW6mz4URZDkWmNyHjzfCFB+Pzp9o=
Date: Fri, 15 May 2026 09:53:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 07/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260515085354.GH34802@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-8-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_015402_943066_DC40374A 
X-CRM114-Status: GOOD (  17.38  )
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

On Wed, Apr 22, 2026 at 02:21:57PM +0100, Yeoreum Yun wrote:

[...]

>   - Since active_config and related fields are accessed only by the local CPU
>     in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
>     remove the lock/unlock from the sysfs enable/disable path and
>     startup/dying_cpu except when to access config fields.

Thanks for writing this up, which is helpful for understanding.

[...]

> @@ -918,40 +948,29 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  
>  	/* enable any config activated by configfs */
>  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);

With the patch [1], we can move cscfg_config_sysfs_get_active_cfg() to
smp call. As a result, all things for enabling cscfg can be in the
same place.

[1] https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-14-1c9dcb1de8c9@arm.com/

> -	if (cfg_hash) {
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret) {
> -			etm4_release_trace_id(drvdata);
> -			return ret;
> -		}
> -	}
> -
> -	raw_spin_lock(&drvdata->spinlock);
> -
> -	drvdata->trcid = path->trace_id;
> -
> -	/* Tracer will never be paused in sysfs mode */
> -	drvdata->paused = false;
>  
>  	/*
>  	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>  	 * ensures that register writes occur when cpu is powered.
>  	 */
>  	arg.drvdata = drvdata;
> +	arg.path = path;
> +	arg.cfg_hash = cfg_hash;
> +	arg.preset = preset;

Connect with the comment above , don't need to pass cfg_hash/preset anymore.

> +	raw_spin_lock(&drvdata->spinlock);
> +	arg.config = drvdata->config;
> +	raw_spin_unlock(&drvdata->spinlock);

Seems to me, this is right way for locking - here we simply use
spinlock for exclusive access config from sysfs knobs.

However, we avoid the config copy and directly access in SMP call?
we still can use the raw spinlock in SMP call.

My suggestion is:

- First use a patch to move the drvdata assignment to SMP call and
  remove spinlock;
- Then, rebase this patch for moving cscfg into SMP call.

If so, we only need add a new field "arg->path", right?


> @@ -1857,13 +1875,11 @@ static int etm4_starting_cpu(unsigned int cpu)
>  	if (!etmdrvdata[cpu])
>  		return 0;
>  
> -	raw_spin_lock(&etmdrvdata[cpu]->spinlock);

With the change [2], the starting and dying functions have been
removed.

If you rebase patches on the top PM series, then you will not bother
this. Anyway, this is right to remove spinlock for hotplug notifiers.

[2] https://lore.kernel.org/linux-arm-kernel/20260511-arm_coresight_path_power_management_improvement-v12-27-1c9dcb1de8c9@arm.com/


