Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A093CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JMW6vRNlt9c7igCTjVjkTh4UtCCOV2FkyBU2sqg+Bg=; b=c0sKCbsIsSPXgeO0Gq8aGXYx3G
	PBaitJxDpq2sJP4lqnmcglX87gREcH6h5aDYvy8JRthnFbFakGcNwwCI+ds30Ab4GTCVR9iK5nquY
	/4AtZelLY7+c9rcvP71GlufZopTdsltObzHVgQ+NIL0Wxro2YLGfogdMEUWigxznLWMCGsYGerVeu
	xQX4De5OW5CXJ9HeRHadYJPU3xjupi1lZCguilbO2yIR/OGbfRNqgYfhM86FRVOmU76fO2s1/Xvsu
	vNj/oAJladDJpoVkCyBKouLd3jjmRtJVFBz8utO/6YWYmgZq+xb5v1kfZqhwGJ8luW2TxwLp5geUL
	YThCcM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n9X-0000000AApf-1lNP;
	Thu, 25 Sep 2025 14:40:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n9U-0000000AAjo-14W4;
	Thu, 25 Sep 2025 14:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758810689;
	bh=oZpdziF4+X8prnKIEf9KWYpfYHcE/0mFo9ZuSHU8tuE=;
	h=From:To:Cc:Subject:Date:From;
	b=XaoyWfbb9lkk6pJSR6AcsgrqMftwa8VodFduageFkeZF1KrzKuav19tCrmXFokXnY
	 nx5wBL2nsrERzEdEL5reLJmz1oqwCZqj4e1Mn869sV3TbrbRNCWH2JwetV4nxxVdYG
	 qBH4gF5kL/p/cD5hd9Yjq4+xdHmmhiVS7UIU6xqblbRDZpUnsKkU1ykoXTp6Fs+2Yf
	 SG45njJbOA+rRP8NRRkMjnHsQdbzzDbo+YupKlrcH3PKkpA4BOfDD9ru1YDb/Rw8PY
	 BVHs5mrKddymwCYEcojI1ljTMUgifd4rrQPYE/zle7ET9smEfAc0hxJNieHfJgy0NE
	 fbTuUMpY3yvOQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B455617E0EB8;
	Thu, 25 Sep 2025 16:31:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	fshao@chromium.org,
	y.oudjana@protonmail.com,
	wenst@chromium.org,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/5] pmdomain: mediatek: Add HWVoter and MT8196 Support
Date: Thu, 25 Sep 2025 16:31:11 +0200
Message-ID: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_074056_460217_50587B0E 
X-CRM114-Status: GOOD (  14.06  )
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

The initial series [1] was refactoring the bus protection regmap retrieval,
adding modem power sequences and support for the RTFF hardware found in newer
generation MediaTek SoCs - and adding support for Hardware Voter, HWCCF Infra
power on, and MT8196 domains.

That series was doing a bit too much in one shot, and then a discussion about
the whole Hardware Voter started, so I decided to split that in two parts:
one dedicated only to the refactoring, modem and RTFF [2], and one that only
introduces MT8196-specific parts.

Since the refactoring series [2] was merged upstream and the Hardware Voter
discussion came to an agreement on how to proceed (resulting in all of the
MT8196 clock drivers being also merged upstream), it is now time to send
the final piece of the Power Domains (MTCMOS) support for the MediaTek
Kompanio Ultra (MT8196) SoC.

So - this series finally adds support for handling the Hardware Voter type
of power domains in the MT8196 SoC, for secure infracfg power control, and
for all of the power domains found in the MT8196 SoC - using all of the
newly introduced support (HWV, RTFF, etc).

This series was tested on multiple MT8196 Chromebooks now for more than 3
months, and works just great; the last test was performed on the Collabora
MediaTek integration kernel tree based on next-20250909.

P.S.: This is a v2 because the initial series ([1] v1) contained patches
      that I am sending in this series.

[1]: https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com/
[2]: https://lore.kernel.org/all/CAPDyKFoe9=4KgOsPUX6FOE+yPxdUqAxRec5yKY2h6uFOeUvvDQ@mail.gmail.com/

AngeloGioacchino Del Regno (5):
  dt-bindings: power: Add support for MT8196 power controllers
  pmdomain: mediatek: Add support for Hardware Voter power domains
  pmdomain: mediatek: Add support for secure HWCCF infra power on
  pmdomain: mediatek: Add support for MT8196 SCPSYS power domains
  pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains

 .../power/mediatek,power-controller.yaml      |   4 +
 drivers/pmdomain/mediatek/mt8196-pm-domains.h | 625 ++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 305 ++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  49 +-
 .../dt-bindings/power/mediatek,mt8196-power.h |  58 ++
 5 files changed, 1012 insertions(+), 29 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/mt8196-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h

-- 
2.51.0


