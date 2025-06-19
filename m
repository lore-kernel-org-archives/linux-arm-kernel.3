Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD39FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kPgLI1qZ+KuSQ5LvHDWdChNMIS+7wd4wIbVghKfJ9FM=; b=c3BP5wMYGCqykIUSv5fXz+hlIJ
	yrE5+Abw9WCa5VNumxgmXpcjz4JUZdlKQEashuSJpePb5B/wd48gL/g/DRR8uMlxiLxZckEfgsPwu
	yqKeeknubTpzSfT8SWtbphKOxwoYQSZVFEKqlXkZIr9Fe5YZGUsJ+HD5IJBISv25SWSr6lYrjuoa1
	I3VisVlyKNngvmWbqtKcofNwRvy1m358sqneZgRQ2m8g+Bs0PrphpCujbj0vZrus48SnAgLTs9rNZ
	f2vBA3bGi2MC20elXtuXdvmXEJyU71AHjDRN5t6dj7YFhVoPlEe0K71BwG7PeAmRYC0Su4n7XRgcv
	87TajHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTd-0000000DUyq-3zLx;
	Thu, 19 Jun 2025 15:46:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEFk-0000000D1he-22ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:20:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC9D106F;
	Thu, 19 Jun 2025 05:20:01 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A143F66E;
	Thu, 19 Jun 2025 05:20:20 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Date: Thu, 19 Jun 2025 12:20:00 +0000
Message-Id: <20250619122004.3705976-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052024_573942_6B2A0C69 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi all,

This series adds a new counter to the Arm SCMI firmware driver to track
the number of in-flight message transfers during debug and trace. This
will be useful for examining behaviour under a large load with regards
to concurrent messages being sent and received. As the counter only gives
a live value, printing the value in trace allows logging of the in-flight
xfers.

The series is divided into four small patches:
Patch [1/4]
	- Adds a fuction to decrement debug counters, similar to the existing
	  counter to increment debug counters
Patch [2/4]
	- Adds a new xfers_inflight debug counter to track active transfers
Patch [3/4]
	- Enhances two tracepoints (scmi_xfer_begin and scmi_xfer_end) to
	  include the number of in-flight transfers, setting default values
	  of 0
Patch [4/4]
	- Adds a function (scmi_inflight_count) that retrieves the current
	  in-flight count for use in tracing

Based on v6.16-rc2

Regards,
Phil

Philip Radford (4):
  firmware: arm_scmi: Add debug decrement counter
  firmware: arm_scmi: Add xfer_inflight counter
  include: trace: Add inflight_xfer counter tracepoint
  firmware: arm_scmi: Add new inflight tracing functionality

 drivers/firmware/arm_scmi/common.h   |  8 ++++++++
 drivers/firmware/arm_scmi/driver.c   | 28 ++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/raw_mode.c |  6 ++++--
 include/trace/events/scmi.h          | 24 ++++++++++++++----------
 4 files changed, 52 insertions(+), 14 deletions(-)

--
2.25.1


