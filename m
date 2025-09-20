Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5178ECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQ4+CroMOZ6+PrKqvO9PJnzfWlXXz0wdVIsgyy9cDU8=; b=MWEWIUtspxPle/mVL0H6HzTPqC
	TU1uUELWO7PtjraiIyzWHbcDojaROW8+eK1UJf5cWjjt2TDzl9E3tIwzrUtg1XTg6x1BTmdsHfYlI
	xBXunFA5gjL3q47FPwA2vP7C/8hvRIgf2WhzNXs8Jt1XWwJ+knnr3hK6V7DCvCKWlO/VohzcHSdDT
	gsZ9XtW6updPnZ+OMcMY8/XoM/iB2oNMf8UT38giKmHekVVkGeFxhApUsjvSzxyUC5dODTQbnowPh
	JP67ljODcbAagJE+Hjll0zenoCv6RsFsXAIEaK2XKhd3FqskequM/XZDW0dJJr27bBlMmbatjvU+n
	fKpm/VBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsac-0000000511j-3B5m;
	Sat, 20 Sep 2025 08:05:02 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsaa-0000000510Y-12Yy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:05:02 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58K84mEI399043;
	Sat, 20 Sep 2025 03:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758355488;
	bh=LQ4+CroMOZ6+PrKqvO9PJnzfWlXXz0wdVIsgyy9cDU8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NjVf81lp9CGtBb9U7brcJn+6oC5L1NoaSWr7eowTWa1Zcoi5zk6Oph7qXtBfx7l5p
	 QmqEBJE1zRWRdeGP0pyc8wj6yCyG5ZpD9lQGvZ6/H1Zh4E1XZfDf4XlV9G4X3GeerJ
	 cxFR/EQsJPZpqL2e/ZWxSa4J9Z2XcsYi+8wwhJiw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58K84mmv3496308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 20 Sep 2025 03:04:48 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Sep 2025 03:04:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Sep 2025 03:04:48 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58K84lIN3564491;
	Sat, 20 Sep 2025 03:04:47 -0500
Date: Sat, 20 Sep 2025 13:34:46 +0530
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
Subject: Re: [PATCH v2 06/10] PCI: keystone: Add ks_pcie_free_intx_irq()
 helper for cleanup
Message-ID: <0cab2a15-92bd-4ace-943d-ba82ede49b8b@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-7-s-vadapalli@ti.com>
 <7sbyvk6vyrbyox5ghvhokrv67r2el4s4f6k42aygmfo3rltj27@6v5pjxbhdl5w>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7sbyvk6vyrbyox5ghvhokrv67r2el4s4f6k42aygmfo3rltj27@6v5pjxbhdl5w>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_010500_350213_C22E6DF2 
X-CRM114-Status: GOOD (  11.88  )
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

On Sat, Sep 20, 2025 at 12:05:38AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Sep 12, 2025 at 05:46:17PM +0530, Siddharth Vadapalli wrote:
> > Introduce the helper function ks_pcie_free_intx_irq() which will undo the
> > configuration performed by the ks_pcie_config_intx_irq() function. This
> > will be required for implementing a future helper function to undo the
> > configuration performed by the ks_pcie_host_init() function.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Please squash all patches introducing new helpers.

I will squash them in the v3 series.

Regards,
Siddharth.

