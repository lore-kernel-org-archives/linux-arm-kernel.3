Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2C3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=; b=LuXgwr1kb8XNwW
	uiX1N+HdEdVGKZ3dkkzBmoDn95LAIseNqlU2LZZgsd9S7QX/QFF/ejr3hzHo94OHKHJwsVxUOEeDM
	MSIydQJUYR1Xklilera1RFe6IGGNO9szNLHEnF13+Us+EurNpkYq7KKDmLS9SYDV8wDSIiqQSlzLN
	r+y9NPo9Ux5dTH+ynkIKWwRW8fLL6g/mWP4WnkGDvDqZY+Dxh/1Kj6HdbyoKBgrZeE/M6rB7EvG/f
	jicZMpDrI4UN/pu4nY48HyOb32Sj19yx0zCaZbOoBkjZB3dCDMpnXDBVSSVxl1bBGRPnjsHgsbqDr
	thOkQaUi43xip845HDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWQ-00000004DW1-4A6o;
	Wed, 27 May 2026 13:42:10 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEWO-00000004DUv-0xZQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:42:09 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso5086310eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889327; x=1780494127; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=QLHGrOxJfuLl5wmEGjlyqFTklnBT8W/X4zvlZD6F5/IJw1tqEFbsdnf0qkl5tsvWvK
         wcKeVTepXdHQWfGS6orisU1TyeWErwbvz/IS3FyhHqi/SQE19JBEpe4VXiYtJ90pAUCQ
         65BEJ0mmtU3SH1tnFLqqwbCwFCkqqP9iWfvriAC3I292t5+jSdIQY4VAmc92RZlvudDI
         aWEu9znKoWjwq+VmRHdw41nAdRDNVNClGlyYsaWID1TAqOJ9nBTHepd2qoHFKFGr1TbV
         /x+iDcOyfxXkDIsob7ZWyWZpbEXxfSqgvpp30DPme/SDfFU705wNOJsZTEXcvHlbxtB7
         z97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889327; x=1780494127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzyEKL9NR5CB1YGybIU9XChAPif6lvYie49X9D74OY=;
        b=N6nfXmVqHVZ9mXSbg6GYLfGtpq5+N3fjYdpRXXu7YSdDT4hnpYiXB7qWRuOwhU0Qsd
         4ddD03wfAjR6EMEg/qagq5gxUNPTD5oaWKyNvyDShDWJ3lXFuuGyrCnyrHAu4/UnK+/y
         xwFmFEAcd+tKO7vN/5j/RUajBi68d/JNGZaGYCDaQvdM/p6J9JfJ4zpo+kF+4uXpRdyC
         ZJKQc2LFx05mhYUiUMDCzaTWcBoCvUhxPyp6LL7tpTvRPkltgqQxwZkGdtl2+KbAEgrE
         8ammQfgvE74y83QYjPbGNhoGwMVZghuMPrQhILYd7iY0MA0Rd1LC/ba4M5deT5IA5CAP
         Hqzg==
X-Forwarded-Encrypted: i=1; AFNElJ+QrfL3lou2egcHZgcDXQ6orOox5gTGhDIbft6nkr9oi5RPDK0bMbEwrue7256GcCes76vxMP8Fy0pwsfvIAaKD@lists.infradead.org
X-Gm-Message-State: AOJu0YzPRj9Mb5gIjxPVpxhNNUZjseq7AYBHyFJ6S84G2B+K3QZGxz39
	mFWSpQLxtdWJd5PJHZHWNZEWSY1XWwGZsMJ3OcaF4V11eLlfC5xhp1g/
X-Gm-Gg: Acq92OG1V8YeC9j7qjESGYIwow8r7b5rOTfvGEor6Hzlga2gHFSFm0FTQp7E+0GsWs3
	iMBoocdZqSTio0hmhDdipMYUSysFydWPcW4gV1oENlZreWI2k63CgMd373tegrW7HlrL6G1stlj
	hKtlTr0lhLK9ZXCV1YD59ta1fwOgCEWeFUqZXWhsudUTMM2cA+eXBfaneyj7O2y94VAHQ03IhMx
	FCEfsumQvRULFZNklNgSp9VrAw3hethcnXjO7xX2ZuepoixfzpAlSFisFIqiPGBZS/TupMmvMK0
	wbeMQxJ3cSofUMiVXNWoKoiL5tgFTY85kS9o8IU+pOONhApH9Vy6ULy8LM5d0a4/u46Yvx8NjmG
	eBOEQn0TLch7HL4SNxX8SL3bTJoPM97sF3Du6NZgb+R9tKGfnJ7LND/AiMgTyQZP2R4zZbOHEkC
	ONMurs0VqMLzPUJwqgbo6GXpba5VH1DrbkgAPZKVnnJEh/guZB1W3z3cTHNzv2azsoU/9CgFfkl
	yu5AFGqZJrH
X-Received: by 2002:a05:7300:1489:b0:2dd:6937:79d1 with SMTP id 5a478bee46e88-304490c3717mr11002170eec.15.1779889326738;
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8183: Fix probe resource cleanup
Date: Wed, 27 May 2026 10:41:47 -0300
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQRKPBq0gX6XSiI5qETCtC6
 d2NunyL/1dQrsIK526Fyi9RyanB7DqgW0hXRpmawfb22DvrMGgmfM7e+D2WmkdGenBIS0GO0Xm
 y0+FkHLS+VI7y/r0vw9+6jHem+TuEbfsAiwD/V30AAAA=
X-Change-ID: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=2Q7+zlygQDiWGfxx9oKNM/G5wMI/KwIzH9dxAE1Eg+8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1Zej3nUwndl6QHG3JC4CezSWbm7z/btUjCI//CyX
 HrFjumLO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi/7cyMqxtUwvPNtl567XI
 6ta1Anf9/LUY8tZdY1tqY/5/vYzfxxOMDL3B1oeixFaZbl5TmlPlpepdl3T8//N1M6P8cmQf/Hz
 CwQEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_064208_306027_35D6CE5D 
X-CRM114-Status: UNSURE (   8.44  )
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

The MT8183 AFE probe has two cleanup gaps that match issues
recently fixed in newer MediaTek AFE drivers.

First, reserved memory assigned with of_reserved_mem_device_init()
is never released on driver removal or later probe failures.

Second, the probe-time runtime PM resume used before reinitializing
the regmap cache is unchecked, and a regmap_reinit_cache() failure
skips the temporary PM put.

Fix both issues with a devm reserved-memory release action and
checked runtime PM resume handling.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8183: Release reserved memory on cleanup
      ASoC: mediatek: mt8183: Check runtime resume during probe

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 8cd773d4f8235aaf0b04927b3c9d2d0326def09b
change-id: 20260525-asoc-mt8183-probe-cleanup-eff58c2d4715

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


