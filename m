Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242F7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HrWq55URAvKiiWxGVqUqLNqZvZQb6ypA4Z1urQ/vII=; b=jwlD7nOdrra+YCBbRC3T3JdJQI
	m5IuaYYpzEou/gc5m6uKE+V3PbtPc/jmbjyPqaJlYRtxnpPb1tmkBgI52sFY+LQIoTGDWASq/P/5B
	cF1MfUCsp8QBVvbmSSDL4mCDPHjKsiYYqT6doJZUOWkRBBdMfyeGmI+/RobUCpJ4AWL8AzCycbqap
	4G4sVcWJ4ViBHX7O7XGvzZtmouu34xEli+lSFBuB8WxcLyONT8WXZkRjgBdssDTk1Kh19KoHYnkk3
	c+JIOGfd+k9oS5KukJGPDC8k4V88lV8KX6lc3RrvvwwdOda3pLVe6AowmgXwCPOa4C3zrTr5iih0S
	bDI8lJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKcy-000000036e3-3Hmx;
	Tue, 04 Mar 2025 05:15:36 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKSJ-000000034di-3Gzf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:36 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6f2b4c302e1so66937517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064674; x=1741669474; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HrWq55URAvKiiWxGVqUqLNqZvZQb6ypA4Z1urQ/vII=;
        b=ijr24nVmgcDZoXRWqYJO1YLXrIkv3t3mmm5nZ6N19lDT8BjgeKpYAX4Z4hZd5jXb9s
         y+YYcdPZ7kIviy51V1SzCbFSx178oA8/lVSuGs177z4l9PC/Esq0vyzTkQsjQhtdZIx7
         iae9tjyJV4Sb99tO4KUXvHgBVK8hj0MG91jlvbQLSkbxdlDN+i9uiqu78Bx2pCTSvSff
         15ehWGas+BJquCcHvUTaCqhe7NpvuABTij1pQy5rlNPP1/7IpR53VaRXxYTexv9l2jWl
         3zYIRgKdmUdyGhgUekBwiCcLKjUOoFShmIamLM02IGMX9VEJei4yso0zVHTDhqUY45l1
         EM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064674; x=1741669474;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HrWq55URAvKiiWxGVqUqLNqZvZQb6ypA4Z1urQ/vII=;
        b=wu5eFCT3jKkKvrzOacb+fg+ygfZVzEXOWLjqET92kDLXtnxBzMgXQseUhTjsIQ08Ys
         yz/iArHA5vzVJHngDjiQO0xAtYuetA5yY3fwgI08/NepVToSbDUd7Ymo6frC9run+Hdk
         srVUVGIeZij6Injl6Z0MIIOLb0Y2gFN8Vpp074/+OFcXzodSXymlYUKbP2W3mSqImFXd
         ppdYTM8TTXeD6RJ66UHoN0/i/iL2TgLarQWdEoDytJHw7Dueim4hcqpUY8JtKpWAngpv
         IiezcndTZWgezBLpaHMLwX6rsw7PYejjDVaK9ho4S+H+89pNZgYRC9kKk88AKd8cZhtZ
         GkGg==
X-Forwarded-Encrypted: i=1; AJvYcCUtC4oaqLXgVWilCuMU/0cH5vWfvECRuq7IJdGDjvbjpAd32YaC2gfHH7aui112HXkBlrEFouiCJaqxr48PtpKe@lists.infradead.org
X-Gm-Message-State: AOJu0YzKeuTsDfI9/Jve9eaof+AcTfMPkr7UOcrm1grcpr6B1En41aMm
	9XS2Pfld/hGEOOy52P4lUwx6vwfDmiRsIRa/3HTjJHMhapaWcfRYa+yMf/GLVS0/RtD+mTYWiDu
	VJnM6Iw==
X-Google-Smtp-Source: AGHT+IFL0x8xC/y2wFw3FqFrNIsftTveHeL/EEuR1YjkCALZ8KeNdylP7gyqiXAiPSfCe/J/KCIvusNGceBR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a05:690c:74c9:b0:6fb:451d:3409 with SMTP
 id 00721157ae682-6fd49e96116mr12079757b3.0.1741064674376; Mon, 03 Mar 2025
 21:04:34 -0800 (PST)
Date: Mon,  3 Mar 2025 21:03:00 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-7-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 06/11] perf dso: Add support for reading the e_machine type
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
X-CRM114-CacheID: sfid-20250303_210435_816152_AC8D5D13 
X-CRM114-Status: GOOD (  15.15  )
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/dso.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 5c6e85fdae0d..7f2f1af4f73b 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1170,6 +1170,60 @@ ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
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
+		if (pread(fd, &e_machine, sizeof(e_machine), 18) != sizeof(e_machine))
+			e_machine = EM_NONE;
+	}
+	pthread_mutex_unlock(&dso__data_open_lock);
+	return e_machine;
+}
+
 /**
  * dso__data_read_addr - Read data from dso address
  * @dso: dso object
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index f3ca2a5e7670..ba9b83db061a 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -818,6 +818,7 @@ int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 			      u64 offset, u8 *data, ssize_t size);
+uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
 			    struct machine *machine, u64 addr,
 			    u8 *data, ssize_t size);
-- 
2.48.1.711.g2feabab25a-goog


