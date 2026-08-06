Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9612C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=arYmO0Vh8gbLAxcOt5hYXkb34p
	IdjKpKb4C5WoMbAF6BGgrb0IWgM94CLEOz4CshEWI7RIYWNxYM64qO4LYvWG1r5uujOr04uPUPZfj
	uBXq8zqWm0c/OeBJDQwmBfVlBBRoD48sf1zCYKvSYdirxMXI1gU4Bz7OwjjHc5CHy9TRq2X8ECuDH
	CvCpL8mD1c3zFhaGSJLEEpckTtmDimQQXGDCweHF7irrA93+PyC3rUPk1ljfVKvV882WyA4apqrFe
	gTrNaz7JQ5QKzl1vj0qnmgqfnp66k6eujFc4FlrYgs38zF+TtdlPKMa/16gw+PNoas2DfTvHopmIj
	a82JWipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrgq-000000053Jm-3Skb;
	Thu, 06 Aug 2026 06:34:52 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrgn-000000053IH-46EL;
	Thu, 06 Aug 2026 06:34:51 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id C173513000EE;
	Thu,  6 Aug 2026 02:34:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 06 Aug 2026 02:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998088; x=
	1786001688; bh=AnRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=j
	Vo7OWtWsPzxvrYMszx6TmSpH8vDscYdf/75Y8C6pERPgq+gB1dznvW4cSFu8jpjF
	f4UWZ69/tJZ86tA6x1hGrhPrJIX3TIOcq7kdmeHs3yXocY5epgzS+5LVrAATa2Fa
	QM406Hkr3YRl4OF2wnJUBxsFlrEQT0mxmT3/MuhWj+eFk2NJrMYjuxmfPnEwO2/d
	OJtIOiXqnnbQtKQf4IMC3yZNCkdGkt+WXIjUb5CKTzmTPeGGvHcNv2jp4V3D4i9/
	0Jy1FUAwx0ErJTgiI5Uaq7xhMInTAuV/iluEKEGuPQslIyiuIyEuC7v5aiMlrjJF
	6c0cOoGtWLmtVk+XhjEMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998088; x=1786001688; bh=A
	nRpSSR1MsqH9LAlQncz/jaOzpH1LWDcFn32HaGkRrs=; b=GdddeNOtKmX5W+dvo
	laHjsZMHpQMEJd222t2Q98z21TBpgFVPh0w//cjJ1WVkiO3RLKDdq4oof0DSIXhS
	SfVd9KJdcwHzuxBCkrmIDVHP81r0B6VTVeOQ9A0onLP4A8e4vjEIeZ3hZg9JhiwO
	47IkSsP6yOgORBUdZb1VKf2qfqjnWOX+S9aj6aogbv+8Z5LQRPUiljX0bg5nrKod
	zgZFxStzN7o2Vll0S6Zm4/Kckmqhdo2f+5YrOVTvXwEH5LYoYW0l5JICUDjjAelc
	hS0n5ZqVXaFop8WMsYLDnitMm5Flr/+qknValMX8rg++WZX4sJMaAS6Cd6i65x9L
	se6Rg==
X-ME-Sender: <xms:CCt0aiCIeR5NuczN8CCm-rFdNLfvzgcXsDy7_ZNWkcMDEXTiLTDheg>
    <xme:CCt0aorkLcDHMdr1cIKOyyrn2Rwsiemdy37GNhfYw8C_-41zAjRGjHZQW7MwXCuKH
    xH3gyqJ2cyUA8-S7TNISPNBnidqPQaL8uUGaTHZyD6DTFZiVLNVQQ>
X-ME-Received: <xmr:CCt0ahaXYJKuQAVJeJaM1cMrdHI9yY1kWc69JLAE2nNnyXkV8UN4sJqLogiXFEMEypdZVddVIw>
X-ME-Proxy-Cause: dmFkZTGFJBmuMX6/OoMIUUbGTsyRPYhG/uy10uEHxPhEMy1PtqR444ErfelFkEd6NaLDUC
    EBUCOHXp08/9Un39jJxgI9b2esIOnp5rWanlB4YhinnucbzSevlRBcSlxqBRgtJmJAytlr
    8jytKxWFTXZF+UV2dS5D5bsKb56ES/qfa3QMJcUD0Qb7oa6fVNmmcPyHheuE9wg/2fDzZ7
    r6RjRj3Ca3Q7rZqID3DpbLJDs+lnzwJj3q0SM27msM26I/izlHpq2QekLfMQvsbdpgH44l
    1K9VPvcjZ1lkCA5hd6bzp0gHNELw7gmJmQS1Sr9fNc+XDlEyKd2OlO/Vi3aDTcob1YIXLQ
    LxZlV5GazxcH7BrV7X3Ie/38Cdt9HHtvkKNS7cnXAoHdzAdp4EiJiFF9pCYJJgMcp1CSsf
    eqrv3v7tNKg0Jooyxx2PM7Xt8TX0JCtdIWx3YN3VnshI2whsH8802jrKOTNJUIgPWxSyJV
    T3csEgu3z8+eu5/aBWcRAIxNhPdyK9vM8WRm6yNiHr074z4jupWDbfprP3thrvcVdmwwQd
    4xu82xLfnY7gmWH87NAnxZSu75uJahT18hYUrMFANpBwJ1o/IMzJiXyXlvEW68YnH+EqHS
    l0vgs0rCG+EtJ0/NIC1lbnIrE4ZEJTZtEEe/O6DeKyQDi2OvXpWZ+HsHhM+Q
X-ME-Proxy: <xmx:CCt0aqGzggoZLWAmWHaeEj-cEKrG6wAA1nfoGqXxVhlowHVDow09Dw>
    <xmx:CCt0anbScxpTECDdxeiouShQYnaANErB0nms9bOjmv1vab8pYEtBvg>
    <xmx:CCt0aveVnQQ0QhsXIgCMVrttkaywru3zLmp5jZ-zRGizhlmAJxhCrQ>
    <xmx:CCt0ajAh9QHoPhpqbDNedc4jJFxFH60VYwRPlQpH83PdX5ebVw5orQ>
    <xmx:CCt0alV9IlewKxfyuxg8uDevoYL0X2PA0N5o-lK8MoSbjYzgPM931yEF>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:34:40 -0400 (EDT)
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
Subject: [RFC PATCH v6 2/9] dt-bindings: power: rockchip: allow resets in a power domain node
Date: Thu,  6 Aug 2026 18:34:06 +1200
Message-ID: <20260806063413.350184-3-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233450_055425_47D0009A 
X-CRM114-Status: UNSURE (   8.26  )
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


