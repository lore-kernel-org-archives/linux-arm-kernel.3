Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5DD44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JTfVzE7ndYuEakwvhQQZl5z6a3t9taLOo0NBJcHY7E=; b=YHdMvAQeyjkANbebtADxZnBb9A
	frKwNjgO0W8PJU4qk18JA5KcjnP3HKW+Ziw+4HkbqCxCsmNPp7eAt51GFkpO1d/qAHxiOpeJUCCeI
	RDnAVKuweuQ1+O2fMLPRzsOYhjNttk/Rx0eRydo63etVcDpch5e0z8byz1gNDR8Udl1Lu1t1KwRwy
	ZYRridpGzytagt80R4j/lEoI2HNouAdM5eq7BiMd2DGELkkycWE4Yr4nZYdC+nFCOusiXC3MKvd0W
	g1nL9Pwlaz4LUWbH6k70jfz4g3b3aEOLCgHPYtEdvLP3RUSYOgIpZJIBLbKViGwx22PQaLgWqpqGc
	Pmh9snUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hr4-00000003n2S-1nw5;
	Wed, 06 Nov 2024 15:21:58 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hpL-00000003mj8-0Z5z;
	Wed, 06 Nov 2024 15:20:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FA5040007;
	Wed,  6 Nov 2024 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730906404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JTfVzE7ndYuEakwvhQQZl5z6a3t9taLOo0NBJcHY7E=;
	b=p0boApFJ2BQaNnPJoTPYhTIQcDUiL0yp0cf/5Mfg/Lg8eAGgJWouOQxt08pXVChraVKmVE
	yMdCzM4IzDXjH5FTAx4kg6RUbZoHAvWU+RDShCaHkGUs4xFNeR+mP4+jciQnjwUqjdon7c
	zLtPuwOaFgI4bCNn/WV3M+58QoLgoZsIqo8lTMSxKiZtrnuM8r+7Au6TkxSCCS3Fzuz4pB
	dh1d7351wPofXtKRRCjbHFou6KiLG/LIrmMRZg4EIL8ckN2jm/UL1ef/7+aNDRACni7C/x
	dUtT1M+3EIo7zsh0CNeUsCni0XdTx3P2KBEV0ruyonUKRNRap6khEp7xPfzD8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SkyLake Huang (=?utf-8?B?6buD5ZWf5r6k?=) <SkyLake.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  "acelan.kao@canonical.com"
 <acelan.kao@canonical.com>,  "chengminglin@mxic.com.tw"
 <chengminglin@mxic.com.tw>,  "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "daniel@makrotopia.org"
 <daniel@makrotopia.org>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  "richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
In-Reply-To: <e8c1ea093943141b431d8eb3ed3831c50601dfb1.camel@mediatek.com>
	("SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCkiJ3M=?= message of "Mon, 28 Oct
 2024 15:25:59
	+0000")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<e8c1ea093943141b431d8eb3ed3831c50601dfb1.camel@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 06 Nov 2024 16:20:02 +0100
Message-ID: <87ses4jsnx.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_072011_344776_BD4B3196 
X-CRM114-Status: UNSURE (   7.94  )
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


Hello,

On 28/10/2024 at 15:25:59 GMT, SkyLake Huang (=E9=BB=83=E5=95=9F=E6=BE=A4) =
<SkyLake.Huang@mediatek.com> wrote:

> On Sun, 2024-10-20 at 21:27 +0800, Sky Huang wrote:
>> From: "Sky Huang" <skylake.huang@mediatek.com>
>>=20
>> Hi, this is Qi-Ze Huang(Sky Huang) from MediaTek. On our router
>> platforms
>> chips, we have to quality lots of SPI-NAND devices and are eager for
>> a standard so that we don't need to maintain trivial flash ID table
>> anymore. I also noticed a talk in 2019 Embedded Linux Conference,
>> Memory Technology Devices: what's new, which mentioned "ONFI for
>> SPI-NANDs? Maybe, maybe not".
>>=20
>> So earlier this year, I proposed a bold idea, CASN page (Common
>> Attributes
>> for SPI-NAND). I worked together with top 3 SPI-NAND market share
>> flash
>> vendors and other vendors to integrate CASN page on their SPI-NAND
>> devices
>> including but not limited to:
>>=20
> gentle ping

I had a look at it, it is interesting but I have some questions and need
to come back to it. Unfortunately I was a bit busy these days. Sorry for
the delay.

Thanks,
Miqu=C3=A8l

