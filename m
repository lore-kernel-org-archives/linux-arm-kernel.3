Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B61E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=; b=K+jSLYm82jApzttYWGIjgU4LA0
	5+q4YXE7dx6bLGZIP21VlkL7q73ChVvy4WyzYl5/xWzcCzF9i4ZLMudN1+U3+60NaDSHDHzPmFh0v
	IaGbQ7tPEyGN4aEGlEx+jz5QbgYVKDWy95OzkHZUsVkkA9rMqpg5vZpsFQ4wdlwEycmApH2bwyP+c
	REv8JVWUmdfuBX9OgV0Hp20efsBn1lBn02pFj4GnCfUPOGxxyl/1BmKV/l7TQQ900+joFMgCZuY+l
	rww6pIH3K3GiKa8QZopcWcjXmSs1tVLfB3e5zCWN47ILoKxK7278sHaGOUSBEIgxidQcochEa9ena
	iHOU0emQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbFG-0000000DQk1-205c;
	Mon, 22 Dec 2025 08:26:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbFD-0000000DQiP-2d5G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:26:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so4234441b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391978; x=1766996778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=BqulNx9m4kaf4YLvaom3tSHpftPrkQq6WfE9cW6D1oVZH9b9mfQPy651HwccgENnEA
         79Z2TPL9syA4Ktdc/EmHbFK80DjBilrLTpxEE63C6hHXD4fYcDnJJHJGc1xv7lBfwKbD
         h6VkAquauFhZ4eSiWLCTiKkNI248QDT2cjmCJk0jH5A/5nVydVDBSlSDLsecKebBumX7
         7EZTTNrEEhTH9aw6u1QR9JDAQ/wNzPoCUBQoVCGtYDuOVpJDS7mMqKd25sYlXMXPcIJq
         v/U2rQnvqeYY8RKk57/WglNmrLML8Nl6Vs8EYBfsQ4TINEUo791OQVQLepwPVkEQAgQr
         IKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391978; x=1766996778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDCSt59K+10ZOKnakaeCilFtSVyquWS+P/cFe/a6uAg=;
        b=QHPsImNU7LzdpT9OBXYpndlbVRW9xVviMDhLqi4dHvvXIuXfLZcvWsEpuMokh19PGf
         d1PbvYFpnpy0DOTSRNKpecxtcBohWSUD5jxFFI4QC1LRGlpyr2Ni5XvunrCiwmx9j0I+
         7MCWqgGDHH6ZMsM2BThCOQkJ8rhE3FZSLub9nxFeO/c92K1iIhfOOw/+AB2Wy7RNR2HB
         jfGe/cNh7mUVOmCqL2tgaO7kA9xCBqWpbLRHPZu9QIlO3X8aIH7LTKgA8Qy6WfpbtkJm
         DAMMLUy7/Znn3IFGL4nAxAfzGlH09R9sBgyHDUKq+o+UVyQZCzaI9FtrgDZRDdYyRPQ9
         tpfw==
X-Forwarded-Encrypted: i=1; AJvYcCUIuKHX1crEvPWWkh0GrplLHv3fOajQydVFs1CW6oeFpYjJpKI+Y3gHjNl67bbopzY95UIOj+bKOgq6qYYX/j3n@lists.infradead.org
X-Gm-Message-State: AOJu0YyCIY04TroYTuaswurNTXfEu3Ip1gDCG+hpUdmeyMCRT5rkaIS1
	MqA16MeuFsM737dXYiISMdX69YwFE2E15Z9Qpd2pDmPP0kWy1zE4XnaA
X-Gm-Gg: AY/fxX4SCaOJGLVFyzP4n335eQ8QjxhX+Zak0U1DeWob09wyvL1rg0jF+eIHywtRqSf
	X0cqxqThCfZa19EVBpHIYJlQ+iNaxKq1VpvA+X0EaVsplEFZAFYTouS6axo839x4UpP3TDfQjHD
	fY68z+lHskATyvyoysg95H0R2cy1ZuXQUOCf6gkrexdNzGn96x0/1TFIHVpD4diswBFLdv3MV4O
	KcNMDaQ+GulfbVDzZ+F0W+yfZtebKo/Mce7J81Cz3IoEb0sm/ilzp7jm5rcmi7pfHZlDqArXuAZ
	hqk/C2ckU66l9BzzsPwCuJslL7r8yoXvAVcfILqaMSs2tOeAZU7mikNt9M4w+5lEBAX7pTqvf5Q
	Yh86wvWrBAL2XFnDk59aLP94VVZPH1GOE9xkybP/mzoRBdRHkSq0M+IVdIv8MQquDL8EW2Z3/5M
	xnf0UBFEqC
X-Google-Smtp-Source: AGHT+IEOgeXzV1hCWIimzrWiIka32wsRRn8gKqyhb6JthROJ0e2B6pTNBqm7iB1jb1DoK/0bL+KWAg==
X-Received: by 2002:a05:6a00:ac85:b0:7e8:450c:61c0 with SMTP id d2e1a72fcca58-7ff66674fb2mr10796719b3a.48.1766391978564;
        Mon, 22 Dec 2025 00:26:18 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:26:18 -0800 (PST)
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
Subject: [PATCH v7 26/31] dyndbg: treat comma as a token separator
Date: Mon, 22 Dec 2025 21:20:43 +1300
Message-ID: <20251222082049.1782440-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002620_143339_DBEF2D5A 
X-CRM114-Status: GOOD (  15.89  )
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

Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e76ccd987704..350d93834e19 100644
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
index 1da2de7b1769..5ac7248d51bb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -320,6 +320,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
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
@@ -333,8 +341,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -350,7 +358,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -622,7 +630,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
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
2.52.0


