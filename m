Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31eJ+AWxiGbYg4zWcNeGQWhipTSARDm8us14p739GWk=; b=jDRBL0tslTTvN8GfJf5K7Nk/5Q
	yJv579lCsy+CmTdWkUB/Ub6TvGqlEiB2JFeYETRNcIcTkk+fjsXSogqw2Nqq3wMB0Cde4TinxvOVw
	vnp2gJEY4xDW5J5uyOzGkHo6mCUB2bwGV1HL6+H6eykEkDKK9Jwlvfsc0+Kr7g/uDjzp2tu0L0ScF
	jGQq18JWkqAoVa1/Mblg/jUZ7QseP2veoN7/zmznZR6VuIa6/wcH2DPq5/zm93+y6L4B1KpRFB4/3
	RGxlW9AsKmVIApU4CocB6iyXQ+ldDXXrvAuMczd48UBqkex/QopJ6piupDYa4VnODKpq+uUygwPNG
	rWND1LGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZ5-00000004Eub-0Yp4;
	Tue, 24 Jun 2025 00:31:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgkG-00000002nJA-3D5G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:57:58 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NCvqqj889428;
	Mon, 23 Jun 2025 07:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750683472;
	bh=31eJ+AWxiGbYg4zWcNeGQWhipTSARDm8us14p739GWk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZQh8aRsLTZ/HYz2VBgn6xeYDbBaWGyxFZ+DW2pnNvEuJU+xN3NQc2XRrk02KGFRJH
	 tfX+was6O/v15f66++Jd9mNJsouyAMIfmP6L7W8qMUS5yw9P/A+XUdTDLtRiH2J3mo
	 R6we3XetfvJ4kAUNJjOc90HYbls0wo8xKgb7ScUc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NCvppg3243449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 07:57:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 07:57:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 07:57:51 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NCvoeg4136274;
	Mon, 23 Jun 2025 07:57:51 -0500
Date: Mon, 23 Jun 2025 18:27:50 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Chuck Cannon
	<chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250623125750.kzwndmcf5yo3siao@lcpd911>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_055756_933913_B3F6D84C 
X-CRM114-Status: GOOD (  20.63  )
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

On Jun 20, 2025 at 11:37:14 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When two consecutive suspend message send to the Linux agent, Linux will
> suspend and wake up. The exepcted behaviour should be suspend, wake up

I am first trying to gather more context of the issue at hand here,
Why and who is sending 2 consecutive suspend messages to Linux?

Just quoting the cover letter:

> When testing on i.MX95, two consecutive suspend message send to the Linux
> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> 2nd suspend message).
> 
> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).

When you say mailbox supports wake up you mean the mailbox IP in your
SoC actually gets some sort of wake interrupt that triggers a wakeup?
Is this wakeup sent to the SM then to be processed further and trigger a
linux wakeup?

<or> the mailbox directly wakes up linux, ie. triggers a resume flow but
then you are saying it was an unintentional wakeup so you want to
suspend linux again? This just seems like the wakeup routing is
incorrect and the system is going through a who resume and then suspend
cycle without a good reason?

Why and when in this flow is linux ending up with a duplicate suspend message is
something I still don't follow.

Could you point us to any flow diagrams or software sequences that we
could review?

> and suspend again.
> 
> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).
> 
> In current driver, the state is set back to SCMI_SYSPOWER_IDLE after
> pm_suspend finish, however the workqueue could be scheduled after
> thaw_kernel_threads. So the 2nd suspend will return early with
> "Transition already in progress...ignore", and leave Linux in wakeup
> state.
> 
> So set SCMI_SYSPOWER_IDLE in device resume phase before workqueue
> is scheduled to make the 2nd suspend message could suspend Linux again.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
[...]

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

