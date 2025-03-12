Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA2EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 04:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo6n6Xihnl7nwdWROCFmH8O/o+S0x2q89w9oQy4AZ8I=; b=dBVeXgiaoUl39zDs5XxC1Kd1dJ
	J2UQ0mLGCboXTFZefy3lQJ8A0Qsa7Gi+LE6H0is2Ak4Pq0DLGhy+rSVbI22hHCXf2Sz/KXoKswW7Y
	3OEIpyWFBIOTgrVOOQey1LTGnWBTm99AKiJKuajqSOzrYddVFQR3nRwVpFN/twwl+RJ6KewMpHv9A
	TP8leTGFOYGq+oYst/FPK7ljzKmZNC6/VBt0E0qQT0yA4fX+kl7b0MS0SeBpLc0eriBupG2DY/7sK
	EfXw8t/otJTFrzgvHpOy8+kYhFfHM0vu+/mcvwi+0l+O9AVlwAd757FXse0msxvQjiAaow+0YRKeX
	Oa3KE5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsDLj-00000007RfD-3Nyd;
	Wed, 12 Mar 2025 04:05:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsDK3-00000007RY1-2m5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 04:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEF055C4A0E;
	Wed, 12 Mar 2025 04:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE8DC4CEE3;
	Wed, 12 Mar 2025 04:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741752238;
	bh=XkOWlzk6E8YZf8b8QRvvfwojqXUrA8YB4Q+CY34n8TI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hN2ymMXcw4hGU5fwGZfosxtuSdYfyboEsStjGFykCP8oO9sy6OoeNPAl9FUK3w2OU
	 3zMWOn+CVBTlI/4aRfT1dNGRUNx9w4WAekiT2BXMD4rXKd2oiHgjy3w6uvTzlL4PFR
	 MG0Og9z5mMHBiHucw15sR+r6iPkAwdX6EMqHPQ68Fzt8n4l/ZDaNSpCOn2VtbNDHqu
	 8kMCtJDFhPFhhX5DUPPGJElZprCySjwxP3MwZdekEjySE7lpugMXhu8+PNGCIKj1aq
	 S3XO3FwNQBsDQsyhDO2w2sGxF0O2h4bJ+0KJmOsUV/iQykttIdhEKecptIpNMXTCWd
	 cQBqHPNnPSdww==
Received: by wens.tw (Postfix, from userid 1000)
	id 64EF85FC08; Wed, 12 Mar 2025 12:03:55 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/14] clk: sunxi-ng: add A523 clock support
Date: Wed, 12 Mar 2025 12:03:54 +0800
Message-Id: <174175218236.1911740.8731884904697217692.b4-ty@csie.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_210359_792553_C6F1E79F 
X-CRM114-Status: GOOD (  16.86  )
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

From: Chen-Yu Tsai <wens@csie.org>

On Fri, 07 Mar 2025 00:26:14 +0000, Andre Przywara wrote:
> this is the fourth drop of the series introducing basic clock support for
> the Allwinner A523 family of SoCs, comprising A523, A527, T527, H728. [1]
> This times just a small rename of a macro name, and fixing the DT
> binding, where the separate patches for the two CCUs got merged into
> one. For a more detailed changelog, see below.
> 
> *************
> Please note that the clock numbers changed compared to v1 and v2, (but
> not against v3) so DTs from that older era cannot be used anymore with
> this driver: you have to update the DTB. Just copying the binding header
> and recompiling the DTB should do the trick, since the symbols stayed
> mostly the same, at least as far they are used in the basic DTs we use
> today.
> *************
> 
> [...]

Re-applied to clk-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git
to add SoB, thanks! Please note the commit hashes have changed.

[01/14] clk: sunxi-ng: mp: introduce dual-divider clock
        commit: 45717804b75eda8a76eacc04509ca4d68dd2caaf
[02/14] clk: sunxi-ng: mp: provide wrappers for setting feature flags
        commit: cdbb9d0d09db4cd09d23fec02d3b458664bc3d38
[03/14] clk: sunxi-ng: Add support for update bit
        commit: e16b9b71f40f603d5cbdcf02007c05ee03cb2be7
[04/14] dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs
        commit: 52dbf84857f051df38f6de3f0c7b7f4506e7ad25
[05/14] clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
        commit: 7cae1e2b5544a6f51972458ec4360c7717ca0145
[06/14] clk: sunxi-ng: a523: Add support for bus clocks
        commit: e6f4b4b77981feb3af06e16da073e788fe16de2a
[07/14] clk: sunxi-ng: a523: add video mod clocks
        commit: 6702d17f54a8f6c48cd6ba12282fae8c936e7944
[08/14] clk: sunxi-ng: a523: add system mod clocks
        commit: 74b0443a0d0ad283f20ee2985758143485942c31
[09/14] clk: sunxi-ng: a523: add interface mod clocks
        commit: ed064e65b92a1d78d90b6b87a3d99790f88c1c83
[10/14] clk: sunxi-ng: a523: add USB mod clocks
        commit: fb2c60366d3259aeb5507902e50032fb05b11895
[11/14] clk: sunxi-ng: a523: remaining mod clocks
        commit: 00bc60ea24a7b31da97a3b8a833711491c285ae4
[12/14] clk: sunxi-ng: a523: add bus clock gates
        commit: f3dabb29f0ca44f2053c0c3943ca6f47b248d348
[13/14] clk: sunxi-ng: a523: add reset lines
        commit: a36cc6cd0feb7ea656a1a33db0e6347149f50fed
[14/14] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
        commit: 8cea339cfb81eb3354b0f27ceb27e2bb107efa6d

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

