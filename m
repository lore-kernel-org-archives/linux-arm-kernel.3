Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E2BC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIhXC3f2I/l0T8TXw3CQTulpCRSDEAWfXGBsU2KaO+o=; b=2DaeiDEcuAwcd1pg71z6q5EMcj
	a0EZl7JRXkfPq2Ln+Rni8N7cmKB21UMN9aZyoMYbbFKitJYJdiioFvJbwloXaNSHfPf2+h7XRAaSe
	9UeiXzj+KQce/gqtx8mp2FgQyQgW1MQ3HzpIkWmILpOEQqiHN4IkbCwtvU0ZHkjYv+cn+I0Estf22
	kBfG9sT9N8BK3qkdmSNOMBAlKZSnYQRm2ebKOvQHSarhoglNM1y30e5xAb0k2kcgduwhWy7MiBdxe
	/4EzRGw3sYXTIC3zIP+q6bft1/0F/oB+ifNslF1kSXGvRtKFdm0cf8v4QD4P4/6tSypGzjbqDMZMl
	LsWbhSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y1p-00000009XkV-0ThT;
	Tue, 08 Sep 2026 15:46:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y1n-00000009XkA-3dzx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bIhXC3f2I/l0T8TXw3CQTulpCRSDEAWfXGBsU2KaO+o=; b=Fk/6N6KYpGiyibNZxehZ59WOKT
	skptOwwThgxCJFVSSmfIm9yxDmRCisQzJPKirzrcZHD3mowrWNgq1YSf1muAtw9PhxWgsnAvk5mcz
	GSJ+IwBRjc/yi+msjW1YVfWxqnDfD6n/B+jU8OG19FViTDdc+rrWtcji0dWFF3kIILy1UU9otEQBq
	LlMIu1YaNFOVSCj9Fz09dcKrnR07DpgDZPatheVe/eyapPk3hCAKjWlWBect40G/HTKAQWU2HFpw7
	f4CY/fHQ/8unDLobrsuevd6+8vwEmrN5ksHEktKo205hDilvvcQw1Y+zHmXYfWz2VVj/cni5NFfHN
	FU0ZApOg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3y1k-000000002ax-428E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:46:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 849441477;
	Tue,  8 Sep 2026 08:46:22 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C6B3F7B4;
	Tue,  8 Sep 2026 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882386; bh=IvMyBCw9IJioS6J+EGV0B1GbzdS6CwLF7mJqOTUcoJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJ9kcp0zqndIF+wF3zB6h8KX0bh94QB6M3GJovCr6LVEJb8ZA0IdX3OenHe/RH799
	 1N11eQhBwZ/1+2mTzkaNmukJ+x6B6wDyDoKQJataY6uTXcHIXz+eTZAX9s92LwgZEa
	 THhoYb/snAXY5BIQRqlk2NT4VBmRjKGj2GimmrTo=
Date: Tue, 8 Sep 2026 16:46:22 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Don't reuse raw xfers with
 async_done still armed
Message-ID: <aqAtziZh1BGCaP9B@pluto>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
 <20260814-scmi-async-done-race-v1-2-335b163d77ee@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-scmi-async-done-race-v1-2-335b163d77ee@rivian.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_164629_171963_2095F3C7 
X-CRM114-Status: GOOD (  17.80  )
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

On Fri, Aug 14, 2026 at 08:15:34PM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
> releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
> does not clear async_done when it hands out a recycled xfer. A concurrent
> transaction can therefore pick up the xfer while it still points at the
> old waiter's completion, so:
> 
>  - a delayed response arriving for the new transaction can be signalled
>    on the old waiter's completion, which may already be re-armed for yet
>    another unrelated transaction, making that transaction's wait return
>    early; and
> 
>  - the old waiter's disarm, which still runs after the xfer has been
>    released, clobbers the arming just installed by the new transaction,
>    so the new waiter times out even if its delayed response arrives.
> 
> Release the waiter first, while the worker still holds a reference on
> the xfer, so that an xfer can never reach the free list still
> armed. Track whether a delayed response is expected in the waiter
> itself instead of peeking at xfer->async_done outside xfer->lock, and
> wait on the waiter's own embedded completion. (The new async flag is
> not strictly needed but it makes the logic easier to reason about)
> 
> Finally, harden scmi_xfer_get() to clear async_done when handing out
> an xfer, so that no future release-ordering change can leak a stale
> arming into a new transaction.
> 
> Fixes: 3c3d818a9317 ("firmware: arm_scmi: Add core raw transmission support")
> Signed-off-by: Roland Dreier <rolanddreier@rivian.com>

Hi,

thanks for this.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

