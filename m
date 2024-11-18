Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A1D4920B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMNhhf4AJiQlf8seJMUUIANSuBH8/Hc53QQnO/Pwl2s=; b=lAey5ariBQb1l9iTebFkwx5hTG
	8C2LiM+fzKoopOAqYqp2ITHZn3NML3J0NQIwGoehcuqPqmBPtHRwWQ/6PlDijnt3XdWT3N7bWDJuW
	HHC1Yrj+gw7Yt7K+gpO/s4RNRgM9wqX4wxY40Hrta1xGOrfm1YUug87zACraUx2ut50YxDzRM2gKv
	7uG9FgvItNmCZKsHyFdzhAsbEtQRiil9ZjlLW3qQxhZ3VEdKzKtKsnZeHyYmg5JXJieOWbE1P2oyf
	xij7pJBe1ViFsiidO6/3OomVs/2hBRupnweuRKUf44pr7RntQZJK2myS6rn1yNjq0Y5KihDnXdUgo
	uPrzUrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzP9-000000099z8-2zBG;
	Mon, 18 Nov 2024 10:54:51 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzO6-000000099lC-2FCE;
	Mon, 18 Nov 2024 10:53:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 171D4E000A;
	Mon, 18 Nov 2024 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMNhhf4AJiQlf8seJMUUIANSuBH8/Hc53QQnO/Pwl2s=;
	b=lWsTJ83Z7/D+bGIImekxeCyyueE+xJcz98Pb44JXUiEJmRV7QrJZGzx3WJ2lS8lDLS/QXi
	yXY9qgssIyx/qIwEiERDdhJtfJy30kNlyobMcraZR+wbSZNKwUULdpAYtjE22GzWMmJq8A
	WmTNDd5TivV0/xPtYz106JuRfDnuXjMBUdW1gmerJ13Mvh7ogKHSHsVfhBEG+sXJruaOLL
	FymCMg8v+4HxTo5WzpY6QNX93F50/CmK/0fH1+i/9Rw3ruos41ZOE568AFtLtMjuhdYk6U
	US8m0wb7AiJ06zHMUwopSR3MYjzD+BT9MIdWk2jNJntChaFkq0dB0ovUfpvQgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Mika
 Westerberg <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:18 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:53:35 +0100
Message-ID: <87jzd0zuc0.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025346_874357_51D66BE1 
X-CRM114-Status: GOOD (  15.18  )
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

On 20/10/2024 at 21:27:18 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:

> From: "Sky Huang" <skylake.huang@mediatek.com>
>
> Hi, this is Qi-Ze Huang(Sky Huang) from MediaTek. On our router platforms
> chips, we have to quality lots of SPI-NAND devices and are eager for
> a standard so that we don't need to maintain trivial flash ID table
> anymore. I also noticed a talk in 2019 Embedded Linux Conference,
> Memory Technology Devices: what's new, which mentioned "ONFI for
> SPI-NANDs? Maybe, maybe not".
>
> So earlier this year, I proposed a bold idea, CASN page (Common Attributes
> for SPI-NAND). I worked together with top 3 SPI-NAND market share flash
> vendors and other vendors to integrate CASN page on their SPI-NAND devices
> including but not limited to:
> [ESMT]
> F50L1G41LB
> F50L2G41KA
>
> [Etron]
> EM73C044VCF-H
> EM73D044VCO-H
> EM73E044VCE-H
> EM73F044VCA-H
>
> [GigaDevice]
> GD5F1GM7UE
> GD5F1GQ5UEYIG
> GD5F2GM7UE
> GD5F2GQ5UEYIG
> GD5F4GM8UE
> GD5F4GQ6UEYIG
>
> [Macronix (MXIC)]
> MX35LF1GE4ABZ4IG
>
> [Winbond]
> W25N01GV
> W25N01KV
> W25N02KV
> W25N04KV
>
> A document of CASN is hosted on github(https://github.com/mtk-openwrt/
> doc/blob/main/CASN%20Page%20Introduction.pdf) So I'll try to keep it
> simple here.
>
> With CASN page, we don't need to maintain SPI-NAND flash ID table anymore.
> Currently, it's integrated in 3.3V SPI-NANDs of small density and it's not
> JEDEC standard yet. But it should be able to handle 1.8V and can be easily
> integrated by flash vendors.
>
> I believe this idea and implementation have room for improvement. Hope to
> hear you open source community's comments soon.

I think this is a bright initiative. I'd welcome some standardisation on
the discovery indeed.

But to be really useful, I believe this table must be really complete,
otherwise ID's will remain. For instance SDR/DDR modes are not entirely
defined as we already have mixed modes. There is also no information
about what maximum frequencies can be used with each operation. As
another example, there is no read retry information. Nor anything about
the fact that the on-die ECC engine might not be disabled.

Overall I think this is an interesting initiative but I would like it to
be more advanced. Is there a plan on getting this standardized through
eg. a JEDEC spec?

Thanks,
Miqu=C3=A8l

