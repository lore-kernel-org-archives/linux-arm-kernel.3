Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D2AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=; b=YjpRDeTVYQKtQSiZM4kL1R8mB8
	zsj6xZl3wfGIcrjlA3KPuaYHFg4DoSZYlZHcbY+W04IEv9N/VdbbZVQd9F2URzTZasxymNfOvGAVB
	SHPtxFkJRdt1uBernDpNvg78v3/vHvXjvbB+0NoV39ekAWff2VzRaBM2vuX7o5c1W6tuy3k2bU7Uj
	Z5iDQnAhsEtzwCICIMxl1QDTcLeXEHPLz83AJHxGPKAInt4MwmDfO2Heu4iW0aEpVJA5nyjOEppIU
	Mmq03lfoHQnaSBbNDPbsjIiwb6nwPuRIaMR2dnNHbbEu4xWyNnXFTWjo0leMHFePVLs7kYvnZLEzF
	qpt5+3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAy-00000006YwU-03Pn;
	Thu, 22 Jan 2026 07:32:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAc-00000006YQK-0HW8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 07:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=; b=OtzuxbUF7lJiB02hLujziuEY1d
	Ap84YZDI5jvRep0Ee3EGcQxz4Ny93YjZieZpclhegq81Vwqu5ZPET1jShmFjeW40QXqTZJpKJrp5i
	4pFbuszwHmMaTWr/DtqQBxf+j46pH6POfERM58hHrRdt70Y1/Dv+yekmCmpQ8M1VRnAxMjOkEPqBY
	jc2gZ3wnAyuDsq/unw9G4KqTxGB8QpY64VYHuZj8kAKaL2Jj03Q2UdYwPRy7W++JNq071VbGunu0a
	ZDdgdvBsgCn2tcRDmAELNdLMnPFik1xaTDNlDpsySYXU9Iq4xhH3KX1kHI/+XQ8uRHnMO8w93rL5n
	Hwlubzpw==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAY-0000000HZq5-3VVC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:56 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b70bd4a2ccso3470493eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067111; x=1769671911; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=D7dQAhbNqMzpALG3F0CzAUhDj4Rl6gbpiztBKRaq2vxSlIKNQjnxfApaDgZhEHfHUY
         7WkrpHkcRgA5nR+LbKeK+Rh7SgPY6t6/JB+xGEVwCJjaJbPZ4B2RYu09bAgnLpbSiZqr
         vmRIo+OX4RG4IjfZQKZu9bhyAocFwxII0reANloLCG6NyLDnZjtUJMddCtpOsjhe9bve
         rRj9NN0sr6m+HPRj6LBiOGfpOZwcCbZZzX7jQQq8/nM8//NLQqcD/s/xzR2CbCjEmb3H
         ImemfrlI8428LAaeDQtaQH6nX9z09iEhO29DZrBiEnD6sYQwauT3DIBfrYhnT08C4vCV
         b2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067111; x=1769671911;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=arqY6fN21LUjfjHf21oRPmGwilEG/wQ8AYBHvp/TLYaczPEntU3jOB9C7yt8psA3NI
         UUI365/KC26AIGgbpqty6DlHGvFTDzZ2aRJYcERFWM1oFpO6U7aGGPBhf83BtONTLZoQ
         C9h0fWJQuI2PKiAdxvtnHK2S4oJfSZWVQ61c1NKs6R/13RkbgpBa4mcsh+7k53sJJdHy
         8qvl2ZRpcTWeup7iK18VDe3L52FZavj/tFUSAQ4uqNrvcMRB9diHlma6NPMpLd25599x
         CeYnn3sZZy1ReDLfAekhbvASSFxhacdBfa7Our34+JaGBrzI5z2I5OH2ydNsujZ7tdkQ
         Xl1A==
X-Forwarded-Encrypted: i=1; AJvYcCUvjloU6LE37Tzqw5rPmIPY6i7Uyc8OBpwKOYTutjGjaBSnXYrUCiHXTa67HjyLVH+G35jmG5w/MZBptR5M6iTs@lists.infradead.org
X-Gm-Message-State: AOJu0YzxNw9cXWT3/C6u/qQEDUVPC7JD/b5deZk0kY3rRQdGncLbxCtP
	Qjw9dwcvIl1jkpgzOEAcvhCbloXctOhGb9lDbVBEF+f0rv6r8nE85UmaXzHSU1yPXpPwltcLBQi
	7EJB5RaS+Xw==
X-Received: from dycoz10.prod.google.com ([2002:a05:7301:fc8a:b0:2b7:2358:5b16])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:4350:b0:2b7:f7f:6ad
 with SMTP id 5a478bee46e88-2b70f7f09f8mr3795608eec.26.1769067110372; Wed, 21
 Jan 2026 23:31:50 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:27 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-12-irogers@google.com>
Subject: [PATCH v1 11/11] perf disasm: Minor layout tweaks for struct arch
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
X-CRM114-CacheID: sfid-20260122_073154_920423_0335FBBF 
X-CRM114-Status: GOOD (  10.02  )
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


