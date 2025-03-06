Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD377C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Q3pBznN8M0b0cdvrfOAVu+/YpKDnQ8zfRnmStTM8EY=; b=c4CpP2nasyn/L4ihURVqSVCaEj
	cf//SOWJ3KhuCLYwqbS4T0zcGOiq4Zcgys988SKUTakMU2femVIGOTRkSvcCl0vzSFPr4zqhzygN+
	KduTGzIvEMD7VLjyjTgqiLaPvYqxCeHbc4IiPuPryI/UAI44pXgIZcLebJAHa8W/Q+4EV20f8i5uz
	YW8u/YN1A158RnQQalWd3ie17sWJ2IL1a/i5eepOWK/CZqKpwzFP62iCUzGzXqhGGE6CJASdjukZx
	m+DY1KDjjKuUSmDBxHLspQzrTbA0xDqJrog36bNG/vdcNhUxGhxu+IT9cSWZXSM1RpYNkuK+7CawO
	4+rj/8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI35-0000000C94t-3c7p;
	Thu, 06 Mar 2025 20:42:31 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHzu-0000000C8e5-49Vz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1741293553;
 bh=+Q3pBznN8M0b0cdvrfOAVu+/YpKDnQ8zfRnmStTM8EY=;
 b=m8JIKYP4EZ3aEFTTlfg3ww3VDujeTlzjvbkClBiIep8uZp7l8X6fRJo9dGMIfNKFQPm8iaSpj
 5hqCky1XCN3ZD19pr5GlMBXk62DRuwSBMAd+eVnRtGoCuP2MmoLo+d1O+sm5Ekc0ylbzRnFCp+P
 sOWqg04IxJ779Rr+e36Ihzo1aBSbI4yd5U+PW+dggJHE2zVQ70CnqAGsILKFnn7HNrpSoHn8Rtu
 3v89G2EtM5kx57Tl4jZfKi+CXXacFAGE3fv//hI/bnvZBTexJSfKQbSiftr4BNohqLVRKsUcecC
 KBgnzIL9AaaYRkUuCFMbDaOAwqCwzX7GuDdOFQm7EISA==
X-Forward-Email-ID: 67ca07e7deafcb1458af9232
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] Use DELAY_ENABLE macro for RK3328, RK3566/RK3568 and RK3588
Date: Thu,  6 Mar 2025 20:38:51 +0000
Message-ID: <20250306203858.1677595-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_123915_068920_D64CB46D 
X-CRM114-Status: UNSURE (   7.78  )
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

Almost all Rockchip GMAC variants use the DELAY_ENABLE macro to help
enable or disable use of MAC rx/tx delay. However, RK3328, RK3566/RK3568
and RK3588 GMAC driver does not.

Use of the DELAY_ENABLE macro help ensure the MAC rx/tx delay is
disabled, instead of being enabled and using a zero delay, when
RGMII_ID/RXID/TXID is used.

RK3328 driver was merged around the same time as when DELAY_ENABLE was
introduced so it is understandable why it was missed. Both RK3566/RK3568
and RK3588 support were introduced much later yet they also missed using
the DELAY_ENABLE macro (so did vendor kernel at that time).

This series fixes all these cases to unify how GMAC delay feature is
enabled or disabled across the different GMAC variants.

Jonas Karlman (3):
  net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3328
  net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3566/RK3568
  net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3588

 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.48.1


