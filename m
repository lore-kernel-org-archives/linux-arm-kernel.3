Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AC9CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jTRzZld+L3TVjWQHhoQ9AM2EZ0IICu5bCyhuVoUrj8=; b=ShZmmOV9tLrqy0GR2pdWB/xUem
	dB1FedzXY3skTRTREld/qCmsVsxd2vXGYCtsXh28r/ApXKxz5OK5ZC717tJ+07YK9oz1E2WwIL4GQ
	Nr4Tfm7mOYU3N1Rye2tZQzJr9Lim3RAKaOhCYica300nWbF8iV0rNJSNp2IVqp7QMzb6S+x3QgSp4
	YYzGewE/jb7Wue5/NxhkQXQaSP1cQy8ZUbDBOGCZcoas2rBiOleK3pcBWpr21jLUb4v+zbDgOxTb+
	m3GEXC7IgDBoQA80+0psTKaoR4V0bOHhndqmqqDQq5FuTbN0y7+1Zp46oLV0rRyDm/MhJ04ecBCMS
	863NOGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEinX-00000003mcR-0L9E;
	Thu, 08 Oct 2026 07:44:15 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEinT-00000003maN-3nlx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:44:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F233A1418;
	Thu,  8 Oct 2026 09:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791445446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/jTRzZld+L3TVjWQHhoQ9AM2EZ0IICu5bCyhuVoUrj8=;
	b=1/MMmLmALJZD+WS3tBRbEf0yJDQPDUcz7/mfaWcur61dQI7LIViZlr5GoLtWOZ6sex3OS2
	pzKpBgppNv4nMRBwwwYuFN8G4MCI+MKiemvqEEVN4ieWYNB8O6K7AUjQUg60+vKlLNzBch
	rtppaiuhLHO24m2ysY+zpHfQFi/2dn73aei24Vz+oX3828j3BVbXa0gkgMKHLWOfJZ6ci3
	NUxjAnbtoG0fpUEMT4EL+bGYyQ6qXdq5cSM2HYgPzuD+x19kHQNr3uJgB4uUcum4k8IyaR
	9rklWYT3nlKJkfuIFqh3JniUnNP1rvoIcKwrOx6dpgB3gRHlhhMR+llcFk6NeQ==
MIME-Version: 1.0
Date: Thu, 08 Oct 2026 09:44:03 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: James Clark <jjc@jclark.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Miroslav Lichvar <mlichvar@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: ptp: switch to gettimex64()
 interface
In-Reply-To: <20261006103610.98277-1-jjc@jclark.com>
References: <20261006103610.98277-1-jjc@jclark.com>
Message-ID: <573ab838519f1fcfc19b5c03c23aa72f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_004412_690205_C4F0F30D 
X-CRM114-Status: GOOD (  15.14  )
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

Hi James

On 6.10.2026 12:36, James Clark wrote:
> The stmmac PTP support currently implements the gettime64 callback to
> retrieve the hardware clock time. Update the implementation to provide
> the gettimex64 callback instead, adding support for the
> PTP_SYS_OFFSET_EXTENDED ioctl.
> 
> The system clock readings are taken around the read of the nanoseconds
> register in get_systime(), so get_systime() gains a 
> ptp_system_timestamp
> argument. rmb() is used to ensure proper ordering on weakly ordered
> architectures.
> 
> Assisted-by: LLM
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
> Tested on a Radxa ZERO 3E (RK3566, DWMAC 4/5) running net-next.
> Width of the interval between the two system clock readings
> bracketing each PHC read (2000 calls of 25 samples each):
> 
>                                          min      median
> Before patch (PTP_SYS_OFFSET):           875 ns   1167 ns
> After patch (PTP_SYS_OFFSET_EXTENDED):   291 ns    584 ns
> 
> On this board the 24 MHz arch timer counter advances in steps of 7
> (~292 ns), so all intervals are multiples of that.

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c

> [...]

> @@ -191,8 +192,14 @@ static void get_systime(void __iomem *ioaddr, u64 
> *systime)
>  	sec1 = readl_relaxed(ioaddr + PTP_STSR);
>  	do {
>  		sec0 = sec1;
> +		ptp_read_system_prets(sts);
> +		if (sts)
> +			rmb();
>  		/* Get the TSSS value */
>  		ns = readl_relaxed(ioaddr + PTP_STNSR);
> +		if (sts)
> +			rmb();
> +		ptp_read_system_postts(sts);

Additional thought while testing on my stm32mp2:

Would a plain readl() for PTP_STNSR be enough? readl() completes before
a following delay loop, which is the counter read postts does. That 
would
drop both barriers, like igb/ice/bnxt. Fine either way though, macb has
the same rmb() pattern.

Maxime (Chevallier), what do you think?

> [...]

Thanks,
Nicolai

