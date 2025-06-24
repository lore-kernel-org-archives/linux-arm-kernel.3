Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8B7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwASaybr7tTBa/RnWzp5kiw4jn5j6IBVC/FDU+4fRf4=; b=Oq6wZ2Ql7gwSJtraA6jgMXToZH
	q6kn7Z6UyXc0ODH8LB9e5kXAub5QHd6CmkXMmKc3+ul6M5GJww7U7AdPYuGxOA95tQgdfXUwPV/27
	L3IdElZZ635wn+e4P4gpJtcq6fMafVzaIopvXn4yV91NsEorNbGPLRZ3ZUe8DkRO8vH6jH4Fbz0DK
	qCTfB56pGECIr1/czA0E+mQ76vB/F/zriNBC9tyKAktpQSCRofLe46xI07GJ+23Y/E9Ai5PrWIaM9
	rblu6jI2D57u/9OtBJaxfBypNbHPbMKVplDiUFNa0ivfwkUfPb+/JtW39KpJHqJUlEbBu17/ZVDL6
	Cxh888pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU252-00000005SQa-0OU0;
	Tue, 24 Jun 2025 11:44:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1EL-00000005M66-3N9u;
	Tue, 24 Jun 2025 10:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750762222; x=1782298222;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dv6ZN9qLcc39VhlOnYfqWOhVKBnveT9waBSLrEElVx8=;
  b=ij4CwhzYvUaCnarePJ4CT0iV8uKBhCmG/vOSX5J3NeI8yQsK+UjwvE0K
   SpliUEWuV64z1H3X0n6xXxr2bOIDgaWUm7m3tpLVq6qVb0fEMiT2/yKm8
   fD6BleapS9pniiQh9TCGEl5JoZGRs1lfX2v+Msl/GNySNC9Ndax1aWWB3
   v/nOLNmCI6qQYgLPGZlAmp/wMruMzbtVxNCASVeWaDYmB+ZPUP/ifPjwi
   KuyExCG40lwgE6yrOLO1cLi1O6KlmYny+sbPaZjbCfy7t+2SJ0kimh0Mj
   LaBAKJWFGf8GXSUzyYaWBGZxDT1SViJfRSHDQYbK26B+Uq5bW9drxcBNJ
   Q==;
X-CSE-ConnectionGUID: qV+7TDwZS+2kg5dacbd6jQ==
X-CSE-MsgGUID: moKjpSVOTH+2wCkSFYCTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64352252"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64352252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:50:20 -0700
X-CSE-ConnectionGUID: P3jobHMUQAe9pUeBJdc30Q==
X-CSE-MsgGUID: JnGhA3LFT8aHV12Y11RQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151306478"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:50:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 13:50:06 +0300 (EEST)
To: Jacky Chou <jacky_chou@aspeedtech.com>
cc: "bhelgaas@google.com" <bhelgaas@google.com>, 
    "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
    "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
    "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
    "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
    "conor+dt@kernel.org" <conor+dt@kernel.org>, 
    "joel@jms.id.au" <joel@jms.id.au>, 
    "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
    "vkoul@kernel.org" <vkoul@kernel.org>, 
    "kishon@kernel.org" <kishon@kernel.org>, 
    "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
    "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
    "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
    "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
    "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
    "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
    "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
    "elbadrym@google.com" <elbadrym@google.com>, 
    "romlem@google.com" <romlem@google.com>, 
    "anhphan@google.com" <anhphan@google.com>, 
    "wak@google.com" <wak@google.com>, 
    "yuxiaozhang@google.com" <yuxiaozhang@google.com>, 
    BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller
 driver
In-Reply-To: <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
Message-ID: <a618588d-54fe-69a9-27f7-7b19ba905a52@linux.intel.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-8-jacky_chou@aspeedtech.com> <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com> <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035021_890208_9BD53FDF 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, 23 Jun 2025, Jacky Chou wrote:

> > > +static bool aspeed_ast2700_get_link(struct aspeed_pcie *pcie) {
> > > +	u32 reg;
> > > +	bool link;
> > > +
> > > +	regmap_read(pcie->pciephy, PEHR_MISC_300, &reg);
> > > +	if (reg & CAPABILITY_GEN2) {
> > > +		regmap_read(pcie->pciephy, PEHR_MISC_344, &reg);
> > > +		link = !!(reg & LINK_STATUS_GEN2);
> > > +	} else {
> > > +		regmap_read(pcie->pciephy, PEHR_MISC_358, &reg);
> > > +		link = !!(reg & LINK_STATUS_GEN4);
> > 
> > While I don't entirely know the meaning of these bits, what if the link is not
> > using maximum speed it is capable of, does this check misbehave?
> > 
> 
> In our AST2700, there are gen4 RC and gen2 RC.
> Therefore, here will get capability to confirm it is gen2 or gen4.
> And the link status is in different register.

Okay, but then I'm a bit worried the naming of the defines as "Link 
Status" has a well-known meaning in PCIe Spec so it is confusing to call 
something else LINK_STATUS_*. Does that name come from some AST spec? In 
not, change the define naming. If yes, you should prefix it with so it is 
clear this is not referring to a generic PCIe thing and I suggest also 
adding a comment above those defines too so anyone looking them later 
won't wonder if you're just duplicating something from the PCIe spec.

-- 
 i.


