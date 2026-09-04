Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF33EC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCmaPe0iP6tKAqZOH5fpzpvMEa+c8TRt94OkvkEgA6g=; b=osWZHMvFiQkJxGijC26J3D8a2q
	bpBB+wIcvTdRVPjGaPm2ijY0/W3iuu7Tl7yjdBOMOLpIuMz+hS8i9u5zSq6ZH4huP5C5tZ1ZZcHUa
	jereA0aahY5JRkCz9XLtg1n0G3ss14nMRsyfx0HmWmK/k2url0dX4+hFlBtLNwpEltuO2iBKMAM7a
	RlmWbhtmIdOAVrmNZHZSVtNGIdE2vIbe+xv0gtz/UAQmOOrKarVdnfGVjXP8oiGSGZAbQ9OxNSqFm
	Z+GcqAXwmTK0CdZcgfv61KQJJuXPhUXNFNrOBjllA56VZr5R0/ieTKYazN9bQW1hLs8PNOqgnhMRQ
	htxvcZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TIn-000000024Mv-2OLw;
	Fri, 04 Sep 2026 12:45:53 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TIk-000000024MQ-1901
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:45:51 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7f5934ba2a5so516436a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525949; x=1789130749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCmaPe0iP6tKAqZOH5fpzpvMEa+c8TRt94OkvkEgA6g=;
        b=WvWKyQ1iAbe9LhTkMbNDxY/ZanULurhG3/EwYEu3PwSTxxeDygb0XrWCQhV94whNMl
         VSiUKRe0TZylXGD7ox1HFMEzcDTDXEIbw9NgyhgafENCbc8GMdm/8+fQEyOBXcQvjodZ
         evawki/kRsUj1sPVsac5PaVdq+bGnNuBhqpRpblGLNlWbVYUXkgPFSEr4zsJokemsXKB
         JAiUnydcYwXihISMyLTYFoL7m/7Fg1movHNmnbaXG+xpIm8nUQIkKi0153Rtb6QbZDGM
         E4fdBfYitwfrZFKX0GjKpbCKzSbbBGLAqGk0MiJBwfztCZeg2CK7G0z8trSvXGsOveMI
         tRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525949; x=1789130749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCmaPe0iP6tKAqZOH5fpzpvMEa+c8TRt94OkvkEgA6g=;
        b=AW3DR/DeZgcyM+tseVQ1oP4hb/53ZgqbKcwVS0hSGI4E7O9iAqUqrxKqbqfVt+/bn/
         1SsN5OSi7QQs57Z9ZIlkrjqJZ5DQejoz5gZUHL61D3lD8SiUFeOPm10huEmeOkOlCcsm
         gI587z7SvTSW5Ic6atZgPJWYRD5YzoXuEGz/R9Srtgml1DNj5OPokukdSUCjdOXCIm5s
         XbNgxUoSQBvRqjbfgsFDyhxMQ/xHXyzPZElXiBuTqhe5HahOvYuxcAZPAJJa6SPwr05Y
         rCjztNtgYVCdJLXi/h5OxpXgW5RuP/h7o00T4OV60VUQYdOZr1IK0Ca9+FN2tI5MlEWz
         gNKw==
X-Forwarded-Encrypted: i=1; AKwUvBwZH9vBfw0PwdVlSeXKyFh/9ZDnGdsWxQCZCzep9SbKZXkHRingXqAejCDMqNuCSkZfVcR9oHuVHHHIsDMG7Vyg@lists.infradead.org
X-Gm-Message-State: AFuF++kK7UxJswXCucSl6w13FKRQHAriughnEdgrFrGNLcdwU1D6PYa4
	4zXtvigqRrjYwjGpwPYaELKbXTZIkbM1CbBP4HzrZBbuaZ2Nr6Onpo/KJhJj6WByHgg=
X-Gm-Gg: AYBFou00iH/d/gusDSfCDoVZ58umXIW33x7y4pvL941lts1LVztBsRvQTrHwPr+4wyZ
	abMesT8n5GHkkpPRTefP/5MlPUIe2PB4eslx/Gq0cC2ToX5thWUXo7D+BwsdseVjUS6mKcKPLJM
	NflcL/n64v94foGugzZElCe6kKi+XYRHUBe7Cm8dP6ImYizCia+H/rUeoSY1zcCpKYlh8N7hFyB
	eryno63rd6X5rJW8YldMvJ/weLScGZbeWghxfsKXssL7tSgpJSU0vCj8ZVtBcypcUJeNlat7jWu
	e699VbaFU0QTF2QqcbuhJp2dbATN4Ir9Ggo7LSHYwNK8keoIQbVtjCLSXBEsMpx8k99ivgGCTwI
	uySAw9l6/snnXiiHm4cSiwTFDaCY5s2jOte+f9qkszvjq5or79Tw8QyzyBLNaG+LfTr4VwE4vXH
	pJQOsSSWn9HPzU+hI965FxU7pu1IhIQlBlbi4PWDJhFVX4JewIzvAGVXYgsWGyjt8pteehcCqm9
	SyJEgONVgxlGo8=
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr4231568eaf.30.1788525948980;
        Fri, 04 Sep 2026 05:45:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6477419c88.13.2026.09.04.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:45:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] macintosh: fix typos in comments
Date: Fri,  4 Sep 2026 18:15:35 +0530
Message-ID: <20260904124540.7652-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124540.7652-1-hemanth.selam@gmail.com>
References: <20260904124540.7652-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_054550_322353_41ECC129 
X-CRM114-Status: GOOD (  22.78  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/macintosh/adbhid.c               | 4 ++--
 drivers/macintosh/macio_asic.c           | 2 +-
 drivers/macintosh/via-pmu.c              | 6 +++---
 drivers/macintosh/windfarm_lm75_sensor.c | 2 +-
 drivers/macintosh/windfarm_pm81.c        | 2 +-
 drivers/macintosh/windfarm_pm91.c        | 2 +-
 drivers/soc/fsl/qbman/qman_portal.c      | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 6155da58091b..68d1df6bc92d 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -32,7 +32,7 @@
  *
  * Improve Kensington support.
  * Split mouse/kbd
- * Move to syfs
+ * Move to sysfs
  */
 
 #include <linux/module.h>
@@ -604,7 +604,7 @@ adbhid_buttons_input(unsigned char *data, int nb, int autopoll)
 
 			case 0x7f:
 			case 0xff:
-				/* keypad overlay toogle */
+				/* keypad overlay toggle */
 				break;
 
 			default:
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index ee3caa3d87d1..926bd074352b 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -749,7 +749,7 @@ static void macio_pci_remove(struct pci_dev* pdev)
 
 /*
  * MacIO is matched against any Apple ID, it's probe() function
- * will then decide wether it applies or not
+ * will then decide whether it applies or not
  */
 static const struct pci_device_id pci_ids[] = { {
 	.vendor		= PCI_VENDOR_ID_APPLE,
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 8c652c15018c..736936152b0b 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -482,7 +482,7 @@ static int __init via_pmu_start(void)
 	/* Make sure PMU settle down before continuing. This is _very_ important
 	 * since the IDE probe may shut interrupts down for quite a bit of time. If
 	 * a PMU communication is pending while this happens, the PMU may timeout
-	 * Not that on Core99 machines, the PMU keeps sending us environement
+	 * Not that on Core99 machines, the PMU keeps sending us environment
 	 * messages, we should find a way to either fix IDE or make it call
 	 * pmu_suspend() before masking interrupts. This can also happens while
 	 * scolling with some fbdevs.
@@ -1286,7 +1286,7 @@ pmu_wait_complete(struct adb_request *req)
 
 /* This function loops until the PMU is idle and prevents it from
  * anwsering to ADB interrupts. pmu_request can still be called.
- * This is done to avoid spurrious shutdowns when we know we'll have
+ * This is done to avoid spurious shutdowns when we know we'll have
  * interrupts switched off for a long time
  */
 void
@@ -1549,7 +1549,7 @@ pmu_sr_intr(void)
 			/* 
 			 * For PMU sleep and freq change requests, we lock the
 			 * PMU until it's explicitly unlocked. This avoids any
-			 * spurrious event polling getting in
+			 * spurious event polling getting in
 			 */
 			current_req = req->next;
 			req->reply_len += data_index;
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 128e9944429a..085b8c640e3a 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -108,7 +108,7 @@ static int wf_lm75_probe(struct i2c_client *client)
 		return -ENXIO;
 	}
 
-	/* Usual rant about sensor names not beeing very consistent in
+	/* Usual rant about sensor names not being very consistent in
 	 * the device-tree, oh well ...
 	 * Add more entries below as you deal with more setups
 	 */
diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 2a4a3746f6a0..308ed55688b2 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -734,7 +734,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 	/* Release all sensors */
 	/* One more crappy race: I don't think we have any guarantee here
-	 * that the attribute callback won't race with the sensor beeing
+	 * that the attribute callback won't race with the sensor being
 	 * disposed of, and I'm not 100% certain what best way to deal
 	 * with that except by adding locks all over... I'll do that
 	 * eventually but heh, who ever rmmod this module anyway ?
diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index 14089d57e5f7..d2e72d1aa6bc 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -656,7 +656,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 	/* Release all sensors */
 	/* One more crappy race: I don't think we have any guarantee here
-	 * that the attribute callback won't race with the sensor beeing
+	 * that the attribute callback won't race with the sensor being
 	 * disposed of, and I'm not 100% certain what best way to deal
 	 * with that except by adding locks all over... I'll do that
 	 * eventually but heh, who ever rmmod this module anyway ?
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 456ef5d5c199..e44de59ec522 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -33,7 +33,7 @@
 struct qman_portal *qman_dma_portal;
 EXPORT_SYMBOL(qman_dma_portal);
 
-/* Enable portal interupts (as opposed to polling mode) */
+/* Enable portal interrupts (as opposed to polling mode) */
 #define CONFIG_FSL_DPA_PIRQ_SLOW  1
 #define CONFIG_FSL_DPA_PIRQ_FAST  1
 
-- 
2.48.1


