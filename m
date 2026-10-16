Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B33BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iY8zFyTG73ayFJPgjI/2TFPrhB5rWdLRa4UyKFK5hmo=; b=Jevn2kOIlpgHjRidBIdftvxMBt
	fSpjtQzxQRVUdzVKjGMs0Y/DLms2+lsCz5ZNi4iOSgWY5f/3s5ckgurhFBiYyvSLxbMrCDgfm0vvT
	smudWm6AiEcIvuKUAkm5FZejFESbsFFd7J6HmHuTYM5xh+BLDojq6d7td8lOGdcZkYpu8zXdGPblj
	6wau+7p0PId8fFn292sGftQWQ7U0tI7Fnuq+SOhzJdO+H2A3NX6C/RRurHbv5VRl9mtqKiUwgjUqJ
	iVI8rROxwr1DZuVW/b98d/nMW4jMX0iePA4da2g+GtWO4wyoBmMHvodxqiNFPzTDZ0vvB/AWBWhzB
	5mgw17vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDy-00000003UOB-3SWL;
	Fri, 16 Oct 2026 16:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDZ-00000003TyH-33Ea
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iY8zFyTG73ayFJPgjI/2TFPrhB5rWdLRa4UyKFK5hmo=; b=J+336bzgDHsAqOH5QLMgIknkRG
	qpaUQPIlVrn1oQsEQ9ZYh78IDXsgXWtmSfRBqCM9Jr+afBLoUyPD/A3quDF2aGKn/AwiQaOVU8OTX
	a0SzMRPx3GuuAx4ZdPl6aZQeWzrPvALfm0njnaFcQuY2s5LCL8Y6DVlkoNGvJ4jANFHwUjhtgzXnu
	XBViT2oWKm/lOS5VZy9DHC6e/vIPJw2sAPHx4KSJBiFfRYjrhofbtGrfHnprPvduT/Od0Y1KK/q5u
	f5CsPozXOFsx44rtW95xanwsRfoKrSTTwE0GXA4vzqAUnGEmms8/1RdhnWL2+OUvIPOONxyd5BOR9
	qqXZSnUw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDW-00000001lJZ-3htV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A56F1477;
	Fri, 16 Oct 2026 09:55:34 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C203F7B4;
	Fri, 16 Oct 2026 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169737; bh=q6xSefM7pghZO5VVH4INJAgbjn8RPPudjJmX9oZNh2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YHLs75TiqCErZ+y8Vk2kwCpnezK/hXfG4oet801cFn/Xjq6wsxoEIcnqsLy4cbcvE
	 HMZ+tKz1P0g1zo8rCg1ZwnklqOYeWHeNupYCki1wR60Wb/aDc7jis/paZRVqi7+dgp
	 C8cep6lWhl18TCZgrQ83q6cOPOIzVbuYMzyc+ve8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:12 +0100
Subject: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1868;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=q6xSefM7pghZO5VVH4INJAgbjn8RPPudjJmX9oZNh2c=;
 b=1FYidLquq3nz0xjzfGRIIeweFCTPn80nSZ8JsFAwV/gRO4uRBQrBJNOrc/5uZMmgQfk2G48H6
 94w2wr8Dc8XCxA+gtH///yqkwjhFFltAno8tlV+JldxPLzTKPQcdWK1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175539_133294_6AF9C1FC 
X-CRM114-Status: GOOD (  11.82  )
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

Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
behavior" permits a buffer management event when the effective SCR_EL3
security state does not match the owning Security state. This can stop
collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
status fields unchanged.

With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
for this status. The spurious handler re-enables TRBE without clearing
S, so collection can remain stopped. A retained WRAP indication can
instead cause the status to be treated as a normal buffer wrap.

Recognize this architecturally permitted stopped status as an access
not allowed error and return FATAL so the fatal handling reports
truncated trace. Check the syndrome before WRAP and do not exclude
TRG, since both fields are left unchanged by this stop. Check the saved
IRQ bit to preserve updates without a pending interrupt.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -708,6 +708,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 		goto out_fatal;
 	}
 
+	/* An access not allowed stop can leave WRAP and TRG unchanged. */
+	if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
+	    ec == TRBSR_EL1_EC_OTHER &&
+	    bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
+		err_str = "Trace buffer access not allowed";
+		goto out_fatal;
+	}
+
 	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 

-- 
2.34.1


