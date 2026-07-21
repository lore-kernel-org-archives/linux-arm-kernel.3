Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435E5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSlszexi+cEM8kGfB5WHNipqu9NcpDMS+oNBnIW+H3Y=; b=RG4UVp8oEMcxEqvSbriCkSirZJ
	iwKA/HrJ2n9ohTVOiikjhFyuKbsTU6PiS4tgK92NHjMWlrNfF+G2njKcPQ5uVinlL+Qyo53bU4mR9
	Kk8VHO5b0VanDp5WdX3wlxUNCJE1CflBoHQudChRQGQZ9ItGlKL+sRtbRBtrZczmqMxWEsBTQZqnQ
	voZO6/g9b5HANyZhpuyt+7tfrRxHHVMtsoO+2xJzh4ZUVfoe/HbS/z1bRBV4yjVG6rzu3xPX39Wyw
	VqUEzBv7kdoYMitAfQS8sPPxXsu3J7m5EQ319LaBH9WJIU1wkTVI+qhQMXHa+c7fU5duD8F8D2YPX
	jZZsNM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6SO-00000008vIG-03tl;
	Tue, 21 Jul 2026 09:08:08 +0000
Received: from mailout1.hostsharing.net ([2a01:37:1000::53df:5fcc:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6SK-00000008vGw-3Uat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:08:07 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 2836B2402;
	Tue, 21 Jul 2026 11:00:46 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 12215614B893; Tue, 21 Jul 2026 11:00:46 +0200 (CEST)
Date: Tue, 21 Jul 2026 11:00:46 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <al81PmK1UMr2g8p-@wunner.de>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-6-fourdollars@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_020805_031401_C8165148 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:
> On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
> 00:15.4 suffers from hardware DMA handshake failures and interrupt
> routing bugs, causing keyboard/touchpad transactions to fail when
> DMA is enabled.
[...]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=108331

In the bugzilla comments, Leif Liddy writes:

   "I needed to modify drivers/dma/dw/pci.c to assign the DMA controller
    irq value to 21 (which is what is listed in the ACPI table) for it
    to work. The DMA controller was being assigned an irq value of 20
    for some reason."

It would seem better to fix up the incorrect interrupt number in a quirk,
rather than disabling DMA wholesale.

Thanks,

Lukas

