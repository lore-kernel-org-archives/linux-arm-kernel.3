Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D70C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/mZpUlTquvoeG2x+zrnqFQnXFtT8HSXqVWnUe58Y60=; b=F87gF33lVn9BqILsr3CdGunQFU
	2V4f8J0CJxO3n8Y7V+bQ7jhjwDngRzoJGlGv/ubQlf0qPkGZ25V36wTbIvb6KIuptxX+v7LKykb7f
	b2N4Gl1Vicy44L1G5E96cXVl7ZA6Y3durIi/90dp4/7Sh/MAJeHu3G3E+KxohOfz2LNfIxl2NVvKR
	KK+qj7b1dEpmrY7g6oRhZNJB8lpbyOZgNyKwduJmz4/2jwju9iIZR1Q64hE36YUf0E3K1FixN8pUN
	lEHeumSUeqLWPtXOwMF90XWelPL3KsvNdlKnJEyiukS2sj1JEt1V3l4tX+MPqhlo1+m2BUlATDPXn
	50wMiBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW8Q-00000006EWG-1BwY;
	Fri, 21 Feb 2025 16:44:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW63-00000006DnZ-3LFQ;
	Fri, 21 Feb 2025 16:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J/mZpUlTquvoeG2x+zrnqFQnXFtT8HSXqVWnUe58Y60=; b=AVW7CRKItMTdaBtbb4RJBkRHgQ
	kmg8yYIs7xsGbq1MofQi3NcFuX2SPOjKRKVmXWClpTF6b/wuO/2QB4e4HGutzMZKX5l3fNCbbDJKd
	qBLFsDsMkX7DK459lJHwJE7gnYJVnlfGmWO6czWDgq+/cMHkmimXKFX5vS3f4CKpX7LZ2BniG84zZ
	P1qE2GYo5qSeUwx6CY8dTmhSxTPZB9MXDMg1l4BxQ8VHHR8uwjb2qJh01kNaS0zWA254D5/VWp1nE
	oFLAaylk6UGAYL0kxkMDesTdyOSTEMNQxswLwhZ5gtAK9TYlWqvP4ahGhp5e5TdudNpxVqzp3G6dy
	xBO2G4QQ==;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW60-00000002gaK-2wEF;
	Fri, 21 Feb 2025 16:41:50 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-219f8263ae0so51075825ad.0;
        Fri, 21 Feb 2025 08:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156105; x=1740760905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/mZpUlTquvoeG2x+zrnqFQnXFtT8HSXqVWnUe58Y60=;
        b=evDPTXP0OTjhobh1JUYOWEQb7kgZNGC7gHZyBdqWwf3CAXt0KQWMhgTcUnFjMBz8oP
         XbyIqv098ZkO0feV481csV4RrnPTjBbAL1KlKu58NnbR5VX0HCeCjJCXUhcKFvSk9lTw
         woYadQcRgMhwHof1J/xPTau9rDhUnW+tdTsTE37mZ/STJiKpL4sR9o1YYzcAWyBlj1pX
         w0DhSNqMQZ3sRzkecSJ/gc1UihWWAVCvc5xoYW7vlwlqtlHdT1zxE6BtGRoNdsyaLtuW
         qUNuuT0LGqgvZtJEL6uyFJniYjh1nGFw6Bx5Cd2vmXJSlrYM09/Npc1midX6EeozaCJ4
         mY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVREyfQjKB6oFWwsKAgNCI5SMlKcTGYbeXklpgIEFrHDfwawYd2hWY54p3Vwe6tUtd4NAHqdGkCXGn08AsgsnKt@lists.infradead.org, AJvYcCXQ2Qly7WdAieBI91suc715K7mScXoaktXZEStJs9PsAP+3SrxbRweW9jc4p2QBYFjE72TfI08Ll5G1FgcF3GfLlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLo+LvPqtrawd02/X+Xk7OoDGhrDnWEqkyEKRL3mTJbPmpFEd7
	q8vxFX0NS4bWAHgc0LL0/PUNhpNxohRl+lcBX9SbgTMASghDgdj0WlJjLWJ8
X-Gm-Gg: ASbGncvgIHXqzgMZrp6VNjYnjAPC2kKsGGhi2Bl4LPuEvEXw4u9xWp7gOHrPppP4eO/
	h+DRDUGc6TV/bTo7Uf53JKSloT4asAHobO+zba4C8o0gCKb7JpDFZ/xV1TTSIMU0AB6iAWSdJMb
	I07GCmFPwcEzTsKU8Z2wHByyfm3ZJKz+4jgggebpQOE0veQYhBHbndQV0vy2agD8CMGjBdvZaYl
	Yet+K+d7BwBXubjOilkYNrnKQJae6XExzi3QexRRU5eTzLdUUGvmuU0CU40MQDoJnhwWZncWPbp
	U+duFc4XIOqunJm09dN8Ajepv/5HZJttphcHq5RVR0RkhnvJmMdT1dKUhf9A
X-Google-Smtp-Source: AGHT+IGZgFr4e+ti4ywsqozeP9Q/hpPpDceJnTxW596GOTY6Jvj+Hq6k+LvsAwG53T/F0Tm60pwrKw==
X-Received: by 2002:a17:902:d4d2:b0:21f:4b63:d5c3 with SMTP id d9443c01a7336-221a0edbfa5mr55123455ad.12.1740156105171;
        Fri, 21 Feb 2025 08:41:45 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d545d4bcsm138904485ad.144.2025.02.21.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:41:44 -0800 (PST)
Date: Sat, 22 Feb 2025 01:41:43 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 04/11] PCI: brcmstb: Reuse config structure
Message-ID: <20250221164143.GF3753638@rocinante>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-5-svarbanov@suse.de>
 <CANCKTBsm6o9yaSenj-wft+n0uX-HNRjpJjkZaQcn4t474fXtow@mail.gmail.com>
 <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_164148_855957_54A9A571 
X-CRM114-Status: GOOD (  13.34  )
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

> > > Instead of copying fields from pcie_cfg_data structure to
> > > brcm_pcie reference it directly.
[...]
> Sorry for the late notice but I get a compilation error on this commit:
> 
> drivers/pci/controller/pcie-brcmstb.c: In function 'brcm_pcie_turn_off':
> drivers/pci/controller/pcie-brcmstb.c:1492:14: error: 'struct
> brcm_pcie' has no member named 'bridge_sw_init_set'; did you mean
> 'bridge_reset'?
>   ret = pcie->bridge_sw_init_set(pcie, 1);
>               ^~~~~~~~~~~~~~~~~~
>               bridge_reset
> make[5]: *** [scripts/Makefile.build:194:
> drivers/pci/controller/pcie-brcmstb.o] Error 1
> 
> It appears to be fixed with the subsequent commit "PCI: brcmstb: Add
> bcm2712 support".
> 
> Can you please look into this and see if you get the same results?

I applied this series to controller/brcmstb recently. As such, we can fix
the issue directly on the branch, there will be no need to send a new
version.

That said, I can wait for Stanimir to see about a fix or look into this
myself if needed.

The 0-day bot will pick this now, and I expect it to have the same build
issue.

	Krzysztof

