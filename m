Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168FAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liUtdoJ/xU4IQHWaOQbDn7BoXn7VV03bnVxdZQSMveU=; b=JBrBENeH702b60nlvqqVfqJOc3
	tZUlgehaRrowvVknUEdGkYaLzCOUEMBfnMjAPiLRGyzMgJ+juKOKIZnZA85kEIDQTj7poA5qgdfx7
	hQ5xW2nnYbSYgiDRvvhUMLklQ1P3Kscxyn3IUalv8rRUSMVNOI5Ppa6F3eS+9kZtsLsvcfKogJOVr
	4LSejEU2EoNEYChdUHM/rdmGGUfkqQhqowULbDtfiokl0w4qgGGFWDhEHbrbzMQN3DMaIUB1c8N1U
	n2SdWpgJt1i8p7Sw6GCg8YGr3x7ktRF2fCF2xZDyYHAMyYvvaFF3vPaowB2aEwPi2djYw9Syi6njR
	CJThI73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmE6-00000007bLI-2lms;
	Sun, 18 May 2025 22:11:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm89-00000007aEz-0Lp5;
	Sun, 18 May 2025 22:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=liUtdoJ/xU4IQHWaOQbDn7BoXn7VV03bnVxdZQSMveU=; b=TnndYMgA1PAjUk5axz5JKVv35U
	oAEWcAXeK+nXJkXwOWcKidM8zUiqM4d0XJ+PrEljuhUFdOmNvuhldp8T8LqCZXQfA89YPnAzZlYpx
	9lLEmlwcbQETJHgb9cSiGnxNkU4Vri+M3owvIBcX7vXfcDekheJedxUFCGR44SOg7QAsZvdAJ1jHk
	6gZNpWXWdk2LpG+M8Qd9KtHEY241RKjhclmWQZwTCDNUmWW1cNZKDw4npN/aCpzPBhfebJWR/VBy7
	1ain0NMXsdtPI7j77wn66pGIfgFNx428otChJ/QflmOTAYBmLpy1j38tBDMMhz4zoKxfravSRxY5m
	JKkuw/vw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7y-0004gv-Bx; Mon, 19 May 2025 00:05:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Fix some warnings about PCIe and pinctrl on RK3528/RK3562/RK3576
Date: Mon, 19 May 2025 00:04:42 +0200
Message-ID: <20250518220449.2722673-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150513_148796_DAD2781A 
X-CRM114-Status: UNSURE (   9.10  )
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

Inspired by the issue reported by the kernel-test-robot in
  http://lore.kernel.org/r/202505150745.PQT9TLYX-lkp@intel.com

fix it and similar issues in all of rk3528, rk3562 and rk3576.


Heiko Stuebner (6):
  arm64: dts: rockchip: fix rk3576 pcie unit addresses
  arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
  arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
  arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
  arm64: dts: rockchip: fix rk3562 pcie unit addresses
  arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 136 ++++-----
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 242 ++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 353 +++++++++++------------
 3 files changed, 365 insertions(+), 366 deletions(-)

-- 
2.47.2


