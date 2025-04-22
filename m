Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3399C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh3TOfjfjJtUvON3fbrchsnqfDrRlyCdWG8ags+8rQM=; b=yerwK3g21bEjFhxjBDDLmiz/8A
	vF3/qYgB/nH0n/H+SB6xr4dFC3a4bd1cNhi+dAvtAYkSqkLILJ97ZMkZs5IFw68RPAgDlcrYBCD3q
	vX64WuqUU/pfr5pQTQiL1nyBvg9vk3xMUbSbSTLd3cM49tnDklQUSxYMDjb5ytEu+BTAbYfd6p+Jt
	t5InmtBMJz+kw4NLZUnkaEhIqkaQz6f541C/U4k4EyKEi28uuyVheOsmyDe+EQRimb5izygOYA+po
	Fa/3TSv/vgUGf+DvlTxWuCRRdkL4EO+34Zg7pFKVR+yD7BzrfIrsmNJZRopdq77tUp1JNBUTJu+F+
	N/UnS7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9n-000000087hK-28GK;
	Tue, 22 Apr 2025 18:15:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FsV-00000007nSY-0DP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:49:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645A943B46;
	Tue, 22 Apr 2025 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745336979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh3TOfjfjJtUvON3fbrchsnqfDrRlyCdWG8ags+8rQM=;
	b=Gr4x62qVWVJAZOqxoX06AnZysciGvSzFdSjOhSqxWDVbTqMV3wEPeM8pJOQb/10fNgs+si
	0W7YhwBA4ilB5Sf0PRqfH9opH8lhnhU6wWYmn2qhGX/6tF0cGySV0BVYC4CVSULmXeiU6X
	gIDGrw3ckqcCGZdlz08ChE5MRZkKGI3mpziwQvDZaQuXOl1fzQ3i/Yb1OVSlRxMxuvb9sp
	vyQAyeSpZHSeJ7SndnFO7nQ06vCF3H+Xe3NSRPvmSE35nq1G3gtbQnEcWMdBAjmFOf8zUl
	31ad9KcVgBAAppNYiHbTaJxPx48CMed1UcF9jPVYLKVvPQiE4rcXJublK+/SUA==
Date: Tue, 22 Apr 2025 17:49:34 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis Lothore <alexis.lothore@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net 1/2] net: stmmac: fix dwmac1000 ptp timestamp status
 offset
Message-ID: <20250422174934.309a1309@fedora.home>
In-Reply-To: <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
	<20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghml
 hhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_084943_713096_DADFFA62 
X-CRM114-Status: GOOD (  14.16  )
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

Hi Alexis,

On Tue, 22 Apr 2025 17:07:22 +0200
Alexis Lothore <alexis.lothore@bootlin.com> wrote:

> When a PTP interrupt occurs, the driver accesses the wrong offset to
> learn about the number of available snapshots in the FIFO for dwmac1000:
> it should be accessing bits 29..25, while it is currently reading bits
> 19..16 (those are bits about the auxiliary triggers which have generated
> the timestamps). As a consequence, it does not compute correctly the
> number of available snapshots, and so possibly do not generate the
> corresponding clock events if the bogus value ends up being 0.
> 
> Fix clock events generation by reading the correct bits in the timestamp
> register for dwmac1000.
> 
> Fixes: 19b93bbb20eb ("net: stmmac: Introduce dwmac1000 timestamping operations")

Looks like the commit hash is wrong, should be :

477c3e1f6363 ("net: stmmac: Introduce dwmac1000 timestamping operations")

Other than that I agree with the change, these offset are the right
ones, thanks...

With the Fixes tag fixed,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


