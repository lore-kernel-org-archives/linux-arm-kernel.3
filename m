Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595CC606BA5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zXxZZIL3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IxwSX640
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pQrWz1faFiddLliYKRPxrOHyvprHZLzoea8K55JlsvA=; b=zXxZZIL30EF+WkHYr6W/48WRP9
	FZp98a/OzGw5fzhRpz0NVtN5/sZPVYdZ4vqHsJZuJ4EQFbQoj/dvT9A1ik4fGN9Ujz0eVdTyOoiml
	5CttRmef6RaaDw2r39KqlTODlnWGfrHvdvs+sRg122kNBGIFs42LxLwAZahprsBjWpounAhR824No
	7DG97AegkySmJVJ9LkRj9GyDUCHDwoUh21ZAh9jnfNNM4jC4a/UycFwzdf1nUr+NwLaYgQHW6LLQC
	KPykJEBM4hilQ5oKFsxWP164HdhkBF+ACfYugVaGDuc4DnbtVbXbrkt83ZHMqzeOnSQr9110wqaSv
	yVpNR19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwFS-0000000HXM7-24gz;
	Mon, 02 Nov 2026 17:55:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwFQ-0000000HXLr-3o1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:55:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EC5E60F0B;
	Mon,  2 Nov 2026 17:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95311F00A18;
	Mon,  2 Nov 2026 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793642107;
	bh=pQrWz1faFiddLliYKRPxrOHyvprHZLzoea8K55JlsvA=;
	h=From:To:Cc:Subject:Date;
	b=IxwSX6408H/Hh9XMwSjSUDTsMmbsJ8td4vzSrd2svDG55I6Mhggzo+nAaFy2AhBPR
	 DTDTsoIxwQxSY0v6WyVxTHLIFOypG2Zjo4Dy5PswE1m5HIakzrvXie1gsPy+kvBh7s
	 iR53zpuyPRXamc5TS8QHBgyjBt89PvLSCaHP8KDAGEjRvsmnX1y+NWgxxytLeCKTcn
	 tSbwT6ykzso3UD1GwObfo9M+VawWPgxBGLNMsbZXEjvSxEIdSmLlB7ooUGLfxGzbLj
	 z1S+9YJO5sSdopvAtSPryEHHZJKc7+CHc+jVvpn6wiYn8hthkeT3eq75X2UWEBwyUH
	 btXnDw99SN8lg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm: Fixes for v7.4
Date: Mon,  2 Nov 2026 17:54:39 +0000
Message-ID: <20261102175440.1063545-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi ARM SoC Team,

Please pull !

I have included one dts file fix in this, hope that is OK. Let me know
if you prefer to keep DTS separate even for fixes.

Regards,
Sudeep

-->8
The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-fw-fixes-7.4

for you to fetch changes up to 09fd63fe687ffa2d6594cd31d6fcf5fa7740a63c:

  Merge branches 'for-next/smccc/fixes', 'for-next/scmi/fixes', 'for-next/ffa/fixes' and 'for-next/juno/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-11-02 11:33:33 +0000)

----------------------------------------------------------------
Arm Firmware Interfaces(SCMI/FF-A/SMCCC) fixes for v7.4

SCMI fixes correct protocol-device creation and request tracking in raw
mode, allow the generic and i.MX pinctrl drivers to share the standard
SCMI pinctrl device, and avoid creating unused performance-domain
devices that block cpufreq consumers through fw_devlink ownership. It
also includes dropping now unnecessary ACPI config guards and several
robustness fixes: bound i.MX MISC syslog and control responses,
unregister notification callbacks on event-enable failure, and free
mailbox state when shared-memory mapping fails.

The FF-A notifier fix distinguishes notification IDs within a hash
bucket, preventing callback registration and delivery from using a
colliding ID.

SMCCC and GICv3 fixes restore builds on 32-bit ARM when SMCCC discovery
is unavailable, while restricting the discovery dependency to arm64
where the NVIDIA erratum workaround applies.

Finally, correct the Corstone1000-A320 GIC redistributor region size
for its GICv4 configuration.

----------------------------------------------------------------
David Cemin (1):
      firmware: arm_ffa: Compare notify_id when looking up notifier callbacks

Geert Uytterhoeven (2):
      firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
      firmware: arm_scmi: Fix grammar s/thing/things/

Julian Braha (2):
      firmware: smccc: Provide stubs for HAVE_ARM_SMCCC_DISCOVERY=n
      irqchip/gic-v3: Select HAVE_ARM_SMCCC_DISCOVERY only on arm64

Rob Herring (Arm) (1):
      arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size

Sudeep Holla (10):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices
      firmware: arm_scmi: Drop redundant ACPI configuration guard
      firmware: arm_scmi: imx: Track copied syslog words
      firmware: arm_scmi: imx: Validate MISC control response size
      firmware: arm_scmi: Unregister notifier on enable failure
      firmware: arm_scmi: Free mailbox state on mapping failure
      Merge branches 'for-next/smccc/fixes', 'for-next/scmi/fixes', 'for-next/ffa/fixes' and 'for-next/juno/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |   2 +-
 drivers/firmware/arm_ffa/driver.c                  |  11 ++-
 drivers/firmware/arm_scmi/Kconfig                  |   2 +-
 drivers/firmware/arm_scmi/bus.c                    | 110 ++++++++++++---------
 drivers/firmware/arm_scmi/driver.c                 |   4 -
 drivers/firmware/arm_scmi/notify.c                 |   4 +-
 drivers/firmware/arm_scmi/transports/Kconfig       |   2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  18 +++-
 drivers/irqchip/Kconfig                            |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |   2 +-
 include/linux/arm-smccc.h                          |   7 ++
 include/linux/firmware/imx/sm.h                    |   6 ++
 13 files changed, 113 insertions(+), 64 deletions(-)

