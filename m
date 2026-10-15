Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A190ECC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S0QDHFMY3MEYfdvdAb5kPowvAiKS22tWo4crOS1PH78=; b=NSQQTRLvQh7r71
	jTvaloO0fqFZxQMHtZpa/Y7odQK/uROufUSLGTMbrJ4oyKVMt+9zKuyHDDchAqgvXHXC2MI1dyzGa
	KTpb5Sl3uD9s3L9b9ctSnmnA+Jz09iSXe2wrPvgVdF3qgnq67eZk39dVLoxE4QyazAz96Z8qJjba3
	QklTTNPhOXxckETMISM55vGgWPjw3ojbB7MWl7gnKFKJsOnkv7TV509iFEvPX9i9MTGklG20q8TL6
	dJoK8fzvzE4G4icyBllLeZySdqC/WXY9Vqi23mVSV/FvlgSl2FYFs519d6e5FP5HK5b4JnpcdjWQ8
	tgoGBuQiyPE+NjoVmHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNkh-00000000ccC-0K41;
	Thu, 15 Oct 2026 15:52:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNkY-00000000cag-1gzh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:52:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D92114BF;
	Thu, 15 Oct 2026 08:52:05 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555B23F7B4;
	Thu, 15 Oct 2026 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792079528; bh=gELyVh2LE6u3v6a4/bZ7gMH0X/a3oaoXrVoknaD9/jY=;
	h=From:Subject:Date:To:Cc:From;
	b=UfSD0OjhjRzRc2nvK15zgz91Jm+uC+ECcRkkY79xc0leQKYg8a6TUZHBKMULiHsmW
	 VLHWQZMj/7DYFPLFfafrdZiCoh6YHnPcQMRbKTIlMsCscld8NYA93dVuLEFFOtxvab
	 zQ4s78YZ7SjKLLxfEHuzrLguJEkpQbVaXR3XpOGE=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] perf: Order SPE and TRBE padding before publishing AUX
 head
Date: Thu, 15 Oct 2026 16:51:57 +0100
Message-Id: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ320GoC/x2NQQrCMBAAv1L2bCCJpIpfEVkSs9FFaMJuI4XSv
 xs8zmFmdlASJoXbtIPQl5XrMsCdJni+4/Iiw3kweOtnZ10wMWdMUYYkiqUKNpKCsW9Y+9r6ivr
 hZi72HOarC8mnDKPVhApv/8/9cRw/459rzXcAAAA=
X-Change-ID: 20261015-add_barriers_for_perf_aux_output_skip-70356815b2bd
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792079527; l=1132;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gELyVh2LE6u3v6a4/bZ7gMH0X/a3oaoXrVoknaD9/jY=;
 b=+IklPEIB+tA+LBpopP0HvZoM0sQgYLKmbHbrxALjQJUthC7b0AakzwraX3AkZqTt9OqxbdyTk
 uUASvDFpepLAAu76/doK6E0JEFmJ+v4rDqsvHpYKxJDbRLLmB4G6to6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_085210_483841_2F9401F7 
X-CRM114-Status: UNSURE (   8.19  )
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

SPE and TRBE write padding into their AUX buffers before advancing
aux_head. Add the missing write barriers so that a userspace reader on
another CPU cannot observe the new head before the padding stores
become visible.

AUX producers must make their data visible before publishing aux_head.
The required synchronization depends on the trace hardware and CPU
memory model, so the barriers belong in the drivers rather than in
perf_aux_output_skip() or perf_aux_output_end(). The TRBE change also
covers padding inserted by the overwrite erratum workaround before
perf_aux_output_end().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (2):
      perf: arm_spe: Order padding before publishing AUX head
      coresight: trbe: Order padding before publishing AUX head

 drivers/hwtracing/coresight/coresight-trbe.c | 2 ++
 drivers/perf/arm_spe_pmu.c                   | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-add_barriers_for_perf_aux_output_skip-70356815b2bd

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


