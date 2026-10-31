Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC5606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tN52kYu6;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ccbScL4x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vWqfOIwVuRm8zQbmNHs1md0dinWn8EUsLETVtH4KCrg=; b=tN52kYu6Mxrb69SQT9bvkHv1SM
	oyFgffx7cDochGsSfA0L8+GTjg8SfnjK2UVjq0M4cdj0i88R+90gLeXRXlUIsv46XhaICzAN6/vj3
	BrxgEeOBPBtGX/Lj22lvVX1wrX6cxLjMYz0JUJxYPlnptZVZ+KVdzSwh4pFJPw1vMdQLBE0wWMZoD
	TnF0Cvuwk8cN4HlsgZGHp76AganeyIQwbzqb3u/wcWoy5PCwFoHNln8Tbj5eujyxBpTXqH2UXgnEj
	f+zZh42IUuGUtZE9ks9m3u/NPClJ30mtTUcXs4MeYoKMz0wNOFbDcpXfBiaEj6W1x8J1/FEP/4ONh
	je4c5FyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8hR-0000000DLrc-07kV;
	Sat, 31 Oct 2026 13:00:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8hQ-0000000DLr6-0UA5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 13:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5854C600C8;
	Sat, 31 Oct 2026 13:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BDF1F0093A;
	Sat, 31 Oct 2026 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793451642;
	bh=vWqfOIwVuRm8zQbmNHs1md0dinWn8EUsLETVtH4KCrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccbScL4xejEP1z6GQUJYMc8L/9RLYP61ciymo2evxUrSloDYE0oWiMYWEtj3dxc3A
	 hbMxxVRj78EhceZMV4bWej/YpH6KELhSDtSMLFNHsx3FcazF6B5LMjxlLvzqc1Rj43
	 xp+uVPIOk3XctlopNi5Q4OQq4WkXzX1eYJ1eBxkk=
Date: Sat, 31 Oct 2026 14:00:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA
 has stopped
Message-ID: <2026103143-alienate-subduing-50f6@gregkh>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031123749.3783352-1-samarth.colleges@gmail.com>
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

On Sat, Oct 31, 2026 at 12:37:47PM +0000, Samarth Narang wrote:
> This series addresses the DMA buffer lifetime issues in amba-pl011 and
> fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
> the TX buffer before the terminated DMA transfer is guaranteed to have
> stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
> termination is requested.
> 
> Since flush_buffer() runs under the port lock and cannot wait for DMA
> termination, both patches request termination while holding the lock and
> defer unmapping to a work item that first calls dmaengine_synchronize().
> The TX completion callback leaves the cleanup of flushed transfers to
> this work item, while shutdown, and suspend in the case of fsl_lpuart,
> waits for the work to finish before releasing the TX DMA state.
> 
> Both patches have only been compile-tested with arm64 defconfig, the
> relevant drivers enabled, and W=1, with no new warnings. I do not have
> access to PL011 or LPUART hardware with DMA support, so testing by
> someone with suitable hardware would be appreciated.
> 
> The imx driver also needs a fix for the issue reported in the same
> thread, but requires a different approach because its TX completion
> callback unmaps the scatterlist unconditionally. I will send that patch
> separately.

Again, these need to be tested on real hardware.  Not to mention the
bugs that sashiko just found in the changes as well.

thanks,

greg k-h

