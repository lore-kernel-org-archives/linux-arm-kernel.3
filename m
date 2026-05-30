Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61738CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFeS5ZghyqtLcvpjiqm8Lf4ksDZz0Ai1X1bJYSK/WDw=; b=hWuA1S+BzMXBCJ/HCZZYxiwSNn
	b7dKUlxhzP48TVQt7pgUIROzVr6QbYOuDzC+i0DgcBV9CLQ/nQJq4czwlCLmE7poTxVWHUmnH/Z5X
	bDY2QmP8U/xlgydP1BctSxlaXrMwvKUMasmgPFIASueC+hDsFomePLdn2cPdBE4dTatGgjBVwK1BL
	L5+NoVLGqF/4iUKx6WraZX9H97BFW9HWrbsIOqxwjQ13VyUA2w8xsGxzDFhxmDLMFkUEgwDn7EaVk
	Nvqk0RTc5P1W/ZHD/vEIHgiwK3BWvq9avc5+zBQ5T/8hYm9eKeK25POMUjXnAOKLy2Zv8XwbB5aya
	RhSBnaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGt1-00000008d2D-0nVO;
	Sat, 30 May 2026 10:25:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGsz-00000008d1p-1Res
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD2624099E;
	Sat, 30 May 2026 10:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C141F00893;
	Sat, 30 May 2026 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780136744;
	bh=cFeS5ZghyqtLcvpjiqm8Lf4ksDZz0Ai1X1bJYSK/WDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TdX7ATjL+JjHILUuCxvkBh0D90EOmmzLV8D/d4Wwvxp1EEdipUcU95CCk0lpoWa0o
	 mdIoV/6qOldP0BT0rASI6N80Fu+bzrCstE0Y3qQRlRhAc58YZfz+6vgfc6kFvOgu5r
	 8/39CUZ6W+KOjOHkP8FZNXMpCEJet/78yKghk6qk=
Date: Sat, 30 May 2026 07:21:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] serial: mxs-auart: fix probe error paths and clock
 handling
Message-ID: <2026053046-bonanza-bobcat-6ed1@gregkh>
References: <20260528230616.186792-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528230616.186792-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_032545_497478_75662192 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, May 28, 2026 at 04:06:16PM -0700, Rosen Penev wrote:
> Sashiko reported three pre-existing bugs in the mxs-auart driver:
> 
> - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
>   prepared/enabled it, leaving register accesses in probe at risk of
>   faulting if the bootloader had gated the clock.
> - The error path and remove function used pdev->id instead of
>   s->port.line to clear the auart_port[] slot.  For DT-probed devices
>   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
>   pointer in the array.

This feels like it should be a different patch, and not burried in this
change, right?

> - The probe error path called iounmap() while the IRQ was still
>   registered. An interrupt during that window would dereference the
>   unmapped membase.
> 
> All of this is a consequence of using mixed devm and non devm. Instead
> of working around these issues, go full devm so that everything can be
> cleaned up properly.

Are you sure that devm and irq code is going to work properly?  That's
always a very tricky code path, was this tested with the hardware to
ensure it still works on teardown correctly?

thanks,

greg k-h

