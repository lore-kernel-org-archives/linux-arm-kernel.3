Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF12E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=; b=FuIxGzPnPLi5/tgBvcocLcxxfH
	6/8JV/aQSxEZmfp3XzIy8b/A1XaRcRJecYyaN4XwyfQvdPr+ffCLm3399m6cq9UZuPaavk2d0ieEA
	SIkYH0r9mqU066Ajoib+truxGkz9Z0HxQfSkSu/komYtPChiwVcYALpHHiize3GdFifXn5b+sj1Za
	+zA4/bowbLc+HK34O9LzWVmJnRnAl3S4shEbecbvcmaJ/cVrM3XRkQD/XQRArwWN6vj/FDPk+L0bx
	9D2nXBDCT/AFfqay3xMweqVomAYifz6IXcDVvSSKagigdxLSz4IgXwPSvwdRJRSpoedA57g2dZvx5
	gqfWyraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXBi-00000008ohW-0EJO;
	Wed, 08 Jan 2025 14:37:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4t-00000008nKa-2Uom
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436a39e4891so64972205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346634; x=1736951434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=;
        b=z4GnqXSXyiRrYrflUb+WaxPBHPKV5zjojWWNnQYbRQ2A3b/S5Czf+vnM/9BP/Q3EZM
         /UDZDZds6iugbj/+IPzLhyNO6YKM6XxqzYCkEmmg3kGJmJ5XGlsN6mmAwQtQ+PtJf8n/
         eNr2ExHdktZwYwZQtBgMtfGkX4Vpve2Kjci9namFtrJpaaHvTckVj1TrIBTSo2yk8UnX
         3KthQqz1PuiE4+g/uIOh2dLDKwy2GCWfjKi58PmioQ58lHh87ybAsKzyq2JgcsJCyV1H
         92M133XhzLpnOy20mCcAJ60xxif0OehEBMWRMRI+l1VCtatOG8VAHjOlWd1unNt/Y53W
         aTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346634; x=1736951434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1j+BIbB70BfH6p+H3D0C/f2KwCH22I9fsAuqIEouAI=;
        b=ZZu8+oqBJX5VlKAM/ZqvfRA+c39hRxFwKMrnnWBjSJ6tySuQ9ykNeqe2IwCQTk5jVR
         R5E3gYSf/K8n2Y7YMz2Erdsdu3E8jjdC6tlzZOTMYHiDQrdrdjVbctvkRJ1vDgeGk4JY
         cC5nBJThcJwvLM+xXaJyrKZihsbr3MdkG06MZcwfAs/HqYh9UiMH35CBMO1g0t27jycQ
         CX1cawqS8nlcqnbGL/ntc8z2CReOVXPDYTjGVxHZ32hhnD8ndTUifg52j0pBpkyyIu5Z
         VAaj0N3i0tFyim22AjTF8BtFIFntwn2sphoimRaGscR+QokJtXUwbFAyCBg2qd8y5rXm
         +V1A==
X-Gm-Message-State: AOJu0YyuYnXKzCmZ8ugpHq8HTVsSLfb+ne4HGXXEAtBawJSu117CMq2f
	cUdp1s6T1yeWx0kED7lTYdZDDbJUftmFSuq7hT43mJIcmjBSK7DLxFCSYumkFJ4A2a/oaZ/ffmZ
	K
X-Gm-Gg: ASbGncucU1NHjUrCG2S83vZWXwZATdjmtgufptjzbKXaae7bPm/gXZN+KuXpxrFCGXw
	x48ExWORY9fI5TkuTSXka/8nPhXT5Gq7CaNWtK1X7+uEaPXUAQGmQTVsNkIXETnJOw9QVWqNTb/
	ic3m7ShcDWHq/AEv8mCAYfP5Cn6oXAQrO5OCDkfKGLsYcCAHXAq8ixLylFr0ap47eAXLPG55wLb
	4pKSDOasJ8bJg1bY1B3V+CpAbC325ThNA0MEcTAMSUP9VtARK6GfLjv
X-Google-Smtp-Source: AGHT+IGPG2fbcdAWI2kWNuJul9oexF8hk5Ad1KOrWrlN7IkVYSCPH+BLbdTguMj87I9RIg+5zb7CeQ==
X-Received: by 2002:a5d:47a3:0:b0:38a:4184:2510 with SMTP id ffacd0b85a97d-38a872db629mr2716682f8f.23.1736346634083;
        Wed, 08 Jan 2025 06:30:34 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 5/5] perf test: arm_spe: Add test for discard mode
Date: Wed,  8 Jan 2025 14:29:00 +0000
Message-Id: <20250108142904.401139-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063035_628753_F24DEE38 
X-CRM114-Status: GOOD (  12.50  )
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


