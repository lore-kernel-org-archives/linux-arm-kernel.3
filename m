Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1EDC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 02:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kF1jCJXQPGQnKzu7bfD8o9+bY/4lVV7oKw9/3UQFts=; b=45onMaHklm7kwIUnHdXGPpzomX
	7W3gStyannBaO2jlGGQDV9eQFt1oetyLdPU9yJayjDZB5FjUts8f7/o1vBe49hcvhYu0XfnyhsV7S
	EWLeqPqu2ywFgYW4mKNQAzFK91vSikRAKKVlMnaPj1ErY54E2tc9ryVjr2Bej5Kt3GJHJzzjfrOvn
	PNRwEIKvd6tSwkkorbGqYA/bJYOxfx3lkZA71lCTyTO+ywWrdNUAcnTq4yZZ9ANzqoxSLiOYm9Nuv
	Czs099hOXylCTQyfVdvJHwBkKpu/YR1zfvm39iRbnjdOmuN3jAVybHnPRVVu1z88wxRO6aXJA1b3Y
	pdPaqh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0q5-0000000H9wP-1LOB;
	Mon, 28 Sep 2026 02:11:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0q3-0000000H9wF-1j1h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 02:11:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AF2160052;
	Mon, 28 Sep 2026 02:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DA61F000FF;
	Mon, 28 Sep 2026 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790561490;
	bh=7kF1jCJXQPGQnKzu7bfD8o9+bY/4lVV7oKw9/3UQFts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lD32weZR6knzm+bzjW07TKW4uUzlE9c8JSNykjhVCxOI9mpkJWRvp/ByDzjVJLxCz
	 VOzGBJTndO6dGdiSbml8QobTchASjXCEOmXfJd/w5d/oUr3+63Ff0A0dFJiAhpo8xC
	 XbdqbMao0sfy3G7w4NwTYCwOpcEjdrnL2Ik+o4HPalEwak/zfaLemjkZgX+RIb4udy
	 jgB4aD74zV57ZSxCGUnBjZBCAmNZ92rkRvrJx+sEfejJ99PryiO77cK68IiH8wZrDA
	 HgWsKgud/tLLpL8ocjQ8piQRUJu85UHm7wtGXvM0ghZspRLtA62DwU+4nc9u2fK2AK
	 G1lt6lan3S3Nw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>
Cc: thomas.petazzoni@bootlin.com, pali@kernel.org, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260910221725.91980-1-mhun512@gmail.com>
References: <20260910221725.91980-1-mhun512@gmail.com>
Subject: Re: [PATCH] PCI: aardvark: Disable PHY on probe failures
Message-Id: <179056148593.292653.12177941977002115273.b4-ty@b4>
Date: Mon, 28 Sep 2026 04:11:25 +0200
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


On Thu, 10 Sep 2026 18:17:25 -0400, Myeonghun Pak wrote:
> advk_pcie_setup_phy() initializes and powers on the PHY before the
> emulated bridge and IRQ domains are created.  If any of those later
> initialization steps or pci_host_probe() fails, probe returns without
> powering off or exiting the PHY.
> 
> Replace the direct returns with staged cleanup labels.  Remove IRQ
> domains in reverse order, release the emulated bridge allocation only
> after successful initialization, and disable the PHY on every failure
> after advk_pcie_setup_phy() succeeds.  A setup_phy() failure still
> returns directly, so its partial internal cleanup is not repeated.
> 
> [...]

Applied, thanks!

[1/1] PCI: aardvark: Disable PHY on probe failures
      commit: 28cc5bc5a6c6cffbe7ba27c0acbfbe06747fa173

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



