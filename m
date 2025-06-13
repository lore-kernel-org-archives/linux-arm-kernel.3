Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C49C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpUxaYtDfM8Poktzce5PH6qo8rQBTaWCptN8Tmk0S6c=; b=sXOYkqKsZ8DuyCvZbRNgNODPSI
	IW1ChJs7lI/WpzoTPvFjhFyaUrud/ldqHpDE8tHcCkZ2x7nZZwxG7TZ2C1w+D9IDZzBkbw0lQMk/d
	Gf6Wizb3W8Zd0AHtWldnDcveSAL5pfc8/WeHZxjf4M9Orrlj81iiUTG+6A350Vsa/G1Cg8X3nWbBy
	B8tC21dv+c9Ykwqbs+DTbhIj8+jmBgOkmlxNRvcN/jIGb9EfxsGjJ66pPeR3qAm3YumhrRiLO0Ciz
	y2wX77TJSt49mtT47FCWG0NZj8Ie8mB8lo0hpXwhDvTeYkdwd0taJ+gEsnLtUdFbSrT+1JO5/FPo9
	vQ1Myxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7Bb-0000000H2oT-0G66;
	Fri, 13 Jun 2025 16:23:23 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5wG-0000000GoMJ-1GsH;
	Fri, 13 Jun 2025 15:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749827008; x=1781363008;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lmsC6NuVWnVy+Dsfq0irR7B12PqvUPA3RWEtvjKTL2I=;
  b=PZn4Tw5sXcWcXzPIq19XwSzX+8cnpBnjjd9lCMWzcIvLykLlLbVPmDjL
   isheiuBLKMlRils53lfqDZPeLXJDyxMinWf/JDQO437RsPhxVChkeubLy
   AlRoSy4CUodpK4WQtg4xZ5bAJRN8YuCmXGBASV8EoVUvfkkmWNpYijCCz
   Kh6vY5lhSEQK4ZzjIjULieBoVHDlSoRTAuAH6b+qlqyy5XU3VE+QU0DqN
   m2wl26xMHwt6BTFACQ3WD5zkbsQ8bV00KUtWiSltFMBXCRPcnf+9YpbXr
   erH2CggpaA4L5nyOn6DMn7BJTN894ZPEq1GysFgoJCKvBn8ER64032yx7
   g==;
X-CSE-ConnectionGUID: zPMd+BUmRuCsV8twgnSqgQ==
X-CSE-MsgGUID: xSIhq87qTjC4CtlmqqWKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55718055"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="55718055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:03:23 -0700
X-CSE-ConnectionGUID: wEeUUgUfTD2/YHByLcKAww==
X-CSE-MsgGUID: Zw0bhwMyS9KD3iB4u6xSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148320085"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:03:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 18:03:14 +0300 (EEST)
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
In-Reply-To: <ed25d30f2761e963164efffcfbe35502feb3adc2.1749826250.git.geraldogabriel@gmail.com>
Message-ID: <97114c68-5eb7-18b0-adbd-227e1d7957c6@linux.intel.com>
References: <cover.1749826250.git.geraldogabriel@gmail.com> <ed25d30f2761e963164efffcfbe35502feb3adc2.1749826250.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080328_393259_BAABF15A 
X-CRM114-Status: GOOD (  14.15  )
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

On Fri, 13 Jun 2025, Geraldo Nascimento wrote:

> Since we are now using standard PCIe defines, drop
> unused custom-defined ones, which are now referenced
> from offset at added Capabilities Register.

These are quite short lines, please reflow the changelog paragraphs to the 
usual length.

> Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 5864a20323f2..f611599988d7 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -155,16 +155,7 @@
>  #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
>  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
>  #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
> -#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
> -#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
> -#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
> -#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
> -#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
> -#define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
> -#define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
> -#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
> -#define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
> -#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
> +#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)

This will cause a build failure because PCIE_RC_CONFIG_CR is used in 1/5 
but only introduced here so you'll need to do this in the same patch as 
any step within a series must build too. IMO it would anyway make sense to 
combine patches 1 & 2.

>  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)

Aren't you going to convert this as well?

>  #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
>  #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
> 

-- 
 i.


