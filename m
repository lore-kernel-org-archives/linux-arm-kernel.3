Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD8EC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85XrHWG9Jv3VTDn16FMltpEf586hn4QJABtiSR/Wwvs=; b=iCows0vooH8WVypv9ysOGJkNph
	RFqBhESmySFgeOvjhK81/VEFt+j7j3XyXlR7twXydKHXDrAD6MBXf6fDS73NVs2LN1axFNVRovQCK
	YO5+NSh9jS+jEVT1gQM4hioCVvnbAbMZvakrSuN8zHGNvtOIoUWm6LIcJrAEHAmjA5iQPnyrEoMJy
	vJPprHhkfic9FM16hA5NRYLhHWLDxeSHn40fkfKw3zyrgrjv8ZA96mpd/acWXooiELh/I34sz+b8D
	6NDmlqCCfrmBqMXh8w9PW5ewUEbyA9hV5sEFx2SwkmCrJwIkcjFo7PxK9zwmQYD8O3Mo0wnhIzqHG
	gTTSJN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFaR-00000002yxP-0MX1;
	Tue, 22 Jul 2025 16:11:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEun-00000002sCl-2kMO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:28:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753198104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=85XrHWG9Jv3VTDn16FMltpEf586hn4QJABtiSR/Wwvs=;
	b=PVcXdh0a6fdgzThlV2t988DT7q7CAo1ZE4pfVnd2r9kJnW0ZZzKeSQR/7lZYqzfG9szsKY
	e5ri3xfR+DlYoP9g3JymbTygs+bX/evN+HtDtQaaFUyOUvtUlT2sggNJE7l17DW2+QLt8h
	FKCnMJKvY5nQeUVwhvrBhP+jpERaMqtvJZM3kY4fn07vLLVBVSfkKVzlbeflEVDutThOiZ
	Iv6/lU7GlnbZW9xi1iRbeowXeEpdGscP28u8aiB3VaP4v/carXHeZMTBMls64E4/Ba/yc5
	OOPRDAgpqPKgz/f6+2o40R9HUN2hD6N5A3Ty9OiSWR/nJO+xPTJKMRZLLc2fYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753198104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=85XrHWG9Jv3VTDn16FMltpEf586hn4QJABtiSR/Wwvs=;
	b=2aMI2TLLvKRpRzdAWE6LR5GQ+UaMV1YrI5ZndoTpBlbt7m2b4vzw6/NttvrmH/VtNLuDzL
	j2RFiW2PS4UfWyAg==
To: Ryan Chen <ryan_chen@aspeedtech.com>, ryan_chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kevin Chen <kevin_chen@aspeedtech.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: aspeed: Add
 parent node compatibles and refine documentation
In-Reply-To: <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
References: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
 <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
Date: Tue, 22 Jul 2025 17:28:23 +0200
Message-ID: <87zfcws0rs.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_082825_833856_481DC24D 
X-CRM114-Status: UNSURE (   6.79  )
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

On Tue, Jul 22 2025 at 17:51, Ryan Chen wrote:
> -        interrupt-controller@12101b00 {
> -            compatible = "aspeed,ast2700-intc-ic";
> -            reg = <0 0x12101b00 0 0x10>;
> -            #interrupt-cells = <2>;
> -            interrupt-controller;
> -            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +        intc1_0: interrupt-controller@100 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0x0 0x100 0x0 0x10>;

I doubt that the controller base address is at 0x100 ...

