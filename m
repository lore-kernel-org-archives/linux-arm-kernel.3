Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7189FC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 01:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elHxKod4Hi5MljImJZeO6gB3g83rShkQGqnU/7J2Q4Y=; b=lLHpEDm8z332H8isSAJV1aunrP
	iOi5Bc4chzbIQya0EoD12pYX+DNnCRC+zdj0ZQURBSM4b1CkNIdM3OBCJmRIE/iom/2bRVU/dPiFG
	woz+FI1cvNfo93TDFFK6Ub5hn2ut7zw6BbsUESiupbaoZW3vR6T52roOMOSfiXv9yB8ItYvJYsPIv
	YT91qo5SsNUv5g8VGxhDfbaVhgjn1z5onaTCcBUTL/g/VNsJpHSqJZTywcU9DH574SfCVhz2X7+qK
	CBYdt2le5rTLCJjiEBDIf0adq8Zn+na5usk7HUZ/50RGXEMuVIfLD4nsgtTw1JedBbmFqwEwyfoDe
	2shUShSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbUom-0000000Fr7i-1Nwa;
	Sat, 25 Jan 2025 01:18:36 +0000
Received: from mail-m1973170.qiye.163.com ([220.197.31.70])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbUmC-0000000FqjJ-1INH;
	Sat, 25 Jan 2025 01:15:57 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9a2d1325;
	Sat, 25 Jan 2025 09:15:49 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] clk: rockchip: Fixed some incorrect commits
Date: Sat, 25 Jan 2025 09:15:42 +0800
Message-Id: <20250125011545.15547-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktCS1YfS0gfSRlJGk9PTR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949b07876603a3kunm9a2d1325
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Kww*CTIKHhoRDS0pPRIO
	Ok9PCypVSlVKTEhMTE1MTE5LTEhDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU5KTTcG
DKIM-Signature: a=rsa-sha256;
	b=K4VBheC1hN2v/qacAVCQWtPYBSMWTpKPIcWw+9BuZiCPy2NcVs7oAhq+fFnJO5FcupKMQ4gbxdsuMrBJxpB/A3wv35AipuUjMK22AZWcvMxZiZ6hNbWhOshskMzfVtXpMSdZFNvec2ADNq2vglI9i5JKJZd+GOYMDM9WsNxMs20=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=elHxKod4Hi5MljImJZeO6gB3g83rShkQGqnU/7J2Q4Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_171556_533157_17CCA2DB 
X-CRM114-Status: UNSURE (   5.34  )
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

Change in V2:
[PATCH v2 0/3]: NO change
[PATCH v2 1/3]: Update commit message
[PATCH v2 2/3]: Update commit message

Elaine Zhang (3):
  Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
  Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 drivers/clk/rockchip/clk-rk3228.c        |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1


