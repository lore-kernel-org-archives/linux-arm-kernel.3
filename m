Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA5BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U7qY17YQD06QSaz8hj3toKPlBJNvlaASJImOFX/yqw=; b=NcJN7t2+ld8NLgk883razJCHAT
	ddmqzPMYxtbNx1MG1CXyELw/RKEzj98XJdTqQUP8E+lophjfGXvOTMUDehwyHlo9np0si+lDK1jtA
	y3qqUSJoMOKhUuqhPNLCljMiaoMT/7ned2DcfCwADkwgrPOf+YeT7IFYxxY4tBVhS80UJAynirt8b
	dT8D0DqsnvmEflq0MnOE8PMYwgtUJQonGLqMvWAPrGvchK4QnvB1yVY84qtnHwx3iDan5DXggqUQE
	2as4WPx7BwnNmn5wG0B0/z+ViqXIve5saf6ehY95sLRSbTy+FplotUjJ36ucr2aid79NyWbyayxQT
	gGFyuVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9p3-0000000DXHv-3Bih;
	Wed, 13 Aug 2025 11:39:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um998-0000000DRS5-2NM3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F78512FC;
	Wed, 13 Aug 2025 03:55:45 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE9C03F63F;
	Wed, 13 Aug 2025 03:55:51 -0700 (PDT)
Date: Wed, 13 Aug 2025 11:55:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/4] clocksource: Add standalone MMIO ARM arch timer
 driver
Message-ID: <20250813-macho-snobbish-alpaca-ff07fa@sudeepholla>
References: <20250807160243.1970533-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807160243.1970533-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_035554_653794_03945627 
X-CRM114-Status: GOOD (  18.33  )
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

+Alexandru

On Thu, Aug 07, 2025 at 05:02:39PM +0100, Marc Zyngier wrote:
> For the past 10 years, both Mark and I have been lamenting about the
> sorry state of the badly named "arch_timer" driver, and about the way
> the MMIO part is intricately weaved into the system-register part.
> 
> The time has finally come to have a stab at it.
> 
> This small series simply creates a new timer driver for the MMIO arch
> timer, and only that. It is an actual driver, and not some kludge that
> has to run super early (that's what the per-CPU timers are for). This
> allows, in turn, a pretty large cleanup of the per-CPU driver, though
> there is more to come -- one thing at a time.
> 
> As an added bonus, we get a clocksource, which the original code
> didn't provide. Just in case it might be useful. The end-result is far
> more readable, and about 100 lines smaller.
> 

(Tested it on Juno R2 and FVP in both DT and ACPI boot)

Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Alexandru found it useful(avoids some unexpected hang IIUC) in his setup
based on bootwrapper which doesn't initialise MMIO timers.

-- 
Regards,
Sudeep

