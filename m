Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABE9E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=; b=x/u/v8fxXPSCnVDlJ9556gvlvj
	BYNK/mxp71DdHKelPPIKfBpbosl7cfrTQg4Vw3tVN9N3VNyqIylFTqjgFvMU4ARlQbcBePKD/Mmg3
	1wmuYDzxbeegwuNcfPObmydjTqVbaZLmqthobrYt5/zh3LBI+SIkE+ZFWQVPcW5FilQOKV6j9wtry
	9vaDtk3+OF7v6pdZ1cCZjsBmpRQX3GsaSxXrKKTjTj3m4uk097/CrSF5m2//zZyPanGmlDhmA+BqT
	Lv3MVZnhqhrCHVzEn8dtMyUeBn2gWtShaJn/ESyPxOy9nSXnQEODEDzVsmObNYJRsaM1IWsIzsfBQ
	/Mwc/OuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbAk-0000000DOii-3lAE;
	Mon, 22 Dec 2025 08:21:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbAi-0000000DOhv-2Ec4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:21:41 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b75e366866so1656449b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391699; x=1766996499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=F6wCAIZ5YvHrr3318gTg5bDi8ktjdTUeUiS3i1oqQUidCxQOAV6B484dCPFqvLLiXL
         /osD1KEdw3Tz55iostgzoimkJXjP7g6mU/cdC48p+enKtfbxzxzXpEMlv8aAGXFsOfSl
         7PQA5RkirAiawHZAzo14MSRQmfOVobP6txdy/rRTHZN0WKFXVIC+t8HsovO6J0OJKKUp
         4mit6klxtjQfvNvQRAGYcunvhzDVz2riFPGr7Cbda28pvhDSsVaMfSA91AEMkKFr9Dg5
         OFVyPd7WoE3cBXagqr7jPUrldlycCiyj5mVC53L1MwlPKUmurhlNOreyq9eYmxSXUTxS
         RqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391699; x=1766996499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=VNdIYjZmfj+VlurqheigRpHSP1Kd4iWjPcv6U8ZeSnh4RW33+MOJ+T5CVMMCr1JpKm
         dF9JsQ9ScI41e5xmmaFyo93/uX/lkcWRuwz5CQXCMMUuAkJ8FBGsUfQoQgMEReKeqUSq
         FBh+aA1r/OxdRDWwZAU+rweH77Aah9Wjp/zOyOPR9iQE4XrBmGyQvH9SD0/dzpDiGxh+
         C3OSj7qwFgTHcA7fVccvmITGIxBl6pEp0KraoCXV6j+q4qTx49AO+v9piXlEL1CAf7t2
         3Lt9HXtHIkTx18iDizaLMCuQcwNuP7aMUtddHnR2aNbsalyECsybrSDvBz4U87psYYEK
         bWzw==
X-Forwarded-Encrypted: i=1; AJvYcCXNy/L6pESqbsNP4ZNON76+6fz4Qad8ecRfA6HyUmkyWxVJ48Li59Z6D9m9G0WnxrhOQ+DOUxVFLwY3GDly1pRX@lists.infradead.org
X-Gm-Message-State: AOJu0YyRnwgcSZf4eV/9+DUo3kXaV3rDWIQDwWfEXh5yw4y6vzh0hEXj
	4pi5ui4SSw33tcWJDWeUjnqd6AKa6ncs3LucAcz0zdNLh2ISe5xDZluE
X-Gm-Gg: AY/fxX7VEy80opIu4Cr67Vt2ENPUvMuMkwViGUQHEuvpwpq6AZ46iGxCuOnW9V+v9x6
	9j6ceyfLWIi3//TC4LuHPcdJSCaStkJjOEMwL3AqYAC1q0mV5WXu4KZrMfvEp4EjfZ66PdLvyaj
	uAm8wDsXvh/5zcPLRC0H75gaMhIj6cp/TuYc44I2d9GEaUkqBmu+t3HUI9BRvxM9mjjZy6I9l+5
	Dqgb2G7io1JFUxePn+GGXjcMOUksZviF1pNXoMCzpU5U+nq5pgCFAYYIBXz1fF1zFZ9qHLahRMC
	4HEHH6lf0ruGDG/kdpP1YBvDL4aBd30VnzTDjwlXHHz/kOarGleqiPQJZLRIyOhwmB+ZqELFhT4
	kMKkIJIjMQEXPd0Wj4f5xSp67akcs+LmUaeX80XXZlSTI5vJ5oN6DMU7LaRVFVL+F4Q/+szMeqf
	FCZvhxYfFK
X-Google-Smtp-Source: AGHT+IGcO+eahZ8Qfw1ltSxeW3EKuc0v2WQb9oj5sDZDssHMRosJcxJCeuE1JFMWMkIMkTP6ZaGDLg==
X-Received: by 2002:a05:6a00:300a:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-7ff65b89e90mr9317037b3a.31.1766391699395;
        Mon, 22 Dec 2025 00:21:39 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:21:38 -0800 (PST)
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
Subject: [PATCH v7 03/31] docs/dyndbg: update examples \012 to \n
Date: Mon, 22 Dec 2025 21:20:20 +1300
Message-ID: <20251222082049.1782440-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002140_582836_0572368A 
X-CRM114-Status: GOOD (  10.11  )
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.52.0


