Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E73AC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IstgRLTJKNzTVf2DzZ9EtYolGXqanftf60Om1sBFiBI=; b=hZFy+0U6NyE+WNDwpAKr7A5nVh
	HdSpcG8dcqWWF89kcsrNd0H/5EwtaKhcHS4opsIWxYEgo/+VRR3xJvEx4ka4i2EP47rIBypPb1eS6
	Ae59tI7vIQvFg2evoSjpp8ZshrhIVmRwFS66Xe2cTfLRECD8hgIzNyUGFsmLVG6GHdq3c3/QEjq5w
	rxHD5c0bvIF9Aya7APmomvhwqwCU1CyfHfuyH2SjCvHG+Xky2sXM6SBgzfCVLNPPJziCYdaoP0MuT
	18gExtnmYebZF0ATqIoPY98DoGrOQNVPhnxifmKlHHThmLiX3jAbFT9idPUVicSfVnurTS5sgH/nU
	HvJZcMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkxl-00000002gfA-0ogU;
	Fri, 17 Jul 2026 15:58:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkxi-00000002gdp-32j4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:58:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D6C81476;
	Fri, 17 Jul 2026 08:58:47 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013703F905;
	Fri, 17 Jul 2026 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303931; bh=AtgJblUedqk/MGp++U2qIbkbsahrGGfYJfzRXOGEZIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meTzP0sbPJwm08MUZ7+xwldKmtnHbAIhC4emfIEp/ILrACd6FgOdVUD5m4mNKs8+1
	 5ZH2KJHt1aZD5SdvtCRRvDUK5x+5rCKXDHQ8QQLtLcoUe5QFTQ1FXe6gXNcQrBKfj2
	 T8Py6kfk81fEl1iJdxoCcCByJOJUe35rdorII42U=
Date: Fri, 17 Jul 2026 16:58:48 +0100
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
Message-ID: <20260717155848.GB3998092@e132581.arm.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085854_854984_B2A118E7 
X-CRM114-Status: GOOD (  17.76  )
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

I agree the get_device()/put_device() pair in
coresight_cpu_get_active_path() is not a good fit for CPU PM notifier,
because the put_device() can become the final put while IRQ is disabled.

However, my understanding is this patch might cause UAF issue that the
existing code is intended to prevent.

The raw spinlock (coresight_dev_lock) serializes access to the per-CPU
csdev_source pointer. It does not guarantee the lifetime of the source
or its _parent_ device. coresight_unregister() is not only reached from
module unload; it can also be called when a driver is unbind, for
example DT overlay removal or device hotplug/unplug.

This is why the UAF issue Sashiko mentioned in patch 03 of [1]. A built
CoreSight path currently grabs references for the path components, which
keeps module alive, but that is not the same as preventing the parent
device/driver from being unbound and tearing down CoreSight device data
while an active session still has raw pointers.

There are also similar race window before the path is built: for
example etm_setup_aux() has to look up source/sink state before
coresight_build_path() establishes the path, so it might access
released source/sink data if device is unbound.

I think a proper fix needs a clearer lifetime model for an active
session. E.g., we could consider to call device_link_add() to prevent
device unbind / unregister, and unlink device when the session is
finished. Once that is in place, the CPU PM notifier can safely use the
active path without get_device()/put_device() pair anymore.

Hope this is clear and makes sense.

Thanks,
Leo

[1] https://sashiko.dev/#/patchset/20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be%40arm.com

