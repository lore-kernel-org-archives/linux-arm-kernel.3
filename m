Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62409CE8D4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUnAch7ahn0XdLMBa77XE5dbI/7gL7z6PUFVrXkOJaw=; b=d2HkBQvPRtG1Fc
	mGIL//jKQa/sNHFBggUzuTeDYjHmcVYQ4gBwSLoezGKMlL+kiZlJPrzam63wnHoHw5jWRUKatSZTg
	JKN48T3OgsufjA1+ZnFQyeFOtBb0CB273laVteXP6uDJ2O4bjBKspg+9ykXHIkbU36MtLxTUFZDMq
	GwTD8tSZfxUW/j7yauu2pbxd82SrdoAVa6QYqMdM8tZxZ4oEIO9N1dukhFhRD+MwPOvDQ9lrhtwSd
	Z3LLiwKOGvHa8SFPhhpzCmppAtM5LXiTV4REkpuH3bWgiUT02xIfE4oaQElHvfP3d/N1IQMe8Z02Z
	uF1uhnGbMSlxb/P/XUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw0l-0000000CbeE-1sv6;
	Fri, 14 Nov 2025 15:46:57 +0000
Received: from hedgehog.birch.relay.mailchannels.net ([23.83.209.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw0i-0000000CbdG-0TkX;
	Fri, 14 Nov 2025 15:46:53 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DF6C77211A1;
	Fri, 14 Nov 2025 15:46:50 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.98.40.135])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DACF572175F;
	Fri, 14 Nov 2025 15:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763135210;
	b=95ZSSUTFl1HHAuuvSfr3804NNqLM5dm+toNylV0hhOJok86pH6Af8VhBqzZnoiCf+C6J6w
	EyNMCi0+Ogrwq0wyFlceUMqA9QOm8/tcK8hg5Iw1D/3/7kLkiTd8pZlpqFVLjd3y9/FAa4
	KcOwDWFGfWHQdWl6obWg8m0gV+I0QU1P/TqfHJo5rC4h8JdqLzG1nJl+/GgPYvUSGQ+xdp
	T70cgtEttLSX8zcYSsyxF3EHqHZjdZ8gssj5j3nLVVtqW2W9+zyuqRvVX09xUGhGdjeXD2
	t0EBAxJ+LYZWbg+s7hzIFZsjMihyigaZRsDO+nd8zOypzu868KaY0Fx2YwXWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763135210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xUnAch7ahn0XdLMBa77XE5dbI/7gL7z6PUFVrXkOJaw=;
	b=72VvslHys9tbKHvf0Z/sVy0x5aiBjjUdzjnerAqBKJV+BMJzpQg3tR1E3G5ixsvedDJdb5
	unIf7xzDG/t5afSfEZ+ZWiL3KR/p2V7KZ4MnFeVr8MAceBuMxoQgVebINbfGhSm8n/jnUZ
	E+/V5buAU5ihUCWoDm5uWdW9hKxP8AdVPc4kG8/aSMUsnnbHDnYD6SevXfnsX4AvG9fyng
	Bro1qmtuVgrC0+1ORVwsFfwJUx8fJ5GsqwCEuireX4DJ1Gubb89NPPGlzYIuIS6TH3yqeS
	Z6Nubv5jdNlNo/vaFQYNqu+YXFqnb2IQ2g97Amk/U5jlqg+1sGbWiWFBcM3pIQ==
ARC-Authentication-Results: i=1;
	rspamd-dd986fb9b-24qc5;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Supply-Thread: 2724351457dff246_1763135210770_2829193326
X-MC-Loop-Signature: 1763135210770:1828996372
X-MC-Ingress-Time: 1763135210769
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.40.135 (trex/7.1.3);
	Fri, 14 Nov 2025 15:46:50 +0000
Received: from dell2016.. (unknown [IPv6:2a04:cec0:122b:2b8b:6420:6800:bae7:cb5a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d7M2B2nLGz3wpH;
	Fri, 14 Nov 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763135207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xUnAch7ahn0XdLMBa77XE5dbI/7gL7z6PUFVrXkOJaw=;
	b=ClkccDxDUUiVrStw80MnQROHq37Tpa1WI2p3gyk5iOjBESkQueqV0aDiYJn7hp4VHkWNa2
	UTZTyCUbbGPYg08thy959QbkzvXT2nGw0iz+TeD/SzfgcR8rToNmJ7UsOARvd+8eMf4P5O
	2rN/pb6aGB4AyGJ+o9u+TLtW9v8vBcvEcB9Xbmt50+vl+2sMt+Bri0L/uw/sRZ1ZJnZBIj
	eLl7rxriRPIWO/XzZSwOPECiSp2aI9yaa0DnSMYW6Ae6tKynV83QEUlNTMI5xv87gNjl3v
	7ExaCDiTdftdqCBQikimaFRKn+sKSeFIwlFS1p9Z6jKpAOf0KyFrgusRQoQFEA==
From: michael.opdenacker@rootcommit.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dsimic@manjaro.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board 3 and 3S
Message-ID: <20251114154617.69950-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154617.69950-1-michael.opdenacker@rootcommit.com>
References: <20251114154617.69950-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 14 Nov 2025 15:46:42 +0000 (UTC)
X-CM-Envelope: MS4xfMvocJ+nhBybcd3By4mor4/LL+Ui+HaHwc9SgtrBjJ38xxqOuIHVkJGm3HaVcO2KjTV1VUxDilGCNApK77qe1OJCdc9/cF1VdcKF/4bBc+FUfp7Bx45K H0OGYFNDEMmZ+gGl+gHQOzSZak3dvPk9bAeCakX7/Y0OAViwweR7h4vjTkeSZodqbNA/G5/QQf1YaefX3ak1Zdr0pw5vbE2VUKx2os9pZPmZPpHJX0D9aWfB 8reZRyUUsQamnbM2wcP0ng9AQd4Lm6IuDh+bTxCUNqvFadz02Kb7ZteDLBdMrAK34efNSKjHiO5nES8S/668ZfpHj//Zc05Egm/iheFLjuJTHNBliszErNSO n7ZDtOgz7EA7MXZtKHXzqdXIB4/ssagAbo5fts8/o+fZb3VIqyede9wW+6USI0S0LqVD21yEeGGXG6BjQKJ2pcrmw72Pqo7b4ZZF8P/WcHEB5TJ/R53SD9xQ a2LGrllI0+fP/cN1OR0sQWzy4ACliOhwmp++MTpfzcYwNMO9v7zsAnMQyvuAxKcbQUJIBMj59NNPGueRQqGYgnJXcxL8J5xQ9LJhie3opFto1IhB1PmowVJt wri80mmsY6L1foAj0iKuQ6Dg
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69174ee7 a=xg8E7M7z/s+QKb9omSVFuA==:617 a=xqWC_Br6kY4A:10 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=3JIPYtb0mk-80_rjy1QA:9 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_074652_241642_68465480 
X-CRM114-Status: UNSURE (   6.14  )
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

Document the compatible strings for Asus Tinker Board 3 [1] and 3S [2],
which are SBCs based on the Rockchip 3566 SoC.

The "3S" version ("S" for "storage") just adds a 16 GB eMMC
and a "mask ROM" DIP switch to the "3" version.

[1] https://tinker-board.asus.com/series/tinker-board-3.html
[2] https://tinker-board.asus.com/series/tinker-board-3s.html

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..cd249325a4d9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -86,6 +86,17 @@ properties:
           - const: asus,rk3288-tinker-s
           - const: rockchip,rk3288
 
+      - description: Asus Tinker Board 3
+        items:
+          - const: asus,rk3566-tinker-board-3
+          - const: rockchip,rk3566
+
+      - description: Asus Tinker Board 3S
+        items:
+          - const: asus,rk3566-tinker-board-3s
+          - const: asus,rk3566-tinker-board-3
+          - const: rockchip,rk3566
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1

