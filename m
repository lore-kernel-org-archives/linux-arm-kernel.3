Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D96CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgV+PmLGp/KB9EJOqn7Inp5PsJT3991z6ChCStxbjQg=; b=hb/U8ycRtdc9fuMVIO12oqNHP5
	nLiNQMOXgiNmThuYBRfKJ8TIkd9aeTvmg9LYpSi3KSGESc4YtObMLcjA3oeL0IUGLOQY5osOG37dy
	mN9z/QFvQFX1WljZzffeF5eKsJ55CgUvuN03GT2QgSOQzumEJd5pk2X93MiYOg+v3rGHhESA1xvVC
	yA9o4oviDqsNDpm/Oo+Qam61y8c5fVZkts6jiD0F/vxWVruHx5oVKOPLuXAUkikb1clx4Q9xlrZpS
	b6+Ukmpdfi4mSNBlit6TYw1yBrbDqLxV+8v7dG12aGXPlj9/2KPulNCZZRx02Et2yiNoxGz6URZ9o
	7/0NNsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplod-00000004fEO-3EhE;
	Sat, 23 Aug 2025 10:49:43 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upeA1-00000003odz-0CgQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 02:39:18 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823023908epoutp04ca63a0fb78ceff846a7ef864a7a79281~eRPqsoCRb3081230812epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 02:39:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823023908epoutp04ca63a0fb78ceff846a7ef864a7a79281~eRPqsoCRb3081230812epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755916748;
	bh=QgV+PmLGp/KB9EJOqn7Inp5PsJT3991z6ChCStxbjQg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jy2W90b/yrA+cEyfyqMXqbqQteuc2jI/0L9Ybe/nN8QpCAue5U9nz09bkUuiT0Xd4
	 1QGv9YB9XuWQsft8FF2bQEDnhhxzDeENeHRSdySchf+t/gxnERhGgsBjp5d67rzs+E
	 eiBSPgHwA/nNGUV8uOTjHVnyZTpm+SMtmiOLWZc4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250823023906epcas5p2f0bf896d97618e2e66cfd9b27c4cd6bf~eRPpnxNTD1444614446epcas5p2L;
	Sat, 23 Aug 2025 02:39:06 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c81Tk0Kjcz3hhT3; Sat, 23 Aug
	2025 02:39:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823023905epcas5p28b7b4c4015e8be3f26883ecf205427ba~eRPoLvoEO2360223602epcas5p2l;
	Sat, 23 Aug 2025 02:39:05 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823023901epsmtip1dafb04bddf79dbf9f341e0d7af7c0106~eRPkfpx8c0621806218epsmtip1J;
	Sat, 23 Aug 2025 02:39:01 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Sat, 23 Aug 2025 08:09:00 +0530
Message-ID: <00e201dc13d7$17d2a750$4777f5f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YA0x2iD7KMY0ZQ
Content-Language: en-in
X-CMS-MailID: 20250823023905epcas5p28b7b4c4015e8be3f26883ecf205427ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
	<20250814140943.22531-11-inbaraj.e@samsung.com>
	<c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_193917_399825_F3382ACA 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

Thanks for the review.

> On 14/08/2025 16:09, Inbaraj E wrote:
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - port
>=20
> Also, you miss here supplies (as required).

According to the HW design of FSD SoC, the control to manage CSIS power is =
given to
a separate CPU where custom firmware runs. Therefore. The Linux side does n=
ot control
the CSIS power supplies directly and are hence not included in the device t=
ree.
=20

Regards,
Inbaraj E


