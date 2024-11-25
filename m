Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69318D58D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7nGMb9ZUJ3Iu4lD0zHiQYwj1nItMmGzs/Egyx7aqZs=; b=CDP4+gIL3k3w6gAuXMQfAxU1xC
	e3mnO0fvQupFT3BtgYiDAVLLN0C3HBKdOR0nm8c/JHMALZB8flApFAP9cXnB0xEhvy2OtrFmiVIYO
	fEQ3h0wdJp3B9PQT4O9z5TTndrbwZ9pJQidtRVez8t/kmiKyGdw++TmerzKJ42udU7QMWhPri4uEj
	SMa+fPhQvlGOD7gatVBBpXvWnvkDS/AHkzpco95HGWn6nKOvhP5tKB6Pdn4BgPBJ0cgL364nRw/dJ
	3vBR10cJ62N7d5jtSKlsmEnjNXLo0H3rZ3+nF+LspSNywJhnQCesIoShlvQGRdUfQtjv2FQLw43qV
	G5OGMCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ2W-0000000874g-07FW;
	Mon, 25 Nov 2024 13:22:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ1Y-000000086rr-1rnc;
	Mon, 25 Nov 2024 13:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE47CA416DB;
	Mon, 25 Nov 2024 13:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610F7C4CED2;
	Mon, 25 Nov 2024 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732540866;
	bh=3Z560kziSQXi2my1WMJNnxEGuywtw7Uta9RcrJwEvHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkykpNRv7e4NVi4Q3z8ffrcHtigFITXEIxN/5bTSjYdSwaphoIBGxqmG+/Xb46TI7
	 lHS/FY0EsAUAz1aYRprNvi6QHcyObwv8xHeGqJ05oGkRLX0e0qKg8xflK6oz4lAXf7
	 YhDyUrt9P4stTb7wr4Cj6faNKuabUVK/uT5TkuTTJ9M8Dgc7pTuXnnsJprFpWQcWsr
	 oJtVByZrcaZVyAzTcmcBTi8a4HHu7UG0bHWY3Xph56B8h9135/UIM79mhNBzIGU96v
	 JXhwAWUIHHY0CyLinhprle6eH9ZMJ6gAhhpTH9YT2OXbHgesMLMXeqrXQl9GDr9GhR
	 cR4Addly+n0lQ==
Date: Mon, 25 Nov 2024 07:21:04 -0600
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <20241125132104.GA1520508-robh@kernel.org>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
 <173250040873.6640.9720381303445148722.robh@kernel.org>
 <Z0RAGkBc-yz5lqN6@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0RAGkBc-yz5lqN6@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_052108_610445_D74CB249 
X-CRM114-Status: GOOD (  26.21  )
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

On Mon, Nov 25, 2024 at 10:15:06AM +0100, Andrea della Porta wrote:
> Hi Rob,
> 
> On 20:06 Sun 24 Nov     , Rob Herring (Arm) wrote:
> > 
> > On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> > > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > > schema is intended as minimal support for the clock generator and
> > > gpio controller peripherals which are accessible through BAR1.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > ---
> > >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 75 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#

The error comes from this schema and...

> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> Sorry about that, but even if I see that this should be the case (I've dropped
> the clock-name property from raspberrypi,rp1-clock.yaml), I can't reproduce it
> with:
> 
> # make W=1 dt_binding_check DT_SCHEMA_FILES=pci1de4,1.yaml

You've limited testing to schema files matching pci1de4,1.yaml.

> 
> and the output is:
> 
>   CHKDT   Documentation/devicetree/bindings
>   LINT    Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/misc/pci1de4,1.example.dts
>   DTC [C] Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb
> 
> dt-schema seems up to date. Is my command line correct?
> 
> Many thanks,
> Andrea
> 

