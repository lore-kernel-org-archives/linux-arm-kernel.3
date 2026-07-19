Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402DC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=; b=y8o3G36hxNE9zdQbAo5Bf/5Cq5
	I34ZxFibivs4sVl5zmpfl0phwaehGjI6uCdZJll/+kxbAXLcKq8Xe0BaPTFwyYPne+ETZ1XKBKpTv
	Vdu1PswvdVW+LyGCrf34Pl2Pb+oWS0pFtJkq01aejGi1PKe+BbgBu5UmQK/ury5vKUmBM4KKVtuoe
	DYLn79h43t7z0T0MTTNEqLA2BCAsUAtwbLrAkfmP7Jpn3RFfyb+LLaCYg7lZzN/ET2cRGP25ZO7KU
	7qygvQ9h3CvizZxGth5DTbnA7WuQ3VIGVDyTCHtjMz8315d656L4GCAb/UtcrZ5+y71BsLyzZO6SK
	OFeavpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMqL-00000004qg9-0bKO;
	Sun, 19 Jul 2026 08:25:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMqI-00000004qf2-3Y6O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 08:25:47 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso9207366a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784449545; x=1785054345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=;
        b=daQW/PwyFlPZPtMQYVnzzqE/lS0OEzDzJGFGjjM1xFDteRJkyphdjl0y+LPwkxf921
         7e5O3r8r2vak0gSAnURZ1CO44b2HSRbHG/PR1MGpXuDCr2ej8CZPf2AybjW3Fa0i6Xvt
         BRvRdAgvnw6sDeF0sqioDnREOkL/mD2PRzv9v+MLy3FWnHuoqDY7ubL2s/EV4pYGoHID
         EW6X4VcG/C3y+rfblqRDsUb2g/fpdt4/ve0MxlfPB8haNF9UnKqWlFzArv2vl/CGVyBp
         a/ojFul1sXQsWOYELC3/A7dnz2OhuSqNqjSfJNxrF0TOhK48yPAyzE00r/hF0kfM69Fs
         3qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784449545; x=1785054345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxtd5Q/pDjtbfL0tvsekDL5RGMidpEpCQZcAeYntQgM=;
        b=JuL2mOCB0yG5wv2xy/IKYgdJbWWBseiTFOfrHZPE1YVcEehLOHoz/sfc7Kgzn9OYbH
         bDBJZAYMjKssSY8uV8+GjIy1b8EvdjxFIbtbZjzKMelKBGp/odC/zWwLuCwpux626e8o
         rqkBZ7MwqjyS0xXfT5puwaAbj/TTRRm86lJ0mb6h9yFBrqEvUpokS0VnJxanZOPmDGrM
         RNaxmvgfa0DtoHBwlnl2DI/o9MyYT2deg4W83OEkjhk0PpU7bgA1jHQpR68G2kCol/h4
         WaMsKoIghxmI2sBDnt17qDlcn0vH91+X1L4K/wvl4F30bxExPNAPnXrKu9bpzFqgxTXB
         mFNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpfdb/7GOIfFEpjSXSOwj1U3I2WvjT/fc6dL8iFVctxScUrUMviiKGM5PQXYIyJpGcur+OcCn7qph5MLNYw5FLO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/8ysMrNoaBMPMAkrkyJXK9WZySVmK9cb9nIredQiJIiZGzccP
	X0NM2DmeBm2QlJKfC1RtgnfsXD/A4X/OOQqnuSA2/w5EptLcbx5SVWbB
X-Gm-Gg: AfdE7clPYlZb+EnDHyR/XLeXmE4u2pok/4lqJZn6atfHM78HoYRXAgFGhYdGAqO65Ia
	PbMVFyrGCVq+VT2wTCs8xSskhsLdOuW3dWZm6pGeA3j4EFRp3Z5tb294+PB8N8uUiIR5b7soXBl
	D017NqGDvleoUChZfZMJDaOkPuiRlqbm2SGVixQ0SpYR2x4gQQgYXvyPH4DRJkNgW6rcGntOIrq
	x3f8t4Tnjm2iP/30Za3L9Gonv9MLeAVs+6CUFir/VIzQBBuuo3XJ9o73X3UcpU4kMjJr4Jd5NiL
	EtvS9CzmXvEusW57mbZNZJ4VV2S9EmvSjdT9LPJx5DvKxFeYyydIn1OEL9et/DHid2SrCkvkncW
	OZ5n2V8/6jormiwdeWAOjpXBCo8N/5wAnaZP4d3ClQfoYjwV0Mytz5JHa2rQ3mGrixttM+pJZFH
	pak56G0bDziw==
X-Received: by 2002:a17:90b:1d10:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-38e659bf4d8mr2833691a91.0.1784449545591;
        Sun, 19 Jul 2026 01:25:45 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e340esm19585964c88.5.2026.07.19.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 01:25:45 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH mt76] wifi: mt76: mt7603: add 0x7592 EEPROM chip ID
Date: Sun, 19 Jul 2026 12:25:30 +0400
Message-Id: <20260719082530.3879831-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_012546_893498_F00D1A1E 
X-CRM114-Status: UNSURE (   9.64  )
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

Some EcoNet based routers ship an on-flash EEPROM whose chip-id is
0x7592 instead of the expected 0x7603. The device probes as PCI
14c3:7603 and the hardware MT_HW_CHIPID register reports 0x7603,
independent of the EEPROM value.

This is seen across multiple EcoNet EN751221 and EN7528 based devices
(for example the Genexis Platinum 4410).

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
index b89db2db6573..05f7aaefaf89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c
@@ -142,6 +142,7 @@ static int mt7603_check_eeprom(struct mt76_dev *dev)
 	case 0x7628:
 	case 0x7603:
 	case 0x7600:
+	case 0x7592:
 		return 0;
 	default:
 		return -EINVAL;

base-commit: 50a7f9f9d48eb50c0e95bef53358acb5af5cb3c6
-- 
2.34.1


