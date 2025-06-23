Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7F5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHE645lzW8/9hgWnaslhleu2O6kscVxeAVdTrPzIfAw=; b=Xt7LmtkiHstb8ZNfJGlLPiBak6
	pHm7fFxuS2hJw6UrLte5gOerg0SuzH2JzLTqJgVr/ysh87Fh10woo5MiZmpa2NZnTjdZPy7Mx7Biz
	UKQs9bW+KFDFsvtytx3klbgZNRsbPugoEbgjagH/3reen7/UPC27GcOlPTrY2DWJXrt5Luq9avvEK
	zvg/5QW8Ofl8RnEEZLC8OggJjIaOlXcYUa0XcHh6cK9I4Zc56kYY/0J+kmQ44w08R3lCTvY7ChFr1
	GmMRdW9IzF+O3Fb2Znf92N+PuJOsQ8IreTwpu0Uo/HH2X9qmNQjK9M5z7jr5o3uVifhOxeupXfv0h
	8gi7aJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToY8-00000003zo7-4B3D;
	Mon, 23 Jun 2025 21:17:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk1G-00000003PxF-1fxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BAA6113E;
	Mon, 23 Jun 2025 09:27:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C2E3F66E;
	Mon, 23 Jun 2025 09:27:39 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:27:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623142957.GA10415@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_092742_481490_62062A9D 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, Jun 23, 2025 at 10:29:57PM +0800, Peng Fan wrote:
> 
> One more example is
> Linux suspended, other agent send reboot linux message, Linux should
> wakeup and reboot itself.
> 
> Same to suspend
> Linux suspended, other agent send suspend Linux message, Linux wakeup
> and suspend again.
> 

These are very valid requirements and if this is not supported or not
working as expected, it is a BUG in the current implementation.

As lots of details were discussed in private unfortunately, I suggest you
to repost the patch with all the additional information discussed there
for the benefits of all the people following this list or this thread in
particular. It is unfair to not provide full context on the list.

Just to summarise my understanding here at very high level, the issue
exists as the second notification by an agent to the Linux to suspend
the system wakes up the system from suspend state. Since the interrupts
are enabled before the thaw_processes() (which eventually continues the
execution of scmi_suspend_work_func() to set the state to SCMI_SYSPOWER_IDLE,
the scmi_userspace_notifier() is executed much before and ends up ignoring
the request as the state is still not set to SCMI_SYSPOWER_IDLE. There is
a race which your patch is addressing.

-- 
Regards,
Sudeep

