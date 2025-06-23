Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302DDC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvHz1/QrJLUhB+Ur+/5fExR+dVuq4w9+Rq+nxh2ga7k=; b=2/KgXNXO85897aa6rCHEoybhDh
	pc+uw1JZgpSQn40gv0quJ9NBZNeVSylTUjRs37W06xd4pl6ogBrQJqXp0iZsVixYqjYTGOOKl5GGu
	gwYUgUUeR8bMVt1OiJWuCz6X4JbTzst0FVzC/v3zyXWQ2Zd0LP10P6TZfvakQOVa4BoZAwsfq1UAg
	yW0NPxVVqn6tyJLqU1JZyeQXx83riavcaLvCjVkkc6YXwUxg2+ac2dLg2xP7323mA0Js16qF1uisP
	k9G/bsE1up63qd+p+Eu9LKHBTo0AkcmNlkBFXQXRhdGozq88XVhRbyWobKumPEqc2CV4NVgToQFnp
	d+/JPGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlxK-00000003gz3-3sEs;
	Mon, 23 Jun 2025 18:31:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiT2-000000036rn-1PA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E37113E;
	Mon, 23 Jun 2025 07:47:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 946B93F66E;
	Mon, 23 Jun 2025 07:48:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:48:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/2] firmware: arm_scmi: add pm ops for scmi_power_control
Message-ID: <aFlpJV_hXvX_nGqV@pluto>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074816_417335_429C5C64 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Jun 20, 2025 at 11:37:12AM +0800, Peng Fan (OSS) wrote:
> When testing on i.MX95, two consecutive suspend message send to the Linux
> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
> 2nd suspend message).
> 

Hi,

> The ARM SCMI spec does not allow for filtering of which messages an agent
> wants to get on the system power protocol. To i.MX95, as we use mailbox
> to receive message, and the mailbox supports wake up, so linux will also
> get a repeated suspend message. This will cause Linux to wake (and should
> then go back into suspend).
> 
> This patchset is to make the 2nd suspend message could suspend linux
> again.
> 
> So why SCMI fireware couldn't block the 2nd suspend message from being
> sent to Linux agent? Per checking with our SCMI firmware owner:
> The SM(System Manager) does not know exactly when Linux is in suspend.
> There are no handshakes that clearly tell the SM this. The flow should
> be, if in suspend and you send a suspend (or graceful reset/power off)
> it will wake and then do the request action

Shouldn't the suspended-state of the agent be known to the SCNI server
since:

  A. the SCMI/server has somehow requested a suspend itself sending
     previously a SUSPEND SysPower notification (maybe to fulfill a
     Mnagement entity request)

OR

  B. Linux suspended itself by issuing a PSCI_SUSPEND call to EL3 which
     in turn should have notified the SCMI server os such request by
     issuing a SYSTEM_POWER_STATE_SET to the SCMI server

As in 3.4.1

"On application processors, a PSCI implementation. The PSCI implementation
fulfills OSPM calls to SYSTEM_OFF, SYSTEM_SUSPEND, SYSTEM_RESET and
SYSTEM_RESET2 functions. To do so, the PSCI implementation uses the SCMI
protocol to request system power down or reset transitions."


So how can the SCMI server be NOT aware of the current state of the OSPM
and send a second unneeded message ?

Also addressing Chuck reply later in this thread...

...why if the system is suspended, for whatever reason, and receives a
graceful shutdown notification it does NOT wakeup (due to the
notification received) and then shuwdown to fulfill the request just
received ? Is this the bug ? The wakeup-nortificatin is NOT processed
properly by the driver after it has been woke up ? 

Thanks,
Cristian

