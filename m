Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B95D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uCGM6Q3XDMvaN1VElUtpeM4GPVTzty75wsztfb2rbY=; b=tsYyFLfah5CK1OkDp173jrpbYS
	93RNMmoOYwA0iOtn6jILeejfSasMLBKobbwc917AQ1TZhcoLyIJPlM3zPDDoQqttHJlXg6NFGQ53p
	zqWHJutwLBBVosFODk8YU98zYMgWIe+b1v9K4/1q9hxPZqFM310jcGhkhAEtkSqn7ZrKkjT0MB+AK
	XouAV4Lzi4mkLCzKiKZ/nKSWLDkHmq/I+8Q7Ic5eH++4AemuPT6SSJNfvoZLCY9LIp6+xckTvoWuP
	t9i9JJNKIesoizUDtmjR0S+KPIzAeLyVOO9XHCSJPtgDMdKd8kUqRxzQUUOd9lYnVcZ8aaD8b3yzy
	Xs2DQMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1z1-00000003QpN-1v2a;
	Mon, 01 Dec 2025 11:22:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yz-00000003Qnb-0q8G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A7E01595;
	Mon,  1 Dec 2025 03:22:09 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DDCB3F59E;
	Mon,  1 Dec 2025 03:22:14 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:53 +0000
Subject: [PATCH 03/19] coresight: trbe: Remove buffer disabling in
 trbe_handle_overflow()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-3-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=915;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VfCA2xij8QWg5fgbHHGPURuv0el1gynI6szJM+HB2gM=;
 b=NvAsNFDv9EktNPgNlt7jE4Vq/oSojP7+Zpm263ij1qv1aKjw9OdZ8wn5/U+WsXIYyLxV6Tg3h
 MBbs3Y9nF7nAHA8KocPCKyG6btzGt3FDSCrNGhjQ12VNAYoSLGxxsL/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032217_289981_9B517A52 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

When trbe_handle_overflow() runs, the buffer has already been disabled
and drained, so the duplicate operation is unnecessary.  Remove it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 2f44e4a65e0ee2b2c8fdd06a51ab01fc57f44a4e..f5597bd9b5fba9a8f5053d5823b03380fd468b5c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1077,7 +1077,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 		 * is able to detect this with a disconnected handle
 		 * (handle->event = NULL).
 		 */
-		trbe_drain_and_disable_local(buf->cpudata);
 		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
 		return -EINVAL;
 	}

-- 
2.34.1


