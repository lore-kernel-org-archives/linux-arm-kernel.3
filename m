Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C7CE65D29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ualw4WpeAlyKTW/yQFDS6yxO1huQGoWaLKhy6+culTw=; b=sC0TL7lYrrJLPGm6Bt9BWpBqb7
	tfI9PzN2Te4c9uOJmQaEICZueRYsWJwxE/mpl2qG6uuzR4TwLlskdXg9JGU1WUDOJfo4u63BxhsZS
	9yEEA+lFb72Em0Wz4RapjwcQ6uL3+yLePmGTAZwVMHq1Euqg6pWW2XoJPGb/6LkPc5LyecQkizV5h
	dCpHRE8Qmby5r/pZsoiabkqMkyQBRuIgjFU3jGriPVu3/2YkmjSgLxFwPIigfqy03t7D2pGPRcb3k
	EqK9TdxRsN27QSSdo/c3Lov77carUwjaOpBioO82m9GvS80DlvV0/WqMZuQi3cVfNbyqf8Ft7Q0zF
	hYXH8B+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEN0W-00000001iTz-0WKs;
	Fri, 22 Nov 2024 06:19:08 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMzZ-00000001iQ1-2lVs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 06:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732256289; x=1763792289;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OjbRzPjMQf/A1XqDZL65j6jaq+tqAam7giUnBrT0mVs=;
  b=daYywbb4tCoXBc+W5i1LPzEqtHq/o39yTmx1x8u5hH/KomP5z4Ijbsq8
   cxwlUimNYSyruZpT3s402KGiu2PMTLkxEUAPbSsPXr786XTaZTAYBABw1
   QVhJK/o2tB1/jPHxMIKp4gFbpZ9YDXmFoAFN6sEe5Hx7l4JFVS5ZPLhgx
   8FYoDiMG0vHjzgLQhHE3e6uioVtUleU9UeCoRQ4WaSRQOWJ02GPrjL7cK
   xDFIP+K8P42moLsxRttDiKQXt114dINxfSeNiadasFHcAZ87Lsfy5IqOv
   qTFxZNvj9jx6GC24/JE7MSjg8DyiWTZ2C+iD/PyRtpDuT11fCdrZHGkGG
   w==;
X-CSE-ConnectionGUID: jmLV00YfQvOp1bVa7LNlzw==
X-CSE-MsgGUID: prYt8y/uQjmel4Ck123d+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="160169425"
X-IronPort-AV: E=Sophos;i="6.12,174,1728918000"; 
   d="scan'208";a="160169425"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:18:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA395E8523
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 15:18:00 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42B8724FB0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 15:18:00 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id DF8124005C83A;
	Fri, 22 Nov 2024 15:17:59 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
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
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH v2 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Fri, 22 Nov 2024 06:17:51 +0000
Message-Id: <20241122061753.2598688-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_221810_206580_41A64F6C 
X-CRM114-Status: GOOD (  12.93  )
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

FUJITSU-MONAKA Specification URL:
https://github.com/fujitsu/FUJITSU-MONAKA

Changes in v2:
- Remove changes to arch/arm64/configs/defconfig
  (will post patch separately) (Krzysztof Kozlowski)
- Add document file name to Documentation/admin-guide/perf/index.rst
  (Jonathan Cameron)
- Modify files according to the suggestions (Jonathan Cameron)
- Link to v1: https://lore.kernel.org/all/20241108054006.2550856-1-fj5100bi@fujitsu.com/

Yoshihiro Furudera (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  75 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 570 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 550 +++++++++++++++++
 include/linux/cpuhotplug.h                    |   2 +
 8 files changed, 1269 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.34.1


