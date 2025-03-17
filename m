Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DDCC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTJZMXEurjXX++PH2hmwuc7IJOgr6HvrWn3KlD6bDXs=; b=DnNTSGF3JVDSv1+VQZ5XDHv91q
	bF+4bPEqiXdm7wHQzFbwrrfNicQBXKxydelzgT8pxcppAWGy8Tg1gPQzewmrvnaebLWQIFe4+OqFJ
	hchdAvvAWPDAzmQ09UwcxlSL0evjkhz4uggP50yf8tCHlwqV24Aw68GNbzzQCeMX3QihddCkGaxaW
	Oa8os4O1Ms84UDfOeQD5wz1pgBK+3YIXUQ5g5Ns8IKCF2u/Fg99N6kvSXe1soQi3vCJ1Z/BsJsU65
	tbk4NggYp3u6wZO1YBWj7aPr1egcZX0s1Wg42xO2OfQKJvoFSHYXjFZy3ce8dEk72UQl3RUFyEe9r
	1O//1LFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8i-00000002r1d-2oLX;
	Mon, 17 Mar 2025 14:08:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuArT-00000002nyJ-2LVP;
	Mon, 17 Mar 2025 13:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742219423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jTUQ3+B3Jdh6ejfaMBnfAgWEiEpN+M4tloQJpU7rikYKYQnB4Dixm/BkULndJebb+XASDYrwjjcEp5Vi8UEt98JsjvdmSCc793rYTrlE2dhQ2nTSGvf6IBixNnTRSCCqeiCA+plALDlKE4IKVBdHt0zV02WsOT6xWZmZhi0wBxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742219423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vTJZMXEurjXX++PH2hmwuc7IJOgr6HvrWn3KlD6bDXs=; 
	b=WyQhIdC3jtYRZP5irqzIwsWJGzEYWr/R0ZRvj8vu1YXdnwd/FQnbtxCv+kWk+zskOW3D9EFD6HFDqh4paPo2UfyE2S+3VcBTot6fyN3FXLa6yBXFGdoHUKEOdr1A1Q6nuEHN6M0CuoQY0Kw0uCtH1CN8OACphDOKgJbchfDuBz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742219423;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vTJZMXEurjXX++PH2hmwuc7IJOgr6HvrWn3KlD6bDXs=;
	b=kuvvtxa/F1QMRJ6TH1gRdomRSkeIA6gRvbwHcY+46N9jQAmkZeBjtQhSRhp8AYJ5
	OufTGyej15B0LRGWDkL5lXxs1OWF+zl2PmvKUVjNN+qvQNc8IbBVSsYfuTPOk6hL5z3
	Q3/71TAtFeYWX0mB8a7TnhT+gtpXz9C7uMav0S4s=
Received: by mx.zohomail.com with SMTPS id 1742219422229957.2183576646732;
	Mon, 17 Mar 2025 06:50:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Mar 2025 14:49:26 +0100
Subject: [PATCH v4 1/7] thermal: rockchip: rename rk_tsadcv3_tshut_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-rk3576-tsadc-upstream-v4-1-c5029ce55d74@collabora.com>
References: <20250317-rk3576-tsadc-upstream-v4-0-c5029ce55d74@collabora.com>
In-Reply-To: <20250317-rk3576-tsadc-upstream-v4-0-c5029ce55d74@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_065035_673426_148CDD98 
X-CRM114-Status: GOOD (  11.75  )
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

The "v" version specifier here refers to the hardware IP revision.
Mainline deviated from downstream here by calling the v4 revision v3 as
it didn't support the v3 hardware revision at all.

This creates needless confusion, so rename it to rk_tsadcv4_tshut_mode
to be consistent with what the hardware wants to be called.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/thermal/rockchip_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index a8ad85feb68fbb7ec8d79602b16c47838ecb3c00..40c7d234c3ef99f69dd8db4d8c47f9d493c0583d 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1045,7 +1045,7 @@ static void rk_tsadcv2_tshut_mode(int chn, void __iomem *regs,
 	writel_relaxed(val, regs + TSADCV2_INT_EN);
 }
 
-static void rk_tsadcv3_tshut_mode(int chn, void __iomem *regs,
+static void rk_tsadcv4_tshut_mode(int chn, void __iomem *regs,
 				  enum tshut_mode mode)
 {
 	u32 val_gpio, val_cru;
@@ -1297,7 +1297,7 @@ static const struct rockchip_tsadc_chip rk3588_tsadc_data = {
 	.get_temp = rk_tsadcv4_get_temp,
 	.set_alarm_temp = rk_tsadcv3_alarm_temp,
 	.set_tshut_temp = rk_tsadcv3_tshut_temp,
-	.set_tshut_mode = rk_tsadcv3_tshut_mode,
+	.set_tshut_mode = rk_tsadcv4_tshut_mode,
 	.table = {
 		.id = rk3588_code_table,
 		.length = ARRAY_SIZE(rk3588_code_table),

-- 
2.48.1


