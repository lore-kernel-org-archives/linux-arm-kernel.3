Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67223C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=; b=HG0guaEPih1c0BCOmBvbymQJzd
	62MixGwoS7V/HVAxvvU2wI8k2ZCFxI6A52Un/SN7eUvKbcoQ7BAW4gzwkPsgL5kKajtXsMjW+C55n
	hGoPctpNUf5c36+5mQCg0Bi6YcTfZigNci1Ud1Or7HohPiCnsA7fftATCVtVXgeAHMBCDmQQTVcow
	1Dl4d/9xn/9MmZitAUmHCGvOKAayXkE3atwPB0FCKvQwRtx1pE75we3tH328qfarVCRuIGm9tsVpP
	IGdLBFuclij5oXiojVrpzLJH/xGNNtev2qqeshPO1k29LSfUSAVlYXBN5/k/PXxYoNx1zqcDT9s5z
	QGjsvHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIu-00000007lyH-3fyg;
	Tue, 18 Aug 2026 10:44:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIs-00000007lwG-0ytz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2caed617615so58789365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049861; x=1787654661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=L5jkcjSNw0ZmnqGAdWdnX/kClTRwH7lTCbJVrHW25pr4TyLgyiDG6ti2WyX9Wtlpck
         a6etJcDQ6TDtAtn7Cbm65S7AYbr9Qd1/EQBU3XCuJEdotjuHtuRGQ4zPhYMO0Fj1Wlfi
         Vs8aeG7nNDk4XNMS1pByBS9pPRqPN1Z150UdF3spLiZArM82bRr+ZQveBJvXKG5tV9su
         SIHvXYRfyc0fWzVyhgWoCPycEJmHXHQUQ4mGHA2NAu5TRnhJSU/4K3nZrRvfhEODMTVv
         L1Ne0cm23mcxKfxY0hn/lCdlZc9pOmODOOu1Gn56LlTxpwwhanzWydbtczq/QM8pgSR3
         mR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049861; x=1787654661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=ZHN2F4gjSYkgUUYtikJuqUNWB4tXC9yMN4MdcrhQrHPm9gy5LhCp7iegfoZ2JWvarW
         XsB3ba48CgOx2ew2nKO0+dbKPd8tix4eeEPVzzQlG1gt00THQaffl7QLdCHdIP/69mO2
         C50x11G5xrhzBMw8I3srwg8/nmrBkIu/dBBEx7yuth1O6Q0cIGA9kt+/Uej+lwNT4tD1
         Z8tzaiUilXCPMdM4qwkuh3BcmTutqwcPKP1KAtnp2AoZQpuN0jPp62J1yj/6YJBbwpLS
         4Fi2F3qOMDcbBk/pBElOJ0wsHbXgdiHJmC48xU2ItxwCI3YRmk7CtRJBU8Bld8Oz5bFD
         r8lg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9tCgcfDIoyxPoXo4lEMeGJj8b4yTSgwat02eHRUJDHlElVJcOrS0fGfTAY7RZr2e4MtVrOkYRrrN7WK058ySA@lists.infradead.org
X-Gm-Message-State: AOJu0YxBleOz+1VDMgHEkfttlwDkxL7QF73XjUukSzZI7ox3eMThJNxe
	53p4JGEgVSLLmy6aORJScukM64xLnfxI4fMcShJkZAX2UbHM9MzZmxkk
X-Gm-Gg: AR+sD10p0K6u6cIW4eV2yom9U7tSC5vY36O/XqqEBmk0U6dLznu03DzzNmKk7qjTDZZ
	1PTtSBT+b0X6X9U0JMnMt1SEaxHylYoXPq52sMIApzDM/sd3p/BkAJqP2XReIt4dIUQVkvbDp+M
	vZbbfXdu0C1ZuNvS2163gLzdENVZn/DKjqj78eZGPYNgmFxM9hP+RwdFTfSVCImH4cpA59wymnE
	DvLcIFN93QMn93IPtSC/k+GO4qWOFBIvghopG1wza7FKl2eZk9dxpOVOQP+SH9qO4P2qaaLHKTq
	PCFnL76vZ2I+ccYFwRk0hrjVeKYfnO6naiHP688+MgTY8VAFwhZQaE0Gd3fnaCAqTHvb6dmWeBa
	WMWRXGFIx+J5bYgOTAPHz3Wx6ALanZTjls1abBj7hhPnMqoPUDNL8nuWDRYQKPzmaXxxAHitGtJ
	J3Wr/Oi6lHPnIzYRQVyPRZlOkiDlcsT20ueAYB6oB8FI+t5raNSauaD5bJNkY1IoH3nRL2qcP/U
	hHYgcCKEJwYho9q4HpmXTzwgVoVC5OidbEI+Do+fuNWIdY4K5PHrvw4lEp365aOyJsbX9hJ+bC6
	Le6C
X-Received: by 2002:a17:903:1b4d:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d3b0de7f65mr391680325ad.9.1787049861128;
        Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8173: Drop redundant probe error messages
Date: Tue, 18 Aug 2026 17:43:44 +0700
Message-ID: <20260818104344.37824-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034422_286424_DE3B0BB7 
X-CRM114-Status: GOOD (  13.54  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b7c4b24a9cad..c2421f17375b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1091,10 +1091,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8173_afe_init_audio_clk(afe);
-	if (ret) {
-		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
+	if (ret)
 		return ret;
-	}
 
 	/* memif % irq initialize*/
 	afe->memif_size = MT8173_AFE_MEMIF_NUM;
@@ -1154,10 +1152,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq\n");
+	if (ret)
 		goto err_cleanup_components;
-	}
 
 	dev_info(dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-- 
2.43.0


