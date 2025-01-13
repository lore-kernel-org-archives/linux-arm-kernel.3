Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6A4C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myuRouzYLHW5pKKkFI3W0E4x/ZFfRzNrQHwvAV/0YeI=; b=hiHuhISY4yjF/VD8/SNlWhtMNt
	kEsyjEVcsLKXjw1mYSKIHXQZljaiI33cbLs1ToJO9IjWAijUVYbyaLqT914+99RSB1lT0pLjvA4Gf
	ujGxa2UWET992+S1IjdiEsM9S0ZTcl6WotB+zZUxtG+8KB5se885q3geFUd+WZ4va9BKOixFHCWzP
	oDZFrWmgLoPeOuXWqYttLlFjM2i80tdbQhD+21pDMO88mB5yFC4gR/A0Td61RmGF/QkKiMW51sVID
	/yiTSRJ5KF1eBObz13//qlEv6ysXUwH+YpUoVzipI12i+FL9ok61aGKtLYLobftvlt7LiHWxLCVtI
	4hYRHWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKuh-00000005KKh-43ur;
	Mon, 13 Jan 2025 13:55:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKof-00000005J6L-34MN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BA612FC;
	Mon, 13 Jan 2025 05:49:44 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA8643F673;
	Mon, 13 Jan 2025 05:49:14 -0800 (PST)
Date: Mon, 13 Jan 2025 13:49:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state as off
Message-ID: <Z4UZ2Au7KSFMibDW@bogus>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
 <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054917_813004_4DB17AC8 
X-CRM114-Status: GOOD (  23.32  )
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

On Mon, Jan 13, 2025 at 11:37:23AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
> > state as off
> >
> > On Fri, Jan 10, 2025 at 02:13:46PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Per ARM SCMI Spec DEN0056E, page 16, "The platform may disable a
> > > resource if no agent has requested to use that resource."
> > >
> >
> > True, but ...
> >
> > > Linux Kernel should not rely on a state that it has not requested, so
> > > make state as off during initialization.
> > >
> >
> > IIUC, this was done to avoid any transitions if the bootloader like U-
> > Boot has turned on the resource and OS can just rely on that stay.
>
> But if it is not U-Boot turned it on?

Not sure if I understand what exactly you mean by that.

> Or U-Boot is in a separate agent?
>

No, it will be same as OS for the SCMI platform/agent as they use/share the
same transport. It is hard to distinguish between them.

> > Anyways if the resource is not used by any driver/device in the kernel,
> > won't it be turned off anyways ? What am I missing ?
>
> Because the power domain is ON, kernel will not issue SCMI
> to platform to request it ON when kernel needs this power domain
> on.
>

Yes, but the agent(via bootloader) has already requested the SCMI platform,
so it should be fine. No ?

> But in case when kernel is doing some jobs that needs the
> power domain ON, SCMI platform might power down the
> power domain because kernel agent not request that.
>

See my comment/question above.

--
Regards,
Sudeep

