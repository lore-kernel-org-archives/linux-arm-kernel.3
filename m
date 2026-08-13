Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC9C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEMtB4MMyqpWx0NCbO02GoY/6Qds2bTUY/L3nLZe/z8=; b=pMZDT6/aQsBjPqCxY6zjsV6zHq
	S601NelATvHNkMisWDsAp0pn9djNh51adXR1TYeyB2t7lBTtnoc6Iemua1kyI/NXCn4la0K4/Ocds
	+AYB96VDBA/D8ryAhQUzrx3pCw4p1T4Rszz09zRoznx0z9D3APSRa4paKwUdmbr7q8XS8Qs1/6nNu
	Q5ksZ+8dYgrQ2+MJSNsWtdOmsXIvhdqRPl1vwef9eru6jn9R/76jz0+vJS8zv8ob8mGojpurN1cJ8
	lPIu2/CupU6JYUx7OWdHpUYX9OAuZskNLg6ruQMHIxl0snzQ7PIQQSW4xVhjK95XAB219SCju1Nzz
	hN1EdjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq9-00000000g7X-3AFC;
	Thu, 13 Aug 2026 12:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq8-00000000g77-24tz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E753600AF;
	Thu, 13 Aug 2026 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD72CC2BCF5;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786625238;
	bh=8kTH94Wcd0bVsOqfvvaM4yEZ3psYoK8Y+qCaQ46vfj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LYM6GFxYIcabDOggYt6z7uzARFMa2MLfF7clbLF/8Engsv7LwOolKd14PQ1s5FzRg
	 ZVFbn4Xnqx80VbQx8AnrsDgn7eo8sVoehfzg8WxUMZkBAL3doafHAEL6Y8zadY85qF
	 draxOaz0YVR2AXEBlrqWokxuDSdhJLgHuugCDacLEhOltdkoMcjc+rAKQMMfS8g42t
	 817xRURIbdnInrSQm5IWsR9+xVIBn0Tza0q0o2xc5RwcrQEtsgjdXygTCIDf/dcIpp
	 t0xVTV0uVEQ2mqbMes1wtGtcRgKSA3nIPny5Pom1YLmScmSilur/qv3PyZGDlXFNdT
	 J2uCuEEdHAJlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81C0C5CFCF;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Date: Thu, 13 Aug 2026 20:47:16 +0800
Subject: [PATCH 1/2] coresight: etm-perf: don't leak the AUX handle on
 failed resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-coresight-fixes-v1-1-7411a73cd496@outlook.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=yzAo1y/oAIoZDkd9ZQ7K7NSoBvEh92PgMNscnk7BIUA=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrNo9V+NKtQ37yzf+WmV9qneb7rEYSe/27bWH6rlyn
 yRK6apfN+ooZWEQ42KQFVNkOV5w6ZuF7xbdLT5bkmHmsDKBDGHg4hSAiTAcYmS4MtHziTrfiqXJ
 ly/X6ufezZidyXvyp0Y1V+WLORfWMHlcYvin/6D4RNsBvon8Txn9bvx0Fl9S+nZidJHdL/OudTW
 8Ic3MAMzmS7I=
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

etm_event_start() shares one error label between the initial start and
the PERF_EF_RESUME path. On the initial start, reaching 'fail' means
perf_aux_output_begin() has not succeeded, so marking the event
PERF_HES_STOPPED is correct. On resume, an AUX transaction opened by the
earlier successful start is still outstanding, and 'goto fail' jumps past
fail_end_stop, which would have ended it.

The following etm_event_stop() returns early on PERF_HES_STOPPED, ahead
of perf_aux_output_end(), coresight_disable_source() and
coresight_disable_path(). This leaks the AUX ring buffer reference and
leaves the sink, the remaining path elements and the trace ID held, so no
later session can use them. ctxt->event_data is cleared just above that
early return, so the leak is silent.

Make resume infallible as pt_event_start() does: leave hw.state alone so
the regular stop path still runs the full teardown. etm_event_resume()
already logs the failure.

Fixes: abffe22e93d7 ("coresight: perf: Support AUX trace pause and resume")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..af0295eab143 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -548,8 +548,13 @@ static void etm_event_start(struct perf_event *event, int flags)
 
 	if (flags & PERF_EF_RESUME) {
 		path = etm_event_get_ctxt_path(ctxt);
-		if (etm_event_resume(path) < 0)
-			goto fail;
+		/*
+		 * Don't mark the event stopped on failure: the AUX transaction
+		 * from the initial start is still live and etm_event_stop()
+		 * bails out early on PERF_HES_STOPPED, leaking it and the path.
+		 * etm_event_resume() already reports the error.
+		 */
+		etm_event_resume(path);
 		return;
 	}
 

-- 
2.51.2



