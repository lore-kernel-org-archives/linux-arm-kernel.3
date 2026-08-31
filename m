Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD04C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceJ0urgjIvM+xk4P3r/siRK7ffCtzDxlqr54gAHNC3k=; b=o4yYGf6LuOpJ2/DayvuYbkLnAh
	mIfbhHqu6U/H//nnNUV781BqlkjMc0FXoIX42yFIzJ7kwmjRzFIkuz+r7kSYP6Wb1msP4f2L4VnUs
	T10TBDhTNkBNzBXwKVYxhQ5cYT8VfO1Zz4zEzienGUW8DQKA+0kz+ZF5QikUvwzuHap2/pba/mFRb
	nbdhN++XVlNxPzDqUTH3v+YN74RfaFlSUWU4/jY9sn25EGWkkiscULU/OA61sZHpfxJCfdnXMP9JY
	x2Wrn7HIKee86g8J9124URmzD5+aX46tiW/mFa/0ArL83tG+d21CPhNo4BTbHut1CC3lsqdPhlE4l
	bHwwY9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10oM-00000009GcO-2wt5;
	Mon, 31 Aug 2026 12:08:26 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10oK-00000009Gbn-2Ll0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:08:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55126A418E;
	Mon, 31 Aug 2026 14:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1788178101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ceJ0urgjIvM+xk4P3r/siRK7ffCtzDxlqr54gAHNC3k=;
	b=kV/L8QR3myytINkq9yVmoxKTh+Q1iiB1ehv2mLOuNyn6sgVyOXlD2c1thrGR2RxcmUFMmh
	ZgQqWOCZvqK+nxbBttrL8wfBzeT3F5ai5Tl4VhEt1r3MuasSM7DvJfrMrvNYHFDM0E5Qb+
	U1M6Za8xuyrDsyzl6K7B1Y/8+P6BdyQGA7nEUsnJrY/SkLMB/fB3DJVwRVqZapDooRLgHN
	3ARGMlsuzkLSQ2kW76iLsY5tJpqUdl3I2e2AZhGoqDrUgOok5w2VKX0Uc1bkL7ZzjCD5bV
	p4dqgLZV+L0eBZCAnhsbfcuBzywkaHrQVadmEGplH4nhujTOQ9mEZ96cXrvpAQ==
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 14:08:21 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next] net: stmmac: Remove ARP offload code
In-Reply-To: <20260831071351.354255-1-maxime.chevallier@bootlin.com>
References: <20260831071351.354255-1-maxime.chevallier@bootlin.com>
Message-ID: <adff6dc3cc322d52b1c1ba9c3176b433@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_050824_760128_F48FC110 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Maxime

On 31.8.2026 09:13, Maxime Chevallier wrote:
> dwmac can do ARP offloading, where the HW replies to incoming ARP
> requests. This requires multiple steps to work well :
>  - Program the local IP address in a dedicated register
>  - Enable ARP offloading
> 
> This is halfway implemented in stmmac, as it's only ever used by
> selftests, and these selftests are failing on at least 2 platforms :
> stm32mp1, and jh7110.
> 
> There have been some attempts in the past to support this feature, but
> this never made it upstream. Let's just remove the test and that code,
> until someone actually wants that to work. We should likely have a
> proper API for that so that drivers can use it.
> 
> Let's also not mention ARP offload in the stmmac documentation.
> 
> Leave the defines in place and the capability detection, this doesn't
> hurt and gives some information about how the IP is synthesized.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

