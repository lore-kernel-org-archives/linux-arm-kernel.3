Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DBCCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QI5pqrgQZausjaud47QeEyBjvOaVr93foW8MP2UsAr4=; b=MKKNJjvc1j2N6ivUqVlq14fIKQ
	/3u3XTy0ouH8GbdyCI1ehphFhtiEumVy6YR49W8BckvqIdxKb3LUz7lK3NtngT7xArehIeg4JRtcv
	t7LlSpgvOi+ugTpC8i/i9kAP6HbHprQvptFGBd66fUyt5jypZV/r93oGMwOciMEC7vCTEgx3mCnn7
	RQr4H2RTGXLZTr+pdELvnUVr3/kAPdJqQpc93LWeMhVCF8aoSpEfSWWI6v7+j6Qozu4Nv6Pq9ovNA
	ovFgL2o155qsSrKLFBhgFM4z706nAh5gV5d/Vsed30HR9OaCf/5jD59esYnX7+J4vdhJzMzoOmIEs
	424TJmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxOg-00000002u0t-0wn5;
	Tue, 26 May 2026 19:25:02 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxOd-00000002u08-1uy7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 19:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1779823499; x=1811359499;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QI5pqrgQZausjaud47QeEyBjvOaVr93foW8MP2UsAr4=;
  b=lEqCkPllPZXikwZ4RtW9/ArxKQBR2OSrdvbXHxUG4AMNw5+HqflY7u2r
   vNoevfPAiCrshLpSkjG+E3w1oQS+hMUDYPogwiN7Aa143oDaQ8ulOHW6q
   j+EW9Xf812rMElX4L7dpBxfym/JO4e4MD/Bq66G7M35hJRVb8AAYR1r5l
   hczIFqdp1oKlgo+hPYYEoY2bGAOxKQ+AfCkjJLlLsa4JhmP5KfPxN+c7J
   djgbrw6R68fVBYIcS9v4y4wUH9bS7O+KU6R8ujxsg2xW4OnHJcLDCRghG
   oENZzRCkW58dHxSvTYT/w1rBCiFArhs5xIAJmkKhyytfLOhhUADK3CJkT
   Q==;
X-CSE-ConnectionGUID: NpGOqmOKT4O8b/HvBdWj/g==
X-CSE-MsgGUID: QHubuRbaT4yEgHZ5sWUsoQ==
X-IronPort-AV: E=Sophos;i="6.24,170,1774310400"; 
   d="scan'208";a="20301174"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:24:55 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:5449]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.252:2525] with esmtp (Farcaster)
 id 752a9f20-8217-4266-8697-8272c09e7d45; Tue, 26 May 2026 19:24:55 +0000 (UTC)
X-Farcaster-Flow-ID: 752a9f20-8217-4266-8697-8272c09e7d45
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:24:53 +0000
Received: from dev-dsk-gyokhan-1b-83b48b3c.eu-west-1.amazon.com (10.13.234.1)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:24:52 +0000
From: Gyokhan Kochmarla <gyokhan@amazon.de>
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
CC: <lukas.bulwahn@redhat.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: [PATCH 6.12] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
Date: Tue, 26 May 2026 19:24:40 +0000
Message-ID: <20260526192440.81431-1-gyokhan@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.13.234.1]
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_122459_553023_C0512A95 
X-CRM114-Status: GOOD (  10.45  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

commit f458b2165d7ac0f2401fff48f19c8f864e7e1e38 upstream.

Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
various architecture Kconfig files. In the arm64 architecture, the commit
adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
config.

Remove selecting the replaced config. No functional change, just cleanup.

Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
Link: https://lore.kernel.org/r/20250117125522.99071-1-lukas.bulwahn@redhat.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f487c5e21e2f..d4ebdc16cdb4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -219,7 +219,6 @@ config ARM64
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_GRAPH_RETVAL
 	select HAVE_GCC_PLUGINS
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


