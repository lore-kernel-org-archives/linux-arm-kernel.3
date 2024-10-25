Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F1D149C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMZ+UK73DYYTQQBBqkcFDtM8QKQqBMAsMVhQrZip9y4=; b=J+vVAZBrXbQCHE/dDwhvHu4DDD
	qrBOX8p+C4djRYy2Jh9tfsLojHe8gXAdPTJ2d8HsI2N6moZ1oc8+ecomUWhBXM2c1POA77eE1o16m
	25tWHpdPYAKfKJ0SLVFykOc1rNHRS/HZYwl+2MhdV7x+xbM62Zcqw28aYnYFPU85d+YwosXpOj4Zy
	WniWCvSOAUUbEarE69D9BB3fy0x4ueGo01RxWw4UYmHJW//h4WNLvYdC6rTCMAYLpuCMG6rwahsuN
	xIwXTToowfAKZgYQZ4FMir5/H5/5Bo23b/JZNkmZ5d2PD7qPortfIxQBiBV4Q2XxaHhx0JkZohZNZ
	lxOgHiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MxD-00000004NH5-0S94;
	Fri, 25 Oct 2024 16:14:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mv3-00000004Mtx-2Qv8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77DB4A43800;
	Fri, 25 Oct 2024 16:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F7FC4CEC3;
	Fri, 25 Oct 2024 16:12:08 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C90575F870;
	Sat, 26 Oct 2024 00:12:05 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <44745f27034fa670605cd16966a39b7fe88fe5a6.1726863905.git.christophe.jaillet@wanadoo.fr>
References: <44745f27034fa670605cd16966a39b7fe88fe5a6.1726863905.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: sunxi-ng: Constify struct ccu_reset_map
Message-Id: <172987272580.802486.16073827596015670054.b4-ty@csie.org>
Date: Sat, 26 Oct 2024 00:12:05 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091213_480647_CEE40012 
X-CRM114-Status: UNSURE (   7.55  )
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

On Fri, 20 Sep 2024 22:25:24 +0200, Christophe JAILLET wrote:
> 'struct ccu_reset_map' are not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    1533	   2224	      0	   3757	    ead	drivers/clk/sunxi-ng/ccu-sun20i-d1-r.o
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: Constify struct ccu_reset_map
      commit: c7e09a613bbddd0eea086e475855aba3b2410148

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


