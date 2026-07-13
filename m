Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BA8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aV0ZhDy8tdfWbmkKXhZjbTAz8dmEmYRDemHpP5d81kM=; b=yxbDFcdn10I+EhczL0mXg06FtG
	AhYFXVKWDhuVI//KOh65AQUzieBU0qs/lZfiXiSQGfZxVKPGDYzZDUfDHX5bPev6d937TYqujy1Bs
	1FEEeySfTDoVq0cWfFb9fYWpWQQACJgJPGy/6Y1EELWW0gYA4HMQvGPKyyoDqfFwoVOowV7orfn/x
	1su/0D0e3sSbER+AdWEgjjgrm2TuT1vxg4bLWi9tgAcNr85tOZnvhAC7YSXv1gD/dLwyOATNjTkb8
	fQMZ5Vj/ddtujyxCVr+D7uFk97rpzNIyEfRzDYu/mnfbSPwwIrYQj/PV8vXBkUWwU1fmusgvyMvFC
	5SNiKdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDdk-00000008q3b-1grT;
	Mon, 13 Jul 2026 10:11:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDdj-00000008q26-39Zi;
	Mon, 13 Jul 2026 10:11:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E254F6004E;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84281C2BCB8;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783937514;
	bh=IH90joJ4tnRLkJPNr03igPwq+iiAzvjOkx7FuVR2LQo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jPs2CPfwNKnT/QK3kmF3AknCV+qOfFfTKyeZQiIdECp0FVnfQsWLllpPfQox/FqEY
	 i+E1OpjXy0wvVs8XTa5Rzs+9uhFpFBfhfh10r96sjjiJGnDI3nwZXE+klNcfyNW1dS
	 o4NYb1ARoaJF6oFix7S3zAPZEDXG+WXjtpGgn6Qp8FKIuRsrina4EsATbwhy5WuunS
	 umD/EJgCpdPo7kv5DfKEnFdpBemG9G4aD6TlHZWsgV00jUIS5JPsf0KxnUB0WMX4UI
	 NaQ03RiIU+au+EassF5XJ9DYfXZ3SZ6ZiTUYV/B0AyjoHblIamDSeWT46HkR7wK0EL
	 0dTtq0qdz60eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F353C44506;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] nvmem: add support for the MediaTek mt6323 PMIC
Date: Mon, 13 Jul 2026 13:11:34 +0300
Message-Id: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTQ7CIBAF4Ks0rMXw02LqynsYFxQHixFoAImm6
 d2FujEaly95872ZUYRgIKJ9M6MA2UTjXQl80yA1SncBbM4lI0aYIIJSbJPgjGOXLVhMVNdKopm
 WvUblZAqgzWPljqd3jvfhCipVozZGE5MPz3Uv09r7Q2eKCR46oEOvoKOaHabgk3dWmttWeYuqn
 9mnsPsSWBFazQlwIcuX7Y+wLMsLAjaZiQEBAAA=
X-Change-ID: 20260611-mt6323-nvmem-0c54a0f2fa9f
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937511; l=2150;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=IH90joJ4tnRLkJPNr03igPwq+iiAzvjOkx7FuVR2LQo=;
 b=e72h5C0iNaVmwv4Y/8ukUwlKHV0J3jGG7YwkrI9fJAY3hbFhInt4LTTzIWRwBD+eA4nrrKCyJ
 v4b+mBvQsnSDumEwaC9CVp4OBK+J2/pJ3PklK3CCHhJJnfOQ8aMtO3S
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

This series adds support for the EFUSE found on the MediaTek mt6323 PMIC.

The previous version of the series for all AUXADC, EFUSE and thermal
drivers was split after Krzysztof's comment [1].
    
Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
mt6323.

[1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>

---
Changes in v3:
- Rebase onto next-20260708
- EFUSE driver: Replace 'mod_devicetable.h' with explicit 'device-id/of.h'
- Drop MFD patch since it's applied
- Link to v2: https://patch.msgid.link/20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com

Changes in v2:
- EFUSE driver: Sort variables in the mt6323_efuse_read (Andy)
- Link to v1: https://patch.msgid.link/20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com

Changes after split:
- EFUSE driver:
    - Remove 'linux/errno.h' header (Andy)
    - Remove explicit cast to u16 in the 'mt6323_efuse_read' (Andy)
    - Reword comment in the 'mt6323_efuse_read'
    - Capitalize MediaTek in the module description
- Link to a previous series: https://patch.msgid.link/20260512-mt6323-v2-0-3efcba579e88@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      nvmem: add mt6323 PMIC EFUSE driver
      ARM: dts: mediatek: mt6323: add EFUSE support

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 21 ++++++
 MAINTAINERS                                        |  5 ++
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |  4 +
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/mt6323-efuse.c                       | 85 ++++++++++++++++++++++
 6 files changed, 128 insertions(+)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260611-mt6323-nvmem-0c54a0f2fa9f

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



