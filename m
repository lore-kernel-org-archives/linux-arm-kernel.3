Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF41C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=efYs/jR9h9jW67Zzv/KcTXD47OtR1EtUFCZew0UizG0=; b=0g2JHbJQ6IbXRb+OyVtULAVt0t
	xP0l/M+Zl8dlyTgy9+RB7vFnp8i0xGz5gvfhEZNSzmOos1ZzIsoWhYEPBwxMyEhHFo4Jihc16h19T
	XgpnkB3D7kax28MM2JB7+tZlwU6FiOB62oO/SUV4YSgusuN8si/q3UnTf1VhFF3nQAW7jpyyKkYKp
	kW0nj3V2du80caOrJqu5L+oYVGiFMKoOcSwKSImNsI+5kHc6UwW6N3Hh8R5Lcu2y0YSYQ5yjsgR4k
	L2wzf8M5M74vzApT7xTjHiXAqaoUsgZwarb2RM9jmkBfM2IqhykwaN0kCpfGP6NyfKVwpRJ5WPACB
	VeezXTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdQA-0000000CDaO-1DB2;
	Tue, 14 Jul 2026 13:43:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdQ7-0000000CDZN-3Cjy;
	Tue, 14 Jul 2026 13:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E742601ED;
	Tue, 14 Jul 2026 13:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7EF3C2BCB8;
	Tue, 14 Jul 2026 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784036614;
	bh=B1dBuvMZZ+KcwFGP5V1ibOQf7yfUIHEhJB2HnHqSE8U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OSfGIXu5+2O8AgQ4LugWIAo61FThlKi+tRdvJ61u8oXUBBM/MWsVcCQLCJNI/WuPb
	 NVCFw7gB0lqH1yrshwFQXuBJ2QYg+vtI5N7sk3uMmrPviJE8gYiMWTMB7rgcaF2nS6
	 +YF2XLybTqN0U4M3fteyb6I6RzsPQAhqi3eZuYGtE9/ktuoI0kZh30Y23ggETN2REY
	 E8SuuUTkV7W2S5wP3EG7P+e/n016PQGrmZ+69pZrmus7F2ip2i9ohk2jr7Z5q2N2GF
	 q8g2BiC+ZqllBqorMjdLzdkW9Bhv6x0JdmC3lKVqu4fuB1MV32mZBJzcUJbvFo+mLB
	 Ow5PTPYsBVxqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9ACC43458;
	Tue, 14 Jul 2026 13:43:34 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Subject: [PATCH 0/3] pmdomain: mediatek: Add MT6858 support
Date: Tue, 14 Jul 2026 16:43:05 +0300
Message-Id: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOk8VmoC/yXMSwqEMBAA0atIrydggmk/VxlcmNhqC4mSqAji3
 Sejy7eouiBSYIrQZBcEOjjy4hPkJwM7dX4kwX0yqFxhXkol3IaVrsTq+sV17IWRptBoa8RSQ6r
 WQAOfz/Hbvo67mclu/w3c9w/7JHNicwAAAA==
X-Change-ID: 20260712-mt6858-pmdomain-b1b456c96675
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784036613; l=1329;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=B1dBuvMZZ+KcwFGP5V1ibOQf7yfUIHEhJB2HnHqSE8U=;
 b=7XYaBQR0BIJLfPGmhfDUR9Bs/0HhvM8dGolGPEg8QgVpXC8TT/QvkiyeLe93zS9DVUWcHPHR7
 2IE2UQgYK8lDxEVfgyemtphDYUBAviBuaFKS2F5E9OztEPHeythbnUF
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add power domain driver support for the MediaTek Dimensity 7100 (MT6858)
SoC. On this SoC, there are some new subsystem-specific bus protection
blocks, which are listed here in ascending address order:

- IMG_SUB0 at 0x1502f000
- CAM_SUB1 at 0x1a00c000
- CAM_SUB0 at 0x1a00d000
- IPE_SUB0 at 0x1b00e000

Additionally, implement the SMC-based power sequence required for
enabling the modem power domain on this SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
Nikolai Burov (3):
      dt-bindings: power: Add MediaTek MT6858 power domain controller
      pmdomain: mediatek: Add support for secure modem power domain control
      pmdomain: mediatek: Add support for MT6858 SoC

 .../bindings/power/mediatek,power-controller.yaml  |  21 +-
 drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 462 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  59 ++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   6 +
 include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 6 files changed, 568 insertions(+), 6 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260712-mt6858-pmdomain-b1b456c96675

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



