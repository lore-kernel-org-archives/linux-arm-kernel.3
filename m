Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F78C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ldalw7wcXuY7AhHeRhR8de/nVu1/bjTkbR1VJ+hgqtY=; b=uiZZwvLhfaw5RUYXGT/y5XJgNA
	NDvFl6yp5T2x8PvmYWpfFuUU8nZgYX5EPJVJCRVocKdCb0A00JFAkut25lHPCXuyCOG0M5Eb8pSzY
	3P9fdx5e50CxCRMeXRAGX+/f4Puy9qaUUww4mkWNXJpEiZaUzeuWQC6YZVINZ3VYYMQfEK+kcH2pk
	Xl059ZDaymJt6BaURMqDIbdS0S6RKmA5nDCRaFRIJOyOEGuPR9OoWGeM3iZEQxtPDe3zk5BYB67s0
	gm5X1poBpOuKryfC5FsrDj7uRTmjfIr1tJXjd9PGq6h+snB/OBKLe0iU2Mo0hHnn5AR3sP/gXI5ij
	Znkw1+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua84o-0000000Dwnm-3Mhy;
	Fri, 11 Jul 2025 07:21:46 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua80c-0000000DvoB-0xyX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752218246; x=1783754246;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=htbULLvIprcyq7yA8huF8f4wUfQOwP+2TeOLYkOXT0k=;
  b=OG7h9pLopqxmaZk4/y4vLSLniTVNm/fRYYqC3TWibCzie7d/MeHos00U
   pjyQiVX1gJJG1Gv/TkgFxzS9aav4MBkxDkllw8lK3yotP/anwLxqxoBXm
   22a4RnfB3xxE1y4p5rNmbSqpGs27uJ6haXbo5R4PEFM6GP6bExUTESzGs
   2VcKD4CRKms6oildhN72l1lBatrniBA0GxOSd7L5Vyyj88w2FajkRWb/U
   Ut5LK9WCAD00TY99yCZR6Byd7qOMldOQzXIK+ag4lRZK0+Okh2QWZZdpA
   fx9IYCJHNdo+idKXCE7ipEnUBJeteQSdLRtKbaIaDPifxrZ32bnkX8HVm
   w==;
X-CSE-ConnectionGUID: ngqMYTEsSEyz4XzC59UoOw==
X-CSE-MsgGUID: 1gPQfKUWTpq3yoJ/i4kc+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="206003245"
X-IronPort-AV: E=Sophos;i="6.16,302,1744038000"; 
   d="scan'208";a="206003245"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 16:17:22 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 59B701C00099
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 07:17:21 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id CC9CD100136B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 07:17:20 +0000 (UTC)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A912BF3CC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 16:17:19 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id 5FC4240059D52;
	Fri, 11 Jul 2025 16:17:18 +0900 (JST)
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
Subject: [PATCH v6 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Fri, 11 Jul 2025 16:13:38 +0900
Message-ID: <20250711071404.2138816-1-fj2767dz@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_001726_744729_92CCF559 
X-CRM114-Status: GOOD (  13.32  )
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

Changes in v6:
- Modify the code as suggested. (Peter Zijlstra)
  - Added PERF_PMU_CAP_NO_INTERRUPT which means not being able to sample.
- Link to v5:https://lore.kernel.org/all/20250617102819.3685543-1-fj2767dz@fujitsu.com/

Koichi Okuno (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  73 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 569 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 553 +++++++++++++++++
 7 files changed, 1267 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.43.0


