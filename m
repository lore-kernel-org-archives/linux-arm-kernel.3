Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E504EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=; b=4slNkXU+y2LByAbzjn0SdhiNup
	/H1/I/GNNBc4HBg/BuDteUrzT8R8MvwDeJQB51OcdUqO7Nntbx24z0Fvpo/tQr3jYVj2CbWR4Xkfd
	uijuT3oBQBotbVS9O0UdlPxbbDhdvV2+bm02MhLCRAhGlb7eJQp4bHORrhVrg5NYUraOrcyQZmfVb
	3vbph8tZpQoJ7x1Cl/j04PK01lVHZ4CoOAaxBMxi/ElweylLIVGYLuTrOfB/ecM3l2NyPGee7UZJS
	bliGadBulrD63+CZNb2Gs36pZL7rgL6dYnThNEGl/KMblrPcj1zn/dvgcpgkPwwxdRVdCJdlSEK3H
	XjIBAoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieJg-0000000CJAn-3H8d;
	Thu, 13 Feb 2025 18:52:04 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidWD-0000000C7D3-1Yxv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:00:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso212027466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739469656; x=1740074456; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=;
        b=kGeBbxuye2lShRe27aXSdjD5t4GxK8m+ezsa8bnYAzsqB3nBay+qWuztjFUGTTBXEf
         VISYgbqFxLI5t57vbHgdKi0lfV4Xwu4bG2PRk/Zem9tkF1WhydfM5JSyPEFKSHo76+aC
         eT+ICqA5vk3Gzc7tNXuSVxKizShSWsgvDNrpkapwKblnoH0hs3lbjku7IsAwwUnrj0oS
         UYQ7NDW4V+rCG5cPO4tEcK90CX18y0i6i9vjih7QThBPl3tznN+P20IqTXk3CqbphIyg
         xr5pk9pxq5ku82VTiaBEYpqXWBSdaE13XNlatL3KJh7plg5Bh1rCEHEkjvgRtnJzm6Gt
         XJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469656; x=1740074456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=;
        b=XZvDHnE0ptP0/bHsXt8wXF92a1spn3AGDEYfqM4BA4QdgJqkFYKQom494Z755ZnAry
         JrhW8Nosgpm+wOkt2qk3TrqJW/JFpeaCEuEX8F8EzKe4cPjvgVQorgi86EwBW+J8PqmW
         kuEvhuuCU0VHUfwBFgj2MhLOtgDb5zAUn5C8FvCY3N7m1LkpIx8o+n5Y32GqO0Xxe+92
         0PHD+e1yT2WNgTU4fLH9qM4/juiq5ZdK9TjX4y1zkwjBxtR2acK0wW1IYuhH2q4mlXSe
         nzZ9wZ81zqs2l0Og2Ifk+PCuKP/gW7dhYJBgUx331q/zDXR8Lry+exjQ/iP+9Jy9V0h0
         BQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD4xkvSrnMZS/tn9rorM4qOpDP1navujcjVHasCDvHNtqmIWpN+xgABj9ZqC0Whwo1KuuV4ZaTIP2MFLvuxYqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCx1Ry0FSxe+jhLd90z8hBlyfGNRTxyukz4DO3JjcBt39R8Zv
	bV+t19641BgJGQhS4jAeGGbso8o16GKNeL13RFFQgbD33zNbmUVevSi3HzFkYMh5dCqSHkDzSkz
	jypiuw51PdGgJp6XJ8GjFs8f4bvWciwbdiy4/9Q==
X-Gm-Gg: ASbGnctNd0pA2x4HTSfNnZly9sL0jdptpRW91w/4ECnYlXinW8zWXZuST1e3Z/6jZ2+
	sFfQH3RhsZTmJAE3EIhOAf+eM5eg1MBqg6m8tyynAfhrxn1LF8o/y6HcUzkolWFZMC9fJgu9Yno
	eqPHXptdDSH29inQT2CVcsLqdKw3a1
X-Google-Smtp-Source: AGHT+IEPn1vehWPEneMvy4h+MekCpIWgHCiWfjunKXP/Rg/zGzFsLUQXgBKZUi6VnPclc10evNFU6A3yPAiro3jiL5E=
X-Received: by 2002:a17:906:7807:b0:ab7:6369:83fc with SMTP id
 a640c23a62f3a-ab7f34af3d5mr742379366b.38.1739469655305; Thu, 13 Feb 2025
 10:00:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
 <20250213180733.11999e07@bootlin.com> <CAMEGJJ2FB-wwyOtjjCmPJ-vUDpZaV-8MMXxV13qXnKxYSzt9pw@mail.gmail.com>
 <07b973c1-4e35-440c-9009-85302a455912@lunn.ch>
In-Reply-To: <07b973c1-4e35-440c-9009-85302a455912@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 18:00:44 +0000
X-Gm-Features: AWEUYZk57dt7oMdE7oJWluEUSR6yrcUWkxTlMHydzKGl0ZQ5NYeC-9oOiQGkrQw
Message-ID: <CAMEGJJ3++pZtOEvjAm2zMPVrLxQPtuzBWh4QQzGAt3NWuyyrJQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100057_407071_E74DE2F1 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, 13 Feb 2025 at 17:51, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > etc. The same problem would exist for U-boot. Even though RP1 has a
> > standard XHCI controller
>
> Although it is a standard XHCI controller, i assume it is not a PCIe
> XHCI controller which can just be enumerated as a PCIe device?

There are too many sub-devices in RP1 for them each to get their own
function. Instead, they all share a single function, with DT to
declare them.

Phil

