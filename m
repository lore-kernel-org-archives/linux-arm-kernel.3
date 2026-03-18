Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B74103E190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4jx9be2ixpeez8G3+677w21LKJvNvIiDEiSr10SzEQ=; b=NMDQLeol1ODFvbk44oUjE6xGhv
	o2UOcYO0zuXf2orvC0/EN1Nf8nnI2wCRyKHNLsg7rinVNuiaYdDFhLkFVFNcnLc2uFHjGbiuPVOtZ
	XPS8IZoZQNr6uAxeIl63S4uhP3+sOxtYRo5ZmZQ/LIK1EddrRlXAE/bhsDhAByLm8YU5taKKkjyK4
	O50AZbjq3TsZdNhlW4UbDIMVkBcy0hD2RomY70IY/Qe2GywRQTibocKJA6FQYjCyHVRmMRy2M9A6z
	uZjZ6zakeyfJk8tqJmLM+PrIrcuR1ryT0rNtsSxbTk9EeWTinZAa9hKsUB+WFNFEituitlgqdrRZe
	6TYsTSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sEM-00000008d75-0XkG;
	Wed, 18 Mar 2026 14:50:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sEJ-00000008d6F-1Xs8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:50:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso59267015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773845437; x=1774450237; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4jx9be2ixpeez8G3+677w21LKJvNvIiDEiSr10SzEQ=;
        b=ofJlLKAwWFSbQ8WCvldaXbodhbqdUDzBNzhWvj/iQ5DdAF5jIvlie45CWA9pXj4qMg
         SBWgpSFB4Zv7K9BhBigxLNf3Mu1lcU1K8fFR68CzjDRnRuZXMyRonCljGCncAXojULdl
         GRA8f7EWWbYbN0jf2//hQkV1eM685PGMysE354oxAVqr2ApM2gVDPOkb70olevj8P5F3
         2TdCGgeXTSCpOz9nF8RUjJUDSa/ArJLl0u3+2vyW00pZn9Kg2hr9jjZ8e+8GLg08RadV
         /xp6jqqqn5yz8J4B9KDsks5gZsxr1LyGx5p2/2WbxeUrNLQLHGb8SLfCRl+hCXb52mS6
         Jw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845437; x=1774450237;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4jx9be2ixpeez8G3+677w21LKJvNvIiDEiSr10SzEQ=;
        b=HjHr7ZHITj0Z9SIEpE7o8dxbwFtXzl2kJwpjc5veJAPkF7KIt1EoSkbPtchKv/dQld
         wgICO3/OFe5nYoCWt+ZVmN0z8aOIyhOIXlCGgvygcWUoNoRRmSQiW/mHtA6RFtLrtmbl
         GW8n7YuYcCrERDiHKTQo5AscTH6DXyJl+5YNIe1+R80Tcq1u2isUarNX5ul0MnD6T4c7
         QIRylV4Hp/5ZhLshPZW9qJqqyjq5tuz4Nv4otX198fntUb9iJEn4JJ/4TBlxWApQgUVF
         NXDc3sTlkYSrVBoN8j//3tt3O2fvlac16I/PMQGoTj36PZiFe8cfVg4vLSqKN1FZYI+u
         cIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8mSXB9wvZCDyvm/rvDm20ZYdFCgpYHAKqyStKk8wDn2QA63o6lCNpGIB0XUwXcPU/nn8JfOZ7MgH7loj1qZK+@lists.infradead.org
X-Gm-Message-State: AOJu0YwlyBfGB82GTCYHRoOQxL09ogYSHAzgXWUNb2TwYhnFI7TuIcUC
	QVdxl8GFojTeXqpy56VcQycP10i9xvRA7DK6lMO/2v/cJ2CyEXDTYyUUr3W11ekLv8c=
X-Gm-Gg: ATEYQzxWIz4peOiNblYKeeqAT+elZEA6hMHSpyeyM+6/CTg/VHn8qNutL7ecddwhi1w
	LbAHKbjp4xOpVj3e9SKIk8jpIqv7PX+6qtjw1LE+Td4ClHbHH7GI4wX3toKlWIX53SdL6ocNyQ/
	Eg08cqJJF9EqMtDKqxrrZ3a58Bf9H9QKEbRcVyd0wx/gscSm5rILddAWwrwpYJXeKEBq8VpWQzn
	yplAQwDL/QZFKAG3HzD6vxEl7unBB4PlnqjgPYUGdLu7j7lphhDfy1H80t/m5TDSd3fj+usT6eN
	Gk4rABIG1LPIFGxQlD/PSUGMGqy0EPGGytJElZJ4sqPc48v5I0kLXK3IR0kBx+bQ1lxEi6GJdy6
	DMowb7J6QPS1dojYMzi0GbwtfyxOIQ74DGbIjMZaaM10lok/Az7mP4awtl3EBweMj2uvgJKRKVm
	0X9bBmzPVFvLs0y41G8gWbOCb384bLhWxs4rEZ1NZhwL7WZLixJ1Wpib6O7U3BVoD1/UTr/V8AC
	4Az7Q==
X-Received: by 2002:a05:600c:1f13:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-486f4465ec5mr61165625e9.33.1773845437260;
        Wed, 18 Mar 2026 07:50:37 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f421a6f2sm64455665e9.8.2026.03.18.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:50:36 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 18:50:25 +0400
Subject: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
X-B4-Tracking: v=1; b=H4sIALC7umkC/x3MQQqAIBBA0avErBswo5KuEi1EpxwICycqkO6et
 HyL/zMIJSaBscqQ6GLhPRY0dQUu2LgSsi8GrXSv2sagWEbZ9hNv9mfAdjBEvnNaOw8lOhIt/Pz
 DaX7fD/krs4pgAAAA
X-Change-ID: 20260318-sai-slot-width-378eed5c22cd
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>, Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NLuWlcb8pDVc/jx4hn9f+1Y4XpERqSPMPejDpC3HkM8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r2LQXabQmNxUOTmuWuVZk1xYDH7F7xj3tm5YhsuT
 d5751SZX8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTff4ZI8P3KSv/KzEcnL3vu/K+l+pbFh3xStZe+UPM8PKzyZlhs3YwMzLskdU
 R9W1wm3mARX752pKM9Qv8kr5alHXePbncc8pXtio2AA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_075039_432860_9B2D6C9A 
X-CRM114-Status: GOOD (  12.84  )
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

Currently the slot width in non-TDM mode is always kept at the POR value
of 32 bits, regardless of the sample width, which doesn't work well for
some codecs such as NAU8822.

Set the slot width according to the sample width in non-TDM mode, which
is what other CPU DAI drivers do.

Tested on the following RK3576 configurations:
- SAI2 + NAU8822 (codec as the clock master), custom board
- SAI1 + ES8388 (codec as the clock master), RK3576 EVB1
- SAI2 + RT5616 (SAI as the clock master), FriendlyElec NanoPi M5

NAU8822 didn't work prior to this patch but works after the patch. Other
two configurations work both before and after the patch.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 sound/soc/rockchip/rockchip_sai.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 1bf614dbdf4d..ed393e5034a4 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -628,6 +628,10 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
 
+	if (!sai->is_tdm)
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(params_physical_width(params)));
+
 	regmap_read(sai->regmap, reg, &val);
 
 	slot_width = SAI_XCR_SBW_V(val);

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-sai-slot-width-378eed5c22cd

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


