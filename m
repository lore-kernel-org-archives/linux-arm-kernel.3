Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9415CC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1/bjYm7A6ATDBDiHkAvKKXTQPf4WTEwcOm8tVT2vXI=; b=KhPuABx2ID7YeNMfa1kK+Fs5Y0
	rbG8bQ1XZ+GYZEArLDMrgAyEEYN+Q3Zgal6/0YHXVgWBp9QnTPnDua1XNnANFMxCELwz0RMCOgOFB
	VXbMwm3zQ1FD63elU9rV6P8/YUvVzFQphDRa8QE6/bAXiaq2p/BubYTRUBv4/ZVazV0zOOonR8iiS
	V9PeOP2AeXZa48TdKo3meoKO2I0ZArjYv/cMsaSfoDZtqILDP6E5ieUryaazYIM2MU4MxjdcFtYC2
	q0eTVXz4oMce32m+jzPu4YpiLKisKnTLqNr0Kf4mclAhM3ZoHeEsvyZzu1Bg5pUm7k0SO+D1tXUJR
	20Wb9SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K2t-00000007sJ7-1hi4;
	Wed, 23 Sep 2026 10:17:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K2r-00000007sIw-3X4G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:17:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2966E60200;
	Wed, 23 Sep 2026 10:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0671F00893;
	Wed, 23 Sep 2026 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790158664;
	bh=W1/bjYm7A6ATDBDiHkAvKKXTQPf4WTEwcOm8tVT2vXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=r1iBhGpBecKlPSCySHLyLjJpU7CntPKJtM8VsybbGMZ24QDUu4afJPQ2Az8OT2f7v
	 DzYH5Yl6WnRCFebdNIMH+0dSZborKcYhcQxqeWB2nAPK9Ru8YZfAi9vp7bMYJD9c0I
	 gMU+owblHjscDxFcgb2Um6PQPFg+8AfJ3cxELD70=
Date: Wed, 23 Sep 2026 12:17:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown
 and remove
Message-ID: <2026092332-limes-washhouse-44a5@gregkh>
References: <20260819021916.442827-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819021916.442827-1-fanwu01@zju.edu.cn>
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

On Wed, Aug 19, 2026 at 02:19:16AM +0000, Fan Wu wrote:
> The rs485 delay hrtimers trigger_start_tx and trigger_stop_tx are
> embedded in the devm allocated struct imx_port, and their callbacks
> reach the port through container_of() and touch registers under the
> port lock.  Nothing cancels them synchronously: the tx paths only
> call hrtimer_try_to_cancel(), which does not wait for a running
> callback, and the bounded wait in imx_uart_shutdown() can give up,
> force tx_state to OFF, and leave a timer armed.  After
> imx_uart_remove() returns, devm frees the port and a late callback
> dereferences freed memory.
> 
> Cancel both timers at the end of imx_uart_shutdown(), after the port
> lock is dropped and before the clocks are disabled, and again in
> imx_uart_remove() before the devm free: serial core does not call the
> driver shutdown on every path that reaches remove().
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: bd78ecd6056d ("serial: imx: use hrtimers for rs485 delays")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/tty/serial/imx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

How was this tested?

thanks,

greg k-h

