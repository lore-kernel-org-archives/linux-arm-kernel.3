Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCUyq1t9PFZgckeEh2UmVsmqiX6UGwoQrNP63wl6J2Q=; b=XO2mzoOguJA1re8ec2oaNsFO+/
	2fu8yT4pp4ayUaE4VLGqcOZpDbzD0jja5DHMr+tDKUmiuChZXFd0wLneGafoJeqHmGh9ujFhdAR5Z
	WEFDZizfuGefSHmtpv+pHUdOTyN/Lsme6DwYUGYLfzYGq0m8foxq1DsbYtvY+O8l9IEd8WEJjZrza
	pj5zblx1LdK5d40EKKpX78zH+5/4alQMTLpU+gCP1AD7yhtxB1FIjrZIMU546LOQE8ePf/NJEMmT5
	IJMaY94uvQH1yrgyhy47gfWJjTCwu95UQsKnmF2IWKmoYyWiD/WFbb/yvt6Rw+rvUr/VjVgsIHXEb
	TKltvdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDst-00000001Vlb-3e6K;
	Mon, 14 Jul 2025 07:45:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDVC-00000001SHo-3GaH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 07:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B21EAA5359B;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B96C4CEED;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 57F2B5FB60;
	Mon, 14 Jul 2025 15:21:26 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20250704154008.3463257-1-paulk@sys-base.io>
References: <20250704154008.3463257-1-paulk@sys-base.io>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
Message-Id: <175247768623.1732129.17411169356635975497.b4-ty@csie.org>
Date: Mon, 14 Jul 2025 15:21:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_002130_883652_1BD5FB92 
X-CRM114-Status: UNSURE (   8.73  )
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

On Fri, 04 Jul 2025 17:40:07 +0200, Paul Kocialkowski wrote:
> The de clock is marked with CLK_SET_RATE_PARENT, which is really not
> necessary (as confirmed from experimentation) and significantly
> restricts flexibility for other clocks using the same parent.
> 
> In addition the source selection (parent) field is marked as using
> 2 bits, when it the documentation reports that it uses 3.
> 
> [...]

Applied to sunxi/clk-for-6.17 in local tree, thanks!

[1/2] clk: sunxi-ng: v3s: Fix de clock definition
      commit: e8ab346f9907a1a3aa2f0e5decf849925c06ae2e
[2/2] clk: sunxi-ng: v3s: Assign the de and tcon clocks to the video pll
      commit: ea879ce83d360aa13acd54cf6af913885b69ed44

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


