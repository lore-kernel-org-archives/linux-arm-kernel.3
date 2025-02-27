Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A7C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS8EdvGPaOo7zCDoFD9uMhkn/FUO+ddnyL9qkYr6zIE=; b=IN+1oLye7YhpLXfaK1Jssovwqs
	/HGIQfga12ydengerXjEnsH/sE/fZy0qVkTBBjCpcRq/CWtq9PydRhj9nhwAgQJe39seeVM+GTnLS
	gcbsV/AgnKS18Wk4ouvPVV/3flacKOTRNn0soXiboJJerpPe/ZcLYIFIVPXcKoAq1eA3BoQUIBBbc
	vpwjTdfZaqiBgOJSZkA2nUO8nFUsv/Fx5CHIhzdMT511EdfMc3LE3nOt7AKLBcU9Ti0nImtWxMhCL
	SaaEniGC6lj/0sD3BILmIcR65rXvIzo/4Wf79g3874JC159z9F+wBov7Eo0aaDYslXoN6SBw1XegQ
	tym3FtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmX-00000008dZx-1Pmk;
	Thu, 27 Feb 2025 19:42:53 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnioy-00000008LPb-337B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740681679; bh=eS8EdvGPaOo7zCDoFD9uMhkn/FUO+ddnyL9qkYr6zIE=;
 b=M4jYh9QPs2bi8h6AzjOE1Y16h/kSJy9kozyAplPXfLiGiau+k5NH7trUwRNfnX/bJEvqKS0Rp
 N8KrezfuP/cOl9rQ0NygRaYnxUxnP5XYRZ0nx6r6UP3GRCFP5H4Bjagw3ZWYX5iFRiLVBtP3jLe
 Dr9gEQ+AktAAFMQ8gkTh1vNB3N8G/BQIsWTrAPpFfST32rIJ1AWipszhXaycxRdaDnWSte1U7Qk
 4Sh+zp8awBrCOgTgXLnkLZUrHf+hjbjcpPmio7M9pTxuwm8dyM8lBQXhC6nCIvTDHhIP8tCCiCU
 I56Wpr6ZorvbxqNkUDhhAsAT+cNkArKACqhCzTQIFyXw==
X-Forward-Email-ID: 67c0b1cebf572996e8621467
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/4] dt-bindings: iio: adc: Add rockchip,rk3528-saradc variant
Date: Thu, 27 Feb 2025 18:40:50 +0000
Message-ID: <20250227184058.2964204-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227184058.2964204-1-jonas@kwiboo.se>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_104120_871659_A00CB951 
X-CRM114-Status: UNSURE (   8.15  )
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

The Successive Approximation ADC (SARADC) in RK3528 uses the v2
controller and support:
- 10-bit resolution
- Up to 1MS/s sampling rate
- 4 single-ended input channels
- Current consumption: 0.5mA @ 1MS/s

Add a rockchip,rk3562-saradc compatible string for the 4 channels of
10-bit resolution supported by SARADC in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index fd93ed3991e0..86eae9672c04 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -15,6 +15,7 @@ properties:
       - const: rockchip,saradc
       - const: rockchip,rk3066-tsadc
       - const: rockchip,rk3399-saradc
+      - const: rockchip,rk3528-saradc
       - const: rockchip,rk3588-saradc
       - items:
           - const: rockchip,rk3576-saradc
-- 
2.48.1


