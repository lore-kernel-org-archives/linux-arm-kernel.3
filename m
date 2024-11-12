Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D0BD42BB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCkmsvS3OoMegI5NcO45YtTnBJVOa6IiQ6KT6R3YkDg=; b=wdVWv5JrA6ZH1/m6PwkgL2KyAo
	GJ9fuKrBi2y2O5VVfU3UgNFEkBmb1QNMpW34r4KcJXm11EmsQ63IcimyUSgA4VcgaE0zZfZSN/GXQ
	vDoeayt2vHKcvj6V7UBrvOapfvv+sMBj0vzXZc9hseGb7lR1SbeS7nrkyk3MqBewgwF90rvJfjCSk
	v+vUZu8U/6QbT2WUXu12wzNH4JwSvjY4Si6M5dPJhl4GUaExFYzGbiX/DVkYC806Gya32KY4EKrxg
	LlsK6NoH/bnJ3VlKO5ECNR8CKo7e7P7T1LgbUi8Ui4BK40aZe6IHQNua86ziUVmWULd1XfrvFfrnI
	GsP2N49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuxM-00000004QCa-3WAJ;
	Tue, 12 Nov 2024 17:45:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuYc-00000004L4L-28VW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BABB5C54CC;
	Tue, 12 Nov 2024 17:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D933C4CECD;
	Tue, 12 Nov 2024 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731432001;
	bh=WLVOfxqes1xc6tPBqvZff21GY8qOJvM0DeYgwViWALM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyZrv9MGookTYoVLPGHnA9463Vw96aWB1Y5hzIo/d7BXLAL8IxQOZ/Bkq/B4bwZm+
	 RYgaIlDvET8ZTAzJjVsqboZOsB4kXJq8srd3YccdvW6zhYsqjKrZN5i04r33LkVDS1
	 Dz/nODORvkdfTCm+dY+8q2xAFGcoW8yuL0IDB8GeyvqKZDbGJLfIvfJwAXBptKerhF
	 LuLo0WFS9xRsMXKGProcWh7O2e9rqQCNoLmFy2f5GwR7RemNx4E6AM3UbVcjGIXIBX
	 4ro9tWq6HRkLq5ktF8Uktj/liMiiLuOa10+2pnnsA6/zRXc40mgQOdK+W1/RRyDXXP
	 QbRQsdiXLGWPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tAuYW-000000007i6-1ILX;
	Tue, 12 Nov 2024 18:19:56 +0100
Date: Tue, 12 Nov 2024 18:19:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
Message-ID: <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto>
 <20241106071215.jhnzcn4vkdfr3peg@bogus>
 <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_092002_667702_AD7C7AC5 
X-CRM114-Status: GOOD (  21.99  )
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

On Tue, Nov 12, 2024 at 04:56:26PM +0100, Ulf Hansson wrote:
> On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > >
> > > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > > are required to X1E cpufreq device tree changes to land.
> > > > >
> > > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > > >
> > > > > Duplicate levels:
> > > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > > >
> > > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > > that we are addressing in this series will also get fixed by a firmware
> > > > > update but they still have to land for devices already out in the wild.
> > > > >
> > > > > V4:
> > > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > > * Add cc stable and err logs to patch 1 commit message [Johan]

> Sorry for the delay. I have picked up the remaining patches from this
> series. All applied for fixes and by adding stable tags to them,
> thanks!

As I reported here:

	https://lore.kernel.org/lkml/ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com/

I'm seeing a hard reset on the x1e80100 CRD and Lenovo ThinkPad T14s
when accessing the cpufreq sysfs attributes.

Sibi tracked it down to the first patch in this series ("firmware:
arm_scmi: Ensure that the message-id supports fastchannel") and
reverting that one indeed fixes the reset.

Unfortunately this was only discussed on IRC and was never reported in
this thread.

Ulf, could you please drop the first patch again until we've figured out
how best to handle this?

Johan

