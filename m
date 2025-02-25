Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA99C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igunqGICXsKr6OtW++2jbEjn+EWqjuNOIF9KWqLH9Ng=; b=BBnISqX/yyDMy1O0fC6edMINOE
	BxP9DsSlKhH73Yp8dTIgvEl7LD61QrqODXW549yhW/oHCexHv2dx3KLteJ+3qooM2UPYbLWg+02AX
	gyZpXYkMCBnzU/PAGWyl3VXMSHvltKpTHW8NPHK3Qw+hjplBdDcMcIrpQooQnIf7yB/oaWrHAQ9Dh
	WRnFwMnCMuFW2zZJCNSBQc9MtyRnm+54qSI//RXZ9KL52C0mz+BpDCxZAiWNkhfDtIFIUwI6jz3n4
	pDo69L/a2RFtQBfe5kB+DJjMEE2R3iXVUeKFm0J4pbiDECi+YJl2LDY6hb2K20+HvThmvWKKrSFRh
	s2yOpnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtWF-0000000H6lX-247a;
	Tue, 25 Feb 2025 11:54:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms4j-0000000GnwP-4BUE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:22:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC2601516;
	Tue, 25 Feb 2025 02:22:19 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67E593F6A8;
	Tue, 25 Feb 2025 02:22:01 -0800 (PST)
Date: Tue, 25 Feb 2025 10:21:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 3/5] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <Z72ZxspU3hfGZWez@bogus>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-3-0eab7e073e4e@nxp.com>
 <Z5DhM1VLv2uCCVwT@bogus>
 <PAXPR04MB8459D4C2CA3D5AE58B2B509788E02@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459D4C2CA3D5AE58B2B509788E02@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022206_083895_E683916D 
X-CRM114-Status: GOOD (  16.37  )
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

On Thu, Jan 23, 2025 at 01:30:43AM +0000, Peng Fan wrote:
>
> This is to manage the M7 core by Linux. I just put more documentation here.
> CPU protocol is also used by ATF to manage AP cores.
>

Good

> > Also what other CPUs are we talking here.
>
> M7 core
>

Are they referred by any other name in the system ? I reason I ask is using
plain "CPU" is too generic and confusing. At the same time using "M7" may be
too specific. I am trying to see if there is any middle ground.

> In general I would like to
> > explore the possibility of collapsing this with LM protocol. CPUs within
> > LM is LM's responsibility to bring up. And CPU can be seen as an LM for
> > sake of this vendor protocol. I am not get into details here yet before I
> > can understand what these CPUs are really in the system and why we
> > need this.
>
> Our system supports M7 and A55 in one LM, so A55 use CPU protocol to
> manage M7. When M7 and A55 in different LM, use LM protocol to
> manage M7 LM.
>

The LM(assuming Logical Module/Machine) is an abstract construct, it should
apply to even subset of components within an LM. Just wondering what are
specific reasons do you think applying LM protocol you have on those M7
CPUs alone in A55+M7 LM would not fit well.

--
Regards,
Sudeep

