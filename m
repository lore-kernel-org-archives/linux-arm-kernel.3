Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356CDC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIfe/G3y8DznxsDg++Y9/l5+8bOWnAYzQhK3ZnU/dY4=; b=PJlqDXq+kt86Yu3ZIPG5qdVGpO
	3LIXrfkMshJlqRRpz68cp0lZbfke8oJDqWIpf4TE6aJw6eXqe7sGtwtojc7+FFX5KVz191MSDvpmb
	60wZqw939nf/LY8AhfLKWSnWUm55ZZKshklvbIYAobhxpPT7qOxkoR0mGS9Yq3VekhUhaxJllgB3A
	MjcAQBpak8FRwSOk3GmYJJnf4gEshWeyjNrU0UoTD59U/t3klFu6TNI6aY6hL+fzz5Cccz7dPOv1R
	E+yK4tx2eygUTXmgSoOCfcDkkzpKbcRs0wt88+z6s5oWN44MBELhOhpWE9ojoTxJ844H9jfrVFjHY
	KMloAOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgjF-0000000Bt4B-39tz;
	Fri, 31 Jul 2026 06:28:21 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgj9-0000000Bt3n-2kQG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:28:20 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260731062808epoutp04f32954ca2bd0c307b9fc4bdb84fb8c81~HS-PmhuOB0413204132epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:28:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260731062808epoutp04f32954ca2bd0c307b9fc4bdb84fb8c81~HS-PmhuOB0413204132epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785479288;
	bh=TIfe/G3y8DznxsDg++Y9/l5+8bOWnAYzQhK3ZnU/dY4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=U69aHvAnKAtBK9qtGTDrEGYHgHJXa/vMuXh1ZamM1XXsz4RRFOt6TVWQ4/+bx6Ghp
	 4HDGJ5wR+dgW7FgIUBbOLNwrCuQTFNH/DaSQ4QrrBQBwrstHEseZHcL7vjtzocPewq
	 FVhc3MpFpBK2OUQf3a0carmDifmuIBmsgeQrKLfo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260731062807epcas5p39055173e7a2aa9259b60a6fb35fae4a8~HS-Ov_lO21472214722epcas5p3E;
	Fri, 31 Jul 2026 06:28:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hBGN63z7kz2SSKn; Fri, 31 Jul
	2026 06:28:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260731062805epcas5p284b192877ee85610e28157dba8593c14~HS-NOPIvb2967729677epcas5p2F;
	Fri, 31 Jul 2026 06:28:05 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260731062802epsmtip1ccfd7a2dcd6f7a7cc90e30e2c0431977~HS-KqhvVn0207602076epsmtip1W;
	Fri, 31 Jul 2026 06:28:02 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <peter.griffin@linaro.org>,
	<alim.akhtar@samsung.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <b2c668f3-addb-4c82-91c6-56651a601318@kernel.org>
Subject: RE: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
Date: Fri, 31 Jul 2026 11:58:01 +0530
Message-ID: <04ad01dd20b5$bea55aa0$3bf00fe0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygKrecYYAnZw0bcBYDpv3rXrUEDQ
Content-Language: en-us
X-CMS-MailID: 20260731062805epcas5p284b192877ee85610e28157dba8593c14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6@epcas5p2.samsung.com>
	<20260728121111.2077860-2-raghav.s@samsung.com>
	<b2c668f3-addb-4c82-91c6-56651a601318@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_232816_346715_8E9E93C3 
X-CRM114-Status: GOOD (  13.52  )
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
> Sent: Tuesday, July 28, 2026 5:29 PM
> To: raghav.s <raghav.s@samsung.com>; s.nawrocki@samsung.com;
> cw00.choi@samsung.com; peter.griffin@linaro.org;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> bmasney@redhat.com; robh@kernel.org; conor+dt@kernel.org
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; hajun.sung@samsung.com;
> is.gandhi@samsung.com; ts.amit@samsung.com;
> pokala.reddy@samsung.com
> Subject: Re: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
> 
> On 28/07/2026 14:10, raghav.s wrote:
> > From: Alim Akhtar <alim.akhtar@samsung.com>
> >
> > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > pll_531x except for CON8 offset, so re-using code for
> > pll_4313
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Signed-off-by: raghav.s <raghav.s@samsung.com>
> 
> Looks like name duplicates login.
> 
> Best regards,
> Krzysztof

Hi Krzysztof
Looks like this was an issue with my gitconfig, will fix this
Thanks for pointing out

Regards
Raghav


