Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE66C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM0swreY1zyIAIB6E9vTAuQx73Txv82P4kLUWclFi0w=; b=TWpo4mxkuG46FFG7/Ayymkoqkm
	7J/MGf7H0cszofMdPFprZFUmSUZRs4eH4oWFy+fTx+gDqs+5UtDE6P7l1Skh0FjMHwR0peXgdzH+y
	zLiMxw8qhMON9ks7Bj4Bac5U/uuehAP5ygwPfbugE4z9vJECpCZyXOn+XQBZdXgzFa6PFOvIlksCB
	EzF+ScRGDwwWdDEqBLLp++WpZE06nJhJges3OdXz674QDPAeE4aFVVHqOcU0nWwJX5xLhMRdP2mwh
	htPiQOmp6/wJ5abM6L+9+NJjziElJ7EScN0L/xHnGKxGlyGUaC7KrHM/xBzDqkuMsWXLukE46AOdt
	YR9RUOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QfA-00000005z6j-2gT6;
	Tue, 15 Sep 2026 10:45:24 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qf7-00000005z4J-2iJG;
	Tue, 15 Sep 2026 10:45:19 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 3CAB5130050E;
	Tue, 15 Sep 2026 06:45:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 15 Sep 2026 06:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789469116; x=
	1789476316; bh=EM0swreY1zyIAIB6E9vTAuQx73Txv82P4kLUWclFi0w=; b=Z
	NBdsXjOTfxQLqShF/u10fmxMjcWSCmihmXU0lorl4p4dzoTmvac/Bn9h7hCApnBZ
	RwV+1DI1PsdGqaNDKPzQIGhVzAuV9eY++JLdKq1h4beIQfnPuhaFlyMjGcTSZB2Q
	PWBhczMiu/HMSibgKuALKDAngekjHeiuXaokSrcVAtMweRvVnyytxbeP1SjVxN1K
	Pb+AcTDEgiLiAnLNmmz70nQTjh8Scz+iDk/UD62WHb4+AHY3it0G001eDOmZwab4
	pTdFyhK5So1fyauJ643TpBKN35nVNZUwkuxUqlBtd9fgmHIahMsfvlJ2ewWfGFV2
	Oy3zsYLsm78kAVirwgZKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789469116; x=1789476316; bh=E
	M0swreY1zyIAIB6E9vTAuQx73Txv82P4kLUWclFi0w=; b=jr5jwo89juUECPKIA
	fxvcps5oWmrfFeBY8k72oXGjlMUz5p93xC+Yj7YH0m3UOBIAHtaRAio2dmYOcIPA
	/tTsUHCfT4wsQEEscB9J6aDQEEbk2sWN/TpOGqiYBt7gn4gjrWK8Tq63w1zwwwf4
	ak7wAA73Vab6jufB3Ic2E0hKKvktdaeJAH3/7oxi5yu8iVBZ2sRVNpHoRojSaRi1
	yuJHCbGPTqcnurJh5m9pykGrg4MZzTLSwS807yxDi6nYN69sLoQQ9wj5+ZPVPiia
	uff4jZxkIEe3tHCtZDQbz1dEujSayXj/DKXCcRvV3V31eEFVfYqWTlnBKq+GxBtj
	B8zDQ==
X-ME-Sender: <xms:uyGpasXBVIiPDMQ2tuU2Xx4OvVx34oB7DFKTFZFBSAmrYGkC0rfBEg>
    <xme:uyGpaniAXKMFSxkvUZd4t_aU9d0-H1L8XhEhKb7XsRoJ_ZCxzv1ZbcbYHzy48__GE
    pse1rxblpOwxD0eKb2n7habVsuIlizv3yTztgGWppBk9Gn6pUENwQGJVw>
X-ME-Received: <xmr:uyGpam0uL7Qk0O86M5H2kaKGP1692ZqVwz1Jl9FHlZp8g9knUAxl86SclstQXeE3ZE7kgzV36w>
X-ME-Proxy-Cause: dmFkZTGG3t2Pe1SQ59PtZsJ9lIVvEWiYOOj+0OhEqMiVdyr6iU+SncWxYSaExRHbc/bY+w
    IDwvw0pEZBeElcDo44rRPSGzxThkv1vu71HD6PI/8P1vTeNPkT4iulfMaXjiRLKNHYVVk9
    aein6He4mNcKEJbzo1aFhlbM9FynxX90WqJkFhFHJIZ7YlgFb/2LYweskGuo8VrfwFLhzV
    F59VjdycwptChPkod4n6zXjLHXvqFYxkDDn9Zw2hI6vbJGi0gmeW/SgOGrXXTiKDCS0hvE
    ehCMQh2BKjfCh5AtTH1KLgsisCAf/WKXuD8QWLXjFSAT8ca6C5CzvDf5T/iHoC7Tc1KVVA
    S1IdwXS2VGoXxxGqKXkQb8xscbE8Q6Y0JvzsYbHxu5MjsVUxQa/dDIMyDcJziRJiQ6l2cf
    72No3qjFknmHNlLSW83hFj9f4IciEOPkPLdJas09hDZTKVfOKaZDQUVTPkvEtapRelno3U
    HFE1oYXsx8Nc1SiEmBr96L+YvqaeOSrHj90aFz3WFUnKTYdHeNgB2yRUGq+Cm2FgFqrwik
    bg+ECg0XXlLvP8y1/rHZ9VE3hepf3VzZXR4kvhca2Am/rzI/i0ggqNbGJy7C/xJ9M6R/SU
    K0c7boogVZUK5B6TF5ngxKGI3TfwKXoPNxbTIbzmWhIfIHWw6bM7W6Bq+tgQ
X-ME-Proxy: <xmx:uyGpap27u6_vIdsHMt4u8Mctnlz_UIq8lqLuHmwlMkI-u7b7qyIC7g>
    <xmx:uyGpanwf_8UEuJqvuM1ee7CUkdUQlqVZQVkkP0dxKweJruT8nJ24vw>
    <xmx:uyGpavtl2FdDqxs7hltcWpvR1bwHw1OvOY3yRfSXSH8-EFvzcgCDdQ>
    <xmx:uyGpaoMw-Vo8V5Ij3IG_qC2O2K4Qx_HHxXXgPLkA9UW-xlYeNXOnMQ>
    <xmx:vCGpatyR86IgSQSNSd4MXsxBrnT8dDeYuV9VMQs-iYxxRNUuYeZR8Cp0>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Sep 2026 06:45:07 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v13 08/14] dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
Date: Tue, 15 Sep 2026 22:43:22 +1200
Message-ID: <20260915104328.45901-9-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915104328.45901-1-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034517_727857_9B5C76C9 
X-CRM114-Status: UNSURE (   7.01  )
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

The RK3576 NPU MMUs are rk3568-iommu compatible but take five clocks where
every other Rockchip MMU takes two, the extra three being the compute clock
and the two convolution buffer clocks.

Give them a compatible of their own and pin both sides with an allOf, so
that an rk3568-iommu cannot carry five clocks and an NPU MMU cannot carry
two. Describing the extra clocks as belonging to one SoC without saying so
in the schema, which is what a comment on a description does, leaves both
of those spellings valid.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iommu/rockchip,iommu.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11f..83d7e7c8e 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3576-iommu
+              - rockchip,rk3576-npu-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
@@ -42,14 +43,22 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Compute clock
+      - description: Convolution buffer core clock
+      - description: Convolution buffer interface clock
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - const: iface
+      - const: npu
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   "#iommu-cells":
     const: 0
@@ -72,6 +81,25 @@ required:
   - clock-names
   - "#iommu-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-npu-iommu
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


