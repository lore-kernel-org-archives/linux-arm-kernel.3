Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B12C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlFCAc4M4tsY005AhENFwugyMYaX2j/qB+dCiJDYFXQ=; b=syHT6anJ0CjiNxgNShCDnEYq4N
	mX1vRWMljZRqkyHI3UpfUrf92+G5oFgJgGtOWAao6TzdCmmWmmwwzxTojw/qNxPebBu/Iw2kL9z07
	LvaVU6XyZhfnMYqq4kLOe/9NDZ5VUnosqvvnvIwz7VbGVihZit9BFARgwX5Rqq9n0uRIjMDiowG+t
	elMDKvwXhTSwLtTiQMsXrFD25hW/y1Vm1ewBGMwIQWBGgELVARy/P4vArw0DuVDc2lPd27TSBypX4
	KvO0pDVdQbSEPmgG24ZiCSFvJxS8hg0ovW2z9fIw41JLQgdZQ/tZSqr7brEOWZQTIzR5JE4CcxkGT
	AV4o70iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmZk-00000007dNP-1brl;
	Sun, 18 May 2025 22:33:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAa-00000007ajs-2CUL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606062; bh=JlFCAc4M4tsY005AhENFwugyMYaX2j/qB+dCiJDYFXQ=;
 b=Vdjmez5vNqfCpB+NRlvZrcAYpNMrsuZf1yODA3R6b1br3SAbiKo01X5EPnY7rvsjb1iqIQxE2
 /SQMYUL775WI92pIKl+zSX5xKkpOZHEXKCfBXTEhRlk8h0ICoJBBqS1GQOsCiIbrN56Fnh9BRtO
 Tj1gZO9B8y6BswGMEx+S1OA8qW1MP7iETfZQIl5hW8SQ4y00m7cj393YyKZg2lgH0xxz9kYbY90
 Hjm3ov4bx34oVqV5GrkGbIV+Jf7+UYOxMeq+dJDvNQ2kvnvMSs7nuAsOyWs7d+XXt+80lIWKh1A
 CvB0BFbSvh6elqddSYMmRNQrH4ci45SPsSjuPJ+23QBA==
X-Forward-Email-ID: 682a5a2a78cae75fbd8d46ef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] dt-bindings: gpio: rockchip: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:53 +0000
Message-ID: <20250518220707.669515-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150744_589934_B79468AA 
X-CRM114-Status: UNSURE (   8.47  )
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

The GPIO controllers in most Rockchip SoCs are part or power domains
that are always powered on, i.e. PD_BUS or PD_PMU.

On RK3528 the GPIO controllers are spread out among the PD_RKVENC, PD_VO
and PD_VPU power domains.

Add support to describe power-domains for the GPIO controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d76987ce8e50..bdd83f42615c 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -41,6 +41,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.49.0


