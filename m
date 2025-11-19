Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEDBCF31B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emxCFhe6JqYKv2dF3aZnO8Bo+hWOx+Kdh42BHQei1RI=; b=aa0nR+sQsNmoj1aCKVY7pXfblM
	uHkhXVnxLOQO08ukilbgvvESYpokyeDtp/7zQPiMcDIIL+h1wuIkb4HuzFMRm8LlSqzslJkWece1a
	INHE1tRA+y4szTG7dhkAOueU9BXa1qlrr5x3BpBw1L7KiywREtVQqZZm4SvyjQMYX23aRIQR7eb3a
	RcngXgAYtoDmAJszPHif+AVn2jdhRiMiFOWmOEjCXHAAqeTU8wh2oz1maqqigNH7qV+ieblr1eRke
	Ten2zqqddtzwcg+omPMK0+hUyeSeNg03K4nYy6Ilf1tMyYd3jp1iBgaVoA4tg2LzFXhbYe7SBREzz
	nuOvqKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhM8-00000003Ag7-3pDh;
	Wed, 19 Nov 2025 12:32:16 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhM5-00000003AeB-2DPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:32:16 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251119123206epoutp0115a5e871c47481b1dac0f4a81e0be0e9~5aGhbvIck2663626636epoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 12:32:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251119123206epoutp0115a5e871c47481b1dac0f4a81e0be0e9~5aGhbvIck2663626636epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763555526;
	bh=emxCFhe6JqYKv2dF3aZnO8Bo+hWOx+Kdh42BHQei1RI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uPLF5zSBFNWPpoauRbyrvM9qj+kgMmrDj2+FL4BP7z3Mz5z6xprbK4/aD4GOkPbz0
	 RxHcLWvpXz9lplG85zylF9VF44Yhw2PdtBjA7CwgLt+fjG3d7ZJJVLZkAAgbPitAb+
	 K5ZK/Pvl9s/augmmxaS1GM0pLOwdyuDCzH0+WLw4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119123205epcas5p32b4bdf32def98ead9a370bc9d5eec895~5aGgdYLD_0313203132epcas5p3W;
	Wed, 19 Nov 2025 12:32:05 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dBLTJ3WC9z2SSKf; Wed, 19 Nov
	2025 12:32:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251119123203epcas5p4dd8f8d47fe08b9875f99f7d61eeda57a~5aGe_2NT10773007730epcas5p4Z;
	Wed, 19 Nov 2025 12:32:03 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119123159epsmtip175bc7abf4ad459f5bd64c41bf4a42406~5aGbPORQD2984229842epsmtip1d;
	Wed, 19 Nov 2025 12:31:59 +0000 (GMT)
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
In-Reply-To: <de2f6c52-e9d6-48ae-8620-7c518b686ffd@kernel.org>
Subject: RE: (subset) [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock
 controller
Date: Wed, 19 Nov 2025 18:01:57 +0530
Message-ID: <03e701dc5950$824d44f0$86e7ced0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLr0KoHjPqm8iVboT8Q2O7+qgWovgMI9Oa5AjEfx9QCeSN36wHF7Q86so815vA=
Content-Language: en-in
X-CMS-MailID: 20251119123203epcas5p4dd8f8d47fe08b9875f99f7d61eeda57a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
	<20251029130731.51305-2-ravi.patel@samsung.com>
	<176355242978.116968.261312419155141714.b4-ty@kernel.org>
	<de2f6c52-e9d6-48ae-8620-7c518b686ffd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_043214_220775_48E84E05 
X-CRM114-Status: GOOD (  16.92  )
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

Thanks Krzysztof!

I will send the ARTPEC-9 device tree related patches soon.

Thanks,
Ravi

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 19 November 2025 17:13
...
> 
> On 19/11/2025 12:40, Krzysztof Kozlowski wrote:
> >
> > On Wed, 29 Oct 2025 18:37:28 +0530, Ravi Patel wrote:
> >> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> >>
> >> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> >> which generates clocks for other blocks.
> >>
> >> Add device-tree binding definitions for following CMU blocks:
> >> - CMU_CMU
> >> - CMU_BUS
> >> - CMU_CORE
> >> - CMU_CPUCL
> >> - CMU_FSYS0
> >> - CMU_FSYS1
> >> - CMU_IMEM
> >> - CMU_PERI
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
> >       (no commit info)
> 
> 
> All applied regardless of above missing commit info.
> 
> Best regards,
> Krzysztof


