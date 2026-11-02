Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2560A2633
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1DNosXgZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6U8zPnz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Cie1gSyrYbMTqRrUQtHSjOhd7eFIgioVLrH28tB3EY=; b=1DNosXgZOa2teR1i/OoPLVnzce
	nXdncQqExKXV4ZBjXYmPJCMwMZLm7K6nHOjJMjPfrGfQMb/WqGaA5hyKH6i/aqGT/OI/Dm62mIsUX
	STZqtnF65bV0/5evQoNr9GAFXml2q5G/OpAFO744SwO759qE4zLuduLNNf07AvHddfksJUCSl+DmK
	VjReSffkyVTcwu2CsBO61tPRBNsLeIUIiNX2Yu+fKof8neIljSWinr8mBT0efKFe2dscHo1fs3gPG
	+WxqmcQRtoUO1wntrPhq84Z4iJFfI4Wx9pCFe4g3+FMryw+2WZ/z5YXMPPuUCO0prXmjGRNxnRaip
	eYWMfvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt1G-0000000GpM1-39zB;
	Mon, 02 Nov 2026 14:28:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt1F-0000000GpLI-3gqa;
	Mon, 02 Nov 2026 14:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE154172D;
	Mon,  2 Nov 2026 14:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4374A1F00A18;
	Mon,  2 Nov 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629697;
	bh=4Cie1gSyrYbMTqRrUQtHSjOhd7eFIgioVLrH28tB3EY=;
	h=From:To:Cc:Subject:Date;
	b=C6U8zPnzG6Kk9C0WRXWL/Lt86oVNlsaKN09RWtD8XeNRWioGGKqy3qwU2Bdzg2H5d
	 kw+BmHVxewm+dTtZA1nJ7zizeUtamf5oxcGrOBineN25XtKAEObYg+fHTayncrRYic
	 zRnLoSyqZfQ06x74xzj2+NOwtHcI09h5Rn2YjDrk5QgH6k6IOnOD6E73ePK7WD/Wu2
	 eBip2dQCqpYBJw5a6PIrHrLCe6en30EOKg0NcG/R61DkYaOtCEmVg0APnYpnYXLUSf
	 urRggLadORKILDtiwYo1mh/LFjTqbf9hY+HW5v6nKk/j1dFsH8B7+1hMA4iC2XRk/O
	 FWWpWaY7MzFeg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mediatek: Fix MT8186 child node names
Date: Mon,  2 Nov 2026 08:28:11 -0600
Message-ID: <20261102142812.2743578-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use 'playback-codecs' instead of 'speaker-codecs' in the legacy-property
exclusion for both MT8186 sound card bindings. This appears to be a
copy-n-paste error as 'playback-codecs' is the name defined by these
bindings and consumed by the driver.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml           | 2 +-
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 037f21443ad1..922dfdf55a66 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -145,7 +145,7 @@ if:
 then:
   properties:
     headset-codec: false
-    speaker-codecs: false
+    playback-codecs: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index ed93f18ef985..ddc7a0ce69be 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -144,7 +144,7 @@ if:
 then:
   properties:
     headset-codec: false
-    speaker-codecs: false
+    playback-codecs: false
 
 examples:
   - |
-- 
2.53.0


