Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mps6aSE+IJbjIcapJ0FXuPjRT6PLfWZ0CugfMkJfNsE=; b=4tU6SJjM+aCpztn2A62RDmYPvY
	WMyd2tJymNbosTsQjLwve2KqRyqMgYTFjgwbE6662nzBx485UQ9sAXcFR6JoQoMmSpzuDtY9xRsoS
	5vKQxT4bau79+KbBqeSD0ZSCyNS0AhSMR+21eiSknkohKbrz8voOxirQL9iy+pT9ruJg02X/5ucpL
	xjTwcl5FWuvVuRVWSUeEmkrzwwSuC3IiJvjXAY+aSDL+hjrOTa3MmP6S/KNVrzDmW2BLjaBCDEfhN
	M98kM83BzJ+EbA5HNHIMIDqDYCBvSD9AqOU3y3qVKXh3aT8pUo0VYZ8ge8RYVpK4eW8NzVbFpy/Ry
	QeCSFAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0jv-0000000Bjmq-3iKs;
	Mon, 01 Sep 2025 09:22:15 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Mj-0000000BenN-3W17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:58:19 +0000
X-UUID: c4d74aac871111f0b29709d653e92f7d-20250901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f1e2aab6-178f-4d82-b846-3ad535999412,IP:0,U
	RL:0,TC:0,Content:26,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:26
X-CID-META: VersionHash:6493067,CLOUDID:16a24fa6142617347b8ddbaac62faf64,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:4|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c4d74aac871111f0b29709d653e92f7d-20250901
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 920024082; Mon, 01 Sep 2025 16:58:03 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id CD288E008FA7;
	Mon,  1 Sep 2025 16:58:02 +0800 (CST)
X-ns-mid: postfix-68B5601A-630246734
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 23964E008FA6;
	Mon,  1 Sep 2025 16:57:54 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v3 00/12] cpufreq: use __free() for all cpufreq_cpu_get() references
Date: Mon,  1 Sep 2025 16:57:36 +0800
Message-Id: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_015818_212535_B96AD7DF 
X-CRM114-Status: GOOD (  11.95  )
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

This patchset converts all remaining cpufreq users to rely on the
__free(put_cpufreq_policy) annotation for policy references, instead of
calling cpufreq_cpu_put() manually.

Motivation:
- Reduce the chance of reference counting mistakes
- Make the code more consistent with the latest kernel style
- behavior remains the same, but reference counting is now safer=20
  and easier to maintain.

The changes are split into 12 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V3:
 - drop patch 'KVM: x86: Use __free(put_cpufreq_policy) for policy refere=
nce'
 - removed 5 patches which has been applied
 - Consolidate CPUFreq policy assignments and allocations into one line,
   suggested by Ben Horgan
 - Change cpu_has_cpufreq() return type to bool, following Rafael's sugge=
stion
 - Change the title to 'Use scope-based cleanup helper'

V2:
 - Fix compile error in powernv-cpufreq.c
 - Split patch to separate logical changes

Zihuan Zhang (12):
  arm64: topology: Use scope-based cleanup helper
  ACPI: processor: thermal: Use scope-based cleanup helper
  cpufreq: intel_pstate: Use scope-based cleanup helper
  cpufreq: longhaul: Use scope-based cleanup helper
  cpufreq: powernv: Use scope-based cleanup helper
  PM / devfreq: Use scope-based cleanup helper
  drm/i915: Use scope-based cleanup helper
  cpufreq: powerpc: macintosh: Use scope-based cleanup helper
  powercap: dtpm_cpu: Use scope-based cleanup helper
  thermal: imx: Use scope-based cleanup helper
  thermal/drivers/ti-soc-thermal: Use scope-based cleanup helper
  PM: EM: Use scope-based cleanup helper

 arch/arm64/kernel/topology.c                  |  9 +++----
 drivers/acpi/processor_thermal.c              | 18 +++++--------
 drivers/cpufreq/intel_pstate.c                |  8 +++---
 drivers/cpufreq/longhaul.c                    |  3 +--
 drivers/cpufreq/powernv-cpufreq.c             | 11 ++++----
 drivers/devfreq/governor_passive.c            | 25 +++++++-----------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  4 +--
 drivers/macintosh/windfarm_cpufreq_clamp.c    |  5 +---
 drivers/powercap/dtpm_cpu.c                   | 26 +++++--------------
 drivers/thermal/imx_thermal.c                 | 12 +++------
 .../ti-soc-thermal/ti-thermal-common.c        | 11 +++-----
 kernel/power/energy_model.c                   |  9 +++----
 12 files changed, 46 insertions(+), 95 deletions(-)

--=20
2.25.1


