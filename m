Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C50E7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cM00d+Y/1yCdK5xX+ktUTEcxZvDZyp+X3nPniyY1jTA=; b=lDzatBGDGjYO5xqy+2y12DJklS
	U9vh8GK586xZdkdpJwo3iLZUBcOCIdztxAF5XJYhk0taUE6TaYC7sHCT31UAXjXs3LVonliBBPQdJ
	wAwclLofm5dyOZm3yrTqSZ58SyJKAe0pGYtWcunDbWsnOn1TfxXktkLUYvZIdNjfVKlakj2sHC66M
	DRWNlAM294xe6vdGHpt6xyThEH2lBQaoLIpjHv+GqkzAxq/gbmfsssQA38XMjTryhSPhrBivffUh7
	jIe4Md/C/rDDfG40Inl1r0pausHp5nJQhBDhWU8eSMSC/K590oykEvy7Yu2C9u9dOaB1SdztbUXmq
	9waPKIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0J-00000000flG-3ZNa;
	Thu, 25 Dec 2025 20:32:11 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0G-00000000fkT-48vd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 20:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694725; bh=S0w/9HqFtCT6W5zDOTTgsmPCo9lfguBHpwSfKLUfdJs=;
	h=From:To:Cc:Subject:Date:From;
	b=UAaPN5xiTvJ9HroIYPvn97wsctUoA/OwpX2AsS/NUt+jFyv5kXqbU77U6MG5ZUNrw
	 OEeGLfol6vFIqjlrOBNcc8Tw3WvfDzEa3H9x5njAqLBTlHjx0/p4PG8MpCXc9p1Fl/
	 xqtKt5uti422d0xsk7UE+HPyuLIJAd5szdZrCHMmTwVqF9s8Uy3H6SpInl7/1aLYhT
	 SfK9ETLkVrpzMJqZjzjKPfn8k9X1UYnqqUNPNz06jhU2XjQ2QDGLORkgqX1RMBzEqt
	 MqHxrpkhZL7tN4dhsMJg9OLpGGlzzUcFQYOYIr3ZQk1AKY+Z6GBfK5za/5ih/xqcF/
	 +UpXI5716QZzA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 00D033E8C62;
	Thu, 25 Dec 2025 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694724; bh=S0w/9HqFtCT6W5zDOTTgsmPCo9lfguBHpwSfKLUfdJs=;
	h=From:To:Cc:Subject:Date:From;
	b=LagQb2C10K9s2pP0uLaeeEF3oKdAbR8W1aNr4h3SMiRtx3UHNGa/HLJGBZZq5y3gb
	 SDjsxPYLdEQ/AbaWVhCCihHcswnURei8pOSAz/LJpTMC3jSxt9QvK7mGg9Hg2igWGz
	 mNxvLifqD5CNGzcN3OmVw76s6YJmCZTuXuSm2AXV73luVC+ILAjUAzsq2+NhztProH
	 Z0AagjstdaGbfpeLVXgWgr1ntBmfBf0WcvSmcG/LtpLuZ9vCahtmNTQdKP2SGdka/X
	 P0chX0tQxwmLE5agKWgVincqas/+oa863WK0JkB+QwU5xeuyQc/+TvqRKBzy+cYb+/
	 fg6v1TRRFipEg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 7ABC13E8B7A;
	Thu, 25 Dec 2025 20:32:04 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND 0/2] ARM: dts: lpc32xx: set DMA and NAND flash controller properties
Date: Thu, 25 Dec 2025 22:31:55 +0200
Message-ID: <20251225203157.1414349-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251225_203205_018990_3B04BD54 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20251225_203205_018990_3B04BD54': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_203205_018990_3B04BD54 
X-CRM114-Status: GOOD (  11.81  )
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

The changeset adds a numbed of necessary properties to ARM PrimeCell
PL080 DMA controller and to SLC and MLC NAND flash controllers, and now
it obsoletes the platform data of the controllers populated on boot.

To respect any probable users who does not update dtb on the boards,
the platform data cannot be removed instantly, but now it's time to
declare one year timeout for such a synchronization to be completed,
the platform data of DMA and NAND flash controllers will be removed by
the end of the next year.

The changeset is based on top of the previously sent changes:
* https://lore.kernel.org/linux-arm-kernel/20251224165845.1261926-1-vz@mleia.com

Note, the changeset is marked as the resent one, it's identical to the one
https://lore.kernel.org/linux-devicetree/20251225180230.1400420-1-vz@mleia.com/
but now the changeset appears on the linux-arm-kernel mailing list as well.

Vladimir Zapolskiy (2):
  ARM: dts: lpc32xx: add DMA controller properties to the device tree node
  ARM: dts: lpc32xx: add DMA properties to NAND flash controllers

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.43.0


