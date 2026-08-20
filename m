Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+6YnfbtFXq+5phCL6kCmC7VMexSnRSAnihIp2uj5mM=; b=tMjHn2lg/b9i8q1iygM9/Bx8oG
	FtciqFZmZmim1DaOFOEZDPB/gPhotnWrhowYgGHWeHkjS66+kPDR3JprCstckSPEyd0mXvqoBJC8U
	G6oPHRJZxdkVwbaNplxKGkEQ/K1Vzc79/PKl03oTUnq/o6pv6f8hMYxjoxRwsAkxgpWnvhx7jfyY4
	IvyMsnuOxGwIm5OoyXyU05wOW9DEJLYL5nPEBSJqHU7GFndIKZwK4TMKUR7ZhxrdEzND9fZkIykU6
	8BpcKTCkDae3qsKBBCQ2MnUwh6fBUvmyOIR6ldcQaNkx7vf+mdkAZP7l1MmX2Sk+79QkC8OC0BNrj
	CixcW+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwqMU-0000000Agq7-3Txt;
	Thu, 20 Aug 2026 00:10:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwqMS-0000000Agpo-3QRq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 00:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h+6YnfbtFXq+5phCL6kCmC7VMexSnRSAnihIp2uj5mM=; b=WMzYWbaJarzzuCbNAvQFy1az0K
	+6KIQJLumJHELEx/vana17eKjjcNti5/SqdDo8XQqP6Aj2jUfArCN6moCuCXhywCtdMak+euoT5l9
	qlyF27dOMFc+pO5cS4hzXMAMSMFuspS1hx/yPZUgCpMhluxm2ZhoDKrS5pXRTBx5YZa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwqMB-000gd3-L2; Thu, 20 Aug 2026 02:10:07 +0200
Date: Thu, 20 Aug 2026 02:10:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 0/3] genirq: Allow drivers to respect userspace IRQ
 affinities
Message-ID: <babe3284-1813-4190-8478-4777a28af13e@lunn.ch>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
 <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_171024_862395_877317E0 
X-CRM114-Status: UNSURE (   9.70  )
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

The problem with using stmmac as an example is that it is very old. It
was added to Linux in 2009. I guess most of the SoCs at that time were
single or dual core. CPU affinity was not something developers thought
about for that class of SoC.

Over time the number of cores has gone up and stmmac has got faster
link speeds. But is the architecture correct? Is the driver following
best practices?

I would suggest you look at more modern MAC drivers and see how they
do CPU affinity, etc. Is there anything which can be learned from them
and implemented in stmmac?

    Andrew

