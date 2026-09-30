Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB6CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 03:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KP6ZynFLHD8ri5bMVYI7/ATuH9LqGjJkwYWC0VATw3Q=; b=FzJCpa4mWYGU7F2pFS4cwAs5gS
	3JmDX/qlQpydbdyE3lraleAfBFTBOw9DMlQgzNsxCv0z7TyFwbxFshS3Mh+KcUSY+cGlOebryMq6C
	G12ucN2TjLJMPfzfHAn57dMvnpvEKtCQpJWsXmXn4BNmg/NPTxmQDNArTPMk1FAARJZGfR0p2RjFI
	+hYpRQ48tr7y9ADpJBzm7LwK/OlxO1rFqSPDmspxAmOc0+gt3P0mUvm/mq0/G+djjbfLI1TyXb9E2
	R94Uv0NmAyeL1k7nX5zJescFsZaSiVsLvaU2OKTgPYbisswgqgZWYWfI9Q+EO3TBtXSJDvw3165Cu
	sD2rd7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl83-00000004y5c-3DQO;
	Wed, 30 Sep 2026 03:37:11 +0000
Received: from mail-m17215.xmail.ntesmail.com ([45.195.17.215])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl80-00000004y3a-1zHL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 03:37:11 +0000
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f94c9cb5;
	Wed, 30 Sep 2026 11:36:58 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/1] mailbox: arm_mhuv3: Keep combined IRQ enabled during system suspend
Date: Wed, 30 Sep 2026 11:36:56 +0800
Message-ID: <20260930033657.312266-1-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f0630f1d03a8kunm0f690f8947b217
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBlMVhofSxhDShpJTEtNSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=OxODFohMjf+FYWy51U18ExdvDCqeo4yz9mpEHq5qFLRyHEA7gob1nMhV/GFVM4mgXkFAVaKVzooj/VBIl7qu0FtgSecoymNtfXw5w0rDSsWExHHGXQ/7Usmr9QLNuTiJBLpqUkUAW/dCLep297GTi+EKU+tGxMjKoIfPWZzlcBY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KP6ZynFLHD8ri5bMVYI7/ATuH9LqGjJkwYWC0VATw3Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_203709_076789_C746B65B 
X-CRM114-Status: GOOD (  11.86  )
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

Hi Sudeep, Cristian,

This is an RFC to ask about keeping the MHUv3 combined IRQs enabled
across system suspend, so that SCMI clock/power-domain operations
issued from the noirq phase keep working.

SCMI clock and power-domain operations go through the mailbox
transport, and during system suspend they are still needed in the noirq
phase. genpd powers off a device's parent domain from
genpd_suspend_noirq() (e.g. turning off a video power domain when
suspending the display controller), which issues
scmi_clock_config_set() / scmi_power_state_set() and waits for the
firmware reply via the mailbox RX IRQ. Because dpm_suspend_noirq()
calls suspend_device_irqs() before running the suspend_noirq callbacks,
the mailbox IRQ is already masked at that point and the transfer times
out:

  arm-scmi firmware:scmi: timed out in resp(caller:
  scmi_clock_config_set+0x90/0xdc)

We hit this on one of our platforms and worked around it downstream by
adding IRQF_NO_SUSPEND to our mailbox driver. arm_mhuv3.c has the same
pattern: both the PBX and MBX combined interrupts are requested as
threaded IRQs with only IRQF_ONESHOT and no hardirq handler, so an
MHUv3 instance used as the SCMI mailbox transport (arm,scmi-mailbox)
would time out the same way.

IRQ threads are not frozen during system suspend, so with
IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
noirq phase. For SCMI clk/pd traffic the MBX combined IRQ must stay
enabled; the PBX combined IRQ, used for txdone by IRQ when not in
polling mode, needs the same treatment.

The patch applies IRQF_NO_SUSPEND to both registrations, but we would
like your opinion on:

1. whether you are open to this at all, or whether SCMI users on MHUv3
   should instead rely on another transport (e.g. SMC) for traffic
   needed in the noirq phase;

2. whether it should be applied to both the PBX and MBX combined IRQs
   unconditionally, or only in specific configurations.

This is not purely hypothetical: several in-tree DTs already route SCMI
over a mailbox transport without IRQF_NO_SUSPEND on the mailbox IRQ,
e.g. Juno and Morello use the MHU doorbell and the Zena CSS DTS uses
MHUv3. The patch is sent as RFC for discussion only.

Thanks,
Finley

Finley Xiao (1):
  mailbox: arm_mhuv3: Keep the combined IRQ enabled during system
    suspend

 drivers/mailbox/arm_mhuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


