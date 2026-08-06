Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678AEC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz4911OQ/U9WwE2DmYwJp/fanXix6/EOPELe//q1LB4=; b=TZBA+rayhh3C5TNnRuOhUWBS9w
	nu9WK6WDXtusVBa+Gkj5EazJJHS1HP+AeX5eOupR2Hp7Q3R7vTUHoy62HZa23YKJ4GifpMtr5RdNa
	GgKuZs8bhEOtHVev4AjSc1ZOUPGqeI9fv3rOAP/nhx0pVUYwKivUTQTpEobv2lT3yH9xzuXQiV6Oi
	fO19l81bn2VJlUh1m6xzxyne0P0IGbx8onGhvTeBUcRkIY4CDM8mzDH7IBr0iZtrz2RvjrcjnbeQY
	HqHpoYuKcUh03c0WHmYSQ2YKyDvC+x5+d4pLiyhZ6ZAXHH42oGCYYrRzi/1n29QxkA/+XQWYSYBDz
	drfVdCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrh1-000000053Qa-0hV6;
	Thu, 06 Aug 2026 06:35:03 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrgy-000000053Op-13WA;
	Thu, 06 Aug 2026 06:35:01 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 1060D13000EF;
	Thu,  6 Aug 2026 02:34:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 06 Aug 2026 02:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998098; x=
	1786001698; bh=dz4911OQ/U9WwE2DmYwJp/fanXix6/EOPELe//q1LB4=; b=A
	ubB0woDN8UqXqQo+j+neh0DNP0Iri/Ewk01Be+cz/V1DRd0zQikUwIRAj8YIIpZC
	4kHRW9hDmEOUG+Gn/JjSpZQCRJ75y/9xhXC4u3elzMW/xCoH0FJypcFuHAD4Q9ll
	OsykH9ON/3mRnfOrRBSVMS0242Of32Twq8jdaeJKVQea+znnbPLQ1skpjX7+xAqq
	2zkFRSbF5aNYLIdetpcO7HTETUj0r22Zz2/mtWKsnjiApRwKrX2HLfUECUwZq3+W
	Z/4nYf5WOa3i/0jEpA6ZYucI8TPPU/7FM9U0gyF8MHD676nJQ/66jUYv2+Jh3UDf
	/JKzrxspoAOYX/FsxG9/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998098; x=1786001698; bh=d
	z4911OQ/U9WwE2DmYwJp/fanXix6/EOPELe//q1LB4=; b=l7aZSliohhl+r4GI0
	It9Aij6q8rx8tMSP+u4DKC/atm4CQsq826U3u1eduWgLqQvwsJzKzn2XoMSSi2uS
	H2g2HsayHCldYAaYTdPH27gyLtSi+dr0zHKZzUOkYF0nB+wEIRL77l6k0e16rt+F
	MMeG6jD28xT0keaQngaUufQyDha8hXu0IB4uyF3ZG3QYTOL1QQ/s9W9Z1R/np17v
	akhB5DVDaTpuQkT9xRqLfkQrBW1gojCZQCuZF3mzW5F5qD89vlSL2qUDU96GM+li
	Zn6fB5sDgFRL2Fq0MI4vZ2/bWV0efdem63zGCfFRiJzfzjNb6j7/2ZQtsf6WBp4W
	Vvs6A==
X-ME-Sender: <xms:Eit0akhUh-yUx7SAA-LoNJSu4CBnh_iau3LrqFhoDKQCkzP01J9kHg>
    <xme:Eit0avzeAZbvtYOkY-GY9B2OOHN9EZ_th5A7KP_o-UGj0LaKyGiDl3abGOlNyBvgu
    utsYIc7IjNN-TJONiwZ68mSR5DRClXiASa8zRpqvtQrethpLXNlcRU>
X-ME-Received: <xmr:Eit0ao_0zjhLAASQGmc59X1z1FTVhdPyeO97wB_wp-yLDWMmc6mI1NEh9leRRPWjzqAQzu4eEg>
X-ME-Proxy-Cause: dmFkZTEh6EqLEron4P620rfA50oje5pogyeStsqRC64znWcm/DBV15Jp+RPu9rfpq1CYYb
    UFmLU5UCxdxDCYby+qIAZtXGI2PUlpFQNXwfYq4ttCgPHbGa62/TDDwxKwLB8tX7dfhqau
    EbUP3O00RQtnFbFjlgrSaMtfjvGvqyYuejLHQ8kaCQjYwTQGvwYjMVbSb1Jvpanl+FPpuM
    SqFyNQH/92jvSpo2kN70zd3lo4jOKuY6rGBanj09NT9Qpf7fxDVsJep1Tqo9Yuq62YMLgS
    +erfmDCU3gBbJvDrolUKAZwfNdHwfv2Y4EHW05E61S/1zu1MOw9sAC69rBYAvxBuvfJpXF
    rEZx9RIYKVmVcDnIWMeFyHATrOa77nf/u0hgh+JumJM9xqWojT/nakNe5Ca1TcSoc0wW5A
    pfWuBXecjdDNuGaXFetXLR1TxZot3SP7PiTyYTJA3P56rn13l0Alsdm9BFPfpS8LKhi3x2
    37lLTJyX3qjzyzA9u+apcedkf56ta1cnkenebGELsi55fXtOQYPL3Jdp3nuC1hnD0nx1wo
    ltHP142i/s6J2sxM+e5VM7yBd7A6P9Tl5K2xJKVzu8ECSnVp2UxK7+p0Qa2lR7IhFX7L/K
    iVbFCFW1/U6wShabiFJaktv0H9BQOi9qdIc9qbg0voSKxinc7fW6lYHmImAA
X-ME-Proxy: <xmx:Eit0asxLqZI9JH9-0g9VLtxFC8NVL9H87vrK1o-Faf69nGDzRYq0xg>
    <xmx:Eit0apWDra3wAuI4KumiIa-udV1nSnx8NwrE9q1p8XWhu9fOfgbW-w>
    <xmx:Eit0anZB4V7IdK3XPs4cIkq9Yr9oLn1UgDVoPeiE5y1hGSvSj8FBPQ>
    <xmx:Eit0amRiY5Rd004pefWYLdHMskFia8N9Vtv6BgTUpm7Qf5-ZECnbEw>
    <xmx:Eit0amscsrBoNQWkUGrZQNS2A9qPCsxS0i1CdBbdkwFe9xOLFg-tautu>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:34:51 -0400 (EDT)
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
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v6 3/9] dt-bindings: iommu: rockchip: allow the RK3576 NPU MMU clock set
Date: Thu,  6 Aug 2026 18:34:07 +1200
Message-ID: <20260806063413.350184-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233500_324348_AEDC67CB 
X-CRM114-Status: UNSURE (   9.58  )
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

The RK3576 NPU MMUs need more than aclk and iface. With only those two
enabled the MMU accepts reads but silently drops register writes: a
DTE_ADDR value written from the power domain, while the domain clocks
are still on, reads back correctly, and the write rk_iommu_resume() does
microseconds later does not land at all. The vendor DT names the CBUF
clocks as that MMU's interface clocks and its driver keeps every NPU
clock on for as long as the device is powered.

The driver side of this is already upstream, commit 841363ebb508
("iommu/rockchip: Take all DT clocks"), which switched rk_iommu to
devm_clk_bulk_get_all(). Widen the schema to match so those nodes can
be described. minItems stays at 2, so every existing devicetree, which
all carry exactly aclk and iface, is unaffected.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../devicetree/bindings/iommu/rockchip,iommu.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11f..a3cedcaaa 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -42,14 +42,22 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Compute clock, RK3576 NPU MMUs only
+      - description: Convolution buffer core clock, RK3576 NPU MMUs only
+      - description: Convolution buffer interface clock, RK3576 NPU MMUs only
 
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
-- 
2.43.0


