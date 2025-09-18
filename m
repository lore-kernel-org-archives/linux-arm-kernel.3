Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D73CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmBBeWQLJLdBvcEKIt5FmNx+Tdlhgo71aY0OO5PcSIg=; b=Mz//dwZMMxHGS3Qj8FtpLYvwit
	uUduy85DbMytGwOxEUXwiVJ2i+nQckb2xEShMyLtM9tt34GVbaHQbeFJMy2p5EYGCRSpIxKmuJEIV
	VhAR5u5ApRgnUcycAA4M1nvEQSkTCCTJm9okFRyEFhmkBDWPd8tsgU4XOjdaBnRhbMJovEBs00i5O
	kyREIimQoi4bWE/SlEhEew/PZrXJVyC86fGX43NkBmtlEjb6vaQcdXFOZKpyxzIMb95bl+jvxxiab
	pa637Obb+hqhkL/H0X/d1LifLZWP5sQ/WTsuyeMMiLBNf+JxH9SwNIe54ZUTZWZqHBhJFOwqGWIMc
	dp3ubhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAQ0-0000000Glq1-03fM;
	Thu, 18 Sep 2025 08:55:08 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAPx-0000000Glmr-15tI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:55:06 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250918085459epoutp04a0423ae934c0c3403814c74e2ba1a2e0~mVJQb_sFs0820808208epoutp04x
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:54:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250918085459epoutp04a0423ae934c0c3403814c74e2ba1a2e0~mVJQb_sFs0820808208epoutp04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758185699;
	bh=rmBBeWQLJLdBvcEKIt5FmNx+Tdlhgo71aY0OO5PcSIg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IEi1i8gMN7XRpwrq1jlvNqDl3GdgvjdbqBCDWaWiEL4idn4Fyci88/rfn1jIYqlw0
	 y3wKRHjBGrcIklb/MTquI1Yt16WxUz2ekSmFHGRnVaGwBoe4bxYWMN4g/OrJP7lprP
	 9+a4Pg79J97saIxiHYSb2o4AtEOUn05wiyctgJUA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918085459epcas5p453b23f97b8a18ada0f3347f30227a5e8~mVJP3CffL3128931289epcas5p41;
	Thu, 18 Sep 2025 08:54:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cS8bQ0SqQz6B9mH; Thu, 18 Sep
	2025 08:54:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918085457epcas5p183de37a5d137c6649aa29c66a510a9d4~mVJOQJrju3029730297epcas5p16;
	Thu, 18 Sep 2025 08:54:57 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918085454epsmtip22719dfea50c923eee5bf322bf1dd9c07~mVJL1aAhm2272122721epsmtip2U;
	Thu, 18 Sep 2025 08:54:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20250915095401.3699849-3-raghav.s@samsung.com>
Subject: RE: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
Date: Thu, 18 Sep 2025 14:24:53 +0530
Message-ID: <087b01dc2879$e8822770$b9867650$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIDMWX7dzjI2+lsAsCe3lTeFtXiqgH5gg35ANbkz8C0NAzFkA==
Content-Language: en-us
X-CMS-MailID: 20250918085457epcas5p183de37a5d137c6649aa29c66a510a9d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
	<20250915095401.3699849-3-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_015505_620552_37285D58 
X-CRM114-Status: GOOD (  11.89  )
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
> Sent: Monday, September 15, 2025 3:24 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com; dev.tailor@samsung.com;
> karthik.sun@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
> 
> Add support for CMU_M2M which provides clocks to M2M block, and register
> the required compatible and cmu_info for the same.
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


