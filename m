Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B0D767CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVUmTxmFHTbxuLXdUJhPx7kX3ILoUiW3IeTmfpkoY6o=; b=DNphh43K3JAR8q0j6u6lrxo/bj
	5QgEo1Ksk8bt1UHLGNazot5/BiHYhFozX3mshRlErTshsIk44O46DkIhEhX9g7iysraYEm8tkA+fr
	odSMJerU1hG4UaEMAQ5Vj4u10EsDEN7X7Ih9hbs//+D0LvoyOKe8rMI/Gd5+J5Z5Q1c5PB2l3KyZW
	NFlD/mv2l3fCg7tjzOHLs+Z3WBXuAXdIZKT1QwOHWcPSJw5/7Emd42vTN6jKl8aTolyAy6hOAmueK
	pF0jAxHd9//mTAsm2t1nEPJAkGJQQCT70lrHAIDTrLn4Y/33BNyuU65Prb8ay/sdN7YiMS+d5gVhE
	fMbqZLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W3J-00000003n4M-1sxJ;
	Thu, 31 Oct 2024 14:21:33 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W1c-00000003med-1h0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:19:50 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5cb615671acso619989a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730384386; x=1730989186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVUmTxmFHTbxuLXdUJhPx7kX3ILoUiW3IeTmfpkoY6o=;
        b=dr9kO0QlWVn+enBj+tvz55tggh7mmkwMrcJLF5M/hMiOInZFzMmSKWkyXmtSeXHaRQ
         XT4Qc5ROUp/oEJwA/xn+ob9VYI8VmgoMGhpLvav8kWAwRMngH7pHFzACXVqRQ17JMXL3
         uAo6ZSgOSBSzLz7cN5gbUX/fOYTnmvyJlEq5gvkZjWZv7srz1dOfg3/Remh6coHZ948B
         IUYi+8xYuvzBS+0vy9/HAWZzn6VOxAheTdfVLJeL7+t3I3dKkwiSSciHUw3XgF3zUN6b
         fuTP5I/s87JwoEfT+vPwf8qoUFztdgZkpGcZ8hMQm0xZkVGzxhBFnfbospeWyc3qFBa/
         yGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384386; x=1730989186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVUmTxmFHTbxuLXdUJhPx7kX3ILoUiW3IeTmfpkoY6o=;
        b=ZyRMq7tsTlhPEZnveeE7OYvwG7SyFEObtW5aiugz/4iTAnBSEXDGYXgkj+SpwFdWI1
         84yBuyavh9rM58W96pDF0FKIpSvyfEj2htk/ONH/g2ayhNQOSQdSilZUFyzpcw4EAWoY
         IpgB6pdvm3LaZ8an6H4qlXKTTFsKNxWMXD6CY4WC5t/eIjh/ejxi5AJd30TRV/amzt0Y
         1u6FWc4VamuwWPW0naCquHTYCukxUyBi8ER2hltCuzrrdZjHigkv1ppsPbjCVLk1s9aZ
         U4jmHn8A4KBqrsdfyTD4ENwnSGzUS9h4mqcpwLGcrNtyNt9Prky0E5YZDQErwcVBJ5uM
         lUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi8rDobBjzlxIagVyg0HQb28dI9O8YZULPjj2xEdokKM9h37GcMF/+mmBflReTdt8ktqxmQ8TuRDS4ItRliW8O@lists.infradead.org
X-Gm-Message-State: AOJu0YxDtRo0l1YuVgjIu7U4jyJq+UKP4Z4c1MtuoN9RmUE2vFThua6W
	h5bc2M5GLZUk6PVTA/z7SY6BSUq4M3LMQM2Q8evT/ZgqBlzk9WoEMu7bh/bev+k=
X-Google-Smtp-Source: AGHT+IFBlmMQ8BF9VGOE8p6eOCCFYLNGVsY0KuYK2zU9xVixT1ZKB8UzaLusANFsmSbOvc8av3xycg==
X-Received: by 2002:a05:6402:278e:b0:5c9:5745:de9a with SMTP id 4fb4d7f45d1cf-5cbbf8a40c4mr17455994a12.9.1730384386255;
        Thu, 31 Oct 2024 07:19:46 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7700dbsm627152a12.34.2024.10.31.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:19:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:20:10 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 03/12] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <ZyOSGgJ4zb31Posb@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
 <fwqcbnub36fk4abmhbtuwsoxdlf64mx4v65mxahsxmiv2sz6er@bfjddapvb75v>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fwqcbnub36fk4abmhbtuwsoxdlf64mx4v65mxahsxmiv2sz6er@bfjddapvb75v>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_071948_449073_CEB95DC9 
X-CRM114-Status: GOOD (  26.89  )
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

Hi Krzysztof,

On 08:28 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 03:07:20PM +0100, Andrea della Porta wrote:
> > Common YAML schema for devices that exports internal peripherals through
> > PCI BARs. The BARs are exposed as simple-buses through which the
> > peripherals can be accessed.
> > 
> > This is not intended to be used as a standalone binding, but should be
> > included by device specific bindings.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > new file mode 100644
> > index 000000000000..e532621f226b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common Properties for PCI MFD Endpoints with Peripherals Addressable from BARs
> > +
> > +maintainers:
> > +  - Andrea della Porta  <andrea.porta@suse.com>
> > +
> > +description:
> > +  Define a generic node representing a PCI endpoint which contains several sub-
> > +  peripherals. The peripherals can be accessed through one or more BARs.
> > +  This common schema is intended to be referenced from device tree bindings, and
> 
> Please wrap code according to coding style (checkpatch is not a coding
> style description but only a tool).
> 
> Above applies to all places here and other bindings.

Are you referring to the title being longer than 80 column here, right?
Because the description seems correctly wrapped... or should I add a
newline for each paragraph?

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

