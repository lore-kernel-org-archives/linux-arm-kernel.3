Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC18C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRhhFOV50S8nkiKWbxOQjhnR/D7pnJ4RjNLNNRoG574=; b=17jUg2lHX90afWLlC9sgFVz11n
	7A0G7OIxCi2WodwitQE8Sq0jxsOyqeoK6lr8qCvXdO7PNcHj44o22AB0yxP4acU3mzSoQpbDdSIaz
	40/WJC4AyLN0U8RLd3x1yfCmh7/M0rqhkri/rE7Zx+iZ5Omamk++9x6+zLZSDDkIN5OGRdI2bvEcF
	LEi+7XpaEITgXXo+oXH1e7sHtMeObpDb3E9x/Y5ip+Z4qQqVHJiKuAuyFeAxZHDSyKYAibqpEx3wN
	5Kxkkds9GVDG0/VSD4neTjmE0aUeb2bkCAl/7iYeWwagj5o92lx+OM/Ifly3J29co3q6f02Gw6mZ4
	Qjfm3YAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxwk-00000005Uxn-21Iv;
	Tue, 11 Mar 2025 11:38:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxtn-00000005UYl-2Afh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:35:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac25520a289so700882466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741692950; x=1742297750; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRhhFOV50S8nkiKWbxOQjhnR/D7pnJ4RjNLNNRoG574=;
        b=OOt8CZwt1zKslI6K1ST0bLVo6UeInax+WKYJ2UW+ASE1XntLs7ljqFWncYmedC/Av5
         5YZ2mIbROjiJhd1U0VT0gjTYNS5+CYxOhe/qLDhGaeIwS7qA78tCiOxZoApR4f6Hkoxi
         HH5BazkRwxgFlPG+tzk4Brkmcjibw4ohqGc5FQSudB4x5xXU75RMjYLbCRgVW83WR2eG
         p9OODZtuOCHDOPOzbINbxU1CO8mU6StSdf3gfQkNrCRyVkWL9EQZc6fapSBtHPwNT+g/
         9tjnrbrntNZHh51GoaSgwO0ZYHhfd8KzDLedTUgJTuixM42c2usfOFzXBLb4aMTbh3rt
         USig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741692950; x=1742297750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRhhFOV50S8nkiKWbxOQjhnR/D7pnJ4RjNLNNRoG574=;
        b=hZ2F44OTU4jM/ak8dk+qDoImTCjvK9Mrc+CYeuqhIOe7096QamQCNXzqNwjkEBPZA/
         CzM3KftWilF+eVl9X5PlSEw+QKLtBMP+mbcqmayJlZnSjgP5OcHqkGRlTkB+Oc0o/qiP
         J9qLD+JhJ5tHmxvVXZ8krSfODfrzEeUcc/NHoLKXRRCs7uJy4PGdMmbgg+JlGQFHJrDK
         PPcYHbNp8K4B5jL4WVjq9KTOqqSAwJqJJZym6Eq1Lh5KEc4YkDCpk3HgOa1VrIo6FMjr
         i9ohEBx5EXmDkFyMvjdT3DWMquBE6MmR/CoF32XMtBlXX7pHk4Hiu5+N++0UepOUfenq
         93yg==
X-Forwarded-Encrypted: i=1; AJvYcCXISzahXDVQ/avLTtO4/OJBni6TZ8LWCQwpQqmtxwnDWj7cn3i8OGdPriU4ToU51N2VhmzHUMl+F9kzJcbLJMLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxbMxSMt4BDEt1BVqQyCTERkyhdcV/Wc3k1fKAS7v4FJd431+iA
	xxXRBSPT0jYEKWyqGnbuyPBGSucMyvxVQvyYJBMjOS7lhecLRysBporGEyM5Ir8=
X-Gm-Gg: ASbGnctVM1cWd28UOiH61E+P+J+QQoItnpiQwyI8HeEr8uTTJHMxNexqBiM1bt4T+hS
	E7WO5tO1rN9DvjV9GtI+SVWvyDv/CwZMcyoSTyIjRnAju3lpi3Np/xOqHKjOTyEfSC3vW/Y+1sG
	X873RcNi+no7lcIczB57GRCaePRmxrnvWmDs0ET4BfhRfeu0+AonDnUZChB7Dbeo1nN9xxYi01t
	6H9TwKR2ecQ+5AjdNbHDt5YLMAIVQJ+pzpzCWNcuNLMqTogHhTWxsbLVQbTtU1znkFLzB6UFS05
	fFsQPAgh0FImFrUErKWdBGo8mPPM6FGEvtVCOQY921ED7dFA3Cor0KuFOEuRdv8XtNfW7YF+kQJ
	8ZwUYnM/caQkJ
X-Google-Smtp-Source: AGHT+IGVJsJ/tQDtRk3D58VsHDhx/tt/Tli65otubVC+55JrPtE5bG4yX5BvCZyT6vnF2dPKlEKCgA==
X-Received: by 2002:a17:907:3e16:b0:abf:fb78:6743 with SMTP id a640c23a62f3a-ac252fa0fedmr2145428366b.35.1741692949753;
        Tue, 11 Mar 2025 04:35:49 -0700 (PDT)
Received: from localhost (host-87-14-236-98.retail.telecomitalia.it. [87.14.236.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a65c7f7esm277405266b.117.2025.03.11.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:35:49 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Mar 2025 12:36:59 +0100
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <Z9AgW1TEiJ3G9dvh@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
 <20250310212125.GB2377483@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310212125.GB2377483@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_043551_555106_DB5D94D9 
X-CRM114-Status: GOOD (  21.32  )
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

On 06:21 Tue 11 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> [...]
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d45c88955072..af2e4652bf3b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
> >  M:	Andrea della Porta <andrea.porta@suse.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> > +F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >  F:	include/dt-bindings/clock/rp1.h
> >  F:	include/dt-bindings/misc/rp1.h
> 
> I would be happy to pick this via the PCI tree as per the standard
> operating procedure.  However, the MAINTAINERS changes do not exist
> for us yet, and are added in the first patch of the series, which is
> not ideal.
> 
> I can add the missing dependency manually, but that would cause issues
> for linux-next tree, which is also not ideal.
> 
> I saw some review feedback, as such, when you are going to be sending
> another version, can you make MAINTAINERS changes to be the last patch,
> perhaps.  Basically, something standalone that perhaps whoever will pick
> the misc patch could also pick and apply at the same time.

Sure, I will split the changes for MAINTAINERS file to its own separate
patch in the next revision.

Many thanks,
Andrea

> 
> Alternatively, someone else picking up the PCI dt-bindings would work, too.
> 
> Your thoughts?
> 
> Thank you!
> 
> 	Krzysztof

