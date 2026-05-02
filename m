Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE407CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQud8duE45gdEVIRYljbYGN30HcxQZI9q+r/Ft9Q8x4=; b=Bbngo7zzTNt20pHoQqsu0oEnbw
	LJnjwD1J3ABc2lkn1Z2cUxXGh4nwGRIMe22yQuQtzCoNjWEOoOlU+K4m0wGdIhzj1AK3mruDP2ZUL
	gdi6uzroU5MMgrCmxcsWth8W7TAh3DDl2F1yE1iYM1SJzkkbxKETX6AznUUvlLqdJZMgXmbyQaMes
	4Y7KRtUNJMUU3zxTeAWPPCz6xW40bpY3shKDOtoWtuu54RgI6NmW6iHAzTQ/iARZrM5uKAsZa8GBZ
	3wU+Tinp/YMmD+5gA7ApBA100fQOA7T3dFgrvl+VS3UvshjSWmxrEAaZM6Wf4IRoTQoNuouYTJjTx
	vp1bLKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVm-00000009WVM-2swg;
	Sat, 02 May 2026 18:56:22 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVk-00000009WTp-22JP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 18:56:21 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g7HDy42yRz9tr1;
	Sat,  2 May 2026 20:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQud8duE45gdEVIRYljbYGN30HcxQZI9q+r/Ft9Q8x4=;
	b=I6PbfftYTIew0NXgeoJjRTHKthuLgqAP/ypOVkHLDVQzlN5pRGRt31fi4jz3GPFRMnZ/b3
	J+5FhU1Re9nAxe0FL11DfRegKSka58EWGWEYZEH1REfi85Cq/mAsb0UDdyAexq7l9ALUDS
	ivuEtk1Ut7y977Fp1Sb5NQ0Cte64G9GPhcjxi8natUnRDyHVVfyaUi5PFDpU4V/qjTl4ZQ
	DvNxOz38nioBFkGIXe+8OyD1EXAr5QDdCxUzTpbuhqNailVO/LM8js0lwnNfgd34wGFu3c
	Qu+Af6h+nAwBDFlwggeYdnZNAyMOwSPJD3V62n52o7ONHI+D0oIU38O6ovk8EQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQud8duE45gdEVIRYljbYGN30HcxQZI9q+r/Ft9Q8x4=;
	b=fek1d4KenZU82Ii02M3nNlVEsNTUMvwepA9uwZXxs3UiniDotsvPPcZnPXl+5NkD9RvL0r
	Neeot22zsTbN+86hrdg4URWj39TTefdtBFrRCKF/jCGqXrcM1kDTaswVu9+CPKdGiJWbYo
	QQkFbMKpzbrjHNM3aishHXwgPCI7+iR6RVWElEDzRhpczxS0hOYcHzedZlQXa78567aiom
	qOg3rhclvHaO5CWJpaKHisJTK+7xQzn8/I9ftRs30zSqjrx/Q1Gc3CvOhhZ7AeTzZVYB3I
	BbvJQKozCLJBH4ipZYFMOYnR+RCoBJD8NGODjMJXtWFStN+a4vJ7pwzELtTVlw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:44 +0200
Message-ID: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g64dm3jh6snd6k7ae94xoc9je766hq9j
X-MBO-RS-ID: 642e1cc61f6edc127f4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_115620_672306_22CBCDD5 
X-CRM114-Status: GOOD (  10.81  )
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

Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index 2e19ebf9e2ba8..a70a0dc402a5f 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -512,7 +512,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 			clock-output-names = "main", "pll0", "pll1", "pll2",
 					     "pll2s", "pll2h", "z", "z2",
 					     "i", "m3", "b", "m1", "m2",
-					     "zx", "zs", "hp";
+					     "zx", "zs", "hp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
-- 
2.53.0


