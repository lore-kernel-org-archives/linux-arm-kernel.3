Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A00C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFWPuqQMAL7NxNHoKz6mQkM5FY+ToS1fRX2hOlbxr9M=; b=Jk0bmmfqDkZcdKZ306gossXNV/
	Xbfai2TEcoG9HXqDoRvAZUKEdu5WYF4p9jzbPSgONVtdM9OUjk53VKD9F/JbzqBxzZMCbvTz2nc/T
	JTiTJ4Cha1eYdN2wr8N9RdjyFL3vEs6HmaCvWFA8/YCmTsB0scNbjM8FH2CGio+APsAd2nU46dhWi
	RIIPyXhJYnQ2ZZL1GWGADxgNixQHiWx3M4opLxJm4E6TV+6VUgikT85eoj0xI7/2PiQwDeIHDLEis
	F543YMPebRgXsrlZYJP62GSVQlReLgD57ZJh3TxZOqUMPuca39YgzzWsxA7ok9vNT1B6zLOS0/tHS
	v6lfUY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ezg-0000000BbYD-2kOq;
	Wed, 23 Apr 2025 18:38:48 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eWF-0000000BU7p-2tn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 18:08:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53NI8ATV1615961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 13:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745431690;
	bh=EFWPuqQMAL7NxNHoKz6mQkM5FY+ToS1fRX2hOlbxr9M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=etJnk9LL5YyulNfARr1RPpEstaU5mXL0BY4HyWpMQ0Gf47Ckr+BDOp/N94jB/ydmO
	 ugPHD9U1x8CCzjCg3DnCM7mcrF8MhJ/7/2c4LIGltEzVM+jJRoD3UW7d57RmnHaXVJ
	 k3PysXHTXqvBiBCFZ3BfnwQkf08+VkB4hcdtvUrY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53NI8AMr116997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 13:08:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 13:08:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 13:08:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53NI89wp126662;
	Wed, 23 Apr 2025 13:08:09 -0500
Date: Wed, 23 Apr 2025 13:08:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>, Josua Mayer <josua@solid-run.com>,
        "Sverdlin,
 Alexander" <alexander.sverdlin@siemens.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Josua Mayer
	<josua@solid-run.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini
	<francesco@dolcini.it>,
        Hiago De Franco <hiagofranco@gmail.com>, Moteen Shah
	<m-shah@ti.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH RESEND v3 0/3] Add ti,suppress-v1p8-ena
Message-ID: <20250423180809.l3l6sfbwquaaazar@shrank>
References: <20250422220512.297396-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422220512.297396-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_110823_836186_2AE9D728 
X-CRM114-Status: GOOD (  20.67  )
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

On 17:05-20250422, Judith Mendez wrote:
> Resend patch series to fix cc list
> 
> There are MMC boot failures seen with V1P8_SIGNAL_ENA on Kingston eMMC
> and Microcenter/Patriot SD cards on Sitara K3 boards due to the HS200
> initialization sequence involving V1P8_SIGNAL_ENA. Since V1P8_SIGNAL_ENA
> is optional for eMMC, do not set V1P8_SIGNAL_ENA by default for eMMC.
> For SD cards we shall parse DT for ti,suppress-v1p8-ena property to
> determine whether to suppress V1P8_SIGNAL_ENA. Add new ti,suppress-v1p8-ena
> to am62x, am62ax, and am62px SoC dtsi files since there is no internal LDO
> tied to sdhci1 interface so V1P8_SIGNAL_ENA only affects timing.
> 
> This fix was previously merged in the kernel, but was reverted due
> to the "heuristics for enabling the quirk"[0]. This issue is adressed
> in this patch series by adding optional ti,suppress-v1p8-ena DT property
> which determines whether to apply the quirk for SD.
[...]
> 
> [0] https://lore.kernel.org/linux-mmc/20250127-am654-mmc-regression-v2-1-9bb39fb12810@solid-run.com/

Why cant we use compatible to enable the quirk instead of blindly
enabling for all IPs including ones that have onchip LDOs? That was the
reason it failed in the first place for am64x.

This is very much like a quirk that seems to go hand-in-hand with the
compatible for am62-sdhci ?

Is it worth exploring that option in the driver thread? from where I
stand, this sounds very much like an issue that AM62x IP has, and should
be handled by the driver instead of punting to dts to select where to
use and not to use the quirk.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

