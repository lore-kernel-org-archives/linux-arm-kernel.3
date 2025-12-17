Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD9D65C41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKzEm9PCAMc/zZKdtRrga2/5a5ppxdX40J7ntSJOBTY=; b=XMlKqT1eXAAuKcSxD9GenWUA4G
	BRf/F8Pxh8UYXifE4l5Yvs5H3zWDlszqUtCwfPTIhUwOO9BpQzeXo9REYp0eL0HixlGfCb4xW+RU0
	3RtVD+V3D9IhV5wrJGzSBKaWDFtbHN3aHn3v29W9XK2RFntG7jlc8JuXWsVdSU/VBI50phgYGoTpE
	UhN0UTXZ9h8OAiziOGrye+wbiY0SLF2ve2nMZgQh0eV2ZKiOelB0Yrpk35G64TMqQQ7bp+Q/KjeHC
	PJaUvpaeEnhmcZOtYEo7qsG5sGWuBmYB1ymEwm/p45prsAPK2w7IEY54F8sl8OtlXvvPJecPgFSfL
	9TvccdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqtM-00000006o0r-1CLd;
	Wed, 17 Dec 2025 12:44:32 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqtJ-00000006nzo-1I7W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:44:31 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251217124420epoutp0321a9eb96465048f09a4f5d6d5921e96f~CAVMyGXVd1271112711epoutp03O
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:44:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251217124420epoutp0321a9eb96465048f09a4f5d6d5921e96f~CAVMyGXVd1271112711epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765975460;
	bh=uKzEm9PCAMc/zZKdtRrga2/5a5ppxdX40J7ntSJOBTY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QHodV+rePxcHT2AfUJ5tgUpaf+erfVcd6JeQ1GHAE+lBlO/BFbHG0nIecQXXfPOS4
	 VEqy1YB4DYx098hV8hwKX+wird1M0i0tthwtg0V57WFxevP096t4BbEyDBODhxIE/2
	 fXym/Y/Y6uvw+V4I871z/qBGPrZT4IdAodn46PRI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217124419epcas5p434dc74c355eda3f40ba288e5b92a9ad9~CAVLdnpF82366923669epcas5p4x;
	Wed, 17 Dec 2025 12:44:19 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWYQV2RYDz2SSKb; Wed, 17 Dec
	2025 12:44:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251217124417epcas5p337b4252e357397f5b2c9d0ad4ea6ab66~CAVKHP8c-1639116391epcas5p3C;
	Wed, 17 Dec 2025 12:44:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217124414epsmtip17b0220deca35a595dc0943e5bd78b27b~CAVGu3Chi1017810178epsmtip1G;
	Wed, 17 Dec 2025 12:44:14 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20251119114744.1914416-2-raghav.s@samsung.com>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov920: add MFD clock
 definitions
Date: Wed, 17 Dec 2025 18:14:12 +0530
Message-ID: <139901dc6f52$dba09d50$92e1d7f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7EhboaEaVd13SrnoN6ZCnkjrAPADo0L1uAwo319O0yOkH8A==
Content-Language: en-us
X-CMS-MailID: 20251217124417epcas5p337b4252e357397f5b2c9d0ad4ea6ab66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785@epcas5p1.samsung.com>
	<20251119114744.1914416-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_044429_997767_52EB33AB 
X-CRM114-Status: UNSURE (   9.02  )
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

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Wednesday, November 19, 2025 5:18 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com;
> dev.tailor@samsung.com; karthik.sun@samsung.com; Raghav Sharma
> <raghav.s@samsung.com>
> Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add MFD clock
> definitions
> 
> Add device tree clock binding definitions for CMU_MFD
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



