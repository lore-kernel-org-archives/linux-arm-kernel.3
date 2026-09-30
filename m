Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D58BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQ2QwwI3avoP25dNRmxG7as4Pv+Y98K9wMxhJYOR9uI=; b=dnxAaK1hbTI2Jzmsq/XaTlE7oS
	DNIGuWTwNPalgo/eo06j7rgZ8XRluhVQmUzgexV7mOr/nAGoJilcUAfoPo/YjBnoC3bXHUR5WoZHk
	pNqAzFj0RlIPIPlXh12nlcDvZ88GQjPoY3M57FBBB21i6ti6puHRnMeOmz4fVU5WaqFSZ3+c0uW/v
	gZ4v/L+a1rcy2C0ltM3Y/noYzKcwtTXqa7g7Ll9isQtA7MM8WWlJtWW9P1WaIVmX24rI4Z0BTwYdL
	okIPU1u9OgwsSd/78kAycipzxFnejCLaK/Zq5q+9IQXQ6QbLCSnyrCz48BFE+lxn2xq/si9fZIqhj
	iIBPzxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJP-000000070ZV-4ADz;
	Wed, 30 Sep 2026 18:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJN-000000070Xy-2h05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 210FE407C4;
	Wed, 30 Sep 2026 18:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226471F000FF;
	Wed, 30 Sep 2026 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793949;
	bh=yQ2QwwI3avoP25dNRmxG7as4Pv+Y98K9wMxhJYOR9uI=;
	h=From:To:Cc:Subject:Date;
	b=PlULGXTZQ54c7Llau1cooqhd/TDJU5GWQRZHrW5/l1Xg+n1C0XNSmkHNDfqO2o6Pl
	 ajbRmBp/1O1YIY5aYMAO1gc7BV+rXg8Dn68ELvIu+//u+iLRWJeG7z39CxfqONRG6H
	 6P9gAL/Yy16eg1AEIcagBc0W8+XBzbKCvBYhCjCVChcbWlNMZ9vgScrvNY7U8m81rt
	 eDFKSfanqNq7EXY5BpxWGuA9IiFkQ5Ywc+Y4gioXO/wVmrbhi4vvwavVUwqoQ5DE+a
	 LB2lHmipNEju52t63YAemWJoZv9VBR9GyrV5O+Q5ln/0nApK2QoNit6BaiXFSBogE3
	 HGROvZZmBLRcw==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>
Subject: [PATCH v2 0/5] ACPI: Replace acpi_get_first_physical_node() with
 acpi_bus_get_primary_device()
Date: Wed, 30 Sep 2026 20:30:47 +0200
Message-ID: <4766532.LvFx2qVVIh@rafael.j.wysocki>
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

This is a partial resend of

https://lore.kernel.org/linux-acpi/7995179.EvYhyI6sBW@rafael.j.wysocki/

that only includes patches that have not been ACKed and the last one that
depends on all of the others.  It is based on linux-next.

This series replaces acpi_get_first_physical_node(), which is inherently racy
and therefore generally unsafe to use, with acpi_bus_get_primary_device(), that
doesn't have this problem, everywhere in the code.

I will appreciate ACKs from maintainers of the code updated by the patches, so
I can pick them up and get rid of the problematic interface in one go.

Thanks!




