Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756ED606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EK3ftC3u;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s1t/319T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iHIRpsBrk5xyL/g4xRptAuMUZFHydbItCujSTfbpTwc=; b=EK3ftC3uOTyPrJ
	s9SQJdmtWKRP578wxNzgmuoMRjVhl/Vq7coIJudlV1Z1LsIhrJ/UCVl8u51pRn378K9jzQnbpDDND
	mPrGJdJgL0Z3SVHyqEEbGXcxUIZUXG6H+uJCqz0GCz6nTSXogcu32lKTg8GnjnPf7ZixN8BPE7BHf
	M5+DNjMYi8MfUGoj9edUZdw8upLDysj57ZCP4j13sG9Ti94Be0t3ae0XsC1AsEwpoWs0N0W4EyNEn
	CnC43D8Ky5OxuZyFfuSVQqzawLQUDhAYwDUNzUCqDzkvJWEt4x+daUezF8eysBqAHoz9xOU6eZwDS
	J9AvHyaKHN4+ycOL0A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHHv-0000000BxFD-0qBc;
	Fri, 06 Nov 2026 10:35:15 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHHl-0000000BxCn-3tpQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:35:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106103502euoutp02b52f448c1cb7ace94522e17798c38fc5~lbkyzAes22836028360euoutp02O
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 10:35:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106103502euoutp02b52f448c1cb7ace94522e17798c38fc5~lbkyzAes22836028360euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793961302;
	bh=iHIRpsBrk5xyL/g4xRptAuMUZFHydbItCujSTfbpTwc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=s1t/319TN6+M32OjuD1p25EnzardJ6fNCvMQ+xzaBY/IK49DBP1fxnbR6lhATlBWZ
	 JkcaoHqaCkw7ewO1SOdH2MMylpD2AHqT1AIolQ4AK0wECXk0WHK3bZkOLuXhOIBwzU
	 xzgb1zRg1VFTqjp98TA/cn7+R2449h3h4USWUMI8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106103501eucas1p273fadcaacfcdf3bcfeb089633e386618~lbkya6AKn2351423514eucas1p2J;
	Fri,  6 Nov 2026 10:35:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106103501eusmtip291fc5a2055a28103ceea956f1076316a~lbkxq94mt1032110321eusmtip2g;
	Fri,  6 Nov 2026 10:35:01 +0000 (GMT)
Message-ID: <3947a409-0e97-4039-a145-12c04e1c380c@samsung.com>
Date: Fri, 6 Nov 2026 11:35:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 2/2] tty: serial: samsung: do not re-arm RX DMA once RX
 has been stopped
To: Samarth Narang <samarth.colleges@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261031004217.3340610-3-samarth.colleges@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261106103501eucas1p273fadcaacfcdf3bcfeb089633e386618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261031004238eucas1p1157df5d88fe44ef0585c93f9d1fd0555
X-EPHeader: CA
X-CMS-RootMailID: 20261031004238eucas1p1157df5d88fe44ef0585c93f9d1fd0555
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
	<CGME20261031004238eucas1p1157df5d88fe44ef0585c93f9d1fd0555@eucas1p1.samsung.com>
	<20261031004217.3340610-3-samarth.colleges@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023507_358092_6279AC60 
X-CRM114-Status: GOOD (  21.15  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31.10.2026 01:42, Samarth Narang wrote:
> s3c24xx_serial_rx_dma_complete() unconditionally submits a new RX
> descriptor after each completion, even when reception has been stopped
> or the port is shutting down. A completion racing with
> s3c24xx_serial_stop_rx() or shutdown may therefore restart DMA after the
> channel has been terminated, potentially allowing it to access the RX
> buffer after s3c24xx_serial_release_dma() has unmapped and freed it.
>
> Only re-arm RX DMA while rx_enabled is set, and clear the flag under the
> port lock during shutdown, since the hangup path can reach
> s3c64xx_serial_shutdown() without calling stop_rx(). Because the
> completion callback also holds the port lock, any descriptor submitted
> before rx_enabled is cleared will be covered by the subsequent channel
> termination.
>
> Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
> Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>


This one requires a bit more work. rx_enabled might be temporarily set to
 0 in s3c24xx_serial_rx_drain_fifo(), when uart_cons_flow_enabled()
returns true, what would result in stopping DMA at all after this patch.

The driver shutdown procedure requires much more checks and fixes, than
such single flag check.


> ---
>  drivers/tty/serial/samsung_tty.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 2f6c69bec..3f2346f4f 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -622,7 +622,8 @@ static void s3c24xx_serial_rx_dma_complete(void *args)
>  		tty_kref_put(tty);
>  	}
>  
> -	s3c64xx_start_rx_dma(ourport);
> +	if (ourport->rx_enabled)
> +		s3c64xx_start_rx_dma(ourport);
>  
>  	uart_port_unlock_irqrestore(port, flags);
>  }
> @@ -1165,10 +1166,13 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
>  static void s3c64xx_serial_shutdown(struct uart_port *port)
>  {
>  	struct s3c24xx_uart_port *ourport = to_ourport(port);
> +	unsigned long flags;
>  
> +	uart_port_lock_irqsave(port, &flags);
>  	ourport->tx_enabled = 0;
>  	ourport->tx_mode = 0;
>  	ourport->rx_enabled = 0;
> +	uart_port_unlock_irqrestore(port, flags);
>  
>  	free_irq(port->irq, ourport);
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


