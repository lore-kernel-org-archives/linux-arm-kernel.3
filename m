Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22569D44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnXDazCQ0RtTKBnn8REjgqiFnugp5BLQz0FcP1jAvLs=; b=gjXqHLwMGCdSroCoIAvjGXNHmj
	DxpKNELTGn+/eJQ6nxjk0bZ1EASRQs8Czm6LkIhXGdotcylZ9MqHmZ7xj02p4yCN1BfHqpAwbB0ZQ
	JmfjB73iXI1W7+pkY9z+tv/VLYvLWd1hSijDkHrI+luw5A7e5xnoxsetOd9Dx8OlD2Ifrnuiz4MW7
	uS89ZeluMrb2tKFQ+QmcTK1n0Vy0FlZRCzC6Cf/gSNWTISL3TJI6neD6n7uFfWWtYTQjr57z/wUb1
	S7Rp8yDoYemACzmAVP6Euf9ke3GVCODglQ556MoCSUPWOUI4EPQzNlo3d8uqUYQ670WLMWz0NmfzE
	8ZCkAwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h9i-00000003exI-0jWe;
	Wed, 06 Nov 2024 14:37:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h7s-00000003eeK-46IT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 14:35:21 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7473608e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730903714; x=1731508514; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnXDazCQ0RtTKBnn8REjgqiFnugp5BLQz0FcP1jAvLs=;
        b=R7xjJWd8NIT9DdCv1ULA/lKneJXlgzHZCZ8d89aNYnpuHYlgZeYYcrzQdWc6K1IEnn
         2Ikczj1oGFmhOj2LN6ZNWhiudyJPWJDm5oW+haVEeU1Q2jZsqmR50d/fXxQlvS167rC5
         8f0xWQ7wW4nXLR0dvMlAVPqOCWSsezKQ5kZeu8p53exCMaP4f0ft68yP2i1nhs5F+lH4
         1iJOWk9c+XMpRMUvFE0ud9FgrARBsSwLXtfG3mPPL6mcDn1RLNjOFxbygvc/TYhbrY38
         BsAzc5LYlrOYSUpYAzWtj9K9KRoJxkBj9xI3Rv8bXGEvW7soGB9IYIBtUZJccypk49+P
         o+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903714; x=1731508514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnXDazCQ0RtTKBnn8REjgqiFnugp5BLQz0FcP1jAvLs=;
        b=uCnotwcOcaKA8CgjJRaqDXqtdPy/gCBe2ZTmSuVipXM7BWEyvqfi6YOVAxDAgkyizN
         Lmk46WvYjyt5xptBl0w2csvkv44RBmYv6QDY5EzYoc4YLXYXVV3rlT+lssam8pkdI3jR
         crsh7g7FRur9EvXGyiy5Onr/qO3KInLy3RUTL1nZLD664cMGoPO9fTAxApziD5Js8ck2
         uQkfgnpJPnvmNGWRHWRZoDiT8GZjZf5ru0n7SYQrbyT4/9cMbOhq7hEOh29LKc/9FFsM
         wD/zGDoAvKfMmJMErGPqUrtXtS2m8jVHOU4IQusbeq/Eq7PxJhYWChB9YfZt1h85ZZ0+
         CehA==
X-Forwarded-Encrypted: i=1; AJvYcCUuKUaI7cHBdgvCU6fJRtGALGEyKlNgwpzJzMo7J7V6uJxWlam+mumdNkgxOu8BU2kPoyETEKYPvymqR4AA3i4x@lists.infradead.org
X-Gm-Message-State: AOJu0YxfHaEPu53Q9xmovQ91ZtbL/ZsSnVBcudbqkkTk5IfJpzou6Gj1
	9cupn1mennrMWgBuVPHFfzYaeIV7gIZGMZkPFTt+8nNL+IHgz2daMZqXkU1HnA==
X-Google-Smtp-Source: AGHT+IFY7xsniFJYwZTMCPs0XA34VZgv3LQnQ0nmsY4lMKbdJP685p4rmkNLWAvlojUA7tIwGlZepw==
X-Received: by 2002:a05:6512:1324:b0:539:8980:2009 with SMTP id 2adb3069b0e04-53b348e76femr20895757e87.36.1730903714190;
        Wed, 06 Nov 2024 06:35:14 -0800 (PST)
Received: from thinkpad ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa7378e9sm26380495e9.37.2024.11.06.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:35:13 -0800 (PST)
Date: Wed, 6 Nov 2024 14:35:11 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104234937.GA1446920@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_063517_114599_FD7C56C2 
X-CRM114-Status: GOOD (  25.05  )
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

On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > > bridge, the window should instead be in PCI address space. Call
> > > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > > address.
> > > > 
> > > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > > bridges), right?
> > > 
> > > Correct. Please note however that while the PCI-PCI bridge has the parent
> > > address in CPU space, an endpoint device has it in PCI space: here we're
> > > focusing on the bridge part. It probably used to work before since in many
> > > cases the CPU and PCI address are the same, but it breaks down when they
> > > differ.
> > 
> > When you say 'focusing', you are specifically referring to the
> > bridge part of this API I believe. But I don't see a check for the
> > bridge in your change, which is what concerning me. Am I missing
> > something?
> 
> I think we want this change for all devices in the PCI address
> domain, including PCI-PCI bridges and endpoints, don't we?  All those
> "ranges" addresses should be in the PCI domain.
> 

Yeah, right. I was slightly confused by the commit message. Maybe including a
sentence about how the change will work fine for endpoint devices would help.
Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
in many SoCs).

Also there should be a fixes tag (also CC stable) since this is a potential bug
fix.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

