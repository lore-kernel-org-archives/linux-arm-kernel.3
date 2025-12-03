Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4926D12D4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ocxSVnWaB5A1nFsXhy8NXJuJz7MlPd1GFAKEa6olErY=; b=oR/qppi7YpZ96n
	UTRHDBMJ4i+C8I3ag3x4aJyHMEEpL3w7LyPwxP+Y+VEc0GR8jtieVn5+skkIM/BRBAlmKM0Askc6K
	XoCzhvn4jkqgtE5cGW5dcXzj5hjese+idsiDbh95xl86QcwMO8v1fNlb0KcMlh61NleTMyoRA/1G8
	QmLwdVQ06s4FuSF6VRfz720KNn6RIklN76hWi2EFPNge9nV8FvSltIKXhMP4jLEzgNkknbVNB8mDR
	Zcpghy+xbGOFC86XwJz86aAG4tg2m1G/HRyupiEoBOqMugglwma6X3CNjt5v75opkfp7KmpiTp7Bq
	BmNETtFkYAd9wIH9a+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIt-00000006W7h-01ko;
	Wed, 03 Dec 2025 11:45:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIq-00000006W6M-1jQz;
	Wed, 03 Dec 2025 11:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764762344;
	bh=GVsvFJMJ9N1wsNH4BMhV4STieOC8bBaHmsMcDsgLe4w=;
	h=From:Subject:Date:To:Cc:From;
	b=ertmZ7iCiPYCTgzNdCrDhswfqUjpHR4k3lTL1s7LIWWTrYW9XbnCZEqQID0zhiJ6r
	 Aan5ISTpWm6V7l4Hu0i55Cv8ReWTfaiwhy9Y4Vjg+uMxzp9WUiIxdNGthlol2IAuXD
	 NXEnaZP6yGstcII9GQUa1XqFCt+nMJfj0/2WlC635F0gWeinyZvZy/71aC6zrMl7Yt
	 wbzCW6lIHL1C/4ZkSbYKzyoPPIjX3fkZvEpWVhBijqeML3IJRhV18Q+6NDiwC+NOqD
	 UHn3KVabohseoxj4gT9PMkiNQ1QoNb7X3jOI0xsoS9k9qrXLbmQzn2sNWR8q2TZIy5
	 siGQOp4l4S/cg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3640717E110C;
	Wed,  3 Dec 2025 12:45:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Add SD/MMC Card driver support for Mediatek MT8189 SoC
Date: Wed, 03 Dec 2025 12:45:33 +0100
Message-Id: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrDIBBFf0Vm3YFoH5j8SsnC6tjOwkfVlEDIv
 1eS5Tlwz92gUmGqMIkNCv24cood5EWA/Zj4JmTXGdSg7lIqjaFpqUc0zmEIFuuScyoNvX84r70
 e6Sahj3Mhz+sRfs4nF/ouvd9OCS9TCW0KgdskIq0Njw81XGHe9z8w9pEFmQAAAA==
X-Change-ID: 20251128-mt8189-add-mmc-support-ff6df8f89e41
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764762344; l=991;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GVsvFJMJ9N1wsNH4BMhV4STieOC8bBaHmsMcDsgLe4w=;
 b=uSJLBh6B+FOH+EPSJKMaFBFDHGGU0Q1u9uG3pq7ilcrCaZzR/IRrFpLBUB4FALTltdRD7PHvo
 JysB9LtdEwvBavezS+8USNHo/tASlNSB2b+ZSNLOl9ZyS6faqL1Be0h
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_034548_632895_CDC30CC7 
X-CRM114-Status: UNSURE (   9.88  )
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

This patch series adds in the Mediatek SD/MMC Card host driver (mtk-sd)
the support of Mediatek MT8189 SoC and its variants (MT8371 and
MT8391).

It has been tested with a kernel based on next-20251203 tag on the
Mediatek Genio 720-EVK board, based on MT8391 SoC, using both onboard
eMMC storage and a micro-SD card.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
      mmc: mtk-sd: add support for SPM resource release control
      mmc: mtk-sd: add support for MT8189 SoC

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  3 +++
 drivers/mmc/host/mtk-sd.c                         | 32 ++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)
---
base-commit: e47d97576181b31291cf58e77d737d21def0e160
change-id: 20251128-mt8189-add-mmc-support-ff6df8f89e41

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


