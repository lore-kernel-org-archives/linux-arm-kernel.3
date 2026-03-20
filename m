Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21F108B8ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl66oOZ9dra82J7CjNCHzOpuoOwvMztRV6mr5JP3oB8=; b=1H1EeSn443OWhQnU/+aLSuY9+a
	YUJE2N1judvcPFQYAqDAm1KI/JdEK04WbtJ7zohS4EkoS4LhCe0bH3578eJfWUl/PqnUNWXV8T4Oq
	pHRAtI+rPu3uQhPAcAqSlzqy59SLxcocZ/wYb6u09RzmGGrPhz/9FnSMFpMU9etldTmKs3lJw0oA6
	h7JJm8QAb6fDABr/LfySVGAWjJoGo0+W1Fai/yKtYijcV9tkj9sfLXjeIxoJ58j4ZH8udkPsKK5jG
	VjtCec3U7GpoZ86TJCeebkVsIwmkc0IAvImeBe0R2BoMLqZ867xWXuaOMH9L/pGh11n+1ZO52cBav
	nBitG1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XCL-0000000CcDV-0vjg;
	Fri, 20 Mar 2026 10:35:21 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XCE-0000000Cc4u-3BfP;
	Fri, 20 Mar 2026 10:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rl66oOZ9dra82J7CjNCHzOpuoOwvMztRV6mr5JP3oB8=; b=XxW3jZEPWdVk9ikWPNHNrTOgFZ
	1aELcnb5rU9+1TJfxHoOJ2MauByVKpoV1jAuZiRwVtQX3LRpwoMMzx1jaqWNb4o8bVMoOPiNMVrFK
	QQBcI6im6XDHi0c3D9kSxRJYX72b/A4ff91zwAhM3Ees+GGOtgxZYedcd1Dc6M75BvAmDkmS6bWhj
	aLeQDvcZRtp0TXvSzh8c660p/zp8c9HPMryINfE2ijyCGpF7SUu7V5uzEcfoWAGd1CbYyPUlxbXpn
	6ENG+KbMHbggI1G5vguEcGjmuoAASbDtK/nmme/ljehYETD1/0aBiX5bbKE3jsg04Z8rvPyNkNwzr
	nc1sfAyg==;
Received: from [2a0d:52c0:500f:0:89f2:a47:418d:affd] (port=53820 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w3XBa-00000005JXw-0bOu;
	Fri, 20 Mar 2026 11:34:31 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Fri, 20 Mar 2026 11:34:15 +0100
Subject: [PATCH v3 3/4] soc: rockchip: rk3588: add SYS_GRF SOC_CON6
 register offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rk3588-mclk-gate-grf-v3-3-980338eacd2c@superkali.me>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774002854; l=753;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=UQEiDKSJXeYPDA3RGeG+ndD97rbfufDLqHqwaCQMuJQ=;
 b=reSZXzfaoxAP4k38LsL5bDJzFTgYbqnd77dmCRG75jULCNmy4BUCYDALolqYXGWvOCeYmOafL
 PNAi7o1x/SZCJ0g6Wi1FwlK47jrQBuuYxeNCcA4T4UQHxH/7vzCCUQA
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_033514_956429_AC25DD66 
X-CRM114-Status: UNSURE (   5.35  )
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

Add the RK3588_SYSGRF_SOC_CON6 register offset to the RK3588 GRF
header. This register contains the I2S MCLK output to IO gate bits,
needed by the clock driver.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 include/soc/rockchip/rk3588_grf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/rockchip/rk3588_grf.h b/include/soc/rockchip/rk3588_grf.h
index 02a7b2432d99..db0092fc66ad 100644
--- a/include/soc/rockchip/rk3588_grf.h
+++ b/include/soc/rockchip/rk3588_grf.h
@@ -19,4 +19,6 @@
 /* Whether the LPDDR5 is in 2:1 (= 0) or 4:1 (= 1) CKR a.k.a. DQS mode */
 #define RK3588_PMUGRF_OS_REG6_LP5_CKR			BIT(0)
 
+#define RK3588_SYSGRF_SOC_CON6			0x0318
+
 #endif /* __SOC_RK3588_GRF_H */

-- 
2.53.0


