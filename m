Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B911E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tjYgt1CQw58XuCylkrFISW4zKmVrf7CMBS76y+ruTbI=; b=zVjbPVJOdFO3i62tXaPN8NqF5H
	uc0L1yMoMjIk2BOU+Z5NZg5gb13Ycchwhg/72pvBnKLehDyCNfjRoJONHHNgrKEiR/A3iCvtfMCkZ
	mWkBXfF+0nlfJa8KZmZ+hYGaK7scZDTaBy8bE8K3bD4y45j7LNxfGyxZPuYWpQWju3LRGLEy/NJhG
	BUureMtyeZhjPs5uZ/TIhMY+Cx/Uc5s01LGDdYjLDWlq/XiOTHwip9gSWNB9WjRdQZIK7vflEmU9O
	G9LBrMLjS4DRe9saZFdbUhNHcMbJg5a7BYtZlpU+J6OltxpPnIsUENITpfO5TRBjDTVnPX6tmNqP1
	dg2ch+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg3x-00000005UXA-0DCG;
	Fri, 20 Dec 2024 16:41:17 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg1f-00000005U8i-49Nm;
	Fri, 20 Dec 2024 16:38:57 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 1367B605B2;
	Fri, 20 Dec 2024 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734712730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tjYgt1CQw58XuCylkrFISW4zKmVrf7CMBS76y+ruTbI=;
	b=BAHTSbKQK4W3U7BmKkj8afDyFnIaqJf7+r6MPsHSB3CRwE90axCkmOQYML8uijPZkVXFZO
	axEdZyiSb4qQscOdGCFAaTiaaU/UkrieED8xCeyuC0bQhpnUaCks7PQHU8BlH0cWkJ3o7f
	YAB5tMeO9/bfHZyFjBfy5xvuj8ZhOJ0=
Received: from frank-u24.. (fttx-pool-157.180.224.233.bambit.de [157.180.224.233])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 35BDD10009B;
	Fri, 20 Dec 2024 16:38:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 0/2] Add Pmic to Bpi-R4
Date: Fri, 20 Dec 2024 17:38:34 +0100
Message-ID: <20241220163838.114786-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e374b4db-7a48-4573-966d-86f79ee2b1a8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_083856_180207_B2E54253 
X-CRM114-Status: UNSURE (   7.49  )
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

After these 2 Patches are dropped from my dts-series [1] i verified these
with mtk and changed based on this.

The problem was that voltages from BUCK4 and LDO were not matching the
voltages from schematic.

These 2 are not software-controlled, but should show the right voltage
in regulator overview.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=918585

Frank Wunderlich (2):
  arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A
    PMIC
  arm64: dts: mediatek: mt7988a-bpi-r4: Add proc-supply for cpus

 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 66 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  8 +--
 2 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.43.0


