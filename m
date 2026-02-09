Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86371E7E0BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnLHAoRJZStKVitvldth2QKtbNsm/0SoBCuqkKTDn4A=; b=zNggwmzB/tPpbBpkjBiAaqsBjq
	1q520QW4LANyJ4tNTQbjv9CRH8KojgTX/uFL8hbiIlgCWHQoePTLoxklYv8KU1R9ZtMVy7QvdNoya
	L1miWVMa3Nd4Qc4KywVN+sBM8dgeU/BaA2zn82c/f/hDmISZC3Bwfn5uhcVTqWBjTAqolLiBWEC94
	9hvu4uQZToisZKPw4dkdwvNf50OAacVDtE0TSnSbeObV4+CLSfdganYV2Yb3E5IT51e5rU9fcWE7m
	wtC1AX+iCIms1Pr1um+uzkc0/7a6EDxA6d23Y4kj/s2BXywgEpBswKsZvKi37AdGUfp6gB/d3zKYG
	ayIi/glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOS-0000000FiEg-3T4y;
	Mon, 09 Feb 2026 16:45:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOO-0000000FiE2-3I39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:45:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92C2339;
	Mon,  9 Feb 2026 08:45:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542823F63F;
	Mon,  9 Feb 2026 08:45:38 -0800 (PST)
Date: Mon, 9 Feb 2026 16:45:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: Re: [PATCH v2 03/15] firmware: arm_scmi: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <aYoPLzOjPvJbu0Kb@pluto>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_084545_327236_06C887BD 
X-CRM114-Status: GOOD (  17.67  )
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

On Sat, Feb 07, 2026 at 08:01:25PM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().

Hi,

> 
> The mbox_ring_doorbell() explicitly documents not to call
> mbox_client_txdone() for doorbells, so remove the call.
> 
> NOTE: this mailbox client appears to send doorbells and regular
> messages on the same mailbox channel (smbox->chan), so it needs some
> extra attention. Specifically, the new API behaves differently if you
> ring a doorbell while a non-doorbell message is in progress. I don't
> believe that this is something we have to worry about with this
> mailbox client, though, because the code was calling
> mbox_client_txdone() after sending the NULL message. Had a non-mailbox
> message been in progress, that would have marked the in-progress
> message as done instead of marking the NULL message as done.
> 

Yes indeed in the SCMI stack on Linux we use both regular non-doorbell
messaging for cmd/reply exchanges and 'pure' doorbell messaging, where
these latter usually are meant to to signal completion and they are
issued on a distinct channel where NO non-doorbell message is sent
ever: IOW doorbell and non-doorbell do NOT get mixed up in the same
channel...so it should safe...

...having said that, just in case, I tested this series on a JUNO
board using ARM MHU (bidirectional) mailboxes and I have NOT seen any
anomaly.

Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Anyway...Sudeep, who was already in CC, has a couple of mailbox/pcc
related series in flight on the list, so he may want to chime in on
those.

Btw, Thanks for this cleanup !
Now the intent is certainly more explicit and less ambiguous than using
a dummy NULL message to trigger a doorbell.

Thanks,
Cristian

