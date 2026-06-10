Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E329CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjtDSKgAkBUwFT0hwE/2Ap75hxqeB45aM0UXggEveyI=; b=MTcbRpvNENHCGVInlvPBPgSAgz
	Au2qsvUlKCJw1Eaaeo/qGcOgOWQBussGM1fYfgDQ1/Qum5KciizogkTSAfepmEitb6uLo/FhaWdtm
	wWk7dPhmjmRRqHnwrj2A2l/LUTUxJC4NlPDRSd8EUMWMg6KOCdsd2MYezmwZ2B+s/jpJHgoo2S0Zn
	s2RhZmu7shD0QCDvwxvqRE/f7qZIFi2lENITmw2fRjPflAJzjE67JZ2hinB8mEQtFCJ7+iuhR9LUa
	aqew3UqGzymyUaNJnxb2lYzF5axXwrSE0ioGnsVrPfYu6R6ESEWUJ+eZ4qqg5vDu2hxTYbDXCZP1Q
	k11F6ZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4r-000000072GN-2m1O;
	Wed, 10 Jun 2026 08:14:21 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4p-000000072Er-1h7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:14:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781079255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kjtDSKgAkBUwFT0hwE/2Ap75hxqeB45aM0UXggEveyI=;
	b=lZwr/DAwi5MuDj7EnY8KldX5dEhj6AHfLGfJpB9zMZP3cZMalnkQP23io4b6Y+8fbfJBTB
	+gdOawkXzTnycIYTuxU+Bxt/f/OWKmEbUASf0lB7YF3aUlg+1XhxWfjV9yBJhRUZktVHwx
	1c0bKc+wl8NDIBnyrou9mdrSOSQJzBIPK+aCioYqbNvL4XuF3nZFXap8XvAUOPxslXqNjC
	OGED8/G5ytjJOqDC/lKhJk3CZ6PC1IWjjvrVBDQKRXTyXWTKP5IEI5SawMJcrQqFSejsdf
	sh8HkRCBHCMyDtBDeQ80/Rq521X2bx8N+3vZk5fbfoM2gBLuHjiGOzrmemOb3g==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/2] Cleanup and fix for NanoPC-T6 Plus
Date: Wed, 10 Jun 2026 10:04:04 +0200
Message-ID: <20260610081400.758687-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_011419_839654_60B51357 
X-CRM114-Status: UNSURE (   6.59  )
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

Several nodes were enabled/configured when support for the NanoPC-T6 Plus was
added, but later those same nodes got enabled/configured in the dtsi file,
making those in the dts file superfluous, so remove them.

The MTT USB 2.0 Hub is connected to USB20 HOST1, so the phy-supply belongs to
u2phy3_host, not u2phy2_host as that is for USB20 HOST0.

Diederik de Haas (2):
  arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
  arm64: dts: rockchip: Fix USB hub phy-supply config for NanoPC-T6 LTS

 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

-- 
2.53.0


