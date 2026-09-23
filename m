Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB5DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyJ7lQWBiZ0DVtX7VlIuPfDSnL37jlsIFX8jiD1fI54=; b=gFgHXwGgrwgHNSNRMj59IvbnPq
	RATbLKb9ZKGjUMF5QZJVaY8qWvLa03GgIKQU/CnL0476BAIIiJ4bZgJjup9PplwyzEXRPPiPEnH+A
	svB8yn1u9+4yn77m90r7LbnzIhGjXSs8yx1eJ1x8vuCl2tPQrqk9oUA7yczqOLT3IvF7wmQPGPxpu
	X2b1sWeBvj5lsK7A9IQRmZx4QbDW8a2gMuqoWQz0tgbcHszkd/Bq/JDtQp3W+5Y+recxI8r2YpqsC
	up3lr8x4Av0+KNAvY1NWhwfGvRnGhfYS6IZ2/+/qWLRTpZL1gxzLtSz7f+xwnW26GcwlfGwyjJ5Xn
	vbCCigfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RKk-0000000988n-2UhD;
	Wed, 23 Sep 2026 18:04:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RKj-0000000988b-0YAe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF886447A9;
	Wed, 23 Sep 2026 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CD31F00893;
	Wed, 23 Sep 2026 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790186680;
	bh=FyJ7lQWBiZ0DVtX7VlIuPfDSnL37jlsIFX8jiD1fI54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHwimU1Q2B7cYo9wYchamxxZIJ/i4B7Ss7u6n1595FTKDPC29xF0Wx+aAlbvS1SE7
	 LAI52VmqRAL7ilPfk+psJMtyaeP5dC0otAtfclHQgfhnPe9dqHUvw/CK7fVUmSRGNN
	 5IbWn/6rs970qKlOYvbx6t93Z1+Lc3+HHkxiWWkiwNh3eiI2jk1kC9JWLhD0k4GSAG
	 N3zdVDi2uLj12K5WRucW38eT6Xrw+2YgIdZEXX3Or0fthexyKr6Np9omt+8D92H53X
	 VWqTVr0Her1PeZH8uZ4tTiX5o+SgdvZXLnlW/hSLtS7kR4hQfAhR8mKh+uRn4OWX2F
	 kVG+e9yUHvOng==
Date: Wed, 23 Sep 2026 20:04:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
	Wolfram Sang <wsa@kernel.org>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
Message-ID: <arPW6xckt7QMpt7C@zenone.zhora.eu>
References: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
 <20260921-i2c-xiic-v5-1-2fca81e810ea@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-i2c-xiic-v5-1-2fca81e810ea@nexthop.ai>
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

Hi Abdurraham,

On Mon, Sep 21, 2026 at 11:25:36AM -0700, Abdurrahman Hussain wrote:
> xiic_smbus_block_read_setup() recalculates i2c->rx_msg->len based on the
> length byte returned by the device, but historically clobbered the PEC
> byte expectation the SMBus core had baked into msg->len. That dropped
> the PEC byte from the caller's buffer on the normal and chunked
> receive-fifo branches.

...

> Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")

yes, I think the Fixes tag was needed here.

> Cc: stable@vger.kernel.org
> Acked-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

...

> +			/*
> +			 * Undo the setup-time padding before rx_msg is cleared,
> +			 * so the PEC check sees the right byte.
> +			 */
> +			if (i2c->rx_msg && i2c->smbus_actual_len)
> +				i2c->rx_msg->len = i2c->smbus_actual_len;

I think this restore needs to go also in xiic_recv_atomic.

Andi

> +
>  			/* this is the last part of the message */
>  			i2c->rx_msg = NULL;

