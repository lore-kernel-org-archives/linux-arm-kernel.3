Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8392C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzvMMd1RbP+1PMa1EVSreCjzq6bOjb6pj1xLI8TnSdM=; b=DQm+9TQrePDzAhFs540eAusN1x
	uKQlKBze905FoRYOpS3hZettwK9FiXdlBcvGHu1QA+/Mv7aN40g8qvY6B/Ey3rJXIgDTJre679zJB
	QL6kr6K50VhnjJq2v0CATXB0FE4dXNbF2MfXEAsAozh0GC/B8xagZRI1XLouH65f/u2uwwbXGJ0dz
	CXm8zYsiVj1KLteVHjCJ6qHM4JHN7wdEcc2UodF0r1aIuMY9E6NE8CBejLOx6II/7K/CWDSWMCe8/
	XwYJICiPUw4u//5s/owAdZEuzLTO5sZNNEAph0Q/3plzypFzhw6B1jqiK54wXLVwYOoU4ITI6XNAn
	pYofG/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmtl-000000069sV-3Ryn;
	Sat, 10 May 2025 16:18:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmpd-000000069Qz-2sCb;
	Sat, 10 May 2025 16:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gzvMMd1RbP+1PMa1EVSreCjzq6bOjb6pj1xLI8TnSdM=; b=iK9LgXZvQtCdnK5F2KPqCb/3bz
	1n3Vmo8ayXMmflM+cKP28NIWloG4eV6x1muqq6jWFZwYQVjO73QoEkJd1F2c2c4zJJHDdlH5YW04K
	DrkJRMsD/3YMG7sYMvs9wC8LUCvGWFUdqhIYlY3eWHV2UZy70AVKQy4AipTVHMf+b3jNL+ThZCunD
	0+lIUNuzPz/XFdm0+GkGOwDnDHpYEv0cqMB+cxW0Mz1AWLIB1XBOt8mA9KNVZGsIXviw8hmuxmbl/
	NOf1ln1pVoeXCkUfmvyDKviPL2penh7JhFhv3uoIO/lr3eHRc+90KbZ2Byxx0j/eY45i9ddpGuA8f
	FB2Dvexw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpa-0000dK-0G; Sat, 10 May 2025 18:13:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
Date: Sat, 10 May 2025 18:13:30 +0200
Message-ID: <174689356067.2086280.9979554984882379307.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250510075248.34006-2-ziyao@disroot.org>
References: <20250510075248.34006-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_091345_723169_C3B88092 
X-CRM114-Status: UNSURE (   7.88  )
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


On Sat, 10 May 2025 07:52:49 +0000, Yao Zi wrote:
> This corrects the type and suppresses sparse warnings about passing
> plain integers as NULL pointer.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
      commit: 61bf658a4d95e8f982b6e66dea763bff57996349

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

