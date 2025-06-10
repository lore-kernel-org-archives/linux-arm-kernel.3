Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=; b=31z3daB6yivhaukzfLZau1TsOo
	BIKKsdj56BpvBhCx5SdpuF+d+zsAnurLZdzHKPwZk7/dJepeEb8If6VpnMrOJ+Uo05AavRBfJnMxW
	NKQ15/EHKo9QXyGtGseEfLPo51Opllu31IRgUbsrxWYf9gPh4XBBSrgucLWD+vuvfDJVLWukC/+8L
	w0G4FG28laFJhuWtY3Y4c3AjU/7UlhEbV52ft5CgLw7ZU4KmLHPeiVvhpqBiSJ2Fo9Jg8ejtvQO7i
	t3/oE72zRACF0QvYmWxcFVNXVverndk2P+dKnIUS4yi7T6oC0+IKTFUbvEQDlUyLxK2IShop2koex
	90nV7a8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz0l-00000006xsE-2ojA;
	Tue, 10 Jun 2025 13:27:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAG-00000006mIq-0RiQ;
	Tue, 10 Jun 2025 12:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=; b=pX59d+mO/dHdvd3Wg/G9yw9uoY
	hvXfIyn2zWt+z75nxnZMcTiclwqYF9sfeaBjlPir5BJ6hOrqKJvVyAlyA3XdY9AUdVzizZyxSM2Ol
	tmK93c/87FEIEG+XSg7TdvsQVQcE7OWUSEULPFCeNNKbfIYhg35sC3s1pgUPLIhHVXVmwuEGV3Yr7
	LS2TS+GBMmG8WhFx/g03Q5/wX8/cbtye3oc+QCeBk93nBg8gLhv8LhOwMlxz7ktmzHDMHS6Y4PHnE
	1ezmYle/8IAlyUph6hEiovADGGqjVjay13zd36mocdFzuBmRbrqs5SG9hCZd9G5FzoGYx6AzI49SL
	mZ60zGeA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAD-00000001oR5-3vVj;
	Tue, 10 Jun 2025 12:33:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749558775; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWrFAe12c+Ts2tfLA2JswJvpCYBMSNzS5AyoFv50ZXlr8FjCWBqcOmSFhpCBdOlRAOaG/+85mB9UF4/AB6PAeymWd6FKePahKd9kHlMFT24NMIncZc4QGZaNjceCcrQwqCG7PFobmUaDRs3RLvIQtaooCaDlhZNNnsHBRxyAcOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749558775; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=; 
	b=YJHxPvED16rQ8AaSg54DrvzKYbKM0xp7anEcYkRxAL+mGh+m8CprAT3iyLNgjnESta4ovgWOS02Q306hldkwQl824wAta/R/o9gIkzpI5ObsZtEsnkA2F2phppIMESKFUY3bDBXXY9D2ua3Tk02NbFWrh9x8gcuxv+f2WfoZVOQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749558775;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=;
	b=ipXVos4F1ag70tE7+CYrhMEtEYcBoEwficzD+uvDH57MnVWq65ts5BvLE/nQ0HyN
	Qk5znHRSBksD/RNwcxOnC281HcGQTCGHiPMG1XOJho7mnwwD2bac4NwtmXhOluUTNnk
	gwtciSxEfTLUYBVqKGaMn+eydf1w3h/4TQ0wRvw0=
Received: by mx.zohomail.com with SMTPS id 1749558774709569.5144844612655;
	Tue, 10 Jun 2025 05:32:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 14:32:38 +0200
Subject: [PATCH v6 2/7] dt-bindings: rockchip-thermal: Add RK3576
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-tsadc-upstream-v6-2-b6e9efbf1015@collabora.com>
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
X-CRM114-CacheID: sfid-20250610_133314_438341_A3692E9A 
X-CRM114-Status: UNSURE (   7.94  )
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

Add a new compatible for the thermal sensor device on the RK3576 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index b717ea8261ca24ebaf709f410ec6372de1366b8a..49ceed68c92ce5a32ed8d4f39bd88fd052de0e80 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
       - rockchip,rk3568-tsadc
+      - rockchip,rk3576-tsadc
       - rockchip,rk3588-tsadc
       - rockchip,rv1108-tsadc
 

-- 
2.49.0


