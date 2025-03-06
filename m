Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B113C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djmaXEsM/Omnu4PtvCIeIWrP18OoUBJglDTF0IRvmks=; b=CF5THJzDuKjw1zo4WXsRt4JD1v
	jhUPQsaQ+oe/yUorFCLkDpxoKLReitbKctRWGTiJHU3xAIxXNsN0k5gnQ1DtGmuVLyIJBfsYGxAqf
	uhEJ9uZXL+qMh/LzgUJHEW43FIdsWvd8SDL9n40DmZZ9MqISgZaAqi+wwI6DwIocxEQmAByUrtIuk
	7CfgEPskUyQsjWyCSdlZ1Zgae5FB2Bzr6e1BIp8NqS+Bi1r/s345fpG1SuBHVbfk+nipMd8HtE+bg
	nmBRUw7BdlU4uAmXazmnbpN1y9LaSQCQ6jQD3BMur5yD/KCIX/wkhlkNWkxpJ00oehmJf6KsTospa
	vsthyU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJX8-0000000CLcO-2DRW;
	Thu, 06 Mar 2025 22:17:38 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJTv-0000000CL4P-0wNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741299259; bh=djmaXEsM/Omnu4PtvCIeIWrP18OoUBJglDTF0IRvmks=;
 b=QMXGQoGH46B8+D4JKZuDn68PTuPrFSY5KGU/boZev3fi3DUl/YcUA8+f3FRUeU3Jpt1Y6udWn
 UgR48sVSg+POvJZ9bHC955G8Kw0L5fPbi4bsHWME9HmtjzOSj/qd5lElsoiSqbrqtnMxdR7pPCe
 ijnmm9bZ6mw8sLVoXqHECy+2EflcJnNmf+BEhaKZImndL5MFvrP6o1+Exi0xPes2ROwfEv5uk+k
 lODUgOcByOOmxe41ie4zLk00zrQXYqczfSw1qE9NOEMUBcj+1kBFUslV0UCLGgWJgBUiGpbemsD
 qsyVsjSQRv3Stb1DkrllPupus3EuG47X/9ePhRK6kO/Q==
X-Forward-Email-ID: 67ca1e34c1763851c065bffe
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/4] dt-bindings: net: rockchip-dwmac: Add compatible string for RK3528
Date: Thu,  6 Mar 2025 22:13:54 +0000
Message-ID: <20250306221402.1704196-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306221402.1704196-1-jonas@kwiboo.se>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_141419_297916_904A402C 
X-CRM114-Status: GOOD (  11.17  )
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

Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
Ethernet QoS IP.

Add compatible string for the RK3528 variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
I was not able to restrict the minItems change to only apply to the new
compatible, please advise on how to properly restrict the minItems
change if needed.

Also, because snps,dwmac-4.20a is already listed in snps,dwmac.yaml
adding the rockchip,rk3528-gmac compatible did not seem necessary.
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 05a5605f1b51..3c25b49bd78e 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -24,6 +24,7 @@ select:
           - rockchip,rk3366-gmac
           - rockchip,rk3368-gmac
           - rockchip,rk3399-gmac
+          - rockchip,rk3528-gmac
           - rockchip,rk3568-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
@@ -49,6 +50,7 @@ properties:
               - rockchip,rv1108-gmac
       - items:
           - enum:
+              - rockchip,rk3528-gmac
               - rockchip,rk3568-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
@@ -56,7 +58,7 @@ properties:
           - const: snps,dwmac-4.20a
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 8
 
   clock-names:
-- 
2.48.1


