Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D621CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 05:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4BkXaRbSY4CpriOHwvnOYLmtFzMrOOh9JYVfFHYZLU=; b=QfAF6n0VrBYKAT7Z7GiUaRwXoc
	gmgEeMvKHEW3jlWYiofF0gmr1cHMlwjfwgE/BOnufWutx3LaIcobaVp1aSD2QnUF3hMC1GP1Ihf3+
	fsgVsw5+UJaptcgU/7RJmdUXHIjRtnzww7YmbFuTES+UoBBFrMnlAk01PK/iaSGMxyTdzJYXQmG3D
	uWPoQtHHp+Blq/hcoMYTdsTpa0xvfguZhbwG5NtnOcoD+6jstCiDJMSKSBkARq1yorvYik6YlaMCA
	EBSli6N2uZUZspWTdOUrPnWfwIwTwXQD6de++eRv+iDkUKSTokCBR6f0xn7x5Ht9s5n9vLNt8gpo+
	WyGTEcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJmUi-0000000BbPM-09gM;
	Fri, 14 Nov 2025 05:37:12 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJmUc-0000000BbOD-31Rn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 05:37:08 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251114053700epoutp035e4fd4e0447fe8d87b3d7313a7db9523~3yNqh5l4M1782917829epoutp03y
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:37:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251114053700epoutp035e4fd4e0447fe8d87b3d7313a7db9523~3yNqh5l4M1782917829epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763098620;
	bh=f4BkXaRbSY4CpriOHwvnOYLmtFzMrOOh9JYVfFHYZLU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YgyMmFYvQZKJBQaW2RZ1GrT7kT+Ok+o2IaDdCPx2EcyGSWVILyZADQ7jvRK5DbK99
	 c4u54jHechDb2It81AO3pNdvVKuG2FkzkzLGnuSysUSF5BLCJKyhRofQ55HCCkHS6O
	 ybO6+B2TPpW6zh6ufOqvvw+pxhqO6gaSa987tyig=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251114053700epcas2p4c375cd9debd91d96156eef1e20d5f26b~3yNqGZZPU2059920599epcas2p4A;
	Fri, 14 Nov 2025 05:37:00 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d75Vg3vvJz3hhTH; Fri, 14 Nov
	2025 05:36:59 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251114053658epcas2p1bb54b75492e5850a0dc6dbed8ec7cf38~3yNpA9ojs2511225112epcas2p1v;
	Fri, 14 Nov 2025 05:36:58 +0000 (GMT)
Received: from KORCO118486 (unknown [12.80.208.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251114053658epsmtip274ea3eac07362b98eb7eac08d3e37631~3yNo5WXGX2019320193epsmtip2D;
	Fri, 14 Nov 2025 05:36:58 +0000 (GMT)
From: =?utf-8?B?67Cw7IOB7ZuIL1Nhbmdob29uIEJhZQ==?= <sh86.bae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <alim.akhtar@samsung.com>,
	<kishon@kernel.org>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<shradha.t@samsung.com>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <945d5f68-66b9-40f3-afd7-64e746075d12@kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: soc: samsung: exynos-sysreg: add hsi0
 for ExynosAutov920
Date: Fri, 14 Nov 2025 14:36:58 +0900
Message-ID: <000001dc5528$b2053210$160f9630$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQISOccZb2Ez4IvEWuwZme1oXG7+3gG5WrFyAj6/1FYBYx2HL7RbA5zw
Content-Language: ko
X-CMS-MailID: 20251114053658epcas2p1bb54b75492e5850a0dc6dbed8ec7cf38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5@epcas2p4.samsung.com>
	<20250926073921.1000866-2-sh86.bae@samsung.com>
	<945d5f68-66b9-40f3-afd7-64e746075d12@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_213706_906071_AFC3FDAB 
X-CRM114-Status: GOOD (  13.98  )
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

> > Add hsi0 compatible for ExynosAutov920 PCIe settings for:
> > - PCIe PHY power control
> > - PLL settings for PCIe
> > - PCIe device direction (RC/EP)
> >
> > Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> > ---
> >  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> >
> This is not really related to PCIe or phy patchset, so putting it here
> just makes life of maintainers more difficult. There is really no reason
> for that.
> 
> Don't mix subsystems when not needed. DTS patchset targeting me, should be
> separate from other subsystems in such case and it only needs to mention
> in changelog or cover letter where are the bindings.
Will separate this patch from the patchset


