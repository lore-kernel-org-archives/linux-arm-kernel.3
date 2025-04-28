Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1033FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/hDEvTARkekh8PU2IM8Bbc0ycSsnAaU7M9v86mcb9g=; b=1uGErcl1LpzIoFBqXx4Sl2U74e
	zCKDqEtqtMiUTGih/AmMPXID4tHm3gRqeFSDDJ1GiVP+Y/0OyTYgrY92Agv1RoEjb8WJ/JuYOHuQc
	Hz9HS9Dq9jW62idA8IBkwk3byHMS/VFmNlbCqGA8xOTACJEkboAsfvVU1fOCGwL+nTINPMcOfGSXR
	uy9CcnbsB1QBoHQCfiCv1zD2Y6h7/1G58mUagAVKDbx1yXCo+8OKPWUCOOhmEhPiNicsStSGvOnGA
	JUf9FQ8AOtUDdCEeKCjOwuNnaqc59o7T7/9rFy+Rmjwr8WGHhe5kwZYIPdqwd1hb6CEHwh1zRji2D
	s1mrBv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MA8-00000005rVD-08o0;
	Mon, 28 Apr 2025 10:56:36 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M1i-00000005q6M-2GW8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:47:56 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428104750epoutp02c2bf11c18759756fca1288722c92379a~6db9iq4uk2115521155epoutp023
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:47:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428104750epoutp02c2bf11c18759756fca1288722c92379a~6db9iq4uk2115521155epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745837270;
	bh=8/hDEvTARkekh8PU2IM8Bbc0ycSsnAaU7M9v86mcb9g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IkmTug4GWjDS0jquDtpySwCDmHQU9T77BLnYrn5D8s4arZiqsQY3Y6BEJHQiLrBh0
	 V6oqQxBlmvgqNtEdjw6P0UkvkdnpeK0yTARAcWjOzR41z2mCC+24jXjnIU0qkj1aYw
	 am1co3wuqJk9zeTnmfzyPCcQYK9ErVqo0N8+SR+o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428104749epcas2p33b751cc01acf6536b552f3033408d2f2~6db9Dodrm1471414714epcas2p3L;
	Mon, 28 Apr 2025 10:47:49 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.70]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZmKsd43pZz6B9m4; Mon, 28 Apr
	2025 10:47:49 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428104748epcas2p30878b575c575cf1643e18c5a3262bdf2~6db8BcP2V1471414714epcas2p3J;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428104748epsmtrp25e9dc72661f9d5c0aa2e9aa4a42d17a0~6db8AhQj_1596115961epsmtrp2U;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-6f-680f5cd49a7b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2C.2E.08766.4DC5F086; Mon, 28 Apr 2025 19:47:48 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428104748epsmtip266684e1bd6f04a2318d1a81135e35c24~6db7zResW1682516825epsmtip2B;
	Mon, 28 Apr 2025 10:47:48 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <a3438b8b-0fd2-454f-a539-39aa7cfcd57b@kernel.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl1/2 clock
 support
Date: Mon, 28 Apr 2025 19:47:48 +0900
Message-ID: <02d901dbb82a$fb7493a0$f25dbae0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJbASRnoWq0F4GjHT9tcwPYQHtTxAJlNrzkAk/ocBIDccya67J5G+NQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvO6VGP4Mg9cPNC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mt40
	TGEtaBasWL/nGmsD42S+LkZODgkBE4kJJzaydTFycQgJ7GaUaPuynAUiISFxeMYERghbWOJ+
	yxFWiKLnjBILf95kA0mwCRhKrPqxnQkkISIwkVni0ocLLCAOs8AmRolzu29CzX3PKHHpxn6w
	uZwCdhKL5qwEs4UFAiVadx9jBbFZBFQl7v85CmbzClhKPFnbxAZhC0qcnPkErJ5ZQFui92Er
	I4QtL7H97RxmiPsUJHZ/gugVEXCTeL1sJVS9iMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKK
	UTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4LrU0dzBuX/VB7xAjEwfjIUYJDmYlEd4q
	A/4MId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rziL3pThATSE0tSs1NTC1KLYLJMHJxSDUzRS2Uf
	Xkvny2mt6b25QHLRLvN9MUET3Y07hE4q53C94fsa1fX4v7fqQcfa6SunO+Tnx9+0Kbx7WC7R
	WWXdiaUJmY+Su1af9Ph/+mO9t+FCxxZ+z/kOXzzO7dR02lKzvTGzuunOl/vh4gcuzjqgWu60
	VCpI7FWFcO4u60fXEtP776hx81r/OPNYnWPj+q3KRxfFnBc22FgTcqHB5GZ1jcDK2M9Kj+KZ
	Z65LqLo4QcB6o/wB7+0tLocOl4Qf9S77UxnqzcylvCJ4xdnTP67tjvhqI2qfdf6leAyzn4rh
	yfUuS9Z9nN3Nezxi+o00/swrXgK6RzYFM3w6+btefzZLE091Qf2MSKFnRSos0+tLFymxFGck
	GmoxFxUnAgB3Cq3qOgMAAA==
X-CMS-MailID: 20250428104748epcas2p30878b575c575cf1643e18c5a3262bdf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb@epcas2p1.samsung.com>
	<20250428084721.3832664-3-shin.son@samsung.com>
	<a3438b8b-0fd2-454f-a539-39aa7cfcd57b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034755_212989_A86EB864 
X-CRM114-Status: GOOD (  25.96  )
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

Hello, Krzysztof Kozlowski.

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 6:15 PM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl1/2 clock
> support
> 
> On 28/04/2025 10:47, Shin Son wrote:
> > Register compatible and cmu_info data to support clock CPUCL1/2 (CPU
> > Cluster 1 and CPU Cluster 2), these provide clock for
> > CPUCL1/2_SWTICH/CLUSTER.
> >
> > These clocks are required early during boot for the CPUs, so they are
> > declared using CLK_OF_DECLARE instead of being registered through a
> > platform driver.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynosautov920.c | 208
> > ++++++++++++++++++++++-
> >  1 file changed, 207 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > b/drivers/clk/samsung/clk-exynosautov920.c
> > index 8021e0912e50..f8168eed4a66 100644
> > --- a/drivers/clk/samsung/clk-exynosautov920.c
> > +++ b/drivers/clk/samsung/clk-exynosautov920.c
> > @@ -18,7 +18,9 @@
> >
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
> > -#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
> > +#define CLKS_NR_CPUCL0			(CLK_DOUT_CPUCL0_NOCP + 1)
> 
> 
> You just added that line a week ago and it is already incorrect? Then it
> needs patch on its own explaining what are you fixing.
> 
> 
> Best regards,
> Krzysztof

Understood. I will separate the fix into its own patch and resend it.

Best regards,
Shin Son


