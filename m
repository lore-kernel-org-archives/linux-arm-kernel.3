Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2199DCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym3AiKeeVXG7wOa+iSCtIJhd+vnl3Yz5DjQm6LWMcgs=; b=BGzczaEFvEQF9IDU0hvOc/ApKL
	nzZ0Su8SDBmkhEdk9WDroHF9a3KkbqVytdBL+OQsilkH9uVjFZXawvhE9EBgIfkK7Zi/tJXMe0zp+
	WEO9cQDfeBMQtE5b4WRLrWiwr97dnGofcwoRwVLebVAIHHCRfA/CIWsOpKv0ztL6C0UQGO3xOydfk
	C3JqDK2YekKYwMGY1sHbFZnJ7f9Fp8Z3FWECBt3Ra1Sa9zae5B21Z64Z7Qn8y2EZxSRaXOVmN4/m/
	I3DOBMFkGbYqJ3kCod18NLcG5rpKXYdQDirILSiUIU4Qr3Hqof5fu4NLUJddc3yZ73LNCz/onDVWe
	ledmpVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKW78-00000000wEe-2fBp;
	Wed, 06 May 2026 06:52:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKW75-00000000wDb-3lS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 06:52:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF7F1691;
	Tue,  5 May 2026 23:52:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 269D63F763;
	Tue,  5 May 2026 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778050326; bh=t37kJxEI2QhUVtL3vUNRO6SryV040GC23jsisBVSrHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTr+/A+/v3f0Dm2CgBeW5FYRqZPOLhQn/9ZZ/Yx46VdNsnzP9uOOhz8+EkOtAUP8T
	 8TQZNsoCCNy+RiSFn0/TlSRbA9vm6H15y2uzaR+CbaOaaNzPjWseOh3xCzQhZ0LoPQ
	 RjG4h5HEFz5kBRLbEHVgcXIa7nVdSzTS0HRgqDpc=
Date: Wed, 6 May 2026 07:52:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ete: Always save state on power down
Message-ID: <20260506065204.GB3778514@e132581.arm.com>
References: <20260505-james-cs-ete-pm_save_enable-v3-1-485d21dd79b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-james-cs-ete-pm_save_enable-v3-1-485d21dd79b8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_235207_996669_CF2DB07C 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, May 05, 2026 at 05:51:25PM +0100, James Clark wrote:
> System register ETMs and ETE are unlikely to be preserved on CPU power
> down. The ETE DT binding also never documented
> "arm,coresight-loses-context-with-cpu" so nobody would have legitimately
> been able to use that binding to fix it and ACPI has no such binding at
> all.
> 
> Fix it by hard coding the setting for sysreg ETMs (ETE is always sysreg)
> or ACPI boots. Use a local variable when setting up save_state so that
> it's immune to concurrent probing when devices have different
> configurations which is an issue with modifying the global.
> 
> This fixes the following error when using Coresight with ACPI on the FVP
> which supports CPU PM:
> 
>   coresight ete0: External agent took claim tag
>   WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117
> 
> Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

