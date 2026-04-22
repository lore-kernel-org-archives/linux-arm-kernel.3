Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCBAFAD3E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o53FrSsnhfh8V+Sa+GU9/4kc1zeIjYc2qw4K6Qq19PE=; b=eBjnMWGQpK0ktGuD7MDMa8vjwX
	ybAPE+vB2atxBkLvIguoALsOuq/j4M77X9WaSbLyfD0l10M4gGcWDW9myJfolz6EuhJJix/JbDqbC
	1npU6jB7r8jkEcpcSKRogTxYA0OJF6Ww/KTbE/XfodHh8E533Ol0POCQQ7wai1xKXo+z6Cl7BU5w9
	jh0pPwT60VM3Cw7OaCcSFFtDElOH3IV38AzrLx0LUcPGcnkkKMXtisGzmfGm6cFvAVgT5IdMlO5Dk
	s+mrQcMu/GtISk1FbRXJKWJ7yzfwJwTrbtvq+D4+BQ+Tl4JjRg16MJH+jM6rYN7dzIinFGTDu6jCy
	nTjkOOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh90-0000000AqQa-1PrZ;
	Wed, 22 Apr 2026 23:38:10 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh8u-0000000AqNm-0nFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 23:38:06 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g1Fyd15Q6z9v0h;
	Thu, 23 Apr 2026 01:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o53FrSsnhfh8V+Sa+GU9/4kc1zeIjYc2qw4K6Qq19PE=;
	b=b3AbPq6sx/BX79CJ2xro2f1ZD+pZUORFbu96IYN6H4toOljppDRmn39KP06w9SSWSCDXXX
	k+/t7JEmUaJ1nquCKJU5n/dxDctqCu4RMXucHIaOy688GGAFsBzBo27t8YZN8hfotu/wH7
	h6qGRZCkjVGNb7OF4WqRzAnNVSKxsrhIpzF2XPu846VsCsJfYOCi8Ey1k8MRtgUema2Kq6
	nfGeJPg2AcXcfmGwEka9zAWQKUDH1tCtSZQqfOca48Sf8u2OcjHZX86NkIEsTdD0XN+qi/
	kcC4m3AKEaU8MTwpdugFJMMiDLNFSusT8pv6S45uqUTpXfuNXgd+5xLua6NNAw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o53FrSsnhfh8V+Sa+GU9/4kc1zeIjYc2qw4K6Qq19PE=;
	b=pvrDbK8n7kbVkiMINwlI1NaLMmIj6iStLfW2vfdUfT0Pu4tlM2GvymIutWcJIM29wa5xJ7
	MJqwk7CrOmgvLg1oSoDPDhlTLuRlB/frERfQCGU1wR2QVCOENSnL+YZU2V0Azx9YjnyURZ
	vo+Df1CgIHhRZcLyh2P1qRuAGyCKt3t9vBGDk7wcuVDBtanB3niDqcom+1HaMDhJcNBbUU
	Mpoz47H3HW8JqzlYXljG01+nWn060LLvRp/lrtrracSMf2cedrZsn/tS0XNalzVKUxuVqu
	JU2ak4xiyax0TnH33yy6zGkFmnr4FhV5d5FWsGkOAqiWJqbKZaCiIvdi/fKOHw==
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
Subject: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:28 +0200
Message-ID: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8466ed11b40aa63e9da
X-MBO-RS-META: zyu9m6nmx7ww3rybtrnxd8mo99whgi4t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_163804_370153_DBE09990 
X-CRM114-Status: UNSURE (   9.86  )
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

Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.

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
V2: No change
V3: No change
---
 drivers/clk/renesas/clk-r8a7740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 635d59ead499e..31a79674583e8 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
 	{ "zg", CPG_FRQCRA, 16 },
 	{ "b", CPG_FRQCRA,  8 },
 	{ "m1", CPG_FRQCRA,  4 },
+	{ "ztr", CPG_FRQCRB,  20 },
+	{ "zt", CPG_FRQCRB,  16 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ "hpp", CPG_FRQCRC, 20 },
 	{ "usbp", CPG_FRQCRC, 16 },
-- 
2.53.0


