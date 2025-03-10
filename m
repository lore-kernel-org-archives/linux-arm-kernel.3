Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E44C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwrgReuxeLe3BlfVPHAP9VVYbVwRHECtchfxWVqLJ5Y=; b=NfJ+8T31fn05LGSXlkJorIhvGo
	GCg7CekAp3WybHm0o0whmCB+oHAiNAdfr/YuFlVEjZxYgbWcCvdL6LLdURbWgrDwU8C6DV4b7QBFx
	UwUAofOm/BWiH4MrdkyhSvIF5LrGBd/HaHu9/9M6woKSfDmTLyEc85o4c4iu9pKCsgBwOCL+xCys7
	qe8hzpla7RbnxozD0RvUWY9v1T617Y4r00A8txxdIWiMJNBuSb9gGAvITgOOVQqbtF2fw23f20jZ3
	SBb9tkbb5s1hrp4bWOCC7wwfvModJIafqTiIRIELMT2f+k0lDu/RcPaG59y9yyelXbcssb9eBErSe
	/qt3yusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tra91-00000002DYQ-3pfL;
	Mon, 10 Mar 2025 10:13:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZwK-00000002BVB-2Y8C;
	Mon, 10 Mar 2025 10:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741600838; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X5Ku3qEwrPdTwHAs8CrQxzz2J3LO50Dck05HJNsqiSXQMoKhtAqznZE+V0P6YikN9ZZ277HTM+mzbvazOm0VOmiiNkWaMXt9uwn82hGV305SLJrsGvV+z8dqAEKR87i7zKXpZZSO3QQMLZL8huG6pRnlKF53/XDtsgyXPOQy7AM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741600838; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZwrgReuxeLe3BlfVPHAP9VVYbVwRHECtchfxWVqLJ5Y=; 
	b=cnQQnbBEmSBNlT159xZEkiUBzCZF2A72tJCc0ngGWPQ5QSiQgLS05RjkssshA315YjAQxycIN6vSI6e8AVAEjQc5F8Mw2gdiVA35GmPASJ/JNHeGPocFEqeHNnHEmAotyHbNw0VfxJk4E6YnFYgLU7bFoWySIm3yzHnWBdcg4yY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741600838;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZwrgReuxeLe3BlfVPHAP9VVYbVwRHECtchfxWVqLJ5Y=;
	b=FEXAgxF4nC6Mz0MdzNKCqEIZv3V8zKnbJSpXnnHH9MkA5JID4lrpIXUeQr5dDrvl
	u/8yhefBhas4jgrjELJ5R9yjvjA4YtQ+k49yqWmRQ3xc6RJf6lMACwK7kI7HbkoaHzh
	oytOKInKXZSHdT5vISnl61U4WFbs+RdEqK7+N06E=
Received: by mx.zohomail.com with SMTPS id 1741600837144360.63308913443063;
	Mon, 10 Mar 2025 03:00:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 10 Mar 2025 10:59:56 +0100
Subject: [PATCH 1/2] dt-bindings: clock: rk3576: add SCMI clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-rk3576-scmi-clocks-v1-1-e165deb034e8@collabora.com>
References: <20250310-rk3576-scmi-clocks-v1-0-e165deb034e8@collabora.com>
In-Reply-To: <20250310-rk3576-scmi-clocks-v1-0-e165deb034e8@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Chen <cl@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_030052_712427_E544E1C7 
X-CRM114-Status: UNSURE (   9.97  )
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

Mainline Linux uses different clock IDs from both downstream and
mainline TF-A, which both got them from downstream Linux. If we want to
control clocks through SCMI, we'll need to know about these IDs.

Add the relevant ones prefixed with SCMI_ to the header.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index 25aed298ac2c2e2d37e2b441c9d92ac68801be6e..f576e61bec7041455e10ac18c92f3b33ec0760e3 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -589,4 +589,9 @@
 #define PCLK_EDP_S			569
 #define ACLK_KLAD			570
 
+/* SCMI clocks, use these when changing clocks through SCMI */
+#define SCMI_ARMCLK_L			10
+#define SCMI_ARMCLK_B			11
+#define SCMI_CLK_GPU			456
+
 #endif

-- 
2.48.1


