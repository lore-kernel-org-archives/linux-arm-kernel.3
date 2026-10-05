Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F1ECA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVSC1ZTOX6aznc08Ydm8DeQB4kGL9X8hXgmrk6Xf7+o=; b=0Q9TZhjTL2qYOYe/CKBwv7CchT
	UJLs2lGX4hRsbpj3h7MfjOHHlI1PSmh74wZCUMrRadxUXs1H/IgZA0KhBPMBjlX78E9sEbN+tlXzL
	2khAd4RsxSHn97AY0G543rOXwB5yNqPKvFbS3Y94o1boharoy8oQ1iADQiflKCV+IsBj9SlxQ/wd5
	/KZf+0mRVJFZ/865Z6jLCcpIzD8KGI8PsG2T54lOqJsWjOMhR7qjvgQGuQpTy9BB0UaIkQYSRBFOZ
	RaUaGT8kU1ouXqE/DZS1kT0qIFg9yCUJALm58r9Jo0bWSyg683KxudUiJl4oILgCtrlCzKxTmQYLv
	bq7GmU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDs6i-0000000HKTs-0sKW;
	Mon, 05 Oct 2026 23:28:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDs6h-0000000HKTe-0lwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 23:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A12EA4009E;
	Mon,  5 Oct 2026 23:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1BE1F000FF;
	Mon,  5 Oct 2026 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242910;
	bh=MVSC1ZTOX6aznc08Ydm8DeQB4kGL9X8hXgmrk6Xf7+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Rawk6CKrNQ7BPXHOfP7U9zu00LpDyCdr4+hV8K1MqN49Cbqyz4rmG42RNfewt46It
	 XJ+o/0L3QaffTyiZ6TjkOj86ejOZ9UHQaOVwKOLJqc4wieuHYLSUtFo5kDc1YvUvmX
	 XkkAfLgXvL9JtBsPHEBw6bznkiYuoZtrWHlfLVL7/gcZ/Kafs81ahXakXmzaz3LjnR
	 bX/9A32rzhe6AsZrmYiZTcilq+wbHWevWvN+8ZuE/yvA8LcoyucPlq3V1Pmt3tOk9t
	 +yNGjL/u0CCBBS4hdG5ngIpzmExSDNgzE9d+MAocUc7ZEtH9MR3WIuz7W787mBj7xh
	 QLQwjwDamEQ8Q==
Date: Mon, 5 Oct 2026 16:28:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jisheng Zhang <jszhang@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame
 TX
Message-ID: <20261005162829.74778c7d@kernel.org>
In-Reply-To: <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
References: <20260929121025.20821-1-jszhang@kernel.org>
	<f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 29 Sep 2026 22:29:14 +0200 Andrew Lunn wrote:
> On Tue, Sep 29, 2026 at 08:10:25PM +0800, Jisheng Zhang wrote:
> > stmmac enables TX checksum insertion for XDP frames whenever the queue
> > supports it. XDP frames carry no TX checksum offload request, so this
> > can overwrite a checksum already present in the packet.
> > 
> > Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
> > so that the packet is sent with its checksum fields unchanged.  
> 
> This seems odd to me.
> 
> If the frame contains a checksum, it is either correct, and the
> hardware calculated one will come out the same, not an issue.  Or the
> checksum in the frame is actually wrong, because the frame has got
> mangled by eBPF before sending it out, and you want the hardware to
> calculate the correct value.
> 
> What an i missing?

Oops, missed this before applying. Fair, but also we shouldn't modify
the frame if user didn't ask for it. Perhaps 0 UDP csum is used, or
user is trying to build a testing tool and intentionally send bad csum.
I applied the patch to net-next. It can hurt as much as help, but the
direction seems right. At the very least any AF_XDP app expecting csum
insertion without asking for it would not be portable to other drivers.

