Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070ACD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvMBjsD97tE09s6+r8dhfSKyL8cz4ncNUnwsbiFKH/g=; b=xlSbt7Y+gpsRpfnYmV3B0Xm15T
	rGnPak1ApZDZN5ETVHTHVvKcpzP+KIWwKQndeV8mt6EwFM77ol2HdZQ8tsXNk5cmJtHiaKBwiqCKV
	SeQbWnSKnMvmTtN+OQUUtHlhdiTZbGzlX/wICVezP2W214lEU8oVcbFNllydRaUi4EHAMp7pJ28MI
	a5rAr0Gcysq0gVtrbbixpqVcoKFsNGt18im1YiUh03kiGOn9bWBNbPyNw/N1CNAH2oLhDWBE0saP5
	uJ0T7AzNeAmtyG+YF1kw1OKcOq1AZoeL/Wn06DePqpGephDAg0AqgQcRhRgxxv5hOYcLiu7ivY4x9
	vEHxccZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ5-0000000FZBO-2B1S;
	Tue, 12 May 2026 05:21:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYs-0000000FYp6-2Vn3;
	Tue, 12 May 2026 05:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 753E04456D;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E956C2BD01;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=6SFZF+NTen922PE1ArSi08AMU2PZI8nLuqrAISJituw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ngQRF1m3bmKPnZEetHyr/RJFmkI4HWtEiADfmg4SspfXAiJ0vQ66BuS9gh0Y/FV8/
	 te3tq5eJW1vj76NW4IS0rXOvTFBCas7qCMzurmVKPZ2ygVonbcITI1LMyWnsYflpk3
	 mTo8XqiWu35y1H7Sw2WY1CCmdMTrRbCNVaC4WOIqJkpCr8vIculFkgDEAWa75g40c6
	 YvFZSkuBeMeIG7o1SzNQLMGqqQGqJpJsj3sDMu/mi2Nd9gCS3mOLQDT5Git7nFmDlk
	 kMRrs8+TJhp7qEq0wJGm5j4V7EJRE3ck6KzIJ0rNzrHqQIfv69fBntNg8aCNoQE6My
	 vH/Mfi6+E7gMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB78CD4F23;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:23 +0300
Subject: [PATCH v2 09/16] mfd: mt6397-core: add mt6323 EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-9-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=882;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=GPch+58r1L1I1B+sfDoMb6oSqyH40wZP5mRd3W4Ge0A=;
 b=tidA5C6NziO4sL+9a0SjQtog/7ftV7CvyorPKf+60ZERSXZz2+v5rX/xDIdLu57Z7UiXac42D
 iV0kIewiS6lB0Hk3oYfitPbziysOltdHyhzIiYHcUz9FDMuHQWXA0A6
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222142_791926_E6C37626 
X-CRM114-Status: GOOD (  11.69  )
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

From: Roman Vivchar <rva333@protonmail.com>

The mt6323 PMIC includes an EFUSE. Register the EFUSE in the mt6323
devices array to allow the corresponding driver to probe using compatible
string.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 013b0857fb54..2d9419b80a5c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -127,6 +127,9 @@ static const struct mfd_cell mt6323_devs[] = {
 	{
 		.name = "mt6323-auxadc",
 		.of_compatible = "mediatek,mt6323-auxadc",
+	}, {
+		.name = "mt6323-efuse",
+		.of_compatible = "mediatek,mt6323-efuse",
 	}, {
 		.name = "mt6323-rtc",
 		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),

-- 
2.54.0



