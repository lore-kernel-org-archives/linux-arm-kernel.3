Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4C8C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwFKem25jPLbi0FnobUY4I0Lb6q/2qublswJ1+f6cnU=; b=y04rG/LKj0JjdkjVygLgp+GwNt
	hqTFcsu6ALDc6lr5Dv7nO+J0nkcmVm72kcb91wcg6Um6/PkEOlLHJqRduILX0xjcpm/UA/DMH6SbT
	TBVapmeYmoLU2/coSezoe90yx70aDQhsjN52tVCcKYWMZ4W2KlC9GGd04EcHs/PVxOkJwVukVOCaK
	R/yXp+1R8o7ZSuctWp9okeLqktVEABuyxrkV/zHt10A6klnLZovhgvYj6z0QF3dQa3EJTdey6sw8x
	r3ieDtWKv5nibmhLmvIy5b7Kkbk8m67L+QFaSdah1X+W1s7Wa+1jZlY2zSLRJ7l0ZT8e0AJMX5wDZ
	rOoCBQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQ3P-00000008cO8-0O24;
	Tue, 18 Aug 2026 20:04:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQ3N-00000008cNz-278l;
	Tue, 18 Aug 2026 20:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C875601DE;
	Tue, 18 Aug 2026 20:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC76B1F000E9;
	Tue, 18 Aug 2026 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787083496;
	bh=AwFKem25jPLbi0FnobUY4I0Lb6q/2qublswJ1+f6cnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G1ZeXXtTQ8sP8J9K/DZmijyLMFomaYurLvILJCYkou0Cm7fdt84XPYkC4qni+vXkd
	 cwk+SXH/4hf7qXwbRktzvKmPPmP0cd6IOd/7rLLn0yguW/bPoIrGyYh67PH+FMoGWb
	 u4+lWhiXDrqL+Vt3XqzivyH7ylfBbXQ9GIwqJrXir650IWkHvpB/4rZKPjOlPELTnI
	 4A97/qhzMQ0sm4seLr7M4oiE+t/NVKk8c9c34XLk/bxFJPz3oF7jioKUIVhovLu7eY
	 UBUCCbCPEnnenTYCuxcjx6POIRrOqGF5Cvoc8nONFqfsLORYO/CK7Vhk/hQJT0YIqN
	 8F0pu9C8Bi5/w==
Date: Tue, 18 Aug 2026 20:04:54 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Dawid Olesinski <dawidro@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic
 offloader
Message-ID: <20260818200454.GA2718123@google.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <DKF8V3IHKTL2.1PUA8O5IVIRYC@cknow-tech.com>
 <20260818185810.GA7030@quark>
 <DKSBIH29Z9DE.1OR442P0XUSCS@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKSBIH29Z9DE.1OR442P0XUSCS@cknow-tech.com>
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

On Tue, Aug 18, 2026 at 09:31:17PM +0200, Diederik de Haas wrote:
> On Tue Aug 18, 2026 at 8:58 PM CEST, Eric Biggers wrote:
> > On Mon, Aug 03, 2026 at 12:42:03PM +0200, Diederik de Haas wrote:
> >> crypto-rk3566-test-no-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/bb5dbfd59f244a6422b965b30f9796ebbfdb1fcb
> >> crypto-rk3566-test-with-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/ea72297678e19cbbc987de9548f9884382e1d1cc
> >> crypto-rk3568-test-no-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/309e519e6b1c31f4c1c5bcb1ea16cc8569a54830
> >> crypto-rk3568-test-with-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/1e1e938ebbbae75128974fe0a7c240843bce04c8
> >> crypto-rk3588-test-no-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/9a2adc2b2e42131445ce4576589e00ecf51ccb4b
> >> crypto-rk3588-test-with-crypto-module-log.txt:
> >> https://paste.sr.ht/~diederik/e04c11c8809031ca45662f7d4c227c1ba6162b65
> >
> > Thanks for running some benchmarks!
> >
> > Looking at your results for rk3566 for example, SHA-256 on 4096-byte
> > blocks is 115 cycles/operation for sha256-lib (i.e. ARMv8 CE) or 3027
> > cycles/operation for rk2-sha256.  So the Rockchip driver is 26 times
> > slower than simply using the existing well-tested CPU-based code.
> 
> I shared the results because:
> 1) I figured it might be useful to have these numbers
> 2) I didn't know how to interpret the results.
> 
> Because a lower cycles/operations would IMO *logically* be better and
> your response above seems to confirm that.
> 
> Which makes the following results a 'bit' concerning?
> ``modprobe tcrypt mode=404``
> 
> [255753.686837] tcrypt: testing speed of async sha256 (sha256-lib)
> [255753.686841] tcrypt: test  0 (   16 byte blocks,   16 bytes per update,   1 updates):    703 cycles/operation,   43 cycles/byte
> [255753.686848] tcrypt: test  1 (   64 byte blocks,   16 bytes per update,   4 updates):   1101 cycles/operation,   17 cycles/byte
> [255753.686856] tcrypt: test  2 (   64 byte blocks,   64 bytes per update,   1 updates):    869 cycles/operation,   13 cycles/byte
> [255753.686861] tcrypt: test  3 (  256 byte blocks,   16 bytes per update,  16 updates):   1676 cycles/operation,    6 cycles/byte
> [255753.686871] tcrypt: test  4 (  256 byte blocks,   64 bytes per update,   4 updates):   1059 cycles/operation,    4 cycles/byte
> [255753.686877] tcrypt: test  5 (  256 byte blocks,  256 bytes per update,   1 updates):   1249 cycles/operation,    4 cycles/byte
> [255753.686884] tcrypt: test  6 ( 1024 byte blocks,   16 bytes per update,  64 updates):   4156 cycles/operation,    4 cycles/byte
> [255753.686904] tcrypt: test  7 ( 1024 byte blocks,  256 bytes per update,   4 updates):   1054 cycles/operation,    1 cycles/byte
> [255753.686911] tcrypt: test  8 ( 1024 byte blocks, 1024 bytes per update,   1 updates):   2826 cycles/operation,    2 cycles/byte
> [255753.686923] tcrypt: test  9 ( 2048 byte blocks,   16 bytes per update, 128 updates):   7438 cycles/operation,    3 cycles/byte
> [255753.686957] tcrypt: test 10 ( 2048 byte blocks,  256 bytes per update,   8 updates):   1263 cycles/operation,    0 cycles/byte
> [255753.686966] tcrypt: test 11 ( 2048 byte blocks, 1024 bytes per update,   2 updates):    940 cycles/operation,    0 cycles/byte
> [255753.686973] tcrypt: test 12 ( 2048 byte blocks, 2048 bytes per update,   1 updates):   4887 cycles/operation,    2 cycles/byte
> [255753.686991] tcrypt: test 13 ( 4096 byte blocks,   16 bytes per update, 256 updates):  14017 cycles/operation,    3 cycles/byte
> [255753.687054] tcrypt: test 14 ( 4096 byte blocks,  256 bytes per update,  16 updates):   1681 cycles/operation,    0 cycles/byte
> [255753.687065] tcrypt: test 15 ( 4096 byte blocks, 1024 bytes per update,   4 updates):   1059 cycles/operation,    0 cycles/byte
> [255753.687074] tcrypt: test 16 ( 4096 byte blocks, 4096 bytes per update,   1 updates):   9044 cycles/operation,    2 cycles/byte
> [255753.687105] tcrypt: test 17 ( 8192 byte blocks,   16 bytes per update, 512 updates):  27155 cycles/operation,    3 cycles/byte
> [255753.687224] tcrypt: test 18 ( 8192 byte blocks,  256 bytes per update,  32 updates):   2489 cycles/operation,    0 cycles/byte
> [255753.687241] tcrypt: test 19 ( 8192 byte blocks, 1024 bytes per update,   8 updates):   1268 cycles/operation,    0 cycles/byte
> [255753.687253] tcrypt: test 20 ( 8192 byte blocks, 4096 bytes per update,   2 updates):    959 cycles/operation,    0 cycles/byte
> [255753.687263] tcrypt: test 21 ( 8192 byte blocks, 8192 bytes per update,   1 updates):  17812 cycles/operation,    2 cycles/byte
> 
> This is on my AMD Ryzen 7 5800X which I would've expected to blow
> a simple RK3566 SBC out of the water ... :-/

tcrypt.c reports cycle counts from get_cycles(), which has an
architecture-dependent meaning.  On x86_64 it is something approximating
the CPU cycles (3-5 GHz) whereas on arm64 it is the ARM Generic Timer
which tends to be around 24 MHz or so, over 100 times slower than the
actual CPU.  So 9044 vs 115 "cycles" for x86_64 vs arm64 sounds about
expected, and they suggest the real times are likely similar but
slightly faster on x86_64 as expected.

This sort of thing is why benchmarks usually should measure real time.
The legacy module tcrypt.c unfortunately uses get_cycles() instead.

> > Don't you love "accelerators" that make things 26 times slower?
> >
> > I guess we'll get the usual argument that this driver is really just for
> > "testing" or whatever.
> 
> Or someone spend a significant time implementing it trying to improve and
> extend SoC support in good faith, but without your insight. 
> Which is 'coincidentally' the exact reason why I suggested the patch series
> author to explicitly put you in To or CC.
> I would not have used "pushing the driver as a checkbox feature" as argument.
> Especially since, apparently, the numbers show it performs poorly.

Well, hopefully that's the case and people actually care about reality
for this one.  The other drivers in drivers/crypto/ have the same
problem but they are pushed anyway, so the track record isn't great.

- Eric

