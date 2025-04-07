Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EAEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hFCpNzgvYPcy3ClT3r7L6ZPnfTiI/feFQRvvV2p21s=; b=jIzv+488PpKpCKCcTs3izKEzZU
	4qnKdRkFzJexx8Ms54SFWkvPCsvFehBsXgzbEme7tkklkvIcNUKDOzFITVDhrBOSuxuLpv/qkVMEI
	1T9PV3b6XuGhlFAXX8ZbOzu1ZrNuxqxdm8Hl7l13UkfMc2FLviXShqlHbqZeSRtjJhKeIrefC9pO2
	Vi4mzxe9kpFph2AtWFxMRy6j6zQBGoCbAaZt5FxoK5g8rjiCRmNjdhxz94SA9E6iB1unExCrjaZSN
	7VuaIhjx3vhgUbFUgiKXHoH3NU42+tNpaOvU+OVdqzC0bvdNAr1HUu93e5b1aU44nZg9e0y1tTS/x
	LfEqMIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ifO-0000000HAoI-0R2r;
	Mon, 07 Apr 2025 09:21:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ic2-0000000HA5j-15Gz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:17:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DC7106F;
	Mon,  7 Apr 2025 02:17:49 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D141B3F59E;
	Mon,  7 Apr 2025 02:17:45 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:17:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Donghyeok Choe <d7271.choe@samsung.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
 <20250403-rare-wasp-of-management-9bce59@sudeepholla>
 <20250404041323.GA685160@tiffany>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404041323.GA685160@tiffany>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_021750_339607_2B47C270 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > /me more confused.
> > 
> > Are you saying you have some cpuidle platform specific logic inside
> > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > trace the entry into the state and nothing more.
> 
> If you have any further questions, feel free to reach out.
> 

I was trying to understand the difference in behaviour between normal
cpuidle entering the same deepest state that is entered in s2idle state.
I assume GIC doesn't loose power and no need for GIC ITS save/restore
in normal cpuidle path ?

If so, what triggers the GIC suspend in s2idle path if syscore_ops is
not getting called ?

Why would the firmware pull the plug on GIC ?

Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
I am still missing something in this flow.

-- 
Regards,
Sudeep

