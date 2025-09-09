Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17188CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK65rTL7mtXpk2otClZs8Hxte/9rABynEnm+uF/HuI4=; b=jwA6sObhGM0PcKVh3fBnEVJA76
	5Wcn/Rak1vxJFaDbEZQ9ya5ShqlINlBjqsqckt7W2+t0rXnvi90g7myQ5jRU08Lz9a45OyrVh2vdG
	kxGukfmcPCid6piVu/RNjQHKl9Y/Zs2DppOoRkBJbpiggShT8GeARN9aQ3l4Qw0BveZQSRliXmIhL
	hnCD2q73BTZZ2hAGTLdt4vHHYgjtEGKlPk0yaUHpN9TRz/qwo3WjKci6DzFk8K1Te3ScljqbXWQjW
	/SuJkhhEl9PCziMTdjzQ1iyNZmZFs2fIQTEZX0TV0D+QUKbG12pzMWDcUlxPQLwxFXfBbz2ho4jx9
	gyqgZyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvSD-00000006L9e-2I6C;
	Tue, 09 Sep 2025 10:20:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuBG-00000005kBi-0BEw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:58:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C4CC15A1;
	Tue,  9 Sep 2025 01:58:16 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C48493F63F;
	Tue,  9 Sep 2025 01:58:20 -0700 (PDT)
Date: Tue, 9 Sep 2025 09:58:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250909-excellent-unbiased-seriema-8d619f@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
 <20250904-sm-misc-api-v1-v4-5-0bf10eaabdf1@nxp.com>
 <20250908-sparkling-owl-of-judgment-f17eeb@sudeepholla>
 <PAXPR04MB845929E7106141E785A32387880CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250909040159.GC20475@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909040159.GC20475@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_015826_118895_5B202FB6 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Sep 09, 2025 at 12:01:59PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Mon, Sep 08, 2025 at 11:51:02AM +0000, Peng Fan wrote:
> >Hi Sudeep,
> >
> >> Subject: Re: [PATCH v4 5/6] firmware: arm_scmi: imx: Support getting
> >> syslog of MISC protocol
> >[...]
> >> > +};
> >> > +
> >> 
> >> Much better now. But I am still thinking if this must go to the
> >> document to make sure it remains ABI and firmware can't reorder the
> >> as we might have no way to deal with that. That's the reason I was
> >> asking for raw dump so that you need not put all these details in the
> >> spec/document.
> >
> >Let me check with firmware owner whether they would include this
> >into i.MX SM spec or not. 
> >If no, raw dump would be the choice.
> 
> I checked with firmware owner, this should be using raw dump.
> The layout would be changed for new platforms.
> 
> Since this is raw dump, I think debugfs might be preferred.
>

It can be sysfs, but it can be just one single 4K dump, no more details
from the kernel than just raw bytes.

-- 
Regards,
Sudeep

