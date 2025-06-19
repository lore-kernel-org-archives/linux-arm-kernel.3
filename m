Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CCC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnHMo1+jg6P9JCnMkp7dGs1GHwUU6Pgnu2Ui1o4qRv4=; b=TpZZAijtNSwJWteGf/dAU4sTEZ
	UWGeNAvLvHqJVgy7rhyHs6j/r9bZJAf7F6xD2fCASIxCISsqXYRYMPaeG0P2b+NHXMFv+dIio7bgD
	ohl8Nqfhq3I8UN22we1XrzXbYCIb5WywbP1iYD6xPUQrLjZXGEB7rHzufI1rR2xmXMskKoJeb3pvN
	uCf/VggnYPqOB74P6Xdz02+Q1x6Ut68fon/ZK4FwqwysHgtV7aWERyxFAzPszQKmUpURsWX1Y1wgg
	t76GyO0Tt1etCmdnh6HBye80F98SCZ9+KLRPaGufnztPQEPaedHvs3cI9U7IIZc9gO9NCqZHGAWVp
	PkW8PZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVC-0000000DX8c-45sk;
	Thu, 19 Jun 2025 15:48:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEkj-0000000D6Dn-45Yx;
	Thu, 19 Jun 2025 12:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC2E2A54422;
	Thu, 19 Jun 2025 12:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7DAC4CEEA;
	Thu, 19 Jun 2025 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337544;
	bh=p9Kau10uglpH75TFRcHGcWbbB8CHO/pVjhJTQAlCcVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WiOvT/D5zxTuexZvAyuVgsA0F+9yZIE6u3Zgr6ALQOfrvBis0ZINnwvApXTdKxGYW
	 fZKk6eOiHg1g5eXjM2was9KnhC7QWn/uWu7W4B/iCBQiVnr4DQZOLs1hDynZjQD6TM
	 CAE1nSXC4JXZd6ib2Z9TgDbh0sNIgzCEkeHwKy057ffn4QHb//5hyRPQ5tD3WPWtUj
	 P9qQt6MHNnUfO2Fpe7dtRrfVwdGSu9Dx9YBPpgKz40yxJam5kT+gKbYcuWY6px1sCN
	 7FOYfCx0/UhmZ1SO5ekxBLrVkedIho7AZxPMM/AMTMGantP1JoRnYICkQhxPqBhhxR
	 41NflEXNBbfTg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
 shawn.lin@rock-chips.com, heiko@sntech.de, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250607154913.805027-1-18255117159@163.com>
References: <20250607154913.805027-1-18255117159@163.com>
Subject: Re: (subset) [PATCH 0/2] PCI: Consolidate PCIe message routing
 definitions and remove driver-specific duplicates
Message-Id: <175033754020.15449.12159303573503323127.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 18:22:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_055226_086864_0ACC8129 
X-CRM114-Status: UNSURE (   5.97  )
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


On Sat, 07 Jun 2025 23:49:11 +0800, Hans Zhang wrote:
> This series consolidates PCIe message routing definitions into the common
> PCI core header, eliminating redundant enums in the Cadence and Rockchip
> drivers. By using standardized macros (PCIE_MSG_TYPE_R_* and
> PCIE_MSG_CODE_*) from drivers/pci/pci.h, we ensure alignment with the PCIe
> r6.0 specification, reduce code duplication, and improve maintainability
> across the PCI subsystem.
> 
> [...]

Applied, thanks!

[1/2] PCI: cadence: Replace private message routing enums with PCI core definitions
      commit: f28413fe0899591492d8ca3cdf5fd35558d9c05d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


