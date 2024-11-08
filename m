Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62392D5E130
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqArwV8FVwXxhEBpcLiFH43oz6+PNtI9x93XbMUbxdA=; b=AQ1zhtoY63b3ZjWgCKZ7ZWSyg9
	GSlMlp4dTQljcRsLWe4u0VzAywqOjG4FqIwEQVVUrwHQfkRcY/zD6tUA+6aE5GC/Z2L2lVUS77hjC
	GZ1uN3dsYyGrhDlwcDmOndTeXDvB4XgrH3tUQJDOcPwXIn7+jjAQWXoll2kpY7tAN+3zbI5Nryd46
	Souj4Tzg7KSDxFtkkl84DOtLcyVQ0H/s1JXpJsU+o4CpFEYGJtDKG7Abps23Md+J8lTYJw6cyE4XF
	QaDC/QWYxCYtn6rG8OYjDAyhDn4tcRrJo9KwWUe4/7xTjI/x5AiwZA3czKVucuCyscRoB7z1IRfvs
	x4jyVMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HlA-00000009P8q-1NEm;
	Fri, 08 Nov 2024 05:42:16 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HjL-00000009Ori-2CCp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731044424; x=1762580424;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8e/eAhDzfvSDC0eQVVCO5m+vLCVCSOtwnchdpJ7awk=;
  b=ekFl5sco4l52TH682BlmSC6vEH9MRtUBDBJ56Z8z8HNzNvzxanG6XTQx
   2iVZNqOn1Yznku+6FdsQa5f/AikoSWuhecs+XAyAOuoNJEvAQpBkFiulk
   ArjONuZO1ekrRe8tJkLR4DakH9bpIUO+Dh8iYUW7v3cxX5DRgFtI5QQKC
   xA7I0fB/7NvwI67TkZ1F/atW97o2dvkSRYL0x5EmGgq+lJL3QIXimmtY2
   e9YyOrLVNyJyFEZ8fTB4Ggj7nMvCV3o4Wp7Z0dYDcpPS26XBVSBZOJt+r
   DVPTWnRPUjR7YFSZKUGs7tGeljpMMmxf7v2HsEm7UrT8aHajAqneGrIGx
   w==;
X-CSE-ConnectionGUID: rHGgsdrJSdifvh1BxKep3g==
X-CSE-MsgGUID: NGOMavATT2CBUrQw95Bd+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="178781637"
X-IronPort-AV: E=Sophos;i="6.12,137,1728918000"; 
   d="scan'208";a="178781637"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:40:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CE6BC3F90
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 14:40:14 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB875D091B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 14:40:13 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 8341240045CA1;
	Fri,  8 Nov 2024 14:40:13 +0900 (JST)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Fri,  8 Nov 2024 05:40:03 +0000
Message-Id: <20241108054006.2550856-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_214023_939669_4F1D967E 
X-CRM114-Status: GOOD (  13.90  )
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

I have a question.
When I run scripts/checkpatch.pl, the following WARNING appears.
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #56: FILE: Documentation/admin-guide/perf/fujitsu_mac_pmu.rst:1:
> +===========================================================================

Some of the files under Documentation/admin-guide/perf have an
SPDX-License-Identifier tag and some don't. Is it necessary to
include it in fujitsu_mac_pmu.rst and fujitsu_pci_pmu.rst and?

Best regards.
Yoshihiro Furudera

Yoshihiro Furudera (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  20 +
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  20 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 633 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 613 +++++++++++++++++
 include/linux/cpuhotplug.h                    |   2 +
 8 files changed, 1310 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.34.1


