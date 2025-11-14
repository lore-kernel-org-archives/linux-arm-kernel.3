Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D69CDE019
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9e6FQJYDBsPl1jkD3novF2T5qQ3BDazY3CfaJMvju8=; b=uYGRYanPGmPT/UlAOSk433pj/6
	EsnSipyKGkDb4OkIrjELUpsbQJBpnvRd4j0wSgNNayJYcU1YRkWl8YhnDJ6O9jDnae9Wi2rr18kX/
	ReTX2YW9XAwYL4jJW42OsOnTDGc27KlZ3OySTp45z7REYkQEp8EeDdNdZeIJ8zKDxujVzTWymMsCp
	iPfpHufL1VufZ2bnXzqpX/NfwI9JypOTMJNAwVZm4IBm0gj52oGELVvkUKagTNGDvtbW0az9G6EEo
	49q9d6003IbHdDSeAMixnHUOAQyNxgVEBR3yBTJwfPkW2wNGcnHhYH1VCiKDB8frQPvIXTrCUQktT
	PJseW7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnqE-0000000Bi7r-2I5h;
	Fri, 14 Nov 2025 07:03:30 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnqC-0000000Bi7V-0RTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:03:29 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A0A797A013D;
	Fri, 14 Nov 2025 02:03:25 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 14 Nov 2025 02:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763103805;
	 x=1763190205; bh=+9e6FQJYDBsPl1jkD3novF2T5qQ3BDazY3CfaJMvju8=; b=
	Kkr8BUxqPGK1Z3+4BpwkcXn5eWZ9hMKOCWH9VvtuOl+T5CZniYPcirw4hz4KbzdQ
	GKsbIF3vOFzTZntkQ6NCK/rtrMeAMNRe3j5OUq9xExIihhTwc3Z/qRom3f8tL3yS
	7n2V4faSNEDFfp/ujiH3LAvBsSEziqCvB2Rf++cCpMXwi+2OnPSN9NwwtHrT3YYW
	Wz0ea1xFFlEXs3HBXsI9GRf7hXxIOlfP3v7G46WAjSqJVOZJary7yua61l1Afuaj
	0qYzD+bxLzOZnEc+QWoEm2VXAp8kvLkMR/gXCROlc91RF47RX6WrFjoRjiv9CFZq
	qG3sIpCL8ks0PqG32b3rtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763103805; x=
	1763190205; bh=+9e6FQJYDBsPl1jkD3novF2T5qQ3BDazY3CfaJMvju8=; b=V
	qrKIJLkCU7Mup7XIDF1GPVKKA5HtwWZ8hfI1GSxMH389tPz/7C6xyCWjp3gvQEDZ
	foJS+VzCfYF2PT0hBwbTr4KUYAlAO0HaEExLkiyAHoKg10wDZoFKMsbFFoj114Dc
	5Wity2sFlDERE1MOMPiMQZZJR0VhsYMMxYofbe8ltLdnxvvvqoqswy/wRopAjq68
	N9WQnOW/dayWEX5etQkEAVT+sYVCJ6olEbiIJX6T10NXQDNao54wMcsP6krVnCrc
	aeXE/f5cr2JL/yezBvx2EWoH0EuaefrGUHPI98nKSWvaIr5711lWo8X/2prxgu5K
	y4g+Fa6yM8jYn6zirN7Fw==
X-ME-Sender: <xms:PNQWacaVLBgC9nNxAwigGX5Drf_gq_HI7fBsev8LJN1HNxR62q6Ygg>
    <xme:PNQWaSN9ovvEr8UNpipQJTb-Tytj75m2UJODHaIoQWt_WNoGL43TEbXLsZ-HG9x7t
    0j-cAa8b-NsPptu3MkCZOWxBU6FuCLfPHKLizBNIb53mu5cfuCk_4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeludejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epkhhishhhohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkfihilhgtiiihnhhs
    khhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    uhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepshdqvh
    gruggrphgrlhhlihesthhirdgtohhm
X-ME-Proxy: <xmx:PNQWaXUUidTCGn64MDLMVcH47OvgeHBQFXeYoNhlQ4GbuQwTL4iPsg>
    <xmx:PNQWaUwbGym5csyq4rlEQA7cA_CwvSknjLXJiP2xEfbGuENE6u-Uvg>
    <xmx:PNQWaWxviwxkJ9-dMGWL06UcV7Ck3G16huzVzBcb5QYNJk0HI3Oxmw>
    <xmx:PNQWaR24J5sgWpWmsX9owMhMU2_lhQL0E23a1XmsLbzraobsEovf6w>
    <xmx:PdQWafCtN7VisKCATc9zZ-SqIK6ihquremM1SW5EHRJqIbo3FQZzl7kE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE6DB700054; Fri, 14 Nov 2025 02:03:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AO4N9SNPwumV
Date: Fri, 14 Nov 2025 08:03:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com, "Chen Wang" <unicorn_wang@outlook.com>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>
Cc: stable@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srk@ti.com
Message-Id: <201b9ad1-3ebd-4992-acdd-925d2e357d22@app.fastmail.com>
In-Reply-To: <250d2b94d5785e70530200e00c1f0f46fde4311b.camel@ti.com>
References: <20251113092721.3757387-1-s-vadapalli@ti.com>
 <084b804f-2999-4f8d-8372-43cfbf0c0d28@app.fastmail.com>
 <250d2b94d5785e70530200e00c1f0f46fde4311b.camel@ti.com>
Subject: Re: [PATCH] PCI: cadence: Kconfig: change PCIE_CADENCE configs from tristate
 to bool
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_230328_676849_99CE3BC7 
X-CRM114-Status: GOOD (  19.00  )
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

On Fri, Nov 14, 2025, at 06:47, Siddharth Vadapalli wrote:
> On Thu, 2025-11-13 at 11:13 +0100, Arnd Bergmann wrote:
>> On Thu, Nov 13, 2025, at 10:27, Siddharth Vadapalli wrote:

> Thank you for the suggestion. I think that the following Makefile changes
> will be sufficient and Kconfig doesn't need to be modified:
>
> diff --git a/drivers/pci/controller/cadence/Makefile
> b/drivers/pci/controller/cadence/Makefile
> index 5e23f8539ecc..1a97c9b249b8 100644
> --- a/drivers/pci/controller/cadence/Makefile
> +++ b/drivers/pci/controller/cadence/Makefile
> @@ -4,4 +4,6 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
>  obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
>  obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
>  obj-$(CONFIG_PCI_J721E) += pci-j721e.o
> +pci_j721e-y := pci-j721e.o pcie-cadence.o
>  obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
> +pci_sg2042_host-y := pci-sg2042.o pcie-cadence.o
>
> If either of PCI_J721E or SG2042_HOST is selected as a built-in module,
> then pcie-cadence-host.c, pcie-cadence-ep.c and pcie-cadence.c drivers will
> be built-in. If both PCI_J721E and SG2042_HOST are selected as loadable
> modules, only then the library drivers will be enabled as loadable modules.
>
> Please let me know what you think.

I don't think that the version above does what you want,
this would build the pcie-cadence.o file into three separate
modules and break in additional ways if a subset of them are
built-in.

I would still suggest combining pcie-cadence{,-ep,-host}.o into
one module that is used by the other drivers, as that would address
the build failure you are observing.

An alternative would be to change the pcie-j721e.c file to only
reference the host portion if host support is enabled for this
driver.

      Arnd

