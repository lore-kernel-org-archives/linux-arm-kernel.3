Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E1C36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DbBpT5ksuKL/buj5hAG4kbqD8UivY6Cxj/Q4quYXhU=; b=ZEczQPOjypeN8RitW61CW0AWHI
	NBc3EriB5iUxp3XpfdWd+NUx5h9st+nLG4Ekw3C/xXEMhjLk0g6CJjZz9aF4SgpnmIiaGi2RUJn9O
	I3Mly9VBgzs5/yb9mGizb0kkTqXL/WHnvysCgmfcBdRWvRJPaxZWcrMo383+35A+WvuEn/GYR1ALO
	gIUR02Q2uxzg9/w9+n2835q6zMUJkaJx2PJBq85Ua7/QBrN+kF5zm4mAKDEEEIIIhHCZ83TBpfgTi
	WBLY1yyd9SF+K495adchDxlRLlYFGUUm+QX2gxjkxhg+AaPYCCisScSNXKB/zOtaNudhGy3OjkYNF
	57M1VnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzASF-0000000HM0a-0raM;
	Mon, 31 Mar 2025 08:25:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAOD-0000000HL2p-2DGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D00E5A43033;
	Mon, 31 Mar 2025 08:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8CCC4CEE3;
	Mon, 31 Mar 2025 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409260;
	bh=h4jDZiKUQ6uMigFCCJI6gh8GJJR+wHZwPFP6HF66PY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tktUFjVHZ1FEfiJoozniwdYr4yIJQGkvVmy758gtpmIiJtXkvNMV9KQBC0kUtdFky
	 +LQVx9OPYKjrhV8Yp7I+ciVp0bmHgRC7BFnUNB8LJBKye/Tza6+oM3RDmRnMFh7d28
	 ZeTyzIZNCx0pCh/O7cMzo4rCejkvv0mTo45kLxVvjcCPhBnPJJ23wpAoIhSUBIRRD8
	 DFhdKvchgA+x/LbtuvogWFkNn6xAMZa2kDfM4Gpf9BblfPQKBsk6mGBqfLHUXgDa12
	 UYX3zIYIubF9kiUmQVOmJKDCFT4S5k7sA5aeWUlrxLwvUFiHpXI/AVl4jTp7HUA6UP
	 KTJT9q+ugahnQ==
Date: Mon, 31 Mar 2025 10:20:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: soc: renesas: Document Renesas R-Car
 V4H Sparrow Hawk board support
Message-ID: <20250331-visionary-precious-wildebeest-f3aefc@krzk-bin>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <20250330195715.332106-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330195715.332106-4-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_012101_631015_9EB922DD 
X-CRM114-Status: UNSURE (   8.10  )
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

On Sun, Mar 30, 2025 at 09:56:11PM +0200, Marek Vasut wrote:
> Document Renesas R-Car V4H Sparrow Hawk board based on R-Car V4H ES3.0
> (R8A779G3) SoC. This is a single-board computer with single gigabit ethernet,
> DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports,
> micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD,
> debug UART and JTAG.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


