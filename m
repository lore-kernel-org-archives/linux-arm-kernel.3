Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7919EC35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0QBY2Nw3ByVw59Pz+Hx1wvCamLOjPFqTULRDEzwjio=; b=PeN/MheHlFBbhdDDe2nSsMQCU/
	kykXEc+528m+0ojFPlSyJ5I82NRFgUkLKM8JRmRJ4CbKtipytEao0dT3Eh3bIxi3p1nS1/Qu6DZJQ
	LbQKKp1r7uq5fMtH4wdio6j4XIozvapvnthy84jtBg/eKEXGItc8VtiGeFDuKN9SHjZ82snXQs4EQ
	lAjpGWor9rg06yA++fiEOvTNdaiTVN9IbCP4I0ZcriZk+hryGmvhecnY+W4M9GxXEe/gt6uNPTPvH
	PATh+dWAIGb5snAgLTA8l4aE+yjoePRAwK0H8bxdAYzV2SebrQ7D0LDftCvvOx4Qawe+qMllZ2K2Q
	+6e+FIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEY-00000004bUH-36jy;
	Tue, 18 Mar 2025 04:07:18 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgY-00000004WCp-1D19
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:13 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e64124940abso3754070276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268729; x=1742873529; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0QBY2Nw3ByVw59Pz+Hx1wvCamLOjPFqTULRDEzwjio=;
        b=LHhDfaApK0I6wuKNGe8TTkxjGOjaB9L6dOH0QJI7gpOgcwuC1WJoIISucct3B4H+u5
         NH2UCK/dutd7ZJzKPe0yhLAv/dx6h4Vd220/AeKi6NJe2WNVY7Zo0EeYOKdBQ+IbJCwF
         hMebQ/dUepEDGehU3hfxmbMrYtmeWM0fZEIhKoKNexKIjJm6P5GCSAdOzmHmjjyaEZxh
         XVzzXpsbPF64VqVkaGXa0BOShu7B6gqie6hWZMW4CeHJwBhogzG/NuNcd0gvTtmh+KHj
         oIpMFWKVh5ys5M5yjxGWJgxJUGKW1tTQL3ctQJMEKAjtjD/MpMYovcBfnQCb903HGyfN
         6LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268729; x=1742873529;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0QBY2Nw3ByVw59Pz+Hx1wvCamLOjPFqTULRDEzwjio=;
        b=qdWwAXoPA6FyU/Ml3zwVR7gRXkk6p1jKgzvKIEDwKSFPJdB7jEcpFyF9St9rMJDUKM
         k4ULWR3R5vGjZzH9kjN7UvA+yTywnFTfcSc3lKupn4QdBT/ltwQdY5oULNmQjJ2myXY0
         8IH0WpMkPLtKQmFDhEoUb8o6oY4uAxVPGF3FmEq0uvG6EV/zzWierLPgjbtqzVYg97bx
         uV8IGMctssrQLF4ky8ZjccAJ9QPiYrR96SqML5CHc+Ty+Nki/3dWHhIMFLt/ck8jboAW
         0OYL56wBYcyGBzcWRDwRW/u5mQ7TGc5seSYUUAij5OVz+MF70/IIiKe7f4EMYX/p2Q52
         Yidg==
X-Forwarded-Encrypted: i=1; AJvYcCVivowQtfXZeYzNwwguwgWTClYlWPGrM3LkVkYixHb3fAG5Fdn2SHTwWl/Xnr5jUYqNBIPNgYD5/vrc4AHLbOTV@lists.infradead.org
X-Gm-Message-State: AOJu0YykfAJ2XN3fqaYxCABYxYvJsCpREOXj89XkmgTuRwg1mm+LlJbi
	xiUzUq7JSgHZ/ffLHvBllZCkz5kVXFxkSQ4C+X1m7CH1A7uVRQSAe+kx3oAqSfmEuumLVvBKb1l
	tlVPCrw==
X-Google-Smtp-Source: AGHT+IH3ZsA45Hh6AC985okMNJU3GA2gN9GLs2pTd3dhMU9xuvlE/Rp3C8qkGUhbDsx6HENWoPY55aGi1xZ6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:ae94:0:b0:e5d:a3bd:890a with SMTP id
 3f1490d57ef6-e63f64c348fmr7905276.1.1742268729109; Mon, 17 Mar 2025 20:32:09
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:43 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-7-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 06/13] perf dso: Add support for reading the e_machine type
 for a dso
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
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203210_327834_10545048 
X-CRM114-Status: GOOD (  18.64  )
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

For ELF file dsos read the e_machine from the ELF header. For kernel
types assume the e_machine matches the perf tool. In other cases
return EM_NONE.

When reading from the ELF header use DSO__SWAP that may need
dso->needs_swap initializing. Factor out dso__swap_init to allow this.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c        | 89 ++++++++++++++++++++++++++++++++++++
 tools/perf/util/dso.h        |  3 ++
 tools/perf/util/symbol-elf.c | 27 -----------
 3 files changed, 92 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 7576e8e24838..45da63d7315b 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1173,6 +1173,68 @@ ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 	return data_read_write_offset(dso, machine, offset, data, size, true);
 }
 
+uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
+{
+	uint16_t e_machine = EM_NONE;
+	int fd;
+
+	switch (dso__binary_type(dso)) {
+	case DSO_BINARY_TYPE__KALLSYMS:
+	case DSO_BINARY_TYPE__GUEST_KALLSYMS:
+	case DSO_BINARY_TYPE__VMLINUX:
+	case DSO_BINARY_TYPE__GUEST_VMLINUX:
+	case DSO_BINARY_TYPE__GUEST_KMODULE:
+	case DSO_BINARY_TYPE__GUEST_KMODULE_COMP:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP:
+	case DSO_BINARY_TYPE__KCORE:
+	case DSO_BINARY_TYPE__GUEST_KCORE:
+	case DSO_BINARY_TYPE__BPF_PROG_INFO:
+	case DSO_BINARY_TYPE__BPF_IMAGE:
+	case DSO_BINARY_TYPE__OOL:
+	case DSO_BINARY_TYPE__JAVA_JIT:
+		return EM_HOST;
+	case DSO_BINARY_TYPE__DEBUGLINK:
+	case DSO_BINARY_TYPE__BUILD_ID_CACHE:
+	case DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO:
+	case DSO_BINARY_TYPE__GNU_DEBUGDATA:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_DSO:
+	case DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO:
+	case DSO_BINARY_TYPE__FEDORA_DEBUGINFO:
+	case DSO_BINARY_TYPE__UBUNTU_DEBUGINFO:
+	case DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO:
+	case DSO_BINARY_TYPE__BUILDID_DEBUGINFO:
+		break;
+	case DSO_BINARY_TYPE__NOT_FOUND:
+	default:
+		return EM_NONE;
+	}
+
+	pthread_mutex_lock(&dso__data_open_lock);
+
+	/*
+	 * dso__data(dso)->fd might be closed if other thread opened another
+	 * file (dso) due to open file limit (RLIMIT_NOFILE).
+	 */
+	try_to_open_dso(dso, machine);
+	fd = dso__data(dso)->fd;
+	if (fd >= 0) {
+		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
+		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
+		if (dso__needs_swap(dso) == DSO_SWAP__UNSET) {
+			unsigned char eidata;
+
+			if (pread(fd, &eidata, sizeof(eidata), EI_DATA) == sizeof(eidata))
+				dso__swap_init(dso, eidata);
+		}
+		if (dso__needs_swap(dso) != DSO_SWAP__UNSET &&
+		    pread(fd, &e_machine, sizeof(e_machine), 18) == sizeof(e_machine))
+			e_machine = DSO__SWAP(dso, uint16_t, e_machine);
+	}
+	pthread_mutex_unlock(&dso__data_open_lock);
+	return e_machine;
+}
+
 /**
  * dso__data_read_addr - Read data from dso address
  * @dso: dso object
@@ -1528,6 +1590,33 @@ void dso__put(struct dso *dso)
 		RC_CHK_PUT(dso);
 }
 
+int dso__swap_init(struct dso *dso, unsigned char eidata)
+{
+	static unsigned int const endian = 1;
+
+	dso__set_needs_swap(dso, DSO_SWAP__NO);
+
+	switch (eidata) {
+	case ELFDATA2LSB:
+		/* We are big endian, DSO is little endian. */
+		if (*(unsigned char const *)&endian != 1)
+			dso__set_needs_swap(dso, DSO_SWAP__YES);
+		break;
+
+	case ELFDATA2MSB:
+		/* We are little endian, DSO is big endian. */
+		if (*(unsigned char const *)&endian != 0)
+			dso__set_needs_swap(dso, DSO_SWAP__YES);
+		break;
+
+	default:
+		pr_err("unrecognized DSO data encoding %d\n", eidata);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 void dso__set_build_id(struct dso *dso, struct build_id *bid)
 {
 	RC_CHK_ACCESS(dso)->bid = *bid;
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index fcb2898e0f49..0459d4e41b14 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -735,6 +735,8 @@ bool dso__sorted_by_name(const struct dso *dso);
 void dso__set_sorted_by_name(struct dso *dso);
 void dso__sort_by_name(struct dso *dso);
 
+int dso__swap_init(struct dso *dso, unsigned char eidata);
+
 void dso__set_build_id(struct dso *dso, struct build_id *bid);
 bool dso__build_id_equal(const struct dso *dso, struct build_id *bid);
 void dso__read_running_kernel_build_id(struct dso *dso,
@@ -823,6 +825,7 @@ int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 			      u64 offset, u8 *data, ssize_t size);
+uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
 			    struct machine *machine, u64 addr,
 			    u8 *data, ssize_t size);
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 3fa92697c457..fbf6d0f73af9 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1174,33 +1174,6 @@ int filename__read_debuglink(const char *filename, char *debuglink,
 
 #endif
 
-static int dso__swap_init(struct dso *dso, unsigned char eidata)
-{
-	static unsigned int const endian = 1;
-
-	dso__set_needs_swap(dso, DSO_SWAP__NO);
-
-	switch (eidata) {
-	case ELFDATA2LSB:
-		/* We are big endian, DSO is little endian. */
-		if (*(unsigned char const *)&endian != 1)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	case ELFDATA2MSB:
-		/* We are little endian, DSO is big endian. */
-		if (*(unsigned char const *)&endian != 0)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	default:
-		pr_err("unrecognized DSO data encoding %d\n", eidata);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 bool symsrc__possibly_runtime(struct symsrc *ss)
 {
 	return ss->dynsym || ss->opdsec;
-- 
2.49.0.rc1.451.g8f38331e32-goog


