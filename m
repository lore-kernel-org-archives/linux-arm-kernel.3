Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEWMadfX6gRIBsdiDZM/nvx45xaj9mO2S11xO6IzFks=; b=aB5yUXG+Qn6l+SqS2lq/0i3JCU
	EmfPHQEDUs69GM7iMVGilTSxhbF82CheH1sPaoKzo9N+iGUJABiEjjqhwJiEr0OWNEY270pvtfzoq
	lm16etCj4x6QHO3LP9/3jjjVsxzjB+biX3wJP5JDtwLqz1NaAZwbi237Ot4bQRYjZlsMWDwJMgTLV
	2q2fhK/9rdawQ1hezqU0gR/WcFcuT0ajFNWj7TujRPwQx+xw8Iy/Xudv63fzzIFm3qgB8WvI7XLth
	bS72SYqczFCAFNn6Hla7aqWGsroMxBOPOYoVP0vM+ILJf2avvmSat/0gilB6vYsYuXgKnrzNe7ksl
	7ElxDryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDly-00000002fG2-3Rix;
	Tue, 22 Jul 2025 14:15:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDBQ-00000002ZFy-1j7m;
	Tue, 22 Jul 2025 13:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E87114372E;
	Tue, 22 Jul 2025 13:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9F3C4CEEB;
	Tue, 22 Jul 2025 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191447;
	bh=ldeVLAYqLGElj4agrBFxudHwOutEqS6Dqz8z/EKBx/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qzwu8WvUnCoSWHubicThQ9HH8uBprGz+8IW2608cpnFrZqSMz/vmnaBrYDeEftn+m
	 zwQp+Bucb+LuPRR07EKbVBE3QkO8OZM+vMfJcAp8f73uzehcmUBazjMzvr9FXoxvBw
	 s+qGYizK/NvlJti6vJ3pY6r2Z8FLLjrq1tw8NynObz1e0KoTW+XLDK4xE1VG3yULMb
	 BuaPPGeBWs5vk1E8MNleteL4U4AOHEhRXDUTkYgjo1u/8Lyb8juAP9DyiYuu2wnAH5
	 bz1SZZphEgQbQH7Htnn7IDTGZw5XXzGUvoxzLWNUQio+kmWZuySTAB0vHUo0zviVVU
	 HeiOfVIQ2qd6A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-rockchip@lists.infradead.org, 
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rick wertenbroek <rick.wertenbroek@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
In-Reply-To: <cover.1751322015.git.geraldogabriel@gmail.com>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
Subject: Re: (subset) [RESEND PATCH v9 0/4] PCI: rockchip: Improve driver
 quality
Message-Id: <175319144299.114152.2563260088897607918.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:22 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_063728_479494_A996C0BF 
X-CRM114-Status: UNSURE (   6.42  )
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


On Mon, 30 Jun 2025 19:24:15 -0300, Geraldo Nascimento wrote:
> During a 30-day debugging-run fighting quirky PCIe devices on RK3399
> some quality improvements began to take form and after feedback from
> community they reached more polished state.
> 
> This will ensure maximum chance of retraining to 5.0GT/s, on all four
> lanes and fix async strobe TEST_WRITE disablement. On top of this,
> standard PCIe defines are now used to reference registers from offset
> at Capabilities Register.
> 
> [...]

Applied, thanks!

[3/4] phy: rockchip-pcie: Enable all four lanes if required
      commit: c3fe7071e196e25789ecf90dbc9e8491a98884d7
[4/4] phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal
      commit: 25facbabc3fc33c794ad09d73f73268c0f8cbc7d

Best regards,
-- 
~Vinod



