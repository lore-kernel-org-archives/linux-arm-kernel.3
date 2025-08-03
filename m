Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=; b=XWmmojyL0YYlKPG/dMjzAhg26y
	5v0gSzvbvmV+TWdyAs/yglLmIzE/OzcKCWtJQJRmjwPl6lnQ67sGBQbmdQ0T/ciq4gru6QPc8/Esj
	cVofFZdAAFuwm8XdJdWR0xqGu8izLGhJX5Oekq3zq2ukWOTL001Sn6mf99Ge7d6HVAUASAwe/Cmgq
	XBlISQdpwlvX5+OHKDfb79PXo+o9ZiyS8GvYydmLmnbdGDEsfzK39tZarBaKrAk8MGOvFj+2L5e5P
	VFqEhh5sgG+wnJapGEDIVQ7n85eJyqh0/LORj6bfqQST6VivhKwFVlB5WUZMEVhUS5v+bkpzsvj8t
	n2C9Hdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQzF-00000008Kwq-2Tfe;
	Sun, 03 Aug 2025 05:10:21 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsP-000000088Mi-2PE1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:14 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e3f1e69090so8245055ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193553; x=1754798353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
        b=h6HOtSnlvHiCCeshAhCLbS9IyC9zGxVQGd3zbVJXCbGGOdSHG1rXFpxxEbk/lMPs0g
         Nljlt9dj89TW9Udk0nT4LNQ4YrwhVNwudlQ/WZrxhzdDMlfkgH7IfIrS23bfZ7hMQYf9
         aM9yF1AhQKm2N4WwwMHc1vTBOkbWiHdULhdkGXlU/Dp4a8FQwXrXeCdmS85uO+gBhgHB
         LBG1Hor8QQ/jTWJyVB4jwR3v6Hlsr2xZ+qQMT0/RBzX9YVZE1/HfJYYdiwjuZ3jIH4e7
         eSHQw3TJN5Ah6RL+01DsiY58O775M/Mkvrjf1SA0ixXBUEzHsxBNENm+qNMv5IfqRRVJ
         nCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193553; x=1754798353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
        b=GQZZnsr4TCbQVb56sGfyFGlS0qx0Li04MkASHq5lRdFsdN/3f1O26ktWZiiYCjRTGj
         PMYDoT8QzBJwaPZLnFBqSASku4irYuZh4QOmz9pFEFQvY7j2qyIZEDRBWxNNu4duLsTD
         3A2xswmOiAE/g95bJskY+dh9BRWtO2lGa93BcrE8BVZta+cofnZXv7WH2crrPNAwhYXU
         kdFeU3F8DqBHkem2k5SHhaBey2OLTgMjJw/x4+Ll0en5BoJ9MqnAyGPYBN7kgY4D46s4
         KmJeb3q2UKQidmvr7W9LkgdAlQW1SJU1zeEuGEBIK/ukAppmfXDP8cGJMYZNvHoILMd7
         K/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbMVCbmXBUQ6os8XUFVGoTUHD4hxnKG69wfPsl9IkbJsU5tjO8MCtKUabAXjAicasFN/usRy8t0LskFdVy5goV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg99lrloqo0/J5Ut1w8QEK5zATc0bNWXpAY27rHDpxoOqxwu+M
	/w+RVVOW4vyewdPBNZHDdUiC58S7dwUYrA7Q04+fuS2xAKlHWQFxPIRy
X-Gm-Gg: ASbGncseYinrceq3yy4PX0QCff6QbxpzJy0n5igmGpcAwsOas77XnxqpYPox7dDqQHp
	7ObdJaohePEo9kv8q9GhgQye2NokN5IQIG62NgfzR8Do8JQmYnvpYOXKDDYGByZGmf5PvzT7bIY
	O5V9LyH6GDwP64iUcpm56qLewZ5nlYT8mPlTQK0hW426lRr9W2dP2xk8fRKB/88Jki7bErpHqCX
	uUoUqtiOsoS1GdrVWk1C39+ho+fobNPMglHuYRpHFpgdhlyWA58IkAWGdnltHcHjRWYoXIuMiFG
	pm+Ubo9eQv+vVV/c0l5N08arUH/vl5XBjlCqh+bJy+jabDRo/DkgIzggvy1bgaErucfInif0oDZ
	4sPpmLLX5BGUjCsHgpwUcVZTZdtG8au4Ysgi79SZRxgizfkVNekW+kipXYKsvvYCjbHQ5BwxF4J
	MpTg==
X-Google-Smtp-Source: AGHT+IFEpYnc1XKOtvTxu6uAAxg044+wAtgG0lAGsg41AxxCrDtrtzNsUPBwA6fhtq1RSc/6sEyECQ==
X-Received: by 2002:a05:6e02:2388:b0:3e3:e42f:279e with SMTP id e9e14a558f8ab-3e4161b6f2cmr101215625ab.15.1754193552837;
        Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
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
Subject: [PATCH v4 26/58] selftests-dyndbg: add test_mod_submod
Date: Sat,  2 Aug 2025 21:57:44 -0600
Message-ID: <20250803035816.603405-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205913_638488_58E984AA 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d8..09937dca3056d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.50.1


