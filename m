Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2059CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QirKZoZx4FZMkjIH711JfQunHh4S5JDgS7z5u6L/6Ow=; b=HqpOHrvo8oxAoV8FbFv/J9UjsA
	JjeeYL6QRYf63mglFuWQ31L/4H6b+HCPXAeEIcobx7GJI/Qiec36osUnSqecT9BNW90gv4pW8p8h5
	cgxdGMDENDGnesAvN1Ga23pXuKrdV1AJqrnmc1bJrC/bh+SxdkcC3KQpxDuEArVQQ6MPYJr60PUcw
	EbjhnJMy0aQ/LCqZgzGXiFuJItaBdHM66GH4hLTIsBzzXOmRHt5+dhSMvFHXfxFDJFcTlySnp5XU/
	/bIrRLzPN+ufbCUNObvAOGw5jyaDPzsgWFuU7XU9vpV1npeXOxaErz6lMDHZVhaQayyVkTZ/1J5Dr
	hb61xIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Q6r-0000000FWxo-05jo;
	Sun, 05 Oct 2025 14:53:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Q6q-0000000FWxS-0PRg;
	Sun, 05 Oct 2025 14:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D8136029A;
	Sun,  5 Oct 2025 14:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7283C4CEF4;
	Sun,  5 Oct 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759675990;
	bh=n+5x1+BhZNh9Sjay4G/MP109HsZfr8HIll6s6iC4eEM=;
	h=From:Date:Subject:To:Cc:From;
	b=WtuPAUHZAsMq0UjpxaUl2Q9UAnS4Q6Ot5TBWB1SG2mFl53fSoM+PzoZk+Dls5J4Sp
	 yT2x4jVnZNIcav7CleThxajLuMg4HHkirJyptTnnnOSmvZkbw5mW4Nu6NKOsXvRhVx
	 lQb02ENUPJW+MoEv7attr1mstDTGvYtz6vyK1k4MI9hyKptMOHqOjw8JogtEZo7Xqh
	 fA1wC0gZyPz6MAOey2Ywz3Xb2WSBvVpNPNwm1ljLDp84w3vkA50oSwZ7WNeyMMwVmV
	 rf3EpalxykjdmoI+2JJ/IhB8vQ41QZQAhvFikyrKfXs1RkdHXBI3Zz+BjQWr3L4RWV
	 LjpVEpy2Dk+pg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 05 Oct 2025 09:52:09 -0500
Subject: [PATCH net] net: airoha: Fix loopback mode configuration for GDM2
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
X-B4-Tracking: v=1; b=H4sIABiG4mgC/x2M0QqDMAwAf0XyvECqqGy/MvYQa7RhaqQFEUr/f
 WWPd3CXIUlUSfBqMkS5NKkdFdyjAR/4WAV1rgwttb0j6pE1WmDczM6J/Rd3mwUXvbHjpyfqBnK
 jQM3PKFX/1+9PKT9bJfJragAAAA==
X-Change-ID: 20251005-airoha-loopback-mode-fix-3a9c0036017e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
routine.

Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 81ea01a652b9c545c348ad6390af8be873a4997f..abe7a23e3ab7a189a3a28007004572719307de90 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1710,7 +1710,9 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
 	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
 		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
-		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
+		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
+		      FIELD_PREP(LPBK_MODE_MASK, 7) |
+		      LPBK_EN_MASK);
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(2),
 		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |

---
base-commit: 1b54b0756f051c11f5a5d0fbc1581e0b9a18e2bc
change-id: 20251005-airoha-loopback-mode-fix-3a9c0036017e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


