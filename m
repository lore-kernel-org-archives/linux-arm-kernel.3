Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A98EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2pizfwQKoKGdOMNPF3BacZFLWH5qaDvaOE2TTeK/ok=; b=qJ+Moy8gWTQHuL
	JkrQ7p2sLRE+WhlFkAybVp6EGST0Mos6QN4AP3tQoWY6PhrIFiQIGJOsbOBqb2Fi6LEuC0lF+Pvl/
	C0zHI+mLZprqNQhpJ73SowGZ/p1tAmSmxQVtDZ2Khesj8iAzihnVq0HFY1EsIBnFqyQccO5eAY5gC
	Fv7mcejCPmhtVXsFaZLtuEanT2ru+5N9GpDawDGsSZhI49e4SCV8vv6DUhJfAwqqVGXnxgXJlrNgh
	ATDLHMDVpFsz4N/RdBUU27DSOzip4OO/HO/ej93qYNKJu6SinacN/Fg0aGDR3F9vYewwONSz02r/a
	uIrO390eyxnuvxUErUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKxP-0000000ECtu-1KhT;
	Mon, 28 Jul 2025 10:19:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKut-0000000ECWJ-2snP;
	Mon, 28 Jul 2025 10:17:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 533254329B;
	Mon, 28 Jul 2025 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2pizfwQKoKGdOMNPF3BacZFLWH5qaDvaOE2TTeK/ok=;
	b=Zkjm2shC8dNPGEV/0FDraPI/Gg1TM6vzU4y67mQAQKjGs7GIW7cMATKaDnPj+LMlVvAL5v
	AnhlTFDspYEHISwt70asIz8Bb6M+QkY5nqza3mta+yabDsmRBIpV4GUUeUu5wty2XFvzKg
	V+lNpJfKQwIPfp+QwGVBLhGf1EJ99eXxPTitG73IkgBtfPEnOAQgqYBViXdQDnagnJzkw9
	lJ9BFClJWot2fPgP2LTnwTSf1c3JD9gLDrPuNDT7cGzVCUqlQ6/30uZtZPmFhSolXVugiB
	exNfyxDXBiOPsSQW1YY7ulGIE0acjFwrsheLnC7oLFBSnndJrUhmfxFwYmXQvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 dan.carpenter@linaro.org, bbrezillon@kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
In-Reply-To: <20250721104340.113581-1-balamanikandan.gunasundar@microchip.com>
References: <20250721104340.113581-1-balamanikandan.gunasundar@microchip.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: set pmecc data setup time
Message-Id: <175369782927.102528.5580599335079355284.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrghlrghmrghnihhkrghnuggrnhdrghhunhgrshhunhgurghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtu
 higohhnrdguvghvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprggumhhinheshhhifhhiphhhihhlvgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_031711_858140_EDFC93AF 
X-CRM114-Status: UNSURE (   4.46  )
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
Cc: Zixun LI <admin@hifiphile.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jul 2025 16:13:40 +0530, Balamanikandan Gunasundar wrote:
> Setup the pmecc data setup time as 3 clock cycles for 133MHz as recommended
> by the datasheet.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: set pmecc data setup time
      commit: c115e7ed66f0dc6cf96f9bf3e3c46f6c44aa531b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


