Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42F9C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wrJxoze654SeMS13Iv5daLLN/tOqJCzq3/Ho+ffCnuY=; b=YwVMiyCRkpMbwu2wjyQF3bPZ1c
	5Li2NmgXU1KLPE/wWYisDbyqWR+At3FGdsTB7BrdOemAk/wc/5vYliOhOdhtKYA9kkbY/HhEk3o3y
	uA9BVnqlkkA4hVLVij1tctumo+solea6L+LWClJKtky1YSyb68QD0mVe1lENVVQPNlRb2+WBJbuFt
	1erbYaKTRMBWpTVqdOYLx6i7Mp/JBofh8Xf5SlUpwakmauDZZqF1224cTTiniPzLLDxUeDF0mYWPA
	nNdQ6UkgfIh4jXhHkhZrb9mtGdlF0QG76E5oTXs2kklexhPHEWPXY/yn1r9YUNqXkoB/VvL5JGzlr
	YnIDbaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiakz-0000000BSGR-48XJ;
	Thu, 13 Feb 2025 15:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiagw-0000000BRdQ-1KKe;
	Thu, 13 Feb 2025 14:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wrJxoze654SeMS13Iv5daLLN/tOqJCzq3/Ho+ffCnuY=; b=KMpI2mgyn/zjxWBxihLZsRvFjl
	nJKs7rbg5NT5ozfTZgjIZFrtw8g4wTdGm3TiFkxACxc7T4UjH/fQIFrZFx+G7dZBF59qqGrYDpFyC
	zNGQ16fbQKJNaA0/WGYXqS0AneNWgEORYKRR6zE2sSLlRNMqKYKqCioZi+vflvT4gKYg1d9wLvRyu
	GZO2uxKIPvJGBz24ICI/Vs4ZqXV2gLdacyipd68muv3dvKkgrQr4nsFcWYIDZqyhHUOiTDbqE+s+G
	mJ/tUpfpx7xZYt6tp7SwgXdJcJZ5zNjv07HJxJPc5NxDKSwiylFN+hqOTdk8Wd5CbVFvcA8hjObAS
	2CAZywqQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiagt-0000000120Z-0asv;
	Thu, 13 Feb 2025 14:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739458782;
	bh=PzugOx+4ra1PqnGgELz15+sqXj+M3ESMLusQKl3awcw=;
	h=From:To:Cc:Subject:Date:From;
	b=V9c3VuQgJPJnOP5JULePngdkBX3xZ5UZ2bAz8KAHU+t2upUY8ohekBnv3wk/gcMjE
	 Gw3HUyJC0qG0toMNifhEC+NsJcSaRYTT014JpqzjEfu51PbAkJtWRS7r8j6lAIef3B
	 /tzBvcBc1lY1XEBNcMh5A5Ma3CXIvZ/ot2na2zt+6W7Ivuy5C1Eb32NX0yXPLMS2LK
	 fgcQdriTeFlEMh9MrDPDVSs4skj8JTdkARzGthPVMg5eVCoKIkPpVFViM+Y3EgxU9Q
	 2uRgHMYEqSMGxf+C3PPhRqSA5+UbXml7UfhgOdecUtPC/7vnUUxCnMKEPqghigF/Ls
	 BLD4t825ueBDA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D7D817E0391;
	Thu, 13 Feb 2025 15:59:39 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Tim Lunn <tim@feathertop.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] Add Radxa Rock 4D support
Date: Thu, 13 Feb 2025 09:57:14 -0500
Message-ID: <20250213145921.133412-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_145947_406471_682944C6 
X-CRM114-Status: GOOD (  10.95  )
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

Add the basic support for the board. (Not officially released yet)
It is based on the Rockchip rk3576 SoC, so I haven't added the
following devices yet:
 - VOP/HDMI
 - UFS
as the support for those has not been merged yet, but are close to be
and I already validated that they work.
It will come with another patch set.

The following devices are supported and working:
 - UART
 - SD Card
 - Ethernet
 - USB
 - RTC

Changes since v1:
 - Add missing dt bindings
 - Remove clock-frequency in rtc node
 - Add line break in pmic pinctrls

Detlev Casanova (1):
  dt-bindings: arm: rockchip: Add Radxa ROCK 4D board

Stephen Chen (1):
  arm64: dts: rockchip: Add Radxa ROCK 4D device tree

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 651 ++++++++++++++++++
 3 files changed, 657 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts

-- 
2.48.1


