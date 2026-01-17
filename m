Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADCFC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqg+qXSoRLfoai7ZDLIZjszxPa5Zftw8iNvGyqINItg=; b=Hyuamcs0ccsv0Kh9f5YPuqCI9y
	1i5WZso7uh7CHE55k0iaG9OxoNkKiT3FGzZtWhJS1wniIe4EVPDRDyZpM8BpJftX6pI0atgdN7YNy
	J1/QuWvIrMqBbx+B5NSedmojwW6W+tPRZWLh/x6MBNVsl9TgLVx9XCiyrW9tHio/ERNI9LLTE5iWw
	hCJDLSQIhEanEBxia5mCWZpIn6Z7hX+Z4em4OOYYvACldjNmDNr6aDJTu9dt+ipNbNRJK0uD10+AW
	Boa3aL+KTbNO2JBbRqwrc98IGkABYLj0BWAACv5YN2cO3FzvduV+pmXbpZ8vrSQTPRjjvunKqHWLe
	dz8BubKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysZ-0000000FEdB-2Qg4;
	Sat, 17 Jan 2026 05:29:43 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysN-0000000FEPS-2nQl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:32 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1219f27037fso2971614c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627770; x=1769232570; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vqg+qXSoRLfoai7ZDLIZjszxPa5Zftw8iNvGyqINItg=;
        b=QJvOCRtiUZvkve3YLS3Slj8pT4K3zlEx5IGMDnAArbAz31Wb227rCKtRRzdOk6cTrw
         xl9LXlxU50nFgJIc1LzaSFarwVznPt3alp4sBuOODcsE8vx0oB6EJwVTX4CuGjUDfS5e
         ZPMFCAmFbOR1vz449IUsQ9E8x1neLOJWYQzENVou/hm9A46qjkjDb3mq74f3XutNbOpt
         KYhnSmIxrF+xT3qf/VyVVjcpsw4bJt9MrRjCvjysFJKVyDJQvFQj8H9RPMYYhiho8xRt
         V5j7V41P7x2nQkv5DFzQQ0gTf6lmdzwNNRLmVVuMYBXCBACll4pStVg9X07EFTlXa+PV
         ilrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627770; x=1769232570;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqg+qXSoRLfoai7ZDLIZjszxPa5Zftw8iNvGyqINItg=;
        b=bUf5VEdHuT5tJzTlv67q4JW2gMNINdohsCohpUpdkqc+NN3wXqzfiTvMxZlaGyjLvO
         38B/clkVLIQqbeYT1HykmhdL2LAcALcFg17RRFe/ZIjjGmOqcVlQGziKb4FzXFKCXIcJ
         fDerjZppdZPsXliyZQdbCBWBn4hCIua9ZFTUkbi9Odyzu3KY+Tgf67g1WzNlctMb3QcG
         BKBzO9m7iiOAs07s26wBRpcvYVvSNIlmXQOpLRYsEDor1aOfPAgs2Sd0oMYcLDfQgXEy
         zyyGp8EDgvK+jgQFPtcQkQCMhIS/T+NUPyW9BUCaKtsTzbt8s8Q6hHyzMk7bMKXyVTLm
         rovw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlvuSXkqoXkhgOuIxJAQYjmUl3E1lhIYoD7aLorA1Geug4Pat/ftrtZ041iibmp8OShgLoiueu8gHERqZq97L@lists.infradead.org
X-Gm-Message-State: AOJu0YzTu3pEPfBQ3QUpAIjiWfDhcXHMSmiw0IFegdBh0sB6MphjyzNN
	6QzbYcx0tOqF6kY8Dh9TeJ/DqvaUz5mnxTphJU1tSqtHL2uKb43H2nfy4X4Pg0WhYRNPD+Tw8c2
	VQPMkVepwWA==
X-Received: from dlbui3.prod.google.com ([2002:a05:7022:3d03:b0:11d:cfca:1df5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:438b:b0:11b:9386:7ecf
 with SMTP id a92af1059eb24-1244a75c5c6mr4763418c88.44.1768627770088; Fri, 16
 Jan 2026 21:29:30 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:32 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-7-irogers@google.com>
Subject: [PATCH v1 06/23] perf unwind-libdw: Correct argument to dwfl_attach_state
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212931_706073_B48CB2D7 
X-CRM114-Status: GOOD (  12.65  )
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

Argument is a pointer but EM_NONE (0) was being passed. Correct by
passing NULL.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/unwind-libdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index b2e194a8be39..dc882f17f52d 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -339,7 +339,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 	if (!callbacks)
 		goto out;
 
-	err = !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread), callbacks, ui);
+	err = !dwfl_attach_state(ui->dwfl, /*elf=*/NULL, thread__tid(thread), callbacks, ui);
 	if (err)
 		goto out;
 
-- 
2.52.0.457.g6b5491de43-goog


