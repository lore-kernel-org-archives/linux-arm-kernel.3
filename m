Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62424CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V87oGT85aTQasUZiMJWRE9RqxAPo4aSgAPSUdDURqZQ=; b=Fh8/1HHsbdOKKi3sfItoBnhASa
	Nn/Jz7wyC5WR8QoL5uvoO2AV6HKZeTTYg9R73GCEoDpvzEq4LBAhmRXVitJ1bCrrUZV5G1XgK+dbP
	0/FOxt0j9YXQc8nRV+T6oBjZd/+vexWS0x1CjmGY2si77uTejs0uf3CTT21d9OmPKEjao50uLgEgD
	NsNh8+94p3Cen10eWLdgvdWsZYGMpcSYeoiJvT2h/uQ18dSMBDG2VTeENVblZndN2GNY51DoIRyOG
	hxAcR4hXDH8AAvORB+imQNJnKWo3oHONy0jRI5PMIxRFNl0gHji8boNOA/MLfPCAaUFOAMhly/DM2
	Q9CXyMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbqS-00000003cnO-3HX1;
	Wed, 22 Oct 2025 16:37:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbqQ-00000003clu-0bzz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 16:37:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761151065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V87oGT85aTQasUZiMJWRE9RqxAPo4aSgAPSUdDURqZQ=;
	b=mPRAYTj5Dh5mX2LmMKeKOiWNLWNbqx80YIoWu0l7EoQ32Kfq6IKfmOFNuVWEl4sUCCQSI6
	FfPLpQEkRP1itkSSSCc5OevgONypSd9l+dPPIxDdtquwcPyu7AHvo0L1MAmnBDG7ZbP/vy
	9FRUyHeip4vpfBxyIdPWpbdi4PENYp/lX5rFO0I1YGs4/F1CE4C0pmYxCQJDzv3oxksXLa
	gAAKGHSv1HGEgJSWWMcwNL6fRGTdpmvY9CChW36CMDmmsjN6TbID3MXK9vFwAcOwhULNGF
	L4Hzaxig6uU6knf55KonxnE0Tmcazzn3/WufCXusTrNB4DDwCdPcifNb/GJN0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761151065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V87oGT85aTQasUZiMJWRE9RqxAPo4aSgAPSUdDURqZQ=;
	b=qbLYTF8r3Oq/U+GMSjoIWBCyfCVvQ4zGZBagssYSDLcjHGUUgAQJRgfPHtENijbJuGqtRp
	7gjIWKyrtQEo6qDw==
To: Ryan Chen <ryan_chen@aspeedtech.com>, ryan_chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 jk@codeconstruct.com.au, Kevin Chen <kevin_chen@aspeedtech.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v5 2/3] Irqchip/ast2700-intc: add debugfs support for
 routing/protection display
In-Reply-To: <20251022065507.1152071-3-ryan_chen@aspeedtech.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
 <20251022065507.1152071-3-ryan_chen@aspeedtech.com>
Date: Wed, 22 Oct 2025 18:37:44 +0200
Message-ID: <87h5vqyjs7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_093750_319091_0FBFDBA1 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, Oct 22 2025 at 14:55, Ryan Chen wrote:

The prefix is: irqchip/ast....:

> AST2700 INTC0/INTC1 nodes ("aspeed,ast2700-intc0/1") not only
> include the interrupt controller child node ("aspeed,ast2700-intc-ic"),
> but also provide interrupt routing and register protection features.

Lacks a new line to open a new paragraph.

> Adds debugfs entries for interrupt routing and protection status for

Add

> AST2700 INTC0/INTC1.

But what you are failing to explain is why this is required and
useful. Just adding code because we can is not a real good reason.

Thanks,

        tglx

