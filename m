Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86600CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DN86s2IdRRyJNXclGrEm4t78z5nyQ6310zLXbM0epQ=; b=iAQ4soeX3SBt1//44xeqb2O0Yv
	pB7Nt5h+YvNXylqX24MO0SRC1c7W6GMk8A/96cosFLDVaH6dhxQhhEVeW/OAIDxswOZInegY5DjNv
	11/e4qldjPRel5v0dudlyOdnZ3Gsnv9QO1l5XhoLRO24XnrJTJILgiqIXHg/DBfu7M+Dko7Z7iSfk
	V0+FGKY8QlHeqD3A8dwT93oICst7VoUCK+Xmp+ERy5wbw5XCoGgtXhH0beiiNz/URJocv9d0q6t0Y
	z/gUXZ+uZFhBi/PsXd7wN17TyM6o981/KBfyowbUluiVD0qZt7kzYsye4stpxLxdZIIgATZJNYGWw
	htir2bMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFtn-00000003v15-46dV;
	Sun, 21 Jun 2026 10:59:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFtn-00000003v0z-0CTa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 10:59:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EB2A43D06;
	Sun, 21 Jun 2026 10:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C681F000E9;
	Sun, 21 Jun 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782039574;
	bh=2DN86s2IdRRyJNXclGrEm4t78z5nyQ6310zLXbM0epQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k0oH0xG0fSGdxdDmWKkVeDot0QA2oBIXsev45gW1JceuvKrZtboYrQ8YJfHAGC11G
	 E8bkJSI93plEii+DTl7869YyAJtXWgwqpP6bu2Z9ICf4QFUZ882CQcBCWjn0CcQoEW
	 RFj+6pLa6vBufrhwzuE633GimQOnb8Rq5jDagmjMBhuI05rNvijxGODSPYLY3nrlE4
	 Cu5qr28VZV/NdscIFUKxY7tkBlaxPAPOf+FdiXmO7eHL2S3zUc66d/m4B76DP97JUp
	 8JjtRF5ahmOrfCjZkQnms2tliC+Y42LL3TQ10mFnHt8oO5vs0wshlvfO9esQIc9/sf
	 96gExsWsABYVA==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
In-Reply-To: <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
Date: Sun, 21 Jun 2026 12:59:30 +0200
Message-ID: <87cxxkma5p.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jun 19 2026 at 00:02, Marek Vasut wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> The quirk is keyed on the combination of the GIC implementation
> and the platform identification in the device tree.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

This SOB chain is broken.

