Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753CECCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=; b=3oJ3VAKbz4lgtLoAzpPzqw3I3G
	h6XfitmB+Xm8VSwohYZlkL3t2G/4/6+kjeGbJctE3+LAHSXKQPXJAEOsP3ZCXT1yqKWHCmTNb7rM/
	InPriUMybQTnYZSosya1EWkzQ/Q4wKTeH7XeXK2SobcLTiEgRSoPABRIT8oCUq5pLpkRy4AknO0Qu
	BjQp9ks/SEJXGBnRPPzSenzknEIerASDTzNLTgKqefQ6ak1bD4RyxBPZze7DItXP8NYBdSya61fYr
	tugZ6Wip8nMdP3euWlzFZK77VOVc+J7V98Z85LmtYiJqNJczjDGhVCvrp31Y7HqzEEeXQCI1VfoBu
	r3UYNLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzw-00000002RQ2-3cbg;
	Fri, 16 Oct 2026 09:13:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzs-00000002RLL-10JZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 09:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=; b=JSWCrhVGTJKu5l/FJrInso1v60
	DjhZxcTapWMJ2iAEDbjn/IQ1uOPp6IR+qr1mRXJ4MYZENkxo9/JqOZWjZbe0Z4YZ/tQA5Z4domMUc
	gpLBWIDxa779d5vGCk/uxP1F9jIVKLe1y4xwtM31qLlkk+yLSotde8c6mojEP5cnpr4rhtMJyDGZ9
	j9ObtnZvfDvtU8acYHjSaW8klydBvHZjc75upiRCGSc8Kka0Rj3JnrbhYKEqAJMYPEzazepixPrfY
	Oju2wN17kmNewnCcjka+wUu/mBf5Aae1qjX8gM90FDukpnIwmDycm9n2Cic/iqM7yB8vbuUXJ2Mnt
	yCxaE+dg==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdzo-00000001J2Y-20oA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso2537808a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141978; x=1792746778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=eCmkCRhPNCB424jvEWUTaZyWfk0mFNVx/o4YlpKOUeX2iTuIc8yNB63hV/nsT0Z4jO
         +UK3aIjHUbxrqcrmBDxRqZqGyIidJYN66jqmCHz7WyGwXhQDhatOhjFtMfemk6YyAmMS
         ywrIYVgJ1qbJSuMI97p7guPSmUQD1gsYvFtQPC898OcBaw2kfgMuCutBTUaoTNLcb0Vn
         edS9SivOLXS1Y6F56BRRTI+8plnKIfb961CCzgnLmu3CUnwV3RudGbMs1+unYeDknvxw
         a6GlhX2dctfLKrTwFCJhls+/ysNLwzU2yGkzmuFnc2z4aZxPSspyLFuYJGfJ4pDcI3Wn
         Fwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141978; x=1792746778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=b66pcMFVd4tVXGA8XZTsYPsq+ZbMsbhewKaWJhRfaORfGNMo/lngttzrJA2jo7UVFu
         5szlsYUmAeYjDM36VoXmXpgV6jSqbh05cpUy6NLeq/A6TqBTf9VkcVLrJEpZiI2cvF/7
         y55MYw2Oj3YSgmCjNhsnaC4bWpNHs6x/bPiFv/JL6Uw5CBtSbDC2xZVN7bHBDO017cP6
         sQXGGPLo0wFrkIvTC9EMbvRuMq/6duJ0YdqVR1LbjmUgpNnpN9oZUn+2Nmpstul+ZVQC
         B093woS8Pw2E1vQ1EGb9OzJIMQ0H5P2NENdXxtjq0oVKUqlDx+D0gNXaP4a1QlJBla9u
         Ju5g==
X-Forwarded-Encrypted: i=1; AKwUvByYIIuu5fIN+o8ApAZZRXkllIXmpSDb9ZCOOdf7hF/fusCd1dDoOUGaxOJ/NRBlLMRElE1Z6+OZ5u1zGt7EmyT1@lists.infradead.org
X-Gm-Message-State: AFq9FYIztsLIg0bHOkpLWve7E13DpuyJr1tnN5rugDJ/+smwLPLjmzD9
	Duv8jZN0fq2qD8kj7sh4wz09hXWQqpqcmUeVZZigdf8GNaXl0j1JnOnB
X-Gm-Gg: AYBFou0B5a+LgRXY6XRsrR40yUvdg3fUl9Fk2nrcx72rQgPlJLmSpa3iOwUP1HqEvTp
	ZD3Iq7IRJ0ZOROLJ7U2/VFzGiBhnUwR2bJbC5XG0bFZ3uGBSJT5AT3BouLgXitRzFBsuJ8I+w6l
	6WE9AP/wJoAum7BBaXq6tzYC8kn2ag42Gfsyw4WoCbs48sYFdq/Ji6FXRKLorXu0VMa+or/ba+P
	JrkY8mvmfZCc1gIwyYuHFjBmGi0a5SfLY7AaktpUbKKe2/aGVWzxdkHmN0Kic4EreKXlHDVOih4
	XEStoqddU+MXy/KELy3xF6+XjH7ONiIMKaMqYt0qTHpodcqBynP9MRSwonPt7QuanUYFpxYZYYE
	2oszBpqKARIbCK6KPlyPia1Mqz1I8fvsMI5pUq8tyRz7Yey4kjwpFJs+5bu1VKEoXan6cr3uYeC
	MVi9zgmTObEw4wfkojJAdFMEqF6y2rfzdtE8wu1+S7wtUXjO0kcxQEKwI8T/QrX32NUvoNzv0PO
	t6l6KAPFzCxwUk8ZMsKlLdhc004NZ/Th7Pd2R0VgZbnZVX2eID+jLe1D1Q/
X-Received: by 2002:a17:90b:4ac2:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3acadce670bmr3331774a91.14.1792141978314;
        Fri, 16 Oct 2026 02:12:58 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:33 +0800
Subject: [PATCH net v5 1/5] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-1-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=1202;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=3VzB1FLCd2mLzCjg7kaS/GAexp/k2KRl3VSTok/MVlE=;
 b=5XzbtZKpJ+yde/h6N2QHggLRyxZpPRxz/vp+RwYavuMpb/33Vc1ZKXfd0XtsE81ayaRaOHReS
 YZ2HLm9vrG6D+qpPZXfGoeFt2VcsBtBboe9mx3MoHFVkvVsdGMvmXBw
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101300_796623_6C176A13 
X-CRM114-Status: GOOD (  13.34  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {

-- 
2.47.3


