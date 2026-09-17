Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230FC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXNjnaKjCC9zA9Voyk96teJyXfaJqLPqZodkmIpeNdc=; b=1yeF9mFVhadfKFhaivMbbRGT3P
	zzdGUeAKoabFU6lL3EQwf/H/Ks7KbQhaqjI2HnsnvQt6Hnilj6/R4iYhdZBTlyOMOLefbMMZNGjZy
	mK65E25whSBpNRMWE2tx85aizXnVD/ksKGfinyPMWkui/rSBZRmFKwc3H03yhS5/RZFikZjumZd++
	volki10Wss+KuYaf3Uikb7+lTmka6b1fMak6693MUcD93aqDP0OJr+GLRUR3AoWqZOzx+Z9cgB3Lj
	BpGYBaSAr5nuenjwY5ksYtWGqFv5zAzVQzfFzt4bHATW7pq6XT1aw5XhfgbjmIQumyJoXGDoaKP9E
	sv52b3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7M1A-0000000Cz8G-0YLk;
	Thu, 17 Sep 2026 23:59:52 +0000
Received: from mail-oo2-x2b.google.com ([2607:f8b0:4864:31::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7M14-0000000Cz7W-0HWT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:59:50 +0000
Received: by mail-oo2-x2b.google.com with SMTP id 006d021491bc7-6b4bff33d18so63660eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 16:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789689585; x=1790294385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXNjnaKjCC9zA9Voyk96teJyXfaJqLPqZodkmIpeNdc=;
        b=f1DgpxnZ/8G9fpwMytIjzENiu1BXNGfEPQBvq3SktfVAAqgtdFDFQVydNUiJPb7KAI
         7/JM57DkGGYuOZM/ndqLD3IPlG5iH3EeDpzfTNFSorEHcAP9fYC6js0eHXracEEPvwrR
         U3BYyTDkKh4dE16hFDbUhhYSpSTX7SGjlb+dE2PZ6UeIzoubcx31HFA4r8GKzk2GrMTV
         4PhUD5VOWz//FTAl6cJsV+AzabtLY97M03VqAv48OBk1OnuYuDCnLN7b5p4vFOx/60Hb
         QrP/e183vBbWjnVKgG4/eiebF80YIvSHz+O/3KJZPRZO0IpH4aTtRY12I+sJUhQjGYke
         G2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789689585; x=1790294385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXNjnaKjCC9zA9Voyk96teJyXfaJqLPqZodkmIpeNdc=;
        b=I5TVWz78sM29/c7gOvjKrmke/7/eWfJhmRwGIeIskHZjQp1r+Wyrxf5hl5MMD9SAoK
         nG+1Hap59Sy6GjBtnLP1nWkni3OU5X7hhpZyhuAwJq8Y72SZMPwd5PRMCWENarNs8W7G
         VqQmabscy0ido4AtFV4ofBLEunaR5RRHCRIY9+8B9XUbSzdalO4VIWlFqb6MzWjR1kva
         2OF5ECNPEsTIeHF8TD4pJ0qUKpEIeAOXVPCDFvx0131UoTCldzZtd1tBcGF/eLFtBrur
         2m/4Fyd+jkSO2U3laoq4731+tVmd5YsvpoavPltZH6o3fMQY8v+0iNxsIPXWKHZy/gxW
         46ug==
X-Forwarded-Encrypted: i=1; AKwUvByd+MLIr37WmWSfvmzvCM8BgyeLVsyw6QlGBNXzO/nYkFcemSfvOwMbCK6JBiO0SLebzyyFx8MDsuC9+iJWjE/q@lists.infradead.org
X-Gm-Message-State: AFuF++liUAcUVeQQiX1T0Q4a5z0/4M3HhznkplzuimneGPc1Cm7X+vdZ
	f31AbXo071psXWrfOm1TqTsFRUO6wEj1PKrpHZyn1yyjB1qOrWYGXps+
X-Gm-Gg: AYBFou28GdDq4h30gOibpahFzLh0pOSqUPNIiLViBukt/4YaoF72UrVKlSGEWt9yIzj
	rto5a2KAja6mNGqF1smKAd/ioD1RPdpd73AroI+vYPuwowDDVtis4qMCyQap2CWHTtXj7BmRuFG
	es9Y0nsMU+8WMJlEOn1htVainXV5QiS1Y8Sz+lMcFZYJnT9QM8ED108MttYcYzh5Wjr8RIITpN0
	OM7N2r6uSw02vS1Zx93L67/B98wEqhIavTmzgCaHf9q4gQIuaFjZyFizTn71QbNpAyoVXHjNeyB
	4Le+oJBO0mM081mtHy9QD3EjIxnAdqMGTTs3GQtRHySN9htm+k3VobVYS66I353rDY5rIIsMRsy
	E29L7aqotuI72VANIbFKImD0KqnZ2fmDUyhoYx5LSepp5HFxolu296TsteZFFMJHh+rm9QdJFaA
	JFoo3UhtnBsG5Bfx39YpATC/JQ28cC6z/DNoblo3yLsQGFpfZNkZBMUAYgfsspJb1VujobPVYEp
	0DAi2gug+KeSP5Cegf9VDZ52UZ/WTV3JieOUwfjkakuSA==
X-Received: by 2002:a05:6820:4d06:b0:6be:7782:5a40 with SMTP id 006d021491bc7-6ca9ac3f6f7mr779525eaf.28.1789689584793;
        Thu, 17 Sep 2026 16:59:44 -0700 (PDT)
Received: from cachyos-x8664 (fixed-186-96-141-48.totalplay.net. [186.96.141.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4870b228179sm237307fac.9.2026.09.17.16.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:59:41 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Subject: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr() error path
Date: Thu, 17 Sep 2026 17:59:25 -0600
Message-ID: <20260917235925.44185-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_165946_108231_4DF8F8AE 
X-CRM114-Status: GOOD (  11.30  )
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

When the mux is enabled, stm32_omm_configure() enables the two OSPI
child clocks via stm32_omm_toggle_child_clock(dev, true); they are meant
to stay enabled for the device's lifetime and are disabled again in
stm32_omm_remove() and on the devm_of_platform_populate() error path.

However, if the subsequent stm32_omm_set_amcr() call fails, the function
jumps to the "error:" label which only calls pm_runtime_put_sync_suspend()
before returning, leaving the two child clocks enabled. As this happens
during probe, the error is propagated and .remove() is never called, so
the clock enable references are leaked. devm_clk_bulk_get() only releases
the clock handles on unwind, it does not undo clk_prepare_enable().

Disable the child clocks on the set_amcr() error path, mirroring the
cleanup already done on the devm_of_platform_populate() failure path.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Cc: stable@vger.kernel.org
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 84eb23c824f5..3599683ab04a 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
 	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
 
 	ret = stm32_omm_set_amcr(dev, true);
+	if (ret && (mux & CR_MUXEN))
+		stm32_omm_toggle_child_clock(dev, false);
 
 error:
 	pm_runtime_put_sync_suspend(dev);
-- 
2.55.0


