Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823B6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8Kv+heaIGHh0UyeIZLnqRvrSzgtEd+kbBWci2LzLmg=; b=rpRjZnTVMTmvOKw0hwo45fwM5l
	Vuf6ffX9/FhhzqV6RC8K11mSd+eXk0lO5qBQwjp97ET6iqfUSkgA/DBPgc0JOyiYxq781x285eWhD
	IQUkc/oPLBhJ/Hc8O9EIkGQl3lGGzzsmY+lbJhUCojyyyP07wP/gMr3Frp/+w7awST+ObZUi42C8o
	5EA4W+o6PDYtW+YO/p416xrErUb+mAWHS4dq6BWhLYpDeX1E8atJYXdC4ofNJ6Mf+7IzYoyVO0aJN
	nU8I/kdTepgMCx4nL1p+VhKL/uZoT4iP4MKksi3vCJqiQ2N9PuBvL/MAODxQFAiArA9zlYItl+VbV
	Evuk9d9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0By-00000008JZI-2QK3;
	Fri, 12 Sep 2025 09:35:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Bv-00000008JWM-2hM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:35:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0EAA1A25;
	Fri, 12 Sep 2025 02:35:28 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D25273F63F;
	Fri, 12 Sep 2025 02:35:36 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:35:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@linaro.org>,
	Linu Cherian <lcherian@marvell.com>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: Fix possible deadlock in coresight_panic_cb
Message-ID: <20250912093534.GF12516@e132581.arm.com>
References: <20250911153315.3607119-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911153315.3607119-1-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_023539_720793_D0461F92 
X-CRM114-Status: GOOD (  12.93  )
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

Hi Sean,

On Thu, Sep 11, 2025 at 11:33:15AM -0400, Sean Anderson wrote:
> coresight_panic_cb is called with interrupts disabled during panics.
> However, bus_for_each_dev calls bus_to_subsys which takes
> bus_kset->list_lock without disabling IRQs. This will cause a deadlock
> if a panic occurs while one of the other coresight functions that uses
> bus_for_each_dev is running.

The decription is a bit misleading. Even when IRQ is disabled, if an
exception happens, a CPU still can be trapped for handling kernel panic.

> Maintain a separate list of coresight devices to access during a panic.

Rather than maintaining a separate list and introducing a new spinlock,
I would argue if we can simply register panic notifier in TMC ETR and
ETF drviers (see tmc_panic_sync_etr() and tmc_panic_sync_etf()).

If there is no dependency between CoreSight modules in panic sync flow,
it is not necessary to maintain list (and lock) for these modules.

I have not involved in panic patches before, so I would like to know
the maintainers' opinion.

Thanks,
Leo

