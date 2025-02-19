Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72130C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3wIgWEBAVft/JwrpE9vdLD8pmHQ+Xp280aP4h9p6Fc=; b=LDrLydIwBm9YkqUWAgq0BU4u0t
	M4QaJIH3sbrmsjN7CM9605Lek8g/dphxLxnpdqMUVVXPh0MIwrUFXyI/HtYDvIy/vRdiq8QxsKqGu
	Hxr1V4roCVJ5AFxVChC0bl3o/n1Czkl1RjzyvjRDEXcpJeCL8Piv67p+PAUsv6L3HCqTNN6pgTcT2
	XpD4+3TxqwBgjliZ7cTaWyehqZu6vyf0DpFrDs7IZQUgvylTqYUT6gC79piR3nts6T+yzjOqKnzxT
	iDMm5hciHg8xTYaTFnsn0PfhAniH/MJNOyYVR+zg+ajT00Lb/kBAXThht6lgt9wICooxd/n57onKH
	Vg4llrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZs-0000000CDGo-33AG;
	Wed, 19 Feb 2025 10:45:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh9N-0000000C6Ps-1YPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:17:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3CCD1682;
	Wed, 19 Feb 2025 02:18:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6503F6A8;
	Wed, 19 Feb 2025 02:17:49 -0800 (PST)
Date: Wed, 19 Feb 2025 10:17:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z7Wvyn1QJQMVigf9@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218133619.GA22647@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_021753_451506_20EE2BE7 
X-CRM114-Status: GOOD (  26.98  )
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

On Tue, Feb 18, 2025 at 09:36:19PM +0800, Peng Fan wrote:
> On Tue, Feb 18, 2025 at 10:24:52AM +0000, Sudeep Holla wrote:
> >On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
> >> A potential solution is not using reg in the protocol nodes. Define nodes
> >> as below:
> >> devperf {
> >> 	compatible ="arm,scmi-devperf";
> >> }
> >>
> >> cpuperf {
> >> 	compatible ="arm,scmi-cpuperf";
> >> }
> >>
> >> pinctrl {
> >> 	compatible ="arm,scmi-pinctrl";
> >> }
> >>
> >> The reg is coded in driver.
> >>
> >> But the upper requires restruction of scmi framework.
> >>
> >> Put the above away, could we first purse a simple way first to address
> >> the current bug in kernel? Just as I prototyped here:
> >> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
> >>
> >
> >Good luck getting these bindings merged. I don't like it as it is pushing
> >software policy or issues into to the devicetree. What we have as SCMI
> >binding is more than required for a firmware interface IMO. So, you are
>
> Would you mind share more info on other cases that SCMI not as firmware
> interface?
>
> >on your own to get these bindings approved as I am not on board with
> >these but if you convince DT maintainers, I will have a look at it then
> >to see if we can make that work really.
>
> The issues are common to SCMI, not i.MX specific.
> I just propose potential solutions. You are the SCMI maintainer, there
> is no chance to get bindings approved without you.
>

I am not blocking you. What I mentioned is I don't agree that DT can be used
to resolve this issue, but I don't have time or alternate solution ATM. So
if you propose DT based solution and the maintainers agree for the proposed
bindings I will take a look and help you to make that work. But I will raise
any objections I may have if the proposal has issues mainly around the
compatibility and ease of maintenance.

> No more ideas from me. Leave this to you in case you have better solution.
>

Unfortunately no, I don't have one. I haven't had time to sit and explore
the issue and think of any solution yet.

--
Regards,
Sudeep

