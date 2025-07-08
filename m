Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZcur9LFX7t+/N/sA1BFuyxXZXMoxqY/UWKGMT3WEt8=; b=sQp80z43iPRQhBtkJ/l8eQZUCj
	1VAM+V5vAMnEDr2zOBrPX5E5OEs57X6+XJzqfAbROTS36widdoz6FIVR9JhZ3NqRFd4J98TEPuZJ0
	gGSUrgZmnxucSxsu3Ug/qRm06pQ4i+oKu51nRl8BvI7cIsCD/AEuU9q6Y2vl9wyXAeJa1R91yoOFG
	U8b0j46IHVN1A1yWEImCdoZcivE1bbHIkgrnGmwT8VH6pEx5wsJPWJQAIznUSpffzSlN6guTCmrLN
	OmOoBcbSme8dzEkGw4oeBGy/LlahBqqvfwX//Bby4RuC1nduqdkZdLQ0P0AJoEThtb1Q+fywyQ24N
	nYIwwqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7dI-00000005JXW-1Cb3;
	Tue, 08 Jul 2025 12:41:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7aw-00000005J90-3n8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:38:48 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 568CcZhM1161031;
	Tue, 8 Jul 2025 07:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751978315;
	bh=hZcur9LFX7t+/N/sA1BFuyxXZXMoxqY/UWKGMT3WEt8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=R4BY5/bB1MYOCfb7nzslXKSv8ODwHpq33QV0VoFn8g9oYyskPhervTJfunEZt8bug
	 D92lj8zPjNv0sAItoB3NmTLbNHaw1UgbFA9XuIwdTfyv5Xx5lnKRKKWx3eioEzDCgd
	 DBDzJydxizX64l6/1vc/iBn+npstKWJULi98yo5o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 568CcZ2Q1450820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 07:38:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 07:38:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 07:38:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 568CcZnR1776084;
	Tue, 8 Jul 2025 07:38:35 -0500
Date: Tue, 8 Jul 2025 07:38:35 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Neha Malcom Francis <n-francis@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v4 0/2] Add support for K3 BIST
Message-ID: <20250708123835.x6sedlift3xljzvh@scabbed>
References: <20250605063506.2005637-1-n-francis@ti.com>
 <2e397dbf-ac5c-49d3-8176-2022450bf0e2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e397dbf-ac5c-49d3-8176-2022450bf0e2@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_053847_030298_C881199A 
X-CRM114-Status: GOOD (  20.52  )
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

On 09:40-20250626, Vignesh Raghavendra wrote:
> 
> 
> On 05/06/25 12:05, Neha Malcom Francis wrote:
> > BIST (Built-In Self Test) is an IP responsible for triggering hardware
> > circuitry tests on both logic as well as memory blocks. This driver is
> > currently being upstreamed in U-Boot [1] (on hold till the dt-binding
> > is approved here) and triggers these tests on cores. This patch series
> > adds the dt-binding as well as a node for BIST on J784S4 and J742S2.
> > 
> > Changes since v3:
> > https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
> > - Udit
> > 	- add support for J742S2
> > 
> > Changes since v2:
> > https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
> > - Krzysztof
> > 	- use existing common definition (ti,sci-dev-id) for grabbing
> > 	  the device ID instead of redefining properties
> > 
> > Changes since v1:
> > https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
> > - Krzysztof
> > 	- move from misc/ to soc/ti/
> > 	- minor property changes
> > 	- drop ti,bist-instance and instead opt for ti,bist-under-test
> > 	- correct example dt
> > 
> > [1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/
> > 
> > Neha Malcom Francis (2):
> >   dt-bindings: soc: ti: bist: Add BIST for K3 devices
> >   arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
> > 
> >  .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
> >  .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 11 ++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
> > 
> 
> 
> Nishanth,
> 
> Ok to take the dt-bindings via ti-k3-dts-next branch? Or would you
> prefer to queue bindings and DT changes separately?

The ti-k3-dts-next should be fine here. I dont seem to have anything to
queue on the soc driver this time around..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

