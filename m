Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B54C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b6cMTIVyWYSfqz7zZDXzFl6IUVvZPpU8dxAa/O++ohM=; b=PUEiohYE0D00V+PqLiAInLC+Ky
	slyStf/ZOG8CiGDyiGQ29ArYNc7gwGcx6wJ87NKC6BgbNdxtYuAEjGL9Kxc/ZyZW7/XvoJK7tppqG
	2kF6FUkFMLXu9FPz7X+jyfAPFYg5BrlRjxJKN9P7G1FlGxq3jDRRUIhodM3/fUbdzdAnChqWj+58g
	cFVOoAPjg+XoKU9cP23oPphO6gkW2cZmb6xbwurMICKBhxE6N6t6V2zvG1YcndzTRTSLFKw6NP3Ip
	8sqUpMzqwVDmw1ii4GuJaiijz49av5GCiM9KXNZip2StGNV1qjuJjSHc+TYiA7sO2jzn5kga3fWHg
	Es91zDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iMK-0000000F2xC-1jQm;
	Thu, 10 Sep 2026 17:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iMJ-0000000F2x6-1Ra6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77AB760200;
	Thu, 10 Sep 2026 17:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96B41F000FF;
	Thu, 10 Sep 2026 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789060486;
	bh=b6cMTIVyWYSfqz7zZDXzFl6IUVvZPpU8dxAa/O++ohM=;
	h=From:To:Cc:Subject:Date;
	b=hzsokh0scgdT37E/ec0juI4GPxZVURS1bk987fZCTyd0KgbP1O5cGl207Uud1ECJH
	 EeaAdAfzNDd8bNiFvUPGkCs04bO7K3eg4g2zajeF5V05OgaALAMKHVTkvszrjklHHm
	 HyV/4N986BoQez5XAb+pgVSAJ44ubQY7eckGmhq3vo3eMQTk2Y1qIar89EigAzYGlj
	 meiLFxyOacBRpOy1GLM9yNwMQk9ULGjTLCvhqXWGRzhrLk2BouJP8PboUAzt7RXTKU
	 JN9kXaeczON3pJZ87D2C5FL5Ur98EptVGASCrQiktkthZI8rDfS0m867XeLU1os6ua
	 gV4DSROdeBR0Q==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Baokun Li <libaokun1@huawei.com>,
	Dan Williams <djbw@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Jeff Garzik <jgarzik@redhat.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org
Subject: [PATCH v4 0/5] ata: Do not release the host resources twice on probe() failure
Date: Thu, 10 Sep 2026 19:14:06 +0200
Message-ID: <20260910171406.131211-7-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4020; i=cassel@kernel.org; h=from:subject; bh=SnosydDSwmxL7sK+ulGyCtAug7hnbIi+5ML57Nugrhs=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLIWPY2r+jjR5tu33Xzz633Zq6tjQ/2On9SRsnp8/N/rs 8LeL+UsO0pZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCR4FxGhlN6q3xlsxP9Q2Rd NuoXvTve27d+4lJtYT8n7/7kaRv2nmdkuHxifbvn011HJgnYz+XScDx2sP8u0+KT2uar5oWKp3k v5gUA
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

Patch 4 adds ata_host_undo_start(), which stops the ports and drops the
devres action without calling ->host_stop(), and calls it from both
activation helpers when they fail, so that "on failure, the caller
releases what it acquired" holds for all of them. sata_qstor and sata_fsl
are the only drivers which implement ->host_stop() while having no error
handling at all for the activate host call, so they get some.

Patches 1 to 3 have to come first, as they fix error paths which patch 4
would otherwise turn into resource leaks, and which are worth fixing on
their own:

- ahci_st is the only ahci-platform driver whose ->host_stop() does more
  than its probe() error path, as it also asserts the "pwr-dwn" reset
  (patch 1).
- sata_fsl releases hcr_base and host_priv in its probe() error path
  although sata_fsl_host_stop() does that as well, which is a
  use-after-free that the two device_create_file() calls after
  ata_host_activate() can trigger today (patch 2).
- ahci_host_activate_multi_irqs() never frees the IRQs which it
  requested when it fails, so the IRQ handlers stay registered while the
  caller releases the resources of the host (patch 3).

Patch 5 is an unrelated kdoc fix that I noticed while documenting the
above.

Changes since v3:
- New patch 2, which fixes the use-after-free of host_priv in the
  probe() error path of sata_fsl. Patch 4 would otherwise make sata_fsl
  leak hcr_base and host_priv when activating the host fails.
- New patch 3, which frees the IRQs requested by
  ahci_host_activate_multi_irqs() when it fails, like
  ata_host_activate() already does.
- Reword the "if failed, just free the IRQ and leave ports alone"
  comment in ata_host_activate(), as the ports are no longer left alone.

Niklas Cassel (5):
  ata: ahci_st: Assert the power down reset in the probe() error path
  ata: sata_fsl: Fix use-after-free of host_priv on probe() failure
  ata: libahci: Free the IRQs when activating a multi-IRQ host fails
  ata: libata: Do not leave ata_host_stop() registered when activation
    fails
  ata: libata-core: Fix the ata_host_register() kdoc

 drivers/ata/ahci_st.c          | 51 ++++++++++++---------
 drivers/ata/libahci.c          | 28 +++++++++++-
 drivers/ata/libahci_platform.c |  4 ++
 drivers/ata/libata-core.c      | 81 ++++++++++++++++++++++++++++++----
 drivers/ata/libata-sff.c       |  5 +++
 drivers/ata/sata_fsl.c         | 24 +++++++---
 drivers/ata/sata_qstor.c       |  8 +++-
 include/linux/libata.h         |  1 +
 8 files changed, 161 insertions(+), 41 deletions(-)

-- 
2.55.0


