Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E6EE77179
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sReBoPT1JSJ1DA3ZC1WbbChZ9fR0cPQ03s/2GbhiFr4=; b=tl4vbGtcwY399QHInPxfvO4/pz
	eMXE7VKjbOZV9YbFvm8CngLOkbNkkFs1+7s+z0qv5H/Rel4ofvncdftmlNiuP+u/0DEWqnBHILxIZ
	LTpiVwN32M5F7tBTXwWKwKjJYYLh+9gZTFDyJZFDPPX/H4PyxCJhP5NP2nNuPcA5W5ibygkUJDgW+
	NsMhXTZlDzJiMchFGwJnA26NGd6HXJKBpYodQYHkJKn7F5pcGN1xKknvt+bMqWX+j526DWknxD0iq
	KxqvELup9OyRG3bQMbKlNLGG1gGRjLPyz+Ec30tmsIIR37OnULm5Kr1Fp/wV1hmLFaN6eiFvo3m6t
	krBAYMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDsq-0000000GYvT-1BHZ;
	Thu, 05 Dec 2024 15:35:16 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDqG-0000000GYD0-42v8;
	Thu, 05 Dec 2024 15:32:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEFFAE0007;
	Thu,  5 Dec 2024 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733412754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sReBoPT1JSJ1DA3ZC1WbbChZ9fR0cPQ03s/2GbhiFr4=;
	b=BxWdMtw3m+YnkiJOTIyp6NWDPWfOSmQBU/jDdKrUhI55GR1DYIc1Y8A2X3REOlx+dEWSCD
	wnK/fWZGVJjO6vz3W2BWQUgp2ktCB9cvIkO0PzNzDPYA4k9aDMD6Q+0ld5bw531AQ5iSQ1
	Ix5riO1K25mRWOu8wCmomoNmD5pFWZ/reWDzycTd9b3M6oXnN7T2Tifhs+sEX1zCuaF5UD
	Ed3g5vJYFRQQkLXoj+QXOm1Xypddh3dqjYXaXprEu4YD8g4JT7wAKEm5gPT0LeQzx7bPGN
	LEgglkTdIpLES2SmsVdk9aBeDQTuoIgsQllstJIqD7pJ0MSYy+rd08wN6eFn+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Pratyush Yadav <pratyush@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and
 then update_cache in write operation
In-Reply-To: <20241119093949.3014-1-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Tue, 19 Nov 2024 17:39:49 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 16:32:32 +0100
Message-ID: <871pymtab3.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073237_311777_B18F4969 
X-CRM114-Status: GOOD (  18.42  )
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

Hello,

On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:

> From: Sky Huang <skylake.huang@mediatek.com>
>
> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com>
> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
> Chuanhong recommmends that we can use the following sequence in
> spinand_write_to_cache_op():
>
> x1 mode:
> 02H(program data load) -> 84H(random program data load) -> 84H ...
>
> x4 mode:
> 32H(program data load x4) -> 34H(random program data load x4) -> 34H ...
>
> 02H or 32H commands will clear cache buffer on SPI-NAND and load
> data to it. For those SPI controllers which can't finish transmission
> in single step, 84H or 34H will be triggered for the rest data.
>
> We observe that some current SPI-NANDs, including FORESEE F35SQA001G and
> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
> using 84H or 34H. Or users may encounter program failure issue. This issue
> is not always reproducible, but it may occur and cause system instability.
>
> This sequence should work on all SPI-NANDs nowadays. I also check with
> Foresee that the sequence can solve the above program failure issue.
>
> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight SPI
> controller which can only transmit 1024 bytes.
>
> The test step is the following:
> - mtd erase /dev/mtd2
> - dd if=3D/dev/zero bs=3D2048 count=3D1 | tr '\0' '\xA5' > output.bin
> - mtd write output.bin /dev/mtd2
>
> Before applying this patch, write operation uses only 34H(update_cache):
> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byt=
e: 0xa5
> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st b=
yte: 0xa5
> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byt=
e: 0xa5
> [78.962966] OP code: 0x10, addr val: 0x300
> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byt=
e: 0xff
> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st b=
yte: 0xff
> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byt=
e: 0xff
> [78.992527] OP code: 0x10, addr val: 0x301
> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byt=
e: 0xff
> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st b=
yte: 0xff
> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byt=
e: 0xff
> [79.019435] OP code: 0x10, addr val: 0x302

I am sorry but above you said that we should not perform:

    0x32, 0x32, 0x32...

because the second time it would clear the cache again. And here
you tell us that actually the core already handles that by performing
instead:

    0x34, 0x34, 0x34...

So what is the problem?

Or maybe I misunderstood the issue, but I think Chuanhong raised an
issue that is already solved? Isn't it?

Thanks,
Miqu=C3=A8l

