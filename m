Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU4mwSXqstlI/Vzh2VWlK6EDGlOHTVznyvQcSwhu4To=; b=O9dT57vm9shWxzS6JOdIqBUdh0
	t9+aQnn96/baxxPMirz5eRFyBYiZCoW5wOmtD1/OwkcGfWIcgpp9v31bbkMN7o1R8yp9fLIzO497C
	/MeypqDBk9aApvMro0kysTLbL1/z/IOLi8gvyxlzd/KBViJPqhEythVtDH28gAXHzkA1TG19L+WKR
	OT3GJv1Fg8m18aNX5szsGZN9mIPbLAbhkk7J6TPgRAl/8yrzCsat3Rrvt4qVTE1yDqZGNzotmOZRQ
	joaf8fI/D4odRCWTMqztdYMwNYBjH1s8n5x/hhcrhKoNWfAn8U8lf0TucAhSGMjez61VbY0FtJSgC
	i5kW+voA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJF4-00000004Fl1-3mlD;
	Wed, 26 Feb 2025 15:22:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIUo-000000046fj-0FGs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740580485; x=1772116485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fsVj2Aus3xQzzjk0qAqr0Apz0tN8gWLbCfqS98wb8y8=;
  b=2aHke8Rls2i1j9/sAJznruWpM5hkm/dQ/szMaWDq56gGRUu+Fqh3kbkl
   aXN7XPDWF1+71c1AFzLcMkNpZ6d+PxzmnaGdXG+xWpj9VnNrJe6+PVH1f
   aAGPQLwwsvO30YqxrJTvKkF7rusVxFdkdSh/43P51A44B7GKq2R5wU4oZ
   FmwNL5Pe4RKxH6JKFRqbs48HLaFtzvuouFyiHCYLiopK6mjGsrqiNnrca
   /N2MQCOjD2L+wmLY8xQCbgBbnOuiz4ZF/JCeAWobRx9lnKSRHuVQMC24w
   r85NGdIeDnOxdmw0kbJI6wOm0XZhLFhQ6LyWOTY+O3Av1Pu09q53x+55J
   Q==;
X-CSE-ConnectionGUID: ZF1JjHn6RqyhKjwOKIMcxA==
X-CSE-MsgGUID: A9pe4hv+SyiQoyQRgDR0Yg==
X-IronPort-AV: E=Sophos;i="6.13,317,1732604400"; 
   d="scan'208";a="37753840"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2025 07:34:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 26 Feb 2025 07:34:06 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 26 Feb 2025 07:34:05 -0700
Date: Wed, 26 Feb 2025 15:32:12 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: <Steen.Hegelund@microchip.com>, <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <herve.codina@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250226143212.h2rtfxbbspdnmybq@DEN-DL-M31836.microchip.com>
References: <20250225105329.3037853-1-horatiu.vultur@microchip.com>
 <b31fa21c7bd352fe77d50da82c4d2c333b8566d8.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b31fa21c7bd352fe77d50da82c4d2c333b8566d8.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_063446_377446_A25D98E4 
X-CRM114-Status: GOOD (  16.45  )
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

The 02/26/2025 11:27, Philipp Zabel wrote:
> 
> On Di, 2025-02-25 at 11:53 +0100, Horatiu Vultur wrote:
> > With the blamed commit it seems that lan966x doesn't seem to boot
> > anymore when the internal CPU is used.
> > The reason seems to be the usage of the devm_of_iomap, if we replace
> > this with of_iomap, this seems to fix the issue as we use the same
> > region also for other devices.
> 
> So the issue is the devm_request_mem_region() called by
> devm_ioremap_resource()?

That is correct.

> 
> Wouldn't it be easier to switch to devm_ioremap() instead?

That would be easier and the change set will be also smaller.

> 
> regards
> Philipp

-- 
/Horatiu

