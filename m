Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107DDC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDDEzoWoa5gtdZT0dCTU0c/kQctboPT+cAXv3Hf+2Gc=; b=I4bDjOA65GbORbj3pwXhCPNaPi
	ccoKkiqt5m+8B/7dvb8M/99e/Q2VUfn6WLqv8CJceBQUkvps4GPlr4grFD0o0nxAlrMdKSdgcqjAe
	SA29Lpi1E1jIX88QWjFguLpqGz/benRlLga/r5gv3KPPsaa1MJBN+HTlJ2VaDWrDCQ/wKgY9A+96t
	sbi2002OxygPedbHXVdYtgekBrHqWJ0wX/94OeOK3xPdduZ7buXZTj5dUYIU4Kdx9fG2Dq+dS2ZtK
	a58buMHPvSIW2FXKeYOvamRS3wbreAaLiWVfy/hNAxgsNwIt15sxiguIxb8QIu4fLTNn2VBC89Tcv
	E6TiY6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq9-00000000g7P-2Uq5;
	Thu, 13 Aug 2026 12:47:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq7-00000000g75-361f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B5FA40467;
	Thu, 13 Aug 2026 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3CF9C2BCF7;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786625238;
	bh=n7IVb6P0SS6aP6osC/nBykNSX6nP62U+SXlK9oPNqXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YkIJT07Gng0CI7nmRkmGQZuDRu4wHmBhshprD3U8G5gtdniuae4HLQGPDoU7Gm5gw
	 N5auJIU7ASJ/fJd8jkmnH9SmDPJO67Pd0onSe5qmb2ETWwKO51axE0ZI3Isma3xiHx
	 AvJUrdczqxetXHNPvlArn4R+XCRUX1i0/vkAffgAhPx5cv74HR88U3Nd3NepQr9/I8
	 WXcXxrsvd5gBJhb5/HhgvRYXiQziIHwhrAsO4mQKXQMeO8VZi3Yvhs0ud/YDZsmxRO
	 QwDeGMcRC7uvLMMiC0F9VjLvUMwXpTCJhBo7cpKLA2MCSK88NVXlvX45aTRfV1nH2W
	 c0V12JSyYir/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B40C5DF66;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Date: Thu, 13 Aug 2026 20:47:17 +0800
Subject: [PATCH 2/2] coresight: etm-perf: reject events that exclude both
 kernel and user space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-coresight-fixes-v1-2-7411a73cd496@outlook.com>
References: <20260813-coresight-fixes-v1-0-7411a73cd496@outlook.com>
In-Reply-To: <20260813-coresight-fixes-v1-0-7411a73cd496@outlook.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=+tTlNVRe/rbkdxYJBnqH+Npz+BDYLaVAW6dG0DYxOHA=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrNo9V/8qvdfao3WvtOtYdOAkb6uwnkvsZyatrJ4vd
 rCYbatm74yOUhYGMS4GWTFFluMFl75Z+G7R3eKzJRlmDisTyBAGLk4BmIhJECPDgc9vbmQpNtmJ
 XTD+v6jq2sPba0Imm7hN2/zNkvN825NyVoZ/RjNW9jxpMdl84rbL75Dmz9v09B4ufSz9eJNcXlz
 q3EcmTAC2ok/O
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
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
Reply-To: moonafterrain@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Junrui Luo <moonafterrain@outlook.com>

etm_event_init() validates only attr.type, so a cs_etm event can be
opened with both attr.exclude_kernel and attr.exclude_user set. Both
config parsers assign rather than OR the mode bits, so
ETM_MODE_EXCL_KERN is discarded and only ETM_MODE_EXCL_USER survives.
A request to exclude the kernel therefore programs the tracer to
exclude user space and trace the kernel instead.

config->mode has several downstream consumers -- on ETMv4 the TRCVICTLR
ViewInst filter and the FEAT_TRF controls that exist to backstop it, on
ETMv3 the address comparator access type -- and they all derive that
same configuration from it. Since perf_event_open() skips
perf_allow_kernel() when attr.exclude_kernel is set, this potentially
lets an unprivileged user collect an instruction trace of kernel
execution in a per-task event's AUX buffer. The existing guards do not
catch it: etm4_config_trace_mode() warns on the combination but is
reachable only from sysfs, and the early return in
etm_config_trace_mode() can never fire because mode never holds both
bits.

Reject the combination in etm_event_init(), covering both tracer
generations at the single perf entry point.

Fixes: 882d5e112491 ("coresight: etm3x: implementing perf_enable/disable() API")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index af0295eab143..9cc93d48e970 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -185,6 +185,17 @@ static int etm_event_init(struct perf_event *event)
 		goto out;
 	}
 
+	/*
+	 * Excluding both kernel and user space is not a configuration the
+	 * tracers can express: etm_parse_event_config() and
+	 * etm4_parse_event_config() overwrite ETM_MODE_EXCL_KERN with
+	 * ETM_MODE_EXCL_USER, which ends up tracing the kernel instead.
+	 */
+	if (event->attr.exclude_kernel && event->attr.exclude_user) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	ret = etm_addr_filters_alloc(event);
 	if (ret)
 		goto out;

-- 
2.51.2



