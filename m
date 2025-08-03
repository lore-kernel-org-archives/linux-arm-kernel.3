Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD39C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=; b=mEu741RH9JAl4pVoLaCFeK+B23
	zBZyf6IIQ1lyfZpumSA1q2jNRweEfnqZ/5JoTHGDIpmuThoMeg2KspuqbhOz3j9n7iVdvUpsoOogl
	SeZzgvUWPlxK6tN/RcAiWIiSkT4+0PT7Sv5QSCsBnPWHFCoAFB9O0fERKL0jeF1hlYkbe4ui1wveK
	/7jd5kMXlaKvq5o7L5RF4+bguSO/Ym0VOTmoNn0bBkyrsn3d1lponY9+IMIj6GDMjpSMom2R7S0Ic
	ZjLA2GGjOla9ucHV348XIanQVkjLid14o8qhH5twVRYvFzZJevlRjL5rihfEulSEsOmExwdKZDGKT
	0O/rnQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQwe-00000008KNk-33O5;
	Sun, 03 Aug 2025 05:07:40 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsO-000000088Ll-1kQQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:13 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e40212e6ceso14462715ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193551; x=1754798351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
        b=YknXNq7TFemVj/D7nypgIRTDk64cL06pMX+/hOoeaZIEFyA0cgeZFzb71Cc8sqc78u
         67wD4wb5LlWlMr6Lp8f0ZGN3Cw/WqwSDCZgIXs/fCEWVma5BMiH31oKV7Cr4kE63/aio
         lWEdpBWeuYtdsVa4AyVOJWz5HozF80ZCYbednn0oAXXEF5YBbHW4w4LjLWl+xABoXsXC
         BvMmuRxgGUpuDmuLeXV/LZJ/aoSesPyzVxdeqnCrFIxdasTRbPbqppu/Gr/1F5BPG9RD
         K5UkNo3oYkCV5VmjTF8l7XvzkXnHcnwMOqghDq6Bx2t1akbUm6HJoNEhdb2iSoR9xQM8
         4VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193551; x=1754798351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
        b=BpaTwPuNUi/EJSbz6cNPbxSE/GzeknxNXQMLkC59qIfqBQwt755REOhMSMy7Y2sPAr
         To8vYkkYVoqFCR3QxoWhWwIXpdKo1bLrw5pZP1wylafXqMZPpQ2rNuXrgIv2E4I+muw9
         OnwiB90flulNciV+RzspANzoGEkZ7WtYJ7JlHQpSwZcyDrB/fihrHcPDHGYyI+BAxrC3
         Wj3Ie4nM/TeqRAGlQ7v3FdNGmbTqMXTrE9SIG6wtfWArbEX1/3QAeukP26E1LqEQu9k0
         QoYYX7YZZ6DmRH/ye52jlij+8K4xx50Z2zA/ugs1zZ3KDmuHhnkRyGV0n4YG19cilOUg
         f+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh9r/bEx6YIbARcaEildJT9UB34bqsLj/NZ2Dk8wmsVt65pBBfavYPg2/L0Cvjav0NoXwf0sgEWhM9Z9gO6J6I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy085GdSr2rkGddxiDAyiEj296zmsFPF5YnFT4x+ERIJ7RfmwEd
	+TmGKkuyJzfn98RRviKD4M4vW/h6iNTLplsCIyBZ57cyYICwujJVOxzu
X-Gm-Gg: ASbGncvjjyTPu6IwX04kMv+mAHUu3CoO+LODqKpiAU6kGilIhqLoVhAI24R6KwN+KBg
	hWJ+HbXfvdxBVg6lE6oPPDj0m5prEckBP5/yr3U8Jvw8a2LLWYqIu08RmtiBdDuKD9JgHB/2CKm
	q43N5GTbJLhzH245mrtbuJ+9o/Ogy0Gj1XAK0z6gU9rVpKxjJAvuglSfz6UZjDsJ/ctYymfHTRi
	YGbzlzN458nnDHegqkPGom7vRRJ7JW2tYqzNDcV/fz3nuDaQ5GMB3lMRBg6AtcnxvYKKW/TL/4+
	+mXAtjtZJfyv0TGGQ5uPHf6t+BPhFN6sku7nC2hlBHWDZeGfLpxeGNf+vNOXdQ2k9yLPjcqyLNz
	m4Y3p/ijjXOiIV2VRf4muInF5DaT3JcZylToH5+Zeu1tS7WAI4YOdxVNRlLPhP+iveLmS7BdXZ+
	kXVvsR0+kTnkAp
X-Google-Smtp-Source: AGHT+IHMTb14erlWcx3uPanj+74lbfKJy77PmyqgbUaexrywFum5PC+8tMgu/EFNKc+XsZAX1tA4QQ==
X-Received: by 2002:a6b:5a06:0:b0:876:a7cc:6eb7 with SMTP id ca18e2360f4ac-881683b27eemr751673739f.9.1754193551518;
        Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
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
Subject: [PATCH v4 25/58] dyndbg: split multi-query strings with %
Date: Sat,  2 Aug 2025 21:57:43 -0600
Message-ID: <20250803035816.603405-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205912_457120_AE9B10E4 
X-CRM114-Status: GOOD (  16.39  )
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 squash feature, test, doc together
    gate new test, which needs test-dynamic-debug.ko

test-percent-escape
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e2dbb5d9b3144..1ceadf4f28f9f 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 17651a8267567..73076709d169e 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee3..513f6cb1db1d8 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.50.1


