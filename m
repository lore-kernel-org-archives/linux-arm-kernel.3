Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E02C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nIp4OdR2z6qhnWaz8PyWS7YQAJ1zv2iXHLQMFhsuG0=; b=kPL3Wm47R5+JSxXIf4tw3cS0uh
	IP2iGrKw2L4FeVa0yzDvS06cJzn5Ol37A554KD4sNj1gn48uk5ojUbiSLBOVhUdzSYQ3bI0ga02it
	K0qHio2O7hojZKnJ8Dl3xyz5tQ2ApFRCZwWZwdhI8Vr4LL+DFHlw2BNqUAto4S2FOE79DGfABw3ed
	qV0krWmS2QHM6e18uTq85VnhXyQlII1ebGw1tgqWAXlVmEEUhBacKjKVcPzHs61P7DJnSONWnvnnd
	5jLZduOmNYwHktihHnymBiZ8mImWfOzAdiSECQRKuP+A+rWNlEsTY4f0dPhzPfGI/Mbdl96Vh5kBX
	BdTP3bUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnJ-00000008f4p-1mMo;
	Thu, 27 Feb 2025 19:43:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjRM-00000008RSJ-3YKM;
	Thu, 27 Feb 2025 19:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2nIp4OdR2z6qhnWaz8PyWS7YQAJ1zv2iXHLQMFhsuG0=; b=nVizH7JBdfpOazpQiOrbNj8tAP
	j9rufvbQMJimYcjaEfKd77ViNwf0qSPWJOVH/yUqtMt+OxFUXhRZdXrJFbvIce5YlwPsZvKu2zjO8
	99uDyEjVdQo8q22Fz6W8v53xISBjS7lLqlMMkCpt1fR2r6o1imVUbzETr0FvZbIShSwGIyLc5elOq
	taaaNJuET4c7R95LkGIsad9vPH8/FP69c5jd6+kcYfsLiGSrgqvvMcLV8lwt5GiiSUwEs4CDM9zMY
	Rw13ZGBkkl57hbmB3fYm4LoT616yaZRZcmW+RIGdc2fpaahZHFxpCVQ9FJnAPmZswk9NdYxSeLihd
	OwLQF5DA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnjRF-0003cw-He; Thu, 27 Feb 2025 20:20:53 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Yao Zi <ziyao@disroot.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: Add reset lookup table for RK3528
Date: Thu, 27 Feb 2025 20:20:52 +0100
Message-ID: <3022099.BaHzMo0RvP@diego>
In-Reply-To: <Z8CzMNI_1CjUgSrl@pie.lan>
References: <20250227175302.2950788-1-jonas@kwiboo.se> <Z8CzMNI_1CjUgSrl@pie.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112100_909483_79A6ABB1 
X-CRM114-Status: GOOD (  18.62  )
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

Am Donnerstag, 27. Februar 2025, 19:47:12 MEZ schrieb Yao Zi:
> On Thu, Feb 27, 2025 at 05:52:57PM +0000, Jonas Karlman wrote:
> > In the commit 5d0eb375e685 ("clk: rockchip: Add clock controller driver
> > for RK3528 SoC") only the dt-binding header was added for the reset
> > controller for the RK3528 SoC.
> > 
> > Add a reset lookup table generated from the SRST symbols used by vendor
> > linux-6.1-stan-rkr5 kernel to complete support for the reset controller.
> > 
> 
> Thanks for completing the reset part! The patch looks good to me, but
> 
> > Fixes: 5d0eb375e685 ("clk: rockchip: Add clock controller driver for RK3528 SoC")
> 
> I wonder whether it deserves a Fix tag: to me it's more like a new
> feature. Please correct me if I'm wrong.

while one can see both sides, I agree that the Fixes is unnecessary in
this case. I've applied the clock controller mere hours ago and it was
not broken, just missing functionality ;-)

I've applied the patch now, and removed the Fixes line.


Heiko



