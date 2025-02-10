Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B08C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=EzN8SK/5QWDlKorBd4skcy4mmE
	KI6vXPF3wk2pgmzdVJ11OLv4jPrblfcc2R+S2zSiujKtbwksPYfpqt87l757r1s4tCj5xYasB/rEN
	f9fpqwgPX8gojekOxbNDi3vBDxaBNT/WrYN7FLJHcgakk+IAwMSNZxIr5cpKG+BHm9AwU+4dMnCgQ
	sQHJfKLeTGXGoK7zVd+MfAIAej6hGSkFsH7yVy0cHj43H9RqsNSPWfSivH2XtCB0efgF2CpF2ukWy
	36NRA1K+JR4X++ljmUiBWb/MCBKhoovrYR9EKbnZlfPqm3RIqW8eZpeu2nmcl8R/T2skiT8dmDnsX
	nEIFRNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcqK-00000001mZF-1mIF;
	Mon, 10 Feb 2025 23:05:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWy-00000001iXK-0jYW;
	Mon, 10 Feb 2025 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=N5fMkU+pz3ILRci8svhdb3fVNJ
	kDk1AqzFn4XJHReDf3dxsHZ6OzpiZEwO+160KCE8g54q5Heyo89XNnaM6d3gxYYS7ie0bd/snVDiX
	3uv1yo5baB+b26Ph6/3FeIgF4lfd8BIcfdznspiv1njOVH0CWMG2w0juMnMrsH8/QXAJv4DCjxyqF
	G6afPWKYQ2qGVbEAxqi7dkZuiVwTM5EfzKQgtZ5nE4a990zij1XfX/tvbAs9mDJUgeqASUJUXnnMF
	oh4S0qj5GScMK+0onxhKGKYPJMKiTTHl8kJ6dJ2KosZbshPi1wayq3JfSWwWTRfJHmH4LXR/BjUWI
	xEyhsr5g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWq-00000000L3N-03A8;
	Mon, 10 Feb 2025 22:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=MaRvBaPspzAMBrdvUdA2uLvM4e
	OMlgEHhophLvF5uuYjtFIHCf080tgx77Xl0L1X6FdhqE1iGd0f/QGJC5SCzzE3ddfJackaAYBpbIS
	ygSLtO2ixCvx2GEs459zzzQDjPw4CQecM4EUA/M+buP4ADfg2c3Jl1t8dsezEPF4h/QcGIESmsC4W
	b5iv5ij2DzPFeFB05uTkHRThiqPFYaAhJUTNhciK9jO7fAyXw8aSMPXe85voSRxAykKif2fJ/K0ej
	JyrFD8sMj7iWJvlFAebAo8jBoYv+nC9SH1jGJfmRg15rU0RjzHnmsYg9DYlyfmQ222P/Qdso5dntA
	QE+Imv+Q==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWo-0008Re-SH; Mon, 10 Feb 2025 23:45:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 1/6] clk: rockchip: rk3576: define clk_otp_phy_g
Date: Mon, 10 Feb 2025 23:45:05 +0100
Message-ID: <20250210224510.1194963-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224524_497289_A56A97CC 
X-CRM114-Status: GOOD (  11.70  )
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

The phy clock of the OTP block is also present, but was not defined
so far. Though its clk-id already existed, so just define its location.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 595e010341f7..be703f250197 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -541,6 +541,8 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(5), 14, GFLAGS),
 	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
 			RK3576_CLKGATE_CON(5), 15, GFLAGS),
+	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
+			RK3576_CLKGATE_CON(6), 0, GFLAGS),
 	COMPOSITE(CLK_MIPI_CAMERAOUT_M0, "clk_mipi_cameraout_m0", mux_24m_spll_gpll_cpll_p, 0,
 			RK3576_CLKSEL_CON(38), 8, 2, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(6), 3, GFLAGS),
-- 
2.47.2


