Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCEC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=zRs5+to05kv3cSG6H6m3nmXthy
	zAcGE9MIPvSLFF2H60WAjY8rjYPY1WJcpWI9Umj4gJZGxB+7kNxzOZNwBWCQA5bb9UjLdVdsKQAcU
	/EfPAgnmwSofeEUQL32kqfnsCYyo4HQyFSEcF9BoX7FDn+k+7HVlx3M42DGQd1reyRmJS8gTrDEjx
	L3Ye/cZMLkuAsGbQ/8SYKAdHyKjfCXijn3pqfyexA1Ck7oj2sKpl2qavtOtMteMPfpqpqWKiyInIu
	j8xX3n7TPONsx3OqLrzEr6F5Qqbu8tV/7hkDRRMSbrmXETQqLybc9iplNHVnjxumN58wXJH29MCPk
	iuSZ5T7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd5-00000001u84-1QbI;
	Mon, 10 Feb 2025 23:55:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKh-00000001fPM-0dKV;
	Mon, 10 Feb 2025 22:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=MVsuLwwtopzvEGtv5L8vJP/tQB
	KK8VRrl/6P5EVHoxcVy6G5wWyCIwGbLLyVDQqjlR2PGDmL0MtZNr32lqmJmxplS3Q0xP9mfo2s7zr
	xM55iJXYsQETjnlKS2kyz3RGYsl+IaCjS2GF/6rOH2/xxqdpgJe2Hiap0lKax7GlENPFtdIYv2Arq
	QzMrZCAr1rvXbjDv16AQdB0s83+hQMtOO8+DKoXBDk1YcSFuJ1b1XtuLJK4RlGkVrKhm/afejxpTh
	6/LyCLrROcDMFaZELsQ/1Mu6qMmQivRj6/ko4lFkXjd6RW5Ch5etDr0VwYe8KRooNMv+d4h0Q2OC3
	2d1VwglQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKd-00000000K7a-1FtL;
	Mon, 10 Feb 2025 22:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=FfQH5HG0W/FNE83p+GlJwKNfWb
	U69oCoSQUa455ECaUJlui8ap6hv4z1svFIb1F18T7HHqEfEp4JRUTBv9h7nEaC4d+gJ5iFBgAwGr1
	7qqDFyxYJ/tbq0JpPsuRjdAdTA9yoUvRhmdexoStq3xcahKm9xSbgCTTXI67xaAT9WtuB2oVQrnQU
	4xsIbbm/5h60tEU4Ni2ilI+uWhETqG8x6qhlktsYJwL7WEMWwSBXqrakWKe8DZolko8dF79DUoI8p
	to+KIFi72+sG7IG2qxaWuRvSo7Fug3MhG4RsClB0FLmZ1aZ9wZgsUOWDy6yWkij/ItIQzMQb+yGYe
	O1HgBBqg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKb-0008Cw-To; Mon, 10 Feb 2025 23:32:45 +0100
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
Subject: [PATCH v2 1/6] clk: rockchip: rk3576: define clk_otp_phy_g
Date: Mon, 10 Feb 2025 23:32:14 +0100
Message-ID: <20250210223219.1193346-9-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223247_385567_574102F9 
X-CRM114-Status: GOOD (  12.01  )
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


