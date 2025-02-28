Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90887C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NB3P0f6RdiFdh3drg6WLnXPDL2oA0XzIxfpKl6Tzgc=; b=JHSKzeuL1HUw5jyTf84lii5eVB
	K489ClNt3C9QVJ8Q7jY/nair36oUcy3940WZ6BUkq7ihWZTpXhzJ67+YfHqvvUxa9uPlik6W82v9x
	vNjupSwBoHHY0QCUJqEkIZ+U1RvAvOUHggr30CI9hX7Rqw3L4pW/valdhMu9maDltA3A+iAtGsv7z
	EKSdOFfb8Pet6n+IMpMRfnPDU/t90CcKATh8nOj56GFjVROC6J7eqYAcWYmuIf9L5/kklRmsJHyLd
	MBOY5nquPvtiK3O8uk9cjXgceybR+yHaebZRPnCHKq5arnEgUH8tSPqCPvEr2mQIhoa7T7SIH73+6
	QpY7h30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu7g-00000009tl8-2hKI;
	Fri, 28 Feb 2025 06:45:24 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu3B-00000009syx-1F7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724843; bh=7NB3P0f6RdiFdh3drg6WLnXPDL2oA0XzIxfpKl6Tzgc=;
 b=uh7G+/Ch4QINZxAeggR8yk6Pqk9ygO39muCS+U2qykR43YFYQC3Boy7jaHjNLFYUFVMhIYlCa
 x26cT8VRgHk2bHEv2k0hfNoqyR4H7Kd4ZKoWKe24QIAitoVh3ZfZ4S4YqUo7S7+mUzAMxuhky2u
 i3FGtdfaTvOnH46xP2nuv4K6l9nTNj0vWk598QUJA8iKpctPiUqBCszr6LcUsZJqJTnxqtljqCV
 ExW7Lgx1B7af2WVzYvJMTNr05UL6kqhCjxSHuAtKBfpA/ABP5Ov5xz9riWCrt0cPPpS/jUdfK8+
 bEqEedjQUMucCepd9QdJLQbCZHROxgi8dS7iXFbnhxQg==
X-Forward-Email-ID: 67c15a66bcf1d1bd23db01bb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/7] dt-bindings: pinctrl: Add pinctrl support for RK3528
Date: Fri, 28 Feb 2025 06:40:08 +0000
Message-ID: <20250228064024.3200000-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224045_420169_72CC9A72 
X-CRM114-Status: UNSURE (   8.12  )
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

Add compatible string for RK3528 pin controller.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 80a2b1934849..960758dc417f 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3528-pinctrl
       - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
-- 
2.48.1


