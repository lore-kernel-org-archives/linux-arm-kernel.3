Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB4E91297
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZxEJxikMpWZELZXNMUhqu+ZPA8fmT6IbLMviGWKku4=; b=PvtMvnceMRovFW8cfPxN2Lrd0q
	eMtr3U5occjLlbMqS4jzSqPUOnZf3nzKne+syvN5iaTaPcAdWBbiJIafy2IvIgRRF+1uRVaCctkcV
	Zvx1/I/AsCWqN4633+87kR66itqytZd++8yk4YdPu3ZHk4jq8+CaWw+xQGkrmyoTDPmysenggE8GD
	13lr8ZjrSaTnpdkIoHW/GwotZP/5ZIUAnf6/Y2rhlbaJn5fvtk1307a21vWT8dDh9RkiUXDgARITF
	KGrhLXRN0DlzPbbQkHuF9i5OcjE+86w5kQYMCxp9w8hkJXzT6QG0yuUJlCeVb3a+2kVWSzoE8vVgd
	IE1iCS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvBw-00000009e5C-45BH;
	Thu, 05 Feb 2026 08:58:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvBu-00000009e4a-3YOw;
	Thu, 05 Feb 2026 08:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 707FF43CF5;
	Thu,  5 Feb 2026 08:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EBAC4CEF7;
	Thu,  5 Feb 2026 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281902;
	bh=vEzXCJoRBGkhhZKBFWIH4fhYfwPKyl9r9lvIYdyhKiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZGrsfJDGPjlUvn2ynhz01H4syPE8Eq7ODg7Kmdm/Gbe0Ni/Xxpzf/JSUTvazBpTO
	 BvrFckaeowWBMv4PtddX9mUBUrcZwUSjQdAvNZ8+MrWx79QNHoUub6aTJFzA4JKm7H
	 eEiM622zW7+H/x7kXZU2HlwXFLAVdR4/h/GTZi9N8s0zR2IWV41ss5NFCprcZVcP5J
	 UGD7p6qMP9pQvepu/RVkQY99qjZvSEAGmXPH1HMzkxd2X/sG1CtPa42uSSxKOoWKap
	 56dEbqUHNCP3gZLwLq221QW9beRFj1Pe92hF+cXyhJuG5DOafFUeKxrgxmwWQBGMI+
	 Ln2vcvW9gv/yQ==
Date: Thu, 5 Feb 2026 09:58:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
Message-ID: <20260205-intrepid-vengeful-deer-14e2eb@quoll>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_005822_902166_0C7006BF 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, Feb 05, 2026 at 02:07:18PM +0800, Ryan Chen wrote:
> This series replaces the existing AST2700 interrupt controller binding
> and driver. The original implementation was focused on a narrow,
> PSP-centric view and could not fully describe the complexity of the
> AST2700 interrupt fabric:
> 
> * It was focused primarily on the perspective of the Primary Service
>   Processor (PSP).
> * It could not handle interrupt route configuration.
> * It could not handle interrupt register protection.
> 
> By contrast, the new bindings and drivers describe the interrupt
> controllers at the block-function level and provide a unified binding
> design that can be used from the perspective of any of the four
> integrated processors (the Primary, Secondary and Tertiary Service
> Processors, and the Boot MCU):

Where and how did you address last feedback given to you here:

https://lore.kernel.org/all/20250814-auspicious-thundering-jaybird-b76f4f@kuoka/

"This binding is not improving. You are not responding to REAL problems
described to you. What's more, you send it in a way making our life
difficult, look:"

So how did you make our life easier now?

Best regards,
Krzysztof


