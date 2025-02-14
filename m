Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB777C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ot/U0rj7AjLXdTPURko3iQfzZWRcX9ROb8t1MMYesPo=; b=tvuzyxcBt6YWeNtD3kSNxDTOKA
	8dQsGyqHmwZtCn44DnAUilyTlgF7NVgtU13pwHuSkpN6eHCTDgRwG8CRR6XnKbsY7zJ+p7mW/GgEd
	Tk1yRA2bsboiv/HBDtoW8fKnfUspXuJyctUBoSdrrqtSU0bJixGOofAeov67SwGMi+3fMbe8sPv9Z
	o2LRFggzNdSLDY1+4R+yWhK5Kn4nDpG34W5sPrnLPh+Sf8c7noZOl6dA3Qgx4xuul8bWzSBcw+Bix
	HsaZSfV1+uFUkHne+cJ+fXSXQ9rO/WypA5nXlyO1nhkVaEES+0MYAO27hFfM8Zm+47Tnzh2g3tIt9
	iOkpglpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisv9-0000000EV0Q-3wMt;
	Fri, 14 Feb 2025 10:27:43 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisth-0000000EUiQ-3z9i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:26:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D14E4318F;
	Fri, 14 Feb 2025 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739528768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ot/U0rj7AjLXdTPURko3iQfzZWRcX9ROb8t1MMYesPo=;
	b=HwRizPo+AV2PGQ0di1k8IKzzHx6SI2EzhZ4S1S6EembbF0x2nqHiVinjIcLFV8bE1coHIR
	5zKkvH1DlOY9+asV6MojPz8jV/hiiPP60ICJcmxLnweTuZJUZbTXBa/FM0OWJk8es4Iehi
	a4EgWgMcYkO9hkFgTHGJUZ4W9wt2X5SnIgfyMdT8Yv6HuqEd7DFkWhegrnFBTfwvSgoTXW
	op5OSD1oYmP8ygpu1W+GPGF+KLFI9pZ+vbdFiD8ZVSEmpi6arMd2xG5MIMipk7YEe2f+vE
	sB6NkOpIm9qr+hxOr/672oEaiF72E9ryR8duv287Ao1nWbvGIVfT94pIbgZfEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-renesas-soc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Fix UART dma channel
 order
In-Reply-To: <bcb604ad6e567de4e0410756ba840c82a32ff7d3.1739525488.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Fri, 14 Feb 2025 10:42:03 +0100")
References: <cover.1739525488.git.geert+renesas@glider.be>
	<bcb604ad6e567de4e0410756ba840c82a32ff7d3.1739525488.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 11:26:06 +0100
Message-ID: <87o6z4q0u9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdevhffgtdfhhefggeeftdeiffduiedtgffftddutdehteejhfevieelveegveetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledvrddukeegrdelkedrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdduieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_022614_433618_1714A0BE 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On 14/02/2025 at 10:42:03 +01, Geert Uytterhoeven <geert+renesas@glider.be>=
 wrote:

> make dtbs_check:
>
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000:=
 dma-names:0: 'tx' was expected
> 	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-ua=
rt.yaml#
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000:=
 dma-names:1: 'rx' was expected
> 	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-ua=
rt.yaml#
>     ...
>
> The DT bindings specify a fixed order of the channels in the dmas and
> dma-names properties, while the Linux driver does not care.
> Get rid of the warnings by changing the order in the DTS to match the
> bindings.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ouh, crap, indeed this needs fixing.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks
Miqu=C3=A8l

