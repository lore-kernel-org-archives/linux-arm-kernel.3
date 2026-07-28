Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pZZxIDCbmPabbBvha42zoIjfW/WEkZrj2Rrfd/pLuc=; b=I/24udGTXXy87p6n9SaI1ow8Eo
	MddQ9YFn+bkSqkrErBC3ElUaylP3Ff+jBQ8sVE0ztOZtSPDBPxWX0aByZWbZlEyLtiSBYIGbPHHdV
	kS04wcDJilVcDhEw9fCal0pNlWM+Iw9xFyMXlqNHkFqPogPVHgghp52CkcVte3POdrGWwsiBbNa7X
	W7OXf9Bcm7nkBpws6t1gYVM8izPq6KwKOojyjIf5RT4agRqqxrS/LjXa2BBlIvwd0atLfYp9BGBSg
	4lf4An/OVoF7IxK9k42D8iDod93RC3ndyFp0veP0kShzs5jNCXIvAmjXpdVP6u49uWA5RMs74AZ2D
	pz38ENnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMP-00000004rNj-29NU;
	Tue, 28 Jul 2026 09:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMO-00000004rMq-2B9B;
	Tue, 28 Jul 2026 09:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ED1C43974;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B385C2BCF6;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785231867;
	bh=h69R4j/rmpdgP8o8m1yEq9Zr1i/pxjtXgCv5NE7eh7U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=S0jrvz2XyEqa0+e4RphZWLei9168pGEJgI3ReuwPhXYi9AsvhTZloPqIWzMXCUudI
	 tymDdDNbjmGXtytRT97k7UkUn/cdTRbgePN4emhOvN1aIs/lYVO9L7GUdyXM/fPhx+
	 pTQvraLHu0xnKL/9fIm1SfDE/KHLgjWroJvp0TjtK8vBQ85XHHC87NtPvs+TEehu+f
	 Wg/W9basLnRkQVlxNGvyKmOgI8jy1LWlynUHBAnoSIqSb7Pvp6Xb4ls9r4+fffAe0n
	 LbB59sTr6fC9vBWOfT1Z1Q52VV69RTyZqMz6ujnPLYljlOBBz2Pn1FfDj3H8Zwcr2h
	 JYlimM7G1pI0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52959C531F9;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] MediaTek mt6572 GCE support
Date: Tue, 28 Jul 2026 12:42:45 +0300
Message-Id: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBNMSqmrRAuz0aaFhVYE0t2zW
 n7wv5cgYiCM0BUJAp4UafUZVVmAmbV3yGjKBsGF5EooJhslmDPIpG5UhbbWlreQ8y2gpeu76of
 f8RgXNPu7h/t+AOT7Go1sAAAA
X-Change-ID: 20260727-6572-gce-6a571ef4af09
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785231864; l=2056;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=h69R4j/rmpdgP8o8m1yEq9Zr1i/pxjtXgCv5NE7eh7U=;
 b=EldVTVr9AKUbsyuW29i/MN4bIvptSWUJkcBtHqg7ZlMHiIH+s6/QhfjjYsy6XeKaPBX6K4Q9T
 rUbTbLADPCXCGEsPTENo+EubLfTd3etsTrGIVtb+UwCjFwOyi8JmHdV
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

Yes I know this one is very different from basics like previous pwrap
and efuse...

This patch series adds support for the Global Command Engine found in
the mt6572 SoC.

Notably, the patch 2 introduces legacy ISA format, which is used on
mt6572, 6582 and 6592 SoCs. mt6577 doesn't have the GCE at all, mt6589
seems to have new-ish ISA, and mt6595 is much more close to 6795/8173.
Patch 3 adds mt6572 platform data and legacy_isa forwarding to the
instruction JIT.

This format was reverse engineered from the Android HAL and uses 22-bit
offset with 2-bit subsystem ID, unlike the newer 16-bit offset and 8-bit
subsystem ID.
The mt6572 HAL includes workarounds for WFE and EOC instructions, emitting
another WFE as barrier at WFE, and JUMP +8 at EOC.
mt6582 and 6592 HAL dropped WFE barrier, but still have JUMP +8.

This sounds very much like some kind of software mitigations for hardware
bugs, but during testing on 6572 nothing bad happened so far. These
additional instructions are not included in the patches.

Note that while GCE can be used for e.g. mt6592 UFOE (which is at
0x14013000, so outside of the u16 range), currently the driver still uses
u16 for the offset, because I don't have any 6592 device.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: mailbox: mediatek,gce-mailbox: add mt6572
      soc: mediatek: cmdq-helper: add legacy GCE ISA support
      mailbox: mtk-cmdq: add mt6572 support

 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 | 11 +++++
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 55 +++++++++++++++-------
 include/dt-bindings/gce/mediatek,mt6572-gce.h      | 52 ++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  1 +
 5 files changed, 103 insertions(+), 17 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260727-6572-gce-6a571ef4af09

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



