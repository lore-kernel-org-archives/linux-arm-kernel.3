Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=myLK3+vE+bT63IqM6DbxSRFiNiyxb8mWpKrlTh3FyGw=; b=xFiqxUwF9yDrxF682aVyrR3rr9
	CyGgwkSh8dm6iYnUo5n37OMT2C4v0s8KbwptfCHg8iyS52zBC8XGLVUn1bHbUqUv4d9HPabDevma/
	pzA/W0cWAzRlhy6uWemQ154CUwyXSUsiem8LVfU7wkYH5U2N+riSZrRK1LFXdOHaLnmzMi3pzs4/8
	MqCojugkZZDkkLc2naHGPaoDC2B68XJlBbmA4ijsXiqRz7j4s2EPJs9ypVvLj/IJDQh9enTbX7IT5
	XtrUbYcAX18nA6qe5jtTXXIBdjf7GDXvAjdtNwEfqHXVavXo2118gQP9cDAv7tf1nXkVo8rHbXZ1E
	i0LoIGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHzt-0000000DqGd-3COV;
	Thu, 16 Jan 2025 05:00:49 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHyZ-0000000Dq3X-2f13
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737003568; x=1768539568;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2mAQQo2S97LPir2JTuEGQGrwuI/BTWwVJ1Jqv9AaU5M=;
  b=TK4l+pL6mCjkF54LnvxYTg2pk6ZAkfgkAMtnZyNZhIOBWWRldx1zocLt
   u2BEStqWKnc3sWhCOvnfQWcniAwdAYOxFdNX2e7WERalVSEzbp6t+O4wN
   CNE0hb0JoVyn/kjF655NRrJJMVpMScrjULAwNOY+rU7J0iOS42wWmjcfG
   7WIUnIiUsYA5tMsBrkZ0WBdqfcQjIMtYgxcCjo/sasnnRSWFN0GkXw/1y
   +5vMi6i/2tdhW78FUxCfRPAKkiEyiX9S0xJ3yMq40HNGQw0KCPpllvNy2
   eEyM7X/c0zX71DA11yAi94Ku8XlckmBd9zRx6mQ2UmBoHVe7Gq3WQvOH5
   A==;
X-CSE-ConnectionGUID: pgKkYwxLSFC4WN+rdDGOxg==
X-CSE-MsgGUID: /vRhYcPlTZKCdpfkYB4MYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="186745745"
X-IronPort-AV: E=Sophos;i="6.13,208,1732546800"; 
   d="scan'208";a="186745745"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 13:59:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35726E0767
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 13:59:20 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A3C6D50E2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 13:59:20 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 0CDBB40054BA4;
	Thu, 16 Jan 2025 13:59:19 +0900 (JST)
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
Subject: [PATCH v4 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Thu, 16 Jan 2025 04:59:09 +0000
Message-Id: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205927_941273_C0D06E3F 
X-CRM114-Status: GOOD (  12.30  )
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

Changes in v4:
- Change the enablement conditions of the Kconfig option so that
  compilation is not performed in environments other than ARM64
  (kernel test robot)
- Link to v3: https://lore.kernel.org/all/20250109054544.2342442-2-fj5100bi@fujitsu.com/

Yoshihiro Furudera (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  75 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 573 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 553 +++++++++++++++++
 7 files changed, 1273 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.34.1


