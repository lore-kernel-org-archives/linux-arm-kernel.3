Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07545C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKybdObHK5GCZb1lSd/qvmfz9G3Qc2nU5yiHgWTrhLs=; b=2DSNJfYHuLq2358iCNtkNWnKp6
	Z0AuZJsztrJT2dKrEB8J+bVIGMqXAf9S5RC3VxdDNWkSQVm3dbwPC5TlYay7cK03DOYyUZvQwgoaj
	HnCbSr7YBSB46QsrgveqR9m0qTU65fYM6652UXknVnicIX2nl0IO3i8pDwr1x0/g1m615hyx1SWry
	XFvFXJxqu3VqOsIAOp5G3LYqMIe6QiSsiMRtCbILXxn5uZLOoJt80WbDdgu7cyMJsryAr6il1EaGC
	PwVUuR+XiXUGS/YMqf1leQhdz+Zzs9NdiawrTd85C8eA6UFlB9tuFszkIQRewjuzDUvWjkBPTLkYU
	0KJk5/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kBU-00000003IoA-2XUU;
	Mon, 21 Sep 2026 20:00:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kBT-00000003InO-1SsR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 20:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD55760008;
	Mon, 21 Sep 2026 20:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DE01F00893;
	Mon, 21 Sep 2026 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020814;
	bh=hKybdObHK5GCZb1lSd/qvmfz9G3Qc2nU5yiHgWTrhLs=;
	h=From:To:Cc:Subject:Date;
	b=DI+0v/TK1t2katgmeQl+N0Q5v0Grbjw0veGw7K2Joex7Z6rdPJ/A1rlHJZsRCHtt7
	 bY9/Ie5SCBRvAYVN3tq/+sf4M4m7B2EHWRP9psxdda7JBvRxU7JrCTX7S6jId+Tq+g
	 QCLQiKNi+GGd7OOI21Wh4r61eqGyCzS66AIpLhOnyjp2yDpk5M+LJx8uf2o/8Rxlg7
	 4by3Q+O/cBWB5XeUVDxom2YOm/WKU0aHwSB7KaTF8+q0/bZDuAZzU6Djf+pOTMqhbD
	 hl/iQSf0gaSnB33bY3xxYfuMz+LytqSUXYGKWUZBMFASDLhpM1wHflH1W4id4/0p/f
	 ta/+45s4mRLQQ==
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
Subject: [PATCH v1 00/17] ACPI: Replace acpi_get_first_physical_node() with
 acpi_bus_get_primary_device()
Date: Mon, 21 Sep 2026 21:45:17 +0200
Message-ID: <7995179.EvYhyI6sBW@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
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

Hi All,

This series replaces acpi_get_first_physical_node(), which is inherently racy
and therefore generally unsafe to use, with acpi_bus_get_primary_device(), that
doesn't have this problem, everywhere in the code.

The first preparatory patch is needed because acpi_bus_get_primary_device() is
defined in acpi/acpi_bus.h and the subsequent patches depend on it.  For this
reason, I will appreciate ACKs from maintainers of the code updated by the
patches.

Thanks!




