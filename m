Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB2CCD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qrijT18PORDPHteH+8XfOMHe0yAhvCoC3FXyTLIcWY=; b=rSrpu6ru50TV7pxfy0eZW+16/Q
	kgsgU1lW/zDwy1RLXSSmKoaKi4LdlRZrNzrchHYaNMRQEFdFQ0DrPtQ1WxaWzUrIjdQkA2fYixB3C
	Y+48Ju8d8SoxgVU1NE0TY1oA+SXBsIKOkhJKEKXnA/7ZoST2NGoqMMPJvo8bwW1q0Bc/GGpT7FYY3
	ba2KpkWwY01OeqxXUisScK4EZvgSLW7OH4+i07VQfm2wrHpG1ABlhHRpJf13M7JzNUMPXEo7Lwtz3
	hJuTL+4cXuSI4VAFEMkeR2JcyyJGAPGKLYbqFnKfqq1XDl3FJ0dMXN7H/35xf47O0ava/lyPERc1D
	9Qw3mjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZV8f-0000000Fwq9-1oqp;
	Tue, 16 Jun 2026 14:51:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZV8a-0000000FwnS-04da
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2877622C8;
	Tue, 16 Jun 2026 07:51:30 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE2353F915;
	Tue, 16 Jun 2026 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781621494; bh=D1FtZyXlzdlSZeEQumhz16VVUk8Y+LyL/Y9/6kB7zD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kiHDCyna1YuBsAkqxO5o8hL8Z0m0QJkr2Q2ip+8W0x310BX2GxkTK1akhnNzSOauV
	 dv4z+aOZPUK8PG9izOrkFuXqW1Igu/S53Ajhe21KABsE+Y/qUb/a3PjrISmB+lE7+M
	 +nYDXBIA37tNKglSihzFtSuyYpbYrBB/5BOXo8LE=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 16 Jun 2026 15:51:11 +0100
Subject: [PATCH v9 3/9] perf cs-etm: Decode ETE exception packets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-b4-arm_cs_callchain_support_v1-v9-3-f8fad931c413@arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
In-Reply-To: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781621481; l=2006;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=D1FtZyXlzdlSZeEQumhz16VVUk8Y+LyL/Y9/6kB7zD0=;
 b=iMw1E7D8BC1/IRvQ499H/TXaJmQC5gO0IvaD0O0CGeky7ITgycCDOz6er/yrdHB1T4vekAUbZ
 DGTcjkgFAc2A8MLMXUEn0twV/dp67KDqKq96hbG7JQIzsmVH4hEy55I
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_075136_160909_4570C87E 
X-CRM114-Status: GOOD (  10.67  )
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

ETE shares the same packet format as ETMv4, but exception decoding
handled ETMv4 packets only. As a result, ETE exception packets were
not classified.

Recognize the ETE magic for exception number decoding.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 42de2d82fd728bcc719adcab80670efa9859762f..e2c3d2efb5982136abf9295159acab04271897a0 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2181,7 +2181,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	 * HVC cases; need to check if it's SVC instruction based on
 	 * packet address.
 	 */
-	if (magic == __perf_cs_etmv4_magic) {
+	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
 		    cs_etm__is_svc_instr(etmq, tidq, prev_packet,
 					 prev_packet->end_addr))
@@ -2204,7 +2204,7 @@ static bool cs_etm__is_async_exception(struct cs_etm_traceid_queue *tidq,
 		    packet->exception_number == CS_ETMV3_EXC_FIQ)
 			return true;
 
-	if (magic == __perf_cs_etmv4_magic)
+	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic)
 		if (packet->exception_number == CS_ETMV4_EXC_RESET ||
 		    packet->exception_number == CS_ETMV4_EXC_DEBUG_HALT ||
 		    packet->exception_number == CS_ETMV4_EXC_SYSTEM_ERROR ||
@@ -2234,7 +2234,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 		    packet->exception_number == CS_ETMV3_EXC_GENERIC)
 			return true;
 
-	if (magic == __perf_cs_etmv4_magic) {
+	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
 		if (packet->exception_number == CS_ETMV4_EXC_TRAP ||
 		    packet->exception_number == CS_ETMV4_EXC_ALIGNMENT ||
 		    packet->exception_number == CS_ETMV4_EXC_INST_FAULT ||

-- 
2.34.1


