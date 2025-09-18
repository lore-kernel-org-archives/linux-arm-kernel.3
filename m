Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n8aZaGi5wsZR3M7fxB/xKjxSKJA7+RjEz4hMqj7gvI=; b=rLpT0gldWxoEd2eVAW11JmgzNK
	1SPxOzZBlCoIDitWmBidR7qhaQTi3GlIuEJafUjiTmQVQIgCAOuPDjCAuobz/6PlVHL4xl4F0VAmc
	hxvCWFb38n/KgiFN6ddSj6mBIVYuoNjcFDZoGk8y9kUomGX+F+6SJKp+PEr3IVvr+yjeekxc0gcjb
	f9hY1TuOJq8hQTh96d3Y8UjTGxd2q2PwOxaHPEwCWnT5+gQBiBjSO5bYPyYBI4UEnbTGgnAndzdBA
	mrd0i9zWPB4kQUGrSYjj773wGYXtN5oyUHQHLK6kdSDf1LqLVtcFSJsWIsB34h7MNH/oMBA047bWC
	c4aaUGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAMU-0000000Gkya-3uQn;
	Thu, 18 Sep 2025 08:51:30 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAMQ-0000000Gkx8-3xpW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:51:29 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918085119epoutp017daf141c933b318b7bec6ff38131270e~mVGDdLMD62600226002epoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:51:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918085119epoutp017daf141c933b318b7bec6ff38131270e~mVGDdLMD62600226002epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758185479;
	bh=/n8aZaGi5wsZR3M7fxB/xKjxSKJA7+RjEz4hMqj7gvI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vGBuD8FlsHxFXCb9z9eD9mefUm8gQo7rGZoTtcwWnHvgsabfziku8iXwfYIBvjchm
	 udzMo7gt//eam8GnJ0Lbbd8BEwWhVWpGgF9Oz0s8gf6/8W2sa4FvOGggk6Y/dycuol
	 WbUuK+h6sZGuR0qJtw1wsFxaTbPP99YS0vK/IyTY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918085118epcas5p49ea042cd797817fabbe3e9cd04938c10~mVGC7mMTj0181101811epcas5p4a;
	Thu, 18 Sep 2025 08:51:18 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS8W96djpz2SSKY; Thu, 18 Sep
	2025 08:51:17 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918085116epcas5p1b8d60fcb677cbed348996b4c11761d92~mVGAOVtcj1744917449epcas5p1S;
	Thu, 18 Sep 2025 08:51:16 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918085112epsmtip2c228739b2db7b0773d4c34c7df918b7f~mVF9VBzE82068720687epsmtip2X;
	Thu, 18 Sep 2025 08:51:12 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20250915095401.3699849-2-raghav.s@samsung.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add m2m
 clock definitions
Date: Thu, 18 Sep 2025 14:21:11 +0530
Message-ID: <087a01dc2879$64a6f750$2df4e5f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIDMWX7dzjI2+lsAsCe3lTeFtXiqgHaCRjjAd0WrFy0LNbBwA==
Content-Language: en-us
X-CMS-MailID: 20250918085116epcas5p1b8d60fcb677cbed348996b4c11761d92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094512epcas5p223e2eb264967508527f478eb2200be83
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
	<20250915095401.3699849-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_015127_662545_D81A173C 
X-CRM114-Status: GOOD (  12.64  )
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

Hi Raghav,

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Monday, September 15, 2025 3:24 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com; dev.tailor@samsung.com;
> karthik.sun@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add m2m clock
> definitions
> 
> Add device tree clock binding definitions for CMU_M2M
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


