Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E79C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh5DtSmdlg1q4BLyqHiCWDwX2HlPvGGP8eXC9e2gYuw=; b=A8njgudKLyv6p4hYjlhuJJVKvU
	Z/KjALZE7hoiNkazKM/OOLk/IK3uqq62kHuQuqweYR61XzYoUQg754ntjOAae+1U2xPUjEJYMlHtu
	JW1WY5fAvCEInA0vxfVnJ3+ez8qD4lulkt96EjUi18rWAmBoceczVu3/UxKugRjgRYK2GQDOvv0cB
	yf96rTsrXsaWM5gVDrGotLLITWGcBKcwCZ0xce43Zrkzs3DAzjxpU+zLZ1y9tvOo5d21lKELNVFk+
	ZMxkCO0WKM1PqhnJMAnGVjHrp3/3mraiCrKeJtlIZBmWRVbLjZjjanDXw7Vsz9fk9OqFllm8kcvTc
	0MRPRMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQu3-00000008Jpw-4C26;
	Sun, 03 Aug 2025 05:05:00 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsN-000000088LI-13Hs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:12 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21344445ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193550; x=1754798350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh5DtSmdlg1q4BLyqHiCWDwX2HlPvGGP8eXC9e2gYuw=;
        b=nXqtXkjfmSx4YYWxrVq+RnEl5nyDaPTe+JBjxq5yZLZZ3VwMSjJuD9yROwpsDvxAb6
         Z8iUI/El95atIJ1LkBgZbjKZGZUE08OH+dLaCEhqDQYwUWGiN284euYyxSRCeaFpq2Zo
         iDCX+B0thEuL7+MkJzuBrBkATvWgB+V8GCveMf9nFaLyyRWoSaKq+AgRDWhBVXC4XVgw
         9CKHKOlkB0GewzWb8y1dJta3GNfqOuzvY42S2p0WXbehgRrolj9tHGm39sWi+cL+FeNP
         N0fzQamtKHVJO/r2Zl9R4TaloYtagb4Hz6YIqS15GXwVwxL/399uz41MN31FP1yeHMhZ
         OQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193550; x=1754798350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh5DtSmdlg1q4BLyqHiCWDwX2HlPvGGP8eXC9e2gYuw=;
        b=AJzG+2fEAAITOzoWu5G6c7Mvs1aotRz5wzCG8l4V8uzhWEarVLtf1L8U9f27DlAXpn
         uA4CtHKhlUCmIR9SXRARJaXLSZfhwmIqUrr8QCW55l3X2SdiUgDSzTomv5nQCc041kiD
         uxcqUVFktj5lFHB63HTs2u6OvspgrPeM2vYUPaayNv8Z9N7eZeseqAjvrgcUAz8BTAXm
         MEuY6U9y8JdF8GUOkbFkU54t53T9IvIupyc2NiLTxJ6+z2+c/J4hPO33tSv6N4mW8UTw
         ggxxzVCqCuAiVHXkQn0ZrKGhrLIJVzJUHj81ucGJ7F2J4ucBIgoKbLuVOgBuq3Z7uzRM
         NFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWezUMD1//Zpzv2CiceqE367pXYbe5Leb5qkrxNotMAtz2CxbHVpwtfj6t9hBiosNooZY+YSuDk+P1/GGNP5HBe@lists.infradead.org
X-Gm-Message-State: AOJu0YxCb22Nw4bKZdd9nz8GcDu0GGNeV0q62BcEYM4rGe+zjRyAMWyS
	NmmZwhACdKJuiAYc1NS+R0eFmg4IonrdljJUWbPM8yazdnALUd8iBmBy
X-Gm-Gg: ASbGncuftCU/noeoQ9UjzNOaqipV3fVfVx7Dgn7UWlEM5tDocZ4mbSnH1oK6bDwnxFa
	Xw9qQAmtALuSZoErk4NHmgOTGa4PStEGdVheTIuEjryByDpIUVkNG7uREQLYmuujZlYk0RkurtE
	hsIOSSPLfCp+TRkDnyafwoz+2uo4BeoZE43OP9xqFe9OiGpKaLm8X8vGXRYRgeTJ2UyY8q/Puqe
	ekjpvl3BrOdvXoTmbuV+uflgr+YtosFVpdla2IrN9ONGYXX6U6eCbsESkeS7igqpwHWFjSKDNFS
	76I6wvh29Eb9dwJx/P9An+RxzzCAdNYGDwJLXNl8y2tIphZUjPrKloKFLk0GHPCeeW8Rl/ZOJz6
	SdQWLeKDBPXDIfcztkcCGqlv3G82G/FOgJXIGpqppMshhjcLdNFY3FjkXII6eVV0UFFFXhjrZym
	AXXA==
X-Google-Smtp-Source: AGHT+IGzml5f7C+H5Kt0Jq64zG4cgAy45VHUQatQ7Tr04zry1DUjTuhWBZAgrxnx7adjKMLqc/eW8Q==
X-Received: by 2002:a05:6e02:1f06:b0:3e2:9e9d:a978 with SMTP id e9e14a558f8ab-3e4161cef34mr112108265ab.21.1754193549778;
        Sat, 02 Aug 2025 20:59:09 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:09 -0700 (PDT)
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
Subject: [PATCH v4 24/58] dyndbg: treat comma as a token separator
Date: Sat,  2 Aug 2025 21:57:42 -0600
Message-ID: <20250803035816.603405-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205911_315583_554E6080 
X-CRM114-Status: GOOD (  16.58  )
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

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
- skip comma tests if no builtins
-v3 squash in tests and doc
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 63a511f2337bc..e2dbb5d9b3144 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f7c81a9140bd2..17651a8267567 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392cc..c7bf521f36ee3 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.50.1


