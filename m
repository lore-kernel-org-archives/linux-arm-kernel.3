Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hEDL9ZkG;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lbUKFsIu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jSpBDv8YD607sbMHNbPAeaBjk155ellTG9O/QhQRzvg=; b=hEDL9ZkGa0KiSqNqWS1h5z3AMz
	sAjbnX+AOma15pnk43FfZDcyV1aEK5caC82D05KhnjHcE65njxDnM/kJ6MfQ+mtu+VNp1HytmN5zy
	N7stQczCSAYEJhPzKwe2vDvxdbnE6Mc8ownBIvS7emnX2fB+CwXVPNO/15P7poNI7FJjRGchXwIh+
	7Y35K+L6VJeKjiKl95Y+C3VevaFpCW3Wj1FKOBqvDFme0EBNqw5VRn76aQ0TwwTYSXOIRi8KCY6oj
	r3BGO/oMIyfnKvIITjuSGQpHLJBk+dj2YfR5ZzmKqWHjuD3HOZezCUkuxWsM1WZv3s+ji6Y4ux+cx
	RkPpTSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYZ9-000000053Wm-3FAL;
	Wed, 04 Nov 2026 10:50:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYZ7-000000053Vu-3y2E;
	Wed, 04 Nov 2026 10:50:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC0D860DD5;
	Wed,  4 Nov 2026 10:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6751F00A02;
	Wed,  4 Nov 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793789400;
	bh=jSpBDv8YD607sbMHNbPAeaBjk155ellTG9O/QhQRzvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbUKFsIunVUGOZSNi7sWqUHwAzZz4PFAb4KlEAuVuOkIKPbvA60P86o7vO8vQEVPJ
	 vZU3/om6CYPX5NLvN99Zq1RDRI3nc05sOqTWuuTBsop8cqhUkMoUktOJa66QL5gVpQ
	 uHz7ZcOUjgJkNtS8JUaI3060JJzTUqYeqEur+dpY=
Date: Wed, 4 Nov 2026 11:49:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] serial: meson: unregister the UART driver if port
 registration fails
Message-ID: <2026110413-delegate-antitoxic-1264@gregkh>
References: <20261104021501.1468500-1-vulab@iscas.ac.cn>
 <5b741c90-4e57-425e-b3ef-b8d10eac1f33@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b741c90-4e57-425e-b3ef-b8d10eac1f33@kernel.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 08:02:33AM +0100, Jiri Slaby wrote:
> On 04. 11. 26, 3:15, Wentao Liang wrote:
> > meson_uart_probe() registers the shared uart_driver on the first port and
> > relies on meson_uart_remove() to unregister it once the last port is
> > removed.  If uart_add_one_port() fails, probe returns an error, so remove
> > is never called and the driver stays registered, leaking its tty driver
> > and per-port state.
> > 
> > Remember whether this probe registered the driver and unregister it again
> > when adding the port fails.
> > 
> > Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
> > Cc: stable@vger.kernel.org
> > Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> makes sense to me:
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

Nope, this is a bot, I strongly recommend that everyone just add this
address to their email killfile as they never respond and spam out tons
of crap.

thanks,

greg k-h

