Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C46C35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=; b=vcMI25fkOJHnRU20Z05G25Tsl3
	8vkMgOJN9WMDrtUN5JEuOrOayMBC3Htv0zw0vpn4as/oOTDAQndcaDEmGYLEcFuw6WXuJcrP8NuSH
	geevfZsf2/nuhBrRJGanqn7Y85QcIqMdRcbW6zNx3FuRhEZsY7LSdB7R088l6IA3qXoukfz09e/BH
	5D6jNxfUfr8eX0GUqW7JiH6astmBc6VPi3/IrcbfcqAML1zgwxv/i7Eb5GVM7dq0kZQj0QwG38OzF
	hKQNsNPHbaKunJFEgp7QfSoQ0SVwSWTFs2xhWwPV3LLeSc5a2p1b7VPO7eeybmKOKffMZpuSdpGyc
	t8+fF9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulxD-000000083S3-2PCQ;
	Wed, 19 Mar 2025 05:26:59 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf2-000000080u3-3FvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6fecdb96e52so91523357b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360891; x=1742965691; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=TtAjw1fs2dyWbSwhtvhj3+aLu+MH68kwAPrihpKNP7xUTflz2sBAfhZFnjx5jtgPj1
         aAJ+eX50sI3EDg7XxMPXRiRxEe2OiLsvD5MKaElXuwQy4jMgBrz5wMelo9WCY0wQV1TN
         vUiV2E8jEzkZlZTm1EuCbr+btPHNBDDEPHvbp0TzyPk6XKHIUV+XqhkfutLDBA6IuGfD
         ov8YlAg+0Uv4pRcG5w40XXTR4jTYNVjORMMlopULBkNPnBl+bJKNDEeofuftaKlR2/b/
         kO9cON+MEWrg/k+aoKyIyoJm/EyUd4EzfdzSHiWe/oVF4lyfXoxRWS70h5729gGrdXFV
         NVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360891; x=1742965691;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=NJHtbVfcE56WobFS8hqjRyhnQcKTDQf1o7jD/3Bq27EG8dluUcJJUin/nMYlxOPvYx
         Mn4/zKL0pwg31a3+SPOxCU1oGgqbgdOLtfd3M2XXHYJyk2w3sUZ3JTYlK9w2L3QtHW7D
         qvj7zoqEnlNjeCoNc4lgblyVuVunAzmm9GqBYgGLy1tlsuUwL2YHxucHbIc0BWR2epnb
         0oAXsqUMcSYzaLvc/36fqd908fhiUcsURYG6M0FTJ1HCm8GheSnYxyx4IatwArT8ru7s
         9m286PYxti9ZrMtbmtft0i6tS1vkWzVizoDyQ9nygbz8bbBppE/I0H1XjGL/+QYJyTkj
         vAcg==
X-Forwarded-Encrypted: i=1; AJvYcCXs5IXKvcw1nNFYSISkuIlZ6L5WwdaJLSKUepiUxCOjMhusjyZoaSsjkNfrc9Hh1uukhMGqk1euAVs5D/6XGivH@lists.infradead.org
X-Gm-Message-State: AOJu0YxySn4scwMcNirfvrFD3b/NXBmQ58b4ssYya9nE1OV8z5jYUtyI
	8pTvngOl9q7qKpV1oMcwOaam22yKin9eef0mq/rX9hZ/zyehPh14DXYWtYi15WYi9se22asvSpD
	eSVNlBw==
X-Google-Smtp-Source: AGHT+IE7t62G3L9y/1w7Zr4bPbVHFfW94O8jbx7xn/oloQNZ3Xii0SOFszp47Hze8CWLQYL2UBnV/ggmaf2X
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:690c:6501:b0:6ff:1fac:c4fd with SMTP
 id 00721157ae682-7009bf39905mr12697b3.2.1742360891193; Tue, 18 Mar 2025
 22:08:11 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:38 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-12-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 11/14] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250318_220812_808595_BC9E4724 
X-CRM114-Status: GOOD (  12.84  )
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

Arnd Bergmann described that MIPS system calls don't necessarily start
from 0 as an ABI prefix is applied:
https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
When decoding the "id" (aka system call number) for MIPS ignore values
greater-than 1000.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/syscalltbl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 4e6018e2e0b3..67a8ec10e9e4 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -46,6 +46,14 @@ const char *syscalltbl__name(int e_machine, int id)
 {
 	const struct syscalltbl *table = find_table(e_machine);
 
+	if (e_machine == EM_MIPS && id > 1000) {
+		/*
+		 * MIPS may encode the N32/64/O32 type in the high part of
+		 * syscall number. Mask this off if present. See the values of
+		 * __NR_N32_Linux, __NR_64_Linux, __NR_O32_Linux and __NR_Linux.
+		 */
+		id = id % 1000;
+	}
 	if (table && id >= 0 && id < table->num_to_name_len)
 		return table->num_to_name[id];
 	return NULL;
-- 
2.49.0.rc1.451.g8f38331e32-goog


