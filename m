Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A5ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TKLORAFWjyKSjKXEDenOkvdTWQqYqNMRKTqumATFPI=; b=BEBDy+7ezTuwvkV15nGDdjye97
	0/gqWrpSVtHCIhyjuw6ygHIEF/xWbPA4dFiAKFnsV5LRhZP2Dt9l/3M4NC0PFsDkeA+GINr1y1vcl
	+S7UxOdgfVkhyreqYAtp/0ihdVeU6hke9aN6CF4mU8X3gke3c0/I2IYBC+ylwy3dUzp7RsE56USug
	s4c/izetPj5EWdeGTFGE1mGStBEIyt7gsxnoK8gZZhHrCk7Mfk5D0JYHim1SdaQcSGMfKm1DU2Knp
	0+GatPXVA8VmU1dFc9tWSJenzVkQoFVyTNTahvmfhQRlWxAtIXbK5yOxC6qvETX5p6bGyc43Kw3MC
	6TkywEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo454-00000008GIj-139t;
	Mon, 18 Aug 2025 17:55:39 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3VA-0000000873G-1fYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:18:34 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818171825epoutp0316b322c60835512dad522b864ff8876a~c7A9mDPpI2032020320epoutp03T
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 17:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818171825epoutp0316b322c60835512dad522b864ff8876a~c7A9mDPpI2032020320epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755537505;
	bh=3TKLORAFWjyKSjKXEDenOkvdTWQqYqNMRKTqumATFPI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=nsrFQtSgxkMloRzQrb0Fqf74lhUW4JnFr5o/SrFP7NqI4XnQgXNmFNF2SgiJqZNgw
	 BGbbU8R4rb7Pmt86WSrde1oSJwPRs26gOhSWPsmMbUaefHuI2H6ozm2ctk5Nl+UnFT
	 Lfydxqj7WSd58mlNrNUUBdv3f1Fsaz2pJ23ecnUs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818171824epcas5p22c7cd57b1ceefb7f6ba85f95bb83e1fb~c7A8ntsF32416824168epcas5p2n;
	Mon, 18 Aug 2025 17:18:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5KDb4RJ0z3hhT7; Mon, 18 Aug
	2025 17:18:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818084108epcas5p2cf03efaffd338376a8d1f4dac8972d94~cz9T6GJJc2176121761epcas5p29;
	Mon, 18 Aug 2025 08:41:08 +0000 (GMT)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818084105epsmtip1696e665c75c145cb5e2e7b5854be6a06~cz9RM6cWW2722027220epsmtip19;
	Mon, 18 Aug 2025 08:41:05 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>
Cc: <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <4a47b758-5c20-4e30-bc61-206acd48bdd0@kernel.org>
Subject: RE: [PATCH v3 06/12] dt-bindings: PCI: Split exynos host into two
 files
Date: Mon, 18 Aug 2025 14:11:04 +0530
Message-ID: <000801dc101b$d7b22510$87166f30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHWPHKmIG2WTsjb/5pkHKJ2GfeRPwKMZRF7AtQYMuoCMTwzCLQ3MAYw
Content-Language: en-in
X-CMS-MailID: 20250818084108epcas5p2cf03efaffd338376a8d1f4dac8972d94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154721epcas5p26c9e2880ca55a470f595d914b4030745
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154721epcas5p26c9e2880ca55a470f595d914b4030745@epcas5p2.samsung.com>
	<20250811154638.95732-7-shradha.t@samsung.com>
	<4a47b758-5c20-4e30-bc61-206acd48bdd0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101832_934352_40280F10 
X-CRM114-Status: GOOD (  10.04  )
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

> >
> > @@ -19,9 +19,6 @@ allOf:
> >    - $ref: /schemas/pci/snps,dw-pcie.yaml#
> >
> >  properties:
> > -  compatible:
> > -    const: samsung,exynos5433-pcie
> > -
> >    reg:
> >      items:
> >        - description: Data Bus Interface (DBI) registers.
> 
> 
> So the only common part left here is reg and phy? I don't think such
> common file brings any value.
> 
> 

Okay, will keep two separate files. 

> Best regards,
> Krzysztof


