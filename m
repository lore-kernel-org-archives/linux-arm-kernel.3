Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE1F31E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/uzBnMrQA8VuiveykpYoSonZD5gx72sM1mLzhguehg=; b=RIXXr9z0UbIH6z/4yyuDYV93m8
	mJqx2Kacwut0H4z9mC3aNoyriGTHboZvMiMMW9KGX2D6SyptDy/VDhv/5VEAkK5jMIz6C+I/gx8/k
	LD3rEwuh+Ot5W0W+wSHojkbLuB0Qg2J9sGVp6YWnfNdsGXxCbK67ZaZ1euE6yvlqbDAPJjOch/k0B
	TfKnIa78ZubD8aMRx7N8Lb6Q0eFeAjW1a3lTJccPLaYdLANBzTzsZYyM1VGB4f6Nu4KdiX3rOHZrb
	HRhVrvMbztzugH+HIKIGwTkh7o9CxvmzXp2Ts4GdHEgC7wvYuktqV/DuRLbARUFzzRGQunPVItYGr
	zWFG27bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAriK-0000000AsT4-2sh9;
	Thu, 09 Apr 2026 15:54:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAriJ-0000000AsSV-1D5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:54:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDBDE1D15;
	Thu,  9 Apr 2026 08:54:29 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC723F632;
	Thu,  9 Apr 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775750075; bh=bjnG3R1Z+aW4FmWxs0uE50Seyd3MhtlE0Q8WepgPHbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRvFDzDxrl7Hb2bK39K56zxC85Pqx2VsuPJsAEubKgs6Z4XKnVACkIy9O48sbJhGy
	 ESXDxRMXYOJDV9J779pzoQZOpEUMSoc9hxTV/ChVjqSRVog70Vwtje4XFuE2zWmjQd
	 AXU0lZ9M1iD3C55R+/8d+v4NNMew8rM2X9cnHKGw=
Date: Thu, 9 Apr 2026 16:54:33 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v10 17/20] coresight: trbe: Save and restore state across
 CPU low power state
Message-ID: <20260409155433.GV356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-17-13e94754a8be@arm.com>
 <e2241b98-92a6-45e0-a9d3-061f1ed69ae1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2241b98-92a6-45e0-a9d3-061f1ed69ae1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_085439_370587_5F2FFC34 
X-CRM114-Status: GOOD (  15.13  )
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

On Thu, Apr 09, 2026 at 11:52:06AM +0100, James Clark wrote:
> On 05/04/2026 4:02 pm, Leo Yan wrote:
> > From: Yabin Cui <yabinc@google.com>
> > 
> > TRBE context can be lost when a CPU enters low power states.  If a trace
> > source is restored while TRBE is not, tracing may run without an active
> > sink, which can lead to hangs on some devices (e.g., Pixel 9).
> 
> Can't this still happen if saving the source times out on "wait for
> TRCSTATR.IDLE to go up"?
> 
> That would make coresight_pm_save() exit early, not saving the active TRBE
> state. Then when coresight_pm_restore() is called it restores a stale
> inactive sink, then enables the source again which is the state that can
> hang.

Hmm... I don't expect this to happen anyway.

If CPU PM enter fails and returns an error, it will bail out early of
the idle flow and the CPU will not proceed entering low power states;
therefore, the restore flow does not exist.

Thanks,
Leo

