Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA88D6ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DM2DT8CY9jEtEyUgy7jwM3vP0NpdcYiJ0pskW32cFE=; b=jH3VbqimzX5ycYtE5/HESsGNTi
	4PLeJUux9JaodIcyKOH5yhWfxAO5f/+jo3sizo+QSP+DIRlKWbOTiOAkLLgBXpZCM3sOG6hcNHdl6
	aj8ral0bi6NIs/6K6uA85z0Ku6T2C0kCVcJvsRiQyG4AffGRxdokwMfcxF6OdxsENezVpIQi4yHY/
	xjGvF0u6UcRQ+8N23NYTvSSu42MQ65bYE4WMQrWMKN1AizfVRGhPipaOkOD8xZ3x9ee11P59RE+fY
	vRcjvR/4B9obc1wrBeg/2gtbEd1m/dV/GA/MkJFjHaVWh+3s1bOb2Z70De8q11lppgxjXqtiPio8y
	DpdPfEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIUF-0000000DJJd-29lB;
	Wed, 27 Nov 2024 13:53:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIKr-0000000DHdT-39OJ;
	Wed, 27 Nov 2024 13:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31C62A4389C;
	Wed, 27 Nov 2024 13:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77148C4CECC;
	Wed, 27 Nov 2024 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732715044;
	bh=J5kbzFJdRU8mGY871AZ3Cz82lCZYsmam9fRQzz21ITk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSSmnWMEoU1j6ZJ3uX6MsrZUbaV5vF9BPfFyVIk4PEduBfHU+/mYermlj1Jt0GIGc
	 u3np+OJuvEHZqlF2+FsIs6HxrnnlzXI1k/j04JS7ZRlkV5GXE44BtSKwNcu8iCIXHF
	 9I1wMZZ86PSAcNK8ooEArxq3uTanWIMoFZguxp73wIfOj9Ue+ZZZ/hZ+lJi3g+rqDT
	 IeiPMn3RTq5xgp6oSQPlSQWkgLPuvKJgG4CoumDeFGt0xYvQaIjP2j6rs4iZl1n1Dl
	 bGoKcsv3JUmpFuc/z9GK/c6s9l8s9fsK0JkSJN4ibherM9WlldEA6OWqL0NRxcv2K1
	 PNoeX8o8MUVwQ==
Date: Wed, 27 Nov 2024 07:44:02 -0600
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH v2 0/2] Preserve the flags portion on 1:1 dma-ranges
 mapping
Message-ID: <20241127134402.GA3351562-robh@kernel.org>
References: <cover.1732441813.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1732441813.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054405_856296_85BF4AD5 
X-CRM114-Status: GOOD (  17.52  )
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

On Sun, Nov 24, 2024 at 11:05:35AM +0100, Andrea della Porta wrote:
> Empty dma-ranges in DT nodes using 3-cell address spcifier cause the
> flag portion to be dropped by of_translate_one(), failing the translation
> chain. This patch aims at fixing this issue.
> 
> Part of this patchset was originally preparatory for a bigger patchset
> (see [1]). It has been split in a standalone one for better management
> and because it contains a bugfix which is probably of interest to stable
> branch.
> I've also added new tests to unittest to prove it.
> 
> Many thanks,
> Andrea
> 
> References:
> [1] - https://lore.kernel.org/all/3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com/
> 
> 
> Changes in V2:
> 
> - Added blank lines between paragraphs in commit message for patch 2
> - Fixed a comment to explain the code behaviour in a straighter way
> 
> 
> Andrea della Porta (2):
>   of/unittest: Add empty dma-ranges address translation tests
>   of: address: Preserve the flags portion on 1:1 dma-ranges mapping
> 
>  drivers/of/address.c                        |  3 +-
>  drivers/of/unittest-data/tests-address.dtsi |  2 ++
>  drivers/of/unittest.c                       | 39 +++++++++++++++++++++
>  3 files changed, 43 insertions(+), 1 deletion(-)

Applied, thanks!

Rob

