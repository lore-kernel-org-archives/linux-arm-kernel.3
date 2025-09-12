Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD84BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4NS2lGNDYPRFSd1ovtwkZb7OAAyExi6xlEfHJJUBmQ=; b=LRLRIkP/YekhnJ5rbwrUZF3lzl
	woAs80fsFvUDM3Zmg0sVElJh8VN7cwN+RKlpoChUN+Nda6Oh47cFdCRpaSe0Vl8J0tsA3+oaGUWq6
	xuvywNrCXWK9EEilQtqVdLiOdtcv2a0xoViGaKNqYfqR0Uno3V2WHo59cmHoWoS78T5a5tIbLaztH
	rn4wmuqOwqgpI5w5HUVr4zpspBwIgvxBxlRPUwQNICqvuq1m+4moqe0Op3DT+I5geV5oVnG1WZ3fK
	8FjaRCznWa4IRAvDyM7UH2KQOBbidp5lOd+Ah9Fq87g7vczjUQkLgkStKXS5J6h2La7KxwdQwEBqh
	KYBexmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9QZ-0000000BDmn-1wPu;
	Fri, 12 Sep 2025 19:27:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9QX-0000000BDm9-1M82
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 19:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q4NS2lGNDYPRFSd1ovtwkZb7OAAyExi6xlEfHJJUBmQ=; b=sM0C05B/Y3OuuPJLT/rxWbP4h6
	lMYUgkvI+D4NZSiYlHnBymLkEAfmQ3a/hlKZBpMTpHVi3OfJ6UXIi+Ug8fUseNg7R/sHhFstBegI3
	wYsDO+XVgodx3kY3FEui0txhKVG1am9ra2PnsHNytYSRIU+SpIqCvDuYiUIngAEO6G9SeFtwHrbaP
	hZ+JFl0kbS+6A89TJfBS+Pxw03/TEhYIMb1JDihqsgZNF0qD4R88DpwuElBusat9T0A/YOD719loB
	bDyDF/ds/UMwru/63Qhlq8h/QHKfOHbgiWtjfxv6TA0eGDNnRs+tFkmd3jm4DgdYOinxizIA7y5Gv
	dmCcxVuA==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9QT-00000004wmv-2evt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 19:27:20 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CJOvCc668524;
	Fri, 12 Sep 2025 14:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757705097;
	bh=Q4NS2lGNDYPRFSd1ovtwkZb7OAAyExi6xlEfHJJUBmQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZZ+EeJ/XiIL22njUd2gX5udls+1mAirxXEHksdBu0njlTzgvOx7WWptSXLbMNKltE
	 M/O8RcnXHxUHFnpQZRP2Jp3wEK6u4t9k78rHVtuRrKQJsGpUduLu13T3ZpxEQGtEcC
	 HwW/XN6U4cqMbAhoA7IxW84ZRc2IgDv4qXLAh1IU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CJOu6i2993241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 14:24:57 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 14:24:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 14:24:56 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CJOuXa187040;
	Fri, 12 Sep 2025 14:24:56 -0500
Date: Fri, 12 Sep 2025 14:24:56 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250912192456.msnw64b62yr5ricw@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-3-29d5a6c60512@ti.com>
 <0153912f-04a5-4118-a286-4e9c0293aae6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0153912f-04a5-4118-a286-4e9c0293aae6@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_202718_174192_44FF098B 
X-CRM114-Status: GOOD (  31.01  )
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

On September 12, 2025 thus sayeth Andrew Davis:
> On 9/12/25 10:40 AM, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. ALl of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >      https://www.ti.com/lit/pdf/sprujb4
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v4:
> >   - Corrected Copyright year
> >   - Used 'ranges' property in the fss{} node
> > 
> > Changes in v3:
> >   - Added more nodes now that the SCMI interface is ready
> > 
> > Changes in v1:
> >   - switched to non-direct links to TRM updates are automatic
> >   - fixed white space indent issues with a few nodes
> >   - separated out device tree bindings
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi    | 603 +++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi |  25 ++
> >   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi  | 141 +++++++
> >   arch/arm64/boot/dts/ti/k3-am62l.dtsi         | 120 ++++++
> >   arch/arm64/boot/dts/ti/k3-am62l3.dtsi        |  67 +++
> >   arch/arm64/boot/dts/ti/k3-pinctrl.h          |   2 +
> >   6 files changed, 958 insertions(+)
> > 

...

> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi 
> > b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d058394a8d19d16f100cd87cf293c67bc189b475
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree Source for AM62L SoC Family
> > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> > + */
> > +

...

> > +		};
> > +	};
> > +
> > +	#include "k3-am62l-thermal.dtsi"
> 
> Not a fan of how this is included (yes I know it is done like this in
> a couple other places, those need fixed too), as we have better/standard
> ways to add nodes to nodes other than directly including a file with the
> node. The other issue is now the content of the file, including its #include
> lines are now inside this parent node.
> 
> This dtsi file should just start with "/ {" and add the extra node.
> 
> Also, isn't this broken out into a dtsi so we can handle versions of
> this device qualified for other thermal ranges without having to use
> a different parent device dtsi? If so then adding it directly to the
> base dtsi prevents that. Either all AM62L have this one thermal situation
> and then it doesn't need to be a dtsi, or this include should go into the
> board level as it is up to the given board what specific variant was chosen
> to be populated on that board type.
> 

Yeah I've noticed this as well. We have a few parts available in 
different packaging that have different maximum temp ratings. Ideally we 
should have some way to specify which package variant the board is using 
and include these thermal trip points for that package.

It does add more #includes into all of this but I guess if you've picked 
up on this as well I should probably look into seeing what we can do.

~Bryan

