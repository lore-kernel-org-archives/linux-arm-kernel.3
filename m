Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B02DD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=; b=OnmKCZHncf/dSL0orr7nzFvbrP
	SFtgcABWVp9jKKlMt+u0iRDriMtxy1OR7HSBsmiMEE7vbX5T7P+Z7p1NlmHrleX4N+VOLb0+dcc/N
	TtKGYW67jDsFK9ysF6uOx9duBZFOOtUzpskFEETfKWzkFZVhO5oLC7FQJMvcZeSc0jSBDwoW2I9n9
	Nydt5t9SuQ3OQvQGTmtKG/fym+QW+ajMHE+cLfrA9md/dX1N6sD1fbs8N1Eqas/CMOygi3RKpslhJ
	vdGn2Z07btAYslNeq9S0SRq8DsCR+fr1ZfObFmVwf51lCbSHef8Cfz/U4udbICg95nDGxzQ7cdp8R
	b4f/3aqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbGm-0000000DR7x-1VZZ;
	Mon, 22 Dec 2025 08:27:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbGk-0000000DR7U-0tR8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:27:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4488870b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392073; x=1766996873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=AMW7tVzJfez3oaClGcaRczcGpK/JBVKHd4tT9VpEa8YITEMdiHMlr73FfGKmhHVSzc
         AmODbkeOuKbOYKFUQa9HsnRydnvOk3ywqATDO6/yW0Vc/FpO22tV3GHqs3ywXhyIBKoN
         B8qjra1qmYhf7awbZniRdchHowK9Tgk58ClhOjkFgGEbTgFE9UfKB1MDXoy7aYluHSvi
         aL54cPqjr5Do5yoG5v/nQ/zl4ROpJ1EMDDawMu42BiK8bJE/f5PmHr9OlxeVdRcXLQ8Q
         M62S9gfdr0G1+KeCGRN5R9Ia3Dtxpz+0duqynLgN9PlaIXfJOn6bwWBzJmh0gpEkS2x6
         QkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392073; x=1766996873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=bkIZDNQosMgk/O7o4u8oMTunUlBsXUcMJBpGh0MZ2QjQT1Kkcrs0H+wSiIEqxUAg7M
         +NPjjO5C7I1TNWxxfWtu+2Qc0OOR+ixjZh8nKOsztqgTTdnyAH71XvIQwuLvJ0LKXxjN
         sNUUXoA7RC06Eqi6n148oYiHIUzZ3uqtwDLKW9XbYChEN5fljXt6QeQWuoT/B2JFU4Q+
         pf23Obgk+82NsjdfPXX9dJUxGmQqHLKhQDM/fDxtpoABa76wQPFQmYgQvoR7dE1fyxMQ
         18v7bX/lLuop30RB759+0jrzGl5Ih7qx2/ek7a4Cch83Ut7QYFhP+abfl+uYx83uiuIv
         VjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNOJ8zQkq/Z8YM+duekVX8/niIFWoi0dFyi85rQwP3fSMuvEUzcFm0yrURjHdlmmBzp9ZXwJqawTWsEha7U7r7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VjR7tGRYCkwheijSYk7tRXOHBAi+qW0VihF4f6DR91wNsLku
	n3ngTwU7CoK4wAfymSBoKeFWnFSaoBOl6RLl//ss3u/k3ZTFPzC5g7Ih
X-Gm-Gg: AY/fxX6zmOcQaO+jBo6KxDAItRZC97CmnzcsYskhu1iYpTOXXemAHH2kdr0cGkcDEMj
	KWc5z7U0vpWshrJG/zYgVkMSdoNX6x3VsxGMGBHX88WuLMNQo+l+JBIPNV1O4lCOpdaPCY3T34n
	NeGuKRQnlCUtAOKl+iAKB4X+BW2BYgsV90Bv8iHpRUI3BObtz1qmWLx8En9gmK3ttbADO4b5Cg5
	KHdmk0BEjwdf9ojqBxCBahT5vWrofVEyALBshBqiB5l6HVCja//pZMJrSYHADyiPJbf4kUVkgx0
	yk1fznNzlY3cOSKkunfA6OWGgJ24ROGE4HTUqBD3vGMt4ioBBUBfh7qlDIi23D487nyy11MvNH7
	0glzMViWepK7usQzG3jX1vH8J5huIRCnA3oiLuoC9lkHT2IsvT5ZIx9ZBXC9yJs9RgR7Z85Zm4P
	Vqv8Gaqqbs
X-Google-Smtp-Source: AGHT+IHrWaoINwKINIS2uQVVYNVnFRipbIxAPkhOusVnBjYyr1lqJHYW+COkqDtcwbbrVKaUvl+ojg==
X-Received: by 2002:a05:6a00:aa82:b0:7a9:c21a:55b4 with SMTP id d2e1a72fcca58-7ff657a6a53mr9191153b3a.28.1766392073152;
        Mon, 22 Dec 2025 00:27:53 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:27:52 -0800 (PST)
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
Subject: [PATCH v7 28/31] selftests-dyndbg: add test_mod_submod
Date: Mon, 22 Dec 2025 21:20:45 +1300
Message-ID: <20251222082049.1782440-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002754_289486_229410C3 
X-CRM114-Status: UNSURE (   9.02  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
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
2.52.0


