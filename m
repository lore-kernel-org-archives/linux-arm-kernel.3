Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D01FD374F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xy2zRDRz9D/Xr14D5eQ3wKhobdF5Z77ACIKkiFkI92M=; b=mvaU+YtNeCR2YY
	fKmWrWLrb62PIqoZmifxWjbFvT4fB050eFRwdlKzSfShuqg/58Qk13P8X5OMHyKMaGz2RRK8Joa+e
	Tf7i7w83M5grrrDXqmiaWcuJXS6W9tGnhGND1YVqKNdgmmyABM5E4kgrDFHiDp9JlagtFGoV1JLSY
	3opstO8hCkCgYCB2C3YnIDfnQ3JYHmb/N05Un/BlwKufr8UArrZ8NgcnmX5ztzYpTFpO/a9FCnM2K
	LBxbmFO5sS+cf/mfShhfmpZH6GIElsKLF8kqfR+bSnyTOu5Y19nlaotuHKy4dVDscddHtgqKsQARi
	lbBykHaqT30APM55IF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDs6-00000003yr7-3tI3;
	Wed, 25 Feb 2026 12:20:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDs3-00000003ypD-3aB4;
	Wed, 25 Feb 2026 12:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022000;
	bh=bZoRD/Bq4RKph0cDXwuzpv24e0W+T6a1VDCAqIREFsg=;
	h=From:Subject:Date:To:Cc:From;
	b=ZZhdxzLS7pr8+CqP4HWy0BgdfFRvDjq37aqssrM+ieDdcoz4Rw4lCbrl75Zsq6oYH
	 rj3f/svfN2tHvnyBaIGHJufPS+XMxLzMj6sYlieXqpK1QS4BTFnAcmwAKF6n4KvB8o
	 MrQkdmhvK2RX/ZSXS1sfo/cXXhvJysmvGQkcbYBoPMOnK/8BYZR/zyqlR+LQ2oAYRM
	 ByCM5MHV8/18fH1x43LcNIsmwnPoxyFije0MYiPQ9UdX1kFGr4fCmLYWxvoGLvxe/R
	 hYlssDx10bAe5bqd9l4nE7hvY1sHQOQkIZ8KduhejTs9Kp/JVkK+DmVvcUGei6mhHT
	 66UnbaKrxdxnA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85C6B17E012E;
	Wed, 25 Feb 2026 13:20:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Wed, 25 Feb 2026 14:19:56 +0200
Message-Id: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQrh1TprSIK+9hXEA7QKNSMzWNh
 nB3C0s3uvxfMt/MIhJ7iuJYzIIp+ejDlEPtCmHHdhoIvMstUKKRiAqSIwtMAwR2xMBXpWsD1iJ
 ZQ1JTcxD59sHU+9fmni+5Rx+fgd/bm1Su6y8xlVCCNrKpjTamc+pkw+3WdoHbvQ13saoJ/5IQJ
 Li2r5oKXW8lfkvLsnwAWVFjfwgBAAA=
X-Change-ID: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_042004_053284_71E58625 
X-CRM114-Status: UNSURE (   9.99  )
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first patch updates 'reg-names' property in rockchip,vdec binding to
allow providing the register blocks following the address-based order
and, consequently, ensure the unit address points to the first register
range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 video decoder nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Mark the current 'reg-names' listing in the binding as deprecated and
  introduce an alternative 'link,function,cache' one
- Drop the Fixes tags from all patches and updated commit descriptions
- Link to v2: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com

Changes in v2:
- Added patch for updating rockchip,vdec.yaml binding
- Added patch for updating RK3588 vdec nodes
- Link to v1: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com

---
Cristian Ciocaltea (3):
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588

 .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi              |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi         | 12 ++++++------
 3 files changed, 21 insertions(+), 16 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


