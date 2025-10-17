Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02708CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeZdGoB1wdeQsYSdqOOmjncQkXCKTjuyHF/eufo1WSI=; b=TUQarH9ax/WCSgWyfXZjjTbA5S
	I9V0j3CO8Ii5g23fPdZeYm9MMD1LlLVDtgvMiemsVGIK606ST0J3Kzv5avSoOijmxoguUWVoqOfoV
	OcX4d1XfEOrzH6OcIXrwAuDIQkWxkl0o6m6yvToGfTpLF6HZDgwuSO1oAMQ87xBd6IeEB1HIe1uuG
	2Pxllt9Ra34mIvIQp+e8Ck7v5Vfd4oBoMUVl2H4lJF2o4+6cipT4hoPzE652mdQvxoDexJ88cvN1q
	iKAyAZ4TeapKqDouWmD2XbCAKEdDggWPZdj1Zh5ua0pN8mn3GUWU4jpzgk1P5v/j2KL0QbmA060mu
	hCpGxtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjO-00000008KGf-0SxA;
	Fri, 17 Oct 2025 15:51:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjL-00000008KFb-3i8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13D32646DF;
	Fri, 17 Oct 2025 15:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3D5C4CEE7;
	Fri, 17 Oct 2025 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760716258;
	bh=bjR/jZ5eEeoXbqkr8TsncxGQ/O/HMlqfQ8LXSbv3H24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H40V3ORSkabuix5Pf4Cl1gs6hYMPT5mEjGWDT+fCXQfRa6JmAU2x9JZQw4yJB9ynV
	 Zsb+oKeMSmAcp/wqGI0geBPRqT4fDrxGrXbHCikXNC5WmhTcfpR94JQhhB12RFmbhQ
	 IpmLPcnqhnw55AqusxQ75wCOqYr3DwI+C8s09IUE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Leo Yan <leo.yan@linaro.org>,
	German Gomez <german.gomez@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>,
	John Garry <john.garry@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 128/276] perf arm-spe: Save context ID in record
Date: Fri, 17 Oct 2025 16:53:41 +0200
Message-ID: <20251017145147.153470153@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145142.382145055@linuxfoundation.org>
References: <20251017145142.382145055@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: German Gomez <german.gomez@arm.com>

[ Upstream commit 169de64f5dc22d9984d45c1f119fb644fa16d64a ]

This patch is to save context ID in record, this will be used to set TID
for samples.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: German Gomez <german.gomez@arm.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: John Garry <john.garry@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20211111133625.193568-4-german.gomez@arm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: 039fd0634a06 ("perf arm_spe: Correct setting remote access")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 2 ++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 32fe41835fa68..3fc528c9270c2 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -151,6 +151,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 	u64 payload, ip;
 
 	memset(&decoder->record, 0x0, sizeof(decoder->record));
+	decoder->record.context_id = (u64)-1;
 
 	while (1) {
 		err = arm_spe_get_next_packet(decoder);
@@ -180,6 +181,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 		case ARM_SPE_COUNTER:
 			break;
 		case ARM_SPE_CONTEXT:
+			decoder->record.context_id = payload;
 			break;
 		case ARM_SPE_OP_TYPE:
 			if (idx == SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC) {
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 59bdb73096741..46a8556a9e956 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -38,6 +38,7 @@ struct arm_spe_record {
 	u64 timestamp;
 	u64 virt_addr;
 	u64 phys_addr;
+	u64 context_id;
 };
 
 struct arm_spe_insn;
-- 
2.51.0




