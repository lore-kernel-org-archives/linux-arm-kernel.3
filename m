Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98974D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 02:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UySyQ+v9AxIr7Eb09KxAsjVixCgFg3PodYB+NeExh0I=; b=lmlzqEIN2NC2Yfi49SYv55gEVo
	laKOQkpxZxtBrFTRXxksIYV6+T+5rW/BuRUOrOKAdzDkMhcaui/Kt9SE+zji76Ux9dE/p8KcM8IKG
	L97HDNqetoLbyezFCQ3oBcRO/7SKLNES1KlcPBNmTXJBb9YuYjlNxYf4lddGYyJCOq8lu2qjw3k8E
	ZbcXYXK1o5ucw2jpmrNOaY01UsPwL15iS1HNu7Dg1lL+JTF4vq54z2GfU61Xlp1d4gsp4G1a3qfUs
	8Le1P6g6pInRsLzU6R9P9X/sJJCW2NC6/DXh+rBuXJE3rlTijDcGqI6zy3fJ3A6oXRLUIAIeLPBN4
	hI32jcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFOWx-00000006uTY-1UKG;
	Mon, 25 Nov 2024 02:08:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFOV4-00000006uEX-14Z8;
	Mon, 25 Nov 2024 02:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AE455C483A;
	Mon, 25 Nov 2024 02:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D4FC4CECC;
	Mon, 25 Nov 2024 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732500411;
	bh=fKuuSMNf+Qy6m8ZOXTb7mpNsw2y4fw7IbYodhFF8XTE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OJiMbLUhe7rNCTkqgTcbf/1gksuekRvIEHdo7FgaTZ5Krjo4kOrZ8wyXNpfOVwwVX
	 HAQdaEjQ5uFHcYXFHWip4rvCEvkuHnSx1c5Mjl26rB4NyCIca8qjK809oIWHmpk56W
	 rPqk8nLn4mQwyoU6T42DPWnRGe9aK3adMADGzOZd5pWEUcl26NvWVcAnjivNmsMCe4
	 QszW4mn4yLRtHkeu4OXCTVXJKeKrdcYfCMGvafMHTH8kbGuOcven9NrIDzgs3kJkve
	 qKzgN0UMzpEMoSRIsbhhTL1LJgBbiCnV7wCHIcC7QaEbISlV3HZqRThvdlL5Jz1UZL
	 24ZiZnnvzNW0A==
Date: Sun, 24 Nov 2024 20:06:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, linux-gpio@vger.kernel.org, 
 Herve Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Lunn <andrew@lunn.ch>, Saravana Kannan <saravanak@google.com>, 
 devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
 linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Wilczynski <kw@linux.com>
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
Message-Id: <173250040873.6640.9720381303445148722.robh@kernel.org>
Subject: Re: [PATCH v4 04/10] dt-bindings: misc: Add device specific
 bindings for RaspberryPi RP1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_180654_381434_3665AEB2 
X-CRM114-Status: GOOD (  12.40  )
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


On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> schema is intended as minimal support for the clock generator and
> gpio controller peripherals which are accessible through BAR1.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


