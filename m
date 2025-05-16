Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919D7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iSprpDD9MEcLp1Bth1jKr1zlM+Nrfxm/TVqYUucfos=; b=nWg3pBUpCDySvHcSAcIKKM5C4f
	7BHz4QvCObNp40DsoH4RIQa3pVPOmRN1VWjbuvVxGEYs5SqFfCQnndB4ZbD+V18tLINV+Ww7vKEaH
	nVomnMnWLaX0D12SAXHdZRv776z05rnVJ5HhCbifE1vnlBe7YnTkSxsb5M7tvS1Wd5aJfY72tIp1J
	/MAMpibGIymSLocFumkFFswzy7Cy66u9v+qZu2A3p6lAnvFWuRZzhS+ihMy7bq3CbNnvME+maC2KX
	tHX4K4xZlV/09xh5iy1x0t7pnetaGI+eSOl9KZHvfPynuluuEBE2x6+okgN3KELSLhtP95kYfL10+
	rtE0670w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuDD-00000003NdH-1kmi;
	Fri, 16 May 2025 12:30:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFu6A-00000003McW-0eKO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:23:35 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GCNMFH293612;
	Fri, 16 May 2025 07:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747398202;
	bh=9iSprpDD9MEcLp1Bth1jKr1zlM+Nrfxm/TVqYUucfos=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=c1mRWIOrLxBSJS9eRA4NySuP5YocU+FwobraV0WAqYdrecvvi0jhnUB3aKbCqOBDi
	 guiNPHWk601pHe/lGM7Am+aAQBc4OUNgkMI9I/vNYEkVEQ7KqF2BYDfM+UKLgsc+br
	 dpVe6kJKbYPC6Z87TU9ClIMhyceajXkLxemF7+tQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GCNL3J2216929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 07:23:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 07:23:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 07:23:21 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GCNLMM102938;
	Fri, 16 May 2025 07:23:21 -0500
Date: Fri, 16 May 2025 07:23:21 -0500
From: Bryan Brattlof <bb@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dhruva
 Gole <d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250516122321.ng33ei7zlabmrod6@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <aCcSG5ah12N0yOwi@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aCcSG5ah12N0yOwi@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_052334_285485_48072996 
X-CRM114-Status: GOOD (  22.98  )
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

On May 16, 2025 thus sayeth Sascha Hauer:
> Hi All,
> 
> On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
> > +	rti0: watchdog@e000000 {
> > +		compatible = "ti,j7-rti-wdt";
> > +		reg = <0x00 0x0e000000 0x00 0x100>;
> > +		clocks = <&scmi_clk 273>;
> > +		power-domains = <&scmi_pds 60>;
> > +		assigned-clocks = <&scmi_clk 273>;
> > +		assigned-clock-parents = <&scmi_clk 1>;
> > +	};
> > +
> > +	rti1: watchdog@e010000 {
> > +		compatible = "ti,j7-rti-wdt";
> > +		reg = <0x00 0x0e010000 0x00 0x100>;
> > +		clocks = <&scmi_clk 279>;
> > +		power-domains = <&scmi_pds 61>;
> > +		assigned-clocks = <&scmi_clk 279>;
> > +		assigned-clock-parents = <&scmi_clk 1>;
> > +	};
> 
> In the TI downstream TF-A we have this in the readme:
> 
> | AM62L Clock SCMI ID List:
> | =========================
> | 
> | **Note:** For using the clock parents, the scmi clock ID will not be the actual number itself,
> | rather will be starting with 0 for respective parents similar to how it's being done in TI SCI
> | Documentation: https://software-dl.ti.com/tisci/esd/09_02_07/5_soc_doc/am62ax/clocks.html
> | 
> | For eg. for AM62LX_DEV_MCASP0_AUX_CLK device, clock ID will be 192, however if we require the parent
> | to be AM62LX_DEV_MCASP0_AUX_CLK_PARENT_HSDIV4_16FFT_WKUP_0_HSDIVOUT1_CLK then we would represent in
> | the device tree as:
> | 
> | ```
> | assigned-clocks = <&scmi_clk 192>;
> | assigned-clock-parents = <&scmi_clk 1>;
> 
> This doesn't work. It's not conforming to the SCMI specification and it
> also doesn't work with the Linux SCMI clk driver which will hang on a
> cat /sys/kernel/debug/clk/clk_summary. This is because all clock
> parents will be the SCMI clocks with the lowest ids including the clocks
> with the lowest ids which will expose themselves as parents.
> 
> It also prevents the userspace from being able to make a tree structure
> from the clock tree.
> 
> The corresponding TF-A code is requested for upstreaming here [1] where
> I also commented on with the same issue.
> 
> Please stop spreading this further. The parents must be the actual
> clk_id, not numbers from 0..n.
> 
> Sascha
> 
> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/34834
>

Ah my bad. I'll drop all nodes that need clock parents called out until 
this is resolved.

Thanks Sascha
~Bryan

