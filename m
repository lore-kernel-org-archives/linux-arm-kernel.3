Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A4DF513E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=539R4WcAWVflmqEMddxOg3bYov+MI6a6nT4NY7eQniQ=; b=CUxNkwXfwCFvyaONzjSvAC4cUm
	8EImZpNID3BwGNYVBoKQJfTbzyUDwGluBH4eIbz3KLyE1eTZmLog8iEBNWlshu6/5loVELdTaRFGJ
	3jy7Hf0KfJDHWKrhBdEYRo6EAZZ8aTHh/ztANxcCwyJu5A7w5Mp3BYyxKd0HyRfHeobb8CVONmbBM
	Xd8Eeq0t/0rSW3WsZckP5z7e0Q5Sd8srTXxHeKMao1TJP9xYJVTnH66qeX/boyr7cu7gz2xflsO3U
	Nno9Tb+dhA6W1BsByIt3jbOxsoHWohKD+j6srmP6tfgpuIrLHlW0bBrCBO1GleZ7oQxb4mefPs6lQ
	wHD5hLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2r-00000002eKY-13i4;
	Thu, 05 Mar 2026 22:19:51 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2n-00000002eGN-0lhX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 22:19:46 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso9910548eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 14:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749183; x=1773353983; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=539R4WcAWVflmqEMddxOg3bYov+MI6a6nT4NY7eQniQ=;
        b=vpmddgfw/xsb3tkFcQ2M8m3Njp+g1EQ4gDPCcR0OrNOVhKs4dPAdqlM/nKasx+IDz/
         ILtcz3IpV6w3WNsFAo91QAn4xDAKRegfaCAbTgpBUiv8OZVRSGYsfdwqkzdauHkxdYeU
         zIvn9FfbO7mS1KuHIic9n+Ci091hrEY3ZvECljl3+0JnDq0rvVWHTJE5nzBsARWX4VJi
         T/c9xuXg/6ZYlU1/CAJWVyAdj9Mr2MD7IR9yOl654V+I6mKCX2WYtqC0wRPfnJj+2JL8
         QqFJSBIF2xabsqnmWKStgZ7gt1eQyG8PYAMezdNpulhqzoGLCX64vbDxz1CPsavZT+Jj
         Ymdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749183; x=1773353983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=539R4WcAWVflmqEMddxOg3bYov+MI6a6nT4NY7eQniQ=;
        b=HgsDOFYz04WtLXloVPgF1N11bzBDhC9DOk/oPay31TxyI61bLygBtgglEHdZ5poKpv
         1zWdSHod8sVOxZ8ZEW2/iKrFEaXcvkIX8SMz5Kk9mLUwW8/XjQBfgccO12SBcqcGd1b0
         KQAuewUJdsYPho7V5FZG9aUodaruslPcKadnmC/HrDPjp9Sx8998iTiuDb83ZMRh6lL8
         vyNVT15OUycwuVaBRdJCavckJtuQ4SOfTgYCS+uZW4aPgZzn2LYTkhrowdfiZZA8sa80
         gHwRsJUUbeWL8QZrvSwMvUHbbiFirsnDumFE1PMNXtDye+cGl2DuXhuNUKAokdnQD3nl
         0wRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHWkBUfk+HQg/WMaxm2ZG/55PNxiPf35l6N8YCX6ufX65R80R9GdVe8hiLmqpO1lLP+OLTAiHiyLlQ9yt3rYGb@lists.infradead.org
X-Gm-Message-State: AOJu0YxNoBEXl8tBQpF1Wu1eN7ZLeW8cESrsewJwFiJFfdZ9IsijuGWe
	Uz5YYzHEjgMmiOcKONNGcaRpo27DyeBbT2MD9aS2IGDEF1zC/RcMPb7I+ugM+yKOzltAXG7oqLz
	kJwhsm/vZOg==
X-Received: from dlbvv18.prod.google.com ([2002:a05:7022:5f12:b0:127:fa:7498])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:518:b0:127:5c54:a124
 with SMTP id a92af1059eb24-128c2e8efdbmr5966c88.31.1772749183172; Thu, 05 Mar
 2026 14:19:43 -0800 (PST)
Date: Thu,  5 Mar 2026 14:19:21 -0800
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305221927.3237145-3-irogers@google.com>
Subject: [PATCH v2 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: irogers@google.com
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_141945_215455_FAB8EB73 
X-CRM114-Status: GOOD (  10.07  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.473.g4a7958ca14-goog


