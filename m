Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA55C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyTyL7nV8S475VzgVeCI3Zg9b5IdVPULm93NK9VbPqc=; b=DRC+P6HQtq+I65nzng4C+OMQf1
	LqfuCa1/DAovIfzQshsWnGWwzPuaok/c+M2WnV5iXxLgP39xlqcUwCCAq/fOlFnpnPTuT4MDpLwRD
	4PF+3caykwyw5qZbZ91iUWgFbkiJjhxRuMbKuKJ9t85RPHI/i2hTKMD7P83DL//Vir10ehSQYjG3W
	trEeGQHohmYJrWtfMfWl+KWWyDA4mLSTOJqAPGgt+iekNwGzy/NF6xp7lvJjkC+pbSrS7RSxE1aGY
	l/jrEAhcj862QNbGn2ieT2/xuOGeR52ZFZUkGMu3HA1QBSzP8Idab4ILTFRg0WdFa+zn7PAHrGQ5a
	WqRPtfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVma-00000009kRg-3K19;
	Wed, 25 Jun 2025 19:27:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQKJ-00000008prJ-2jQh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5A78A52548;
	Wed, 25 Jun 2025 13:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D721C4CEEA;
	Wed, 25 Jun 2025 13:38:10 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id EDAF45FB4D;
	Wed, 25 Jun 2025 21:38:07 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
Subject: Re: [PATCH 0/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0
 reset
Message-Id: <175085868792.1673542.16405302707690855377.b4-ty@csie.org>
Date: Wed, 25 Jun 2025 21:38:07 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_063811_766485_F3B11025 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, 20 Jun 2025 01:10:23 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600
> registers are accessed.
> 
> [...]

Applied to sunxi/clk-for-6.17 in local tree, thanks!

[1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
      commit: 61977ccf6568f9d104462727b49412a80c22c519
[2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
      commit: c17b1b6c86059664e91008a23547ef0aadfc2228

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


