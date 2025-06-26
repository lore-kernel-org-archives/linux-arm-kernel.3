Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCevst89phJc+rqfLYWl5aMv8PcsZci70NS+4NB9M9s=; b=ESJm8A7K8mEv3Pj83ClYgMZaN2
	dihcdOcGb6N4rO8xPVDxuXroBvnTlUxh4tEbbFW+D9TEmwqunfBQnl5m68ZM7ezfeqNMz9WdmCo+x
	kNebcLAamnW+bdWvD1JwdB0Xo+mCjp0AHh/tWIS9Gux2LE5ULzv+CkH+ezY9v6eZ49OtsgWxXU+CM
	O+7MgzIuJStCMO1TKgt7EYZaz4XtejhWpf/bAttA976oLfO1z9tFw4tmaQLP+QBp6s0NFucQOQVmU
	x3dTUtZuTHdV2vnCo20Cs7M3dVg65IWnycNOFN3LIH7eDfTBC5g0REpZD8S20xHW21RZMo9GbE9/w
	eb1KpA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUluz-0000000BZEL-0e42;
	Thu, 26 Jun 2025 12:41:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkvS-0000000BRAn-1GhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:37:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECAB01758;
	Thu, 26 Jun 2025 04:37:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45B633F63F;
	Thu, 26 Jun 2025 04:37:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:37:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <Philip.Radford@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>,
	Cristian Marussi <Cristian.Marussi@arm.com>,
	Luke Parkin <Luke.Parkin@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <aF0xDdajKkoa4dXU@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250620084634.GB27519@nxa18884-linux>
 <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_043754_420788_EF57441A 
X-CRM114-Status: GOOD (  23.95  )
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

On Fri, Jun 20, 2025 at 10:27:52AM +0100, Philip Radford wrote:
> 
> 
> > -----Original Message-----
> > From: Peng Fan <peng.fan@oss.nxp.com>
> > Sent: Friday, June 20, 2025 9:47 AM
> > To: Philip Radford <Philip.Radford@arm.com>
> 
> Hi,
> Thanks for the review.
> 

Hi,

> > Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; arm-
> > scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
> > Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
> > Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and
> > trace
> > 
> > On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
> > >Hi all,
> > >
> > >This series adds a new counter to the Arm SCMI firmware driver to track
> > >the number of in-flight message transfers during debug and trace. This
> > >will be useful for examining behaviour under a large load with regards
> > >to concurrent messages being sent and received. As the counter only gives
> > >a live value, printing the value in trace allows logging of the in-flight
> > >xfers.
> > 
> > Just a general question, is this counter count in flight messages
> > for a scmi instance or it is per transport? I ask because
> > one scmi instance could have multiple mailboxes. If counting based
> > on scmi instance, it may not be that accurate.
> > 

... so that is a good point ...
...thanks Peng for pointing out this first of all...

So, in general all of these counters are per-instance, we don't have any
finer per-channel granularity....we could in the future split them out
to be per-channel counters, but I wonder if it would be worth the
effort: because, as I see it, errors reported by these counters are more
of a alarm-bell than a triage tool, in the sense that I would expect
that seeing a lot of errors of some kind on an instance should just act
as a warning that something is NOT right somewhere, so that you can
investigate further by enabling the already existent and more comprehensive
SCMI trace events to fully inveestigate the problem...since SCMI full event
traces DO also include the used-channel beside a lot of other info about
the xfer transactions.

Moreover, in the specific case of tracking inflight xfers, note that
the counter added in this series tracks the pool of xfers allocated in
tx_minfo(A2P) free-lists (i.e. commands...P2A msgs hardly can be lost),
BUT this structure is per-instance (NOT per-channel), so even if you had
say a few more dedicated per-protocol channels defined on a system,
all the A2P transactions will pick their xfers from the same per-instance
pool... (..because the max_inflights is meant to cap the maximum number
of outstanding transactions that the server has to cope with...)

Thanks,
Cristian

