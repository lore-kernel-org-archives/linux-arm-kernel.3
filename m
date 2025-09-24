Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F29CCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WugwlRt+f92wWZ3YUyN065k1SzG0y5rlcWoKr0jAWkU=; b=EKb6qO13bSOXxlfs78eH/MePoy
	BBWZ3yMGFTURxYvdHr9uSQH5xYnLZE3mNyexd37fgZk1zJoIdazn+ri2gLzNvtwfB1JqlnE53jSMi
	P4sA8GGG7mIZIkcSzNThECl1Tv2kVvzYz0oq8x4sR7MOiwyFDvDVkZbSKo5+VrwgkIuGT+Yg3xlV/
	rjP4mG3FtHN6QthPhbOthLElLDKsbyTHtsFmBPWnuG+44rpGTzPxNouzv3bzL2pbv5yXq3eTsmwlW
	rvIakd83mgEwS/cQWqMHGJE9B1AGlH+YUJTriUNPdAK4eaArAXY3M4HAy27FQWqh0DOSL/yvtZFSN
	qA83szZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PJG-000000007RW-2P7u;
	Wed, 24 Sep 2025 13:13:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PJE-000000007Qc-3a9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:13:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD41C106F;
	Wed, 24 Sep 2025 06:13:15 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7953F5A1;
	Wed, 24 Sep 2025 06:13:20 -0700 (PDT)
Date: Wed, 24 Sep 2025 14:13:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sebin Francis <sebin.francis@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Marco Felsch" <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Brian Masney" <bmasney@redhat.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for NXP i.MX95
Message-ID: <20250924-dark-super-gharial-246400@sudeepholla>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-5-5a2cee2f0351@nxp.com>
 <5f508f1d-2d08-4687-86cd-d1944caa0a49@ti.com>
 <PAXPR04MB8459CE9F22CD56A9BFDB5E78881DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <082735e7-956b-4574-952e-06ba69db41f1@ti.com>
 <PAXPR04MB84590D5AAAB56ED7E1CBDE05881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB84590D5AAAB56ED7E1CBDE05881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_061324_934291_0F57BA63 
X-CRM114-Status: GOOD (  26.02  )
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

On Wed, Sep 24, 2025 at 11:43:56AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for
> > NXP i.MX95
> ...
> > >>>        SCMI_CLOCK_CFG_OEM_START = 0x80,
> > >>> +     SCMI_CLOCK_CFG_IMX_SSC = 0x80,
> > >>
> > >> TI is also planning to implement the same in our upcoming platform.
> > >> so can we use a generic ID instead of vender specfic message ID?
> > >
> > > I tried to push to new generic ID [1] in half a year ago, but in the
> > > end ARM decided not to add generic ID for spread spectrum support.
> > >
> > > To i.MX, it is too late to use a generic ID and waiting spec, i.MX
> > > firmware has been public for quite some time and passed several
> > external releases.
> > > So I need to use what our firmware adds and spec allows: vendor
> > > extension.
> > 
> > Thanks for the quick response,
> > Since this implementation is specific to i.MX, can you move this to a
> > vendor specific file, so that it will not break i.MX's firmware and TI can
> > implement SSC in TI specific file.
> 
> i.MX has encountered issue with pinctrl-scmi.c and pinctrl-imx-scmi.c
> both supports SCMI PINCTRL. Current linux scmi does not support
> both drivers built in kernel image, because scmi devlink issue.
> 
> Sudeep said he would address the devlink issue in 6.19 cycle.
>

Yes it is a different issue IMO and nothing related to this.

> Given the current situation, I'm hesitant to introduce a new driver
> saying clk-imx-scmi.c.
>

Yes please don't, and I don't see a strong reason for that(yet).

Unlike vendor protocol, there is no way we can no upfront how the vendors
can use this in their own colourful way. So I am not sure if we start
building something generic from the start or refactor as more vendors start
using it. Hard to decide 🙁. Lets see, need to think a bit.

If Peng or Sebin or others have some idea, please propose or start the
discussion so that we can evaluate the approach.

-- 
Regards,
Sudeep

