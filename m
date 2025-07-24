Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564C7C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mx5jn+Jiegl36tzFvgMjo5fHV9ciI2B5idbBi5A68c=; b=RC7b7YzTw19CXfPJHtsN5uovQc
	SnAgHK2fkBgbSIJ90F+kj3CLYfxOt4dUzZd0syoRkSLozB0RLIpISY08v81x+bwFUOrW9ZjSjzSKf
	7hbFalibQUGKzlE3ri7bW5JMo6lH9UCNbPfIsNxvPSaekFOmFbwcIPewc40T7n/zP/bwvHy4eE8u9
	pUrwsj84/rb6sg7MDRtHsOrCxogpzCH8apf0+TEP3JlcV3YRkGY9Wzovl/YAjTIz2h2KTMFf7b7iX
	Oynu1tBuO+/IlU9OzQUz27pejb9KrTKtlTky6zlfD1h03r7rcRT/R4cqFFP5H/FBKEUjG3YG6xeJe
	KrFBVycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPk-00000007duL-47CK;
	Thu, 24 Jul 2025 13:55:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewLo-00000007Y4J-1xS7;
	Thu, 24 Jul 2025 13:51:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37E69436D4;
	Thu, 24 Jul 2025 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73387C4CEF5;
	Thu, 24 Jul 2025 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365072;
	bh=a5F5WdeNr+6UL1FTjKLm8yq2/Q45+2nnNzBSMbUAfjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p/rhJZXJPL+hUu5+jASgQUGlnPJUr1Xc29vibLZ8cNKZe01Mj5RN+KYj7LDB+xhJb
	 o/hSi4YULMPs3UbgtcGgxe/YDYUPUE8xO8HC5+Jmd0ahq+2sKqaMEivl3B75n/w2sQ
	 tJaL41C7P/tqlizhqTU9Uq/xra5sXzQCbNBMnnzr+UXC/Uw0f+7ppybFg/Ny7vEvC8
	 iRMRIWOpswAtwWBK926ekJULZhZcKmwdDTC/Sqteu2FiAd0MNEXULYbRqpCM8ANcGX
	 JP0Zv3NVzmYt9jbIeeGkxoajWjxhIStbkfPpciaPsAuweTqnEBCI7LztQrWQ6+Nd9/
	 VQf1lb2KCJLXQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
In-Reply-To: <CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
	<20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
	<mafs01psu89sx.fsf@kernel.org>
	<CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
Date: Thu, 24 Jul 2025 15:51:08 +0200
Message-ID: <mafs0h5z1snn7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065112_543659_98464277 
X-CRM114-Status: GOOD (  32.20  )
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

Hi Alexey,

This email got buried in my inbox somewhere...

On Mon, May 12 2025, Alexey Charkov wrote:

> Hi Pratyush,
>
> On Mon, May 12, 2025 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>>
>> Hi Alexey,
>>
>> On Sat, May 10 2025, Alexey Charkov wrote:
>>
>> > The controller is tailored to SPI NOR flash memory and abstracts away =
all
>> > SPI communications behind a small set of MMIO registers and a physical
>> > memory mapping of the actual chip contents.
>> >
>> > It doesn't expose chip probing functions beyond reading the ID though,=
 so
>> > use lower level chip opcodes via the "programmable command mode" of the
>> > controller and the kernel's SPI NOR framework to avoid hard-coding chip
>> > parameters for each ID the way the vendor kernel does it.
>> >
>> > Currently tested on a WonderMedia WM8950 SoC with a Macronix MX25L4005A
>> > flash chip (APC Rock board), but should work on all VIA/WonderMedia So=
Cs
>> >
>> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
>> > ---
>> >  MAINTAINERS                                  |   1 +
>> >  drivers/mtd/spi-nor/controllers/Kconfig      |  14 +
>> >  drivers/mtd/spi-nor/controllers/Makefile     |   1 +
>> >  drivers/mtd/spi-nor/controllers/wmt-sflash.c | 525 ++++++++++++++++++=
+++++++++
>>
>> Drivers in drivers/mtd/spi-nor/controllers/ are deprecated, and we want
>> to eventually get rid of the API. The expected way is for drivers to use
>> SPI MEM (drivers/spi/spi-mem.c). SPI MEM drivers are usually more
>> general and not tailored specifically to SPI NOR flashes, so it might be
>> a bit tricky to write drivers for specialized hardware with it. But I
>> think the drivers/spi/spi-intel.c driver is written for similar kind of
>> hardware so it should be possible.
>
> Oops. I've had a look at spi-mem, and it seems like it's not a
> particularly fitting abstraction for this controller.
>
> From what I understood, spi-mem primarily expects to be talking SPI
> opcodes to the controller, and for the controller/driver to bring
> their own chip probing routines. This controller on the other hand
> abstracts the opcodes away, and wants someone to tell it what its
> flash chip can do (the controller itself can only get a chip ID in
> "normal" mode, and it needs to somehow know the chip size and
> standard/fast read capability of the chip). So pretty much the
> opposite, huh.

Does it use SFDP to figure out which opcodes to use? Then it feels very
similar to intel-spi. See [0] for example. I know this is fitting a
square peg in a round hole, but if it isn't too painful then it would
make maintenance on SPI NOR end a bit easier.

Mika (+Cc), you did the conversion of intel-spi to SPI MEM. Maybe you
can share how painful/easy the conversion was, and if it ended up being
maintainable?

>
> In the end, I only need something like spi_nor_detect() and can do the
> rest directly on top of the MTD framework without touching any SPI
> opcodes after the detection is done. Is there any other non-deprecated
> framework that can provide something like this? Maybe physmap? It
> looks even older than SPI NOR though :)

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/spi/spi-intel.c#n905

--=20
Regards,
Pratyush Yadav

