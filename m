Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D749EDF171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pwbg4JhbgMvhgojT4OZNhXRdUT0zjohsHLf72nJ8tfI=; b=YXPJoFJz1nK03F
	hTTpAapdrw4wKVgThjtrXiKhOsUdzfFl7KnhXgtt4JN/teIbZMFC8gtBIaslN5jc4MdZQBh848zZF
	pFEMa6/+KQCYmpFQxHjBdfqyUEyjhV7CHo+DK55bfcr8N43ZXx8X+x0Fqvd0AhOUI4FzH2lIxr9A4
	PvHLKgJVvibsdnqGFYL7ve7zsZSO8w3MsOU7PK3la06rJFOJBq7zuOgDeuE+Rsz8XhwepQCvCHd/3
	2od29bKSMo9TPdY/Oy12HeTc1FUwT+ODja6QdQH7kA3beYgj5fh05HlvFrjUifITmFlxQd+YOP0hY
	j2zT0khSGNErAkTs9ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKa-00000003YQn-2Ub5;
	Fri, 13 Feb 2026 14:39:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKU-00000003YLF-0Gip;
	Fri, 13 Feb 2026 14:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=AFv/3KVzIinIaZVoV9/X3xfLJqoXvuiVXD2r4mVIsww=;
	h=From:Subject:Date:To:Cc:From;
	b=AuscEqkAFwbiqXbgf+PzpkqZFbrRO6l4t9hTpwv4v8MDtt2jLwVE1yPO5Q4YN1s8p
	 lEDaaBTZ1S37HOxmy/jNSzPB2MOz703hPpGAN/O3qy6/Tj5GWCnhtOWWQutuS2lpXT
	 WnTJehRfFshhGdzxlL7KuVk6+1lT1DUeLtfJywrQ//bwpz/txS/EFWBPCLSFQ8tXR9
	 R90xTQxxCuAn05G36GDh/dACx3RQhzktyOtpOuf++YY1LJ+XIVd9T5UW9KOZo3FQ6C
	 aqNA42Z6wKnykR/r53vtFFYSCvEYVjKEfKQElxbMlpB+8cl8cIbqn4fcZqbio/eXMd
	 pEeVxUnSF/ftQ==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3B3917E35C4;
	Fri, 13 Feb 2026 15:39:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A13DC480024; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/9] phy: rockchip: usbdp: Fixes, DP 1-lane support and
 cleanups
Date: Fri, 13 Feb 2026 15:39:23 +0100
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJs3j2kC/4WNTQ6CMBBGr0Jm7Zi2hBpceQ/Coj+DTETatEI0h
 LtbuYDL95LvfRtkSkwZrtUGiVbOHOYC6lSBG818J2RfGJRQWihRYwru4UaOuGTrI7qJzLxEbGz
 T+sE2WpoayjgmGvh9hLu+8Mj5FdLn+Fnlz/5NrhIFSm300Cry8qJvLkyTsSGZswtP6Pd9/wIUl
 HzYwAAAAA==
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AFv/3KVzIinIaZVoV9/X3xfLJqoXvuiVXD2r4mVIsww=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6J4T1TA/ICcgouv1OxcjiqS8Pv6r3wbM
 dgCSVEyjFgI6YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qaqykQAKGhSPK9pjC9N+Oe0fRcmlv8QW7GGWXRmWY9U1GCPL+0Jilz+40w3VLjBZsknJJhwI+
 0fhDtAfk0F+1fVeDWp3N06h2l5ohmmda3z2Y6oQUNiD/nMfHSTwLcaPA9XdAvbwuW0CskvdSsS9
 NnnEJDjhQiC/vRNXe6T2Da+/HDmew0Qh9nc4Q0mIfgMN8UykQiwW1uYJjtvumPhiKaAr8ujWhbc
 RsjjbWayMmo8W+s+GCRIbwQog1quEVD5euxpqD6yiquzFgqZVzwEpQmAr5XFLyvgIm0502wApBe
 AWEetO6iHFVv8PDkR3BOV8IQb9pRJYn/F1qQ1lBeiGYlZbrgfiIJtKyL7CupFlB94u6G9PhjKHO
 Gk3NWksgB3zDc2hfPFwcmtUgl6uPvbp8t5o3cYOKSTENq2S12PzLyrNLW2CtYSDezWQiYcGEgAB
 QthSHebniKwWZobCoI2btRX9eZOtLsOhWZ0+pi2b2xZNdb1eKJctkEMqafmoA6pfTqps9CNTP10
 tFBkGtw6f/NF3AaEb4jZEzY1uq5EVssuY5f8c/U0BU5+ZuGfk502UZSWoG0dvJJT51Y9HkohC/z
 IHX+oBSFLKSPT+uZWDQlTK4m+bfZLe4kwEjZ+s50eu73uEgpl8N8YCJJgLcrpSqlK7X81gC4kUp
 4/PDrJmXMLclkEJkB1281VQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063934_258189_F7921F75 
X-CRM114-Status: UNSURE (   9.83  )
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

As there are some issues with the DisplayPort support, I went
though Rockchip's BSP kernel tree and looked for fixes. I found
two small changes for the initial register setup, which do not
help with the DP issue but seem sensible in general. Afterwards
I added one more fix, which corrects an issue that effectively
results in USB-C adapters with combined USB3+DP capabilities
not being able to use the DP part.

Afterwards I added one more patch adding single-lane DP support
(found in Rockchip BSP kernel) and a couple of cleanups from my
side. These are logically independent from the fixes, but I put
all together in a single series because they need to be applied
in the right order to avoid conflicts.

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (6):
      phy: rockchip: usbdp: Do not loose USB3 PHY status
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 120 +++++++++++++-----------------
 1 file changed, 50 insertions(+), 70 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


