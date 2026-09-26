Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C82C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aAoDWVuRpxNlTIg9DRKgevYj0ImdfdGD3NJ5Lik81No=; b=agvJ5UtQupocIIPaix8+o8hwJL
	yvGo7Aoy3S90FvlWISMvDhUEnVEYeg9f4R9DQCwRT5elzAUVh5MDsoDEOoJkuuQc9eatosIgCp/mn
	KMykpoV2FTPgksHcb+PKyoq9fUHvlfQuJdwvsebDYRNGOdLXLCj40/TqZtTpYi1tET4Uh4+hiYxN9
	R5TgeyuY6RsJOKToBFxT8NHQpOUqyiIVuefi8YvnhfgoHha+rYOvgbDgmsqC3FlPKQzyRlAtzYRGz
	KI4JynqYqyRkcgT/QOt1C6am5nGJfV7npkSj9L58VHXBW8hGxsA7OfnQskTnxjfzNyKRFEDuVQV0a
	dEhAVIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAY1C-0000000FknY-33kU;
	Sat, 26 Sep 2026 19:25:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAY18-0000000FkmP-0fJs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 19:25:04 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FB7740259
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790450697;
	bh=aAoDWVuRpxNlTIg9DRKgevYj0ImdfdGD3NJ5Lik81No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=TpdUp71eKEG/ywXMeLpBTOgcv1iaMO8MoiwvOZ5s0zvInPq7Hgsd1cWNJPqgryobH
	 6f6Y5XwsHdHSQhKhuLVVcTptQxUfL8S9HgKljlNXYlYUUCb9IiFdXe3Pv0gGMV4wqN
	 DJbMg/cMkeiRyURVQeTCCs5Gir1YynueCzA8ZBvib6HK9UZonlEp/fIZUvV39hRUu1
	 hetZ8AR6LBkDDF3vAft4JZeYFKOjZxH6sWXtCYXRWNoDT44v94vS9MKA1U7HiXeloA
	 Z+Lt3C9gER45hIFIazu7iC8v+wXGC5+e4I8rAcWvjHNl42j9LGcxXs4JbcnOmz9Fk3
	 ONY6r2Fnt1qc4EB0bDOVu9JzgCkBy+ZuKH40DtLNTGMCeEj3J5kz+KGpEXph7SaIzi
	 fbGePWZghQteKIP0yd+qzOX+BYVfaRnC7f6T6R1q9stfZvcJT0ZCt2Tu81bbKd9xe0
	 hPB9a9HdMnZ0EkeTRN4snurm1oBYuUIPWyu9JDSZGZOSHy73br637NmpxLY4ZbZ0Xb
	 VuAWmj+k4E/pluW+5PjpJCiUH6AhVDeZsWcLS0Fvz0sO2AkBxnIVE4pBSry+OMFshX
	 YLNuY1JYE/a/N3zeR5QBNwoBxCE8F7uANugDrEomFURxnlcf1TLH277v3tIhPDKpGM
	 LM4yLMCa00B2MOeXnGWLCqAo=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ffe287240so3377875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 12:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450697; x=1791055497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAoDWVuRpxNlTIg9DRKgevYj0ImdfdGD3NJ5Lik81No=;
        b=L0WH1v+GfGLX2jjj+3kJnfo0mXMEzwVxK+sT8yiskgAybfJLIZ00EtxSKU6r+vaVXw
         4h1oWDx0J7DE12IIK5ZmXw8oYgvazVc8Np8JgcEZMij4NcIZ8+FT9bCsiawKmP+7HaDm
         SE8fagOsQwAxzLfR1vQ8l4ke1OPS/dZqCCb/KXKWsVpQpuS19kvFSiyTp8IlyCt/WTkf
         g9ZDON5HOm6br7PZNUbRV60iccstZpcEj8AeogF5cacnCnH6TnENSf6hpbWGnFl6MheJ
         qThkxREkxiCjAEtUlsznmqqzEXHa1TWLYGrDALvpCPFPVAoN3uhXSaEPBc+LpsPtlToH
         dF/Q==
X-Gm-Message-State: AFuF++lHNwx4jqyYSdZXsduLex16iaUMpaQ2qExYKfE9lDYWMbTM+LCA
	Ya8mMFmO24xD23mz17BuWv+URlBf5NX5jD+vyviS7ucBlXOXcS1KCdRkaNsUhpq1fK4yp18SzFw
	t8RY1LjUp6S2rDf4hGnGH5933Swq7+VWBTmww0rT7NgyLpfAkR4nLuHEniM40hd3+Wff1XY3geA
	shnFMqHtH12c8MKwVn
X-Gm-Gg: AYBFou2DoZUTbUDtIQbK18lZb7fZ3xmW7r1wxZMKN+TbyQPn1NcEsxGenxBfaBZiWNa
	zcArOWq5lESVTUGeQnPDbOl4kZKIXURXq2SwqJXUGKXsYtiSMlMlPHgFkS1o1Q6cGPz1Xi6K1mT
	1kZz4WrnD0grheHWKtmeDHcEgzLZ1C82Rabhz4LqaO+zIQKcvAc+M3NBdPuN5EOZ4NXsN0i4YP2
	iY3IrHcLwmPaUp9gkQloggKMPnl7lIdhWzY8R89R90T6o7OJ/2YN0Yjz5aEc+4EJWSF+Vkwn+7L
	zdFQNyu435Rz5pZ7TB2K6c39iNL+dukJsjbp2NJEf+lrY6+x0oAW4LqVIbNGVc5HhbHzjtmXy/0
	8FtIBeok4nuIqIdXW1RtxLWQ1aaa5ZT25jg==
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr165830555e9.16.1790450697041;
        Sat, 26 Sep 2026 12:24:57 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr165830285e9.16.1790450696753;
        Sat, 26 Sep 2026 12:24:56 -0700 (PDT)
Received: from k6.lan (141.175.65.37.rev.sfr.net. [37.65.175.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21cc844sm59706145e9.3.2026.09.26.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:24:56 -0700 (PDT)
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Jian Hui Lee <jianhui.lee@canonical.com>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2] memory: mtk-smi: fail larb runtime resume until component bind
Date: Sat, 26 Sep 2026 21:24:17 +0200
Message-ID: <20260926192417.1448813-1-valentin.haudiquet@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_122502_584339_1273899E 
X-CRM114-Status: GOOD (  30.94  )
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

With the mtk-smi and mtk-iommu drivers built as modules, a consumer
device probe (e.g. mediatek-drm on MT8183) can race the iommu's
component master bind.  The consumer's probe path runtime-resumes its
smi-larb suppliers, and the larb's runtime resume then runs
mtk_smi_larb_config_port_gen2_general(), which dereferences
larb->mmu and larb->bank.  Those pointers are only populated by
mtk_smi_larb_bind() when the component master completes, so a larb
resumed inside the window dereferences NULL and oopses in the module
loader's initcall context.  The module loader is then stuck and the
rest of the boot dies.  On MT8183 (krane), mediatek-drm module init
hits this:

  Internal error: Oops: 0000000096000004 [#1] SMP
  CPU: 4 UID: 0 PID: 270 Comm: (udev-worker) Tainted: G W
  pc : mtk_smi_larb_config_port_gen2_general+0xe0/0x660 [mtk_smi]
  lr : mtk_smi_larb_resume+0xb8/0x1b8 [mtk_smi]
  Call trace:
   mtk_smi_larb_config_port_gen2_general+0xe0/0x660 [mtk_smi] (P)
   mtk_smi_larb_resume+0xb8/0x1b8 [mtk_smi]
   pm_generic_runtime_resume+0x38/0x80
   genpd_runtime_resume+0x118/0x320
   rpm_callback+0x8c/0xc8
   rpm_resume+0x558/0x758
   __pm_runtime_resume+0x64/0xd8
   pm_runtime_get_suppliers+0x6c/0xb8
   __driver_probe_device+0x68/0x230
   driver_probe_device+0xdc/0x1b0
   __driver_attach+0x10c/0x2c8
   bus_add_driver+0x17c/0x2e0
   __platform_register_drivers+0x7c/0x1c0
   mtk_drm_init+0x38/0xfd0 [mediatek_drm]
   do_one_initcall+0x60/0x4e0
   do_init_module+0xa0/0x308
   init_module_from_file+0x10c/0x180
   idempotent_init_module+0x1f8/0x2f0
   __arm64_sys_finit_module+0x74/0x120

The oopsing udev worker exits holding the module loader's locks, so
every later module load soft-locks and the boot dies in the initrd.
The same oops was reported on MT8188 (Genio 700 EVK) from mtk_mdp3
module init.

Publish the bind state with smp_store_release() and check it with
smp_load_acquire() in mtk_smi_larb_resume(); that answers how the
check synchronizes between CPUs.  Fail the resume with -EAGAIN: the
larb stays RPM_SUSPENDED and retryable, the error is dropped by
pm_runtime_get_suppliers() on the driver-core probe path, and the
consumer's first runtime resume after the bind (at display enable,
mtk_crtc_atomic_enable()) re-runs the callback, which configures the
larb ports then.  Failing rather than skipping keeps the larb
suspended instead of marking it active with unconfigured MMU ports,
which would only turn the crash into silent iommu faults.

A failed supplier resume does not break the consumer's probe.
pm_runtime_get_suppliers() is void and drops the error, so a probe
inside the window just proceeds.  The display components do not touch
the larb in probe: mtk_disp_ovl_probe() and its siblings only call
pm_runtime_enable(), and mdp3 only enables runtime PM for its
DMA-capable components (mtk-mdp3-comp.c).  The first real runtime
resume happens later, at display enable: mtk_crtc_atomic_enable()
does pm_runtime_resume_and_get() and the device links resume the
larb first.  By then the component master bind has completed, so the
larb configures its ports and the resume succeeds.  There is no
deadlock either: the bind only records the larb pointers, it does not
resume the larb, so the window closes when the bind completes
regardless of what consumers do.  -ENODEV is not an alternative;
like -EPROBE_DEFER it is recorded in dev->power.runtime_error
instead of being exempted.

The bind state is a separate flag rather than a NULL test on
larb->mmu so that the publication explicitly covers both larb->mmu
and larb->bank.  mtk_smi_larb_unbind() clears it again with
WRITE_ONCE(), which is all the clear side needs since it publishes
nothing, so an iommu removal or module unload can not leave a stale
bound state pointing at the freed iommu data.  A resume in flight
while the iommu goes away is a pre-existing teardown hazard (the
data it reads belongs to the iommu device, whose removal breaks
bound consumers anyway); clearing the flag makes every resume that
starts after the clear fail safely instead.

Tested on MT8183 (krane) with the full MTK stack built as modules:
with this change applied the machine boots reliably, the iommu
probes and binds all larbs, and the display stack comes up fully
functional.

The Fixes: tag points at 4f0a1a1ae351, which moved the port
configuration into the runtime resume.  The device links that open
the race window are added on the mtk-iommu side, but the dereference
guarded here is the one that commit introduced.

Fixes: 4f0a1a1ae351 ("memory: mtk-smi: Invoke pm runtime_callback to enable clocks")
Reported-by: Jian Hui Lee <jianhui.lee@canonical.com>
Closes: https://lore.kernel.org/linux-arm-kernel/20251111124853.2916889-1-jianhui.lee@canonical.com/
Cc: stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Jian Hui Lee <jianhui.lee@canonical.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
---

A fix for this was posted by Jian Hui Lee in November 2025, but the
thread went quiet after review.  This revision is not from the
original poster: it is an independent rework of the same fix,
submitted because the same problem was hit on krane and the machine
needed a working kernel.

Changes in v2:
 - publish the bind state with smp_store_release()/smp_load_acquire()
   instead of a bare NULL check, answering the "how does this
   synchronize between CPUs" question from the v1 review
 - fail the resume with -EAGAIN instead of silently skipping the port
   configuration; the larb stays RPM_SUSPENDED and the retry is
   demand-driven (the consumer's next runtime resume, after the bind)
 - clear the flag in mtk_smi_larb_unbind() so an iommu removal can not
   leave a stale bound state pointing at the freed iommu data
 - quote the oops backtrace and add proper tags
 drivers/memory/mtk-smi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index aaeba8ab2..dfc65b208 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -157,6 +157,7 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	int				larbid;
 	u32				*mmu;
 	unsigned char			*bank;
+	bool				bound; /* set once the iommu binds us */
 };
 
 static int
@@ -171,6 +172,11 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 			larb->larbid = i;
 			larb->mmu = &larb_mmu[i].mmu;
 			larb->bank = larb_mmu[i].bank;
+			/*
+			 * Publish larb->mmu and larb->bank; pairs with
+			 * smp_load_acquire() in mtk_smi_larb_resume().
+			 */
+			smp_store_release(&larb->bound, true);
 			return 0;
 		}
 	}
@@ -180,7 +186,13 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 static void
 mtk_smi_larb_unbind(struct device *dev, struct device *master, void *data)
 {
-	/* Do nothing as the iommu is always enabled. */
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+
+	/*
+	 * The iommu data recorded at bind time is going away; make the
+	 * next runtime resume wait for a fresh bind.
+	 */
+	WRITE_ONCE(larb->bound, false);
 }
 
 static const struct component_ops mtk_smi_larb_component_ops = {
@@ -697,6 +709,19 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
 	int ret;
 
+	/*
+	 * With modular builds a consumer device probe can runtime-resume
+	 * the larb (pm_runtime_get_suppliers()) before the iommu's
+	 * component master bind has populated larb->mmu and larb->bank.
+	 * Fail the resume with -EAGAIN: the larb stays RPM_SUSPENDED and
+	 * retryable, and the next resume after the bind configures the
+	 * larb ports.
+	 */
+	if (!smp_load_acquire(&larb->bound)) {
+		dev_dbg(dev, "not yet bound to an iommu, skipping port configuration\n");
+		return -EAGAIN;
+	}
+
 	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
 	if (ret)
 		return ret;
base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0


