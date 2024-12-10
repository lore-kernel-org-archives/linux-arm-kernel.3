Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C012FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vtsiNmh3x5mGNvD72bEl7vI7T1Sm04ahct4zug06QCc=; b=IY9dfWZypkqvxT
	TMLGJwrxuUNDZBBFK7xkM/U+n0JgRbVHlQ2fmH+PKZN88qmRmVeVTPJeNwVyye6B8ByCEMqCsiVKV
	NsDIT9MiPajHcmznftTaugxB14rsz38zD/Dfubf85/aTWEpXxHSydUVg77ucdZFz1UY6PmBZmBVMD
	zdg+xlZ3hlYKFkRhNoLooAWGscfnzJQEktqtpyTf9cyRulsfBBSR589A2j7kZgSGDxxMbkAGiVqA7
	45AsBwapq+ZJJ+dgurqSZnQrrlAgb4IS4k5Okm4edWupElO2LZ87+prF3p3esjImjo4G2MqLvzq4r
	sB5AR9SpCh65gO4DFSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Hj-0000000CjNM-039K;
	Tue, 10 Dec 2024 20:56:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Fo-0000000Ciul-3eoR;
	Tue, 10 Dec 2024 20:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733864087;
	bh=NDN0SnBLoWNiGYnla0Xah/O39AF4IpvBlJqD83Budgg=;
	h=From:Subject:Date:To:Cc:From;
	b=X55KkPeFFbbC1PUtd8IqdC6yhu9RZlxMgJdIe5Gnb0ee9wLreXlu1HVHk6JqNxsAX
	 OoFPQF7vhBVfG1TNLa15E3Z4YOaSdikSybexOAogUTaIpPphzgaLB0mrE0SbygcssL
	 ZM++8Z9PXzFY7jf3qhS9Kc+hBrKRWlSOkMGIAw7AEQ8EA2U0AKdVJ7kp8BwzPwJ1lf
	 PzeVxxTaRo2J5NZMJKQfaetDeHKPvJvEHI1sjD9jVh9pLMcHdrH7RewJYIwZLN3bfA
	 Eq6bMJ/nRTzK2isBk+hUdaq1/VvCYmbK693akW0fngbtBUPQfUEUc/fPuqE9rbTRRl
	 aFtXlQ/d9HIdw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1976417E3802;
	Tue, 10 Dec 2024 21:54:42 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/2] Enable audio output for Genio 700 EVK board
Date: Tue, 10 Dec 2024 17:54:27 -0300
Message-Id: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIOqWGcC/3WNQQqDMBBFryKz7pQkKGpXvUdxEeOoA9aRJEqLe
 PemQpddvgf//R0CeaYAt2wHTxsHljmBuWTgRjsPhNwlBqNMro3KcaCZpVQK7dqxoKxxWSP2ra1
 6Q63ttIK0XTz1/Dq7jybxyCGKf583m/7aX7H4U9w0KlRUF4UrK2dqujuZJtuKt1cnT2iO4/gAM
 dKh6L4AAAA=
X-Change-ID: 20241204-genio700-audio-output-fba8f2ebad10
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125449_081479_D366BEFF 
X-CRM114-Status: UNSURE (   8.87  )
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

This series enables audio output support for the Genio 700 EVK board.
Patch 1 adds the missing #sound-dai-cells property in the MT6359 node as
a prerequisite, and patch 2 describes the audio DT nodes to get audio
output working on the two audio jacks, Earphone and Speaker, present on
the board.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Dropped merged/unnecessary patches (2, 3, 4)
- Removed unnecessary mediatek,dai-link property
- Link to v1: https://lore.kernel.org/r/20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com

---
Nícolas F. R. A. Prado (2):
      arm64: dts: mt6359: Add #sound-dai-cells property
      arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output support

 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  1 +
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
---
base-commit: d1486dca38afd08ca279ae94eb3a397f10737824
change-id: 20241204-genio700-audio-output-fba8f2ebad10

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


