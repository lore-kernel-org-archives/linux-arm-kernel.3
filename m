Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC2DC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jqkf/xmXMG626Sp6o0dlFmeme4EWTOoXOFtKz0prEI=; b=uRxJUgSzndlJjN/Ysbg22wl0ua
	6t7VGH3wwNYYlbWUUf6TpBL19yOU7Dhu6q3QomT4WdXw2wka/f3eqX4cF+O9YVL51yLW6YVjhupYv
	I1xQ3+ME1vZI1pyxFfTh1IPsQncSah4LuSK2Xw8GsyUFJrtYymTGk2dSxgCJl3buq2jFkVPUUv9D9
	l9hm4SA1ZRgVo36wGVqCaYokJ4o3Lq1Bv9Ynd/JGPbX4OxCushJfP6P8sU4Et+gVK4l+6L+WdwOx8
	g9Nkmm4gTImZTY9oU5VN9akoNW2T5ZjgR4GIxE7k3B1mP4C3/L7agpKAHb/pzBZkfBSme4DAw7OU6
	xoMq5tcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCW-000000067h0-31t2;
	Tue, 08 Jul 2025 17:33:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBmT-000000063Ul-0P9X;
	Tue, 08 Jul 2025 17:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C77C74459C;
	Tue,  8 Jul 2025 17:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6E6C4CEED;
	Tue,  8 Jul 2025 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994416;
	bh=aN2zG4WBE2tdLsmAtJ1Di+Fs/pqbZFINDwPFccXvSjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZ63kEo0NHPfeLjS52LdMC+jgOkd0Df5w5RMkKTgq7i5MWxNREoySR9j1ru+KoQG5
	 EUKZHH4HzzZcsNZtr8Y9qJKnOeqP1tBjg4IqCe+AFiVKvfGHYvHJTbYwhCqjVe2cz6
	 QcXdqkehTu51WSl3j0ic5v+kB9grgRuDgLGOh6K8Zgm9ywYBEpMKASrUggYQAFM4b0
	 2WOjtnesy1WSszA6aRPdjPHCTN0fOVxUO+au8spZ21w+U5arsyoN+ZR0w/SixORqML
	 d+7OKDjQBd0DrXRIC9ZynsimrOvhR4pZiIQrppZ3tW3nWugy86haZSFb+NEi/mIA9v
	 8JGKL4UFMjoEw==
Date: Tue, 8 Jul 2025 12:06:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Cyril Brulebois <kibi@debian.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	jim2101024@gmail.com, Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
Message-ID: <175199441442.637518.17583955334373827745.robh@kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-2-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703215314.3971473-2-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_100657_152678_7A57270C 
X-CRM114-Status: UNSURE (   8.14  )
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


On Thu, 03 Jul 2025 17:53:11 -0400, Jim Quinlan wrote:
> Adds BCM74110, a Broadcom SetTop box ARM64 based SoC.  Its
> inbound window may be set to any size, unlike previous STB
> SoCs whose inbound window size must be a power of two.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


