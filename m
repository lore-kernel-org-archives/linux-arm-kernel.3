Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D0C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRNbibxywGtgwdSqTwR+dyJUSoGm1Uf4ktJLspis/FQ=; b=CCzwuZuVwGgMAHNQBenTmEq0fZ
	eqKCKZe4oo3vUW5ZAgbbr+afXZ4LfgBOfn8tud/GvZbggF6VS915/xhNsa7eTJxruIutUWXL9cf/1
	NvuapO1YbkVFxOOt9rJCSrYEqt0TMURGElaWVzsKZzzRHR0q4ksXR10cemb7Fnt/tOTO8p7vdd2SL
	y0LFVXf2iZGBC58bSR5mrpcDyFroRRoNKHpjxfsBMvqHq7Tub/YjpR6XmfSX2DHAEh2sAWfQBHlc3
	WGVj/lxz+WfXFkN31nWCTrI/KhxYi/tUXK9I/7qmxuzewtGZ8OXItF67yyEnx6ikP5JyMGoCzKGbp
	Spu8Hz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ok3-00000005eHY-0OnN;
	Tue, 15 Sep 2026 08:42:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ojy-00000005eC0-3Vm9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:42:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE82C602CB;
	Tue, 15 Sep 2026 08:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7581F000FF;
	Tue, 15 Sep 2026 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789461729;
	bh=QRNbibxywGtgwdSqTwR+dyJUSoGm1Uf4ktJLspis/FQ=;
	h=From:To:Cc:Subject:Date;
	b=FzjqOWVZAoWNT0lkbKT9jXqVf72r3e8so5HJPbl1vJmoCAEdt8x6kLUX/+nhd1d/V
	 nlVNFoBh0/Nr7wQiduNOErX2gRy6qBxQSZL1ldui12JWfj1uMJ57VcrGhrJGt6nbQE
	 crTIGXqkosfijlXos5mTpvMxk9N0a53KEOJa51ne3vnEKngBRiSXX6h2lCMqGzDLUF
	 Nu/wMf+qT8UAR4P6nQXiHNuz9YYstqTZOwdDgCqmZnYQPcMjqq0pBpBjNIRZFYOkNP
	 kp0DhfeQGte80PPXg/xpL5zNqJCfPj18vbO4wzUywUzCZGfLWZwapBf+ziehOTo591
	 W0nvL1H5ZqDyw==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Lee Jones <lee@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Baokun Li <libaokun1@huawei.com>,
	Dan Williams <djbw@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Jeff Garzik <jgarzik@redhat.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org
Subject: [PATCH v5 0/6] ata: Do not release the host resources twice on probe() failure
Date: Tue, 15 Sep 2026 10:41:26 +0200
Message-ID: <20260915084127.692494-8-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=cassel@kernel.org; h=from:subject; bh=RJ7FOtw3WNj2xfrwTVSeuBJUjhKYQN7HgMoN3ZK9c3Q=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLJWsmzfcUXv+MrLU/5liEzI8o58P1WmuPnc8XehLuwxy iK/zlS86ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBEXm5gZNh+NPpqZtXsjPvL 379Vn/e1S3B5YudZUx/HhpUzxJU+r5ZgZNjjeCJZtONkQ+6n+HN/bOK5kksMeDKvmX+pi70kPeP PTl4A
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

ata_host_start() registers ata_host_stop() as a devres action as soon as
it has succeeded:

	if (have_stop) {
		start_dr = devres_alloc(ata_host_stop, 0, GFP_KERNEL);
	...
	if (start_dr)
		devres_add(host->dev, start_dr);
	host->flags |= ATA_HOST_STARTED;

From that point on, releasing the host resources is owned by devres: when
probe() fails, the driver core calls devres_release_all(), which calls
ata_host_stop(), which calls ->port_stop() and ->host_stop().

ata_host_activate() and ahci_host_activate_multi_irqs() can however fail
after ata_host_start() has succeeded - devm_kasprintf(),
devm_request_irq() (a shared IRQ conflict) and ata_host_register()
(scsi_add_host(), ata_tport_add()) can all fail - and they return the
error with the devres action still registered. Since the caller cannot
tell whether ata_host_start() succeeded, and since it has to release the
resources for the failures happening before that, all the ahci-platform
drivers release the host resources in their probe() error path, e.g.
ahci_probe() calls ahci_platform_disable_resources() while
ahci_host_stop() does the same through devres.

The clocks, regulators, resets and PHYs of the host are therefore
released twice, which gives refcount underflow warnings from the clk,
regulator and phy cores and, for shared resources, can disable resources
which are still in use by other devices.

Patch 5 adds ata_host_undo_start(), which stops the ports and drops the
devres action without calling ->host_stop(), and calls it from both
activation helpers when they fail, so that "on failure, the caller
releases what it acquired" holds for all of them. sata_qstor and sata_fsl
are the only drivers which implement ->host_stop() while having no error
handling at all for the activate host call, so they get some.

Patches 2 to 4 have to come first, as they fix error paths which patch 5
builds upon, and which are worth fixing on their own:

- ahci_st is the only ahci-platform driver whose ->host_stop() does more
  than its probe() error path, as it also asserts the "pwr-dwn" reset,
  so patch 5 would stop that reset from being asserted (patch 2).
- sata_fsl releases hcr_base and host_priv in its probe() error path
  although sata_fsl_host_stop() does that as well, which is a
  use-after-free that the two device_create_file() calls after
  ata_host_activate() can trigger today (patch 3).
- ahci_host_activate_multi_irqs() never frees the IRQs which it
  requested when it fails, so the IRQ handlers stay registered while the
  caller releases the resources of the host (patch 4).

Patch 1 is an independent ahci_st fix, reported by Sashiko:
st_ahci_probe_resets() treats every error from devm_reset_control_get()
as "reset control not defined", including -EPROBE_DEFER, so probe()
continues with the SATA IP held in reset and powered down instead of
being deferred.

Patch 6 is an unrelated kdoc fix that I noticed while documenting the
above.

Changes since v4:
- New patch 1, which stops ahci_st from ignoring the errors returned
  when getting its reset controls, most notably -EPROBE_DEFER. The other
  patches are renumbered accordingly.
- Patch 3 no longer touches the ata_host_activate() error path, it only
  fixes the use-after-free which the two device_create_file() calls can
  trigger, so it no longer depends on the rest of the series. Checking
  the return value of ata_host_activate(), and releasing hcr_base and
  host_priv when activating the host fails, is now done by patch 5,
  where it can be done without leaking them.
- Drop the extern from the ata_host_undo_start() declaration in patch 5.

Niklas Cassel (6):
  ata: ahci_st: Do not ignore errors when getting the reset controls
  ata: ahci_st: Assert the power down reset in the probe() error path
  ata: sata_fsl: Fix use-after-free of host_priv on probe() failure
  ata: libahci: Free the IRQs when activating a multi-IRQ host fails
  ata: libata: Do not leave ata_host_stop() registered when activation
    fails
  ata: libata-core: Fix the ata_host_register() kdoc

 drivers/ata/ahci_st.c          | 78 +++++++++++++++++---------------
 drivers/ata/libahci.c          | 28 +++++++++++-
 drivers/ata/libahci_platform.c |  4 ++
 drivers/ata/libata-core.c      | 81 ++++++++++++++++++++++++++++++----
 drivers/ata/libata-sff.c       |  5 +++
 drivers/ata/sata_fsl.c         | 24 +++++++---
 drivers/ata/sata_qstor.c       |  8 +++-
 include/linux/libata.h         |  1 +
 8 files changed, 173 insertions(+), 56 deletions(-)

-- 
2.55.0


