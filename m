Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E297606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/r5WD/3;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rUKlc1j3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OzxYqfOe5wWDr5TtA6JkHbhEc949LE7biXmqyPX/UII=; b=Z/r5WD/3FhfUrf
	GnGiGWUxCImzc0LEb/iveKU8290UsW8EjsE3ApSnKf/p7RXJMtXQWC8GLGcXnKqA0F9boK+v84bDS
	ygHB7jD9dBBIn2hkTW1EHuKtddqBm43tOuOrxoxy4fxcXjtqAA4kc2EzlmlUvOnosHxMw5yzhiFoS
	6Q30flXpKgk6666DsFbmsIvBgfh9+jGtfMqIBsdB0udFxOVwLUt+hc3T2aTJdvYtBo5m6gy08/Vt4
	ADAkpWZeVo5ytc1NmQhLeMLUXq/5aOSE90NqPyRJCGIvZW5Per7+e45fYEVnRpapvO5kmOPD8lv7k
	Xy37R6eLRZmM7kuh7xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGsi-0000000Br1G-085R;
	Fri, 06 Nov 2026 10:09:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGsc-0000000Br0E-2Kff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:09:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106100901euoutp018d44bf3d66c9e9ff8ce6c36624f9e974~lbOE_umZ-0763307633euoutp01S
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 10:09:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106100901euoutp018d44bf3d66c9e9ff8ce6c36624f9e974~lbOE_umZ-0763307633euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793959741;
	bh=OzxYqfOe5wWDr5TtA6JkHbhEc949LE7biXmqyPX/UII=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rUKlc1j37YyfGc+HQ/BKO8+uZNtc/axmEYXEiJAe0QD64UvCTpKdbeWGu/8Qr9tfw
	 BG+Y52dLM40scveAFebI8KUIbaz7mcnysg4cFApxGoeNMgjerj1YxTqoHaJ6sbnfRv
	 drpKbTz4wEvEmjpm+jsIZNQU3Vd4O5dcuXoOGvxE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106100900eucas1p267f037803dde62c10657cc3e34ee405e~lbOEu4IHM1522315223eucas1p2j;
	Fri,  6 Nov 2026 10:09:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106100859eusmtip13b5cf4c16eea4ef916d8542234814384~lbODrujOM0555205552eusmtip1w;
	Fri,  6 Nov 2026 10:08:59 +0000 (GMT)
Message-ID: <f1180687-6e4d-4d76-9a09-bb20d3676099@samsung.com>
Date: Fri, 6 Nov 2026 11:08:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/2] tty: serial: samsung: pause the RX DMA channel in
 stop_rx
To: Samarth Narang <samarth.colleges@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261031004217.3340610-2-samarth.colleges@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261106100900eucas1p267f037803dde62c10657cc3e34ee405e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7
X-EPHeader: CA
X-CMS-RootMailID: 20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
	<CGME20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7@eucas1p2.samsung.com>
	<20261031004217.3340610-2-samarth.colleges@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_020908_780495_A0300D95 
X-CRM114-Status: GOOD (  19.76  )
X-Spam-Score: -4.4 (----)
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
> In s3c24xx_serial_stop_rx(), the driver pauses dma->tx_chan before
> reading the residue of the RX transfer on dma->rx_chan to determine how
> many bytes have been received. Since pausing the TX channel does not
> stop RX DMA, additional bytes may arrive before the RX channel is
> terminated, causing them to be omitted from the data passed to the tty.
> This also unnecessarily pauses an active TX transfer, which the driver
> does not subsequently resume.
>
> Pause the RX channel instead, following the existing handling in
> s3c24xx_serial_rx_chars_dma() on the RX timeout path.
>
> Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
> Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

That's a real, long standing issue.

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/tty/serial/samsung_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 4eeef149b..2f6c69bec 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -553,7 +553,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
>  		ourport->rx_enabled = 0;
>  	}
>  	if (dma && dma->rx_chan) {
> -		dmaengine_pause(dma->tx_chan);
> +		dmaengine_pause(dma->rx_chan);
>  		dma_status = dmaengine_tx_status(dma->rx_chan,
>  				dma->rx_cookie, &state);
>  		if (dma_status == DMA_IN_PROGRESS ||

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


