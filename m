Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B4EC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Th2vkT6FKYjl3hMBkF75XXdNTMs3LBII7mDGfOaHizo=; b=3EuCdhrG31FjR1kZViDKGr6803
	Fa5heTOEUswGGroM7DpWEsUdKNU8R4o+9+EaLCmJh2Z0GO48L/7xjbsMzy/30+/ylxvQmy6VqVssX
	oxgR1fjJTbPYQ+Vx4AHhByd+HTSuaMmGbVqX5EhSic6GnPqBjr2fUM90JqK3pau9IAFmgs8CTAZj9
	nkcJC5iEyCMIKgrwQHkJJDxQNJRBsQZG4k9sb8LMgsgJq+jhr00PKzeeg75hTaauXXiz3BFktjy7H
	/UjuyakNFXd+O7CyJk6MVY7ns0Q6vZc36Bq1qu7Y/1J5oEqaXmULPx/of7Popa+iXIcoL3m2Q6ZPN
	JWqv3yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpb-0000000BhAv-0dpD;
	Mon, 10 Aug 2026 12:10:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpX-0000000Bh7R-0SDW;
	Mon, 10 Aug 2026 12:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53EAD60A58;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0504C2BCF7;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786363810;
	bh=nM1PWXa4lYq/cgb4yvF1TdmldcWZBOEN5InNv/mhbUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KFxhvbxOtD9s3AUuziuPtGwpan5u1vpcZ5K1ER1kHe7oyQlB2oI9Vyr7EHCMgjzIE
	 NdAXKjv07LT5GC9Pkuu1COWYHOrinkeMPyuKMDVmBMb6IIES4yKGbD5t0NcOZv0cgl
	 eQAlG8XTqI4uHwnicDb5HkWT58s9P4MSh+Zolf9IF/guqwvyiB38ti/rrWLzfzEjUw
	 i1J90PYgtVEy0Go1v2bpBwcx9OpxC4VvT9CmFdzuh2+p3SJsakRwIzf0rjrEsqcWQR
	 qNv1OcL3TPpSu1Jp5Bq9XtO5rSLBgiw3+VHIjNxcr71ZH1umgN8XytXVPa3Tsps4mg
	 LO7Bj7b0cDmpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEFDC5AD55;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:10:09 +0800
Subject: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and PHY_TYPE_CSI
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
In-Reply-To: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786363808; l=1446;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=yX+Aw6/XUvA1SbeyNubPWl5XW6aN2m0eVjxRYZI5gIA=;
 b=4aCumODizHp/0+Hq+N/EYjbiAEapkkPUyOcUW07Flm83L46zefGGyxpT8zUzlVt9PUjX6QgP5
 QpmragoUJcRDxevQwKP9jpx98f0g5iV8WttupdaLa4snYnZ9yF1wA1c
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
camera, and combo blocks like the Samsung IP on RK3588 expose both
directions to independent consumers at the same time. A binding that
needs to tell the two consumers apart has nothing generic to reach
for: most constants in this header name a protocol (PHY_TYPE_USB3,
PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
layer.

Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
protocol it speaks, which also implies the direction. They do not
replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
where the cell selects the electrical layer. First user is the
Rockchip RK3588 MIPI DC-PHY binding.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..8ee3f88e6d80 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,8 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_DSI		14
+#define PHY_TYPE_CSI		15
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.43.0



