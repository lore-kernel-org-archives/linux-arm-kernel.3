Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B1EB1076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 21:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2f8R5GEyxkZQIaf64bF4zBHCOUbaQ3TEBtHbXujsVTs=; b=Sb17AFUuQ87PPVGv2LwfK6IxH3
	CcSA0/DLZAs7XAihzxkfu4vyTvlAEDyU5NYxhaJnPqB+Q8oqGEFdUoNyFyy4vXjzrqUzceL65fgdj
	9QcqzV6jdvSNxQkhgxuQkGADQZ3C5JS+B6pyp1nTSSUGSWmfjUg74QjIjMLgkQXcsE9GFcpjdjYJ1
	Le//1iCjL5qXLAsfiaJzR2NBG50ZpMyxQ94KcbAS5X9mV4MjZIh9/a1jaIcgRz5Xsbqdnuto9czPh
	UGMrim6nmqcGjITEodHzgH/F5cypIDF/xVxnduVLnD9YH2l3BlFOHV2SXd2TgvmpKKl5iW7qmTZYh
	NTobM7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04qx-0000000AJD9-3bNh;
	Tue, 10 Mar 2026 21:42:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04qu-0000000AJC5-3dC6;
	Tue, 10 Mar 2026 21:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2f8R5GEyxkZQIaf64bF4zBHCOUbaQ3TEBtHbXujsVTs=; b=HwIp2Gov4Vq8cd4o8z42qkD5qX
	m94Yotc3CL7E1pNYm9Ix9lffgY3gHInitMQayEaOhwQMZcMFc/PgBVjgi2gpyAcEg90EgwigfbEsA
	+C6sb/M7WpXY2IfRQkDu22vPgylEym7pQhl+IyUq2X7g4cgU7nzhax5STJ3biRzAQ9xo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w04qH-00B5j1-QZ; Tue, 10 Mar 2026 22:42:17 +0100
Date: Tue, 10 Mar 2026 22:42:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Message-ID: <02b2587c-c885-48b0-90af-0b8d65a3a593@lunn.ch>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-8-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_144256_932024_13217264 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Mar 11, 2026 at 01:35:13AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
>  2 files changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 8d259820f103..2badf7d1aec4 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c

rtl8723bs is a networking device.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

says:

Low level cleanup constructs (such as __free()) can be used when
building APIs and helpers, especially scoped iterators. However,
direct use of __free() within networking core and drivers is
discouraged.

Please drop this patch.

You might also want to check other subsystems and see if they have
similar policies for these magic operators.

	Andrew

