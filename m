Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14FDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdhVXUR+0KpkhVK+tZRcWte10LXPPnzPcT5smFSUy14=; b=n7BB0eTJehfP6S0V0GdDkEFRqE
	Owo2YAQp4ocIxPFu3z/Oeyfcua0V17FYOv/pnDYEn7nQqDYWJ2rQnh0KvMtDBBBxVHw45jd0fUZak
	ge+rOJ01FqADUDtSEF5Hf7HGu/Wjo1J27NDsm+rZb9t86aoP4VkNzJpCcQasXx0sWbRJvNiK0m7p9
	byv+EJtZRUi1qYab9JuORHz6Vk7cO8E/VUkvwAmx5DmS04m4focn+32SZr+6wLSp+8d2B3TsCfZFi
	KBjhkZiYpE4bfvrEVFC/z9OSklqUl4AtHZRSObLnt1XG40KgfnWLkUyWMegp9mp2ywfllMXRcYDvs
	bswA7pMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwq7w-0000000AgN8-2Ywm;
	Wed, 19 Aug 2026 23:55:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwq7t-0000000AgMi-3hOB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 23:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EdhVXUR+0KpkhVK+tZRcWte10LXPPnzPcT5smFSUy14=; b=f4NPHUNeiQyY5Od+U8FLfr0RrN
	ZkKrRm3Frs6Gv99IdtitR9asr1W75yPzvNICjHc1zGx/YVXHov92ps9ANnhIzTMV884k5O6GRdCSV
	UPtDzorDHguWopZR5z5noTkQ6CkbucMzgrg7RhhD6ZYX/7we1wYpL931eLdB2MJiTKH8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwq7O-000gXa-JL; Thu, 20 Aug 2026 01:54:50 +0200
Date: Thu, 20 Aug 2026 01:54:50 +0200
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
Message-ID: <f9daddae-a1c3-4823-a4b0-733775e1ad15@lunn.ch>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_165521_924348_FD99A7A4 
X-CRM114-Status: GOOD (  12.28  )
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

> That raises the question why request_irq() is called on "link up" time,
> while the low level vector allocation takes place during device probing.

If the interface is admin down, the hardware should not be generating
any interrupts. So there is no need to request them.

> At least that seems to be the common pattern. Can someone tell me why
> this is done this way? Shouldn't we call request_irq() at the same time?

If you want to change anything, move the low level vector allocation
into open(). But you need to be careful of EPROBE_DEFER. If the
interrupt controller has not loaded yet, i _guess_ the low level
vector allocation will return EPROBE_DEFER, and the MAC driver will
try to probe again later. If you get EPROBE_DEFER in open(), there is
nothing you can do about it.

	Andrew

