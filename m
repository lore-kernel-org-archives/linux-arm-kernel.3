Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F9BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3gkevHKttZ+zKYQgGG9Fj0bcgXN5Z9yfJL6umgFsuI=; b=u1coo6z+GSjDOWGYNrXDs+kQT7
	zrUVEFldTT5FM8/ova93Zf+e+Gj7FOX0nyH/kq3b1HESlPdQmSmrtLTcHroHa2k57ANqCkjoRlI+g
	rR20TU63QBuul1/SqDYxJnEmhRPje3C7wrGmTli8WUTghdwApUOXB/uZrVY2WNCg8f3pTE1iJudpo
	RN3WKpDSwKRBRRsGzovdQgAgXtdsxj7qetd3B2UWkxBcr2zFzWUI6UOL+918l9T5VcWlxC0GAJtIp
	JA3fNF+CCNu9/qRI8LK1H6+HHyzS4ejaC94y1Kt4MEY5efLF2olmfjck4b8YjkJ2Tt3KBVXTm6WUs
	2wvFEtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsTN-000000050Us-0PE2;
	Sat, 20 Sep 2025 07:57:33 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsTL-000000050UO-0uZW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 07:57:32 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58K7v7J5388223;
	Sat, 20 Sep 2025 02:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758355027;
	bh=T3gkevHKttZ+zKYQgGG9Fj0bcgXN5Z9yfJL6umgFsuI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jCLFa8cq930P8+yRMuQyL4OSdG9GsvXm0KxiF5xQfmuvqU5VK5PDVeREyNCZh5qk9
	 nIiuHgOd1ngtgDKGjwRA1iDWzYY9DgV8I4Cv//ODZybRcmvKjrCwLIYtUxKJS/73Vi
	 ySJ6+AEelM4Wari0SDzYjyzbni0oq1rEbVEzBBRo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58K7v74L2919129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 20 Sep 2025 02:57:07 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Sep 2025 02:57:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Sep 2025 02:57:06 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58K7v5pr3828574;
	Sat, 20 Sep 2025 02:57:06 -0500
Date: Sat, 20 Sep 2025 13:27:05 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <jingoohan1@gmail.com>, <christian.bruel@foss.st.com>,
        <qiang.yu@oss.qualcomm.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <quic_schintav@quicinc.com>, <inochiama@gmail.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 04/10] PCI: dwc: ep: Export
 dw_pcie_ep_raise_msix_irq() for pci-keystone
Message-ID: <6550c06c-b8e8-437e-a399-d1c8c2e29774@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-5-s-vadapalli@ti.com>
 <kb6jxzyihyuhd4qfvdtgxgopzgyymhsflqmheb3fribovdck23@ahswbufb23sv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <kb6jxzyihyuhd4qfvdtgxgopzgyymhsflqmheb3fribovdck23@ahswbufb23sv>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_005731_347658_A098B76B 
X-CRM114-Status: GOOD (  12.45  )
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

On Sat, Sep 20, 2025 at 12:00:47AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Sep 12, 2025 at 05:46:15PM +0530, Siddharth Vadapalli wrote:
> > The pci-keystone.c driver uses the 'dw_pcie_ep_raise_msix_irq()' helper.
> > In preparation for enabling the pci-keystone.c driver to be built as a
> > loadable module, export 'dw_pcie_ep_raise_msix_irq()'.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> This patch could be merged with patch 2.

I will squash this in patch 2 in the v3 series.

Regards,
Siddharth.

