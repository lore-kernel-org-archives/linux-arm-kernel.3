Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2334DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpVYpv6jZD++PbrT+aaoADHvR5BzRsDwdI9bCChCD8E=; b=Z0Cc0CKxmOo+ywJ17TUKmHiJui
	PyJXzlZCNG/At7EdU5tSnCf1y8qhGmanZt4a4mhw5mXcO2rP/8Mvi5n+TA5b2ky/pEF+d3D7nbbh/
	RqDgHvLlcRbUzdX3fBbR3tfPRYuKldK0scdCyJgTkrR+RXnFQLiQwjKVf5KoWLY6KwVo/czQtcc+P
	nNMhjKq4KPSe7Wvc0fCVon716ldSw8RX+7NadXFe6bM1mzWSXPEmnz3raT3EWUfOfvNnIINYUkAhy
	09JZ0iW+Iyz7Lc9EVj+P4Y3/3prNEgNNeeLC+Cme8hFAXt14lFYP9+x7K7TjYkDR8rYst8+p73XO5
	BpIkhB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAQp-0000000DcnO-2xoc;
	Wed, 13 Aug 2025 12:18:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9wR-0000000DYMx-132J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:46:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D66B12FC;
	Wed, 13 Aug 2025 04:46:40 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939873F738;
	Wed, 13 Aug 2025 04:46:45 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/8] Add support for SCMIv4.0 Powercap Extensions
Date: Wed, 13 Aug 2025 12:46:01 +0100
Message-ID: <20250813114609.1305571-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_044651_325740_D07B164E 
X-CRM114-Status: GOOD (  12.57  )
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

SCMIv4.0 [1] introduces some new features and commands into the Powercap
protocol. In a nutshell, such protocol changes add support for:

 - setting multiple powercap limit/interval constraints for each SCMI
   powercap domain which supports multiple Concurrent Power Limit
 - enabling more Powercap commands to use Fastchannels mechanism
 - adding multiple constraints support to the existing notifications

After a bit of needed updates in the SCMI core this series adds:

- support for the idea of optional multiple Concurrent Power Limit (CPLs)
- support for the new FCs
- support for extended notifications
- enable usage of such multiple constraint in the ARM SCMI Powercap driver

Note that the public SCMIv4.0 spec at [1] is currently still ALPHA0, so
this series could anyway need some minor rework along the way and
definitely will need to wait for a final public release before being
possibly merged.

Tested in a mocked setup implementing the new protocol extensions.
Based on v6.17-rc1.

Thanks,
Cristian

[1]: https://developer.arm.com/documentation/den0056/f/?lang=en


Cristian Marussi (8):
  firmware: arm_scmi: Add an optional custom parameter to fastchannel
    helpers
  firmware: arm_scmi: Add bound iterators support
  firmware: arm_scmi: Refactor powercap domain layout
  firmware: arm_scmi: Add SCMIv4.0 Powercap basic support
  firmware: arm_scmi: Add SCMIv4.0 Powercap FCs support
  firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
  include: trace: Add new parameter to trace_scmi_fc_call
  powercap: arm_scmi: Enable multiple constraints support

 drivers/firmware/arm_scmi/driver.c    |  33 +-
 drivers/firmware/arm_scmi/perf.c      |  16 +-
 drivers/firmware/arm_scmi/powercap.c  | 843 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/protocols.h |   8 +-
 drivers/powercap/arm_scmi_powercap.c  |  54 +-
 include/linux/scmi_protocol.h         |  78 ++-
 include/trace/events/scmi.h           |  10 +-
 7 files changed, 777 insertions(+), 265 deletions(-)

-- 
2.47.0


