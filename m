Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8502BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSdcMt8QLFSkKLYqTrSr4WGRCehiRklAAWxzKvWYKCM=; b=WVTHt+HIyyjyv7aqzCP9XLYp19
	iR6Q83VUFKQWKI/SZbPpl4Jg7/4FXAacisw8ySIYGmuxvnJciVDqYhoB/1XZgOHuLZYvQF6qBb9Z4
	tpzqZZeQBz10GdC+eHxviufezu3f9egnTGnhHc+xVJ7xhQGkqUiGH8F7BNH70hqsI0Wz//RCTfwj1
	ugH7I0kJJpOYSBjkHDycOjGnaGi/6PaiE9vG2OVvAPkDAX6zENMsITRdAUrfC2lYDfprDgBBePu2o
	t4gOyBss/2q2xkq73Z7V1eSUwUF3+OacQUd8ZpYVupwYkq/hfk6rb53dQCoHDzj9s3kvChBWBikcQ
	Fx1pqYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSEY-0000000EZHW-12n4;
	Mon, 27 Oct 2025 18:46:22 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSEV-0000000EZH1-11KJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:46:20 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwMsg0bsvz9sQJ;
	Mon, 27 Oct 2025 19:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761590775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SSdcMt8QLFSkKLYqTrSr4WGRCehiRklAAWxzKvWYKCM=;
	b=Mxon/2Nq1YWy+zSVRs/eVW89dD2gFeQWBy+dHfi5G9jYwymoxm5vDKnJJWQsy1VCoMYcEv
	P7t1sCf+Nt56yD1/CeBznN6hwhGBEKFsmltIeMsnSMOSn2H1LuUFmncXjarrZbq8ysj+6W
	/wgLqVv0HERXmOcqbbPnLQIEwmxRDlytYdUin2dzPGDHxsvPrX1s/sGMhj7tFHHMJvUO0J
	qkTX2Gmuly0U2Jd89pO0IerdQ+PD/Uw/SRrhWS0E9mirkInw0GAQ/3aXeHqFS73qyhL4MH
	k4y9hWcSJi3AWB/AF5pZgXlnsBTSGsS2pCJAgbxaDU7btV89VSIiQvyK6AsECg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761590773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SSdcMt8QLFSkKLYqTrSr4WGRCehiRklAAWxzKvWYKCM=;
	b=vsVHmfg8KX/1tyPf86mHAubkNuBhaA6ePfVT6amTgHEKTBXNPXhY+CnspJ1x2J959Eos1P
	YFC/ITDmHCQsRkLoFYSCY8X2RdqDSKo87i4tNbW+RNmyukE4UE9ME8yl5kLiMn/tIN0uMP
	7pzzOIKca5Akhc2VJIOKl6I1h24n/6Otxi1NUr9hEKNyY8z/OuQBM7HKotw0KKoj0KhR+6
	8A09tkfdfXUxslKSO9itiRIcRc2nIQAFDkxmLi1uF43w9+Eqt72M2uDGhkPJ+1EK0PWfE8
	vIQ0g40e5WN0ylw7tWwqPQ5XA31WNYe1SdQ7eh3HZJtAQjQ9rnfZhLhWanTV+A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels
Date: Mon, 27 Oct 2025 19:45:53 +0100
Message-ID: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x4q7fii5z44mhgk4fkog53ugrzf6ugap
X-MBO-RS-ID: a54833429e75fd65622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_114619_456205_0E42D0B9 
X-CRM114-Status: GOOD (  10.90  )
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

The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
is a full-size DisplayPort connector. Fix the copy-paste error and
update the DT node name and labels accordingly. No functional change.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 0e36a1b96b83a..f4181f6020203 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -119,13 +119,13 @@ memory@600000000 {
 	};
 
 	/* Page 27 / DSI to Display */
-	mini-dp-con {
+	dp-con {
 		compatible = "dp-connector";
 		label = "CN6";
 		type = "full-size";
 
 		port {
-			mini_dp_con_in: endpoint {
+			dp_con_in: endpoint {
 				remote-endpoint = <&sn65dsi86_out>;
 			};
 		};
@@ -412,7 +412,7 @@ sn65dsi86_in: endpoint {
 					port@1 {
 						reg = <1>;
 						sn65dsi86_out: endpoint {
-							remote-endpoint = <&mini_dp_con_in>;
+							remote-endpoint = <&dp_con_in>;
 						};
 					};
 				};
-- 
2.51.0


