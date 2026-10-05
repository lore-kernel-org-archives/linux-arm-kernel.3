Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F0DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aUTU86Aq6p6cPLwOLgflfpEbmUAAgBX3kPIXjRKq4JM=; b=yQNimgUPsBRRJu
	xKLjdGsdZHGS1PDaaIb75cTGPq1UR83JSLL9zg4Ze/HvnWLcm63rysRNnj3+uNaKgRFPE4brbtOaI
	V8ZJvTAJqUiN0g80kk2mxMCuOVkL2OwaBhkq7ozdlpW/310x8zNmixCOnFVvrG5sImN0rQzT/wise
	VCK16hscxiug/2/Mw6C3W2dwQnG8u7/XX0PSyAYaPmyYqtd2ZpuDXgUqk3xfYegNsvQOXj4KhG8O4
	IkZhuxtCLDb7H2RmEa3fYwlpGUmbgtj5skqKhCzJBzLojpCQ3jipyH2wgEqkpySk+9vXiGcX2kIby
	QMv/MZf7c0jxDKGXJnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfNw-0000000G5Ke-3ZBr;
	Mon, 05 Oct 2026 09:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfNv-0000000G5KJ-1w1N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C4916022E;
	Mon,  5 Oct 2026 09:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970491F000FF;
	Mon,  5 Oct 2026 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194006;
	bh=aUTU86Aq6p6cPLwOLgflfpEbmUAAgBX3kPIXjRKq4JM=;
	h=From:Subject:Date:To:Cc;
	b=n4PK+X+XI3hb7SFrCgZwZnhcnmMEzeBBY4a5oZOM/IAaW/oTL4P/+8cUcGRWRq6Lu
	 vRjT8noThGv7CC4zPqk5O/KxBqx6Xr0dwhc215sK0VPc7EzQaCK1t1NUaiDMLXNA3O
	 lm+kuIHjQE2sLN7B/LBalyTbn36LdnHYxqcv4RPMinJl0iFrFD4BvdxZ2uEG7cgZzg
	 jTolNDIsPorjy60cix/ix5p6hufIPt9359fB23Lq+QIPUZbmVBF//Iubm3PqqmPyUE
	 SefLhAi7xTXI5fui5IwIdIgKAkimTYCRM4yONFrxFE8V0aLrahFnffkeLzQxo31VcW
	 nZ7BOBYPRP56A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 0/4] firmware: arm_scmi: Some fixes to address conflicts
 with fw_devlink
Date: Mon, 05 Oct 2026 10:53:09 +0100
Message-Id: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIhzw2oC/3WNyw6CMBBFf4V0bU0fFoor/8MY0pYB6gNMC42G8
 O+2uNEYlydzz5kZeXAWPNpnM3IQrLdDH4FvMmQ61beAbR0ZMcJySgjD3txspSdfNfYBHtNSNyB
 rbiQwFKW7g/UQnePpzX7SZzBjqqRFZ/04uOf6MdC0+xsPFBMs81IYrTRvoDhcwPVw3Q6uRake2
 KcvfnwWfb5TgnIuZSHUl78sywssqFLU/wAAAA==
X-Change-ID: 20261002-scmi_bus_fixes-19bfe8d3c8e2
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Peng’s [1] identified the problem of multiple SCMI devices sharing one
protocol fwnode. His [2] shows the consequence: the first device owns
the fwnode but does not bind, so fw_devlink can leave consumers deferred
even when another device binds successfully.

This four-patch series reduces those cases within SCMI. It prevents
protocol device creation in exclusive raw mode, stops treating core
created standard devices as driver owned requests, and makes the i.MX
pinctrl driver match the standard `pinctrl` device instead of creating
a second device for the same fwnode. It also omits the `perf` device
when the firmware node does not describe a performance domain provider,
without changing `cpufreq` device creation. IIO/HWMON don't have any
fw_devlink dependency and having two devices shouldn't be an issue.

These changes address the SCMI cases above; they do not provide a
general driver core solution for devices that share a fwnode.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

[1] https://lore.kernel.org/all/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com
[2] https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com

---
Changes in v3:
- Removed a redundant check when creating requested SCMI devices: standard
  protocol/name pairs are no longer recorded as requests, so they cannot
  appear in this list. No functional change - reported by sashiko
  https://sashiko.dev/#/message/20261005091843.13F271F000FF%40smtp.kernel.org
- Link to v2: https://patch.msgid.link/20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org

Changes in v2:
- Dropped "pinctrl-imx" from scmi_std_id_table array correctly this time.
- Updated the trailers received so far(Thanks Peng Fan and Hans de Goede)
- Link to v1: https://patch.msgid.link/20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org

---
Sudeep Holla (4):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices

 drivers/firmware/arm_scmi/bus.c              | 110 ++++++++++++++++-----------
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c |   2 +-
 2 files changed, 67 insertions(+), 45 deletions(-)
---
base-commit: aac4e67d6eb93118cfa70c6562b5f9c81a7042ef
change-id: 20261002-scmi_bus_fixes-19bfe8d3c8e2


-- 
Regards,
Sudeep


