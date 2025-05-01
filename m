Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97363C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 09:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDATSdr2U4rs/kg0yiUjwF8TUXDjKIrYUaOWwBVE8tU=; b=2SPQ9cAPaHj9e0/TpZRJfGXVKS
	DouUN2X/WFGLXlhg2Yxjv90U1jqzD+B9Byk1lNs/cyJ7F5KaoApQpfsxup43xVEdwOT9xKRDkUgkU
	+jkEbUr/GahlMd1c1eTeFsw0eoZd0eAfBNyABEnMpzmWABtGRKXKHyNYuKFRYLSzUhyc115VRlX8X
	EeDz2jMAOhtiG5uzQNSE+7PNlWwy911I/nD4SL7VHS7KnQG3+0oXRmVuQc+3uetYOzyS/b+HsxJJH
	vHcUzVbR/xohwfPd16Jz21leS2PmLUU+8D4hhiYuYriO8UI3mDX2injz0wxclVP/zzmLkIkIaOpWX
	Yd18wsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQVb-0000000F8Y9-3iHb;
	Thu, 01 May 2025 09:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQTh-0000000F8SS-3235
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 09:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98FA0106F;
	Thu,  1 May 2025 02:45:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E1BC3F5A1;
	Thu,  1 May 2025 02:45:09 -0700 (PDT)
Date: Thu, 1 May 2025 10:45:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, peng.fan@oss.nxp.com,
	Michal Simek <michal.simek@amd.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBNCnO6nGjkMXFba@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
 <aBIbC15NiqUseZc7@pluto>
 <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
 <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94e94c5f-210b-43b8-99bc-e7ad7da2588d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_024513_808923_B9FA3248 
X-CRM114-Status: GOOD (  17.46  )
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

On Wed, Apr 30, 2025 at 10:03:42PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 30, 2025, at 17:26, Sudeep Holla wrote:
> >
> > Arnd,
> >
> > I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
> > to conclude if you plan to get this for v6.16
> >
> > We probably can wait to push this $subject after your changes land. But
> > it would be good to know your opinion here especially if you are not
> > pushing your patches for v6.16
> 
> I've pushed my branch to the asm-generic tree now, so it should 
> show up in the next linux-next.
> 
> Cristian, I think you can keep the __VA_OPT__, as the build bots
> should stop testing with older gcc versions once my series is in
> linux-next.
> 

Great, I'll keep an eye on linux-next.
Thanks for the feedback.

Thanks,
Cristian

