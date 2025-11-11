Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67C6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEimgvO9FbydGKYDZAi+OA9bdxdc/t9KnNEuVRqer4Q=; b=GGHR4Jyngx9HiK
	rPQ3FMosiqwGCa1t0qdGfYi3UY8LV2InuWEa/wWQLcv/5TKFHbW+WPsRrPDx3GkxHI1a63iHzFcfJ
	qpZgtehYud9rEPrDcF755Fhsua3j5+VH/hQWT+KFwqFwnnwfCNsRtuRlS3HkfN8Yqozg4uX+0YIbD
	vCHLKJ/qnYlYwASx951/hZOvB/x34CI0bxSqD7ORmmvLADji8HPg9wYrRDnU/hPX29nOIVMaNkRv4
	Or6XCJudUZnjcPRe75ErEn9J/1AJddaWh/NXv+Ee8tAshq4CZv4rPIf5wN6Uw9y9CRtDJQQ6fvfvJ
	ljKNJLrdc1jD0+f6qF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIs2f-00000007WZO-3McP;
	Tue, 11 Nov 2025 17:20:29 +0000
Received: from skyblue.cherry.relay.mailchannels.net ([23.83.223.167])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIs2d-00000007WYY-3G2H;
	Tue, 11 Nov 2025 17:20:28 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 81CD47E18E9;
	Tue, 11 Nov 2025 17:20:26 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-124-9-98.trex-nlb.outbound.svc.cluster.local [100.124.9.98])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4F03C7E1A7E;
	Tue, 11 Nov 2025 17:20:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762881626; a=rsa-sha256;
	cv=none;
	b=VvTwKOUpRnJWgxs/U7fNXgU+EhqywGHzwF5L2ad1/FXS6ip8RkpPn2lJeuB78dhs3eMDId
	eltSOR+ZY8TE89kudLuKEgKmBCgqKEGbZ9oZGP0ZPTCU8JTZS2CqN9NB4/BjV/meU45+Nm
	OMCh6PKa6D06KwxSd6EYSMPNIdZDJkVWrntpCykPva2nEyZKnzsLmRY2t4Okbfq2saj4HE
	afmXePTiu8RLkazujXF/ocmD/KZ/2Q1Mfn/bXb/7+m9p+pKimR61zBYY0OxagVrz76sEjQ
	+AvfN1U/FGuhhNgP+gSKxXSKDfgDVY/5r/W2uB9sLLigkUDjrvKsphxyFRR0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762881626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xEimgvO9FbydGKYDZAi+OA9bdxdc/t9KnNEuVRqer4Q=;
	b=bHtT05ZrEazOxh0b7s6novbb9FPtrrcNDZWP1lIvBlViKiuZDTs3K1uBon2LPuTHVnQ4pq
	q+1+YHyKt3I0HF/N0EggSdEq6SoCWGF2jkMHyvHIlrYJ/QhDHekSXZZId6kd1PbWlVi53Z
	duCcPB6eSWFgdHtAxoE/nPN31OTO3eJD8aiL3xU6w3EGUuR/sBX5XXHF22kZSg04E2dUas
	331ctt+mvAwuBtcvy1mD4RFVJIi1qaqZUEmxcmC1keGF21XdEYBG/gGAjWAgOqYzhaEDQ0
	fwKMlBlgYjB5SqK2gz4JAhkFGG+43WFmAkc/ETRQ36BcLndG5SagGeieiZElUw==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-f69nt;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Towering-Shade: 5182774c58ba6c7a_1762881626347_4281697641
X-MC-Loop-Signature: 1762881626347:335366262
X-MC-Ingress-Time: 1762881626347
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.9.98 (trex/7.1.3);
	Tue, 11 Nov 2025 17:20:26 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:c518:3c38:613e:ee54])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d5YFf1BZlz1yRY;
	Tue, 11 Nov 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762881622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEimgvO9FbydGKYDZAi+OA9bdxdc/t9KnNEuVRqer4Q=;
	b=Ys+p6vvtJdRhTJ0LHR7/bsmMe4zlofuZv7LIrFQV2HnPclLxl5UALRvA/9DNANgq9nbXt0
	A/6ywtZ5y8bYHbcmURnLIArEvJ4JqxEEa/6LkVycB/1ONETJsrQT4xa23N3vIpGyfTtFv9
	J45NDYbDitO0l5vv6F4S0L6OUd/pTP2CHPeGDL+t9zgwCHXFI3jsKnB7vSGNvcE++RULR+
	5lM+GgTxAW9UGkeap62ULV3ltG6Ijz6O6H+qa0EdCWSkGlh7u385432YdJF8RdeXMPwZR9
	Fi/nAfBYwMAlWHNuHyWe5l18jMkp1SvOy/rZDANhGxwriORQg9PdyixpQ2sc2A==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Asus Tinkerboard 3 and 3S
Message-ID: <20251111172003.2324525-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com>
References: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Tue, 11 Nov 2025 17:20:22 +0000 (UTC)
X-CM-Envelope: MS4xfME+LT8k9sz13NZY7Bg6fHQMkoZ8d6CueaNPZycRIzXB+DFOXJdDTtotaA8kDfh74NoOJFTDrCXUoZJOwAuqxHq8+v9qr6gPOhdtZWpe6lscL7mSQfCt YIw6cILIbeLmKT0iaVdFwsVvOzXyUBj3mASis1fIjV0jtIFhcZ3Es3XumT1rF1nnL6y7aYZCLG4MiXc+ABpMDH8A59sgQeDFkESGWNyBATfq5DarvPNLHiMl 74mRBxiDO5u5X7R9H7KCAVR1vGVW3rZroeRI6n0t9gRVjoJ+l+2Z7n0x5cxxMWjtHTL1l4HcI/p9UZ9hbZEpl/j/t0KOsz4hliwU1qaTUn4Y2+vMAmScCVne 3LLdZ5OJuJQjeEcpVPbqSgFIUkc+D5+BCSFu7fTVshWIj6ntpJNVlPsKgtK4eAl+236cVZP7D7NVvTXbl84XIQDTtfHweiqjjWpNeddh4Q5OFS1wa8f6fJox XtZBF+M3BYVKCwuZfa1JM9HH4LkEslKFNdB35vhu1wOivyR9yBqUGt3C97aggMftbiaIGbYMXN+rIW49ybhrfK29dnq129hhJGCRsHb2XfBNRE7qadQNxxuJ uzo=
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=69137056 a=4Ac7OKPmaT9y8oRpUfBUJQ==:617 a=xqWC_Br6kY4A:10 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=k1XjlL_sdP34A_Td12AA:9 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_092028_031296_B92BB363 
X-CRM114-Status: UNSURE (   6.49  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Document the compatible strings for Asus Tinkerboard 3 [1] and 3S [2],
which are SBCs based on the Rockchip 3566 SoC.

The "3S" version ("S" for "storage") just adds a 16 GB eMMC
and a "mask ROM" DIP switch to the "3" version.

Link: https://tinker-board.asus.com/series/tinker-board-3.html [1]
Link: https://tinker-board.asus.com/series/tinker-board-3s.html [2]
Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..451597a6cffb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -86,6 +86,17 @@ properties:
           - const: asus,rk3288-tinker-s
           - const: rockchip,rk3288
 
+      - description: Asus Tinker board 3
+        items:
+          - const: asus,rk3566-tinker-3
+          - const: rockchip,rk3566
+
+      - description: Asus Tinker board 3S
+        items:
+          - const: asus,rk3566-tinker-3s
+          - const: asus,rk3566-tinker-3
+          - const: rockchip,rk3566
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1

