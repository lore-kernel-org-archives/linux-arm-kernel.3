Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA8C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=; b=gS1F0xQPI7y2zvsgQZLKFdl6K/
	3+1t1bZDIDjBZjIzYArRfFArJ2UGa0iDZteYeaWviKttFU76qcSYX1uQ/ZmUrALGJuLY+Yj2Lt931
	+zaSmubrH0Z3KGXjV2YdhxncA9dqximshK7ExEWhA8ndaoAUyc4E/uk4KvC/hmYg8a1bpC5wcm3yn
	tc66am7VHp5cNL5kDG5Aw5QY6TejV/A1zsy6Y9YLic0+Rqb/vxTJN9L3XgPHeN+FOs0bKermB9ZUY
	2yNTRMi+zVeaXqcXqU/bqeYy6LgmXP+2TtrfBVk5ZKAS0Ql1joRAzzbMXvnk+PgG2iU4wxJfkYXRf
	t02ZreEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ7-00000000aGq-20d5;
	Sat, 12 Sep 2026 06:41:03 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ5-00000000aDr-02J5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 06:41:02 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-8049bae1780so510851a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195260; x=1789800060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=hIrteSE9PTAE6Uy6/mTvGn8pSsj6kLGykLVHAK3hExIYmEiPYV4p8N8cYDRlI8tpXg
         zhbwi5E3VnSPQ4eZvwnkqb8NqETmS4+N09Kuu1o0Ltw7Bh0pQFqc1s1Vhuho3EBLF+FK
         gCD8yRaAIUKAgOW0Pi6To6/w2FPFQMwhgX/YXnSBxNhA9OTNv9dZp0crwmsl/0bNbbRe
         JbXMoZpuaVfELlgJPim0impkWiAzXWLbnimcPkRLcN3kn/bJ7L5owR4lqJovVLp+MCtV
         US6ha/c04cQMWOAjbs+omtLC63pKq33dx6395PQO/SFeAvxzeQvBiAzpsu6Pv2KQbSkv
         EfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195260; x=1789800060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=VAH0Ix6oBxFMq76h8dW76c/4oFSykXhaF6dZ+QPpHgxkzVV5ab1KvwZwRCG1+5O6fa
         7ZtDx2FMg6zqZEW8PiTizbMl/q/pccebGTa/6iVat4+DXytZ3cwf12oM4ehyj8VAXN30
         hNI9n2w4cOPcMQHYYzQUnDYrTK/8yO7TCk5mKf0/ki3A9kfceASu/JDfxtsHh+Agq9Cm
         70QEFuWHDM/XJ+LTii6Pn38qm8EkQXJ8SH/pDiUC70H8axcKm3A7vMUc8qiuQsP4JbOs
         3Ww+sAgkx2iyEFB/ZDR7VrS5ETNK0FOHHCDKxL2cCsrKSixSf2yyVhUmw3qRajBE+F5C
         FfJw==
X-Forwarded-Encrypted: i=1; AKwUvBwGNqJc2TVsAHkthZ7iGc1Ay+ONykXAu8RQyKWhGOYM/3witCngVyxYu7oG5r5mIb8fHggV5M8zouKUuUxCE78q@lists.infradead.org
X-Gm-Message-State: AFuF++nmTHePTL/kopbqYL7LmHVl/+D0yehYbTBJwf8tS+1FWBi84wO6
	NzzjJY1kzdz5PKQ8ap6T6asAWH8DO08mTdV4CvINYz1soeGWCGQGaU3M
X-Gm-Gg: AYBFou0S2bTTlqFJ/xvawFMJjat3p16UHLI6TmYvy3D8kA4/tBRUdCE85hTc2Qej9q/
	eFJvm+oiIf0q5vJv0HlOGYB5wsI3WxabPAUmD6EtR8+pToM9qsGIVjP1FNARkBo+NEcCS9Aih2H
	GikJe8po2FhVVU83s2e25XrWPTeSIEx9E+hJuVzehj7NwbgbkAMntfgaJ4Etox2jBU1uQ1+kQBz
	K4TPgk9I0jL18HL0v1aMRiBMumJGn3h1XmUpRWogCbSh7NxOHeVLngrFFty0csA2s0RNI7mbm5o
	LET5xfJN5ghMZSK2uka8M1CvjElrvOAabltYMyi9Jnqm9Vmg5V+XYhsNliritEQwagUwhQLT1rM
	zt8sT3NfmXPSF2Pb79MgeeqdiV7evtkoFLFi7i7C9LuzYZZmF4hXKDq/1wvdUSausMguLRoq3qP
	4+T5Lt2TtMGJw9nCNb56in6ct7iv8XbEe4BiNZ6qCFBymVZIItOWolMUwj0ua7+ueiRjw=
X-Received: by 2002:a05:6830:aca:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-803fec021afmr5824842a34.3.1789195260056;
        Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:58 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:38 -0500
Subject: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1440;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Ql7C35Wo0Afw/TL/lX4BfvZeI5ogoZo8Mi0/Jvy5M00=;
 b=5WZnSsxv7VZ//QziiPqa/hfbDelv6xL9htaBXcHAb3pfvm74cL65FXg1wRmpJjS+un+7XrxzR
 0b1Eg+HGMxLDS2ChLkM0XQoGJWSx9crrUYJwUWFswZOuImDIHOPypUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234101_065577_4618B7F0 
X-CRM114-Status: GOOD (  13.93  )
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

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0


