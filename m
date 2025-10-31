Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243EFCCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2Nk5QrjNr+jjajVbJ7Hj+cR1ECK0znPdvqkIZaAEBU=; b=p1UQDVQTlR/jtRVCcIfmUhnGn5
	BhtWPnCoo2/Jasa0DLPrXmQjVcFC7v7y9MLs1I7AoMKoNVD0gJdBm3diYspTyqevIRaUAsADPc8q6
	YKNjQjq/S0kbM73BgszEwbnX2e/R3s0VRviuntMXrwfffG9ZJ04vvSM45h8JT3Z08x45dLYZTaRCP
	ZYXjGnZ/Q5WMZTFB3dKEs7Ga1MbSA3cxY7phGQbCtK0G4BZTQIFoEbzeo6AqpzTKdXMaTbDE71d/k
	/9kYIB39t4jc5eKH7Cql7+/Se/HZ8Gd0/h/t0KrEMh7rvqim91jtd4WA6ZRwNJZdJ2g5Gl9dNE/2d
	9P95Qs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDZ-00000005biP-2Hm1;
	Fri, 31 Oct 2025 08:10:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDR-00000005beo-0ob6;
	Fri, 31 Oct 2025 08:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17FC2611A1;
	Fri, 31 Oct 2025 08:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6D74C4CEF8;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898231;
	bh=5tLSRE6BInQejsiPR/fc5RiDlVZ9iOn8Or4TkaTc/g4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VxXPJYx5ExMJP2rAbhU4KIO8npVjh6DbnR2J6BRPtkKWcYGt9MmiqrDMZLVKjz+gS
	 VVGTho99vx4Ak2zm0QIou05MCrjuMm4p0ECVsYS4MdpGLnR/xBCFYucgEwO4Qv99fv
	 O9Y9aRIKvUxODjPwdU/RKNfmAOOL8SLMrBCrygOeDB4rhpxvro+5x0JJNW19yYWyqZ
	 +cYK4u0ZdJBc7f92wjyC9oeY1xs161fYawAzN0EMiyDcyr5ThUKEIr4Gh0TdTtWbpA
	 JTihv25gg1Jx61Fl/K47Jnc31oduDUl+zQa10nHeDIX1QLDofzw+evX9w9sNvhuKRA
	 t/SqoC0Kja9Ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53CECCF9FF;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 31 Oct 2025 16:10:08 +0800
Subject: [PATCH v3 1/4] clk: amlogic: Fix out-of-range PLL frequency
 setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-optimize_pll_driver-v3-1-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761898227; l=991;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=6onhzW3ODDG4bFoHZLKVZ14BJkN4o2IaabjNVGrsFP0=;
 b=y7Jqs7z4QNs/tnWA3pjqpJDu6y8SCyMGOt9v1jYNHZ6CEi+bTOQkabAxtRF0VzG2xjZecfXcr
 Ey9zrxitmMGAFOuk4W44evTpq2JS4qNTWd0Jzg04fNoUjRao6J2tWaX
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

If the calculated 'm' falls into the range:

    pll->range->max < m < (1 << pll->m.width)

Here an incorrect 'm' value could be obtained, so an additional
condition is added to ensure that the calculated 'm' stays within a
valid range.

Fixes: 8eed1db1adec6 ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..629f6af18ea1 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -191,7 +191,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
 
 	/* the pre-divider gives a multiplier too big - stop */
-	if (*m >= (1 << pll->m.width))
+	if (*m > pll->range->max || *m >= (1 << pll->m.width))
 		return -EINVAL;
 
 	return 0;

-- 
2.42.0



