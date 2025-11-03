Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D381BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weTI/pW9maFaAf4ecSp6p8DKVpA0nMs1SjMBlDKsDGE=; b=WM2lVpf8d/o2LqSkuWEXd3fiic
	8deIEqRuYKu6i2qJZEY4dWX7M2ydcDExxdkSloZ2N757m5vsY7R0S9DYJyEkHR1W42fsgy2nZPK9i
	qAySGGLPZ1LKOaVXtbeDfnabRiZsBSQrEDyQyQJl6jRSZ/PgMBzRCVbamr87WX/VnSdKvFmGY4ymP
	e0TgW5QfVlcB908gGx/HJ1a17YPQtGHZvzLFx3KZ+VYTc0kGxNjjHbgG79UZFC66FiBmCYtNx2z2W
	8TySkpYx6rdYgPelK7zU1sG8aLsOWVFt4I2UnfJKEiQaYs3LCQywDtIxrX1BD9i7ZvNaAJYMxJ6py
	IoJgRziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG06j-0000000AXCO-07FR;
	Mon, 03 Nov 2025 19:20:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG06f-0000000AXBh-0GOY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 19:20:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 469204E414CD;
	Mon,  3 Nov 2025 19:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ABA660628;
	Mon,  3 Nov 2025 19:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36B1910B5010E;
	Mon,  3 Nov 2025 20:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762197639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=weTI/pW9maFaAf4ecSp6p8DKVpA0nMs1SjMBlDKsDGE=;
	b=NBaHNTJApPAPsviZWlGZCrZcCYFc7LEQaXaA9TJXnvf78iAR57ai9eyc6t2x4mIUeHvkrM
	fdvSx10HlF0jzM5TZD0l3P3pmZXRA1OZTi84BBYq0ff6MyvLoe0j6/Qrznt2aQXtUFuklS
	vOwfMSc+wx3aIw9kRbLzytHc4CdoKyP2mtMeei7tNXtUCvTTFy32ny7iO7uUbBgmdn6vyB
	s+46T+W12HTgnQY3vVC5XruYxaKOcWzPol5T51K6rDgM3/eg+NO9gybFJYdx9tSg3wBZBQ
	70yylJoBcrEt2pAXVLEEO/iFZ35qdKqdag1lNtf9ipO7UZlltpgOe709TRGNnw==
Date: Mon, 3 Nov 2025 20:20:28 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Manish Chopra <manishc@marvell.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sunil Goutham
 <sgoutham@marvell.com>, Richard Cochran <richardcochran@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/7] net: pch_gbe: convert to use
 ndo_hwtstamp callbacks
Message-ID: <20251103202028.12325f62@kmaincent-XPS-13-7390>
In-Reply-To: <20251103150952.3538205-7-vadim.fedorenko@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
	<20251103150952.3538205-7-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_112045_445389_CEFEA575 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On Mon,  3 Nov 2025 15:09:51 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl command only, but it stores
> configuration in the private data, so it is possible to report it back
> to users. Implement both ndo_hwtstamp_set and ndo_hwtstamp_get
> callbacks. To properly report RX filter type, store it in hwts_rx_en
> instead of using this field as a simple flag. The logic didn't change
> because receive path used this field as boolean flag.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

