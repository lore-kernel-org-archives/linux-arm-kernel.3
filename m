Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BAED609AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTiDm9JRZezbx/LUEzx4aLnoaU6eAxJ+37wmdIcSBZQ=; b=VAyEAwetDiF1RB9mbtStmDZBiS
	4j7WCbM8k0uwQAKZQ5rxKr07TGz4F36YGNex/umGnwiphiXcK35z9I0Z7skstGkecvbvg5/1jW9EN
	nM8FveXj5OrVbJb84cg9USoa/UehFBKT7LhSLCh1++v9Gg6uMQl9u5F03HKrrUnA6llrkLF8QgqrT
	plEQSXJho/oxqsKAUsWx15yxc/B0avFCo1eMMRVJYkJAObnzhY8wuaED7ypHQ+4bOjIHkAX7ninop
	FNfdemJaQ8/3mNTSHC+Ds0PFoDftUGFfE8y0lTmQf86rICxHPb5RiosNgQBZP3HfNTLq+mjllvdCm
	+QzLHJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCZw-0000000CRx5-2bBj;
	Wed, 27 Nov 2024 07:35:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCYy-0000000CRpK-3GwG;
	Wed, 27 Nov 2024 07:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B321A5C5C87;
	Wed, 27 Nov 2024 07:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D675BC4CECC;
	Wed, 27 Nov 2024 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732692854;
	bh=VyKDTECmg6WLZHeNxnqNh1HqtV5odSlywr88UUgZP/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BANtjcXCIjz9nsgBTkbT9sSmDjq8N9sGA9+mq7BFdpo14YU1boFoP9KHQvH8fuQQy
	 TAGCMS1IrQsXzgf+wv56F0K/UswmPJVaGCfqqdkrMOx6F4zdIKnK88wnAAxpttda26
	 Fn+WsH7DqKqiWdI5Pz6W2WWNF7Z0n3aEHviUorCn6EB9C3kmB3Ozr73aFLi3sRO4e2
	 ELlfB4Y58ijuxAUxKVdPcS1xkX+XFx5fAN2qdSmRwo2PC7DB8cC3RH1K0B21nBblYa
	 0P8pzlZ8sGTyq4eyub3BEjkB82vSxEaiySrLdciq9yd7uqHaePyHdZkWwiEfkLR31w
	 iVDcJsaao6qrg==
Date: Wed, 27 Nov 2024 08:34:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 01/10] dt-bindings: clock: Add RaspberryPi RP1 clock
 bindings
Message-ID: <leeeqocyjme2sbjbwsw6whisyu6aeq7vfypdi4arktpowzxvek@ejjyxx4iliap>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <5281e7b5aeb1cfc2f80c3234d9c3178c13b3b5b4.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5281e7b5aeb1cfc2f80c3234d9c3178c13b3b5b4.1732444746.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_233416_865794_AE5F8144 
X-CRM114-Status: GOOD (  10.13  )
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

On Sun, Nov 24, 2024 at 11:51:38AM +0100, Andrea della Porta wrote:
> Add device tree bindings for the clock generator found in RP1 multi
> function device, and relative entries in MAINTAINERS file.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
>  create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


