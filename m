Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3656CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd2jDBS6TczwyfapWowGCLfJ2ZDyiWW2nSxP/Qc1jTw=; b=dNmffPX/pAYic2aQjH+BmAoZqv
	+cv5lLQ9Ygzq+lC0marljsMMheN41d5iiqRoU8jzrtI4/V79snticf70SKJ3qiqjhrtTvx2Hk30jA
	X8Cj4Tm8IR+iyriobkwMieNsYD6sJWJ1LMSsRqX/PpwC10eTxkqygGWWv/WXUkANLWyOHnwSV/lIc
	M/fvmEJXjLxpbovMy9hwJJj+yOCgT14DKhZ5FF7G2LS3/NqdgWBQj4biWujFzeGuG561h9tCxsZGN
	JQHkL5xtOwMugGD37NA4Wc8DDdqXyzPQIHXlw2vb8wJBpVPxcQSZSunoRcbkTHUiWxHjbUAwyd7uX
	/bOE/52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxV7-0000000Fz1q-0PsF;
	Mon, 17 Nov 2025 11:34:29 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxV3-0000000Fz0h-32rq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:34:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id F097A13801C1;
	Mon, 17 Nov 2025 06:34:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 06:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763379263;
	 x=1763386463; bh=Fd2jDBS6TczwyfapWowGCLfJ2ZDyiWW2nSxP/Qc1jTw=; b=
	Z8ywHJMH6RJztItXyxhnCdMdrpCnuulEfpshTedUx8fNsXHEt4EuNWlfudMcER9/
	YpdnfwkgNKR7h2UJN1sPVzYzRw7v21vLO9pk55T7rcJMaljpVviGONhEmmZgbiK8
	M7O7eQNMFqOANmFmbtenJnuDfHKEsVukkoB405Ci+2MJ8Ezs0tt6wzqmc77g4BCO
	nXnOXxw2ULDztWr8/w+8EvicEkSj+foP5MpnSlTLfcPdehLwtlv8989/wZjas9p0
	OMekgTgN8lkm39pWSPu7PLP00HOIIwrWcQe6K9qb5OGVKT6QKDh/ml2xZ1Jn/aud
	Teah4O9SbocFkiPdIZyiZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763379263; x=
	1763386463; bh=Fd2jDBS6TczwyfapWowGCLfJ2ZDyiWW2nSxP/Qc1jTw=; b=s
	yD3jK3rNfTS2oDa8ZUhjkAPKYvrSDSH3QepIrxzqgCnOKdlGwmBqb4af47TtRcCH
	dmVieIMQA9uLuPwKU/EPgRQo1oaCIPVR7bniWdqNVk9kyQD1atG2XL6lwQzYRHi4
	6aTa4bVJ25lIvBJRjIVR+Z3r7n8YAYe/LYelS3ZywFRqaxsvXQC43j4WyCFysTr0
	jZi1yBqQDN9kvCK15SqBhj/QHUFhAAnPTqfsju6werXAZ2C41pNo4ruaRDJjgivJ
	k2iGScGhfL3v8RbOeCiORVNJQHcVXztpv9D3x6JecYInZ28PLW4EyMvxlh38IbNI
	UfK//XaFe8rOvvyqlnVTg==
X-ME-Sender: <xms:Pwgbafudna6Sko-cwJ0ae9YtsZ60_dPgSxhFe61mt25fHmyV6vrrUw>
    <xme:PwgbabSZ_h0Srl5kkbHZBMCI_n_AuqCdEP_3X01fZS0JAVAIsrLWklVqBEbZwqWs5
    -DWPXlZy23mC_ojMgu1fOf5BppG7sWvOndZBRuQeHDj55HPlX9kFiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudekfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucfrhhhishhhihhnghdqkffkrfgprhhtucdliedtjedmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffh
    iefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggp
    rhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghhvghlgh
    grrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehkihhshhhonheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhifihhltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhpihgvrhgrlhhishhisehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmrghniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsqdhvrggurghprghllhhisehtih
    drtghomhdprhgtphhtthhopehsrhhksehtihdrtghomh
X-ME-Proxy: <xmx:PwgbaTpFJreT2VJHNLbYE7Whh4s9XfYb_hQQ1SZhEOUv5CR1396G3Q>
    <xmx:PwgbadG5XJb_LDl5dZcgcMRSkvcm3QSc4MXaorMnLdb0ea5r1ml3og>
    <xmx:PwgbaRTpQ3Oon1-T8cqdutDb3ek9gVcremSSU8NL-xtuPzgfL-qndw>
    <xmx:PwgbabOobIF4ndC1xXGnLwC7cuUqVi49wehJ5zsGINBnCGpvvwotRw>
    <xmx:PwgbaYUo0c5N5lyHxB6cAJOcPj63TJR56AKKr-ClAk4QCkoCUv9avjEX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A75EE700054; Mon, 17 Nov 2025 06:34:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARY7ZiTdmDAg
Date: Mon, 17 Nov 2025 12:34:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com
Cc: "Kishon Vijay Abraham I" <kishon@kernel.org>, stable@vger.kernel.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srk@ti.com
Message-Id: <965a2836-050a-4958-af95-ca3b5f9a57ed@app.fastmail.com>
In-Reply-To: <20251117113246.1460644-1-s-vadapalli@ti.com>
References: <20251117113246.1460644-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] PCI: j721e: Add config guards for Cadence Host and Endpoint
 library APIs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033426_181938_81E439F0 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, Nov 17, 2025, at 12:32, Siddharth Vadapalli wrote:
> Commit under Fixes enabled loadable module support for the driver under
> the assumption that it shall be the sole user of the Cadence Host and
> Endpoint library APIs. This assumption guarantees that we won't end up
> in a case where the driver is built-in and the library support is built
> as a loadable module.
>
> With the introduction of [1], this assumption is no longer valid. The
> SG2042 driver could be built as a loadable module, implying that the
> Cadence Host library is also selected as a loadable module. However, the
> pci-j721e.c driver could be built-in as indicated by CONFIG_PCI_J721E=y
> due to which the Cadence Endpoint library is built-in. Despite the
> library drivers being built as specified by their respective consumers,
> since the 'pci-j721e.c' driver has references to the Cadence Host
> library APIs as well, we run into a build error as reported at [0].
>
> Fix this by adding config guards as a temporary workaround. The proper
> fix is to split the 'pci-j721e.c' driver into independent Host and
> Endpoint drivers as aligned at [2].
>
> Fixes: a2790bf81f0f ("PCI: j721e: Add support to build as a loadable 
> module")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202511111705.MZ7ls8Hm-lkp@intel.com/
> Cc: <stable@vger.kernel.org>
> [0]: https://lore.kernel.org/r/202511111705.MZ7ls8Hm-lkp@intel.com/
> [1]: commit 1c72774df028 ("PCI: sg2042: Add Sophgo SG2042 PCIe driver")
> [2]: 
> https://lore.kernel.org/r/37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

