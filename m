Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D90CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=; b=ZkFESn34o6/N8jwilcnvQWrYqc
	VRHu0Wt4bkEkQgommVZpfFcb+GHwuHYwUj6jeSI0JLAxW5DCuB0AB8RY4Gfj1hiWAopGz0hoavFhO
	wXuH3LChYNTzEvF7+3SNLqukX8JiMW4tdQSZEJQkjbGQDfYTJ4wCE5wes192LDF1cuL+jIcgUZGty
	BhOLpU2GsLyulcyWOzAhBdWMeMNH2DVvrQmfoSmte3vJrvrjKPIchhjdxOQYccToboLVZOoXrMisC
	6f7BXtGv7ik40QOujPclzcJ7B/FXQkEqjdH9ZsIa7atm1gX05nEMicxELOrV5D1Se9wKJ1do1NQRf
	vH3nSyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZWE-00000008FJt-2sod;
	Sat, 10 Oct 2026 16:01:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZWB-00000008FIy-066z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 16:01:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afbd2c386so310697f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648109; x=1792252909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=d9IgRiUDRUGPh7LzVkPwQ1+t+/cobr+mLCrM+AfD4pnXNdIuhzDHHauBYaylTJK6Sw
         0qw5cBRigt2m8H0GG2HQg3zF1PmTeK6GPjPOrLMDJx1g6y+ZWwiVoFuxOcNW64h+zJP/
         VT0Cyq3etb748AvG41uNO8hkN5H44U1Mo6EQJc+k7ejfmxuifGyHpGruefzJ4gwvi6IL
         xZzIRdOqU766/jdF88B44YBvEjaM2RcdgySP8x8V0sgWpw65XbrmiWiC6e9QrwNIFTv5
         T2JaXUEmpQP7C6zI7zrw+lZpXJ7/nYpxO+PN91bSCrE0bEqOqJGckTAaPpilAhsZBqFu
         ge1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648109; x=1792252909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=mZtzkqWfFpxUn33mDPbk5mjJlDo2WrnhVIZuguHbw2UKvbGgNCkdZeDUp1yCOBii5x
         zr1PdmCZ/JfIUQyUH4pUYVaqMEObLvi4H5G0fMAugD0QjKWmtc6KiP9t37WuiMKpg9Bc
         6uRQseoooQuKWn/M/9xc/ZvC/E99stS0JI+gAZiRxcLvLaXh1xSitEWefgwivrNTb7Y2
         hY+nUmw6Lebsvzg9pr1KtKOwfM8px6oQgiZOgEGrBRo5SSkiNY1OcRoFNhv23iVSrnj0
         D8DjBo5UQRNJk9hgiP5LBfi2Ro4cEHsaB3Vz5mW4Gea0hwI2N7TLw7stjHqYD6BcnTuR
         SVQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8tU6RhDHr1Lc/m6CuM4O8CDHeZVYIu3lrK/8JNwxkYrcZWNx7pHLoVGCE9ztlE0OgErUgRE2/EboweDlqthOa@lists.infradead.org
X-Gm-Message-State: AFq9FYIHps/sdAJafLo7aAp7VekncdpFtYxNBMifUBncsk2HLu3bzVju
	BDn9lX/R2r2h45TusinOYPp7T1HDvpRBpkDjVrJyTEQnATsDoRA45Y5Q
X-Gm-Gg: AYBFou1sMb2B2z1IbWngWeEGOekjsqzO9xpbOFclm6ybu7raTvn6kRorSc+yXHIQREX
	prlO4hme13LjeU1E5vFDfhr8aH8YeT2vhggfQR4iX6Wiz37dtZP/jEhyBFa1OBXQzjMBw/IBIOt
	ORwEPULtZoe8B4xjX7Lf/ZHqOH0+QW0flT6TlBYPaQ47xYe8xa0sIaXGBccSsJxe4hlZXNGk0/2
	MwOAX/S0D6uJSwGoHXOV99rbExKzGeJrAtv60GLaVpnBPKjxqx+lmd7gC1950S7XhB/wMEr0Zic
	CaZxQpbF8v0ChdwsZhbBFRmvY+bSeROmKoOxRRcH1GJtnWe1IMfGQzviR8agi543vhv/77aRwx7
	xshHCDtswPEQUW3Zhnup73F49LBPAO1PrGgkdtKDaudiNaKOk6hAFi5GpT5fkM9SvXVZ0jULZoJ
	s7ZZn0P7vgJyrFQVmy5xwl1Lzud3ku9EI7XjeI5sFA/7ZVnirlb62aTcPiDwbezDYh+g==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr10490477f8f.10.1791648108898;
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm8579603f8f.41.2026.10.10.09.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe
Date: Sat, 10 Oct 2026 18:01:30 +0200
Message-ID: <20261010160134.112136-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_090151_068173_410AEBCA 
X-CRM114-Status: GOOD (  12.77  )
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

The remove function for mt8173-apmixedsys needs drvdata to correctly
unregister apmixedsys clocks, but the probe function never calls
platform_set_drvdata. Add the missing call to platform_set_drvdata on
probe success.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This issue was identified by Sashiko while I was working on the mt8167
apmixedsys, but it is present on the current mt8173 driver too.

 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
-- 
2.43.0


