Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0966C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DQgYYb1ZjZuVQhAXZ9Dw/wcVAeEIHHr3UiudwMdPGk=; b=e5TNWw1Sy5Sf3T7FSHbu8tc6hF
	CsEnMJAAZNxPvSBextNUcKYiEcqfB87KMwpFEYdXT1fQCN9uQD8j2nZTNHC22s9Do2i/mWlqR4YSg
	JiRZef/jUAEuFO5PN1ZT90CyrvzMYjhveiDl9wHToSl1/vx67JTE4NQRZZqmkawVlm/GXa4yKaDe3
	rupNrfhcfn1NLS2zUWDFmfFyQIXvERB1katt0Cm7I9sAk4jbAGPb5MIY/rGczxTtkrL7/zM/wIBjB
	gZ5A+UNCxK3rMRCtgsfuMmkBwK2Q/3KfJNd3Xg03XZ/PREcg0Go708IbWPk207a2FzfeFt9QUHVFf
	8oWjD1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoKB-00000002TsC-3fwA;
	Thu, 09 Jul 2026 12:57:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoKA-00000002TrZ-0ncI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BCE7600C3;
	Thu,  9 Jul 2026 12:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8821F000E9;
	Thu,  9 Jul 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601873;
	bh=6DQgYYb1ZjZuVQhAXZ9Dw/wcVAeEIHHr3UiudwMdPGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DbUXba24IANCw5itvm9+nGmYdLx9BDhyRI/sKjsmf/gDasQUJooWjWCVeo/JahFTO
	 Um5lOTXnY0vxU8XdKkvqeQkTodddTGnHSuVQ4FqPKOnmgAw3PK8o6dTHM5t4lrOIaM
	 nJDQ5c4CG27BsXc3cMgokIWbo27OjAZiHc+MzDBP/CHooI+hC4xNo34Vt0Pwz+ljBC
	 osSaHNrpzwdNi1hwWHcFAvb6xm0NDUhXL7M/fae6icEksWzCu1i+jkn0YRFQWc7Dzm
	 N9c9sHC/V6jAO0YBn7b5JoZByz9+p3QfxOc3sWkMKRvEI6rmhvZIq6/52wk6Zbjw4l
	 sgz13zoTARMQQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
Subject: Re: (subset) [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle
 GIC ITS
Message-Id: <178360186732.755595.3582150626313807959.b4-ty@b4>
Date: Thu, 09 Jul 2026 14:57:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Tue, 07 Jul 2026 22:35:38 +0200, Marek Vasut wrote:
> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> case MSI are enabled and disabled.
> 
> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> configured to 32-bit address width for AXI or APB interface.
> 
> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> implementation cacheable and shareable limitations.
> 
> [...]

Applied, thanks!

[3/5] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
      commit: 96b193897fd374fcb63a782c52f8b079134d0222
[4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
      commit: 14e8394423ffd4fd28884ec8b4d5ba15be6e7e0d

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



