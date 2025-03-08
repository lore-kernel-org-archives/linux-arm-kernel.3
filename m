Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354B1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivnbhuhI/ixgKyNuqtV9wf0AaXG2gqT9U4XDml1DXZU=; b=zPTVdwEsLf37airmKvMHVNEiq8
	qcQjRRYpfa2T4216QcHgdQOcA3nM0mt+XOYm/ddCRxniExZr0Rr7kPRvCzgDxk5a3HYfBoaFQosoc
	ISjuyadaw8HkYJCQv50ZnJIgfEYPmYTvtBJBg8um1lkjfBAAT+3VGEzw0Pr10fV2KIQxGzgutBrrP
	8x37w0tIb1c2nQbw0EoHV2wZrQhnb0uiBNJUMe5+9lQEt+o0kQeK33fN5TzbJeMumwvxCD0fm8caG
	c0V5DnrjwUTIvJqvOX1uVc+uO+hXyQDnW+isKVecAW+uU/WiI73U+gLYj90ezvwmJNq1vqAkpLuGL
	DDjk6Mqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiAA-0000000Fv2A-3PQH;
	Sat, 08 Mar 2025 00:35:34 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi6z-0000000FuBo-0ea8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 00:32:18 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e572cd106f7so3648822276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 16:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741393935; x=1741998735; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivnbhuhI/ixgKyNuqtV9wf0AaXG2gqT9U4XDml1DXZU=;
        b=1BpmE79w4/bcB4wtfAwSp3iymDXzzOYYIf3yO4Hdh/928CfAD0SGvjGIIkB3o7fdmt
         W+dX6YPVhiC1JQ63f51A3TF9bvBILPnvWteqvz23T/xPYXHeW8cLIsWc/lewMS2jpE55
         8+/M0272e5PkKzvzAdRflrdWXyBb3eZUzXVQhIvVzZS9QoypHbhEt7EkwpTQlZN51+NR
         iCmQnVk7Cd3vcVaD2TMIJVsghVcPpvdw5XuTvu2O4rK63ZH8lnd0vvfFGYCGhYHLGye8
         PypnR8P5Ixw6SiZVB/x3cH7svuOmXTCB9gapGPv+3I0xuj6TBjctFpjbYbrcJnN7Bb++
         zo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393935; x=1741998735;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivnbhuhI/ixgKyNuqtV9wf0AaXG2gqT9U4XDml1DXZU=;
        b=qm3X2J6xeQBS9Xc4ad/zBfY+K9wzTe94vqqYAy+ibocgTjOmYsCa4vmPLLhUUWj8OP
         Eip8iZtqVmfU/2/SUi4RcTDuAULJ0swI8oG0mq8iYuGaAnWSwhcfOohJgZUEoi194scm
         OHNrzsga/hu5/tPnUz+LXTDgeC88xZCWfyav/4gw/Um5e+luEem+zWUU9T2aBK6dr90n
         KxmnhdtV7y/aSFWZbeCAJYwMIB0LllQgNTdypS6Ep48F9mfJgd4Lk5v9FIdRBYIlWHx9
         HOx2DMYBBLuYUxj+tKcMnYBU1hEhED6N0eRIkPrDfvyqOrJtQf/ACxoacHzSzbQfTjVO
         U32A==
X-Forwarded-Encrypted: i=1; AJvYcCUYbH+xHcBjWNezMa4dC+SVEotE4QJ02b+rgHIZfwfrjtfaKBhQG0uIxW9EJBXYku+iZWmz97B1ONaz2CKC2ArW@lists.infradead.org
X-Gm-Message-State: AOJu0YyCn7H/V6/+1bjd5OEA+mQUFg5Ch2jRNO1rIR/l5D1EYsr5v5fE
	jfPTjDvET7KfHDHa8fZMhJXxgg70NctRJ49D5i2VTCdlh8Wn/dGWw3a/8QgmiLpXL2Cl1OD5jMf
	yBLdVdg==
X-Google-Smtp-Source: AGHT+IG6YNEzBmSnRkSpppexP7sY3bjIUwdOpxoYGty73UlROUhquWw1r9gEA9sFFMJohI1jVlJGdzxY77PY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:1541:e490:aa80:5766])
 (user=irogers job=sendgmr) by 2002:a25:728a:0:b0:e60:96b9:bee8 with SMTP id
 3f1490d57ef6-e635c1ecad7mr49692276.7.1741393934929; Fri, 07 Mar 2025 16:32:14
 -0800 (PST)
Date: Fri,  7 Mar 2025 16:31:59 -0800
In-Reply-To: <20250308003209.234114-1-irogers@google.com>
Message-Id: <20250308003209.234114-2-irogers@google.com>
Mime-Version: 1.0
References: <20250308003209.234114-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v5 01/11] perf dso: Move libunwind dso_data variables into ifdef
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_163217_193109_0E72B89E 
X-CRM114-Status: GOOD (  11.88  )
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

The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
which is conditionally built on having libunwind support. Make the
variables conditional on libunwind support too.

Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index bb8e8f444054..dfd763a0bd9d 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -154,10 +154,12 @@ struct dso_data {
 	int		 status;
 	u32		 status_seen;
 	u64		 file_size;
+#ifdef HAVE_LIBUNWIND_SUPPORT
 	u64		 elf_base_addr;
 	u64		 debug_frame_offset;
 	u64		 eh_frame_hdr_addr;
 	u64		 eh_frame_hdr_offset;
+#endif
 };
 
 struct dso_bpf_prog {
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


