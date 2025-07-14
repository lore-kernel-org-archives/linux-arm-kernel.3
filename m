Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MO/GFqgIz7AdPvjjhkE5dewHSOwJ1svG8yj0j7LFimU=; b=HfBrYgC5GrMZNlk6pLwg4kffbR
	MQ9+N0CpHnNFk/BhSjApRkNNASaEL0kIpCQMbboagXeqAXiyf7/7HDgStkKi2yQehxYvpZaNQB/Cj
	et0v7w4i0bxNQtrX5NiCwtz0/nO1cUsc+I88Wxr2Mfi62X3BhF4UVRI4UN57nYibMR47U2TZR6d0c
	90iprf201omXEHpexL1Prx5MKY0q9J4yaUBrc3cT/awBwif59Brg5Y/8dR6wUGGzKC4FzGvPPEcVN
	aPL1bqsMg6xSrIn9xI7Qr+N0m8mdmT02vGnOS68RjOwzSKZwDIAEDSjD8JEIBdqJdb8p/9jLMRilq
	VjQBcE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLws-00000002p3J-1Q3Q;
	Mon, 14 Jul 2025 16:22:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnj-00000002aI0-1Bei;
	Mon, 14 Jul 2025 15:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MO/GFqgIz7AdPvjjhkE5dewHSOwJ1svG8yj0j7LFimU=; b=QFEuyuOrACawpU+/f0Tnh7yfLG
	EgSElknPA5oLZJXaIgdAwkMBVff/BXn8IBcNKpbPgseKARlNkaaOK4IfDQCIVFu/Y9wTExiOSYfWH
	hCBiFzl+9cuK5NKxZwnsyXswGTzxlYfY3S67ssXqUpFUVSuaO6R4DBSAsiMnketHWWdO/qwYGN7KD
	orPJ73pCI3c85ybT0nuSaQhAdycQYvHSOX2ZNbmApE9ezt1LxvH8TzOzNsX6Uq5OVlM64eLUAHVRM
	zZAW8nor9xYXJ44uMfZZI2ivHfY2IBg4ynE+yO6a8ZILk6qLfJyfou7XYUaPlcC+WZx2NzbHdDXDq
	YT6LV0nQ==;
Received: from i53875a13.versanet.de ([83.135.90.19] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubKng-0000lL-Vb; Mon, 14 Jul 2025 17:09:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Kochetkov <al.kochet@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: rockchip: fix kernel hang during smp initialization
Date: Mon, 14 Jul 2025 17:08:55 +0200
Message-ID: <175250559795.2450518.6205508340787184365.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703140453.1273027-1-al.kochet@gmail.com>
References: <20250703140453.1273027-1-al.kochet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080907_390471_A5B7AF7C 
X-CRM114-Status: GOOD (  12.46  )
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


On Thu, 03 Jul 2025 17:04:53 +0300, Alexander Kochetkov wrote:
> In order to bring up secondary CPUs main CPU write trampoline
> code to SRAM. The trampoline code is written while secondary
> CPUs are powered on (at least that true for RK3188 CPU).
> Sometimes that leads to kernel hang. Probably because secondary
> CPU execute trampoline code while kernel doesn't expect.
> 
> The patch moves SRAM initialization step to the point where all
> secondary CPUs are powered down.
> 
> [...]

Applied, thanks!

Gave this a spin on rk3066 + rk3188 + (not-A9) rk3288.
Both the affected SoCs as well as the rk3288 booted fine.


[1/1] ARM: rockchip: fix kernel hang during smp initialization
      commit: 7cdb433bb44cdc87dc5260cdf15bf03cc1cd1814

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

