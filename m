Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8482C36005
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umbyZX39Xy601g6OGF8b6eQwLE9V0tDY3oqiE70mc54=; b=OhH3PCWvSubip2A9NS2N8hPD4P
	MRui5lpdV8E36kwgpacJMbt9xOSUB4RDJGgG+oO7VTlAyJxJONj8iJ3m5IMgGiFbDVA7+ClwZjeeU
	iv99s5jcBujaCXGDxZ4k+nzp+XY+1SRXQgry5ToZTPi+P5HGAkQsGwmbZKJXY36XXyLh4/snziwEg
	tATChWu4LgLNcecwPq+//nrPi1Qd/g21e9wpWINHH/YLj1GwMybyxqzIcXJ8983Ngf1XjnHt5aOIk
	BmBwLEPl1r8x6zEiq/cofVo12rCmLhr31obp5Ly4JiJL2iVG0BfJ0RKKRsURusBJohJYVeukLY9Nw
	fWqdEKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twJhP-000000017I3-0fdr;
	Sun, 23 Mar 2025 11:41:03 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twJfi-00000001712-1Koa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 11:39:19 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227914acd20so24465495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 04:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742729957; x=1743334757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umbyZX39Xy601g6OGF8b6eQwLE9V0tDY3oqiE70mc54=;
        b=OOZFTOVopSEVExy8imQV0s9rM1rp6XKJ+VBaT3lpZuJBcrE9iGsdvCFg39tKFqoMpv
         xS4dK41LKEn8GMD+AoLWZ8OnTJe0o9bk6aYX2sSOByHRxZ1aIG8zGXVeyN9LaquBeEBU
         9DLM8YOXGFOlDsD2vmfVYAglX587aqpatanDN0uBzgXEHFsf8LAnCLtKh38IOVI1Ve5G
         477nA694/UvrU+OS8xgbIgigmmwXgy3wmD6sVd1MSIAVvaxVSk9MOMaWdo18vlQcHCAD
         3V2yoZMT/dKgEOBAq24fjeb0EA8FQfbZ5YE15b6nGN6ZPyh5pQ5aKG13ibDifVrI5kNG
         X4aA==
X-Forwarded-Encrypted: i=1; AJvYcCX69K8VSUiEKjepajZraNfl20RMBJlzUh0jF2ta9m1pr1yC1FoL3r8UHhwXXuq12GTCWp92S/J0r1HnbkwwJJWY@lists.infradead.org
X-Gm-Message-State: AOJu0YwEhuBxUg+JwRPiAGPqrp6R1EqqJCpr02U2Q9i8Qm8FQ3NBb3IY
	yoBTfrvfmjs7/uSZElrN/TNrWrJ4nu3Ha1T+6qB2QaXMrpsZ7lHl
X-Gm-Gg: ASbGncs9/wXbisk9j61wOKo0pCWubs8VzHd7IEn3QBkUl/K1uCvkWHiaXHa3DeDXzTf
	iQobY+g1lCr21j/XfPn1g1TvlZAcV8Okc8Eo9zcuVVxfnuAK8jTwDq3+85gXvIsit85BrMvFNNQ
	fLXHgt8Wy05zedq+24Mts+OoWPTf6uI5YYL5dYzlE3m2rLDP/RLU3GrYez42PrcweKctxw2xVxj
	hvAvfHE0RlMbnxdr0ZrahSfmFNrTKP1FSY6yNkZ2EEj7vS+gOVVEQJvIzC6+AjRR2vPzYtbtdqz
	ZwZC0SF6LHFYijR2PeLTRR/TdtgpW2UusfbP/hb4yaise8DsQIiezE7o2MPDPynWnpwgnpvvWti
	Yers=
X-Google-Smtp-Source: AGHT+IFJWx4DQdPuRy8xvpUazrhNKHbR0p3IdS7aCxYy6lnZCOKUux+yr5PQT4J2C1cwwOxmpwbt9w==
X-Received: by 2002:a05:6a21:1086:b0:1ee:5fae:8f6a with SMTP id adf61e73a8af0-1fd0855643dmr24347539637.1.1742729956766;
        Sun, 23 Mar 2025 04:39:16 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af8a2a24404sm4999600a12.51.2025.03.23.04.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 04:39:16 -0700 (PDT)
Date: Sun, 23 Mar 2025 20:39:14 +0900
From: Krzysztof Wilczynski <kw@linux.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 03/13] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <20250323113914.GC1902347@rocinante>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <096ab7addb39e498e28ac2526c07157cc9327c42.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <096ab7addb39e498e28ac2526c07157cc9327c42.1742418429.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_043918_354494_4066935A 
X-CRM114-Status: GOOD (  11.26  )
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

> Common YAML schema for devices that exports internal peripherals through
> PCI BARs. The BARs are exposed as simple-buses through which the
> peripherals can be accessed.
> 
> This is not intended to be used as a standalone binding, but should be
> included by device specific bindings.

Applied to dt-bindings, thank you!

	Krzysztof

