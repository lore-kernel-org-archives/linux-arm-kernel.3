Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7894C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKK5gcU7iw9sg/whyDQpOqDhR8eB9S7j3gxl7nSXvtc=; b=0D9B2qYrHJPspSKX6co1ZWNe6/
	+swc3hj/HLDWziPfqzI0i3WEZNUcYM9fF09mWVZHX08vb4YHIeAcl/uOv6PJK4Xq4ZpOJCuDV+esd
	594MEdhLJtr14NzqxntGEW4AyVPVaTzEbl+v9096XWt9uNpfSkg6k+/hkPuJqI7u5jPJP5Pc2K3/F
	oCp4vIN+6osLtVVofN4xBuuu78JWkH+P6yJ98wDxAWlDiFuhf3dUpMY3Oi4zH4bMhHRsrDhqpiHLp
	Py3WVP0/u/mhvq6yQoqVEGi79atpodXA/czqNlJphkS7LwlK02F1o667Ds2zuKc15qpBJh5f33Yv7
	dKEAJvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu4d-00000009tM7-1Kjd;
	Fri, 28 Feb 2025 06:42:15 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu34-00000009swt-3Fy0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724838; bh=eKK5gcU7iw9sg/whyDQpOqDhR8eB9S7j3gxl7nSXvtc=;
 b=Wy1kafNtaP/ffQPWrNJWJlHC8E2K6Sjo6HaNCUuur5B6/NWoDuDCcZG9bdunsTu1ZxBKrWsGY
 vhCgLWRl0h+pQS9SSxvEeKe6KF9n/kIpL/OZuCFofkJhwyMWK6Ow8INACK9Bdp4OoMrKwI8U62q
 r3lh0DWe7RHmj2/Ul38gJHwPxXVScf+NOiIZZ4j/G4Nwwjtf+/zra0XJxQKoxtJX0ZimcVXq9X9
 XkoDTf8hMPppUea9l9D4iAuDJ/n9xoj3Cw2sTM5HIHGg40CCRdkhOTvyU8DPkPBN1j+vUNGKHRc
 8jeeEREfXHzpqoV3sOjFS17YSUjGWAIF8PEtJg/hsAgg==
X-Forward-Email-ID: 67c15a62bcf1d1bd23db01a6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
Date: Fri, 28 Feb 2025 06:40:07 +0000
Message-ID: <20250228064024.3200000-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224038_921056_9770317A 
X-CRM114-Status: UNSURE (   7.74  )
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

The GPIO is accessible via ioc grf syscon registers on RK3528.

Add compatible string for RK3528 ioc grf syscon.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 61f38b68a4a3..b4ed4cb555bd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3528-ioc-grf
               - rockchip,rk3566-pipe-grf
               - rockchip,rk3568-pcie3-phy-grf
               - rockchip,rk3568-pipe-grf
-- 
2.48.1


