Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D79E74AE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v97j/avb3nDbxCl3K09zRMxiKXz/u+GiHSDaP2oimIM=; b=5E8zib6swqjqQD
	BNgIabIl/bxrjAKSMTCyuwA8fH858fpE+40EI1LposLc4+I0ro8cQyTCxHP2BUPNXhkNgLzH8TRVS
	tFkdMsoepjlzyPWjo2v3Zpsw90+9jB/1RYmVr3cgdoSvIm7f1FlITkK+JnDJMh6oVNdEB7pkl77R0
	JXmX2xNpFhT85gOrAAOqQpXp5Qpbatk3V4T5j2qZr9Jey07VM6Uo3g0S5m/Gjk8Xt7B7GNB0aB58s
	Q9K6ekAhqfLWkpkfKXVmlxYYgJacXQQUIMPm24UeNpMG4y8u3SrcfeuI9ov6OvrSiTk78r6CYo73j
	CHTTbFvfGW9pTo/6WF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKN-0000000GXPl-3s60;
	Wed, 24 Dec 2025 07:30:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKK-0000000GXNi-3pPG;
	Wed, 24 Dec 2025 07:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=p9EApc/81gnQlU/LhWQkv1EujxBdHond5uKb1PR5F2k=;
	h=From:Subject:Date:To:Cc:From;
	b=b6IkRrtCO/zl01DcGcHmlGgXYzJN5M8H9DRZ9I9D0jd5BhvE4b6rLvBopQp/Li5YB
	 7NUlBZb+Q/Fo24cP3c/CfY1axDQ//CX/t+2BLI0C23J9q/4XxKtn591/iEQa8rKXHy
	 uCRExOWtDv+XeSm9rebi+P7tjzgIDOcD+oSXj0mtD6qCq/+I2iw/oje0gLFb8bLIPu
	 FOTv2uZyBLVurw7jcXdwJlp7QZqSZGEYEPhnj3jwipSYBKVS0UQZJRO2JjQq/4+rK+
	 k8sCE2tc2JKN9qHIZ+pK0Atpz8D7fKgqvJaQZGTlMeJDrk1XbwyeAxM9E2K+dO21kO
	 2Fn721VI/xToQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13A1017E0463;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id B565811A3A2D3; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH 0/4] clk: mediatek: Fix no-gate mux declarations
Date: Wed, 24 Dec 2025 08:30:09 +0100
Message-Id: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIGWS2kC/x3MQQqAIBBA0avErBtQKZGuEi2sJhsiDZUIwrsnL
 d/i/xcSRaYEQ/NCpJsTB18h2waW3XpHyGs1KKF6qVSHZz7Qh4wWnc2EtIhZz9r00hqo0RVp4+c
 fjlMpH3XKLrRgAAAA
X-Change-ID: 20251224-mtk-not-a-gate-ec0b6b6851a8
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_233033_433039_273D5DBF 
X-CRM114-Status: UNSURE (   8.68  )
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

When booting a MT7981 board (OpenWRT One) with UBSAN, the following
error showed up:

```
UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
shift exponent 255 is too large for 64-bit type 'long unsigned int'
```

This is due to various infra muxes being declared as MUX_GATE_ even
though they don't actually have a gate.

First patch in this series adds a helper to make it easier to declare
muxes that neither have a gate nor update registers. This seems common
for MT798* infra muxes. The following ones corrects the incorrect mux
definitions by transitioning to this new declaration.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
Sjoerd Simons (4):
      clk: mediatek: clk-mux: Add helper for muxes without UPD
      clk: mediatek: Declare MT7981 infra muxes as no-gate muxes
      clk: mediatek: Declare MT7986 infra muxes as no-gate muxes
      clk: mediatek: Declare MT7988 infra muxes as no-gate muxes

 drivers/clk/mediatek/clk-mt7981-infracfg.c | 55 ++++++++-----------
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 45 ++++++---------
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 88 ++++++++++++++++--------------
 drivers/clk/mediatek/clk-mux.h             |  7 +++
 4 files changed, 93 insertions(+), 102 deletions(-)
---
base-commit: b927546677c876e26eba308550207c2ddf812a43
change-id: 20251224-mtk-not-a-gate-ec0b6b6851a8

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


