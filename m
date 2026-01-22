Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26181D3EE92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=; b=AdxIeQkbqN0dDAyTsbiXwXE2T2
	lkmHtkCr2X0yCCX+ybvnShR/pR/ioOyD0SO4b93kNKvVu8px71HPulQ4uQ5nzLTF/VLXfxqWeJl/S
	5k+k88twvAKhw82Tg11p8X+9itWHV+WE//7fkWf2PuIX3N3cz6Fuj9FBowPEpTKSYdZUpzvShZwbx
	vm0V04V/gvlMpk3LsN0rh5sAHdj9SeU5MdL9OL3C6HGGSEiaZB786yBcyHLfF/fiNYhSOQNXOX/Eg
	KXkPToplK6yGiBLFqFEu/IrzwA2KpdeHUypcPCF50+QsCfZw9otVcUg8vIMIcfiTfr1q06pPJe9dC
	VAUWWHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixxJ-00000007U4Q-1MXp;
	Thu, 22 Jan 2026 16:54:49 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixx8-00000007Tqz-43O3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:40 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b70bd4a2ccso5366131eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100877; x=1769705677; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=zicpTwFjGkwg88JtcNkmkYY5l5aSiOqCw0aZkoJAayB4RE5GV1PLLi11coEaJ4hN8+
         LbwVzwx2uL9V/sDkUEaoD2hcJDvljHP+gpqvIpM0hsDrBF/nnoRsYhnCtCLbjXRE3nOJ
         qNuXTHEDTRFWGcU7mbezDq51hUni87CzlJjBiTqhUtJkSQ/nCrDlOwP+TJ4XCVp0LqoY
         lqV7cHAaODVaht2+E2fJhUJeZKmdSLS/6Bo+eIrXHGcxK1gSz/aPaKLA9/nUyZkLH/CD
         8PAqYUm+vxRgnhCIAlUUYctPjLxRCUQSztMcCK7CGOIkt8a3qbk9i504JY4cV435PtXL
         Np/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100877; x=1769705677;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=rFH/aheJ4PpQYYsGb0l5D5DznRfcenBNClf6iUyx4vyyAG+ngM7mzSnUXLoBEE1jIq
         1bqy/7iqhOlapB/7ZEDqUJWv7+XCCKNLnAVo+iu7R95W9zCfIzFUCuw7V43REZWiZBA2
         6XzwPIdknDx8qzTTc/MrCHgjBAGwwQERW4dAu5VpxPG2LVtnX6dkdW3TsQ29XjdnFKPn
         cUBlCM1yy7vmaXSho2k4nfS//4QxqsN+S37UmXAVfMBJjm84SrGD7LQhMve4FoDFKv4Q
         0pphYsgPhxigxMKX26D//exAINhEF9hAwrst5H2mnl/8JC0JT+Jh6iHosoN0ctfopciY
         dslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVliuce+HGPonwfMO56Ha4cGal9benI4/n+Ghe8FCkNLBTv2wWkVjM/Lo7ZekzwbtqQzIa9eNV9x2qFaglujrxL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxle0RBljM52ONLReU2EAYBwVl6NzVbblw9MOHUssfeNeb6X6S
	semrwltFUIWaeGIecLuKJJk1E0MrvzQvXSBwU4MRcTcbqsyo2eDgn4H4NmyuIm+D+9k5L8vJnFW
	mK4bWf37PPg==
X-Received: from dlbph24.prod.google.com ([2002:a05:7022:3718:b0:121:766b:11e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b94:b0:11b:8f02:a876
 with SMTP id a92af1059eb24-1244a75eb07mr15601672c88.23.1769100877336; Thu, 22
 Jan 2026 08:54:37 -0800 (PST)
Date: Thu, 22 Jan 2026 08:54:07 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-13-irogers@google.com>
Subject: [PATCH v2 12/12] perf disasm: Minor layout tweaks for struct arch
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_085439_012465_8C9EDA7F 
X-CRM114-Status: GOOD (  12.94  )
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

Pack some holes to bring down the overall struct size from 96 to 88
bytes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2793d48aa04e..6a1905f9d4fc 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -18,22 +18,22 @@ struct type_state;
 struct disasm_line;
 
 struct e_machine_and_e_flags {
-	uint16_t e_machine;
 	uint32_t e_flags;
+	uint16_t e_machine;
 };
 
 struct arch {
-	/** @id: ELF machine and flags associated with arch. */
-	struct e_machine_and_e_flags id;
 	/** @name: name such as "x86" or "powerpc". */
 	const char		*name;
 	const struct ins	*instructions;
 	size_t			nr_instructions;
 	size_t			nr_instructions_allocated;
-	bool			sorted_instructions;
 	const char		*insn_suffix;
 	unsigned int		model;
 	unsigned int		family;
+	/** @id: ELF machine and flags associated with arch. */
+	struct e_machine_and_e_flags id;
+	bool			sorted_instructions;
 	struct		{
 		char comment_char;
 		char skip_functions_char;
-- 
2.52.0.457.g6b5491de43-goog


