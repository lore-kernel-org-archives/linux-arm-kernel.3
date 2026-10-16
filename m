Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E8CCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=to7mwHK1lN5sId7RilOvmjeNe0FkovVqKdPKa0bhFk8=; b=Qrdp5S9JbxX4MUhLaX9Sdxl6Ud
	sf284esKPzIJUrgPldlRczMR5P8m3hy1on/6H5qE3LxHFU1R5TANiWh9V22IrcFj0NwWHunGMs4OF
	SU82AxPDOMQIL2DQN8QpLG2zvdL9oN07xuhXhDjQMgW7ZH4t73tdxqrTkewS9VUr4OhYYBZ4KLV1/
	PCtCCee7sBrbyApFh0sW1rS0jiC7Z8OwrVbmoEnqB4gKd+Rpecwp7QNP9OiUi25YAMne3nes6I7ow
	YIu1SamM58v4LNGMGpRJIFYyAKYazxLwIWdwLowBlluSClgNdbTdWQ7DymERuY0iHs93A8NPDQ7Su
	OkTykh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDz-00000003UPN-2XZy;
	Fri, 16 Oct 2026 16:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDc-00000003U3Q-3Pgm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=to7mwHK1lN5sId7RilOvmjeNe0FkovVqKdPKa0bhFk8=; b=d+YWYvuNik9gfKosM2ZYkPbkTP
	TyPxsIgCCpBIWCZMTQLFV3n9s1zkBNvBNy43/CCD83maYTMNyW51QXAI2OOJbSX+MHrLNLc84UGpT
	H9u1Xq9q9BlSug7e5JUxETtiUVYiVIriYUEQN2jPZPfYA2MVRcC+UsRsxDCiKRFtId3xw4lSDEoYg
	vae6efPioVFD3tWRhbAdWbKuVCEincdZ9XVLk58z7I7CjWFS14kh+GySTYZnssLJIcUqKsusJjtiU
	xxMUJo6JSQsPGajwOgz3QNzfSkM72LfD3E2SMcXedu604gSvrUpXNJXdSY97nBjPCnUjpSqlMUqZt
	dFDZMXSA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDZ-00000001lJZ-3sgr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 980A41516;
	Fri, 16 Oct 2026 09:55:32 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE163F7B4;
	Fri, 16 Oct 2026 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169735; bh=w8HM78LVd70g3IrU0TKqbYbHr8mKQzEEIbWDRpOxf3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eqbQJ1nTLxFXsPEAH3wGoKsoXRyozGNzxTc4IMFHd4PUd0WLOq/i3QlepclKIQR3Z
	 ROxA4baDPwmZB37JD/mm12uh8wqkq0C62K/IyRbMFXtNiIVSsrWa77TynAJrbCEB/e
	 8YLz8NDOY3VxdzU3aHaRNMTXnWvtTIbE9nFYWRZ8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:11 +0100
Subject: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2021;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=w8HM78LVd70g3IrU0TKqbYbHr8mKQzEEIbWDRpOxf3Y=;
 b=wdQEVcJOJO8x0TyM5MB9TZDJhYAFtjHPZHXINxM+6EW0aJuotFOUxjMTFjB0biLClgphT10XW
 9lKA4LshuxfA964sW5u9nt8YRL6ssptcgVPXMyATylRPC2eByuQpq67
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175542_227583_3DF0050A 
X-CRM114-Status: GOOD (  12.30  )
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

After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
unexpected stop reasons are handled before the WRAP check. And the
erratum and pointer checks is no longer relevant when deciding the
buffer wrap.

Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
reported as an overflow instead of a spurious event, which prepares for
for TRBE wrap mode where collection continues and a maintenance
interrupt is raised on current write pointer wrap.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a851f09d806a6b6a6386d6f7547b01a17f61b88e..4aeed1a17c4bf1653fb41731ac15f31feec7ed2e 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -661,8 +661,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	const char *err_str;
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	struct trbe_cpudata *cpudata = buf->cpudata;
 
 	WARN_ON(is_trbe_running(trbsr));
 
@@ -710,14 +708,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 		goto out_fatal;
 	}
 
-	/*
-	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
-	 * it might write data after a WRAP event in the fill mode.
-	 * Thus the check TRBPTR == TRBBASER will not be honored.
-	 */
-	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
-	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
-	     get_trbe_write_pointer() == get_trbe_base_pointer()))
+	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 
 	return TRBE_FAULT_ACT_SPURIOUS;

-- 
2.34.1


