Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96841C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnp7bdW/um/Nf3Hkgt/EOyvTtoi0plo3EB+bh3F7o3o=; b=SJ0HOS0ffQQGKbi5HkY7+CF3/G
	L9rcd+/77OvsHM/eNe8B/UvnjY2n5TU5gyAoO/ZS5VOUbRHgwBuWalaoUYFmqFvlQaCQs8WKfknTN
	5UrfTvS5ADrflhwF3UvcS2ImQKrBAjsbR2FqoOde9K1PJakP0Ha63lC2WySyAzNP4G0i2n39U1fz1
	F2Qys2o91WtWZucgpUmgRYkgcFeNM5nSiK4ge9ZzIkmzgYv8qjBEQWeSOmUl5AEMxkfXm+4RqwlM/
	jLtjgOAibaO/A74O/qT5+gC6Jq90q/CPyVOtb+VynyGg8Mk1BxrwVqXxaqN52ky/Oc8zgOea3zL4T
	+2lOKEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOywV-00000006wgC-0FA0;
	Tue, 10 Jun 2025 13:23:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyA5-00000006mHk-378Y;
	Tue, 10 Jun 2025 12:33:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749558771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y/HWAl+BrVvwcj3QIGlOh+eH8RGYVyzKfX1d0+Tk1LKJ2zfwnXZKj+S6/GH2WWq4zNFFgBl/oPYGc4DzgsBqoKnNEES+pH+KoqXAgvJRv0YaCzEfZhoDQ8ANR1+ArGy2f3tPDbJ/R98v4f9xuEI8U2jBThJmCQ1iJkTA9FpEU5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749558771; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tnp7bdW/um/Nf3Hkgt/EOyvTtoi0plo3EB+bh3F7o3o=; 
	b=NGD2fXCk7pG4diymGtx2OYJQzF5bZl7zpEPKSP8+25n8fncHp+g7UQTJf///oIAUDD7quPWqiCVEDg4qAJTco3BQwqv4PbZ92HS94d3fJI9d+cZGIVtiVZr9ViKI1N4YsmmQN1vGYpf4ue+hwpsSCYuuwNIYnIm8BvaTw78sPGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749558771;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Tnp7bdW/um/Nf3Hkgt/EOyvTtoi0plo3EB+bh3F7o3o=;
	b=cB0jGed+HtxmlOcbiif09rpri7CVAT2t0+RhgfBMafdP8nxkDlGei+FEvTXK88iB
	xZ1iFy++EpOT6N+ZyiYTiHDW8LYzLxfv5pkClMP0jRo0DuWgv7muV/E3+rb2Zriw/zN
	bcgTF7p3bARCKb5czFkAnz+9k4e/laDT8542rA7k=
Received: by mx.zohomail.com with SMTPS id 1749558770257746.9148597054228;
	Tue, 10 Jun 2025 05:32:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 14:32:37 +0200
Subject: [PATCH v6 1/7] thermal: rockchip: rename rk_tsadcv3_tshut_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-tsadc-upstream-v6-1-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
To: Alexey Charkov <alchark@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250610_053305_849853_C892D9A9 
X-CRM114-Status: GOOD (  12.40  )
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
2.49.0


