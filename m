Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAAC43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ3yh/X6KbrFb0BMiD6FVwR4lo4DXBC2jo6rnCzEvRc=; b=VCVxrdpPVjpFwiJGXooxQFVH3E
	TwSWLwQ+huMOPCrjIyj0vl9RsFKTHwFNLg+J7CoThM4HnhgmBjsTj1GcpL/GAev7KoiYiD3t15kvr
	scBMQcWedHSVXBg9HzN12JQj/6VvfRRnhQMJtu1CGEKNm/Qj0aTlscDL0W4AV84CR7yc4asWtKyxH
	bTOjLIBEWa7VtaQ4ASyqpP0fDar/EQPdAcn6sU0vGL9cqOXFvenzY1pVmYbmpWQURg6260M5HCVxg
	ovHX0VB/9Wwtl69exKNtGrgB9VhdRspGTprBO1L10EaW7jhuDQ/Xel1a9EaRCOCiFy/kPDqPbCgGt
	gjHXOxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaz-0000000Bqk5-2sSm;
	Fri, 26 Jun 2026 20:56:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZw-0000000BpcK-1O0w;
	Fri, 26 Jun 2026 20:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=lzF/7VzLP8C3rgYOuAm8DgQ1R0OKHKM5g5aD363rFzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mdczpxWlwepiw3IP4TTnQ6guJJrMUBdi5cX2LJhVRIJGkql/5IVmy5fF/pExNC620
	 jkX2mfBd+xzovk9s/wfFnpxlPMbCax3KDSRBNN46IidS+9hqg1s19xUUpgScfjnY0r
	 lejAt8KHcZvSfHCwywuFHIJOb5DW5PkPfdy9i+D4sIiAoHhKcygpzj7WB2UcQ4N854
	 j4CSq1SlazH+uFgfAEWEXZUdMwVfA9Jidt6H2Kh8DqOUlvidkMnk8l1ylyMUPVMmYc
	 Mp8v2zGfIxOeyXHL5elnPTlx4DbJuVh3a9YMhRl2iksHcLjN+3jGcZEcZmdePAnc7P
	 4x+QSAqc+qW/Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF4E617E155B;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E48648004C; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:06 +0200
Subject: [PATCH v8 13/29] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-13-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lzF/7VzLP8C3rgYOuAm8DgQ1R0OKHKM5g5aD363rFzo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVPZESpCGzgGWdbnGsT4RWtCQ11Kgdgn
 rfQJnj4uaMLzYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaYpYP/jNq3WN/nA6qP4nCl852d9v//Aer9D0MOndV0rI1PNXeEp16WEGdORdb1Aa7slLtlG5
 B/yUl6AGGVsbk7n28F8PKChDrJ4PVLDbl+IG5XLTQxzS7KN9AjE9uh68a9mrArMXK7/MqkH3Kkl
 3CY2iENGwRPiNrD65bZSIiRP2+sg7fqriszYD5pyvQfqOFhRggTShHARkLWvtaLGCYC4zDTw078
 zUavnxVQTLkak18GAtlLUS2BdyjgWhdBxC4IdvUoTgxQ4pTAQWT5GbcWcsmuFiEcL8HLRpoiI5p
 +exHXqPgwNugZ5qYnIXDpfo7xGOHRBdSv2hPjAAFSyBpQqlEgSdyQFWWILb0+O2liE2gtLEAIEV
 FNoxyJK6BrtDuzOA72qoDw/Jtyn3rDszw81uNcLtou6IbzWc3uyaZxchSqxoi3UL3FnvjSl8Q+J
 uZciUEYWkAjzprnmgf1vmCf/uT9seIeg/KzSx3191Z09JUU699TPcZAdXkTfupJj68GHi0NBUON
 bnSKGzXvVuJsur0AXOJQiUNhvApYIGFdzu1I7iMK7h0PMzCTBpdbH4KuK4YNfqAM+1woNMyPyHY
 aLcRp5wnVqF5q7eteFwgQxl3jefc8gZQHx0T4O6NHQY/uERvyOnp8H6lLPMBC33yx8mtZ9lZprt
 5/fPVv93fyEwRPHTBdDYpYw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135512_555766_F3A1CCE4 
X-CRM114-Status: GOOD (  11.61  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5c38da0dadd2..6de8ac3f9144 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1132,6 +1132,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


