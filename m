Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92685D690F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=; b=0yJomHTAOIUcYIu16AsRznNZ5M
	MwPB/cvZBSKUIAH79nLVLN3Y6gL/ReBm+kulmNwNbu9wvSM0jA458zAusJVOUTvraEHjhOwmi9zgo
	H7f/w9DpZtxZU2TqRXQtn0kxtsyXiROwsMFi2dFxj9T6RNX9mCP091LYltldsvDJWjrTMwL4MHmKF
	OMvex9Y4vIWYhi86OOU3ZkpYOJ813bperLAYyWrvZqMWGFnmCoZzAmxC+nqMxB0m0MAecIvcxOYUq
	Tiv0d3nQGpVySSDfT39lV5evuM5gUcNcbCSsMKAq6gvRlvSxT2kjWx5TzpyqhZeaUEXFTXkyasmP2
	PBTcU6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGc0W-0000000FHp2-00lf;
	Thu, 28 Nov 2024 10:44:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbzW-0000000FHic-4Br2;
	Thu, 28 Nov 2024 10:43:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732790601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=;
	b=4tOZDNQYKL0+NvxpccStVP+xZdeNpJQWALcz+eLwBE8q/HKPqmfO1vItUcZEVjsS3b7FnC
	SezSM2iPWaHhkAK3MH6I/rX++qP9Q9bg37VDOOvnf2iHEm5mQmnKgX8iJ4xoowq2s3HGhw
	G2OlulGMOon2xHAYp0m0GcP6s+6bCtic/XZ1iL/RdyNmfo0KKg4S04gWzp19ijGzATxX1Z
	gxKSrCqfMrO6lL/1hCNFDPF7uhjSNCZAQJJ0T+N1xxz/whh2eJw8+or0CNTrwoszVUWGyB
	AAvRxgEQemBuntahOZl9sB7QB3GmD+T8/G7LpAobv5P89d4/rG0jVQT6BQBaCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732790601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=;
	b=uR2GKpLqs0Qu7dVUcL5x5mdbnU24CUpxi/okbTdaQYsFjY/Eci0NPixDGyI35r4CFXBbty
	GSlxQ5S9OBoqqxBQ==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
In-Reply-To: <20241127152236.26122-1-farbere@amazon.com>
References: <20241127152236.26122-1-farbere@amazon.com>
Date: Thu, 28 Nov 2024 11:43:20 +0100
Message-ID: <87ldx3y6yf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_024323_175612_7B365F95 
X-CRM114-Status: UNSURE (   9.55  )
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

On Wed, Nov 27 2024 at 15:22, Eliav Farber wrote:

As a related note. The subject line is not really matching what the
patch does. It want's to be split into a core change and one patch per
architecture.

> This patch replaces the direct invocation of the irq_mask() and

git grep 'This patch' Documentation/process/

> irq_disable() hooks with simplified code that leverages the
> irq_disable() kernel infrastructure. This higher-level function checks
> the interrupt's state to prevent redundant operations. Additionally, the
> IRQ_DISABLE_UNLAZY status flag is set to ensure that, for interrupt
> chips lacking an irq_disable callback, the disable operation is handled
> using the lazy approach.

Not that it matters much anymore, but the last sentence does not make
sense:

  Set the UNLAZY flag so disable is handled using the LAZY approach ...

Thanks,

        tglx

