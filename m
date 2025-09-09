Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57710CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vseebvsaX+4ykmAm+Rjmp49wWD3yYYVws8Gla8rQKI=; b=EkLC9rwy7gtWPBIF/CQbxXySfr
	2hq7kHaSYlvWofmAtAJygPh7sJMIDXFdgdyksn92TiWaVXZ410HfUVvw1MUa4ZgN7uOemOCe7u0YG
	H74HvasCKbS152x3hO1MMlKlzr2mYu4KdRxjF/N2X1lbGrT+ELWj7WFlZfHzgf8jREnPonJuBOzzW
	76bg8V3NxuIAg3f7zMQMcFTfu93h9F+Xmzw0bHjvmpyHGg5icwYmM0VixwzjB996cGHDiBB8gT4S2
	oCeKrKjKUEGFK8dh95I7uDe8rlrtN5SKgXxshdVR1JXEJovPqcqQowqH3dSWjBW/C/DmyG1nF6xzF
	fM/qR2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtN2-00000005R5j-1Jai;
	Tue, 09 Sep 2025 08:06:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmWS-00000003JJm-0AfR;
	Tue, 09 Sep 2025 00:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B61C94012D;
	Tue,  9 Sep 2025 00:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692AFC4CEF1;
	Tue,  9 Sep 2025 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757378867;
	bh=zy06io68iOVZYCgiZwnvNmFkyT+ulKg9fSvGqjcKcN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFvbb6HnpVHha2QYxeYIX0bkE+3dooJdy12p2Y1WtCqf+8KJ2KHtE8W/upyI42rJq
	 W/bR3/vsaW/Yk6P2f5oIysRasonAGlc4I9+H8t0TDGRUpXjqdhrZIXpv4CAcE9/fDe
	 I/x9x+Sam2B7yFFYLzM0HLaPcTnawzik3KVS05svRPTW26kcYZU1V0zZ414hoytHqW
	 iSKhYPWLpHvp2ZHT/0mlk/0I5lEfE1y5myFH79/klACkDgPJIiyL3Ftb8lm7NRNK1a
	 RRcmX/+pgIEtlIzsfGQOsSfAHeFJ4tdTWzI+rr0N/sV9gnAt1sCOm1i8LQAowH65eA
	 +20GqpgsNGG4w==
Date: Mon, 8 Sep 2025 19:47:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>, Simon Xue <xxm@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
Message-ID: <175737886558.2322312.14140565713141816216.robh@kernel.org>
References: <20250906135246.19398-1-ziyao@disroot.org>
 <20250906135246.19398-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906135246.19398-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174748_097671_421D8082 
X-CRM114-Status: GOOD (  12.74  )
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


On Sat, 06 Sep 2025 13:52:44 +0000, Yao Zi wrote:
> RK3528 ships a PCIe Gen2x1 controller that operates in RC mode only.
> Since the SoC has no separate MSI controller, the one integrated in the
> DWC PCIe IP must be used, and thus its interrupt scheme is similar to
> variants found in RK3562 and RK3576.
> 
> Older BSP code claimed its integrated MSI controller supports only 8
> MSIs[1], but this has been changed in newer BSP[2] and testing proves
> the controller works correctly with more than 8 MSIs allocated,
> suggesting the controller should be compatible with the RK3568 variant.
> Let's document its compatible string.
> 
> Link: https://github.com/rockchip-linux/kernel/blob/792a7d4273a5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L1610-L1613 # [1]
> Link: https://github.com/rockchip-linux/kernel/blob/1ba51b059f25/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L904-L906 # [2]
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


