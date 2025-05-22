Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C844BC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKVNMuDSduacbIBYKcZNnzCtGR0eRj8WvfLgYTzDz7M=; b=nXJPwqc2puqSpEyBGbl81Htr8W
	KC/h1K3lnpHwaobcu9B64eEO65BlZdqmnoHcqTNn42chxBLKRXxKKbJkarRARtdP45Kcd9rJxCwgm
	cttqkMqK5sd4b7u/1wsAaITFqHzpBhpdjGEVUVjoYLsxXYj5m49VHJS6QTvBT/VAUD18+0lD/wgqh
	J8G16w543K3Y1C+//C39akdpUxe8gJaqlC2p9tw05jyMiY5P5Ng74apK1PmihbLr1zLy2kb+7DSWB
	5rs/zzM/H0s0+0mJKDTmM4Z92+M7HpVtUWsNTQ9uvCfkAA752j1stCVMb96xVIfCYZRSr/mffG/hI
	C5KSqdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFNC-00000002Sy1-30E0;
	Thu, 22 May 2025 23:30:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIp-00000002Rhx-06zT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:26:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso108079605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956377; x=1748561177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKVNMuDSduacbIBYKcZNnzCtGR0eRj8WvfLgYTzDz7M=;
        b=3ZFZF0ru0QTrHqMviCYYp0IagfPrLH2Dyhix9DqKwP3dRlHk6BJG5iGbnHq+iFd3JK
         JZQg4JT6F6tazUo7zFkOsrWx5c+rCy2BplIpZ4C91BQAxXxOveKjL2bmR0WfEbxlFTtQ
         zo58hdeqtUATX15jltBv5T2r3ZhWeg6vNh4lOb/Rtt74DTEylemNlUnvZIgS5XtZ/4rR
         oz++Q4nLB0ETPxCsXaxrud61yYRElp3xsWKgF2hR62RBl6h70jsfz3DER0ojRTFfQC/w
         wZHlJao0lWzB4yx7eM2OqTKxjifBVUp84iTLhICRMzA3Nx2vzuQIwyUWG8ALl91dxf62
         53pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956377; x=1748561177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKVNMuDSduacbIBYKcZNnzCtGR0eRj8WvfLgYTzDz7M=;
        b=DhHh6MmOuaTEP50/4TrHHuYStOOlm5UITmbyfojkQH2PwASDgbqZuVdVatKw53LtlN
         QvnYcLVEn1mKze52HtB4HI+W5/j/dhoBwHJj1aaeK8WMIy5LBbU1HpNJpiqoAO5EDDYK
         bfy8lr3klswHWSX5mqQcVE4hOawNJbboYHQYkffS4OGvZBImBBHSOIzDpQGTNfbRtQAw
         tvLXdBQj/J0U/c24eYYPtZnGNZfoH3ws/vWPH7MgRp8ZgdBL1nG6iUbupefMQCDs9+GQ
         U3STXv5ntiIz117fwCp/tiyjZr0olbepKApj9+p3urAw3ePMzLetVhwJPmkeXBUxBIHl
         2r7w==
X-Forwarded-Encrypted: i=1; AJvYcCWNX5wsL5qzBgos5hk/7HAcgC5ekG34OD3Cw0CtH2nLw6mZ2b3kepaOkv0jhXMuBecq//5nvqZpEtBEBOak9xih@lists.infradead.org
X-Gm-Message-State: AOJu0YwoBkEu9RO5lD6PdhqeS8jyLYXBhaD3VNglP6rmA+rpD4eXckDo
	zmOummxACroN6WUwir2qWE84EXDDO5REG1/MvReZZqiQH7h534h4qaXS+as8odCCGg8=
X-Gm-Gg: ASbGncsCGs7H2CRcu9wywfssFlpfE3TVIEmhijpb5H9i80Pty1wU9RWIUSPAaaPnmwK
	vUxmyF4X4VDTCMjqLsLQw9BQhS8CjcCFrcx7TpVvmjcmwhNYUkN+/LxtMtlnKHOd0gmtyV64gSu
	yRy81Y5bQ3a7AQZpySlBEhtL2ssiZulhe31M9QvA9Tp4nQ9WXps4TGE+uNcEdEhILRW+6EKs8A5
	EDUrud4h5nt3WAVyjnGVDbIL0bnsS8zs7Jvz3oFU1Sd34OhPa8E9Q6x9bCfEQ+7j0hTcbLx8bth
	dmKVA0Tf0oGhiPfSDq+TY+kGxN5obSry8s2cHx9HleHtBVmjp9yQGQ==
X-Google-Smtp-Source: AGHT+IG6EHMwWLdGi5KKzk4nvM0cwE/VEL6TR7m61EKgB/eRoEgtVitn+rOSsP5hXJxsGHaL7N+kKQ==
X-Received: by 2002:a05:600c:8411:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-44b6d1d39b6mr6921755e9.8.1747956377309;
        Thu, 22 May 2025 16:26:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:17 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:07 +0100
Subject: [PATCH v3 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=1919;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=yRzc0icmCI3Wfp8FtEoLTbRp1C8aPjfzbWi+UvR2NUk=;
 b=eXHAPMGQUlSkoKw/ZujHfDdVrgUDThW/41UrEOojqu5cpgpKRvW3csxhNcSG5dQjunGp++UGp
 BxjZ3PfI7eeCjvpIQxYxdbhtwmDvg9UZA3QLufVRs12DfstYvvJmpYm
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_162619_102710_0EF11E60 
X-CRM114-Status: GOOD (  16.05  )
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

RISCV CTR extension supports a maximum depth of 256 last branch records.
Currently remove_loops() can only process 127 entries at max. This leads
to samples with more than 127 entries being skipped. This change simply
updates the remove_loops() logic to be able to process 256 entries.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 tools/perf/util/machine.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2d51badfbf2e2d1588fa4fdd42ef6c8fea35bf0e..5414528b9d336790decfb42a4f6a4da6c6b68b07 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2176,25 +2176,32 @@ static void save_iterations(struct iterations *iter,
 		iter->cycles += be[i].flags.cycles;
 }
 
-#define CHASHSZ 127
-#define CHASHBITS 7
-#define NO_ENTRY 0xff
+#define CHASHBITS 8
+#define NO_ENTRY 0xffU
 
-#define PERF_MAX_BRANCH_DEPTH 127
+#define PERF_MAX_BRANCH_DEPTH 256
 
 /* Remove loops. */
+/* Note: Last entry (i==ff) will never be checked against NO_ENTRY
+ * so it's safe to have an unsigned char array to process 256 entries
+ * without causing clash between last entry and NO_ENTRY value.
+ */
 static int remove_loops(struct branch_entry *l, int nr,
 			struct iterations *iter)
 {
 	int i, j, off;
-	unsigned char chash[CHASHSZ];
+	unsigned char chash[PERF_MAX_BRANCH_DEPTH];
 
 	memset(chash, NO_ENTRY, sizeof(chash));
 
-	BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
+	BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
 
 	for (i = 0; i < nr; i++) {
-		int h = hash_64(l[i].from, CHASHBITS) % CHASHSZ;
+		/* Remainder division by PERF_MAX_BRANCH_DEPTH is not
+		 * needed as hash_64 will anyway limit the hash
+		 * to CHASHBITS
+		 */
+		int h = hash_64(l[i].from, CHASHBITS);
 
 		/* no collision handling for now */
 		if (chash[h] == NO_ENTRY) {

-- 
2.43.0


