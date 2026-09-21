Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE0C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peND3u9iKMtv2zvMcDVYUpzbofbKohHRcq1jnaDFbnc=; b=a9LjiDC/OMUpwfMsPS83wyDg9o
	Aj1UPPoYKm5of+cVdhGKl7ZfY9SjkDcf0QVa6V0muxf6pwnm4FU+C+/Yl+GSxACEncRgpe9nkJuap
	5gpJgHmgBPXtfDsF0csLupOL/G48t7IMa9azBNs3lePyVnptENsTlMfdBwMdnuJHeg52cTYWd0AKJ
	fOFr9zcl8Mteh142vBf9AKe5K8HVtKaamPIRfoOfBnB/ptrxw/3lbPO6Pnf2ZZEaf7Jee4az4bdqg
	yVLWZdidGjJw5XiDinPGWfDmvioMKB8O6qD50yI8mrd4s6KB6PTR/vGzBQA7KQdhB6NqIKi75MBpz
	466gcdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAP-00000003IHv-2jxJ;
	Mon, 21 Sep 2026 19:59:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kAO-00000003IGn-0B9x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:59:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3140460008;
	Mon, 21 Sep 2026 19:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371B41F00898;
	Mon, 21 Sep 2026 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020746;
	bh=peND3u9iKMtv2zvMcDVYUpzbofbKohHRcq1jnaDFbnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ICHHt2C0VmIDG9URopw9qksrwfUtfgRpDtLr+UrdDLrG0zqSgNRcj9CdJDNVRufIC
	 F3w8czv3WxRzXSCWLJ90f6yDOqd6OQiYhbq+EGOmgn03UX9fqv0buL2lF8CMp38Eyd
	 HsNH25u/jeQ+Q40aTaQxvkI8rrLrmdUfNy5JemcL/jgGHv7MxNDyWzvr9SXR4dbvKN
	 k8txKnaCLwKXHtCmXFSWZac9ur+5LIn4uVKC52SRzMv9JBWS0CCCuHcdk36xUZaTlh
	 of22+Al90cbHGAdRI5Gga3ob1lfLdNdmrMT4k2g3smLeHs8dc5Eirhfj+Bn9IB8i55
	 IBho6QPK9NEKQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH v1 06/17] platform/x86: serdev_helpers: Switch to use
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:49:07 +0200
Message-ID: <2720286.Lt9SDvczpP@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
In-Reply-To: <7995179.EvYhyI6sBW@rafael.j.wysocki>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Replace acpi_get_first_physical_node() that is slated for removal
with acpi_bus_get_primary_device() that takes a reference to the
device it is about to return.

This addresses a potential use-after-free that may occur if the
device returned by acpi_get_first_physical_node() is removed right
after dropping its ACPI companion's physical_node_lock in that
function.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/platform/x86/serdev_helpers.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
index 57eac75805e2..20267e1941f1 100644
--- a/drivers/platform/x86/serdev_helpers.h
+++ b/drivers/platform/x86/serdev_helpers.h
@@ -74,8 +74,7 @@ get_serdev_controller(const char *serial_ctrl_hid,
 		return ERR_PTR(-ENODEV);
 	}
 
-	/* get_first_physical_node() returns a weak ref */
-	parent = get_device(acpi_get_first_physical_node(adev));
+	parent = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!parent) {
 		pr_err("error could not get %s/%s serial-ctrl physical node\n",
-- 
2.51.0





