Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B478DC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plNykDgGEs2TSs2FHMTRElOOa5z84CHtFBC/F/kpZgI=; b=w1T/otVtaEhx5a4rL7aWNYzB1C
	vrjHFRuu1+auKgHmfOPMAz0LQjd0OfTTc5zDb8kUIu35SfiKup082mBHDGRkPmVTLgxdxS/S7jBOu
	Wmd1kBI6tLZmLNZiv4TbDzIHBTWzWF9jgXHxfDvWxpDKaaOVvh4DNIvRRsFRv07TyK/73e4f1cJqq
	laphGxv3B5NJU2dXM2hssH2amiCnIvAJ4xeJHszItuiRXyQhuO0/J0ZNSHb49EG/mmURGbmCZtnU3
	bgsmDZD/nWD0q8QVlFG03T8uXucmiP3RsoKziJJ4YK1SNiw3XuP1IlOcIxO4cqTMp23oDsMyz4dEr
	LsYlNhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBue-00000009iMM-2Jsg;
	Tue, 21 Jul 2026 14:57:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBub-00000009iLF-310K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E80F152B;
	Tue, 21 Jul 2026 07:57:30 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D103F86F;
	Tue, 21 Jul 2026 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784645854; bh=4qtcIpB1P2IKiXD+CcVbmvM7uLJl/Gi8tdxbWcGhvKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQ3zhhOGd04WqDEMkb7LkLTFKTpvSjf/61W3T8jfJiBAWr8jcCIUZPx7o95EX4TY3
	 Hcf6NQAwOExBTigWC0GYX7QIWz/jsmkYDtTZD+Ji3bLeSwKikWO7MYtrhInuTYnwAj
	 6bWHwe29vJ12HpiM1m9cEgrPDKGOF6k0C5VAVqZ0=
Date: Tue, 21 Jul 2026 15:57:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in
 coresight_cpu_pm_notify()
Message-ID: <20260721145732.GL3998092@e132581.arm.com>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
 <20260717155848.GB3998092@e132581.arm.com>
 <20260717161201.3jkO5o71@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717161201.3jkO5o71@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075737_797058_4B0A5D06 
X-CRM114-Status: GOOD (  19.75  )
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

On Fri, Jul 17, 2026 at 06:12:01PM +0200, Sebastian Andrzej Siewior wrote:

[...]

> > The raw spinlock (coresight_dev_lock) serializes access to the per-CPU
> > csdev_source pointer. It does not guarantee the lifetime of the source
> > or its _parent_ device. coresight_unregister() is not only reached from
> > module unload; it can also be called when a driver is unbind, for
> > example DT overlay removal or device hotplug/unplug.
> 
> But doesn't coresight_unregister() block on the coresight_dev_lock here?

Fair point.

coresight_cpu_get_active_path() can safely access the source while
holding coresight_dev_lock. Unregistration will be blocked until the
access from the CPU PM notifier has finished.

> > I think a proper fix needs a clearer lifetime model for an active
> > session. E.g., we could consider to call device_link_add() to prevent
> > device unbind / unregister, and unlink device when the session is
> > finished. Once that is in place, the CPU PM notifier can safely use the
> > active path without get_device()/put_device() pair anymore.
> 
> Right. I am also not sure about lifetime of coresight_device::path.

coresight_device::path is a runtime pointer that is valid only while
the device is enabled.

Since both the path and the device mode are updated atomically on the
local CPU, observing the device mode as enabled guarantees that the
corresponding coresight_device::path is valid.

Thanks,
Leo

