Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A800CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVAbcWAk2aOq5yy+lLQNEPDOBF4DHImBPvsWHnIPBDw=; b=tDX7s0hvhg3ENdxDSFMC4AvSyy
	AuPjPKPTdZ0igaLNDO29Ye1NJVMY3ZWfPv93nyQYp1eTKmB53CrvENfQdwRbks/EMoqy4peDbSpr6
	KQ1JxkKdRWfub1Ex1P/5vSv5Nfg1KpRBFmSaqAIeNOpKJNBq0OMpU0DlSsnByGV4jUT9M0BkSX08L
	2CKgkf2egbHSenoocFSB6F49DSGk80iElPEy7O77R77pTtMIMPqMn0WCcO8DuHIEf9X//U+dhRFz4
	sq4v7pP5XrWpZKeD64NmLqEHGxHhz7FVw3yO2UuFzkGxECzF0GO2g2cS/wMnmta/maOb7jbixHx7t
	h8aWJ6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4FI-00000008HaS-1F1K;
	Mon, 18 Aug 2025 18:06:12 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3Vd-000000087Bv-38nL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:19:03 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818171900epoutp0398a79f9c233539b9da80b85df89fb87b~c7Bdlo2u12183621836epoutp03I
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 17:19:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818171900epoutp0398a79f9c233539b9da80b85df89fb87b~c7Bdlo2u12183621836epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755537540;
	bh=PVAbcWAk2aOq5yy+lLQNEPDOBF4DHImBPvsWHnIPBDw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=JtSXwACXJRyQMkQkfqV42PnpEqSF0oKpqJM5yCiC6+SnGKVr688gcaSBWTPktTkP3
	 aL5+DJDjCRgPZto5QKZT5D41sabpzUrpPVdPXWuA1wPbhHghJAz74uI7ERJ5FxjbXj
	 zZALPwTqrUxYhvRAuzqi4FjMREY8jbogZIhnstTI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818171858epcas5p3db5238d0bc3abe8892dd1d5310cd10c1~c7BcPDxfv1755617556epcas5p3z;
	Mon, 18 Aug 2025 17:18:58 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c5KFF4J95z2SSKX; Mon, 18 Aug
	2025 17:18:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250818092138epcas5p4fbd973353a8fc583a307a0d70e44469e~c0grPJ0XS2613226132epcas5p4j;
	Mon, 18 Aug 2025 09:21:38 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818092135epsmtip1df543cb8d0e7ffd41433147419ef4712~c0gojae4r1917919179epsmtip1l;
	Mon, 18 Aug 2025 09:21:35 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Bjorn Helgaas'" <helgaas@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <20250813230733.GA299608@bhelgaas>
Subject: RE: [PATCH v3 05/12] PCI: exynos: Add resource ops, soc variant and
 device mode
Date: Mon, 18 Aug 2025 14:51:34 +0530
Message-ID: <000c01dc1021$803abad0$80b03070$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ1qeWx2HpfZpij3siYHlZJEM8QdQHmt79NsyW42rA=
Content-Language: en-in
X-CMS-MailID: 20250818092138epcas5p4fbd973353a8fc583a307a0d70e44469e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250813230739epcas5p3d0b8e4bfa880874092c185c7e9819e99
References: <CGME20250813230739epcas5p3d0b8e4bfa880874092c185c7e9819e99@epcas5p3.samsung.com>
	<20250813230733.GA299608@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101902_107139_974F83CC 
X-CRM114-Status: GOOD (  16.69  )
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

> > Some resources might differ based on platforms and we need platform
> > specific functions to initialize or alter them. For better code
> > re-usability, making a separate res_ops which will hold all such
> > function pointers or other resource specific data. Include ops like
> >  - init_regulator (initialize the regulator data)
> >  - pcie_irq_handler (interrupt handler for PCIe)
> >  - set_device_mode (set device mode to EP or RC)
> >
> > Some operations maybe specific to certain SoCs and not applicable
> > to others. For such use cases, adding an SoC variant data field
> > which can be used to distinguish between the variants.
> >
> > Some SoCs may have dual-role PCIe controller which can work as
> > RC or EP. Add device_mode to store the role and take decisions
> > accordingly.
> >
> > Make enable/disable of regulator and initialization of IRQ as
> > common functions to be used by all Samsung SoCs.
> 
> As hinted above, this patch ends up being a mixture of several things
> that makes this kind of hard to review.  Separating these into their
> own patches would make it easier.
> 

Will split into multiple patches



