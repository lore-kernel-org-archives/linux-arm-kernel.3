Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F98E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 05:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXaOeV/vVeEEKWiAyXagOkMrCMJGxdxegYiutxE9Ruk=; b=Ji6647w13Pof+jmW5VvQh4kjqz
	hR7QX6jO2CQsVCLieSnV8+F80Q2eSlsA0TetSUApXThLNubhv2kiYcRLIsGLo9NS77OjcuDajZ7m0
	FIKrMuBhgnIYXCnUbFg7v1gsaO2Swj9qSm8BC/DpVZFwNV51Z9hRnEhF8YTSJZDG1LFOoVoTeDLiX
	NyvqCWd4Sk0oZDAcfOxYeKjsnAQ5UHJlhew8bFHsGShna6VKR6WNlKNa1AlFyTPDHWcOGEKWq1LZJ
	ivofGlhVH+JQT0vcZGA2+3KEdCW0I04WIWDssa6uvFS6SkXC3G/08UTnMyrV8lx9P0tXL3t4Dowt2
	Q7JgWnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlT8-0000000AqYe-2VuT;
	Thu, 09 Jan 2025 05:52:35 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlRn-0000000AqG3-23Qb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 05:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736401871; x=1767937871;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gdDR9InM8NXZDYA6aFu8uoVuRC7m3iROwvyJa1EVu3Q=;
  b=jOa8soBAHSr4v5VvD7L+Kz2QPuFjOVy0hF8vliQeLH6Z1jd2OkCnMWxP
   niFaPvzJG3wncqPIxaEtbOqj9BbgtwGdDAIA69dAeSVuETGXzN63Fd2kV
   ijnatk+NzrSqvtoahvlPhe5xxMK2omdM+f6nHnkIJMwcfBXi12nuNBSMd
   e/x3EYN2A5mBvR2ZTRheWGBrx6KHswqxana6LDY/vQGQsi+rx9g4Fvy9e
   WV+39nhq96coySxBRud4zhuNBphEWKXjS3VZNzsABxtcwYkeGni7S+Drp
   By85FGI/iVq62Jg1sac8P+zBnVnGWjkeRXeoqzigjyP7A7xtkl1lXvAVP
   A==;
X-CSE-ConnectionGUID: szzw80aaSnS2og91m3E3bA==
X-CSE-MsgGUID: N4ymIkV/Rc2uLbpsvv4raw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="173373536"
X-IronPort-AV: E=Sophos;i="6.12,300,1728918000"; 
   d="scan'208";a="173373536"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 14:51:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CEEDE0767
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jan 2025 14:51:03 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 552711043E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jan 2025 14:51:03 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id E50AC40059F08;
	Thu,  9 Jan 2025 14:51:02 +0900 (JST)
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
Subject: [PATCH v3 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Thu,  9 Jan 2025 05:45:42 +0000
Message-Id: <20250109054544.2342442-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_215111_813433_7821ACDB 
X-CRM114-Status: GOOD (  11.32  )
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

Changes in v3:
- Change to use CPUHP_AP_ONLINE_DYN for cpuhp state (Jonathan Cameron)
- Modify the code as suggested (Jonathan Cameron)
- Link to v2: https://lore.kernel.org/all/20241122061753.2598688-1-fj5100bi@fujitsu.com/

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


