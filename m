Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zltGFf/iswHLioFD+7yrHPrDgYZxBlcwDu6SYUJNQg4=; b=kMoRVy+s5f10C8E5b5rxPh6oBG
	oHdFtHXayeMC5t4/blGTxXQ1I04TEG3jOx6W07Lrr96Khvgy+VcbAE/yAi/VwdP6h8DAkmR0R20Dx
	X64JU1DhncYXOKvCrUvAhRAkbA3iecNJaGlao9XtJG8zK2MJDbZX/V3S1EGZc9lTGihBe6RXQi6bD
	/l2urbhN7jgqCijXpao3nJ7PBSH+Lq1vAHQmQIrivIMOFb+S+1P5vaR/L3P2Yw6NX0uCJqMo0rbBM
	p/ezAtPYiLab3sQjGjKm9R9M6Ruo2VYTBKFQVXAO7C8vs3VZ+17O99MRTkZbF5B7YiqbSspfVcoFe
	szbi2/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QCU-000000087XB-3KeJ;
	Sun, 21 Sep 2025 19:58:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QCS-000000087Wr-1Pg3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 19:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6950140AA0;
	Sun, 21 Sep 2025 19:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED896C4CEE7;
	Sun, 21 Sep 2025 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758484698;
	bh=zltGFf/iswHLioFD+7yrHPrDgYZxBlcwDu6SYUJNQg4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=USeqBhhlqudd2ayH26X/wWpf9M65wlqMolkJtsZiT8n/tGFNAmdpDa9E5vfdHq8nq
	 sWmham3lJfgTG5+vY5dchand2nK+CyAKd1YfvZbePRSANlbxK/Q8hdNR8OX42HaH+K
	 eu1rwPZ6hu9JWvdiC4JH5ZXFVRiKAJO0sb7h4at02SHGjChF1VlWHrHF+7UlyHrTJu
	 REifoKLTyt/Ap9IMk0Oo4lvv70PCMIlTTUdC7vE5oDbbADqsZ9NeFUeYsOU2GMcf+j
	 bYlOGE0DrSB/g77uJ9k+q4RUqWqRsY/DCLTJ1UOVGhR4rmF+/GK02ebwNkH2O6oYDQ
	 YIFFMuZuvyXmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250706201158.1371209-1-alok.a.tiwari@oracle.com>
References: <20250706201158.1371209-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-clk@vger.kernel.org, vz@mleia.com
Date: Sun, 21 Sep 2025 12:58:16 -0700
Message-ID: <175848469633.4354.18141546693422292683@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_125820_400132_D49FF757 
X-CRM114-Status: UNSURE (   8.15  )
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

Quoting Alok Tiwari (2025-07-06 13:11:55)
> The conditional check for the PLL0 multiplier 'm' used a logical AND
> instead of OR, making the range check ineffective. This patch replaces
> && with || to correctly reject invalid values of 'm' that are either
> less than or equal to 0 or greater than LPC18XX_PLL0_MSEL_MAX.
>=20
> This ensures proper bounds checking during clk rate setting and rounding.
>=20
> Fixes: b04e0b8fd544 ("clk: add lpc18xx cgu clk driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Applied to clk-next

