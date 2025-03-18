Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7825BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gk6oJcdXjJrwsMImt/znJgOTOwkBmDOkZsDuxU3Rxs=; b=zIWQCSMF/Z5s85CaIwfBTMKCE4
	O/Jutcdh8TPwYkd6En/ppig32TtkRA8TSElZnpDxuF4N+4u0tL50bKBX0k6kMY/2tlntTbWoZawTe
	DhklrYMK4iXdTWsS4MW9iSqZBaApp9/6oHYDSrTxte+rPYMqlAttwv7imScfeEMB+Ee2OQhRm+nDw
	UPFXG1SX666Viv8dJCc1T32V4U4dNI3TY7Npd0R1Ob3hqFq4fJ+pdrV3LsHcxsaeYvakp1YoH1Tk5
	dUXV7nsSzx4OBuzmMerubycpgDMan33pzvfjMrv4t2TZTmOL2x0nKlU5TZgg3EFbLWmL9+X4VwWLP
	S+FAyQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRjg-000000052Wa-131W;
	Tue, 18 Mar 2025 07:51:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRhU-0000000523z-2D2V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:49:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22423adf751so88838745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742284164; x=1742888964; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gk6oJcdXjJrwsMImt/znJgOTOwkBmDOkZsDuxU3Rxs=;
        b=LZA6h8Rf7GsC1OWU5UMr7J5F+3kr/i/cSAoqm65HTaMNh+Y7VSi017FX8i7+XZcmYh
         D6keThECI0r5X0I4ZP8algIT+eUyal0DfL7lU/bjVl25uqt5rpRuDjjEkt0/+16fSFhL
         +cILJUpkafVknMlFMyP4/tc7PpjCQ1vRnHk+SsPeBgs7gBw+1BmdREhtzZDJE6omlLUC
         URbK0x8DUKed5HVCU9IDHSjrnZftetYuvIzUKARDprVR2Ovws+xn953AePlyBOvcgfKQ
         Ua0hcrmRoS1GgZPliS2k66oTGUBeWQSbJnQE8WUw6io8bX8g1slxlRfPuI/ohM3bOenK
         uGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284164; x=1742888964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gk6oJcdXjJrwsMImt/znJgOTOwkBmDOkZsDuxU3Rxs=;
        b=VeN7o05mf5F+DjkZUREs+SUhN/crW7p/pYJx6uMyQo0ksQZYohXDQcaglDs0/hlXxV
         xNaAT+d7HXhkYS2r7Eo+Gs0yNKb8Kzb1V7kW5Lk7v3r5/URqCEqGfSHIpVuIyvpfiszK
         l8Cuz1z3/02E4O0S2kogAo2ghC9bW+cp7ggbv+iIOnM1mSE5Zz8MDq+pqi9xwtuqSZmK
         SscOhWqrEdtHZKyo0LVv2/TsruatVn/XRXGz3PgKy415tISpF2aYAVNqnVrvmirsos2X
         i4LrtJryAH6Qre+SaUoil2dvdj/dbFZucf7EDep0sm5KQ7bamWGY5xg2YebGWICeb4Mc
         ZEOA==
X-Forwarded-Encrypted: i=1; AJvYcCUB5UMrZjzpDQUsp6/M38+IpfKW9y8bdKZUGPxy7+XFREdaDLJjpUa0AQeo9AxR/kbuJsDKnfT82wr5W8GGT/Qa@lists.infradead.org
X-Gm-Message-State: AOJu0YzezEOgm9vnmQTUnVHy8GtpzbNsq6V7mqbuRyS2+gvPIgJQS+JG
	Qm+1vChdMfk5UUt2MG1P+zZRUJYtszZEjmBotm6dCry+ublC888v+7jW7Umx4A==
X-Gm-Gg: ASbGncuRr5fJSx5QhnpARiRU9kdIAOCHIAm4UvTXVgdQHRYZmsIXpPWd3slOpQjYbcT
	LRTs3OTfm6QTe0n3uLzbnsh8uNd9LwLxs52SKFctDrjBhcmk9zSTcfLeKup57kZhuXuqRTSa+oh
	t2eLbqSuJW64D0ipeXPQqEHOX050dRrRQWMqOcyn4XYbik511EjUWxdOpSVHxRInz8PKnuA1YZI
	5icJ9S0easPBUWgQxz09mU71XbQtLvevUFUkeBt4KrqnAktleU7H3m4eXidWFY2uNnvjeNHJ8SK
	K+wG5cXj63ACznMUK3OCwJ7Z88YYvMFdCi2gC8x2GXNVSz6ett9cZ2w/
X-Google-Smtp-Source: AGHT+IH069HRnLK7GJqqbw6Dd1HNX+3REq1qkSJVtn6/nxb/rYTa5SmZP93qVfdUgG49SQLEkOhpBg==
X-Received: by 2002:a05:6a00:9a7:b0:730:927c:d451 with SMTP id d2e1a72fcca58-7372246dacbmr21313065b3a.20.1742284163790;
        Tue, 18 Mar 2025 00:49:23 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559fbdsm9171304b3a.59.2025.03.18.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:49:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:19:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 1/4] PCI: cadence: Add support to build pcie-cadence
 library as a kernel module
Message-ID: <20250318074917.inhspuuypxmaioqe@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-2-s-vadapalli@ti.com>
 <20250313174416.n3c4srf6hb2l3bvg@thinkpad>
 <20250314065444.fmvhyqmuefnm4mcq@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314065444.fmvhyqmuefnm4mcq@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_004924_575443_E9A5F365 
X-CRM114-Status: GOOD (  26.22  )
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

On Fri, Mar 14, 2025 at 12:24:44PM +0530, Siddharth Vadapalli wrote:
> On Thu, Mar 13, 2025 at 11:14:16PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Fri, Mar 07, 2025 at 04:01:25PM +0530, Siddharth Vadapalli wrote:
> > > From: Kishon Vijay Abraham I <kishon@ti.com>
> > > 
> > > Currently, the Cadence PCIe controller driver can be built as a built-in
> > > module only. Since PCIe functionality is not a necessity for booting, add
> > > support to build the Cadence PCIe driver as a loadable module as well.
> > > 
> > > Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > > ---
> > >  drivers/pci/controller/cadence/Kconfig             |  6 +++---
> > >  drivers/pci/controller/cadence/pcie-cadence-ep.c   |  6 ++++++
> > >  drivers/pci/controller/cadence/pcie-cadence-host.c |  9 +++++++++
> > >  drivers/pci/controller/cadence/pcie-cadence.c      | 12 ++++++++++++
> > >  drivers/pci/controller/cadence/pcie-cadence.h      |  4 ++--
> > >  5 files changed, 32 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> > > index 8a0044bb3989..82b58096eea0 100644
> > > --- a/drivers/pci/controller/cadence/Kconfig
> > > +++ b/drivers/pci/controller/cadence/Kconfig
> > > @@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
> > >  	depends on PCI
> > >  
> > >  config PCIE_CADENCE
> > > -	bool
> > > +	tristate
> > >  
> > >  config PCIE_CADENCE_HOST
> > > -	bool
> > > +	tristate
> > >  	depends on OF
> > >  	select IRQ_DOMAIN
> > 
> > Even though this was added earlier, looks like not needed.
> 
> Thank you for reviewing this patch.
> 
> drivers/pci/controller/cadence/Kconfig has the following:
> ...
> 	config PCIE_CADENCE_HOST
> 		bool
> 		depends on OF
> 		select IRQ_DOMAIN
> 		select PCIE_CADENCE
> ...
> 	config PCI_J721E_HOST
> 		bool "TI J721E PCIe controller (host mode)"
> 		depends on ARCH_K3 || COMPILE_TEST
> 		depends on OF
> 		select PCIE_CADENCE_HOST
> 		select PCI_J721E
> ...
> So PCI_J721E_HOST selects PCIE_CADENCE_HOST which in turn selects
> PCIE_CADENCE. As of now, none of these configs are enabled in
> arm64-defconfig, and they also will not be accepted as built-in modules
> as it will bloat the Linux Image for everyone. For that reason, they are
> all being converted to loadable modules, and their configs will eventually
> be enabled in arm64-defconfig as loadable modules.
> 
> Please let me know if I misunderstood your comment regarding the quoted
> change not being required.
> 

Yes, you misunderstood indeed :) My earlier comment was about IRQ_DOMAIN symbol
which looked like not needed at all.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

