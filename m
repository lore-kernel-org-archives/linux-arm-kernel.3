Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CC0E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRqobVnYrGRNcf6aQbCt2qWebh3po6t+kuT7+TFcF7c=; b=Ipx74G2eEZvplFruiWEmIEaQkH
	J6aRmUB42g0/O2fvC7CWga132fdRPtnnLl+rZnnSrByMkOogbG4gz9qwAzZ/4DFg+Fc0FmnvldzHO
	2nigKWlP8I12AUZz9PKjW++9qpTUU1r/NuzqwwAS0oVcgA72n2CdTefUrHa5JkG5hOMpcJ66YFQ3r
	ks7iIGkS1szhxqrrQdLi2+8/8hG3ltQ/IgEYM52G+NozKCiMZcH2v8j6iyjp89qC44sILc6yOXMJ0
	Jq6PJ71abdF9pEIvGBgQi2VuWlqOJGSAcC5QEb4myjaGf+uMI+so+Km6fzhYVmAIeVAoPXfokaSI9
	thO/5Spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CFS-00000009ZPq-11uh;
	Sat, 02 Nov 2024 11:24:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CDn-00000009ZLJ-2WFh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32C0D5C0118;
	Sat,  2 Nov 2024 11:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E0FC4CEC3;
	Sat,  2 Nov 2024 11:23:10 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 588075F9F2;
	Sat,  2 Nov 2024 19:23:07 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20241001105016.1068558-1-andre.przywara@arm.com>
References: <20241001105016.1068558-1-andre.przywara@arm.com>
Subject: Re: [PATCH] clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
Message-Id: <173054658731.55569.4149254473608981743.b4-ty@csie.org>
Date: Sat, 02 Nov 2024 19:23:07 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_042311_717645_6D5D4E0A 
X-CRM114-Status: UNSURE (   8.14  )
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

On Tue, 01 Oct 2024 11:50:16 +0100, Andre Przywara wrote:
> To work around a limitation in our clock modelling, we try to force two
> bits in the AUDIO0 PLL to 0, in the CCU probe routine.
> However the ~ operator only applies to the first expression, and does
> not cover the second bit, so we end up clearing only bit 1.
> 
> Group the bit-ORing with parentheses, to make it both clearer to read
> and actually correct.
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
      commit: e0f253a52ccee3cf3eb987e99756e20c68a1aac9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


