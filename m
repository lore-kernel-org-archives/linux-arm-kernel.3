Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC07C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=; b=adynHEqeV17JBmT6KzOzmguEPr
	BDAn1koDIVCby9mheepsA20lHwTE9f23SaO5UncrcGSgfOlETUb/R7toWMtyuuxE30WCAX20I0ig8
	IjUb5dwGrodxoaUNUFLNnlLeKoyqa+737hIHiVA4XPNpny0dFL27c7/dBTV4wsjQn9As6YjrY3P4J
	3W/NyJUggqtCtSdca1tx3Mac7gn3I9WDvcj9R1k4jsZVUvToxa6CpVxL1DzldN+QnBDlJ53X0qGpV
	CPu91clah5qcUFGUMjko1cFo0UQJGIGsXsk8SjX4SaXF1K+dfHKqzcgtYgyx+N6+vGj44BcMTL1CV
	pDhwt51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQmI-00000008I1E-2Cee;
	Sun, 03 Aug 2025 04:56:58 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsJ-000000088I7-0vc6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:08 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14696165ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193546; x=1754798346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
        b=nrO18V7bCCQiJMb/wWjj2DdCeJg86JB3exRcl79MPQo+B7QIAfD7RH45X+lQs1QWAI
         e0DWGXdFkXJMdAjRXEQ7MDe0B8pJdHFD1w6D4X+6hsOU3ikXMZqpzTTp6/gTC2TGWPie
         2BqWtrW2iCTkQPCSXFlJBRIk8p0ZgHjtJB9YhgRU6IZWIWYbm5pw/TqzuyP2VwkMLj1m
         YDkMXcz9yJFGViABf1Ce06il3ArD9vTrKTpmZ9OMTd39vncpjTnfa1XjH3nNbBCa2TUL
         Y3E7GAmazTUGXhyftnZ8BxQoFpI+lLhrddMWTKATH9MvuZcSZ3PjYEDk7atkUiBr5nYh
         1k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193546; x=1754798346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
        b=Y62/kv+7WduZR3RmhNQbj8yEqngpOKQXklLseskZXCseG+QBuptOQYxpvkgAdUTgbT
         1XkvQGh3kp4H+7zEBPD1v6D/z+U5I/9OEyzTRDUI0HqVbWIttNYI54gOBw8IobRj43xI
         AVh3h4yJsTUz4biEecUVGxZnvS1jOwXeUNv5S5DkRLnEMDNbbsrg5qeS60gKcnEqPY65
         WdrsFnOJ/6f3EQ+bydJ/Es2XDPCodlEKyGsyzgAmHfGbyFg02t7N2U8JXhTHRxyImKIu
         SmLowclx2wkR3S3PXi567DKUcenAtVmwGeMcfFHid7SPHt8cihOs1lbatlocmRA+9CrQ
         lNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYhuholf6wDxCHk5R73ZJG9RvhYoFNn6etV+klAPXoTZWOAqzzcGiiPfmtPoH2yzv4WQV9Gn7gAm1Coq2Kz/Bi@lists.infradead.org
X-Gm-Message-State: AOJu0YzHmK3l1KVDYHJBnfpIQrsw1WoGAlsmj02NIyYn4z0Pxy2y3x20
	Xr85ZxMewvoVP1+grNYKam6j9TWA5sdX0jR5C/c+twd8F6Fwt78kMIs4
X-Gm-Gg: ASbGnctR8vGFhd82pW0K2pNH9RcrDOuJzkerwz8/A4DbcHfJkjg0yRHSSS4dYbQtBhA
	qMVXfm3r7+p+ICX6G4zwWbqaRummiC5craR9jVdBGe4mgYTD9VlRzlilv15RpYWNu4Qlw87d9fV
	+IUaWybdwK9RwOlcb/Il8AnYRmCl/Qf8jXIqEAYh4VG5rnb+pCB4wZkgeWN4Bl1N7hrVyPwDkXX
	udH12VWPSE3LfszQjeyW4rL1LnbumbASRq1S4DvuZplO1dfIbCtjF3rdytgFrDm9FeQNkZybhst
	p3z3JxhuZe3JXblXaWJodKqTJQUp24WbP7q+YlQhvr92/tPhp5EbOODbzvcgnEku1Ls9+H8YfZO
	gr9MfKFP/O54XfTgEZcdYhvr3cuRfAM6PTOoLcN8U6xsDgpe3rzdP40tIIfm/KrRciUz+6zjMGP
	IZtA==
X-Google-Smtp-Source: AGHT+IFoAVWLiheF2E67Np6scTtkKmbEoqDI0XN5GZeGYOfVbOkwBUJIixlaV+eykRMBCUEIeZ8d9A==
X-Received: by 2002:a05:6602:487:b0:87c:5a38:45e9 with SMTP id ca18e2360f4ac-8816832a528mr807300339f.3.1754193546523;
        Sat, 02 Aug 2025 20:59:06 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
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
Subject: [PATCH v4 22/58] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Sat,  2 Aug 2025 21:57:40 -0600
Message-ID: <20250803035816.603405-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205907_264612_3DF72E2C 
X-CRM114-Status: GOOD (  16.36  )
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

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e83b34b6d6b95..8713537363713 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,30 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+#define PRINT_CLAMP 10000
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
+	if (ct > PRINT_CLAMP) {
+		ct = PRINT_CLAMP;
+		pr_info("clamping print-count to %d\n", ct);
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
@@ -191,17 +203,20 @@ static void do_levels(void)
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
2.50.1


