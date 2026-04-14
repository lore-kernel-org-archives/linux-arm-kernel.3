Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016A2F531EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFqC2lebQAq+6iOp7PXuI7wVdYvZVZMumg4WHzJ280A=; b=IV5K6JTwwK4T46yU2B4fZaubSK
	luGIFiDqr1meh2Q9owAcGzlaHPlMiYnCJDPGF6XYGjP5FUX/AteueLSJwufhCBHE9qxXGtm9Blge9
	NdXRjBA+TDxfkf6u/Yf5Q7vvtMBIafI5P6WoGFhx5DJHGGu74E7Jvs/2KB/fhSPqYENXqIOh/t4xy
	7GEwSGWMI5AxEiuA7Ou8UYmPPq1bSqsYOr9NYlojgAY0fnMjgklMR6RrSSKDExFBuixNbS8VXoCVu
	42ToYjbf35w4D0bOASEIi9hQG9b29MPdEpvvb9zhhhgc6keWu53YXfvgAkC6tcH/Ai3scDYXxgi5+
	MvREeGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCWxW-0000000GmLS-1efU;
	Tue, 14 Apr 2026 06:09:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCWxT-0000000GmK0-3Lgf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 06:09:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7693B4E9F;
	Mon, 13 Apr 2026 23:09:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53313F86F;
	Mon, 13 Apr 2026 23:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776146949; bh=zt4cBKkD+Z8gngqXtrmFn23L0TCqItIj6LEAE+BTbu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVWrwmzSFl/EwuVQDbAi1/9P1W1fqBNPQG7ct1Y9sgbSn0SzSjLxuG7mV2MEEYBwX
	 cyDM8risgM1qyn2CTQJDWdgFMTqNFonSw1rS2wi7wppsA7ZbGWHQyCEjC3Fx0hCnNi
	 0eWzY7zX8bwqy3JbKwb+J/TfP963HzJrzNoI4NWE=
Date: Tue, 14 Apr 2026 07:09:06 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 00/20] CoreSight: Refactor power management for
 CoreSight path
Message-ID: <20260414060906.GE356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <0dd1c432-884a-46c1-828b-f3b22769d000@oss.qualcomm.com>
 <20260413163130.GC356832@e132581.arm.com>
 <633b8a0e-5e78-4c4d-83d8-d4c8ea71bf15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <633b8a0e-5e78-4c4d-83d8-d4c8ea71bf15@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_230911_904401_A37B43A6 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Apr 14, 2026 at 11:30:39AM +0800, Jie Gan wrote:

[...]

> > > Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > 
> > Just heads up: since Sashiko [1] pointed out a corner case where an SMP call
> > may fail when disabling the source device, the per-CPU path pointer
> > might not be cleared.  If the ETMv4 device is then removed (e.g. if the
> > user unloads the ETMv4 module), CPU PM notifier might access the stale
> > path pointer.  Though this is a rare case, we should handle it safely.
> > This is why the series was not picked for the v7.1 merge window.
> > 
> > Thanks a lot for the testing, Jie! It's very helpful, and I will add
> > your test tags in the next spin.
> > 
> > Anyway, please expect more iterations.
> 
> Noted, will run the test cases on new iterations.

Thank you!

