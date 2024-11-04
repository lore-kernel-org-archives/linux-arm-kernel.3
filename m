Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF56D111BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv8rMTk3N7pFqyJ5F+rYbHLRRYuoS1UjcvDvJw/Onhk=; b=ueRUmQagsxXwAxl1mbFPBzFyMV
	8LSdjEwent9MEKErMV5edldvNi/Thn278OP3y9H0Vn58ZPx0UQ1pJdOBdl+TaoyWQhXdYxrfxzhky
	bjUHvU5/AS7ZJMF5ftHjacpsbA8f+ZfHkqNbTyrGgK3W6BVlrdAl2GygbPB7NTI2MaT7QAnX/Lprz
	8bjBLziUvkCsarj60/1s9SKSdZJH/tLezaZGUmstccJLHTgzfqcTVPFNCc/TCHAoe8kup9DiO+c3t
	xcCdRrSWxf6+JC98dgVz3eC76YaH7miSNv22CUV7Bkw92KfBrRVH0NkZt/ogWeoEBzYQKCG2cwZXH
	pjJmBN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sBU-0000000Cw7w-3nUS;
	Mon, 04 Nov 2024 08:11:37 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s8k-0000000Cvlp-2OkS;
	Mon, 04 Nov 2024 08:08:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0275320004;
	Mon,  4 Nov 2024 08:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730707723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zv8rMTk3N7pFqyJ5F+rYbHLRRYuoS1UjcvDvJw/Onhk=;
	b=SIdWyorjKqnlPI7Gzi6+hxmova0tlKlf/AzdxmIej8e10BPvpHz9k0pmcOiTRH7mBA214H
	yw4Ai9P2CVM0ErItdQLx+D5B8btJqj1D7q2ENmdxMjGMFLicikAe47i4RUceWPmGDlofRv
	foQ5UIcIGXQrmEaHgfN0dAiv+V7RkWAbkOdj6CGW+C0Pyvx7sNMVHzoWVnTLZgIvJwFijo
	+rTYEWtjvgmX1jMOC4c9z9p0RYanCXFEJJg+vGagwzSG5lxqa1hYgxED26UqENW1xgyRm9
	lNq/wMMqiX4U24QFgPQaKPV6Tv13jObGJuNZ+OHC00gRio8n272H9ub0jqOvkg==
Date: Mon, 4 Nov 2024 09:08:39 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 06/12] of: address: Preserve the flags portion on 1:1
 dma-ranges mapping
Message-ID: <20241104090839.5b9b4bdd@bootlin.com>
In-Reply-To: <3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
	<3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_000846_773778_D2F563CF 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Andrea,

On Mon, 28 Oct 2024 15:07:23 +0100
Andrea della Porta <andrea.porta@suse.com> wrote:

> A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
> translations. In this specific case, the current behaviour is to zero out
> the entire specifier so that the translation could be carried on as an
> offset from zero.  This includes address specifier that has flags (e.g.
> PCI ranges).
> Once the flags portion has been zeroed, the translation chain is broken
> since the mapping functions will check the upcoming address specifier
> against mismatching flags, always failing the 1:1 mapping and its entire
> purpose of always succeeding.
> Set to zero only the address portion while passing the flags through.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Tested ok with my LAN966x PCI device.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

