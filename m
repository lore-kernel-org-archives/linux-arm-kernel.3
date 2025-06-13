Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F9C71156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGp3vOdGD492TrlHLvExykHWTYzLFRdfzLjRMl5K3H8=; b=w+8aIpjA/gemAS44XWisqMc0+Z
	5IsswN9CfRIdtezNvvzIxhvB69af/8xNj9lP7mOcg2B6h6G32s32VLM7hGgSYQXUX7hZEQRc5I4+c
	LQQbSlB++gDLCrZg+/cMDcezzxEX8F2Z6Ph0NvlU5r9EgZcQCsYsUC9CIsy9+YAWbE9GKos2TVLMj
	f13mSx9L02zh3AJVekvahXaRNDKwAv/GI5Hf51MEBc+zytAxzExpMIonXjivBy5aKfhPLOsyhdh3V
	sZKBz0GhDbkiV1i6ARaJw1XzPeMHNNzfyIBN19D20F0SEeDfXa0yFwgfPtlCcEhF/zD8hVIECDIRp
	fMm08OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8wr-0000000HF65-2H7r;
	Fri, 13 Jun 2025 18:16:17 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6J5-0000000GsTq-2oq3;
	Fri, 13 Jun 2025 15:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749828424; x=1781364424;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QDmODICNWiBtCvM/b89KqBEr7GNxx9lEwD2x/dRQD5k=;
  b=cNFuVMsjVpjh1ZASKejSH9T/O1PV3sIKib5lwk19UE1fIa87cPET7R7Z
   ALrI+Ai6fIfHnNz+1ehodBIX0QbwRyOGT06+9R3uUOxjF6iKaTPcQtEpf
   Irzx8IBTxmsl1L6T0fgNmvL4DTzQAfmteyu6QZyxz3Y14KHIuet7FlWEN
   sOu+oCG1dgrIemHQsnxUmIRZeTLgkAInyhDF/DcrS7ekE6onr4IJMa2t2
   DifyPo/YvKEw1CZ9rwppPfNGdV2DRo5GaALO2APqzPGWhJgSYiK2iLpwB
   kVGJM1KxNxLg4A+cPJXn/cBaBlO94rnOeoT4vXVOIQANrNWenXyStAqdy
   w==;
X-CSE-ConnectionGUID: SLlGmsieR1u7yH1EWj6cOA==
X-CSE-MsgGUID: /YBCFdwaQwys8Hs9N/HqMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69626438"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="69626438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:27:02 -0700
X-CSE-ConnectionGUID: eiLse6EbSKa+9117fseorQ==
X-CSE-MsgGUID: wA+9VSQeRj6fWsmzEAVkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="152743439"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:25:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 18:25:50 +0300 (EEST)
To: Geraldo Nascimento <geraldogabriel@gmail.com>
cc: linux-rockchip@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
    Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
    linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v4 2/5] PCI: rockchip: Drop unused custom registers
 and bitfields
In-Reply-To: <aExBeNdkOtFtW87z@geday>
Message-ID: <b4dc6d96-b268-7da4-e41f-cc922ae6941c@linux.intel.com>
References: <cover.1749826250.git.geraldogabriel@gmail.com> <ed25d30f2761e963164efffcfbe35502feb3adc2.1749826250.git.geraldogabriel@gmail.com> <97114c68-5eb7-18b0-adbd-227e1d7957c6@linux.intel.com> <aExBeNdkOtFtW87z@geday>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-642005326-1749828350=:948"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_082703_725560_ACFA4681 
X-CRM114-Status: GOOD (  22.45  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-642005326-1749828350=:948
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Jun 2025, Geraldo Nascimento wrote:

> On Fri, Jun 13, 2025 at 06:03:14PM +0300, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 13 Jun 2025, Geraldo Nascimento wrote:
> >=20
> > > Since we are now using standard PCIe defines, drop
> > > unused custom-defined ones, which are now referenced
> > > from offset at added Capabilities Register.
> >=20
> > These are quite short lines, please reflow the changelog paragraphs to =
the=20
> > usual length.
>=20
> Hi Ilpo,
>=20
> I'll reflow for v5.
>=20
> >=20
> > > Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
> > > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip.h | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/con=
troller/pcie-rockchip.h
> > > index 5864a20323f2..f611599988d7 100644
> > > --- a/drivers/pci/controller/pcie-rockchip.h
> > > +++ b/drivers/pci/controller/pcie-rockchip.h
> > > @@ -155,16 +155,7 @@
> > >  #define PCIE_EP_CONFIG_DID_VID=09=09(PCIE_EP_CONFIG_BASE + 0x00)
> > >  #define PCIE_EP_CONFIG_LCS=09=09(PCIE_EP_CONFIG_BASE + 0xd0)
> > >  #define PCIE_RC_CONFIG_RID_CCR=09=09(PCIE_RC_CONFIG_BASE + 0x08)
> > > -#define PCIE_RC_CONFIG_DCR=09=09(PCIE_RC_CONFIG_BASE + 0xc4)
> > > -#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT=09=0918
> > > -#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT=09=090xff
> > > -#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT=09=0926
> > > -#define PCIE_RC_CONFIG_DCSR=09=09(PCIE_RC_CONFIG_BASE + 0xc8)
> > > -#define   PCIE_RC_CONFIG_DCSR_MPS_MASK=09=09GENMASK(7, 5)
> > > -#define   PCIE_RC_CONFIG_DCSR_MPS_256=09=09(0x1 << 5)
> > > -#define PCIE_RC_CONFIG_LINK_CAP=09=09(PCIE_RC_CONFIG_BASE + 0xcc)
> > > -#define   PCIE_RC_CONFIG_LINK_CAP_L0S=09=09BIT(10)
> > > -#define PCIE_RC_CONFIG_LCS=09=09(PCIE_RC_CONFIG_BASE + 0xd0)
> > > +#define PCIE_RC_CONFIG_CR=09=09(PCIE_RC_CONFIG_BASE + 0xc0)
> >=20
> > This will cause a build failure because PCIE_RC_CONFIG_CR is used in 1/=
5=20
> > but only introduced here so you'll need to do this in the same patch as=
=20
> > any step within a series must build too. IMO it would anyway make sense=
 to=20
> > combine patches 1 & 2.
>=20
> Ah, interesting angle. I'll fix it.
>=20
> >=20
> > >  #define PCIE_EP_CONFIG_LCS=09=09(PCIE_EP_CONFIG_BASE + 0xd0)
> >=20
> > Aren't you going to convert this as well?
>=20
> I can, but I can't test it however! But I'll Cc: someone who hopefully
> can.

TBH, the risk getting it wrong / changing the resulting object is pretty=20
low. :-)

It might be that scripts/objdiff tool could prove there were no changes in=
=20
the binary code output as it looks just a pre-preprocessor change.

--=20
 i.

--8323328-642005326-1749828350=:948--

