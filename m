Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5A8C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDFlTDkmewCOyJwFuz7uMa+pChp8dl4Jfof3pfwSFns=; b=prwATOAuLdf7pSFtPhkgsp4Byf
	l0kjdSt2J0UsBZ00jn2w8j/RlXMFKHRZPRj3Q1mAbuygdGDV/2+MUAMTLbTfwdjjVXbL0rZcYrXwS
	3wuimmX0K86usdXW5dy4lhnVI+D0IBMOwEAnT4D5GD5xstQdhOmU0PnVYqDykrnRCIKtXrkmSUsLK
	YUHXxHq335u/5dZAmMDe3ADt9geNGlbdeulcgr56JhwlTSXZkEVAJjXvzHDTFMnvYpVArc8XQleeB
	IavHqhyEGqM+cHMjw+5y7tL2nYr/8FIQR/rj3psCnafleGnCZ8g0fUqjv6P1neTZC9GJMIVBwY0az
	rODm+Rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5lU-00000004Lzc-1mu3;
	Fri, 10 Jul 2026 07:35:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5lT-00000004LzH-26gI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:35:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 641656001A;
	Fri, 10 Jul 2026 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366B81F000E9;
	Fri, 10 Jul 2026 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783668914;
	bh=ZDFlTDkmewCOyJwFuz7uMa+pChp8dl4Jfof3pfwSFns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jazFSLFhy3qbAb5zLVpefSY9VjtAOPPSuF0bFtPKWr2IN5T79pyQK5KGpaMOAfIc6
	 DdZPkAkCso3aDJrQCYwXPqJyDZtV3InMthVBw9PBNULcbI0h9nSrvgI3kQxa1gRevI
	 Cw18WuQFEWteXPPg/stW7Hi0RrAON/2PxhfqmFkDJKWcMHQr36ZQa5eeVP+gdFbE1I
	 ZlR1DfePeVI/CxrgxQk8AlEkSWLY03s3U2mBMiqp6JDEK6FiV/7fWmx+8Ywb+hod7V
	 quJoUaILjYqgzpBJv3xZFeP2spCjEp9la/utG+1xmIRgwTbL3qg1kx0TkS4XsTJjtY
	 VhVgC6fJbbIrw==
Date: Fri, 10 Jul 2026 08:35:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <20260710-lemon-pogona-of-wind-b3a003@sudeepholla>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
 <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
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

On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
> 
> 
> On 7/9/26 17:56, Cristian Marussi wrote:
> > On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> > > SCMI server from different architectures than ARM that's why remove
> > > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > > rename folder to reflect it.
> > 
> > While I understand dropping the dependency on ARM (I always wanted to do
> > that and test if it worked at all on some otehr archs with QEMU), I am
> > not sure about the whole renaming party ? why is needed just for
> > cosmetic reasons ? it is at the end an arm originated protocol so I dont
> > see it as a being wrong to be named as such even though used by other
> > archs...I have not really strong opinion on this...
> 
> I have been in CC on U-Boot RPMI patches which got to my attention because
> I don't want to have another interface for MB-V(riscv-) running in
> programmable logic and have another server in the system doing the same
> thing.
> 

Ah that's interesting. I wasn't aware of that. I still agree with the move
in principle, but how does that align with these:

drivers/clk/clk-rpmi.c
drivers/irqchip/irq-riscv-rpmi-sysmsi.c
include/linux/mailbox/riscv-rpmi-message.h
drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)

Now I feel we need some alignment before making $subject move.

> Based on that we had discussed about it with Vincent and Souvik (we missed
> you there) about using SCMI on non ARM platform and both of them didn't see
> the concern to be marked as ARM only protocol.
> Truth is that some of protocols have ARM in description, file names, etc but
> some of them not. That's why I think it is good time to sync it up and
> enable
> running this protocol on other SOCs.
> 
> > ... my concern really is ... wont this full scale rename simply generate
> > a lot of un-needed churn for future fixes and/or backporting ?
> I don't think it is going to be a big problem because it is just git mv
> which git is able to gracefully handle.
> 

Otherwise it may end up being unnecessary churn though I completely agree
with the git/backporting aspects. Just don't want to churn things up until
we have some plan and further changes/users of this move.

-- 
Regards,
Sudeep

