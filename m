Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D837ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 04:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqaWtbjCCQta5htr0klKwsxO0Blg0VSeqN2ETZLOGxc=; b=ssbYzP6AwyQJskDPTJRrZvBoFm
	zEuXqcHAojvFyGsY5M64QG2V1i2Pxs+/xVaHogjEJ59esQ3s2DuIBjEKprSsnTJadvRBHuAvKCeEi
	+OVV3FaPMPHBLkRkwBFCUHHydhHSMyeKSAgD0HheIqtjQk+qB5WZusCknaI9wLG26tKHSS3hf2q3T
	dwwGtV9egR1Q3dvR7Lkr3JX6ouYrU6Zy2tu/e6bozLeT2UqsUokP6YTdzXbsE22eI56Aos+Cih/mg
	bfAcjjOOagK/Fj3cGaUeDPHoHB7JgkqXcmKDjflYxZwGRQ1mxwx1a65Rp38+xsYGwHR3sbkrsSJal
	IQvDNnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbjf-0000000FDsW-2Jr5;
	Tue, 28 Oct 2025 04:55:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbjd-0000000FDs2-0ZrX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 04:55:06 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59S4smQQ2554711;
	Mon, 27 Oct 2025 23:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761627288;
	bh=TqaWtbjCCQta5htr0klKwsxO0Blg0VSeqN2ETZLOGxc=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=W75aNDa+LO/wUyG4fF7coUwKIwzKg6vRPQIdf6nFfSMT4u6xR6L6DB0bq6DjXf06s
	 q/y+wPYiHmNEWU60tlpyHsJcAwZaZZA5Z+lCK8f6Zbzz2z5Tr31IIbD4oYnkbWAW3e
	 kA80TTqHH2QUQc8SpmwkZw/B71AKn2PKbyniZd4g=
Received: from DFLE202.ent.ti.com (dfle202.ent.ti.com [10.64.6.60])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59S4slrc1407743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 23:54:47 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 23:54:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 23:54:47 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59S4sfDS1777174;
	Mon, 27 Oct 2025 23:54:41 -0500
Message-ID: <44b90ca1a10fe737cb20b76327846c5cda420924.camel@ti.com>
Subject: Re: [PATCH v4 4/4] PCI: keystone: Add support to build as a
 loadable module
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: kernel test robot <lkp@intel.com>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <quic_wenbyao@quicinc.com>, <inochiama@gmail.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Date: Tue, 28 Oct 2025 10:24:51 +0530
In-Reply-To: <202510281008.jw19XuyP-lkp@intel.com>
References: <20251022095724.997218-5-s-vadapalli@ti.com>
	 <202510281008.jw19XuyP-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_215505_330706_D5448D85 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, 2025-10-28 at 11:06 +0800, kernel test robot wrote:
> Hi Siddharth,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on pci/next]
> [also build test ERROR on pci/for-linus linus/master v6.18-rc3 next-20251=
027]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapall=
i/PCI-Export-pci_get_host_bridge_device-for-use-by-pci-keystone/20251022-18=
0213
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
> patch link:    https://lore.kernel.org/r/20251022095724.997218-5-s-vadapa=
lli%40ti.com
> patch subject: [PATCH v4 4/4] PCI: keystone: Add support to build as a lo=
adable module
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/2025102=
8/202510281008.jw19XuyP-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251028/202510281008.jw19XuyP-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202510281008.jw19XuyP-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes=
/test-kprobes.o
> > > ERROR: modpost: "hook_fault_code" [drivers/pci/controller/dwc/pci-key=
stone.ko] undefined!
> ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefine=
d!

I had built the driver for ARM64 platforms but missed building it for ARM32
platforms. I will fix the build error for ARM32 platforms and will post the
v5 series.

Regards,
Siddharth.

