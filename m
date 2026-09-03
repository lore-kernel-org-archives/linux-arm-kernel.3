Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3513C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=; b=hRiW3xdPGYEWnpjHITHiON1fDG
	jGTVy9KwPyU1OM9dWxztzvF9yhZdkbEw/zge4Dy6BJBgSRsXWIn26N7WVx0MtKDE0BfApKNng53yI
	VrLLhPPhH/dAPFupmvXOaw7DG7i+/aJU7jfHW/ey6G/+XsWWNak1Tke1oAEWtz0tO8nvvvxdfm2eX
	mM1l4nxDAd1QLwdF7G5Gm2A/oS7q9n70WXRQwSN9jm03Nh+nG501sFusZ3eK6tSDaS8NVYp/APlpJ
	5MY5vGts0y3+svynlIiUGiX64sFutcHcTF2klDIiiDFrw4Uyk/0vmsZmc19Y32yUiIvVFAJwNS88q
	wN/JaTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25bw-0000000HChR-1Kfk;
	Thu, 03 Sep 2026 11:28:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25bu-0000000HCft-15QQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:28:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8541875f596so1022845b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434881; x=1789039681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=Zm7cx+p61l7a7ENPfcKW+UC9ophd0YVuLdzXyzicThqLO6N4+IQixgG3kluUg6BAQ2
         Z25wbT9/sCkR64pr/ox/7AqmILtjiuhym0r0v58MugQvfcA82wEKoGWJ3ZTK1o82CpH6
         SfqPkc3nS6RI6MPuVBJuV6Ta2knp79DXAZyFcD9EiKR3eZN3QL1BOt+cCHmhonCa0sig
         2l1hQOGmyBjxG/IwdqpzoHfRsIXVBHDxZrjBdNZSx99A/nxvNwJKmKF25YbY/WIPOe3o
         mKXKMiBzO9pvYBW8Kvum9bkCoEdr54SLrKCoRUZVS17eK5+GoinfwEtu1Ci4DwWHiTZo
         WbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434881; x=1789039681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=nFP1mkR3pRTf74NX/bS8q1c+ANk5rJWwa4hx5ER2pDuc0qQOo6taOt0uk5nM9C7A3l
         zgwcznXrwp5LLq1y3fhToegzlWmzTkEjgubcIehPiAFvzhcA2z4dm4m+vQLTjvRd+B6W
         9lT37XE0m+clTOsre4GDSd6Bqpvwlg7QkVa/PH+aYAcU29GrPF7VPB9ZeZU1VIUAIv7i
         rmnsvNP8JEc7igyQMK9kXwx9ERUuHpO1i10CcK/TaMUpJX+HwhHzBWvO5taglFk59v5n
         1QdzBqvTfLZs5KQf+FwcEREZPTL8uCTl0mZzVx4yc/7sHWtBFwmOYgg9ZPKCMeBJQH0+
         s6Mw==
X-Forwarded-Encrypted: i=1; AKwUvBy2CJOhL+4as9MYGXQ5GApCYmJAW/X5eE9lMYyZIsySU2hepuqjfdfGTLcls2E2ZlOd4JXk6LZ4zlo6SeL1zCma@lists.infradead.org
X-Gm-Message-State: AFuF++llT69dQXERd5aS96+KcE52kcbEzzF54AWq3by8uz40nhYMwHh7
	84gB6EoNZbiE2I5NGozsM26snTPcTN4COz90gXUtrGgAr4CQ3+w4RNGN
X-Gm-Gg: AYBFou24uiDjxXnoiidf+yp9r+VI2Hg4gShqTXnOAL711TxHzsE+/MZKURvTqSftC4A
	nBInCXx6yLeNHvifs6RUdVWPYUcb8J3yAgMkLiWMNF2bHM+BcAvtZ7Fg9YhDEsJf4jDPDdigf33
	9oKuhJ9AF+r9ZqPLpTkLDZUg9CANtxJq/3W4yviW08eQ455NNvHKn3XfwVRBJChJac8KQ2shZF1
	p1rKmmwDh38F4fW0yo7RBv01QpoFCnrfX2Aae6z4V4s4TUfw3z07DHzVntior6fjtUMu9IP7/Lw
	tar4v8p/dRZwSSzDMvo0jOZqhMmIUaTKCldBWMuztrIgGsK7eAHXzvp1hh4slVwYXZtGl4YjXxP
	5w+n5xXSx6UtfVuMEIVsG8fTOrFLZiemFwpSQscxZY2ySnbKBsje3klF5ssMCaqEHXjiDE5wGtQ
	hK8U8A6h9jqu53kwfo3xEO/jkDRDjL2W8ZrSKSxBmF6elO+kGfNmWFJvCH8ssnahx8J342fOCmV
	BdrAu9lGoz3WNIqbhuME5NXJ2TArw43npoC3AFIHQqsyn1oBUsEEz7YE1THH6A/CkNXG/vA0+24
	Cpz2
X-Received: by 2002:a05:6a21:9e0f:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d9adcc7c15mr18547929637.17.1788434881320;
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: rockchip: rockchip_i2s: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:39 +0700
Message-ID: <20260903112739.373621-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903112739.373621-1-phucduc.bui@gmail.com>
References: <20260903112739.373621-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_042802_303327_0D14CD6D 
X-CRM114-Status: GOOD (  13.27  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_i2s_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: 53ca9b9777b9 ("ASoC: rockchip: i2s: Fix regmap_ops hang")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 261f36d4c2fd..e7ea71783e37 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -244,7 +244,9 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	unsigned int mask = 0, val = 0;
 	int ret = 0;
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 	mask = I2S_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.43.0


