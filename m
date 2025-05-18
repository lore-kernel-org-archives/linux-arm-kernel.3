Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EA1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngOKSl6OG/tW+9Rxzp2cYqj7UrWaCYxSd5FvuPjMg/M=; b=yYj8YCs2TJczJCWXklG/+va5LH
	fSkZ6L22d5DWikweuu/bhmKlpAlmfkfIwdi/+bnc11eQLGF80zlN/1eHmZuYtkadmC+81rvamETYW
	hpBafnBZQyBmt0L1W90wReOX2vEDe+kyCbTYmrNPZxQL8ySuA2dYu4LVlY9COAWQ+Anq9y4CVKvAF
	t8G4+7HMkCXKWor/S9NZAN72RT2INOBAd29UUq5McW0Nkw2JeKxY8mShCZExljLyAUAcNVGw2//3t
	f9bv61wTSFf7p2dRf2HMzANbiwwU+6G8hvJ2EiZmICC2rMTfc6vSKr7hWtfBrEfijHYl0Y42fjsMC
	qCn4O/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmbi-00000007dVz-1izL;
	Sun, 18 May 2025 22:35:46 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAd-00000007akz-1jIe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606067; bh=ngOKSl6OG/tW+9Rxzp2cYqj7UrWaCYxSd5FvuPjMg/M=;
 b=c517hlgaPLnIQTWpIlddcJZMwxIau1jb044zegabkL0+hWKPxeyqZOrl6osHlbjkkD3XLeuKD
 TOmpeoHitsq08kEStokkz67oF/C9wi7gvIDXm7/0VuV9apz8PWDN/6U0xnnAzRBpjv0PDvHanNh
 d648PwSWjQCtx4UfFex2SVXG6/LaCU9qZYakg7BqKb44cEWb6iSMob48N3/7QlGnoLp1CyGaMn5
 G4DaHRtEfIXcWj9QhL9JixA50n97wp+Jnpr/BrIchgIhPGN22DCv6DoO6/fVQDnER9E9++Zs/KU
 tgSFGYhKIES0KcPshvJJI/HZcWQlLRj+00jpSbvYaSgw==
X-Forward-Email-ID: 682a5a2e78cae75fbd8d4704
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
	Andi Shyti <andi.shyti@kernel.org>,
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
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:54 +0000
Message-ID: <20250518220707.669515-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150747_477700_53E738C7 
X-CRM114-Status: UNSURE (   8.35  )
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

The I2C controllers in most Rockchip SoCs are part or power domains that
are always powered on, i.e. PD_BUS or PD_PMU.

On RK3528 the I2C controllers are spread out among the PD_RKVENC, PD_VO
and PD_VPU power domains.

Add support to describe power-domains for the I2C controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 2f1e97969c3f..4ac5a40a3886 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -105,6 +105,9 @@ properties:
       (t(f) in the I2C specification). If not specified we will use the SCL
       value since they are the same in nearly all cases.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.49.0


