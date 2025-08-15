Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC251CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWI7Z0LOebfBswqp8chQT+Pu10RX82zpTGVf8bEcBcE=; b=IXjXFkvdL7QcBZNFj44kAORMX/
	yYAQbLeNUovLqmHn6jNGa/8wfIPQnNKSl6Mq9hUev/8PzHfrkyUrtP6PNPPe5Azozu4uUfl5zQTok
	eE0CqUmH5y2XIy/Zm+1oO9qHQjWgBwOehzod3gXjEGFDuY4dsvbu/KxB0Pyp8bEc2TiRU+0NLhz1F
	C71RKnoCHczniAsEAl3meCNtGgv6d6buJiix3UVOOGsZc+yh49vmjDuqXKobNs+p72yB636K4kST6
	vsos8AbRBudOjzrIAHiRfd/lMCPE3pofeAGExuWl4FvyYPjjv+o94ZCg6ujGrNIB+vIRqXiM2cD1b
	VL9+42QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlc6-00000001MmB-0YLs;
	Fri, 15 Aug 2025 04:00:22 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlQO-00000001KfB-2Lmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755229697; x=1786765697;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vb+8+cI/6mN9k6R4rO9pApJyDljK42JSjMf6BVyNR6M=;
  b=YXhEEzvl/i26oVVE2nVbh5SNjdTFKCJ2FGrxOZeWeNCOsRRL/DsY51xF
   ETj5LrBRH4NZ1PdSIJain3sY1I2I72p7z/yI7YR8eoS9DjmvmQp1uJ82y
   NuNag3yjWpWLgIJwKhp7RgNyAxFyhgYbnW27L+0fX94TlejSouO4/wHHV
   +mejy+Pjgga2bQ00uRz9KT521LMaE/nxoFaRlivmvhZ2IIwHljA/158ym
   DU8Fg91EPX+FAyWFEpofdj63rLBl4VVUtfR3M4YAVYRxJhmP1ZH0ESpoU
   +eB6vP3H07kleYdOWUwoeoRgMvlLlLIubR88i4fnQ1i8lKDz6ZMdkcr6u
   w==;
X-CSE-ConnectionGUID: 89NvDO63SK2GpF2Bnnx+tA==
X-CSE-MsgGUID: WGjxcRb7SI+yj4YIRKXMfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="212714370"
X-IronPort-AV: E=Sophos;i="6.17,290,1747666800"; 
   d="scan'208";a="212714370"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 12:48:12 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2F98A1C1C715
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 03:48:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D8709180DC7F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 03:48:11 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id ED482829192;
	Fri, 15 Aug 2025 03:48:03 +0000 (UTC)
From: Koichi Okuno <fj2767dz@fujitsu.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@fujitsu.com>
Subject: [PATCH v7 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Fri, 15 Aug 2025 12:47:27 +0900
Message-ID: <20250815034751.3726963-1-fj2767dz@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_204816_987408_6594BEEB 
X-CRM114-Status: GOOD (  14.11  )
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

This adds two new dynamic PMUs to the Perf Events framework to program
and control the Uncore MAC/PCI PMUs in Fujitsu chips.

These drivers were created with reference to drivers/perf/qcom_l3_pmu.c.

These drivers export formatting and event information to sysfs so they can
be used by the perf user space tools with the syntaxes:

perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls

perf stat -e pci_iod0_pci0/ea-pci/ ls
perf stat -e pci_iod0_pci0/event=0x80/ ls

FUJITSU-MONAKA PMU Events Specification v1.1 URL:
https://github.com/fujitsu/FUJITSU-MONAKA

Changes in v7:
- Modify the code as suggested. (Jonathan Cameron)
  - Renamed the macros name to make it clear which register it applies to.
  - Deleted unused macro.
  - Changed some programming styles as suggested.
  - I tested using v6.17-rc1 and confirmed that I get the same results
    as before the macro name change.
- Link to v6:https://lore.kernel.org/all/20250711071404.2138816-1-fj2767dz@fujitsu.com/

Signed-off-by: Koichi Okuno <fj2767dz@fujitsu.com>

Koichi Okuno (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  73 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 552 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 536 +++++++++++++++++
 7 files changed, 1233 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.43.0


