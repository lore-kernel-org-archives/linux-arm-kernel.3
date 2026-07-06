Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=; b=B0TD3f8UxvXO9xJXCQQgxOhfLQ
	OL+RqNQ3+l095fazO+0DGqV8tAHyJLSW5NIJICuaSYy26pNjIaP5NLsTO3FHd0hrMcwfmxwHvdr2J
	UnZi8j3hakKUJyhaPb1FrmYv7es3bN/U9m53rbtU4zHa1KTTehHpuiICWs2hqHwZjyYAQj0ysffyC
	aEwY+m7OC7WpoKxq1XPOthdknEAt/u5dUN8SLWVpjSEA7sSZ8apIeT50h9qmmiaVeg/P40lIAdUaf
	KcrKJ44I8mLjmahmmEexRStZpsA9lsXLHZtXSJgtII2tjTvoKCIRqExE67cG15zjVriLoxq+zGfUe
	rvBmf7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgskN-0000000DnRj-2fjP;
	Mon, 06 Jul 2026 23:29:07 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgskK-0000000DnQt-3KaK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 23:29:06 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so26608296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783380543; x=1783985343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=;
        b=jGUA/qzsWQUYhXfHBoJSAs8MD+xWujQLDaEnpL4wO69Inu0V8wF+V8v/6Sefx7vdK7
         7AFA7lCUiUpf0Z628EEFlLeMOATxjXxrY5F0hIUCGTzVhqVYH5P1DKnk29lQasbBCSOH
         OFzertDGWkY0bAwXHL+8L+ZbnKslB2AzwztSRYGq3cGnZKTB6ze3vzpCZE60/jYtoixo
         6wZoAxiM8AeL8Jmi+Qi6Y5q0/DQL77A0/M/cIrg/A28BsB8gvOav101IqMErhRMcoPB8
         Lo/4NggTMToQi3Bm+5MU127Gxcy9y9sl7CUNnf6vczRGvHyL3D4cem0SWbd3uhsMEBMz
         wcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783380543; x=1783985343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcBgjqeSOfuptOO3Y+Jfj7CL+AEDlaiqctCql/yUeXE=;
        b=Ipj9vJo73bSFLSX108qVGw2/wZ9oI5iPs5EQBf/wzOjof0bDFrKatE5ZbQ/9ps+9wm
         WTpta52iT6FX2q6/vZtxAoGiCWoZec8lFK1atctNWDI+E2IP0ytZVNKPPpEVtFDGyHeZ
         IUScjHm8+2d5oEZV7NVoqRAmuDg0t1oniziQPnGQ/k9iCgWpSCtlH9AUyL4uiypSQV6v
         F+sXLEAKZ6W4mLGZiyxR7v7rkn5Zubyh910xqX21flwmH9X97WnEtUr2bJ76VqHfv5Uo
         G3mTvwlHYmIVSZ83CHIdriSLH2k9cYh7ogCGwIq3azu51tkcFuIAyqLiIULd5oglWU2U
         BsEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpg2i+Qqf8YmM4jplYvS9xge3UN/dSzrljcXJoWc1US5pZyWlkr2mYu9A3n4vJRcipAyKEY9rcDEiNO9aRHCs9n@lists.infradead.org
X-Gm-Message-State: AOJu0YytcOXiq7rAdajtq2m/XWfunUQRb9YRhNI6CUm6B2u3Wk9XDA8M
	jhWGpN5oqPu2sn0yoFKf7KrDq/z1Nj/hCEOFeMpZROsaDjtYHB+5NyLg
X-Gm-Gg: AfdE7cmTCADjn10a9+i/+P+0TgK6JeKP9OP4zct2N0X0hBncbZBy3N3unJhSTkkwxpE
	ZAxD4PPOD3c7oJKre07dtXtKCSEIeNEKhbsFl96UTMXIBrPDjj67y5YUcJ3maSLOcKKPXdh5QO8
	FFe+Krk6XW+3u4D5kdn3MuvhDzvkqwiW0ZrvAOZwaXTmlEMK+i4MGv/cELs3OXcC45j7Ajv828S
	wDuKcIZHWOgu69h8n07E+v4lyrdu12I6EnPv0k0GkWRzIeG1swhj1WjsX/xurCeEtL8MolCcx/f
	VwIlb1HIaCdMmqoa0YC7m1YIOrNgvS7GPkXkRnW+t0+vQgcQEMSR4ZWTLL88T5GzGVEETv0ElQJ
	18r/jSEOFraDh60Ry36AeGrl5LgaWr64kH4k529U58C6vptHzb5sUlALb8/ghQiU+ILgM0LLY/J
	jIvP42Al0mlPNs99NjRUZUV/ODw02qTKMsZwdE5kGSScoX2e1JQz/5iHATiav5KKZdQywpCcyOR
	DG/k3IQ9uP2cLU6Pl4P
X-Received: by 2002:a05:6214:5701:b0:8f0:11df:c80d with SMTP id 6a1803df08f44-8fcb56c8c27mr39823556d6.42.1783380542597;
        Mon, 06 Jul 2026 16:29:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de83f8sm148902706d6.33.2026.07.06.16.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:29:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless] wifi: mt76: fix MAC address for non OF pcie cards
Date: Mon,  6 Jul 2026 16:28:57 -0700
Message-ID: <20260706232857.807044-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_162904_841012_6D0A48F1 
X-CRM114-Status: GOOD (  12.42  )
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

If seems the check for err is wrong as the proper macaddr gets written
to from the EEPROM itself. Meaning checking err from of_get_mac_address is
wrong as the proper macaddr has been written by this point.

Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
Closes:
https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
Tested-by: Klara Modin <klarasmodin@gmail.com>
---
 v2: add extra tags and target wireless
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index b99d7452800f..afdb73661866 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (err) {
+	if (!is_valid_ether_addr(phy->macaddr)) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.55.0


