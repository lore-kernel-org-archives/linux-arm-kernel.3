Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB14CD74EC2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm5lrGHaaf9sNfErhKfvyH2cd0YHIcDO1gth+1spoB8=; b=v7peletr5lQL4Ad31ND0Mgjpkv
	MU9UctRUoR1ptjoQAHc5Ao0XLatrVqgJojH6v8cRVv3pGIHffjdSLQA/BezsanF/lOW7BdgJHoQfD
	Rv57/AryfC2iKnuSwVy1LiXemdBSRDDV3e/Pkr667RA5kWIN6pO3xCb5Id0I4FCfrXAaeKRXeNOCA
	RQ/VdcD1eRYbL9dJljJ9XphBPAf1CIZCCNWJbOEQ/uUMcCUv+6SaJB0fwX2hZKRZELD51HxG7WdNI
	HNw0fWg+ZngyRYCVZvUqMGgOF4FVcFgF9k1ynbQfSux4iVZD5xXoguX3PIN34EpnJ88S0EfaOenOR
	SiPDzZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGyQ-00000008wZ8-35J3;
	Fri, 23 Jan 2026 13:13:14 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGyO-00000008wYk-0Mwu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:13:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5595A10D866;
	Fri, 23 Jan 2026 14:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769173980;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zm5lrGHaaf9sNfErhKfvyH2cd0YHIcDO1gth+1spoB8=;
	b=hUtloW+WnY7BFkUDr92urRQbAcA7J4PpX5I9S4Eoma7Ay03UJloEK0eMhdL1lDPcaJNfr7
	F8meKfTSGHPtqe+RwEi8uV5TenWQEl3QJPZTDP4VX1pe/2o1ikjqXj0RsT3GA5MY/aSJqL
	HDRhOBLq2lqx4SUw7WU5dVdEzwWbhFYQEAwoKQeIws6qyJVR/avVzSvj7VvcCfum/SGAtX
	ePXjmzukNk/CMSo0souoGEgm7DjQpe5JAsMM5URo5/pDNs4MP1s6ovqYxxA/mvYMHFisJL
	e6L/t9yp7n3VzN2Q2wPLNY5hWQZwHLSJ2M6P3EHXzsYQBeBQKpUPLL/UZPyy0Q==
Date: Fri, 23 Jan 2026 14:12:52 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Turquette <mturquette@baylibre.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <20260123141252.3250c6ce@wsk>
In-Reply-To: <20260122200514.3cdb6fb6@wsk>
References: <20260122130649.4150338-1-lukma@nabladev.com>
	<4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
	<20260122200514.3cdb6fb6@wsk>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_051312_345335_69CB50C1 
X-CRM114-Status: GOOD (  21.30  )
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

Hi Andrew,

> Hi Andrew,
> 
> > On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:  
> > > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > > operation it is required to enable ESW and MAC table lookup
> > > clocks.
> > > 
> > > The MAC table spans from 0x400E_C000 for 0x4000 and it is
> > > necessary to provide clocks for each AIPS1-"slot", which size is
> > > 0x1000 (hence four separate entries).
> > > 
> > > Those can be enabled via clock gating CCM_CCGR10 register
> > > (0x4006_B068).    
> > 
> > Sorry, i lost track of the state of the switch driver.  
> 
> New year, new MTIP L2 switch patches in preparation :-)
> 

Just to share:
https://github.com/lmajewski/linux-imx28-l2switch/commits/vf610-linux-6.6.y-mtipl2sw

The driver has been tested (after backporting) on v6.6 LTS with
PREEMPT_RT.

Moreover, I've added support for switchdev.

> > Is there also a
> > patch to add consumers of these clocks?  
> 
> In short - this patch set is a preparatory one for vf610 SoC support
> of the MTIP L2 switch.
> 
> Those changes describe more thoroughly the clock subsystem of this
> SoC.
> 
> >   
> > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>    
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> >     Andrew  
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

