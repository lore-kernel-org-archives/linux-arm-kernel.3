Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187AAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOfj9iWnujkJXGCKkSSLRpyruq4aYxWH0TC7ipj0KRA=; b=geRWajH/ZsTDLNKUN2dFI3Qk94
	qKBZfNIJh4cErRA912r0w93Ci/p+9JTRoljKVjIWTk+hJnavbm3DmjwqYxl9gNlf4DXg/21j0NHIK
	PO6n2V7GJmmEvqSBo/wKV34kxK+IHdAKbRP1J3zKJxscfJvu6hwUmJVIprjuuFMpH1wUB4eAUpEAq
	iTBr50a5fedgRRLOG4Cy1aotOotRNUTg987NFyDrigjgqeMmQN/qkY/CXBDKXUL4UIi+44RwYmsHQ
	VDOtTPo3agipOPjqATsqKegKiTQTXhWPzFsqLr10BYPGRP3wX/10MlTdXiGvGv86jVgz8E6TnTRX6
	TYHxsxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMs8-0000000D7e2-3wvN;
	Fri, 21 Aug 2026 10:53:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMs6-0000000D7dU-049p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:53:15 +0000
Date: Fri, 21 Aug 2026 12:53:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787309591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOfj9iWnujkJXGCKkSSLRpyruq4aYxWH0TC7ipj0KRA=;
	b=sm+SplkNZFrICX9Fb0x5cjvPTX1Nl43EIl5/jxIR8+H/Ke9ZRXCd+ZHXX2mFhfFV112VOR
	mIrG9UoLse0L+L/A4T5ZDTAhUY1olw0NBYiKXRCC1yQ6JVHChCsE1QtT3V92ABG3gwAX5B
	sHXuB/ytWthEyT+8WDmPoTsl2Y+mXBFhsA0BfKayGRBy1YP9s7X4mvflbzxC3Xw2KCSrpe
	xjOslBkfF2qeUfsFwTe2EsSUWIHs7gJSNOaP17sDQTVjfiQMvQ0X1DIKbXiREPzhEkgbZG
	5JGdMmYLXwNfEJy6EcfSVX5OcGVmwRXfISpLWyUHmxfQ+o4EaTZ881Wus2MmwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787309591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOfj9iWnujkJXGCKkSSLRpyruq4aYxWH0TC7ipj0KRA=;
	b=4d50prHHZbcMsOnjLv+aq7L6GtmqE62MkA8FN7P6Pd/xcbYtjFbFbWZZ4hi/ZD3dhty1Z/
	ixTUDOIrkQ46E0Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] genirq: Honor existing IRQ affinities when
 setting affinity hints
Message-ID: <20260821105310.ZRK2TO93@linutronix.de>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
 <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-2-3f79a99cadaf@siemens.com>
 <20260820094153.420202f6@kernel.org>
 <11c2d3c4-ea05-46a2-8579-c5aba1bfa204@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11c2d3c4-ea05-46a2-8579-c5aba1bfa204@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035314_203790_45583A82 
X-CRM114-Status: UNSURE (   9.15  )
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

On 2026-08-21 12:38:52 [+0200], Jan Kiszka wrote:
> Fully agree: drivers should not set affinities. They should just express
> desires or additional constraints. The ultimately resulting affinity for
> an IRQ should be the result of the various constraints that kernel and
> userland may express via NUMA placements, isolcpus, some dynamic
> isolation/grouping constraints, or you-name-it.

You might want to look at irq_create_affinity_masks()/
group_cpus_evenly() which attempts to spread irqs evenly across CPUs/
NUMA nodes. This is used by storage is considered a bit by the
isolcpus=managed_irq option.

> I think we need a big picture how things should eventually look like and
> then develop a strategy how to step-wise convert existing code.
> 
> Jan

Sebastian

