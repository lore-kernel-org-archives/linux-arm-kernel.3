Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DFBC79FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXPMM+ztbpXmlsc9kFco5HGn/tAEB/xZMxsbpBbwi04=; b=2YQFknQpvOwR5j+d10SmASiZ8u
	0cQqcxCEEABcI8bjgLT0LmV858b4+Emym4WdZ/bbcnUFhBBZg/GxsRtqGVOH1HlFV1bk6M5uEo7Tk
	aWTyGpWIgnmvTEKfuciZ/rqjePY/xoeUWfmOrkGqHM98iX4zVzIANgtCMjEpJYqjGTNSQZ40f4kVI
	etKEvV+inTpi5+21JFNUddhiehpFbZgthjjv4l4sIcbhCfRuWR7dCwc+M7oSMJ0LSuJF3I78wlWap
	emQhaJpEIylQqN9ZI0g7B9Xw2VG/3CInH0Y+smGFXpBH77qmiXGP+TuRq5USiE+2828jE1VwH86qX
	LpGFJHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fs9-0000000BTf6-3yzV;
	Wed, 09 Sep 2026 10:49:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fs7-0000000BTeE-1oBR;
	Wed, 09 Sep 2026 10:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3416E40B37;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06E08C2BCF4;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=bAFFu2lBNOlTbT2Cs9DCFFwV99YLoyXfDsHSUYG7+/8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=E2zcqXxUNKESsNFmwxsfiDggNrxfvkK40MY2efvvIQ2HDsDPX7jnv4Dg8CwPwcmJ/
	 ymftslRVmNk7+m81vie0mUcos2F74oMm4IM4aaSBzzNhU4XCLYoqUxprkQiPvuLVsx
	 vKBKk5aYPaI0AITMH1fKXK7wZFjy9AttD6BU3Zc0Lz/MilBNqlnyxzjU+NyHXwkOuO
	 +0NihDKuGQZfTG7KujWtc7BVGimihVpenjxH0Jdel0BqWK0C2patQH1dRpHLb09rDH
	 Ya+MaZIzUQ1VvvTDtTEj20Vv0eIxyY7N+bQbII4+WcLpyKHuwzw+QcDSdztig4WUyC
	 +gqvSMR0SZU5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D793AC79FB9;
	Wed,  9 Sep 2026 10:49:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] nvmem: mtk-efuse: mt6572 support
Date: Wed, 09 Sep 2026 13:48:49 +0300
Message-Id: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ7CIBQFr2JYi4GPQHHlPYyLln4txpYGKtE0v
 bulxqTG5SRv5o0kYnAYyWEzkoDJRee7GcR2Q2xTdlekrp6ZAAPFNGdUSQ20Sy22FCtTWF1qISQ
 ns9AHvLjnEjudPxwf1Q3tkAt50bg4+PBa3hLPu29YrsOJU0aN5aJCY2qm9bEPfvBdW7r7zvqW5
 HqClQ/7Hx9mH2VRc1WCUcD//Gma3t4UNWT7AAAA
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=1949;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=bAFFu2lBNOlTbT2Cs9DCFFwV99YLoyXfDsHSUYG7+/8=;
 b=LT1uhMHdEWOLytvMICqV04VZncZUHk8ekM5vbA+pQw7giELrWWp3JLnNl4rrZRBgByoR/H81n
 50/V0jdMJwrBzDw3kckJJre9a6rgCMLmdK/KL2XvOAcQS/awwQ2lG+l
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v3:
- Pick up Rob's r-b tag for dt-bindings
- Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
missing on the web mirror...
- Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com

Changes in v2:
- dt-bindings: make mediatek,mt6572-efuse standalone compatible
- Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
- Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
 drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



