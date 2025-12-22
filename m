Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93231E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=; b=J8s02YNaUeavv+g9HjFrKU/K+Q
	bI/1Nn7yiz5G2YnzQZEUEY4ts4cKmUW9wYQU6KA8FIPfO8Z1F2eNtVzSlSAUBBtIudVrTCULHT1os
	0xzxMPrheDgx2aduVOjssyxZg3jnEX8pvJHtA9FWlASN+goZbuG9blHjhbJvsddit7cHrVADr0Pv8
	JUUx7iu6ohpXAX4WtubbfDJSHVTY5Ry19Ofyyo5TTHQZ8ziHASjK67hahWg+RV1B+9cpFBSZo3mHd
	kivou2aptTn4wiZaVhySOD5yYtrBMbWF9MN6Nb0puok0DWAkbpmWO5615IIziLTMf7w4U4Gt8YEb4
	iT58HsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEi-0000000DQYc-2OiL;
	Mon, 22 Dec 2025 08:25:48 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbEc-0000000DQWF-2Cr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:25:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a099233e8dso32098295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391941; x=1766996741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=KEZFDSHDshfwXGfXFP2oeDRjNmz04RW6oOYGQWWdhHOxh5oegjDtCX4PYhoP9lT3/u
         +ykI9Ctoy5seT+NMzPTYPSbbOI5+P+gqCOdt+5GCv/V2VhRZQOjmTcWT/X1Htl3LJaOT
         vbZdv2E4a1GyM7O4/nMpmeeXe20ECIrlklObZt0YKV0UMgLyOczhsLkbspfpWbGHxoqp
         HYYprwurS50+Y2gVBPG9WWiMFJ56YvNRlRKZt/GLCU6qxcQKmY1vMUu6DgpbwMCsXAE3
         +QzHWrSc1yrjccO6ex++BwOtQqPL0qf+xZ527j1alAQaZeP0o1sfxfSu/uTmxXt5jCJU
         UM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391941; x=1766996741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=XzTBufe2jKK2fHZAgwUFKtLyK7JeoEdDJz+xZYRZXlZwol3Jh/3gjhmx5lqqR9Rpz9
         u5brsNXgLzjJlocPdVSCuZSKngw29ASf5AbqtIEnE8KAOmPS/79XpyaTE6UuPBZMjmht
         ra3i11K8M5pXcMPyhOwP709Xf0kejlHGhmCXuTaGr26SQStltVmEmM/6WrnwQ/poRTT4
         cnc/dwBT4a9HyT4ow/S8NZAb37g+QUJXFNFJPErMSLV4xdaZ8qfkbfEBitAevcH7y2nc
         LHMAJqIM9AZJ978W4XUzFTUFkGokZeSIXLEbPCnD+t/h9RtelhN8jLYrU11S1XUsQKHb
         vB0g==
X-Forwarded-Encrypted: i=1; AJvYcCUl3Am7S1Llc9S3Qza7D9wKokLgRceaDLitFZnpbNZgzpQ880ix8eVlL+SEyjv72LiYfhBChqpvXwJgGzZxeNGC@lists.infradead.org
X-Gm-Message-State: AOJu0YybGdmWt7x8wPjIovOpho0LOynCz/Ogzr40nlx5kKa8YGWniIMF
	SGJnzmqPMVbSAyhhhDcHmZT3qEz5eMb9ql826nMn0mkLa54N1ARbnPEb
X-Gm-Gg: AY/fxX7JiWFHHyVtNftUUOSCsKUoF9t/yPhcALWZHQCPiCdTNj6xLhbDHIG7f5L8MUT
	VgsOdfu6S3ZX5jp2NdPYQZlOV0NwtD5Y9zfWn7t8hYMXysyE6wkql+fW0iUbkUbx0hxY/K5O0Tw
	gogMVV4sAQ/aK9dd5R675bu+FWcC3hXS1wSB1g7ds+alRTSNnDu2rsQyTRWj3btsgKUwPA7mgQv
	85+Tqgq2EjibRIjrSEO4YMm73i02Oo+CrG9N9K9bnP7m8kji6KPT5RYoWWJRgoUaXEJ/tPnJ5Pb
	iRSc5FwjsLkC4QeeaG/lPOCi6hzLvkH0HOpvXAs0IjTGUl5d6Bov2PRrONapXELJcxBSPM6B3cE
	Rn7tPvx4v7oosxuQkgV8y54DSX15TPrqkHCLiVPa8tTSxH7eLu6jkH/3LW2dSBhS1Yqg67iDlE7
	30qxfVczPY
X-Google-Smtp-Source: AGHT+IFewFiHLSSMkteVB5+mJ427GMrWESNV1s0gzG1qZwVux0iZoGglO5KJ+zZHGWbOk0GOGu+BPQ==
X-Received: by 2002:a17:902:ea11:b0:290:91d2:9304 with SMTP id d9443c01a7336-2a2f22052f9mr107996865ad.4.1766391941481;
        Mon, 22 Dec 2025 00:25:41 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:25:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7 24/31] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Mon, 22 Dec 2025 21:20:41 +1300
Message-ID: <20251222082049.1782440-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002542_624722_3A4F6A61 
X-CRM114-Status: GOOD (  14.51  )
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.52.0


