Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C34C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BIk0mJ4ghFJN5TubUO6JYFTlPsrPupFq1LBuxjGGzk=; b=AWIPFCcmEZol4zeWjo9SFUMIM6
	qxEgMtI5R8oQy0phjmV1eW//Eo0alsCxafRX1XtsTQKnaNtLDbcg33YWTplUfHGLDyvKevbJqBPwH
	pW4+uZ//k8L+/YBte+nsZp2d2OlW/AR9diAEbYe+ok0OCPhif7TNtcbPnYto6jGIK/VBpJWIE3ysV
	XW0r+eOdRJWxSxwukFOxkjDy8HcNdLw+P3csFKEep+QoqS5S2rIzOAKvPHpygS5FhwyYs9r2U9Xl1
	JXarmpgnP/w6/0OLzHtvw/03DGsXmZZ9PRQ1YRVgErWfT5Mtq70AbsuuZCVD4TYDZw3PAV8AQOqvM
	oPLprmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taG98-00000008DLV-3Tpj;
	Tue, 21 Jan 2025 15:26:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFth-00000008B9C-0SEA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:10:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab633d9582aso261283366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 07:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737472231; x=1738077031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BIk0mJ4ghFJN5TubUO6JYFTlPsrPupFq1LBuxjGGzk=;
        b=FwpP4IAkAzPRTHeEulepslZdz63sfjZrMj6um6OV6+SEQD1WW/5LV/0aSrM14DMTad
         kpfBpnv0kFg3algkhYIpvKpNoEz+w3pF+YsF1muDdWFPsQ3f6sFJzUmOGthIY+Z3XKs7
         kcU3aZaeGvPs8zIP1tnvphf/s1GRtW8m25pjJZR5bEK/1XOzBa5Fyc2U+knpOoBH1CSb
         s9ze98d5mkVqVHZ7yO9wbODO5le3mL9iMQ0w4HlI9bKeAJbq242K8qNKM5TodukjJ8Bo
         hkpUg3PXggVHDT4JdG7nehTyfJP1YSGdYh1P/KcgUQogs3RvYPHJ5UMZBHbmdDJaz3XJ
         xWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472231; x=1738077031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BIk0mJ4ghFJN5TubUO6JYFTlPsrPupFq1LBuxjGGzk=;
        b=KCZqCuq9GPRy+44ybdqRBXs9jEqPDnVNT+lpG/45mDzGXSpRx/5UtBc+cHZzmEgbKe
         AZmt51Z2NfhixlJrTG6Rl55oPMh63pJU2W8nAZiyN2L9P7Kvsv/W29ifqPauq0tFlfFT
         jMDOMSgQh2JFWF0lRk/J6IhNYzhccb6OfHKWdoCoq3HsKuIdUqCIagIxh2E90rGN0eVi
         LCEsxXvYwsJTKoohtRdAV2P2OL6CT8U9OcyzDne//VL7nsLYCoUzp1LduYCcH/6Faq8h
         hY87JdY5I5R8S/QQDL0hIJYzXwOyertCvQs0wHxjEyrlwtc9Yiwpqr04z3phT2WDGvBX
         feXA==
X-Forwarded-Encrypted: i=1; AJvYcCVK7sNbRzCRyHQDRCB9ZL2Y20Yh7vkO/P0001M5MPKUH2bDm9s58pG4qsywyrVhrnl0aU28EVkV1gzcaxshLwBZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDFi3vGH2wXYjJwcItJzgCACgYfSIF55SnpttphbEZqrwO2/Zx
	lpsTCFlXfpveSqS2CnXHgBc+35HNaFa8Fqs7rJH8WqciokCbmWKwI11eE3rYNH0=
X-Gm-Gg: ASbGncuq9STLOAbuz54rSXKBl+b4LHbB8NTQ9nM7gOeITwEgFu+4InUnNgfhBVm7rUF
	mJJd0jNqMdh3ynNDwYAd0Bm+JiBfbf6CbNeZWxKGKPfbFXISjtI0aCdBV39LYKnVBh3MozYlx98
	EvhyrX+ds8ivoVvAE8offZMlr6KXGaOtbpVJt10PdKM21yXMDJp/ukoE6i7zhtZVzjj/zUDOORw
	L7ylPJIp85bfP3qhfJF9XhKBXKtMCinxl4tC3O/7QKttXWPxnQYk6hpa0kYpXWgA+xvEWUoXpC/
	a9bBVKqO01xnvteUedM+3WZbJOFTsX2w9s1awbSg
X-Google-Smtp-Source: AGHT+IH9FVvcKrRKMRhk26BWOCPbtQyPFCLPBzPFOkLbN63Gck9obXb7zAzQ71TAqafJQA1N8DPwwg==
X-Received: by 2002:a17:907:94cc:b0:aa6:85a4:31f8 with SMTP id a640c23a62f3a-ab38b32ad1fmr1524098166b.33.1737472229912;
        Tue, 21 Jan 2025 07:10:29 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f8d3a0sm759146666b.158.2025.01.21.07.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:10:29 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 16:11:22 +0100
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z4-5GvpJfqkad-6A@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
 <Z4-oORWO4BgOqibB@apocalypse>
 <2025012157-bonsai-caddie-19b2@gregkh>
 <Z4-xcjov0HLivfVX@apocalypse>
 <6f16b0ea-ebb7-4692-bfc0-79052f079bc1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f16b0ea-ebb7-4692-bfc0-79052f079bc1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_071033_342130_BB6A8D3C 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Andrew,

On 15:53 Tue 21 Jan     , Andrew Lunn wrote:
> > > Well where are those externs defined at?  Shouldn't there be a .h file
> > > for them somewhere in the tree if they really are global?
> > 
> > Those symbols are deined in drivers/misc/rp1/rp1-pci.dtbo.S (added by
> > this patchset) and created by cmd_wrap_S_dtb in scripts/Makefile.lib.
> 
> Could cmd_wrap_S_dtb be extended to actually produce a header?

It will produce a header nonetheless, one which is needed by just one .c
file violating Greg's rule about having a header only if referenced by more
than one source and the symbol is truly global, IMHO.

Thanks,
Andrea

> 
> But that might confuse static analysers?
> 
> 	Andrew

