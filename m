Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C7DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 03:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3/5HzkQn/CeI2bopoX86uqRyljXPEsSE4o7WFp9P3M=; b=HZm5nYEFodRowLi5/vAWnojVcL
	L7lG/qCul3OjtURN3TvOi8MkSb8u63l5GYyIGu1igHAT+1CN5m/UEclTLQVA1JshQXNeBK3Y5h94o
	HIEDGkt2kr6Q2vX7kVi0r8M+08AL6Ke6UR9IPsNNJiea+Mo5XUF2SDEXFWf46ujEJUVMtN3wgQfkT
	KZWrOIUIqGfsLs1OPuJhnWtoLlE6GzzQkMPKyh0iRWHs64TB5otTxbIHenoACqfgIMBCpdbTHmwrB
	z1rHB1PsqH/MS5eyrUm4uwaPGTv/vzXFxSbd3bgMPxYu6Aot/Ujhs2ngL/oJE61cYvJgo//PdKe5R
	iRwaAH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Rz-0000000G8yS-0fAb;
	Thu, 18 Sep 2025 03:36:51 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Ru-0000000G8xI-0AcS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 03:36:49 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250918033638epoutp0226abc99c0ce0d0bea93bc8401869936c~mQzTKjgeO2115821158epoutp02J
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:36:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250918033638epoutp0226abc99c0ce0d0bea93bc8401869936c~mQzTKjgeO2115821158epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758166598;
	bh=s3/5HzkQn/CeI2bopoX86uqRyljXPEsSE4o7WFp9P3M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=kadCp3fmysdFYd9IBQjFuD+vHlcKWirFTHefZhaBLZaTEtAmyCTOr2xzsc01TQwlm
	 w0KBoHWSA9RuMEBcwjYnplWsQEWiQKEfWXkwWUp73Y+GIPeTi8QOg90AFYzushZTVd
	 vmv60O0Ioal09e5lo/pnzDzIKPMBaM6C6aJ1+kAw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250918033637epcas5p1d9d51cc4ecd81b27034d872b75b01417~mQzSacz5M1915119151epcas5p1L;
	Thu, 18 Sep 2025 03:36:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cS1X45D7rz6B9m7; Thu, 18 Sep
	2025 03:36:36 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250918033636epcas5p4b3debeea3bf32662128d305b2883376f~mQzQ83BaZ2797427974epcas5p4Z;
	Thu, 18 Sep 2025 03:36:36 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918033632epsmtip28a31cc2e7c1a72b6d54f7708eb49c7e1~mQzNNeDoo2096320963epsmtip2s;
	Thu, 18 Sep 2025 03:36:32 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jesper.nilsson@axis.com>,
	<lars.persson@axis.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alim.akhtar@samsung.com>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>
Cc: <ksk4725@coasia.com>, <smn1196@coasia.com>, <linux-arm-kernel@axis.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <pjsin865@coasia.com>, <gwk1013@coasia.com>,
	<bread@coasia.com>, <jspark@coasia.com>, <limjh0823@coasia.com>,
	<lightwise@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<shradha.t@samsung.com>, <swathi.ks@samsung.com>, <kenkim@coasia.com>
In-Reply-To: <59d50dee-cd6a-4eab-860a-bf6d50d9bb0a@kernel.org>
Subject: RE: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC
Date: Thu, 18 Sep 2025 09:06:30 +0530
Message-ID: <020801dc284d$6f555b50$4e0011f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLTcCpqrQuryqKp/HAeD2/j2cyERgGw+1i9ApJXu36yh53O0A==
Content-Language: en-in
X-CMS-MailID: 20250918033636epcas5p4b3debeea3bf32662128d305b2883376f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085019epcas5p273ef86028a90e78ada55cde48a28a949
References: <CGME20250917085019epcas5p273ef86028a90e78ada55cde48a28a949@epcas5p2.samsung.com>
	<20250917085005.89819-1-ravi.patel@samsung.com>
	<59d50dee-cd6a-4eab-860a-bf6d50d9bb0a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_203646_726044_F17C5731 
X-CRM114-Status: GOOD (  22.69  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 18 September 2025 06:35
> To: Ravi Patel <ravi.patel@samsung.com>; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; jesper.nilsson@axis.com;
> lars.persson@axis.com; mturquette@baylibre.com; sboyd@kernel.org; alim.akhtar@samsung.com; s.nawrocki@samsung.com;
> cw00.choi@samsung.com
> Cc: ksk4725@coasia.com; smn1196@coasia.com; linux-arm-kernel@axis.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; pjsin865@coasia.com;
> gwk1013@coasia.com; bread@coasia.com; jspark@coasia.com; limjh0823@coasia.com; lightwise@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; shradha.t@samsung.com; swathi.ks@samsung.com; kenkim@coasia.com
> Subject: Re: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC
> 
> On 17/09/2025 17:49, Ravi Patel wrote:
> > Add basic support for the Axis ARTPEC-9 SoC which contains
> > 6-core Cortex-A55 CPU and other several IPs. This SoC is an
> > Axis-designed chipset used in surveillance camera products.
> >
> > This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> > Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> >
> > This patch series includes below changes:
> > - CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
> > - PMU bindings (patch #4)
> > - Basic Device Tree for ARTPEC-9 SoC and boards (patch #5 to #7)
> >
> > The patch series has been tested on the ARTPEC-9 EVB with
> > Linux Samsung SoC tree (for-next branch) and intended
> > to be merged via the `arm-soc` tree.
> >
> > NOTE: This patch series is dependent on following floating patches:
> > 1. https://lore.kernel.org/all/20250917070004.87872-1-ravi.patel@samsung.com/T/#t
> 
> NAK, sorry, DTS cannot depend on the drivers. Please decouple the
> dependencies.

Ok, so you want patch #1 - #5 in separate series and #6 - #7 (DTS patches) in another series.
Can you please review the patches, I will address review comments in v2 (if any) itself.

> 
> Maybe you wanted to point me where the bindings are, but then say so.

Yes, these dependencies are for bindings related.

Thanks,
Ravi

> 
> 
> > 2. https://lore.kernel.org/all/20250917071342.5637-1-ravi.patel@samsung.com/T/#u
> > 3. https://lore.kernel.org/all/20250917071311.1404-1-ravi.patel@samsung.com/T/#u
> 
> I am dropping the patchset from my queue.
> 
> 
> Best regards,
> Krzysztof


