Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07367CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLOE9Rfkp1vQlbK9fEjf+tQ41byNIr8OGyt9qbtQP8U=; b=1opD4pdXsyV4Mp7hcCP6aTwGO3
	h8kJkXsK8airzOoEiVtLq4npstWP2ls58PdDZpG3caJTLy0EzQvWZ7eJUhr8CKJDI5DOdbe4ez1Ln
	sepLqEoZnT+irM00MU50nQnDTA/3XeFPU+zWIvbszWSr6mqSUznzGLC4TBZh9ID60qNTZaj82EQx8
	sBBzILznDuvxS+Kx2Po6QlBt8ypWMXelVDlAgdWEHoyoxIYcQqaUpm4uoWYzal3dWedni/ANKRllb
	8Sk/bIEE5aT/W5qEoJuWpL8k3EjAgIgnvI1srnALjV8elGn4QJ7h0hZMcwKDwwHkD2UFZz6njOjXd
	hWUyb0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1hb-0000000FWkE-1pZD;
	Tue, 21 Oct 2025 02:02:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1hZ-0000000FWjj-460W;
	Tue, 21 Oct 2025 02:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B80A4458D;
	Tue, 21 Oct 2025 02:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C187C4CEFB;
	Tue, 21 Oct 2025 02:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761012137;
	bh=TRQYyxs7TnyIhaiMb8D95ZijpF7uVPE/ggwWxM/U7eM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YLy1mWPvG5DR6ktlfj0FdnbLK0ptkdNbUqQsBCBH4a2s9UT/2khvcyGjKdvlql9v6
	 uf1TPwdjz7XTejtsN1CXKvFMOBJ4X77+LGf12zEjrqVRrrs7vRV4udw4MF0qSKeBJ8
	 P6kOFqlN3iijLhGcoxp34zgZjWo+c3eWzP43UpA2fuUMA4vHvcgQBfLcoxNFnpfOqH
	 LTW8eQ7ywb3N7nB6PU1ctPgw+GQYGaruvcrkxXpl9Xch5ioQJ09TPM9SMmUXRDY4O5
	 sgW5vY+YHZZBu8H9RPCnyRsg0XG7WFEvpas1SZHuc8RrOalGz+TgT9Iz9YFurgFORU
	 T6FkVfZQXl0ww==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20251020111121.31779-1-ansuelsmth@gmail.com>
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 0/5] PCI: mediatek: add support AN7583 + YAML rework
Message-Id: <176101212970.8564.11599336217062076445.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 07:32:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_190218_063775_C8B8A948 
X-CRM114-Status: GOOD (  10.91  )
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


On Mon, 20 Oct 2025 13:11:04 +0200, Christian Marangi wrote:
> This little series convert the PCIe GEN2 Documentation to YAML schema
> and adds support for Airoha AN7583 GEN2 PCIe Controller.
> 
> Changes v6:
> - Flags -> quirks
> - Align commit title to previous titles
> - Drop redundant comment for PCIE_T_PVPERL_MS
> - Drop DT merged patch
> - Add Review tag from Rob
> Changes v5:
> - Drop redudant entry from AN7583 patch
> - Fix YAML error for AN7583 patch (sorry)
> Changes v4:
> - Additional fix/improvement for YAML conversion
> - Add review tag
> - Fix wording on hifsys patch
> - Rework PCI driver to flags and improve PBus logic
> Changes v3:
> - Rework patch 1 to drop syscon compatible
> Changes v2:
> - Add cover letter
> - Describe skip_pcie_rstb variable
> - Fix hifsys schema (missing syscon)
> - Address comments on the YAML schema for PCIe GEN2
> - Keep alphabetical order for AN7583
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: PCI: mediatek: Convert to YAML schema
      commit: 99f988953f07484a2c4801c1d3493282f60effd8
[2/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
      commit: 6d55d5a7f34b04b3a55dd90a6c3cea5a686e089f
[3/5] PCI: mediatek: Convert bool to single quirks entry and bitmap
      commit: 04305367fab7ec9c98eeba315ad09c8b20abce93
[4/5] PCI: mediatek: Use generic MACRO for TPVPERL delay
      commit: 2d58bc777728bfc37aa35dce7b90e72296cceb9f
[5/5] PCI: mediatek: Add support for Airoha AN7583 SoC
      commit: 09150ab1a7d204e8d03edb286f906c8d55168644

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


