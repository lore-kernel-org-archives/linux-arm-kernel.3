Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1fvNUJM+107giQNxDtASFpEZ6IxMM9QfRNpZfhOjos=; b=ftmNCZnmKeZE3hJqoVP6Rdet41
	2unUkBeP37YbKSmqS2VYD/gYakV0m96LkVX58Udpi2uaZcWEcufDbO+G2bcU03v50gFM1eQAD01nF
	UlqjUOMQmHNz3uA0Ggm3WYo2PLnwQFNvOmNMOCl9LVsYkCzMNf2dmSD4BKqGwDQ9ZvdYM8GaBLord
	GuE95tSdbjX22b8VV6RK7HH3CjSRw7a/iuquGM1tLvkwzQXOaoznq+PvCnTbk6Nl6adLSFq7BSdbN
	vMsLumMtTHkVQxuZ37X6pJ+RVznwgkZxrIos6YmYokd7SGlkYTHQwmZfbdqKsT1WbPXf4l2kzYjDZ
	w8NoHhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDLd-00000000D74-3UN9;
	Mon, 31 Mar 2025 11:30:34 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDJu-00000000D0m-3Sz7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 11:28:49 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id A226D138441D;
	Mon, 31 Mar 2025 07:28:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 31 Mar 2025 07:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1743420523; x=1743506923; bh=R1fvNUJM+1
	07giQNxDtASFpEZ6IxMM9QfRNpZfhOjos=; b=yg4B3urwknbAULMsaA5bZ4IPUf
	gAjFsQe/RePHsI7+kgiJUQT6MdAmvc7iRMQY6ERi0rKkpd3cAUxByDOrq/bSFP2T
	qTHeBro9f4HsdZ1XtyGNOHxP2D5DA1cRrSPgktTj48J/8ojuitjY6k7MHKezq36X
	eH5bqg4le7WaCIyxCj5dvwbOpM1wfQlRGvMz8bWk3gk8X0MV2TEb+n4BXlyEBB8t
	jY8FqCzoRBph37/VRAHMdDM40wl4SWHPbnWdIRih6kvMDFl9t7GBmFkuUSStTrde
	snAHjwIG9FAZVAiwA1xcx1zZlbL2fscmubnCucJXH7QOVKg2uL7Lx86CXaoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743420523; x=1743506923; bh=R1fvNUJM+107giQNxDtASFpEZ6IxMM9QfRN
	pZfhOjos=; b=OWIRKvXTZ2yKPtYThutu5NLArnMgCvUKSuevNZ4JJqmmJpwG9jO
	cPo3Adu78HTleVeiMMSbsdsg7JZ98fSYO6BAGkBjdWfHnMjKjiR5tVlQssgLK5Ff
	VqumalrBGOpw+9y6dBGrt2+PjhcRGptLitimuNX1d+N9qoNQ0qtWtMFrw2u76oHs
	A0Mu1Lcdjotob5NOOH4p11eU0b8hgNJXO1wbITfmjU66sbtg0frsO4rNbI8zdNl9
	t9lwlTM5RhCIC9Y+9jsoMlfNsXUApoDy0Ahuw39nyOpa7w9gQQ0vRCXGSnZgj8Ot
	We9+m34LkwDxB77dLWGvlbf67ovPS7GkbKQ==
X-ME-Sender: <xms:anzqZzd-qCZE0w9Wy64ClmOY0eIN4MMvmGg2rtzv45Hiw20HROJ5Kw>
    <xme:anzqZ5NDzSt9jFp-tb2xWDX47cNngT_7fbJj2yrvHqc9U-uZTPxWjjEShhAqJxtin
    9lazJj-qVJeDyaWHWA>
X-ME-Received: <xmr:anzqZ8gvAM76vioAaZTQamMO-hWgbuk6PKDD-5uQZ64yt9pqqx0Fk9Nq2a0SaC2O0u9mcofh2cUQ71E3zEJFK7QYaGtuohWP3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpefgudeuffelfeekgeeukedtheekjeettdfftddujefhvdeh
    tefgiefgledtueefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhn
    vghtpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epmhgriieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgv
    rhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinh
    hugidqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgt
    vghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhi
    sehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvg
    hniiifvghighdrihhopdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhr
    tghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:anzqZ090RaJB0KMMXF6aBKMES2LBwgMbJdMsY1dWT5npQOfjTCZ1tg>
    <xmx:anzqZ_tDKXVnKqYlOPo1yb0tDMevULx8eeul9ci0UDMw6ecVEcCMoA>
    <xmx:anzqZzEQ8MtXMAAAsJ16bqb7kD2mN6Z7El9ch70--5pDorzPx6LlMA>
    <xmx:anzqZ2N8jGFQqhwox4Bsl57H3wd7xqdYwnqYWcUR_ow1a1qrrBpaWA>
    <xmx:a3zqZ3PHDwJ0q8FmW-ovuhKONEvhW69bqgxEgulDoTgHzPkkRHGcfgJZ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 07:28:41 -0400 (EDT)
Date: Mon, 31 Mar 2025 13:28:38 +0200
From: Janne Grunau <j@jannau.net>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 00/13] PCI: apple: Add support for t6020
Message-ID: <20250331112838.GA246397@robin.jannau.net>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_042847_682449_19F28DF4 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, Mar 25, 2025 at 10:25:57AM +0000, Marc Zyngier wrote:
> As Alyssa didn't have the bandwidth to deal with this series, I have
> taken it over. All bugs are therefore mine.
> 
> The initial series [1] stated:
> 
> "This series adds T6020 support to the Apple PCIe controller. Mostly
>  Apple shuffled registers around (presumably to accommodate the larger
>  configurations on those machines). So there's a bit of churn here but
>  not too much in the way of functional changes."
> 
> The biggest change is affecting the ECAM layer, allowing an ECAM
> driver to provide its own probe function instead of relying on the
> .init() callback to do the work. The ECAM layer can therefore be used
> as a library instead of a convoluted driver.
> 
> The rest is a mix of bug fixes, cleanups, and required abstraction.
> 
> This has been tested on T6020 (M2-Pro mini) and T8102 (M1 mini).
> 
> * From v1[1]:
> 
>   - Described the PHY registers in the DT binding
> 
>   - Extracted a ecam bridge creation helper from the host-common layer
> 
>   - Moved probing into its own function instead of pci_host_common_probe()
>     
>   - Moved host-specific data to the of_device_id[] table
> 
>   - Added dynamic allocation of the RID/SID bitmap
> 
>   - Fixed latent bug in RC-generated interrupts
> 
>   - Renamed reg_info to hw_info
> 
>   - Dropped useless max_msimap
> 
>   - Dropped code being moved around without justification
> 
>   - Re-split some of the patches to follow a more logical progression
> 
>   - General cleanup to fit my own taste
> 
> [1] https://lore.kernel.org/r/20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io
> 
> Alyssa Rosenzweig (1):
>   dt-bindings: pci: apple,pcie: Add t6020 compatible string
> 
> Hector Martin (6):
>   PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
>   PCI: apple: Move port PHY registers to their own reg items
>   PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
>   PCI: apple: Use gpiod_set_value_cansleep in probe flow
>   PCI: apple: Abstract register offsets via a SoC-specific structure
>   PCI: apple: Add T602x PCIe support
> 
> Janne Grunau (1):
>   PCI: apple: Set only available ports up
> 
> Marc Zyngier (5):
>   PCI: host-generic: Extract an ecam bridge creation helper from
>     pci_host_common_probe()
>   PCI: ecam: Allow cfg->priv to be pre-populated from the root port
>     device
>   PCI: apple: Move over to standalone probing
>   PCI: apple: Dynamically allocate RID-to_SID bitmap
>   PCI: apple: Move away from INTMSK{SET,CLR} for INTx and private
>     interrupts
> 
>  .../devicetree/bindings/pci/apple,pcie.yaml   |  11 +-
>  drivers/pci/controller/pci-host-common.c      |  24 +-
>  drivers/pci/controller/pcie-apple.c           | 241 +++++++++++++-----
>  drivers/pci/ecam.c                            |   2 +
>  include/linux/pci-ecam.h                      |   2 +
>  5 files changed, 204 insertions(+), 76 deletions(-)

Whole series is
Tested-by: Janne Grunau <j@jannau.net>
on t6020 and t8103 based Apple silicon devices.

ciao
Janne

