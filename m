Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17809C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V80z3viJi/1rXBOV+LmIMGbRsmAIYZLeea8uFd5X4Y0=; b=dTeA62AK/uB2BFHu28tzcAVryb
	MfXwWv93IYslsgCW6+qcMs89oBICP44DutxX61OQ7EziquhIeedwVqUi6YqBvef4QRAI9Cb0m//Gs
	JCTISeKob1rm0lIWyFiViMl+bufHZNsSPGiTdZ9NPlxWJsag/AijzsnLA5Au14GT809bVOAXtsPXi
	42eDqf0GCpqueiw04v73bdCKYqfeXjmUy2DkHYIr7xIZ2dBR8GYVWShcDkxOGIRTVic2zXE4wvGX7
	LpdzOOXUoBiva/uMrqi4B1MtHfq/gq3IAdb+UF+033fkdYNzOfjkLtSOAkHf1uRga66J7EpxVUrFW
	pgpPB7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvblU-00000004pXJ-2wWv;
	Sun, 16 Aug 2026 14:23:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvblS-00000004pW2-1bHa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 14:23:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso21369325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890185; x=1787494985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V80z3viJi/1rXBOV+LmIMGbRsmAIYZLeea8uFd5X4Y0=;
        b=mZT1YMlqXEww8hM0pqvAjsxcZslxB7Y8ZugQ1vvCvWdbYclCS+izbDF0hTe8xr+sTC
         rHkgCLkOkBaHlUFlylVQfxiG/iIN2Vvkv9ErXoTCTFoNdx6sQwKokLkjXkgChKAlkkJk
         uySYIF6OWtYe82b5BpYY/whGcW6tN0Z6F3E7HrhzCe0iZMCUflx6d+UOAv6UKdz5SVGf
         kRR+PmDiHMJr40T2Cp0OjlC2f5oLlyWQtf6/RMZ1y2Bj43nnLSyWaqcazLEmAtv3FS5a
         dQlZPbq/7MFtNPQR+0zkS4oD5sS0sFsJbjniDSIBiZbqhl7sB71wlSJ3QYOYUxJ1H+20
         rkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890185; x=1787494985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V80z3viJi/1rXBOV+LmIMGbRsmAIYZLeea8uFd5X4Y0=;
        b=WYy4Jujj6DkPP46ceEWiftryatcslazKKQgVZ/9hHdBvqsZ24sZwSA0OIQIaSKK0yo
         4dGv48zXMcQ+1NUakFBN7xZSHkssflFuKXuP34GhgUd+JbA6/WDKuXN334/9PSCiUNwr
         Ut/JcoCDY2RgSUrbgzpx5WglmtGj3Ji016QZ/lqL0WZY+qyoHHZ9XKlHF72qX3WYd6wG
         falvzBJ3M6v3X6df4nHmqWaTvQECemm5+YCyw+Ue58jU2Wm4FEL4ztx4iLxUda8Mc/B7
         5/l/8A4tT+obdFil6ZrSBisMTylq7FKIG6Ch4UbCHArwV9qtBAerdV+BrA27rRdk2ijg
         8F6A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4O5T4ul1gXTMWueOasXJ3tfbKuKBg7Zub/HaU4UAKxs4eL0222HUkIJVqsMEBT71TSbCdbBwG09HIkdd9W6DL@lists.infradead.org
X-Gm-Message-State: AOJu0YwmI/oLQ07Z68cItvSo+6a6LGV5Gqw3JA7NDkyO/v5OeyLIRamD
	LMoMYPqKgaVzDBKdKOttvAM0fNqcxOrxHn1S50AUMOJvHc1BqFsYWmBs
X-Gm-Gg: AR+sD10gFze0aq+AUXiz0EsWU37fcLFk8yKvBMngaOSEqr51hNUGDA74o6iBvRpj0VD
	Pg5uK11ZS+KIJLxnZhCBuXnxGtXZOhBa8rxH/4DYPGdYaLpiZtN7x/PaMA3Cn02jc7wvh8Jj80n
	ODdFhPPLrSibiSgWlKUs+FOGQLWs+gD24ehJrmNoUCQ2ZAvg9Myo5/bCKzels7uEPboOgqNJ5So
	ErPp/jkGfwQ176pWHIj5q+FFOeOEmFbjeqCZHFdWVo0JnEQ2jvcLzsoHc1VN4Fw3lApH9h6cl9u
	/+O/Q3i1TlA/zxbiMeQYX4JYOlRTmAgc+vzbTEzV2RJqKA2OpBjDFLYYCOn0jKRBMSChGiTpz/Y
	WdewtNnbnSM0o0vk4L5z0Gx0gr0iK1rGE76SaCve2F6kYOTzrHBU4ainCUvXCZX52Hp/bEzIc+4
	U6JMJoXB5laBJscY5MNVouqiZXbEiCBF6s6/M4o3xvca/EL1iR/Ye0mOk6cDzFOgHVhAnJD9kcv
	cTzA1wJkQRlimUYxQ==
X-Received: by 2002:a17:902:ce8c:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d3b0d13bb8mr212666695ad.11.1786890185194;
        Sun, 16 Aug 2026 07:23:05 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc8199sm26102365ad.74.2026.08.16.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:23:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: will@kernel.org,
	mark.rutland@arm.com,
	sj@kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	kunwu.chan@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	"Lian Wang (ProcessMission)" <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [RFC PATCH 3/4] mm/damon/perf: add KUnit tests for the SPE record parser
Date: Sun, 16 Aug 2026 22:22:20 +0800
Message-ID: <20260816142222.689624-4-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816142222.689624-1-kunwu.chan@linux.dev>
References: <20260816142222.689624-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_072306_439737_4F9E597D 
X-CRM114-Status: GOOD (  20.76  )
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

From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>

Add byte-exact tests for load and store records, timestamp terminators,
multiple records, PAD and ALIGNMENT packets, extended addresses, invalid
extended headers, error resynchronization, and records without a virtual
address.

Cover ALIGNMENT packets at both odd and already aligned stream offsets.
Also verify that a record split across two AUX snapshots leaves the tail
unchanged until the terminating packet becomes available.

Co-developed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
---
 mm/damon/perf/spe_parser_test.c | 365 ++++++++++++++++++++++++++++++++
 1 file changed, 365 insertions(+)
 create mode 100644 mm/damon/perf/spe_parser_test.c

diff --git a/mm/damon/perf/spe_parser_test.c b/mm/damon/perf/spe_parser_test.c
new file mode 100644
index 000000000000..598d9fd7cdc7
--- /dev/null
+++ b/mm/damon/perf/spe_parser_test.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the DAMON perf ARM SPE record parser.
+ *
+ * Each parameterized case feeds a byte-exact SPE packet stream (same
+ * encodings and decode order as tools/perf/util/arm-spe-decoder) into
+ * spe_parse_one_record() and verifies the synthesized records, the
+ * return values, and the aux_tail accounting.  The loop mirrors
+ * spe_backend_drain() including the caller-side window shrink.
+ */
+
+#include <kunit/test.h>
+#include <linux/slab.h>
+
+#include "spe_parser.h"
+
+/**
+ * struct spe_parse_case - One parser test case.
+ * @name:	Parameter description (shown on failure).
+ * @stream:	Byte-exact SPE packet stream.
+ * @len:	@stream length.
+ * @exp_reports:	Expected SPE_PARSE_REPORT count.
+ * @exp_skips:		Expected SPE_PARSE_SKIP count.
+ * @exp_errors:		Expected SPE_PARSE_ERROR count.
+ * @exp_tail:		Expected st->aux_tail after the stream.
+ * @exp_va: Expected virtual address of the first REPORT record.
+ * @exp_tid: Expected tid of the first REPORT record.
+ * @exp_is_write: Expected access type of the first REPORT record.
+ */
+struct spe_parse_case {
+	const char *name;
+	const u8 *stream;
+	size_t len;
+	unsigned int exp_reports;
+	unsigned int exp_skips;
+	unsigned int exp_errors;
+	unsigned long exp_tail;
+	unsigned long exp_va;
+	u32 exp_tid;
+	bool exp_is_write;
+};
+
+static const u8 stream_store[] = {
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x01,					/* OP-TYPE: ST */
+	0x01,						/* END */
+};
+
+static const u8 stream_ts_load[] = {
+	0xb2, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x2000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x71, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* TIMESTAMP end */
+};
+
+static const u8 stream_two[] = {
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x01,					/* OP-TYPE: ST */
+	0x01,						/* END */
+	0xb2, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x2000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END */
+};
+
+static const u8 stream_pad[] = {
+	0x00, 0x00,					/* PAD prefix */
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x01,					/* OP-TYPE: ST */
+	0x01,						/* END */
+	0x00, 0x00, 0x00,				/* PAD padding */
+};
+
+static const u8 stream_alignment[] = {
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: tid 42, pos 0-4 */
+	0x20, 0x00,					/* ALIGNMENT at odd pos 5 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END */
+};
+
+static const u8 stream_alignment_aligned[] = {
+	0x20, 0x00,					/* ALIGNMENT at even pos 0 */
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END */
+};
+
+static const u8 stream_bad[] = {
+	0xff,						/* unknown header */
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x01,					/* OP-TYPE: ST */
+	0x01,						/* END */
+};
+
+static const u8 stream_skip[] = {
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END, no address */
+};
+
+static const u8 stream_other_pkts[] = {
+	0x42, 0x05,					/* EVENTS (width 1) */
+	0x43, 0x06,					/* DATA-SOURCE (width 1) */
+	0x98, 0x00, 0x00,				/* COUNTER (width 2) */
+	0xb2, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x3000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END */
+};
+
+static const u8 stream_truncated[] = {
+	0x66, 0x2a, 0x00, 0x00, 0x00,			/* CONTEXT: 64-bit EL1 tid=42 */
+	0xb2, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x1000 */
+	0x49, 0x01,					/* OP-TYPE: ST, no END */
+};
+
+static const u8 stream_truncated_packet[] = {
+	0xb2, 0x00, 0x10,				/* short 8-byte address */
+};
+
+static const u8 stream_ext_addr[] = {
+	0x20, 0xb2,					/* EXTENDED ADDRESS, DATA_VIRT */
+	0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* VA 0x4000 */
+	0x49, 0x00,					/* OP-TYPE: load */
+	0x01,						/* END */
+};
+
+static const u8 stream_invalid_extended[] = {
+	0x20, 0x42, 0x00,				/* invalid extended EVENTS */
+	0x01,						/* END after resync */
+};
+
+static const u8 stream_pad_only[] = {
+	0x00, 0x00, 0x00,
+};
+
+static const u8 stream_empty[] = { 0x00 };
+
+static const struct spe_parse_case spe_parse_cases[] = {
+	{
+		.name = "store record",
+		.stream = stream_store,
+		.len = sizeof(stream_store),
+		.exp_reports = 1,
+		.exp_tail = 17,
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = true,
+	},
+	{
+		.name = "load record with timestamp terminator",
+		.stream = stream_ts_load,
+		.len = sizeof(stream_ts_load),
+		.exp_reports = 1,
+		.exp_tail = 20,
+		.exp_va = 0x2000,
+		.exp_tid = 0,
+		.exp_is_write = false,
+	},
+	{
+		.name = "two records in one window",
+		.stream = stream_two,
+		.len = sizeof(stream_two),
+		.exp_reports = 2,
+		.exp_tail = 29,
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = true,
+	},
+	{
+		.name = "pad-wrapped record",
+		.stream = stream_pad,
+		.len = sizeof(stream_pad),
+		.exp_reports = 1,
+		.exp_tail = 22,
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = true,
+	},
+	{
+		.name = "alignment packet at odd position",
+		.stream = stream_alignment,
+		.len = sizeof(stream_alignment),
+		.exp_reports = 1,
+		.exp_tail = 19,
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = false,
+	},
+	{
+		.name = "alignment packet at aligned position",
+		.stream = stream_alignment_aligned,
+		.len = sizeof(stream_alignment_aligned),
+		.exp_reports = 1,
+		.exp_tail = sizeof(stream_alignment_aligned),
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = false,
+	},
+	{
+		.name = "bad packet resync",
+		.stream = stream_bad,
+		.len = sizeof(stream_bad),
+		.exp_reports = 1,
+		.exp_errors = 1,
+		.exp_tail = 18,
+		.exp_va = 0x1000,
+		.exp_tid = 42,
+		.exp_is_write = true,
+	},
+	{
+		.name = "record without address",
+		.stream = stream_skip,
+		.len = sizeof(stream_skip),
+		.exp_skips = 1,
+		.exp_tail = 3,
+	},
+	{
+		.name = "events/source/counter packets ignored",
+		.stream = stream_other_pkts,
+		.len = sizeof(stream_other_pkts),
+		.exp_reports = 1,
+		.exp_tail = 19,
+		.exp_va = 0x3000,
+		.exp_is_write = false,
+	},
+	{
+		.name = "truncated trailing record retained",
+		.stream = stream_truncated,
+		.len = sizeof(stream_truncated),
+		.exp_tail = 0,
+	},
+	{
+		.name = "truncated packet retained",
+		.stream = stream_truncated_packet,
+		.len = sizeof(stream_truncated_packet),
+		.exp_tail = 0,
+	},
+	{
+		.name = "extended address packet",
+		.stream = stream_ext_addr,
+		.len = sizeof(stream_ext_addr),
+		.exp_reports = 1,
+		.exp_tail = 13,
+		.exp_va = 0x4000,
+		.exp_is_write = false,
+	},
+	{
+		.name = "invalid extended header resync",
+		.stream = stream_invalid_extended,
+		.len = sizeof(stream_invalid_extended),
+		.exp_skips = 1,
+		.exp_errors = 1,
+		.exp_tail = sizeof(stream_invalid_extended),
+	},
+	{
+		.name = "pad-only window",
+		.stream = stream_pad_only,
+		.len = sizeof(stream_pad_only),
+		.exp_tail = 3,
+	},
+	{
+		.name = "empty window",
+		.stream = stream_empty,
+		.len = 0,
+		.exp_tail = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(spe_parse, spe_parse_cases, name);
+
+static void spe_parse_case_test(struct kunit *test)
+{
+	const struct spe_parse_case *tc = test->param_value;
+	struct spe_parser_state st = { 0 };
+	struct spe_record rec;
+	u8 *buf;
+	unsigned int reports = 0, skips = 0, errors = 0, guard = 0;
+	bool first_checked = false;
+
+	buf = kunit_kmalloc(test, tc->len ?: 1, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	memcpy(buf, tc->stream, tc->len);
+	st.win = buf;
+	st.win_size = tc->len;
+
+	while (guard++ < SPE_BUFFER_MAX_RECORDS) {
+		unsigned long tail0 = st.aux_tail;
+		unsigned long consumed;
+		int ret = spe_parse_one_record(&st, &rec);
+
+		if (ret == SPE_PARSE_NEED_MORE)
+			break;
+
+		/* caller-side window shrink, mirrors spe_backend_drain() */
+		consumed = st.aux_tail - tail0;
+		st.win_size -= consumed;
+		memmove(st.win, st.win + consumed, st.win_size);
+
+		switch (ret) {
+		case SPE_PARSE_REPORT:
+			reports++;
+			if (!first_checked) {
+				KUNIT_EXPECT_EQ(test, tc->exp_va, rec.va);
+				KUNIT_EXPECT_EQ(test, tc->exp_tid, rec.tid);
+				KUNIT_EXPECT_EQ(test, tc->exp_is_write,
+						rec.is_write);
+				first_checked = true;
+			}
+			break;
+		case SPE_PARSE_SKIP:
+			skips++;
+			break;
+		case SPE_PARSE_ERROR:
+			errors++;
+			break;
+		}
+	}
+
+	KUNIT_EXPECT_EQ(test, tc->exp_reports, reports);
+	KUNIT_EXPECT_EQ(test, tc->exp_skips, skips);
+	KUNIT_EXPECT_EQ(test, tc->exp_errors, errors);
+	KUNIT_EXPECT_EQ(test, tc->exp_tail, st.aux_tail);
+	KUNIT_EXPECT_EQ(test, tc->exp_tail, st.bytes);
+	KUNIT_EXPECT_EQ(test, tc->exp_reports, st.records);
+}
+
+static void spe_split_record_test(struct kunit *test)
+{
+	struct spe_parser_state st = {
+		.win = (u8 *)stream_store,
+		.win_size = sizeof(stream_store) - 1,
+	};
+	struct spe_record rec;
+	int ret;
+
+	ret = spe_parse_one_record(&st, &rec);
+	KUNIT_ASSERT_EQ(test, SPE_PARSE_NEED_MORE, ret);
+	KUNIT_EXPECT_EQ(test, 0UL, st.aux_tail);
+	KUNIT_EXPECT_EQ(test, 0UL, st.bytes);
+
+	/* The next AUX copy starts at the unchanged tail and includes END. */
+	st.win_size = sizeof(stream_store);
+	ret = spe_parse_one_record(&st, &rec);
+	KUNIT_ASSERT_EQ(test, SPE_PARSE_REPORT, ret);
+	KUNIT_EXPECT_EQ(test, (unsigned long)sizeof(stream_store),
+			st.aux_tail);
+	KUNIT_EXPECT_EQ(test, 0x1000UL, rec.va);
+	KUNIT_EXPECT_EQ(test, 42U, rec.tid);
+}
+
+static struct kunit_case spe_parser_test_cases[] = {
+	KUNIT_CASE_PARAM(spe_parse_case_test, spe_parse_gen_params),
+	KUNIT_CASE(spe_split_record_test),
+	{},
+};
+
+static struct kunit_suite spe_parser_test_suite = {
+	.name = "damon_perf_spe_parser",
+	.test_cases = spe_parser_test_cases,
+};
+
+kunit_test_suite(spe_parser_test_suite);
-- 
2.43.0


