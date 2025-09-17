Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57A4CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCi46aNxpe/S9Nv64Q4e98064clLvyhFnA9J9Bslczs=; b=RgE34kWZ/pkSSO
	72XDE7Jlf/HxH8aX45OKPliG6Q8Lj5/9nF6EdlueFcb8yVSzYVjAMsh/vqgTSQ9v5yPM4r27uqcav
	dSbrzghiG7iWVvt9e7IhyN7RckRod/DXNkFsRSZv3qGjJw/ZtcA2OSzlYrwNI4naTwpYoERDmXQys
	h8G0njef8iRx0ZEzrTZsj/6jpYIE8cgurPj+F0Ao46AhaT8Qx8PzdI0v765dM1rgUru1wQNF/uRKr
	Wyh+q1zPQinADmuwmoGto6GHQRzQvs+5WO9a4FbRnXk5PC6P66bvWDcnGFqkWHQHpJaUic2Hv5dXY
	c8g/THbDYpK3HMDmAruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAX-0000000Dg7f-3grL;
	Wed, 17 Sep 2025 17:42:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAQ-0000000DfzZ-0IZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D562696;
	Wed, 17 Sep 2025 10:41:54 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DD343F694;
	Wed, 17 Sep 2025 10:42:01 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] perf: Fix overflow in PERF_IDX2OFF() for Arm SPE and
 TRBE drivers
Date: Wed, 17 Sep 2025 18:41:37 +0100
Message-Id: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHyymgC/x2MQQqAIBAAvyJ7TtDQxL4SIWJb7cVCK4Tw70nHg
 Zl5IWMizDCyFxI+lOmIDWTHIOw+bshpaQy96LWw0vCVivN3cVfyAR3FBQu3RunBqFWLQUIrz4R
 N+6/TXOsHEUNqjWUAAAA=
X-Change-ID: 20250917-fix_aux_trace_index-9745674f5061
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758130921; l=922;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7d6idTSBvkiqCwUiJ/luxxi9bE5VUTAm37cIjDh+ZzA=;
 b=l1R2E0wH9AF+zWn77eji4SNZvlIIGpnYbl+xIy2V8F3ACCoxcbAm1QcrImRDRoMH34+wF7ewX
 gwCmdpX6BpVASGS3IqfhOCW5XbZoPd+r27JfNEKkBhN9Om/ToECELvJ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_104206_158629_5FD2E19D 
X-CRM114-Status: UNSURE (   7.01  )
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

If the AUX buffer size is specified as 2 GiB or larger, the expression
"(buf)->nr_pages << PAGE_SHIFT" may exceed 0x8000_0000. Since
(buf)->nr_pages is a signed integer, the shift can overflow and produce
a negative value. As a result, PERF_IDX2OFF() fails to work correctly.

Fix this by casting (buf)->nr_pages to unsigned long before the shift,
which allows PERF_IDX2OFF() to handle large buffers properly.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (2):
      coresight: trbe: Prevent overflow in PERF_IDX2OFF()
      perf: arm_spe: Prevent overflow in PERF_IDX2OFF()

 drivers/hwtracing/coresight/coresight-trbe.c | 3 ++-
 drivers/perf/arm_spe_pmu.c                   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 5aca7966d2a7255ba92fd5e63268dd767b223aa5
change-id: 20250917-fix_aux_trace_index-9745674f5061

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


