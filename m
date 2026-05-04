Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88305FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 06:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvPXfhPPrrSe9RCLLAQLRhQM9+tujCKOeZRWgQqpb1I=; b=ta3SpEn39sbQIq6YcVOqoIj9ra
	Shee37MCIQQ2vznsirgBYyX5SyIq8aGFNZl4c2VgPkwE5WLLntIGuxU31IoAK0FTgUbVwnZcAjLL2
	xopeH+qak5BigEfTtOAQNHjcYXqk9EcKejw0bo/pqVPDeu0Sl4SVa38ClTXLpGJQrZL8Ywp/mcIhn
	FG7lR4gnA2z0jPzzXWp0S+pkTz9aVCcE5VEqlR8q5uC97t6SykIosnDQkW8s90ihYh4/KT2YLk9Qw
	K3ar5Mpsw1hZPKQ+29TrOXFIvdloG4yJZiHlEr5LUgr8O04jpwZypmZSqEz1i8kqV0I4IITJZjwJb
	V08FZZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmjo-0000000CUyk-0Shk;
	Mon, 04 May 2026 06:25:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmjn-0000000CUyP-1hGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 06:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F4C60008;
	Mon,  4 May 2026 06:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAB9C2BCB8;
	Mon,  4 May 2026 06:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777875902;
	bh=HiDQvzsgCp2zqdwpLBizDxSsrpuxti6bbhLVZ0rNJ8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWbAj2kTzrgLolBRrkFHrVZZJWwH6DKoAhK+SvqrmoJ1EAPwa5T+2NrVJBVVmSYjv
	 u/6WPil1WLlPmex3YEJd+4DpyabnFpOdGe/SU5XNsUyJhDKeJxzkR2rNCjCiarAayx
	 X+ffyb4pq7YuMJ9dnCUKDPJ40YaEGce1jPoTKRL8=
Date: Mon, 4 May 2026 08:24:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
	Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	linux-serial@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in
 start_rx_dma
Message-ID: <2026050410-frozen-fondue-5476@gregkh>
References: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
 <20260503194921.3449864-1-shitalkumar.gandhi@cambiumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503194921.3449864-1-shitalkumar.gandhi@cambiumnetworks.com>
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

On Mon, May 04, 2026 at 01:19:21AM +0530, Shitalkumar Gandhi wrote:
> Hi Greg,
> 
> Any update on this? It has Frank's Reviewed-by but I don't see
> it queued in tty-next or tty-testing yet.

What is "this"?  I see no context here :(

