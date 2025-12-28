Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299D1E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zklBFMW/AlGQ/7gdXMtLcdA06o9WVsBmCI5Z77APoaM=; b=agmo79/LvLYyz8CZmanSSs2xia
	LYZyul0p8jQ1F0w6kv9QIVjIfzDzH8mzLQ0mER6vSVha/c2kAPV6dy1mIGF2did7Vr3TmaAmdrNA1
	aM4Bi3IA1LVSmNDfFQAWVzjlJMGIPqf8HcOXjQJtrzWoao7iGIkXO4xwJLw/xfYzUWBXzqts2yt/i
	7FAZDEhGKd3FNKiJoJz4sli1HfGSTjIJGkdVCrWo7A19ivVT1XqDhGM1ARk29t+sUJkm73lZefk1I
	dDQbRSTva3Y2l//iqgAqCLZ7p7K4ABPx5rN/xYVsHNwaGJxq7BpsetkXKNIWd3cDOwGXFCzB6hQmY
	rT9vFL7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtNH-00000002sK9-38ah;
	Sun, 28 Dec 2025 16:12:07 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtNE-00000002sJb-4BvD;
	Sun, 28 Dec 2025 16:12:06 +0000
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=gCF3cvYL;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BSGBMPV1236900
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 28 Dec 2025 16:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1766938282; bh=zklBFMW/AlGQ/7gdXMtLcdA06o9WVsBmCI5Z77APoaM=;
	h=From:To:Cc:Subject:Date:Message-ID:From;
	b=gCF3cvYLlZfaTpwgc6ugGCBR9PBLxCofl1X3NDOpJ77E+Sa9rX9cnkjpAxI00T+a2
	 YYs3/ztt+rsIZI69L5ijJU9BQswfjLkImc2ZrvkLNwnkrrDFlqnRjuA1Lc+IfTZIjf
	 O6nwyX/eir4iIoHXVCN4NKr9dML62/UwQ8fsj5u4=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BSGBMRh2208669
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 28 Dec 2025 17:11:22 +0100
Received: (nullmailer pid 1424925 invoked by uid 1000);
	Sun, 28 Dec 2025 16:11:22 -0000
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: Felix Fietkau <nbd@nbd.name>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] mt7996: trust eeprom data from nvmem for now
Date: Sun, 28 Dec 2025 17:11:06 +0100
Message-ID: <20251228161106.1424861-1-bjorn@mork.no>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_081205_348479_5B1C062B 
X-CRM114-Status: GOOD (  11.02  )
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

The iFEM/eFEM classification does not currently support some of the ADIE
combinations in use by vendors. Trust nvmem provided data instead of
falling back to wrong defaults.

Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 mt7996/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mt7996/eeprom.c b/mt7996/eeprom.c
index 8f60772913b4..3e7670a60fea 100644
--- a/mt7996/eeprom.c
+++ b/mt7996/eeprom.c
@@ -172,7 +172,7 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
 
 	if (ret && !mt7996_check_eeprom(dev)) {
 		dev->flash_mode = true;
-		goto out;
+		return 0;
 	}
 
 	if (!dev->flash_mode) {
-- 
2.47.3


