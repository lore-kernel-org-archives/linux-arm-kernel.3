Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6013DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SHXzfaOEdg6X115/K//Il5mPpamyh8qQbk6ql+nf3Y=; b=ofc1GQy+xKj03b0PjOxFoTJefJ
	1SnwoT9Bt6akw6l+rpBmWgMlOePabotTDolK/cThQc/CZfaBKlRiC+wej3n/rqo6HXQRJganRyBa8
	4tYozuMhvMVbSiu3/5iLVv/4PED/N9W/hqnRZVkUkDeYAQBVgx0ODoNbRvgP5ASwfboT8wOa5Jyoi
	7WejUqC0E7RhG2S67jHZes7tVPRvkRkcOVjxpHNgqGAx7xelAu1DdSlh8wG+ThUl3RJFYISUnPUrl
	64Uw6lPQi9wlFuxXf/osrv10S4aNODVU0yzD2b9N55yynGfnEVrqkno8C+XohriZ6Q4m7Sy3W2Ia+
	yHAoNgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cna-00000009slK-41LP;
	Mon, 22 Sep 2025 09:25:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cnY-00000009skd-15V4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:25:29 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58M9P7lO740019;
	Mon, 22 Sep 2025 04:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758533107;
	bh=+SHXzfaOEdg6X115/K//Il5mPpamyh8qQbk6ql+nf3Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cNBGb2pjqzD1D/ubVZfXWMp7ZEFEV/ZGs6lYlUh21xaV3tJqZtLAVFaavMFZ2X/SA
	 HZU/ORT3S5PGzcI/gj2xViYH+JeLhmie0Zz3PyZNjcBR2eyOtVdWmcqzqgSVDfurf8
	 OiO8kSDdEyncPiYyL2+BqAMxB9hYGu7le4vGLDpg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58M9P7MG1067900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 04:25:07 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 04:25:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 04:25:07 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58M9P6vQ2274743;
	Mon, 22 Sep 2025 04:25:06 -0500
Date: Mon, 22 Sep 2025 14:55:05 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <quic_wenbyao@quicinc.com>,
        <inochiama@gmail.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v3 0/4] PCI: Keystone: Enable loadable module support
Message-ID: <590d183c-8971-4728-9aa3-4e02bd3d0845@ti.com>
References: <20250922071222.2814937-1-s-vadapalli@ti.com>
 <175852954905.18749.5091036983349477093.b4-ty@kernel.org>
 <3sjuplupmdoxqhyz2i2p4he5vw7krqokixoy6ddoiox6p536n6@xzfcyhwjx3hv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3sjuplupmdoxqhyz2i2p4he5vw7krqokixoy6ddoiox6p536n6@xzfcyhwjx3hv>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_022528_584171_8B95F1A0 
X-CRM114-Status: GOOD (  28.84  )
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

On Mon, Sep 22, 2025 at 02:02:43PM +0530, Manivannan Sadhasivam wrote:

Hello Mani,

> On Mon, Sep 22, 2025 at 01:56:08PM +0530, Manivannan Sadhasivam wrote:
> > 
> > On Mon, 22 Sep 2025 12:42:12 +0530, Siddharth Vadapalli wrote:
> > > This series enables support for the 'pci-keystone.c' driver to be built
> > > as a loadable module. The motivation for the series is that PCIe is not
> > > a necessity for booting Linux due to which the 'pci-keystone.c' driver
> > > does not need to be built-in.
> > > 
> > > Series is based on commit
> > > dc72930fe22e Merge branch 'pci/misc'
> > > of pci/next.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
> >       commit: c514ba0fa8938ae09370beecb77257868c1568a7
> > [2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
> >       commit: db9ff606a5535aee94bf41682f03aba500ff3ad6
> > [3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
> >       commit: 76d23c87a3e06af003ae3a08053279d06141c716
> > [4/4] PCI: keystone: Add support to build as a loadable module
> >       commit: e82d56b5f3844189f2b2240b1c3eaeeafc8f1fd2
> > 
> 
> I just noticed the build dependency mentioned in the cover letter after applying
> the series. This is problematic since there is no guarantee that the dependent
> commit will reach mainline first. So if this series gets applied by Linus first,
> then building this driver as module will break the build. We should not have the
> build error at any cost.

As feedback for the future, is there a better way that I could have
highlighted the build dependency? I agree that a build failure is
unacceptable which is why I tried to highlight the dependency, but, it
probably wasn't the best approach to point it out by mentioning it in
the cover letter. Please let me know if I could make it easier for you
and other Maintainers to notice such stated dependencies.

> 
> So I'm dropping this series now. Please repost once the fix is in mainline
> (which will be next cycle).

Sure, I will repost the series. I had posted the v3 series right away
to make it easier for you and other reviewers to provide feedback before
people lose context. Thank you for actively reviewing this series and
sharing your valuable feedback :)

Regards,
Siddharth.

