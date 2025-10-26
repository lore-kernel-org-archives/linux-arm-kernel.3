Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C85CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J+oIT4ZSlvcfRBxWrhMbinuOO7yYO/gbdfjRoPL1coY=; b=ytjqJuM6L6A5oX1ZmsZZRtLczZ
	1xQ0zyUWhndw2IhXd+c51iC/oKqsJo3cVCx4Rwz3owB4RLTN3hHK8n1n746Q5FOy8auUCSY2zA2RE
	lacKVCRENQClOBXwRA/y/4fZDs2B4Hshy0ZOI6NTmxS/vW63Yx8mtLLfR+sRHMS0ZJkHuQDiJ7S7z
	/ZqvlhX+BasG5/DPwxXMASw7Z1n+y6aRaL1Fy5yR2Q9UsDwkp6imXIl6BD7aT19qj6sI1Pwfkvn/v
	OwZ/Gxho1oE6gfd6vOO7FjJUrATFMMDA5z+YpNvwb5PmoeiGVfIZbVpBZm6eB62Zwiy1J0fotwyp0
	J20ppKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlU-0000000CJLl-3dK7;
	Sun, 26 Oct 2025 12:22:28 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlC-0000000CJ8J-0x9J;
	Sun, 26 Oct 2025 12:22:13 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id AF8551009AF;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761481324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J+oIT4ZSlvcfRBxWrhMbinuOO7yYO/gbdfjRoPL1coY=;
	b=Id9AfSYAhE7BUezRgygKn+cTdeMOS9iccD0ng4R2WApmSTYJzCCbI8sBEueLCgAiyhfc/u
	dYrXxb+B+75Ubd5pw4LPbgDBLXKAasM6sWSf8sJ48OLHS1xU5gBUxbuuhuY+S8rOE3To8t
	GqlEZnhmeVB57YcfTr0Vj+DtPs1pZOA=
Received: from frank-u24.. (fttx-pool-217.61.154.70.bambit.de [217.61.154.70])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 60B4D1226BC;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/5] Add MT7987 Thermal support
Date: Sun, 26 Oct 2025 13:21:29 +0100
Message-ID: <20251026122143.71100-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052210_511046_6F09C900 
X-CRM114-Status: UNSURE (   6.94  )
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

This series adds Thermal support for MT7987.

Frank Wunderlich (5):
  dt-bindings: thermal: mediatek: make interrupt only required for
    current SoCs
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for MT7987
  thermal/drivers/mediatek/lvts_thermal: Add no-irq-mode for mt7987
  thermal/drivers/mediatek/lvts_thermal: Add SoC based golden Temp
  thermal/drivers/mediatek/lvts_thermal: Add mt7987 support

 .../thermal/mediatek,lvts-thermal.yaml        |  18 +++-
 drivers/thermal/mediatek/lvts_thermal.c       | 102 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |   3 +
 3 files changed, 111 insertions(+), 12 deletions(-)

-- 
2.43.0


