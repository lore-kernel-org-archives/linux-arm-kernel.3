Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5FBC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=0bH9zF7GggDTwJc1hvcjlP5BH5
	MEmDVHYt0K5kLZJIUhEoQxTWeTMQp73Iik1eYUGCBVx5cfcaELJsIvZ4eItBRf8jdg7eqcrC5U9W7
	wA6ROB/qcdP8LZ97rWPIuy194LiqBseo13NqsnjYpd8btbXL2wsj71davP6mNkq0JytjE5asVM4a4
	bPHBIIM4jR4ijruoDyGMtOEMEhk3sOnrCUQnK7FbmeSNMMSTqnzOT2JFqAazDsfDoN7Z7EJl6JUkl
	NA00WnGPNLA/ZkjZvN5NaWkVU4ozy1HTyudYRfk5v+P0HfDIjJaa/yhsMDw1j6ZH7lQ0drQU+ShsA
	+8n2JP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHM-00000003JxL-06pg;
	Wed, 05 Aug 2026 06:39:04 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHG-00000003Jua-0raz;
	Wed, 05 Aug 2026 06:39:00 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 6464613802B4;
	Wed,  5 Aug 2026 02:38:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 05 Aug 2026 02:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785911937; x=
	1785915537; bh=AnRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=C
	2fX2KrL+igP1MjLtPsARrpOlrO5enNqzxkcgrBh5U24vIK0o9aZbhA1vFkYFD9aN
	ICLkqNKXqpuIVpPfiHlhU0vYnLBmJJ3USw8hx9L/sqrLwmhYrpF69D5U1RYkeIec
	xd0pj3S02//oQ6cgYLk4NNy+o0/h3O467xMFBa9nQ7X+UpphmkYWQoI2PPrVyys0
	FqsPjFioogHkzsphM4JF1iwNlK2nQOa4aS7VJQowioBRUA9jDyHdRFdl5k4Dx5IA
	ZG3nszOO2fILTwpOyYG2Oc0iAIH6o6t4MZksYfU0x9BAz+9hTNq6i85dDtbj1jri
	nVCV8AmRJ9ZR+7SB8dEhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785911937; x=1785915537; bh=A
	nRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=IXw1ZGHXZNUUc9aoi
	3T4jw0qakQw1OY7chTQ3+maxbMWc1C8944vvuD+tFag9CbYYBCpYVcBH4kKcS5Kj
	BWdis4H74VRvcNoUMruaJi+bRTQ8aK/N6rCSGcPhucaKq8e3hDbsaEwQYQIBnyhL
	xuKwnXJHg6RwRN4NsHAGP7QWUqvsZ2jibX57Ky0UMCO237DURT96f8aTheWDwGf5
	c0PiaP0nmABlLmp2I2CXfTdNkf6vGh2eAnUG/afkg/cppLv0k8XuLZ4u7YsTZj2E
	SyD+TMc80qyBSbOfb/HlM7auhecO6saPOem70RySEcREqIfdYXI4oZdH7bZYqWhr
	ln/TA==
X-ME-Sender: <xms:gdpyau1hle0rvLBEVnMYJs8JEjLCfToYwPkww2LlrBzpfSlfPyvclA>
    <xme:gdpyalDnO_l8W9pzLpzvZXA2zo9bE-0nzfouZqfyoA51eCGRUb5UUjFFxAm8qF59e
    bNwb-gUA14umnXmA6zIEs4fIJ9Xxmzlq0PZx6ly3FKENfEbWpQrQKBF>
X-ME-Received: <xmr:gdpyavac0NZSSYKeFf6P0lqrlageZ63FF-tFLfWcaVSYDxa46_yiEz0eYBoJBRkdOY4I5bANpw>
X-ME-Proxy-Cause: dmFkZTGweWZ3oVrdbXXe5zNbY/1qm1pdBIKLQOv4wqtwxzIaCfusFJaUYDgRMW01OwQqmB
    PNcsOh6d5VtSN0ib3zlEWexayeHywWIm1PgtBDTmi1jqIXlJ4epZiRyRlOvRuTP/H94+Wk
    lk56ToFXuoLAF80uX/ZVFpHBbYL9/inXConVeGj5fP4oIjygHxURzt/8P2LkmOCZkpV/Kj
    p0I4ZXMhB3Hn7OHdNdqEICLLcaUpxq7aYzGqf1zEXgoEoToiw/A8MuK/o9jyR6a8MALeRg
    Lewa3lXhOyvgeH3GuUZQ4nFdlSaJtvfszCwH+l3e0Qw7QgR2O5+vsW0n/AqGh0ClOQOjeE
    IzRN54JhfqnC/77IShTfq6E3RMNySV0FMKkgIyzuaP/G/H87lxPlXokjBUPPgh6n3iR+n4
    EVhRQIDjV3Y0Oc2Hqyvyx+860ZiTN73i0gpP4NCgNGrl4CvoRUVIMxnxlaF84ztLIjs+N4
    SCj96exOMbRpBaQndl+yyuTImm8CFOY5IbpS9CQAuGEmOeuez/M9SQTROpG6ObXOxCqzTN
    kv2Mz2g07fFzQXOmVvoxFRfBFDTo+DhJGIw5UjiUF6jIppi2yrQwMw03O4MQ5NE4xHPZLF
    RLo/DcNHBRHQQXWorLmfG2HLA3ywtFOe1FoPm6tZi0HYrrxmrOEf1nAFW8hQ
X-ME-Proxy: <xmx:gdpyapbpe1xGWKVRZaU0T5HBl1ReJ5dO26A9O5wWhx9eDT0DtNVSzw>
    <xmx:gdpyaomLr-0C0DTyI-dMRIA2e7G8XFGHTfglJI6TEhJq8mWi8JyvgA>
    <xmx:gdpyajSRsFrnqucjAgErOhVzf-5lbG7AuuYGNroeXkYMk-cRUr2Nnw>
    <xmx:gdpyalWxg4OuAqnHisFMSq8PJyGJUTNVnoYvurgdjXRwwC-CbxSiRA>
    <xmx:gdpyaokveceCzwvrIDLpYte1nVwqBE0wJ83ItHdryJgw6ZhuJkt-hwoK>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:38:50 -0400 (EDT)
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
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v5 v5 2/8] dt-bindings: power: rockchip: allow resets in a power domain node
Date: Wed,  5 Aug 2026 18:38:20 +1200
Message-ID: <20260805063826.95682-3-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063826.95682-1-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_233858_317246_D80AE391 
X-CRM114-Status: UNSURE (   8.74  )
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

Some domains do not come up in a usable state on their own and need
their resets cycled once power is on. The RK3576 NPU domains are one
case: without it the first access after power-on takes an async SError.

pd-node has no resets property and every nesting level is
unevaluatedProperties: false, so describing that in DT is rejected
today. Add it alongside clocks.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../bindings/power/rockchip,power-controller.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index b41db576f..f23c1a118 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -136,6 +136,14 @@ $defs:
           A number of phandles to clocks that need to be enabled
           while power domain switches state.
 
+      resets:
+        minItems: 1
+        maxItems: 30
+        description: |
+          A number of phandles to resets that need to be cycled once the power
+          domain has been switched on, for domains whose logic does not come up
+          in a usable state by itself.
+
       domain-supply:
         description: domain regulator supply.
 
-- 
2.43.0


