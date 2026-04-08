Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A39BFD5F6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mn7wQQPeIAPXSFjgjTqJdELriWK6r3kCAJfIBvkQ3a0=; b=TaCRYM0GecS1n2kWyzNfuoZqS4
	bu7zzXa7YYozziVMbGXCo2joKPVfoItQeIwPhG47tKmx4BjZ2TAGI/6+3R39QJGynkuS+ipHxzI0z
	WaJk3kiU2C52tLs9w83jP8FH1oQhJILLIpAUT9x8r4jUQGrB76RtYBtSPuPReFAXPeA/ydVExws74
	IW6BPjceEBnBdP1HdGho5qTTprOn058AmwkfNc3rGSni/IDcosOnFtgBiE2TcBDE3SyKQp+74h9PD
	TAqAbGwRFFXnNpkyAwCYMZ2JZUHun0FP+Pq+LTDCn9jXZmGnHhYVwZbrUFzzzR/XGUjE3Hs7ZleGE
	pxg7ju7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOWh-00000008XXc-3mzB;
	Wed, 08 Apr 2026 08:44:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOWf-00000008XWh-1lPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:44:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso1081844a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775637879; x=1776242679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn7wQQPeIAPXSFjgjTqJdELriWK6r3kCAJfIBvkQ3a0=;
        b=ZNOZl0xPZ7Pz0RiTy+n4UtyVnDpqZEsPmyaKp67SkYAmi2QiZXJfK7JxR4D7X6UwVf
         iFFAN1eX9FE66AhqOOekTDWpo2O48qqsnaWv9yEP/ipHz1jjEo3Ks5ZnysE2H8XPBtEV
         pT1PdqxJvuFHKrjQptoNjTtmWQmC63MloNnvDmxtqGnsEn61HKFk4Ymz+X7e6j06/UUh
         hJ2nfEbQfRs6wd4EKrH/+Ql2vMP1zPCFXg4JsJJHjfD9yow3GVUHUquaeGhf+6706gZS
         EiwNnRcDNO66qS3b7aGGfgIxA2GR83Lp3udZ616+onKOM9rgqGqoaZ2QHkGqFwTwBXXK
         e+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637879; x=1776242679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn7wQQPeIAPXSFjgjTqJdELriWK6r3kCAJfIBvkQ3a0=;
        b=IHZY+MrPTB6uA5x8mp2FYYtGwNzkPwJuab11gAdxYbpkL6TVtoFFy/Yoriv6ALFhoh
         SOxDj18MLx0LzzXeEGzkG82ZN58A/1uavOZRrnMe96GqTChPMJzRmJt8x1/TGZcdFwX1
         lFmLGQFAeGdkzqgsp03aIWJS3XpSpeRJalxQZrsOoT9dXdgmWK/UsmTgaUUJyauMcF/i
         pcnhmxwelWLL2n7prEC+JKktJeN4DLDNtyR2YK2sgagvfU9HDpP1kk+Q3/kTNpi2oWzq
         OIDaysKm6xA7bopq6ge2idfZCkxXK6vYtkdNUmPmn973u6uvpl1KVQ5ZaTCdSGJZsQja
         /z/w==
X-Forwarded-Encrypted: i=1; AJvYcCWxOuLTNIOtEJDmJmwR3RsAhYXisDTjuEgDTaMAUiVdRVbJfSn90xxE8M4Bjtodq1/g5brYKrNVgtLmMstEx3mS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd+QpL7r+7Z2okxFRaTrCez7SyF7co4jlThg5xAviCzxGbPGnW
	IhJBWntzeGtI7Rm5NZrSzaFZnpwE6VMSrRFkvritTEA+33hP9+JwTxRQ
X-Gm-Gg: AeBDievZZCgq85jK0fxKRqXmtmDIvzdOyNdkdCI8cmhCwe77IGjVh5o8D3RXw6JgnBL
	YlvpobbeI8elNg5He7/pvo7FC6xuhNjvDSyjCftYU2BaVvG+0YVW0mgSM4nJgYJ6NxbZPNkr4cX
	8W3hkESzSI/3z3WD7e1xuv0wmE/cfVmi+6k8VDQ2p8tbwLeILob2o6f1+2lPVJdKlH6E8NP+UPP
	NOAAXyQsSTQdWt4xyK0vlzhcXNpZ7u2BVo7SwTgbeFYOVTGYY1JRKXO4zucZHDRJ/QvW010PenT
	DoGDekJK7og4HzgCDbfhzmJ9DhNwj75arG2LdIxsn2PNQeKoE9RdxMlKlwhXq0uw9IcXBGPbBrb
	AfohS7cFBt4Zq1HEIFxwijYiNzMLvnlVqs5/6tBPEF5tv4oLNvCgvlItZPutd3ZW70VuFAWJfkT
	+LgbbgUjfDXG3XJYHEdI7F15XbLws154mjNHZwLxObFQ==
X-Received: by 2002:a17:907:971a:b0:b97:fec5:eced with SMTP id a640c23a62f3a-b9c46a55746mr1174761366b.0.1775637878710;
        Wed, 08 Apr 2026 01:44:38 -0700 (PDT)
Received: from tm-Precision-5570.. ([213.192.89.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034c9c47sm4815194a12.29.2026.04.08.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:44:37 -0700 (PDT)
From: Tomasz Merta <tommerta@gmail.com>
To: alsa-devel@alsa-project.org
Cc: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tomasz Merta <tomasz.merta@arrow.com>,
	Tomasz Merta <tommerta@gmail.com>
Subject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
Date: Wed,  8 Apr 2026 10:40:56 +0200
Message-Id: <20260408084056.20588-1-tommerta@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_014441_474827_EBE6570B 
X-CRM114-Status: GOOD (  14.18  )
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

From: Tomasz Merta <tomasz.merta@arrow.com>

The STM32 SAI driver do not set the clock strobing bit (CKSTR) for DSP_A,
DSP_B and LEFT_J formats, causing data to be sampled on the wrong BCLK
edge when SND_SOC_DAIFMT_NB_NF is used.

Per ALSA convention, NB_NF requires sampling on the rising BCLK edge.
The STM32MP25 SAI reference manual states that CKSTR=1 is required for
signals received by the SAI to be sampled on the SCK rising edge.
Without setting CKSTR=1, the SAI samples on the falling edge, violating
the NB_NF convention. For comparison, the NXP FSL SAI driver correctly
sets FSL_SAI_CR2_BCP for DSP_A, DSP_B and LEFT_J, consistent with its
I2S handling.

This patch adds SAI_XCR1_CKSTR for DSP_A, DSP_B and LEFT_J in
stm32_sai_set_dai_fmt which was verified empirically with a cs47l35 codec.
RIGHT_J (LSB) is not investigated and addressed by this patch.

Note: the STM32 I2S driver (stm32_i2s_set_dai_fmt) may have the same issue
for DSP_A mode, as I2S_CGFR_CKPOL is not set. This has not been verified
and is left for a separate investigation.

Signed-off-by: Tomasz Merta <tommerta@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 450e1585edee..3e82fa90e719 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -802,6 +802,7 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		break;
 	/* Left justified */
 	case SND_SOC_DAIFMT_MSB:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	/* Right justified */
@@ -809,9 +810,11 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSDEF;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL | SAI_XFRCR_FSOFF;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
+		cr1 |= SAI_XCR1_CKSTR;
 		frcr |= SAI_XFRCR_FSPOL;
 		break;
 	default:
-- 
2.34.1


