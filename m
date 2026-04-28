Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DFBFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FFJUWuJo8UWH0tVMp4fDMIt9eUlpWyEGXsfdajhYrQ=; b=BBSR+mm9qXSb/Vv0IIdrlOhzhg
	MlddhP745ETrREN+59MV0N/e/xtq/ipwLW1K3vt8cK30eT2wCxpDWpObYW9IqJIXdTrsJBnbiEXkC
	RdYYqgEXoqs7apPwvXI7NiB6J2F7EjmxJPL4RzcaVUouKx4Mk/ckpnyU8GSc0vh3B7TbUXgiI4yst
	K3uVqkZs6uw74A5mDVXnOKs5SFsQgDE9CtFOm6P8Fxknmr8/STjl0eRxCm052ATVuvbkUb2P+gydd
	N2rOWGS38cFaOYvALEWyjnmtMbADgCOHmg7ynhpXELaJiz3QM19jVS9Wi8lc3Smd1U5brdkW3C+8n
	sbW1QDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHft3-00000001C9G-3DPY;
	Tue, 28 Apr 2026 10:41:53 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHft0-00000001C7Z-2gLs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:41:52 +0000
Date: Tue, 28 Apr 2026 12:41:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777372907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FFJUWuJo8UWH0tVMp4fDMIt9eUlpWyEGXsfdajhYrQ=;
	b=IoniuwUV6zCfw9A0IcTRrRx/lRLMMjurS88bvpyaT9bKeAtqAKMBfJuC32JLHB1lFlWzhp
	hgFCUDnxm7t0NwLDlL1XU3mpA8P1F3yZ8HCzH7I9QIQ8Q8fXSLG44fnwogcGW4dHnKmdJU
	5gC7oomeg/bBQky+gupqHydEb9imIG0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] crypto: atmel-sha204a - fix blocking and
 non-blocking rng logic
Message-ID: <afCO4ncvuormBV2x@linux.dev>
References: <20260426212947.24757-1-l.rubusch@gmail.com>
 <20260426212947.24757-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426212947.24757-2-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_034150_960560_0AAAAC46 
X-CRM114-Status: GOOD (  10.73  )
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

On Sun, Apr 26, 2026 at 09:29:47PM +0000, Lothar Rubusch wrote:
> The blocking and non-blocking paths were failing to provide valid entropy
> due to improper buffer management. Reading the buffer starting from byte 1,
> only fetch the 32 bytes of random data from the return message.
> 
> Tested on an Atmel SHA204A device.
> 
> Before (here for blocking), tests showed repeatedly reading reduced bytes.
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000020
> 
> After, the result will be similar to the following:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
> 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
> 00000020
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Tested on SHA204A hardware using rngtest:

  $ sudo head -c 300000 /dev/hwrng | rngtest -c 100
  rngtest: FIPS 140-2 successes: 100
  rngtest: FIPS 140-2 failures: 0

and verified via hexdump that the byte stream is no longer zero-padded.

Tested-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks,
Thorsten

