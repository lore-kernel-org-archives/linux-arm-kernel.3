Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43693FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzUAxgA9tGRq/PHsmc2325DJDEXjY0bT1l/jFUonhLs=; b=RdBh5qCDL3EjYBitT0W4jIcfny
	cnqraenogUbz/O1LKaHWosNs5yM55B7u96GpdJnVR0smn17IKTFMJA530uSoI5xS+zAvYmX43K3kw
	WiJc2SH27P7RVnxG31q8BII/TuvZhYLXi7G/JcCuJYYIGBqrLGFEFnyVVdbFq0R6mW+4I6sbzY+sz
	lBY6/KaAc2RBu/g/d93vnzamotWZqrEtWZ8lBxsKmlRjaUfn+RI+b/vtsn7KqWT9ore2HgCjiIJEP
	Gy2wFc8CqNQktamth/vOZn5EVdyaTWT6XiBbsyOHmiWFUa0AMOaalMt92UHZyoNypN5iOlW7tw1+F
	nA9Ylg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdg9-0000000EUql-1zdM;
	Sat, 25 Apr 2026 14:08:17 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdg1-0000000EUpt-2QB8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 14:08:15 +0000
Date: Sat, 25 Apr 2026 16:08:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777126085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qzUAxgA9tGRq/PHsmc2325DJDEXjY0bT1l/jFUonhLs=;
	b=C/2OsEMHuzXqmSkoPcUBUmVTlRKrBMNxqwH7xmAmnLw9m1322fDC+yHHJfGL8UBzVSxZXi
	3Zw3Tl+qCMgp3blYNVP4puZ/2ooyBy5mkuZCkQDtUeEZFu3mj+L/neL1Ube6gAXkNje71b
	/vQ47IrYj7awq+6hZw/phyYsADmMXy0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] crypto: atmel-sha204a - fix truncated 32-byte
 blocking read
Message-ID: <aezKwAqWPo0kXHDu@linux.dev>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
 <20260422210936.20095-3-l.rubusch@gmail.com>
 <aezFsF8gLkABZZ1O@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aezFsF8gLkABZZ1O@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_070814_092183_C7E593AA 
X-CRM114-Status: GOOD (  22.86  )
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

On Sat, Apr 25, 2026 at 03:46:30PM +0200, Thorsten Blum wrote:
> Hi Lothar,
> 
> On Wed, Apr 22, 2026 at 09:09:35PM +0000, Lothar Rubusch wrote:
> > The ATSHA204A returns a 35-byte packet consisting of a 1-byte count,
> > 32 bytes of entropy, and a 2-byte CRC. The current blocking read
> > implementation was incorrectly copying data starting from the
> > count byte, leading to offset data and truncated entropy.
> > 
> > Additionally, the chip requires significant execution time to
> > generate random numbers, going by the datasheet. Reading the I2C bus
> > too early results in the chip NACK-ing or returning a partial buffer
> > followed by zeros.
> > 
> > Verification:
> > Tests before showed repeadetly reading only 8 bytes of entropy:
> > $ head -c 32 /dev/hwrng | hexdump -C
> > 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
> > 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 00000020
> > 
> > After this patch applied, the result will be as follows:
> > $ head -c 32 /dev/hwrng | hexdump -C
> > 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
> > 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
> > 00000020
> > 
> > Fix these issues by:
> > Increase cmd.msecs to 30ms to provide sufficient execution time. Then
> > set cmd.rxsize to RANDOM_RSP_SIZE (35 bytes) to capture the entire
> > hardware response. Eventually, correct the memcpy() offset to index 1 of
> > the data buffer to skip the count byte and retrieve exactly 32 bytes of
> > entropy.
> > 
> > Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

[...]

> > -	max = min(sizeof(cmd.data), max);
> > -	memcpy(data, cmd.data, max);
> > +	max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
> > +	memcpy(data, &cmd.data[1], max);

I just noticed that index 1 is already defined as RSP_DATA_IDX in
drivers/crypto/atmel-i2c.h.

> This works and fixes rngtest for me on real hardware.
> 
> min_t() is not strictly necessary here, since the types are compatible
> and min() is sufficient.
> 
> I agree with Ard that patch 2/3 should be a separate patch for easier
> stable backporting.

Thanks,
Thorsten

