Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3438C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F3WtRn/krg2rmBP9MyxY3Qe25QYijys78KFs+o6H1Yg=; b=Wrmv2FnwDle40QA2Qv2MVMkT6I
	uZBzbWwxYeIPpAfD0SZxZEI9pLC7eOLkEKR4TmKCpHDbMSuqoos2whoo3tjDwsTJkLkxItiPG2qtV
	yFfayChPU4xM/JYV3QQHlCXwspYOtF6wgV8oIwCqGgQTKv3Rz+Pp3T1zsFxI2fETPQRPuYU8YAwKF
	P8X5N6e8tyMsBfLgSNNazB5By0yytiXBsga7bopnmsXLlJGfghTg5KpHTqZjmqmtJx5FsqoVIp7S+
	OGfteiRtL1qp+tDRmaaGllzqk9Cy4rtD5+LcPOMzsORggywJc0W+HUSYyyRR5oU2dedIBilVs/rsu
	fim4VYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTia-00000006wlo-2zuN;
	Tue, 17 Jun 2025 10:39:04 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTZ0-00000006vII-0LF0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 10:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750156150; x=1781692150;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pnhUkbY2mgh5Xqb/2wQjNDvJKL6EEQEt1xGWbB9n4sI=;
  b=Aelz/rvCUGaNpxLkH2yLNJUNrcNu4aD2UginEz0NKVFf5dkW3z54oYfw
   AdmxblmThNEBLv/c8CG2F0bSlTtaAD/lcjJmSIo6OxsOs5vusouIB2dYd
   EzXFGmImFaFD8x8Uhr9j8Kqtw4I/kmrbYPfyj2YsrwHXpu39XWDwcX34S
   KlmPas97O0mKeOJtLvGO3ZayC+Ec5dh8hTf6yZX1xQM1VYbRpnzqEQs21
   JxFEkyaMfde9Wfb2Re3E1y6DzWeNbc6KMBYUMbuvZMWRDQya9EZTPwHS1
   4naRz+Rx4OUHPVNGK2W42m9cxzF/y40C7QoYZj3ee+56L7poxfQtchLNS
   A==;
X-CSE-ConnectionGUID: usORierZSsq4DMk4s123wg==
X-CSE-MsgGUID: ePpwf2MDQhmN3Ta1/H3NfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="190959362"
X-IronPort-AV: E=Sophos;i="6.16,243,1744038000"; 
   d="scan'208";a="190959362"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:29:03 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BA3AD29FE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 19:29:01 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2652D4C0F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 19:29:00 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 1D13B40045BEB;
	Tue, 17 Jun 2025 19:29:00 +0900 (JST)
From: Koichi Okuno <fj2767dz@fujitsu.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Subject: [PATCH v5 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Tue, 17 Jun 2025 19:27:48 +0900
Message-ID: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_032910_523020_3E5DE8E4 
X-CRM114-Status: GOOD (  13.00  )
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

Changes in v5:
- Update PMU events for FUJITSU-MONAKA to latest(v1.1) spec.
  The changed events are as follows:
  - Removed events:
    ea-memory-mac-read
    ea-memory-mac-pwrite
  - Description changed events:
    read-count-return
    read-count-return-pftgt-hit
    read-count-return-pftgt-miss
    ea-mac
    ea-memory
    ea-ha
    ea-pci
- Modify the code as suggested. (Jonathan Cameron)
  - Added include mod_devicetable.h.
  - EA events that share the same description as MAC events have been
    removed.
    These events will remain in the specification, but will be removed
    from the code.
    These events will be supported in future enhancements as the
    specification changes.
  - Changed MAC events with the same description to different
    description.
  - Changed some programming styles as suggested.
- Link to v4:https://lore.kernel.org/all/20250116045911.3382537-1-fj5100bi@fujitsu.com/

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


