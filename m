Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0CDCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75usRvvBUvYXukRrmuxSOsHIRzVX/Q3R0OCmCMp32EM=; b=fvc/g7t97VMbBQHSep4t8eov0X
	6rmuoBrHCpEsBxOaeO8nRqPehDXtNh291nVLXRonCkdn27QtU9gaf2sG9LY+G6YTcKDXXTHcy/YKO
	rqjwTz6FsCw/o6SdGEMXWN2ctgTKbeKBcjrBXl72mmtS18vNJMmc9LMYnCcbg2pfY/bTRdkbSzA6G
	mBpBC89Og83LAYIkugXafqOlOX6TgnM9cSeRInUJUtbDzWdncHzRja0ndvWjJgvIjqZyqDiRWHNIB
	PrYxsxXqtaSVp83STkhVvhzAzBTMcGQxBFGi1nDxF9YXUmILeta5rmpvZSUhJZrhMa7YocXQENkNL
	CEsG73iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Oz-00000005cFE-2dcL;
	Sat, 20 Sep 2025 16:25:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OP-00000005bgW-0uO0;
	Sat, 20 Sep 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86B3760194;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29646C4CEF9;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=PAEbSGe1wIOU1VKhTsFGw4i3kezoEQ7HO0g02DBBGic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kPoqBo9PkEIpeYKdsrGhqwwHJL5OMHsElMvH2vvivU8Pyj2PZxule376bxZnJkwNU
	 Tw4xgugwq5gkQtp+NSjclN5LiU5ACYNg9gzUYgdNSrYt9MaG2DcVzc3SiHiZF5PgIO
	 APJh8w0YsR3gnnjp1/aHvGZTGzYSQOQmHmslCy/r1TOaV6KjIfM7yebTrVOe+RwW+U
	 gfNk6ymVv2Nu9aN0lnO+ez0IB/c9ZybZQ/zbH/s7inMr9LkOPvgXOLUCrhAH6yxGiR
	 7WdcFxlxAPYxoSg7j4VJE6WNzvl2NGSRkJcFG3xgjSlL3/lPoEi9JpoU2XQkT0CApB
	 P1FJxdrOWdC2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1863CCAC5A7;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:26 +0200
Subject: [PATCH 01/10] ARM: mediatek: add board_dt_compat entry for the
 MT6582 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-1-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=726;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=rPW5X0dJhrkjRCNNcYv6faj1inNTS9fRmw61VUQKL+w=;
 b=sk3kgTpc2Yx2+z5wdsgMX0XRjqoO+k8vc8osDkRpQFyJa/JHqcBSNo/vrm8lBDnIOJq4DyTco
 DiaGwpso9ZNBl0PDGiYXz4Q63P8uiDz5rqVgpgW0C9YVonlimW/SX20
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add a compatible string for the MT6582 SoC.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/mach-mediatek/mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index 5c28124bd0078b31665fef647e496f4131b82c8d..fd3a8834fc4fd47adcc91c0d9371d4a1e9c0a7e6 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -39,6 +39,7 @@ static void __init mediatek_timer_init(void)
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt2701",
 	"mediatek,mt6572",
+	"mediatek,mt6582",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt7623",

-- 
2.49.0



