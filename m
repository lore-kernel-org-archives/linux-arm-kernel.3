Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E441BC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZhnEaFK5C0MtluAQegWv+WGtIhW72sg0EudvnCO3/s=; b=ZRNx8E7x8QyAyYadl5pHCLlGvW
	e45KFit6q+5ryBMsgGNe4Ck4dGDlY/y/d3vuUWgDxM2t5AFfyt1u24LcQfcVvW7SGfWOIucRnDsj7
	eBiA//JpQE0Jtsr976miJL+toivMmqVT4W4u7bdAI+eEE8PwJysAaZwuPuqTTTCC06B479b/J5bbU
	xgkcvw4CPpmmUbL5wOCYXRS9ISzmtGQXPKOl2LucoOiLXlBGgoC/Rrpn6YVYM9bAG5a4JRM/yJgU8
	CVo2IcrMl5WbcJRVJ8F+5eJlAvMHscb7Va7Cyv37LbD074bG/9uyl8N2mrD2SSahKMYsNqIRFcrmD
	I2bTpbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCbV-000000020vB-3erz;
	Mon, 30 Jun 2025 11:23:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCB7-00000001xCm-31Ke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:56:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC2A01D34;
	Mon, 30 Jun 2025 03:55:42 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81C593F6A8;
	Mon, 30 Jun 2025 03:55:57 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH v2 0/3] firmware: arm_scmi: Add xfer inflight debug and trace
Date: Mon, 30 Jun 2025 10:55:40 +0000
Message-Id: <20250630105544.531723-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_035601_799168_6CF8E463 
X-CRM114-Status: GOOD (  11.05  )
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

Hi all,

This series adds a new counter to the Arm SCMI firmware driver to track
the number of in-flight message transfers during debug and trace. This
will be useful for examining behaviour under a large load with regards
to concurrent messages being sent and received. As the counter only gives
a live value, printing the value in trace allows logging of the in-flight
xfers.

The series is divided into three small patches:
Patch [1/3]
        - Adds a function to decrement debug counters, similar to the
		  existing counter to increment debug counters.
Patch [2/3]
        - Adds a new xfers_inflight debug counter to track active
		  transfers.
Patch [3/3]
        - Enhances two tracepoints (scmi_xfer_begin and scmi_xfer_end) to
          include the number of in-flight transfers. Also adds a function
		  (scmi_inflight_count) that retrieves the current in-flight count
		  for use in tracing.

This series is based off the branch sudeep/for-next/scmi/updates at commit
397f802d06c4 ("firmware: arm_scmi: quirk: Force perf level get fastchannel").

Regards,
Phil
---
V1->V2
- Amendments to commit messages
- Final commit of V1 squashed into commit three
- Removal of erroneous blank space
- rebased on sudeep/for-next/scmi/updates as previously based on v6.16-rc2


Philip Radford (3):
  firmware: arm_scmi: Add debug decrement counter
  firmware: arm_scmi: Add xfer_inflight counter
  include: trace: Add inflight_xfer counter tracepoint

 drivers/firmware/arm_scmi/common.h   |  8 ++++++++
 drivers/firmware/arm_scmi/driver.c   | 28 ++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  6 ++++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 4 files changed, 52 insertions(+), 14 deletions(-)

--
2.25.1


