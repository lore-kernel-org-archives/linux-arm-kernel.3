Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D229C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 02:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gNqru8yrl67V0yOllgCvlWHNYlGRBZpq23d5Cwe5LY=; b=EYhbAxXj0WuLkBA1HGMqiMmlTP
	EvqDLTnqW4h8z3auwa6VI96xw2AD1lOgzAcLoG3UXQQB5imaDiI+DXOXhlW90BomgvxGBOlz4Fe6q
	YMbBDACIbm+Oe1JQolXKMRTPlPhwKUwADcNVNs93vvWNSkkXdFaYbdc9l4qJsH2hO+pSHH9VOzzqT
	0/7Ku9WQ18DKxPiFEuWIP3iTqe0Ov19mX0a8uTw4+Q/9KC4GglguyBKLbwJPNeL2Gt4vHrUPOG5wQ
	Rrtqp819io+J50Nq7HGasD6rf1pCAvSJs4hnj4vQnxZiksjtf6v2VYRn92pkTDTxEw6aDyqNwHQ+b
	89h5VhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGBd-00000000W3w-03uw;
	Sat, 14 Jun 2025 02:00:01 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQG9T-00000000VuL-1rm3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 01:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749866267; x=1781402267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mO3W2NrTpePz2f5jjCKTmlMxf7yt84jHJqEni8pvzzY=;
  b=IB5vNAIGW5D/5w/MuaZ3YklcK1luu/hwaxWRQBQNfAqfQzzaTsEuxBCm
   hq4KsoVoP4iNE9T4/ItfhRWWsgmBxf5IH0iDjECa2qQaCMolM9jnpau6S
   pNRd+3zYfO3b0r74feEZpR2jI9i/Qy2Obczsj8rL+CH7r4BKxH6b4oEVr
   4e/mueKyARVa7T4oXlR+18h/nwiu/apduDSPr2ipqrLts2UBgzs9GP9Iu
   VoP1OwE9TSbmbBDgxPaP5A+l5mQchNItwi088ES5UG5H9XXVvUvYLRTEj
   w26G8nZCFelj2VOEDco5njiGavFCRlnZU3TQSiqqgC9M7a5HaP4mTRv53
   g==;
X-CSE-ConnectionGUID: MTD2AaeRRE2vK4+BfU0KTQ==
X-CSE-MsgGUID: c5XMKebMSRetU1zTf5GGAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63124127"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="63124127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 18:57:45 -0700
X-CSE-ConnectionGUID: 9ihp73UQQ0q/ckjGhmNYaQ==
X-CSE-MsgGUID: k8UR7c6SQAiqWEGGbRhoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="178969259"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2025 18:57:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQG9K-000DA2-39;
	Sat, 14 Jun 2025 01:57:38 +0000
Date: Sat, 14 Jun 2025 09:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v17 2/6] remoteproc: Add TEE support
Message-ID: <202506140913.N5KmGXj7-lkp@intel.com>
References: <20250613091650.2337411-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613091650.2337411-3-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_185747_558474_402BD5C1 
X-CRM114-Status: GOOD (  10.07  )
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

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20250613-172251
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250613091650.2337411-3-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v17 2/6] remoteproc: Add TEE support
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250614/202506140913.N5KmGXj7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140913.N5KmGXj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140913.N5KmGXj7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_sensorhub_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_usbpd_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/wilco_ec/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-omnia-mcu-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-signing-key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/olpc/olpc-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/ssh_packet_layer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/surface_acpi_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hsmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/wbrf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/asus-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dcdbas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-rbtn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-smbios-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-descriptor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-privacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/firmware_attributes_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/ideapad-laptop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/discrete.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmc/ssram_telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/punit_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/telemetry/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec_tpmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_ips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_scu_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/mxm-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/siemens/simatic-ipc-batt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/actions/owl-sps-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/rockchip/pm-domains.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/pnpbios/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/support.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/reset/reboot-mode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/bq27xxx_battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/samsung-sdi-battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/dtpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/idle_inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/intel_rapl_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/powercap_sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/generators/pps_gen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/kapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/pps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-lpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-sys-manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-vuart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av_cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3stor_lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_clock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_mock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_pch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_qoriq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_vclock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/pwm-lpss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/amd/atl/umc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/irq_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/mc13xxx-regulator-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/of_regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/rohm-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8350-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8400-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp_ipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/pru_rproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_pil_info.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_q6v5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_sysmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_elf_loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/remoteproc/remoteproc_tee.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/st_slim_rproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/ti_k3_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/amlogic/reset-meson-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/reset-mpfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/reset-simple.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/reset/starfive/reset-starfive-jh71x0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/mtk_rpmsg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_native.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_smem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_glink_ssr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/qcom_smd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_char.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rpmsg/rpmsg_ns.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/nvmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-ds1685.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-omap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/rtc-sa1100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rtc/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_devmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_eer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_erp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/block/dasd_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/keyboard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/raw3270.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp_early.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/sclp_ocf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_34xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_3590.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/char/tape_std.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/airq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/ccwgroup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/chsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/cio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/device_fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/eadm_sch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/fcx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/isc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/itcw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/qdio_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/cio/scm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/ap_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/ap_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/pkey_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/pkey_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_ccamisc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_ep11misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/crypto/zcrypt_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/ctcm_mpc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/ism_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_core_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_l2_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/qeth_l3_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/s390/net/smsgiucv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/sbus/char/bbc_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/53c700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/fas216.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/msgqueue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/arm/queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/constants.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/cxgbi/libcxgbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/esp_scsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_ctlr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fcoe/fcoe_transport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/fdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/hisi_sas/hisi_sas_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/hosts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/iscsi_boot_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_fcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_frame.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_libfc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libfc/fc_lport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libiscsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libiscsi_tcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libsas/sas_expander.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/libsas/sas_init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/megaraid/megaraid_mm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/mpt3sas/mpt3sas_ctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/qla2xxx/qla_target.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/qlogicfas408.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/raid_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_devinfo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_dh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_error.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_logging.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/scsi/scsi_proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

