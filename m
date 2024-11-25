Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A16D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4toVw0A5ZDZA3zYjFx66d73EEMSNS7vgXv0fs9opgvU=; b=ubGOuIbc95uneLJJR7Nz9ZhiZn
	4DRoia3D+2LXmjUbak0mhJf/ymG7uLi4ck5SaJTpEJaGePOxze/Z3ZWXX6tQ166bkkOlz/XKt7MXC
	Q05udInUzl8z00RQmLKv0neSmPh3Nhrnznsg7T61Dc3Pgk2tBorhXI29bg7U0oW7j46o3Dpkc0RW4
	K+X2U1vhSV1GN4ugbGBVAb8mQmcm7maO5YBJ+bCyCqjElLRUBnXUwm5sq/1NIjUVMA50GcU8RVOAr
	bbGohjDfk9v1Rsyvs4TOvi2v9oyN92C5mMcNFFL5LF/eYqNwv7BJ0X0uVvPTuxEwp0FwhhWYc034T
	x5PQ+gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVCo-00000007WoR-042F;
	Mon, 25 Nov 2024 09:16:30 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVAy-00000007WHG-1ewQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:14:38 +0000
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso1626873e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732526074; x=1733130874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4toVw0A5ZDZA3zYjFx66d73EEMSNS7vgXv0fs9opgvU=;
        b=U0h3OL3RzNCen2wq5AskEMRBzCjhFynlRKq1983K3d7wwHjhzYyt4Tfy5uQQMk9X7X
         EyqLPO2und01j0pBOqG21WlGQ4j98EpyPJOkIqT+pxcvADiK5EIb6D6RWgI5JZszbjn3
         56gtfi4L/SvnTonSJTKfWgEXTKLQVfhpreMc3miLnZpj8KfAUu04Ac23EfM87ctDdFF3
         p4ZWXN6dh6DR3C4m8u/LDbZt/HfAhqq68YyHZMI81MrQYUOOLuRUEyLuGwrZaqdW8lyR
         3je2gG98KVQO0BZ1D1YxzCjQHoGdJM/r25fdYqFt47tkzWpA6MaLifyx5cpGZajQUJIk
         Wxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526074; x=1733130874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4toVw0A5ZDZA3zYjFx66d73EEMSNS7vgXv0fs9opgvU=;
        b=hkYcBJUlIuPHDQY8C45RtfK6yiHxvr9a4kmlZBZbrcejOI3p4JztXZVL3ccMmlx1es
         gKl9W7tDJZTRLBiOxKtkj2tCkGkiPtkWd31yBIS3aS0lypsXkrigDV0rotLNT9EHSdy+
         CZQEcka/xrpERVpcKOd86970Lv2G7A5PrxhhYQJ14cC9tCHdePR5JwDkOIVBo9rCe+tQ
         v0qXhYj8ADV3AWEhi6ZuDvOGG6MFlBWivTCdBaIjyWIZ3ky3TB0F3KQTIfwwNtZ1+isX
         qeztJwcKXz+Lq0pcLLQYdQbq/1K5ihYL8eS7fDjr3KCHJSX1V2iOBvyUMxesroBPa+JN
         Qd7g==
X-Forwarded-Encrypted: i=1; AJvYcCVjb27kw5wLI//RqNxn7d2dROOKeRD4OLCwWdpo3nKjH77p/QD01LAvFUsrQCfUyKW5GRgh+KBP9Jf8c1ZjsmgO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6/DWhBxT43M8hwDYqHY1K+PXwPmHrZZPGT4ajcB/9w0bhduYu
	O5Bh3snKL4+abVfvPn7yfMXNSLUVhWAXNaAsjX3GkOHYpTeGbQtBb45MUy4h5Hc=
X-Gm-Gg: ASbGncu/DoMzgk4aeuWEXpIpHNz1V/W9lQ9gznGCkC0jTSx+DTcEAPR55QLls4EYwQu
	xEym2i1uL2q90x9rfGbGAtfPw8+m3aF5ixkZyGVDEcDYQE+rcB7HACly2iAjE0CKQM/qq0LJU6p
	9AZAVx7CPw9sd0ZAJ9WZi29vPgNkXp9P+66ySdQjeE6QWQGIbVvs2sF7xKQx9j+swKTbtfddT5a
	rxxonR5TQwqDJb6sTT0Ob30eZKQK/9WZluYrkj/cqeP1ZlzzpoVwGIIsNMLn9GllE9HvtWxUVSO
	KfI1frESiU9KPqXWSoTp
X-Google-Smtp-Source: AGHT+IGzMekzBQYfXvbzxD9izRI1CL/rjOOOx/NwOujkSDTMSARyoXxxyDmvBO3p/5f/oLabAnZ/QA==
X-Received: by 2002:ac2:4e0c:0:b0:53d:dc0e:4da0 with SMTP id 2adb3069b0e04-53ddc0e56e9mr2499509e87.15.1732526074368;
        Mon, 25 Nov 2024 01:14:34 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa524615e8fsm363089966b.182.2024.11.25.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 01:14:34 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 25 Nov 2024 10:15:06 +0100
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@amd.com>, linux-gpio@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	Derek Kiernan <derek.kiernan@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Wilczynski <kw@linux.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <Z0RAGkBc-yz5lqN6@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
 <173250040873.6640.9720381303445148722.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173250040873.6640.9720381303445148722.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011436_535151_03DAAAF4 
X-CRM114-Status: GOOD (  23.58  )
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

Hi Rob,

On 20:06 Sun 24 Nov     , Rob Herring (Arm) wrote:
> 
> On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > schema is intended as minimal support for the clock generator and
> > gpio controller peripherals which are accessible through BAR1.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Sorry about that, but even if I see that this should be the case (I've dropped
the clock-name property from raspberrypi,rp1-clock.yaml), I can't reproduce it
with:

# make W=1 dt_binding_check DT_SCHEMA_FILES=pci1de4,1.yaml

and the output is:

  CHKDT   Documentation/devicetree/bindings
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/misc/pci1de4,1.example.dts
  DTC [C] Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb

dt-schema seems up to date. Is my command line correct?

Many thanks,
Andrea


