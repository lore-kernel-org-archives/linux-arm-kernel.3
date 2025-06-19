Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44FBC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS3/0Obn1tCJg9dRBmwYk1vUrdqkX61uQsX1jTcyh2o=; b=JtPU0c7cLUHobQIxmp2pWmIFiO
	43+FpjIDJWj1HdKGLJKgXRk5nrZxvuqpmsQhoyIj8K0pArhrTe0AAoOCbQ58du7S3ahw+kZolBcW8
	y1neddtgS3iJBmPYaphF8ea/4hxN1+3XQPekHU/S1XcOapV1zMTR9Dd14otoV4LCj/5SuWg6jUQCT
	mvE2uEHp7Qqzjm5kXbwsU74X00QfH6C/KXWSxKBKi7uUo/slv/cM6LfQTfIn9jWbXammy+/MXnDqv
	xgjgmzraRdmOhTf19QjJ9ETaNAR14kU8HAgVplWeh6tejPtJjD1WXTWqZTq0bWBTsefO9sER9Atct
	k7WS4lzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIec-0000000Delb-3O7k;
	Thu, 19 Jun 2025 17:02:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEoH-0000000D6dB-2Wf1;
	Thu, 19 Jun 2025 12:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46A1F5C677A;
	Thu, 19 Jun 2025 12:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC06DC4CEEA;
	Thu, 19 Jun 2025 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337764;
	bh=61z3Z9ZUMVuGadXMmxoys/sL/Hu56s62dGvdkITuqjY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W3OMvFyJJlwm4NWv+4YydZ9uOtxHp04NLHXzOaghRPApC1xVT88UHNPr+Nw4Zv2tS
	 HXYoZns4xPKpwyaiVZfZIqh0KlCyxBvRUEFBgecPNPowT9v9g9baPxFbKFrCfe3BLR
	 MHWzNIE+JG7UeaQh7U92F6O/RcdqC5T6PM2QP0eMkSX2h/k1kIw2jHstyjAo2FBiLO
	 XArxqHEsabqTVdpJf/+TCjOa9ajuvlqiN1z7V6965tFRuDFKYwXWJEfhEnbLIHu52r
	 NhWZ1j+66E/2418KS6turkmp032w1yXfdzjTtD0bMny0Yv8F9fcgEvdqqqY4uwQJ5k
	 5Htx57H4CZl2Q==
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
Message-Id: <175033776037.16241.1043152602736525633.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 18:26:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_055605_682578_611AFCA7 
X-CRM114-Status: UNSURE (   5.77  )
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

[2/2] PCI: rockchip: Remove redundant PCIe message routing definitions
      commit: 1a69c63fdf1c9095e132096081e27ac85a4d48a5

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


