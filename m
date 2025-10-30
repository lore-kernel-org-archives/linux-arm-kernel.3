Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9C6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxZjh+6I82hTza2DtIVssdtciAyGZkcTfqdDKbX1sDE=; b=fqwMUQVtv9hw0OGFsk0TkdlZQL
	LKn6UjKTEec83EP8KTBxNJ7zDVGju2iPlHDRQYZmqH7NwzBPvKkzvSh2LJ93WSpF2MVDm2wexqXby
	XAPN3bCeweSOu+Sd++zukL7LsvaWawOOThvEUg+d6CgAPNF4P0ttDikrfEdMCt1cuND4g8ckCA+Sg
	TvERkinw5f1sMGv8eMmWOGQr/vz9+sdXEZQMrmrPvfF27PbqCmgw013jvo5QuhL22y0Bzp5ealfhZ
	IlPmjWrcejBAAdSQlg/Du2+WvM9u86VJWtSPYTRDLTeDYGFeZ2cR0h+6zPiW6U/j40sfAiUMwn+yQ
	Y2dRfSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJZ-00000003PgW-2dMK;
	Thu, 30 Oct 2025 03:27:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJX-00000003PgA-15Wa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E0DF4062B;
	Thu, 30 Oct 2025 03:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE832C4CEF7;
	Thu, 30 Oct 2025 03:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761794821;
	bh=SXphE1jLb3wFqppQoQld5Ohr8cF1oZ+XHL4zOmC+eaY=;
	h=From:To:Cc:Subject:Date:From;
	b=bBmo+LXxow5I0N6qpT9R/QuwAxPhEshiyPu0zMuSx9Qbn7LrqwmqpddNzoxbMzFhU
	 GAaQjEyvIlUShsJt5pOE1ItbzdjWRyNzEYQDdO9WhUbvNsqbusibIVKZD6zcu9KU6V
	 1IhcreS+wb/Yka2S3C7EF3QWd6cT0giccnWMS8oM22PDzH1e9EA8DWT7DaHY/mqCPH
	 EuK9zOm7XsKEo/MjW20tH1ersojv1O81vS5PtkAfjdCiHxmt/yL29MFLQY4Od/HPy3
	 SMFcM3BPmptPJj9LmP9jSB7SvMoaxGOoOMUfq734bJv511Pbxd+N9xw2Y/fq+rGkuC
	 KiwFjYoymWPcA==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] tracing/wprobe: Fix to avoid inifinite watchpoint exception on arm64
Date: Thu, 30 Oct 2025 12:26:55 +0900
Message-ID: <176179481538.959775.12326313742393696258.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_202703_322532_CD81DBA1 
X-CRM114-Status: GOOD (  11.41  )
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

Hi,

Here are patches which fixes a wprobe bug reported by Mark Brown on
arm64[1]. The root cause was that the infinite watchpoint exception on
the same instruction, because arm64 watchpoint exception happens before
the memory access has done, it needs to configure a single-step after
calling overflow handler. It does that only for the default overflow
handlers, and not for custom overflow handler registered via
hw_breakpoint interface.

[1] https://lore.kernel.org/all/aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk/

To fix this issue, this series introduces default_overflow_compatible
flag in the perf_event and use it for identifying default overflow
handlers instead of checking handler functions everytime[1/2], and
set it in wprobe[2/2].

Thank you,

---

Masami Hiramatsu (Google) (2):
      perf: Introduce default_overflow_compatible flag
      tracing: wprobe: Make wprobe_handler default overflow_handler compatible


 include/linux/perf_event.h  |    9 ++-------
 kernel/events/core.c        |    2 ++
 kernel/trace/trace_wprobe.c |    7 +++++++
 3 files changed, 11 insertions(+), 7 deletions(-)

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

