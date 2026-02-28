Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29620FEE4EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x11OlZtY2hCKTyN8gHN/lEORZexwU896j9hXgZ1Ld/s=; b=20/FL6i3rMq2brAidU9ZufWH6G
	UPakY+VBaqNd6KtfHQgGQTiQm5WgIh28Y4OepLydxItWK2Qe7Pyvued4yfxvC5dBw0GgEGG0hjTqP
	8W9LJuxExeFD9c9LimV62SAV0/LZWbpyMTB/tpmXvnXj9UlquJ56Pwq4JhKL6CQ3Ea12QR1XyEBg4
	hfo7Siw4pxJozGVGVPKH+vKBQEs609HVsCK2n17SK2OPuVCIKCM8YAB/pQtP6TQPsLEeAeBxQHLcs
	vB4BJdde+KdjoOsgUcrbtugjgtqx8GbkxwaVVK6ZwE2ws+9pRt/zbcH9Pvo5BY4cl8qgp0Ddc+MKi
	ngeI4Xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHm4-00000009kQC-2m6c;
	Sat, 28 Feb 2026 10:42:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHm1-00000009kPp-3aqR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:42:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E13341516;
	Sat, 28 Feb 2026 02:42:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01243F7BD;
	Sat, 28 Feb 2026 02:42:08 -0800 (PST)
Date: Sat, 28 Feb 2026 10:42:05 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"philip.radford@arm.com" <philip.radford@arm.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"etienne.carriere@foss.st.com" <etienne.carriere@foss.st.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Message-ID: <aaLGfXppc7am90us@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-10-cristian.marussi@arm.com>
 <aaJWfq5HRQHxk61E@shlinux89>
 <PAXPR04MB84594E5C9BCE2B5171D15FEB8870A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594E5C9BCE2B5171D15FEB8870A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_024214_025303_9E4F29CD 
X-CRM114-Status: GOOD (  18.17  )
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

On Sat, Feb 28, 2026 at 02:43:47AM +0000, Peng Fan (OSS) wrote:
> > Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators
> > support
> > 
> > On Fri, Feb 27, 2026 at 03:32:23PM +0000, Cristian Marussi wrote:
> > >SCMI core stack provides some common helpers to handle in a unified
> > way
> > >multipart message replies: such iterator-helpers, when run, currently
> > >process by default the whole set of discovered resources.
> > >
> > >Introduce an alternative way to run the initialized iterator on a
> > >limited range of resources.
> > >
> > >Note that the subset of resources that can be chosen is anyway
> > limited
> > >by the SCMI protocol specification, since you are only allowed to
> > >choose the startindex on a multi-part enumeration NOT the end index,
> > so
> > >that the effective number of returned items by a bound iterators
> > >depends really on platform side decisions.
> > >
> > >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > > drivers/firmware/arm_scmi/clock.c     |  3 +-
> > > drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++------
> > --
> > > drivers/firmware/arm_scmi/protocols.h | 13 +++++-
> > > 3 files changed, 55 insertions(+), 19 deletions(-)
> > >
> > >diff --git a/drivers/firmware/arm_scmi/clock.c
> > >b/drivers/firmware/arm_scmi/clock.c
> > >index 15faa79abed4..d7df5c45836e 100644
> > >--- a/drivers/firmware/arm_scmi/clock.c
> > >+++ b/drivers/firmware/arm_scmi/clock.c
> > >@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const
> > struct scmi_protocol_handle *ph,
> > > 	struct scmi_clk_ipriv *p = priv;
> > > 	const struct scmi_msg_resp_clock_describe_rates *r =
> > response;
> > >
> > >-	p->clkd->rates[st->desc_index + st->loop_idx] =
> > >-		RATE_TO_U64(r->rate[st->loop_idx]);
> > >+	p->clkd->rates[p->clkd->num_rates] =
> > >+RATE_TO_U64(r->rate[st->loop_idx]);
> > 
> > Seems irrelevant
> > 
> Ignore this. I understand wrong.

Yeah...I will double check BUT the aim is to proper behaving while
filling up the vector when doing only a partial discovery with bound
iterators...in that case you want to fill probably only a subset of the
available slots in order like [0]:min, [1]:max...

Thanks,
Cristian

