Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C333D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=; b=2NVJItx/MUtL+3CR/aL+xp2kqX
	8wEdTpaU8yXcYH1exUZeyj1qgOZTP15wQRLKdEgg1aiQeMg6O0P67IGFPQDouYGEpswGJwYM8kSeQ
	GFQolff420Eax4oqnOms6AcXohlf30yLyTeFtba9i+1JHLv1vUGMiLXsmNbvdK7lhqnvJvVxxc6sf
	dlWiofKxA424L3wwm1rCYBfGGzlTvXdHRj6X0NX69vn2iQjOn6udblW1qc4dWriLdAy1hMuM68OsS
	zy4oo5TBQKINuZJVNl11+VAyXtv59rEWx3Ic902FHG3V15DElRuKeRKVptDN2i1Glwip4FCp4zzvS
	1AbGcJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbFy-0000000DR0a-46uS;
	Mon, 22 Dec 2025 08:27:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbFv-0000000DQzF-3XQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:27:04 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7f216280242so1412601b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392023; x=1766996823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=VVKeDKyEGPv0YWdt6Civdndol+z/VwmtStKUq9BNcLyFgymRa8wl5e3Y7nZJsls/OH
         7hdJLTvmLaxENO89w72QbWkY41F2CFmev7hhjfKYT7tF07ex2Ta7D2ZzEL0VGm+eccqq
         Ug8jg0MZNQ6uvYhtx+FUrfroiHEDdQ6J8msGXN1YGVOu5fUbN4s2R9JxMBFZxVj7lUIG
         be07Y3S0mdNbiqWtD6+eKTAfKcgGCHSrXwXiEiyJxYeQcr1iyslP7P8lTWmObEBWC9fh
         x21+rCeFVi/kGQmLwntRqFaGsUHX/mIZ3TMD3aBAeVLUU0Q8QWSXE1+4NMLRrGtjknTe
         Y14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392023; x=1766996823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
        b=qHCugBJ1TEUPUcQyr/1c/NLejf451cpjclxJV16CdPxTQJ/hEGgnTASclVZwsoXdvQ
         l7202MxJ/5lGE636GRP5Xg55f68p+S5a2O9IZ430KjLuM9VpcOqUuygIM7bXPujzsnsX
         C/Bc3wI5pP47NrFC0F+o0CI0UlFa2RXadKOaDPrIgVSHAq+XqJt4z8DhigvRLtmifEAH
         NuJhKqEFjwOmWwx9d8iE2cZd0XrWfmdnsvXqRMCuxS0ITF6/OkRiWR9aGh/9NTERZJ5p
         QfvcEduJgwDq5R+wqONT0rLPZBp86S/yLdNj5mM/DW962oKXildNeFwPRc1O+KyBc6hv
         2+8g==
X-Forwarded-Encrypted: i=1; AJvYcCWeogFQPQpSmlafDJhsHWr0UmDUeGngAybaU/IGFKoJzv2j3TVSRTmKqUVH8RE/V/xbfONbfRZCVoteTmj/ZK0z@lists.infradead.org
X-Gm-Message-State: AOJu0YyG2jhCYhAUeBRc0kNiFaU7gY/pikgWWbTW5e2+4QZR9UvpveWf
	SLPuG0CDEkOyvC0ptO+cRBRggMEZgXdSlqqiTIpnzhjlYFLdv2veOAAS
X-Gm-Gg: AY/fxX6Eky7eI7drXu4+E8H2QvvUn2WHJLcixxv00WNql4etKLoVWyg4BAhqGrFPvc5
	ynjCF8VBmp/DWTPtYxmShp6K/cvhcT2Spl9D1SfoSk2HsHeAYq/wDW27MiV9ExM96FZxQqpE8uK
	X7KIYDuMwRM7myfdrYWzPuFfkQ9X6m1G7pL8qIJV86fH+n922/IRAnqB29k7cpCFHbdv9uSpxmv
	O0xjKNypdaJsmBifd1A4qWWLrbTH1+IHch8y9Cw2Vh7XpkB0YhVmq4Y+t4e+/FEiTsEcaXgAtHR
	9EsdfHeG41IcrtPmvUXnLD78/3hHA9fFdkdiNib7MPzakIr1nkAeTRYCFND1l1W8uTosS1sXKQR
	3E07Qol7JO8rgThBDO2EZjKGS+JriciLlqeDPZt4jEso288gtBf4Gu2OoZGeZU7MwXGWmwn+AeH
	RZPSn4JHXo
X-Google-Smtp-Source: AGHT+IGofjncFQbha1D4YrfUNbCgds/xOaiZY5usf+asKdAPER694b234cYaH/K4SJMr8+Sv5Hw4Hw==
X-Received: by 2002:a05:6a20:3d0b:b0:366:14b0:4b1b with SMTP id adf61e73a8af0-3769ff1bb74mr10653684637.38.1766392022754;
        Mon, 22 Dec 2025 00:27:02 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:27:02 -0800 (PST)
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
Subject: [PATCH v7 27/31] dyndbg: split multi-query strings with %
Date: Mon, 22 Dec 2025 21:20:44 +1300
Message-ID: <20251222082049.1782440-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002703_889609_83B69B18 
X-CRM114-Status: GOOD (  15.80  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 350d93834e19..89ee15d7ae58 100644
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
index 5ac7248d51bb..c50836c262b4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
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
2.52.0


