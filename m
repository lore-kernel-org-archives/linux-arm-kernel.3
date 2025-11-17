Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EBECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO+HprFxowvXbocpvtAlTvfgsKxJ9kwRQfs+WUVErPM=; b=VZxX86WV49ajwKtaIhf+Ax4YPV
	o6IZ8jy649RlOWrRwwVqjoknTOayVkeg/FOETuedKc8cP6iJe3p4hYdGSbwHEqAygqv4n/hunD65d
	6+s7mONqvDyRqGV4GfCiKy3InyKXfIDXiGdkmCZAIINbyMxtjUYkv3RuvFwQVSsOtuw/Ngg3qngi2
	nDXbEzKmxqGTuEZfXQt1EFf+cu3aMbqyhkcvvW/iIPQu+O3TUuQHcntRAQWM+Rm4Z8COFp5Mkz2pN
	7+17icoWRq2AFp38jNtJ/+CqaF0EzJfWnnIOFV7ynxFZ/JTkB8bBCPNFTfqcF+tebEbA0KufeIWdw
	qjoAYr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvDT-0000000FkdA-1UXQ;
	Mon, 17 Nov 2025 09:08:07 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvDQ-0000000FkcI-26zf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:08:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2FC731400138;
	Mon, 17 Nov 2025 04:08:03 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 04:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763370483;
	 x=1763456883; bh=PO+HprFxowvXbocpvtAlTvfgsKxJ9kwRQfs+WUVErPM=; b=
	pl1Mou2a8h7kYUp3llgfzWaQkTkptKjNgKWve02MAli3WV7Yy+zFFzUiMVV55q8C
	Gp9sO5auj0GBfNeNQSZFd45BmUjMqTPIEr/60m1CKIQny8PWwO/CiplylIBhEwxK
	KPLSfkD5eEfxClT7Prcdsw5IzdArD3ReYb+bPpp3S7lYVqy5zAWZpp8JUxmhA1Yq
	8jmkklnrt4xxtxWsvzZvuhtvWKGes3TQJUzguU4fIPMWnipTK/d6D6EYlr0Qp+Hy
	bYHDTu2OduDkeTL/JPGJfLIHNPvG1IMBj2vGL/S+ywoodvbh5FlyeYK3K9bgS1dl
	p/SP3CP2uWErMGLKjHavyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763370483; x=
	1763456883; bh=PO+HprFxowvXbocpvtAlTvfgsKxJ9kwRQfs+WUVErPM=; b=g
	tUVWTtWQ9suuL5LE40z44bT+w2Tc0tk/1HmA3x9NuY7ziwGlRqlDman8J8F+71vg
	cJjaFHJwUtsw3qZFyN26JF6jMgwp31QPsqVrNdgbjXK2/6jgC0wwOeWJpNQFivE/
	HNvR4jVkAzHAutI9LXVQf+DqiG76fwr0PweuF+MT8xQ2vx+wQw3yZRr7UF+kUQV1
	Xg8iyh9qRWPxSxPwtDx9mNzu92I62pxTQ0lNapNUJ/ICsMWWAfyo//0yAFCDRDet
	fs6QP2t2z+xOWIxUVzhiLWKDzIKAadJiuiK86z7wKnz0KY3UwoNfAZKfPITmz8CB
	M4IPzbNXf9ffR8J+y8BdQ==
X-ME-Sender: <xms:8uUaaUo3h4NKJxokYbYGzN1po5V5t6oJllHAQTC1H277R2Kv3GeaKA>
    <xme:8uUaaVfaBXz5BBBqyxYdy3U_GsM1p8yCymviuTaYLY2gksVrVsmVRFbKV2JdtG4Pi
    qve-MD0bAgnWxMFJdbNGD6ldAB329EE_UMjPDMSOqID6Rcp06-5MlH5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudektdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:8uUaaXkPpeIadKJMvzQsGDBOWh1Tjcyb_HYNz-fc5QIn_5I_yTtsIA>
    <xmx:8-UaaQCUOi64x4mS4xdvxIWltUmj6-C2bwKXVe8MKvDIl17qfISE1Q>
    <xmx:8-UaaRCMU9_LSXcsRQbaYW2jNnFweHe2YeZWhDYIUnZBMUItkuS2VA>
    <xmx:8-UaafFBR8Oni9HUqk8SYx1FY8THGzhwWa1NMngIWtX0bbzWGBCJDw>
    <xmx:8-UaafQesAiugEDtRmw1jUGiKcTBd3esQoZhIahysN1L032ZoLvjuIN3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF8F9700063; Mon, 17 Nov 2025 04:08:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AO4N9SNPwumV
Date: Mon, 17 Nov 2025 10:06:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com, "Chen Wang" <unicorn_wang@outlook.com>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, stable@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
Message-Id: <37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com>
In-Reply-To: <7eaa4d917f7639913838abd4fd64ae8fe73a8cfc.camel@ti.com>
References: <20251113092721.3757387-1-s-vadapalli@ti.com>
 <084b804f-2999-4f8d-8372-43cfbf0c0d28@app.fastmail.com>
 <250d2b94d5785e70530200e00c1f0f46fde4311b.camel@ti.com>
 <201b9ad1-3ebd-4992-acdd-925d2e357d22@app.fastmail.com>
 <7eaa4d917f7639913838abd4fd64ae8fe73a8cfc.camel@ti.com>
Subject: Re: [PATCH] PCI: cadence: Kconfig: change PCIE_CADENCE configs from tristate
 to bool
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010804_620064_391AE121 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Nov 17, 2025, at 07:05, Siddharth Vadapalli wrote:
> On Fri, 2025-11-14 at 08:03 +0100, Arnd Bergmann wrote:
>> On Fri, Nov 14, 2025, at 06:47, Siddharth Vadapalli wrote:

> I understand that the solution should be fixing the pci-j721e.c driver
> rather than updating Kconfig or Makefile. Thank you for the feedback. I
> will update the pci-j721e.c driver to handle the case that is triggering
> the build error.

Ok, thanks!

I think a single if(IS_ENABLED(CONFIG_PCI_J721E_HOST)) check
is probably enough to avoid the link failure

--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -669,7 +669,8 @@ static void j721e_pcie_remove(struct platform_device *pdev)
        struct cdns_pcie_ep *ep;
        struct cdns_pcie_rc *rc;
 
-       if (pcie->mode == PCI_MODE_RC) {
+       if (IS_ENABLED(CONFIG_PCI_J721E_HOST) &&
+           pcie->mode == PCI_MODE_RC) {
                rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
                cdns_pcie_host_disable(rc);


but you may want to split it up further to get better dead
code elimination and prevent similar bugs from reappearing when
another call gets added without this type of check.

If you split j721e_pcie_driver into a host and an ep driver
structure with their own probe/remove callbacks, you can
move the IS_ENABLED() check all the way into module_init()
function.

     Arnd

