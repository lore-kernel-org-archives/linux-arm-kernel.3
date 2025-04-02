Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F69C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF4157mUVWsJ2gRKWe1cUQqMXctKlfNEEm/qHkIY/hs=; b=v/C6NPKl6y1RUg/QqvXoRJyR1X
	VK0ronqnbCEtV6DUZ4+MdSwuoRZ3Z/grehcuduNBh0Sq326qVbkBlVIxAts0pGju6gkXNB7z4vdR9
	e6GyjykgGBj2rHujdTtSamRGZ27RKHkrIkY40L+1nukDPOKiGoprdaSqHm09UPYQ++/t3S+cY+MN8
	EHnivaHz9Ijxr5tkAE+HZ6iIpFb+Q/mnsWhuRSXRB+BUiptX34N2Zm6Af6Gu2eX+OCmEdumIxd2R5
	spu//OwNRKv42qPw6X0nMh8AyBU/g2iTP4CkFruAPGAWT4kV6MlL+9ejj3LCfRDddjqJoJZjJmdQc
	mZaVv0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwmG-000000060PB-0dSQ;
	Wed, 02 Apr 2025 12:01:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwiJ-00000005zTC-20DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:57:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB1B106F;
	Wed,  2 Apr 2025 04:57:02 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70E043F63F;
	Wed,  2 Apr 2025 04:56:56 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:56:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	d7271.choe@samsung.com, joonki.min@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250402-messy-wild-squid-7b4da9@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+TEa8CVAYnbD/Tu@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_045659_717060_52A82EC1 
X-CRM114-Status: GOOD (  12.75  )
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

(Failed to find the original email, so reply on this instead)

On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> 
> The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> so we cannot rely on it in that context.
> We would like to use these suspend/resume functions during S2IDLE as well.

I have one orthogonal question. The s2idle will just use the deepest
cpuidle state registered. So if s2idle needs this save/restore of GICv3
ITS, how does that work when all the CPUs enter that idle state.

With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
bit confused as how it can work fine in normal cpuidle paths but no in
s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
s2idle little different but nothing to change this GICv3 ITS save/restore
requirement between cpuidle and s2idle.

-- 
Regards,
Sudeep

