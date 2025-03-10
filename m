Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40103C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMtQuAslL24bZk7YWf+WGgK/9+eBDYJFSWGMHnXsle0=; b=tNNAeEOewKbbH/LCx4/MSnfmS/
	ZbAsUzQuH1Q8yM1uGCN3cfvIa6nAI+or0TvMqecq8Bc08lgscqiC4TSY4Af9PYkZUD19MzO9Zg/BV
	L+6QUIHlTKkM1pt2s5xS8wtSAc19mZkfNZSdXNRSvghVehHgfjKwUBbzAYeOFU2gWD8SeWDrE+OA5
	p32vZOlh739UvJEbo42aA9j5tFqnXqH/dkXxKagPUOCBjnzCusbTjE7TTParNQSNDVTWTcTDFnvCU
	s+VJC+Y/9xxMQUNBxHW+A+3jomNRKe9syXgzd3iRlKFgBHRdSNj463umMQZVoMg7dpEajrscLEgj+
	ziNyRcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkch-0000000410Q-0sjb;
	Mon, 10 Mar 2025 21:25:19 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkYy-000000040fC-1KLu;
	Mon, 10 Mar 2025 21:21:29 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fd89d036so93011965ad.1;
        Mon, 10 Mar 2025 14:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641687; x=1742246487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMtQuAslL24bZk7YWf+WGgK/9+eBDYJFSWGMHnXsle0=;
        b=REqATxerJ8nmtvMY9wZ4MUXj9UzMUYw9Gn5xhwu39ExdP9tCUW+5aV+7Ro14RcYOIt
         CDO9G+rMr1ibSYRZrBxe7SXlYnTCN8Vq+TNEJ7f92geglvfHH1i9W+vLxkdtl2lw6XLD
         En3O5s2ByxowQ+L4tvsK/h0k17lpoUp8VwAhaAEBUge8XMSraJqym/NfZNOaQ/zUqT6b
         tizxa0pHdiMunM4BgxbdR2VQiPSRd0DtIO7TFFfTcDXbjx6RkMWyQYjdInUYBM7SvUp/
         p21zpy0PpUkPdcGZwdP1kzx7MdhEPt/tpvqIZ/xsr/A1GuUa7YNYGUzgBixHPsqzR/WK
         LDDA==
X-Forwarded-Encrypted: i=1; AJvYcCUQX+10/BWjGaz5o8jzSIAKKkk9l7c8RGevjOWoe0g8GiqSBxtHrosVLoMNNFi/xx8h7N4+v3tML9uyEQRVc1YEeQ==@lists.infradead.org, AJvYcCWHND6OzIBsCIi2EiPfhre7DGy5Tt6t6J4IanEnz1zYNE3Px4kqL1HcZv+52b6kcX5PU3focjg4yidMuAyXVfAG@lists.infradead.org
X-Gm-Message-State: AOJu0YytuQHRLR175GsCvN0WKFsj+RsL9Zt33MW9OsYsfnUkAvCq+kg2
	H43/moGSb1FVwUioGtxGeet3KUp+XsOebRHwWWs0WGrXuwiEVtN6
X-Gm-Gg: ASbGncvMdaOIZYa8+rqdA+zSLpCIpcklT3K322G4vG2aR+125hJxZxFvaJmDrs8ffLp
	4EC4OietK7/uppwq8jJiR1scgWFlCLVDam+jJWwzmbWxCL9dZRjglzjMZfMqMMgFiOmWLsb54AT
	ta+uYxbmLURjk1DplEaafXO3xs5+lH1CU09LiC3ATqW64ThOa3jBr7LKXQOWLV93o/lkhkN8Ln1
	i/oe5whiLNQC+QAuFrXA4a12E9Uy+1AgJPaZARFQXuS0kU8A0AwOTxcv2NL/adWjvAr6HISP+az
	I57bTwQFohctz5oIB/BoTCAiSES2LYD74KIpab3DcSZgcKRpi7EC/93TdBT0I496ffgekZmOWFu
	CBgg=
X-Google-Smtp-Source: AGHT+IHnwh7FGubECk4Ug2ue3ZTg7THVvARHNItmJN6zeeu4Ty1YJPgJTQfB1QWA0ZY2KF85fbkAsA==
X-Received: by 2002:a17:903:40cb:b0:224:c47:cb7 with SMTP id d9443c01a7336-22428505f24mr254867065ad.0.1741641687444;
        Mon, 10 Mar 2025 14:21:27 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-224109df232sm83277565ad.41.2025.03.10.14.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:21:27 -0700 (PDT)
Date: Tue, 11 Mar 2025 06:21:25 +0900
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
Message-ID: <20250310212125.GB2377483@rocinante>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_142128_353649_85D0886E 
X-CRM114-Status: GOOD (  14.67  )
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

[...]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d45c88955072..af2e4652bf3b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
>  M:	Andrea della Porta <andrea.porta@suse.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> +F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>  F:	include/dt-bindings/clock/rp1.h
>  F:	include/dt-bindings/misc/rp1.h

I would be happy to pick this via the PCI tree as per the standard
operating procedure.  However, the MAINTAINERS changes do not exist
for us yet, and are added in the first patch of the series, which is
not ideal.

I can add the missing dependency manually, but that would cause issues
for linux-next tree, which is also not ideal.

I saw some review feedback, as such, when you are going to be sending
another version, can you make MAINTAINERS changes to be the last patch,
perhaps.  Basically, something standalone that perhaps whoever will pick
the misc patch could also pick and apply at the same time.

Alternatively, someone else picking up the PCI dt-bindings would work, too.

Your thoughts?

Thank you!

	Krzysztof

