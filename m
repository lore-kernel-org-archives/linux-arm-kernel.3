Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5402E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=; b=DCtVGmB6qKiIeHtwIXvw9RG9TW
	ZT9whbOyvtwY9rRKOwnT/c+/q4qQ2ZQTNnoY4wE5EjrOyJx+snPvTtKf9z4yqtJf7lJsN2JCFieD4
	4LjIkehJb47tgALILdaPo9BElumRC1N+N2JWqRsqqnitD9o8EdrATMbSKQUI6HpdTcZVbaYQK0/zQ
	B3lSKFgzR+PX19+BOUhnObbCepnr2obSPPQTMzbD2MTLMj+DEcBuji+3pg9L7p/h5wtV2tlHWZ4UU
	I2CzjSG4hZ0lAavldEROF/Md6dajSMh3LiC3TPll02VOcAaX2MdgeD9uoPT5gU9OSYTKHstqQ5F8o
	iEnR1tMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2W0-0000000BobG-3qTW;
	Tue, 24 Dec 2024 10:51:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2PC-0000000BnEa-3QnI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2383326f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037089; x=1735641889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=;
        b=rzztVL5A5LQ4RFlKbPgOffcretxYTbblJmisyg1Iq0GK/IIGi/zcSKenr4V8a7y7N4
         Jn+Zz8joxrPJ2vBNhYvbWas0K31Zaov1XPn+bM6TJxLekyA7NJiFP2iRr5gI6e1/4Scu
         dlGK1FhGkhGnZa1Z9GVn08jH8qnTlMxeSp+vvbZsd+32XbZ0xvBC5IEBo98Ze3+ZBKdL
         srxicBgx+GTyFl0oy4kChSEqhHPHE6HGqjRefNpriXLy2D4SrKJs0lC0qJs6SVIH+vAi
         j4hZJfId2TPqUzVXxbkxK1+dY9zqS/iqAF2/xzJoXhTyzDJKXPJFWPcB2ODy9vekdfu7
         9Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037089; x=1735641889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=;
        b=rQWunSDJZ1yy4oQPJNougxajvqyA2Nz1LVs6yHZpV2dn+b5AxkcpNPTDPTil0Rv0/N
         gmPZKV/cJ+DpQY3KKaCAA7KVkinSZeuaNAEomkXvcE8nz+AdVTgKhcsriqXMBd9fIU5g
         IG2fUs3g2LqtF0Hol4PuQ8sj7JIiX8yKPO28ZL5yYfcZbN352h3mEBrvnff32+W+hfBc
         k1pKVAeQeuQ1AAeSpWkdWuKKM7buO+m2LVdwOcmvCYvUYlczhgNYoI79fvrh5hcJ2CqZ
         ThgxfufMsA+n+37akHDWn/D54jn6O6/E7/f7U5jTfsEYDeCMnPyuFho8WLLP61IyS7G6
         7pDQ==
X-Gm-Message-State: AOJu0Yw2J8zajj9EfYZZ7iBRBsbrp489PnyUSSBf/rhlRUIwwPLhX6VP
	oaKO1cYuBcktJdI49zDO+Wi93rGpMy8ftNta/YBdqsADYKamNqTV8QU02QDrYz77wG5RUVHrDZe
	q
X-Gm-Gg: ASbGncs4XjZxupo4IG7sBH0e5MrPc21ercAY2GN/V3PtGXL4E8AeGRPW3xdPP7+vzhD
	PQgOU828J6LgkNwP61wcM2tI2/3ZtNZFALC7YK5eGo+bc1GMl5RSTaVxKXYSaz4m1/DCNavJ4fI
	Kmdz+/+rjRrIQXVrPEjPYaitwsDJ/ZhXYoAG803FOcJPCj4zZ+oCIvCZjPqxRiV7z03jU375S/P
	6D/53IyIZQnzTeCk+Bw33fN/gYIBhClx3z5WiD7ACV0Pw7PLIFEoJk=
X-Google-Smtp-Source: AGHT+IH+dfpgTuFz+C7tBaq/J7Dc+pyrOC6X4KjPHRcroZadLExb0vNcsLRnA0H4zbAjsKClBUrHAA==
X-Received: by 2002:a5d:64ad:0:b0:385:e67d:9e0 with SMTP id ffacd0b85a97d-38a221ffe1bmr13551020f8f.29.1735037089043;
        Tue, 24 Dec 2024 02:44:49 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 4/5] perf test: arm_spe: Add test for discard mode
Date: Tue, 24 Dec 2024 10:44:11 +0000
Message-Id: <20241224104414.179365-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224104414.179365-1-james.clark@linaro.org>
References: <20241224104414.179365-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024450_867271_13F882AC 
X-CRM114-Status: GOOD (  12.73  )
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

Add a test that checks that there were no AUX or AUXTRACE events
recorded when discard mode is used.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_spe.sh | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/perf/tests/shell/test_arm_spe.sh b/tools/perf/tests/shell/test_arm_spe.sh
index 3258368634f7..a69aab70dd8a 100755
--- a/tools/perf/tests/shell/test_arm_spe.sh
+++ b/tools/perf/tests/shell/test_arm_spe.sh
@@ -107,7 +107,37 @@ arm_spe_system_wide_test() {
 	arm_spe_report "SPE system-wide testing" $err
 }
 
+arm_spe_discard_test() {
+	echo "SPE discard mode"
+
+	for f in /sys/bus/event_source/devices/arm_spe_*; do
+		if [ -e "$f/format/discard" ]; then
+			cpu=$(cut -c -1 "$f/cpumask")
+			break
+		fi
+	done
+
+	if [ -z $cpu ]; then
+		arm_spe_report "SPE discard mode not present" 2
+		return
+	fi
+
+	# Test can use wildcard SPE instance and Perf will only open the event
+	# on instances that have that format flag. But make sure the target
+	# runs on an instance with discard mode otherwise we're not testing
+	# anything.
+	perf record -o ${perfdata} -e arm_spe/discard/ -N -B --no-bpf-event \
+		-- taskset --cpu-list $cpu true
+
+	if perf report -i ${perfdata} --stats | grep 'AUX events\|AUXTRACE events'; then
+		arm_spe_report "SPE discard mode found unexpected data" 1
+	else
+		arm_spe_report "SPE discard mode" 0
+	fi
+}
+
 arm_spe_snapshot_test
 arm_spe_system_wide_test
+arm_spe_discard_test
 
 exit $glb_err
-- 
2.34.1


