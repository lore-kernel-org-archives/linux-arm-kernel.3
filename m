Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9148ACF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HaqPbwPGuRmXKfIOb4hglSygm5f+Q8V0KzyqESLUXrc=; b=Gn3Rm/SLS5tsZSyA28wDU7CW1S
	rb7Y/oFaVRzcy6AadavuIO7v0JHfPQYBOneQNOThWOvAGjzru2WkqXeD4BrhQaVhq8JPaKWR3Bh8r
	77UgQXPsejeXf+YQVptC6np8PdaIpgR8y26lU6TqRfL2qPM4hiAAvEcXuo9Cm0TgFo0ySDeG0LACB
	pmHP98EWNVxPpG2e80W4+qlKrq+bj0mWsVHY+cX+4i5UvaczWi4IUN4gBxg/5d3ZjiPE6XNrrq9gD
	2TrxGIp5mSGVVcwovmONtcF3gXufVKH1TRRBzQNCmNpVzYvwEgUrb8nIDl7YB2rdX9+ts5EzTSh92
	kv2KiHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmLL-00000004IZV-1Tcx;
	Wed, 19 Nov 2025 17:51:47 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmLI-00000004IUp-27hD;
	Wed, 19 Nov 2025 17:51:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id AF7DB6065C;
	Wed, 19 Nov 2025 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1763574699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HaqPbwPGuRmXKfIOb4hglSygm5f+Q8V0KzyqESLUXrc=;
	b=cffJuY7Jhdmcq9qm/a2zBGBo6pB+9HHg7dIgRCjs/8Mv+pZeODwEPxbt6TqLVKx+q0OdDG
	EWsav4+Bgmg9q9SBmtvgP02sTGrRfcixX38yUCaCfWFOQKUzTuYdQdhr4aq4eSaH9FLUFi
	X/DdZnLN2fAPAkRxElXC5iHc2OP5wiI=
Received: from frank-u24.. (fttx-pool-194.15.82.239.bambit.de [194.15.82.239])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 7C1741225D8;
	Wed, 19 Nov 2025 17:51:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
Date: Wed, 19 Nov 2025 18:51:21 +0100
Message-ID: <20251119175124.48947-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_095144_742630_EBAA2751 
X-CRM114-Status: UNSURE (   6.97  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Build devicetree binaries for testing overlays and providing users
full dtb without using overlays for Bananapi R4 (pro) variants.

It is not required to build all possible combinations, only for
common usecases and to test if all overlays can be applied.

This series is based on
https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/log/?h=v6.18-next/dts64

Frank Wunderlich (2):
  arm64: dts: mediatek: mt7986: add dtbs with applied overlays for
    bpi-r3
  arm64: dts: mediatek: mt7988: add dtbs with applied overlays for
    bpi-r4 (pro)

 arch/arm64/boot/dts/mediatek/Makefile | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

-- 
2.43.0


