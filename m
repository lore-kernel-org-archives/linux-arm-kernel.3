Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7437BFC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Z4+4ztu56jp219ZTmQ+GCPrjCD1lh2pVH7KvLJdrE=; b=21THYxw+wTPDYvvKQgpBQJu0Ic
	hOf3uLs1IfzY03OsyvhZQW6YUqLVvX/01nTSLfFVt253iCRvjHRUCo9IH9xSpAsu744Ut2rOXGfU+
	q7lUyZWe9ccUBXJYnDKKk8FBkr6IZ8fOd+v+f3dUMpx1xliWpchycv7pou/WVdsufyZWg065qU7c0
	rdHq3xxAa9ofT9iYzqVUYwsK0r0IsP8XB8YXIVAWh/zcUdSsxYVIaqqr2hjh3r3kHLlg8vy0oJt3I
	sf2lMdtZRtgZqdqa8mMV3H5BbxT36sOEx4aqEx9Jcb3JQNjrETA0FpFk0WCoHufcYEJN1dHAtWwWm
	pWbSMGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrT2-00000005DSy-3PJ5;
	Sat, 07 Mar 2026 13:13:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrT1-00000005DSq-2cNr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 13:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3EBC600B0;
	Sat,  7 Mar 2026 13:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC592C19422;
	Sat,  7 Mar 2026 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889194;
	bh=6F3IQUZ9kGrgjLHewcu+TLHHVj6wQ1EtsvruLGle5HI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DL+TkF+P7hIVCgBAAJVaW+Hf3k0bkGuLug81wjF7cM2vt9mo6ra6Wr+Ppq+mhs3Pg
	 dgAp9YFMXSSrlRAoJ9++GahFUiH6Dt5JzhD7oKa2r6w1hEiLgqNpAoUHGwxoMFSooj
	 cFNXwCQFb3br6bqG/qQXRlIZ7rFJkSGLC2/TFLutjacfQn6J4iWa5Uc05A2KEeXehy
	 V91cDfE021KCmWR+1QuTuxekk6uGR/xngjvvCjtjyWdr/WUSkc2q55esMTvvXeoYVJ
	 TrFXNdTdU/YBhuqdkuXF95HOnX277iPImgDBYv8dA+3gVU1PtVwWJ2WJEfxK6adt6b
	 +mONHy6SfoM1A==
Date: Sat, 7 Mar 2026 13:13:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91)
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: no devm for nvmem_cell_get
Message-ID: <20260307131306.4684bfbc@jic23-huawei>
In-Reply-To: <20260304041843.7709-1-rosenp@gmail.com>
References: <20260304041843.7709-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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

On Tue,  3 Mar 2026 20:18:43 -0800
Rosen Penev <rosenp@gmail.com> wrote:

> There is absolutely no reason to pospone cleanup of this post driver
> removal. Just do it immediately.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Applied.

Thanks,

J

