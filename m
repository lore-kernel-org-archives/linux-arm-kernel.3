Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C9CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbTzR+gKuPJX4C8eqpo9sX3IDQMrVLQU+oJSjcZL198=; b=GFZav90OcC1ej0QMQD3gOrud56
	hLyOBBLaWRni9LOAXDDOF2vmZIoBc3zLKzVxtgJ53ldh91hXAkhQH7UTPgAbseMXj8unHcIs90rc+
	T5/Q5xXWhwFEOiOoaPRyMnblfY0fbcfG+8paq4TQjLyTdKDBPYnx6IebyRHSEqYt4zWrvKwVN2bfV
	LL0p2ivuVyKZHUtNsyWHdSit+nuv30gLjtAWUxoqz6ekhXZLt0PNOdJzm2qtVrNo3tA5Lv4u4Nw7v
	uUVTfbmxvFahdzrqJbtaRCEIPA9b1UOopv9xJXbp5YFY6G47wmvwWwhir4ILMoDzSu7LonTW4NsBC
	DCIBRAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaz8-0000000DV2s-0uGl;
	Wed, 05 Nov 2025 10:43:26 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaz5-0000000DV25-1gKT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 10:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762339403; x=1793875403;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xiagzVBevityIRA/xHOUPEL9BTQxWFUSQ4DwL3QsZ6Q=;
  b=ea/+xVMJo5uH7kz8XVUwAmJXowqu2eomMcpGcT0x4Md/oUgRHjd7jBO6
   B9NBghujOV2ocLO2pGNz7jfcPtify1S7hzmJkuAR67TTes91mCX5yVixx
   P7rIJ5zIHd8FxAnM9UN+psGhhoEe+HD0AYHHzkhXMHdR4LLYJiU8cS38d
   iynZEQ21q6IOCRrA4siFne4Yd6IYjbwSjVhVVYsHNiUVtJ/iWJeC5Hyg6
   aYp6RjGAWbt5K7SasANqi/sVWExC7e179yV1yGTnL3c76UQM5ix5l9tUT
   MLG9wc4ZZokD8IrQBCr5YrskcXc4e4teOP5zzv74mojVVRsmXLUeyISEs
   g==;
X-CSE-ConnectionGUID: mGolnRH3T5a9IGpSC6mVKg==
X-CSE-MsgGUID: vQhxW/evSVObE4ol3snx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64550602"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64550602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:43:21 -0800
X-CSE-ConnectionGUID: Isd4eBPLRcKDgK5YT6ErMw==
X-CSE-MsgGUID: OiLDIX16S4G9aa1KuMyt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="218203072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.252])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:43:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 5 Nov 2025 12:43:09 +0200 (EET)
To: Niklas Cassel <cassel@kernel.org>
cc: Vincent Guittot <vincent.guittot@linaro.org>, 
    Bjorn Helgaas <helgaas@kernel.org>, chester62515@gmail.com, 
    mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
    bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
    kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com, 
    larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
    ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
    linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    imx@lists.linux.dev
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
In-Reply-To: <aQsmtKsTEmf7e7Sd@ryzen>
Message-ID: <bf3b2d2a-ce3e-87af-4154-abd022c6a3b4@linux.intel.com>
References: <20251022174309.1180931-4-vincent.guittot@linaro.org> <20251022190402.GA1262472@bhelgaas> <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com> <aQsmtKsTEmf7e7Sd@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_024323_452323_BBABFE6B 
X-CRM114-Status: GOOD (  17.21  )
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

On Wed, 5 Nov 2025, Niklas Cassel wrote:

> On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > +
> > > > +     val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > > > +     val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > > > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > > > +
> > > > +     /*
> > > > +      * Set max payload supported, 256 bytes and
> > > > +      * relaxed ordering.
> > > > +      */
> > > > +     val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > > > +     val &= ~(PCI_EXP_DEVCTL_RELAX_EN |
> > > > +              PCI_EXP_DEVCTL_PAYLOAD |
> > > > +              PCI_EXP_DEVCTL_READRQ);
> > > > +     val |= PCI_EXP_DEVCTL_RELAX_EN |
> > > > +            PCI_EXP_DEVCTL_PAYLOAD_256B |
> > > > +            PCI_EXP_DEVCTL_READRQ_256B;
> > > > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> > >
> > > MPS and relaxed ordering should be configured by the PCI core.  Is
> > > there some s32g-specific restriction about these?
> > 
> > I will check with the team why they did that
> 
> Most likely, the reason is that, the PCI core does not set the MPS to the
> maximum supported MPS for the root port.

PCI core set/doesn't set MPS based on config. Perhaps try with 
CONFIG_PCIE_BUS_PERFORMANCE.

> So without that change, the port will use use 128B instead of 256B.
> 
> I assume that you should be able to drop (at least the MPS part) if this
> change gets accepted:
> https://lore.kernel.org/linux-pci/20251104165125.174168-1-18255117159@163.com/
> 
> 
> Kind regards,
> Niklas
> 

-- 
 i.


