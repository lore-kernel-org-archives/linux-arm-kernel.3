Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7ACA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUfL5bKnDp2X/NiKP63dUX2P6xrzq3fLobwT70t10jM=; b=3ajorjaxRTdA7g69aXDcBHT+Wt
	RG8uRDaVXm+Mc74hlqL6IzyGYAvxWFtJjPmB54hj7dYHvNLXmpwn+/ubTNX0knjQR5KHxgSDOIL44
	lV61fgszbIXXLxt2UXPXDz63vbagv/Y4TcWyw4X3YTLr52Ubo+frI1V+d4oTXtLL1L0kcFPJyf5v7
	10eXLmWjSaJtxTBe8gYeTT3T6/D4j5Ky9/guqZ//e8epZwYDmFLL0DhS/ox7Io5+9+2bUB4vGtALC
	2mo1jYf+b0lCWikjCY24yMzlntFTjuFD81UWr+tv4JW0LCcqF9ba1gGm2pBUuhqAhuaZL/kM7SIrH
	l/m+HxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7ue-0000000HWD1-3KRB;
	Thu, 21 Aug 2025 16:13:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4OQ-0000000GuCl-2bp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:27:48 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LCRfix485110;
	Thu, 21 Aug 2025 07:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755779261;
	bh=fUfL5bKnDp2X/NiKP63dUX2P6xrzq3fLobwT70t10jM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vaJ0vgiPuzv3cjC4kGWxErhToHZ6hY+OXaVVTMRK5UUzPWti5Lady/qEf239x9qv1
	 kgGLriP1vdAhQ/AxztGI511KUe+b84sVDxHpT64qqXXKTOJJfdezVJDtu+cTI9/K+M
	 bkfIOEZMC+vHzDrt5bi53wMLlfnms0IoeQv1tneU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LCRfvs2526117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 07:27:41 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 07:27:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 07:27:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LCRfU42146850;
	Thu, 21 Aug 2025 07:27:41 -0500
Date: Thu, 21 Aug 2025 07:27:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH 0/4] Add cpufreq and USB support for AM62D2
Message-ID: <20250821122741.eqrwystfey7nwvym@outfit>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_052746_814551_6085D73B 
X-CRM114-Status: GOOD (  17.99  )
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

On 14:03-20250820, Paresh Bhagat wrote:
> This patch series introduces following changes:
> 
> * Patch 1 fixes the register length in main_pmx/padconfig for AM62D
>  and AM62A.
> 
> * Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
>  tree nodes.
> 
> * Patch 3 adds AM62D2 SoC to cpufreq-dt-platdev blacklist so that
>  cpufreq is handled by the ti-cpufreq driver instead of the
>  generic cpufreq-dt driver.
> 
> * Patch 4 extends ti-cpufreq to register AM62D2 SoC support by
>  reusing the am62a7_soc_data.
> 
> Boot Logs-
> https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9
> 
> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
> Schematics Link-https://www.ti.com/lit/zip/sprcal5
> 
> Paresh Bhagat (3):
>   arm64: dts: ti: k3-am62d2-evm: Enable USB support
>   cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
>   cpufreq: ti: Add support for AM62D2
> 
> Vibhore Vardhan (1):
>   arm64: dts: ti: k3-am62a-main: Fix pinctrl properties

Please do not mix things up to maintainers. Please post patches #1,2
separately to DT maintainers - these do not have any relationship with
the rest of the driver patches.

> 
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c      |  1 +
>  drivers/cpufreq/ti-cpufreq.c              |  2 ++
>  4 files changed, 25 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

