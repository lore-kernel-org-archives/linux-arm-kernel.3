Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6218CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YIY5bNWP5Mo4gGl9gEblk1AoCd9pL9A0n5OOJPjAuX4=; b=isekRBE9vG7ARCXhF1BEqiQyR0
	yS6hN40gfzspGccjzjh9OJNY+3Z0h/eCTg4lym6BnIgB3e2558qZt+TAn9gWvWoNaWw8EyG5xX2Ws
	cH8DmWbPvEh2al0kY+bBFfN+SEvI74DgYoU6J6s3PoX2Out4VCPRxCrlK+j+nnfI9zhlgKjHCyqqB
	o/MQjzLfAv3IK1+iaoFlzibfv/9nDXstfnBnMpnZzYkZGpMddD65/n8O/lPWM3aezfuRmcU9Zn6B+
	6ggIWGWex6KURt5n5jnlYVsNAiPnWG8MITjCogV9aL/4nrBtya+j53AkCzlQZi1Ty+kGCjCIj0CpL
	j3AQTUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgyn-00000008bmV-0soF;
	Mon, 09 Dec 2024 16:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgxj-00000008bXg-2pnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:50:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE39F113E;
	Mon,  9 Dec 2024 08:50:48 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4682D3F720;
	Mon,  9 Dec 2024 08:50:18 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/3] Add SCMI Vendor module autoload support
Date: Mon,  9 Dec 2024 16:49:54 +0000
Message-ID: <20241209164957.1801886-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085023_753986_926F7A0C 
X-CRM114-Status: UNSURE (   8.91  )
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

Hi,

a tiny series to add the capability to automatically load the proper
vendor protocol module when an SCMI driver tries to use it; while proper
vendor protocol selection is already provided by the SCMI core, automatic
loading of vendor protocols was not.

Lookup is now based on module aliases following the pattern:

	scmi-protocol-0x<PROTO_ID_NN>-<VENDOR_ID>

In [2/2] proper aliases are added to existing i.MX Vendor protocols...
...could not find a better way to build the alias string automagically...
...any advice is welcome in these regards...and any feedback too !

In V2, an additional patch is added to simply add the proper/required
MODULE_DEVICE_TABLE to SCMI transport driver to enable autoloading also
for those.

Thanks,
Cristian

V1 --> V2
- added tags
- added Transport aliases patch via MODULE_DEVICE_TABLE

Cristian Marussi (3):
  firmware: arm_scmi: Support vendor protocol modules autoloading
  firmware: arm_scmi: Add module aliases to i.MX vendor protocols
  firmware: arm_scmi: Add aliases to transport modules

 drivers/firmware/arm_scmi/driver.c            | 56 +++++++++++++++----
 .../firmware/arm_scmi/transports/mailbox.c    |  1 +
 drivers/firmware/arm_scmi/transports/smc.c    |  1 +
 drivers/firmware/arm_scmi/transports/virtio.c |  1 +
 .../arm_scmi/vendors/imx/imx-sm-bbm.c         |  5 +-
 .../arm_scmi/vendors/imx/imx-sm-misc.c        |  5 +-
 include/linux/scmi_imx_protocol.h             |  9 +--
 7 files changed, 60 insertions(+), 18 deletions(-)

-- 
2.47.0


