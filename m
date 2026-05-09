Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC225CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qEoyzVdf1swwo5rTtJUc2k2B91Bm/y2EWjWabHORpvI=; b=S824GVw/aK290/IevVktU/ftV5
	w7mqHPZ1Dkw4FqL/qo/2Nwc6U8e4j3U5XRZqVL7ocKElLp4HAU9f+UdlCuTAwIXGeUxRDDidHwXbI
	gmpMgVBzXKWD+0+hkcqkfkpLO44Oh/Ze7kWpWcwR21il3bAdwhGGA5rvQuxpP4XCDMFWl29u7+X5b
	C//PfkmKgZCI4CCOUXEYkJWLwBwHJrcbLCIG9JoJ9ah8DYYYrUDW75EpYVD8kJrWtvRxpQP1FbdMB
	XZXDtMqb8RuImFYGb4UN9rDrQAdxiPTryO8ctnsDEj2JLTcZU3Xm/v8RWz1wQHPln1k+PPb9w5aI7
	1Q30AvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLpVm-00000009hiA-3K0I;
	Sat, 09 May 2026 21:47:02 +0000
Received: from mail-dl1-x1244.google.com ([2607:f8b0:4864:20::1244])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLpVk-00000009hhc-09vX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 21:47:01 +0000
Received: by mail-dl1-x1244.google.com with SMTP id a92af1059eb24-132c3280e8fso445858c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 14:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778363219; x=1778968019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEoyzVdf1swwo5rTtJUc2k2B91Bm/y2EWjWabHORpvI=;
        b=mMi+SXkiuPxF8fSly1R0gmXA5ImGWyycRdr8ucPkC/3kZ6QHxwOgP0J0Huh4JDmCk0
         N/6tslOBeGlpm6jk2VhfIqreCQjq5Kg0uG6wLPWTX57hrsRgJUgZ7VgIhQOdiaU1Y4K+
         YRMcKSKAVBgUtP6QkrZAkOycq/cRYPSAlKC4vdGyZJIwk7eyMnGjoagfYcmA4THYrCKD
         QLsljwtyehD0cgt3K+FdOgKS64bspBkJ+/BeXuQDtsKFkNqSZx/4SC/EiYvs7ef2ipPK
         l1oJtfwQvC1Z9zY21kx4bPx6Ef2+djK5KcqBM518O/PXHPIHhphmXjMsqHyGxHaLt0oU
         9F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778363219; x=1778968019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEoyzVdf1swwo5rTtJUc2k2B91Bm/y2EWjWabHORpvI=;
        b=JhQqepdzDprVqkI4L/TUQ81ODXu2sZXDXarnpGyygPLpEmOgx2nXW5DoXLlzUHQd/p
         9c9/LH7GFKxsAIgh+KuNiyujtqUYFvzr00179C/0KNTVBlQpA8d8a776SX+nWshs21w+
         Vv0zoUCt9RAOJFCgEPUcKXqskoxwNKSolWAG42PcsRAKMwuHEo/Mj/jPWouGVk3KYvIN
         lwIP3lj3HAc42NlqATngz3AQwKKIw23RnjlYV5RtxxmEeI0DrBruTNgtyonqC08M0bih
         i0FgpoLuIVWsyo55IHHx5quZj2dy6hsuIaTrA15TIR+ybw0wktUVRVxyZKnB67FyH06m
         xomA==
X-Gm-Message-State: AOJu0YwR5sT0bD3BGnbBiWg7UF0U3Ev7ZHixhqdJOaT4RR5b2ZU8TuD7
	JRQNV+E7YRLNcQKZTzA1In+S3QEsyuz6bMUhq1k638HhzfMjC5B4c8NlM/eqParNowk=
X-Gm-Gg: Acq92OGDk/uJW7o9+1bG29BxRzdatlbAO8Oui+avgdrOC5LtoeQRMrmivXhp7aGiuyG
	wvqKuKiNL1mAmlztm3llGBev9nvgbql34y2MpDGSdJeXkBnHKXud2hdprOMR1LVFRsw8RiPCIfS
	VUmL6JQdpebmq/zTBL1CsJ7oiwhnFh1OsowUCMhH35N19LB7Q5d/tCRpiJNrudZbvDhffPJwgcX
	yA5KNti81S2+QieR3KUlHdpsmrqaG2CUU3lypR+5Qj96BukAuBYtxGkyZTj4tArARmGVNbFSIbl
	hLA4daYWMsWt3nl9e/C+lw2eedZz5RBhkMfYGv5lvNze699wJ+yELDuXBY6kIiOVJZgW9t7lY5x
	lESc8m1q6R2yEKf4XIjrCliq6fdyXXD2Uk/kPGAYuJiKk6Na+lCsHaFMCSpQr1jZcFjqibMTtLT
	Zdc0VoK62PgK4lzBYmByu4b0OI1egcc7kwWlBLUQjGpSA4o9GJGvzEROoLiypjVbAhrEjiMm9MK
	GZkuHyK1mA71uLWHufHOnZdcku4Jhf2JTFOXuXhl6jMHZuV1sl1OPFJP4ItqpHMzVcJHl+JKta5
	DktWPA77psnAfeF+pSbsEfb9isCB
X-Received: by 2002:a05:7022:910:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-132a7edc646mr1830788c88.6.1778363218896;
        Sat, 09 May 2026 14:46:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm9965429c88.0.2026.05.09.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 14:46:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to use the DT
Date: Sat,  9 May 2026 14:46:19 -0700
Message-ID: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_144700_079166_CCDADC2C 
X-CRM114-Status: GOOD (  15.14  )
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

The eukrea-tlv320 driver contains checks for ARM machine IDs via
machine_is_*() macros. The boards concerned now support only FDT
booting, which does not use machine IDs, and therefore the code should
be updated to check the DT compatible property instead.
Non-DT booting support for these machines was removed in these
commits:
commit f2f55499942a ("ARM: imx: Remove eukrea_mbimxsd35 non-dt support")
commit 3877942b0c7f ("ARM: imx25: Remove eukrea mx25 board files")
commit 7c5deaf77526 ("ARM: i.MX: Remove mach-cpuimx27sd board file")
commit 8da4d6b2f798 ("ARM: mx51: Remove mach-cpuimx51sd board file")

The presence of these machine ID checks prevents the removal of
machine IDs no longer used by the kernel from arch/arm/tools/mach-types,
because the machine_is_*() macros are generated from mach-types. To
resolve this issue, use of_machine_is_compatible() instead.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/fsl/eukrea-tlv320.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 6be074ea0b3f..2e6abd620571 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -142,7 +142,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
 
-	if (machine_is_eukrea_cpuimx27() ||
+	if (of_machine_is_compatible("eukrea,cpuimx27") ||
 	    (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx21-audmux"))) {
 		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
 			IMX_AUDMUX_V1_PCR_SYN |
@@ -159,12 +159,12 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
 		);
 		of_node_put(tmp_np);
-	} else if (machine_is_eukrea_cpuimx25sd() ||
-		   machine_is_eukrea_cpuimx35sd() ||
-		   machine_is_eukrea_cpuimx51sd() ||
+	} else if (of_machine_is_compatible("eukrea,cpuimx25") ||
+		   of_machine_is_compatible("eukrea,cpuimx35") ||
+		   of_machine_is_compatible("eukrea,cpuimx51") ||
 		   (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx31-audmux"))) {
 		if (!np)
-			ext_port = machine_is_eukrea_cpuimx25sd() ?
+			ext_port = of_machine_is_compatible("eukrea,cpuimx25") ?
 				4 : 3;
 
 		imx_audmux_v2_configure_port(int_port,
-- 
2.43.0


