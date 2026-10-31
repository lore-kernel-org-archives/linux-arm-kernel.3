Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwhfMO6E;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JybzRn8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7+0xxUCm+JAA4R+1UjiixWGXTAcQgz34PoPN0EUYKGI=; b=XwhfMO6E2JA8YwEXGsqy1xCwLg
	Fra0QASAcXJ+Ft3qfbP/8+9+VffY1ITN9r9Y7TShsph2H04kQZnOKEb+Iq5k02O8e4cxWOCgSn0r+
	f/N5K4jgexcViynDeqRiwGqWWwYO+D0qMTSDOYH19gID+LFZafNCtCS9SHrMhUKgbfcw90qnxYMA7
	bdssrwIucrvDxSciiwA/yuon9WpobpwGJnkdHAjSKnqPoMx+bmZgIomzdBQiMbc/jnvh2+6w4wiRE
	+U0VJL3zoDwzrGEQy3wZDxPG6Xz0WKAeZpTriFkY8dpfsDrM1c9VGJFKQap3bFTMUIttyiM8ztg6G
	vDUSzZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4sM-0000000D6Hv-3yji;
	Sat, 31 Oct 2026 08:55:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4sL-0000000D6Hg-1mYN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:55:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8397F600E4;
	Sat, 31 Oct 2026 08:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E2D1F000C1;
	Sat, 31 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793436944;
	bh=7+0xxUCm+JAA4R+1UjiixWGXTAcQgz34PoPN0EUYKGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JybzRn8AU1UtqT7hy6d++pSNxVef0x2zRWQofb9oLd98WIIKWK3ujvqLgOLwPQ++a
	 nWemPKiXZuh7tYupnBNYQX3VxQJe3YBi79jMGjhyqS3gP52w2G9acpyBB35yyPEskz
	 86DcrESvkNy12oG38c30QYod3pVZu90Iy92JEMGM=
Date: Sat, 31 Oct 2026 09:55:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] serial: amba-pl011, imx, fsl_lpuart: ->flush_buffer()
 unmaps the TX DMA buffer before the transfer has stopped
Message-ID: <2026103106-pessimist-brisket-25b7@gregkh>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031005425.3351240-1-samarth.colleges@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 12:54:25AM +0000, Samarth Narang wrote:
> I have compile-tested candidate patches for amba-pl011 and
> fsl_lpuart using this general approach. I can send them for review,
> or adapt them if the maintainers prefer a different synchronization
> strategy.

Please always just send patches, you do not need "permission" to do so.

thanks,

greg k-h

