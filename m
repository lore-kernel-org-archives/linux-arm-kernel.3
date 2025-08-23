Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05EECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbAJUcd0Lj4kx5MXd/4AdzZ70uX0rPpDgcSWwiHkp7w=; b=M5IXqTMyjvRk7PZg9AuysZtYbM
	LBv5iW62i1L0lfSV5LAEIL3BTQ8jZgRhXF4mJL/rCKCk1G9y8n1zNHm1XxkGasjKDzqP17ZfQBHI7
	aXI5rWC6eDMcbmk3pB3W46DIKntFyCQjfaDnIw4MDN0MAbucHPwk/8DCVuJwVyAbVd/ZX9bxdTTTJ
	j27Oe/GPe1oCjtiaYtKEfUqKktP4/Bpqlzc38aHOKAH/pOfGXJDxiMc1+RmadQP2z7B6lwBwo/lKX
	0RNMAXUMSLJfdSpSmqZXVJfVBtqJrKMiz7zbDyOqpa3W0GYb8rfqn2RMIVbPpjeDEw87TkssX6ed8
	yuJmtw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upo83-00000004nPA-35Lh;
	Sat, 23 Aug 2025 13:17:56 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upo5P-00000004nJa-3aUv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 13:15:13 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823131509epoutp04dbf7a9451828e5bba14be96437e71da7~eZ6_65xCp2991929919epoutp04B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 13:15:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823131509epoutp04dbf7a9451828e5bba14be96437e71da7~eZ6_65xCp2991929919epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755954909;
	bh=bbAJUcd0Lj4kx5MXd/4AdzZ70uX0rPpDgcSWwiHkp7w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=L+z4tQyogOIgpq7CHKr23bqBSKOZ/LhsoKG4HLfKi1UOiEAZ8F6k2bukM06XX46U8
	 Y7VAxZgSjG+7oErH0sK9PwYvL4K6qApSvt6gY6C8oCQz3f/Gad2BeTQ3NeRKN3rLEx
	 xrqf79XqscWMqrvuWOY6btZG2TGkr0HSA8zwuD4E=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250823131508epcas5p2aaf5d4d729045a14d3146dfccb43a917~eZ69_4JnV0380703807epcas5p2G;
	Sat, 23 Aug 2025 13:15:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c8Hbb1kFtz6B9m5; Sat, 23 Aug
	2025 13:15:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250823131505epcas5p1dfafdab973b7e1a7dc609e20b9762f92~eZ67vrRKB1219212192epcas5p1j;
	Sat, 23 Aug 2025 13:15:05 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823131501epsmtip19f76be1bbffaa71da10a7c36455d69f8~eZ64BzDho1729417294epsmtip1_;
	Sat, 23 Aug 2025 13:15:01 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Laurent Pinchart'" <laurent.pinchart@ideasonboard.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>, <shawnguo@kernel.org>,
	<cw00.choi@samsung.com>, <rmfrfs@gmail.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20250818093030.GB5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all
 vc regs
Date: Sat, 23 Aug 2025 18:45:00 +0530
Message-ID: <00e601dc142f$f125d880$d3718980$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE40n8LAcQUHd4CRD4O7rKLFTGw
Content-Language: en-in
X-CMS-MailID: 20250823131505epcas5p1dfafdab973b7e1a7dc609e20b9762f92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>
	<20250814140943.22531-9-inbaraj.e@samsung.com>
	<20250818093030.GB5862@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_061512_214753_0E54AB67 
X-CRM114-Status: UNSURE (   9.17  )
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

Hi Laurent,

Thanks for the review.

>=20
> Please see =5B1=5D and in particular =5B2=5D. I would like to get that se=
ries merged for
> v6.18, but it's missing reviews. If you want to speed it up, you can revi=
ew the
> patches :-)

I'll rebase my patches on top of your changes, test and provide review comm=
ent.

>=20
> =5B1=5D https://lore.kernel.org/linux-media/20250608235840.23871-1-
> laurent.pinchart=40ideasonboard.com
> =5B2=5D https://lore.kernel.org/linux-media/20250608235840.23871-9-
> laurent.pinchart=40ideasonboard.com/


Regards,
Inbaraj E


