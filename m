Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26955EE644A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=; b=MRjzqzhpz5G+Y3eGF1CZ8f0VRv
	Fq0CzSnhc+pcFJ3klIu2Pvl5pK0OJSN8mMcSJ4wRQ88PvpYgGB6qIGEtlTtxuS6ei7BBMVPZ2LODX
	0SrtbSildEhKUyC7L+wuVQobVY6GQMwf9de43bsvHznV8+wzduYvHbgdhlzgvf4DjKAfVlV1DzI4H
	AzectJAgyIj8fKnnAgqpBl+uTduigkur5lhf87aDuZCnEIV7ioEcrZnLTJC/qW5c6BG8C4lOBP+kM
	BcOPNo6h/B36wmg/ezayva7u8E8bLvmh1Kpnu09WvviqAK1tyI1hNU4eCRkp1YRdy3GfucltTikYR
	msUScHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5to-00000006QuP-1KoK;
	Wed, 31 Dec 2025 23:46:40 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5tl-00000006Qtd-0BiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 23:46:38 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7c6d13986f8so9290435a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 15:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767224795; x=1767829595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=;
        b=CtpRkS4TL0jP6s7QfG5dkyGSqB0tGs5Tb5VM7tLh89uACzH/CPN5dlYkigciMUvi5j
         27lGvG88D1oc/n1qQ2OHkzJd4I5Wc+UGE+5RIUjI4LtLRWeEP+ABO3R7yTkK6vk9JVjl
         6Q8BtG2F994Bj7ns6aC3UwD7bUFaRk76+Yblo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224795; x=1767829595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=;
        b=oYU2P00BHe7X3ZivnE4I3IsN63frQ+mLSeSlj2iUteck560BPJvpXeRUIH76p4GkjD
         i3WOZ4mKYK55WiO7TGB7dghPbPwDGMP3As7ExhWcjvMO8PoDaHtF3WcAbuEhjDb4cEjs
         RPdTaufnY05V/Vgp2/3MxK2Pn2w0vdRRJoVUcAbdSRc9083rcs34Jgdgauci+7itj9ay
         YtUmOp5D9jh6kBmgaMLkEQlyNpYzUAR8LhEqAHFK3zI2DDL5U/cBaNvbRxy+cKTQ0UMN
         L6DGDyw12Kjh/AATlnvAB6L6Qe+ftRgkvAQvP4z/uW6KcFSgA4iONN31VCySl8VLjJUQ
         65Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVfjVSVYWS8ae/HAnQoHAZLdMrfQR7HF4A9FHZLyY/imeSbm6TQEd+zXwo1vXizYlmvYZajar4gOUvex0SNfhGF@lists.infradead.org
X-Gm-Message-State: AOJu0YwZe9LfAYNWO8ZFN8ftOkMCYk92n6a2+BuNwlIrUqnYNWkQjZO5
	UmndUyEPvuB5v2qWNbLbKPShv+tO2l6xiEEHohHWTwj4usHBOa1MDNxHgWTKvazqguE=
X-Gm-Gg: AY/fxX50t0iV28IjKyaBF3DPQ21/ZLR3zf5rE7Uw7kikJFG1fHEyeTGzPtGdpHPy2+D
	qPeIqNuGensKZo1Hq/EngBFFq4VZZqwMFBNs8D2RR2Tfz+uXd8KoLaFI9bp0Hmuwz2QwGoXIqxZ
	FlKAGIOvJYeRytkqRJG3hfPgbk3Jx+tDjFsruBnS3IO8jeeztcd25K4XGE3GIprO84sLe0JmzbV
	WHkmspsq2A/SvoBC3pfuoyzU9HICiyJykPS/5j/7DOodwVgIP4WEEm+9mFrcRf88Tf5cFOng9BA
	WYTgsmzMV7Qhm0O8FQ1nbKZXDg6CdydqfFt8ntPjpAPIpxVtYZBx3wEpoNOQZxqCa5qwVl3IOgC
	lJkraGvWTNYNd9jwc6ki0jDz+uvOJtJHYcAl1mkR5B69q0YQ8xOAYnYg7bt9fHcaJbXbBFm2Flx
	arzfwIiUvnZwX1dT0wZbF5ln7nYF4TFLaBKRNi
X-Google-Smtp-Source: AGHT+IFV2BaGqD0BAddR/5VHavfl8Mnol7saz3Bsj0Em4upn6uAvpba1yOclRSKtiPCjPQk30vcWYg==
X-Received: by 2002:a05:6830:2e06:b0:7c7:64f3:690a with SMTP id 46e09a7af769-7cc65eb8a4emr20258833a34.18.1767224795618;
        Wed, 31 Dec 2025 15:46:35 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ec367sm25187288a34.23.2025.12.31.15.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:46:35 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	torvalds@linux-foundation.org,
	johannes@sipsolutions.net,
	ebiggers@kernel.org,
	matthew.schwartz@linux.dev,
	linux@weissschuh.net
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mario Limonciello <superm1@gmail.com>
Subject: [PATCH] wifi: mt76: Remove blank line after mt792x firmware version dmesg
Date: Wed, 31 Dec 2025 16:46:26 -0700
Message-ID: <20251231234627.11867-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_154637_492193_221CEE94 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

An extra blank line gets printed after printing firmware version
because the build date is null terminated. Remove the "\n" from
dev_info() calls to print firmware version and build date to fix
the problem.

Reported-by: Mario Limonciello <superm1@gmail.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Note: adding discussion threads about revert and simpler fix
for this. Mario sent me email offline about being away for
bit. Sending the patch since I have it ready before I disappear
for New Years.

Relevant threads:
- Revert for f804a5895ebad2b2d4fb8a3688d2115926e993d5
  https://lore.kernel.org/all/20251231035645.5545-1-skhan@linuxfoundation.org/

  This patch depends on revert patch.
- Discussion abour reverting:
  https://lore.kernel.org/all/d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org/
- Proposed fix for reverted commit
  https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/

 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fba7025ffd3f..0457712286d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3019,7 +3019,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-	dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n",
+	dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s",
 		 hdr->fw_ver, hdr->build_date);
 
 	ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, false);
@@ -3048,7 +3048,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-	dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n",
+	dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s",
 		 hdr->fw_ver, hdr->build_date);
 
 	ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, true);
@@ -3124,7 +3124,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)fw->data;
-	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
+	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s",
 		 be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
 
 	for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
-- 
2.51.0


