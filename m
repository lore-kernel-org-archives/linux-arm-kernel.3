Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8422EE9381D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 05:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl2okSSer0UQJVmm+gu+avWeu7+IMVxq4F8/vWo19rI=; b=bOUoyF90HVD5sulSgAdgU+me+4
	WqK671a/pb1WLJJAB7QTaWGpFFjx0/zDs2QTrGHtBwxgeuBz/x15NW9odQvKOF0ozzrPXMGzH1NKg
	Tvtnpx+XinQyhpTQxKiuYbSla0jzcHEAO8V8BMTSo3jRWgrA8M1gkoDmOWIudn6znJBfK4Oc19Dck
	wSvMzdjmm7w2cdKjsIk88bH1lIKL85cAOfL6eB3vszNrUaZ/ImuLbjfF2EGxisMV1advHQ5vgDFJc
	h7v+U37YIvjV4AcApo3GehNjOBfXTaljqtMlys+gyf6HywHeKSdp9KFSSU2ipGaX3m6VQcGJxIbsZ
	65ow/OSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA9J-0000000F2AC-2YPl;
	Mon, 13 Apr 2026 05:47:53 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA9G-0000000F29K-2zpW;
	Mon, 13 Apr 2026 05:47:52 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2FA4892009C; Mon, 13 Apr 2026 07:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 283D292009B;
	Mon, 13 Apr 2026 06:47:45 +0100 (BST)
Date: Mon, 13 Apr 2026 06:47:45 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Gleixner <tglx@kernel.org>
cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
    Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
    linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
    linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
    linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
    Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
    Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
    Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
    Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
    Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org, 
    "Jason A. Donenfeld" <Jason@zx2c4.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
    linux-arm-kernel@lists.infradead.org, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>, 
    linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
    linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
    linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, 
    linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
    sparclinux@vger.kernel.org
Subject: Re: [patch 28/38] mips: Select ARCH_HAS_RANDOM_ENTROPY
In-Reply-To: <20260410120319.462206386@kernel.org>
Message-ID: <alpine.DEB.2.21.2604130638270.29980@angie.orcam.me.uk>
References: <20260410120044.031381086@kernel.org> <20260410120319.462206386@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_224750_914179_5DD3509D 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, 10 Apr 2026, Thomas Gleixner wrote:

> The only solution for now is to uninline random_get_entropy().  Fix up all
> other dependencies on the content of asm/timex.h in those files which
> really depend on it.

 Oh dear!  I'd yet have to fully evaluate the consequences, but offhand 
this has clearly turned what compiles to a single CPU instruction on the 
vast majority of MIPS platforms into an expensive function call, possibly 
also changing the caller from a leaf to a nested function with all the 
associated execution penalty.  Is there no other way?

 Cf. commit 06947aaaf9bf ("MIPS: Implement random_get_entropy with CP0 
Random").

  Maciej

