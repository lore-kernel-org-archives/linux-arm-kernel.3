Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFA1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6ztsUA+eAokShdcpCUOewiM9eddy9endAMo3wt7Qqo=; b=w5mcCafU53nVBHJQdaSnvHyiaV
	7Wz9nPqJqPPCdDei+64MaLo/6IwFoUfQlE2WmKC1/xtpntc8srv0cyzkCG0NknTPZLGRPsNfs/CHB
	mLkyScPyk/NihvhhYASGOP1urajcXwlrN/1im3wJN3pNUhRcyX+n/WatWJiUtCHM+FDX9aldGClWw
	mKmvs2ojORZu8WjOT288q80uYywWPqVS0a5eZ1r5m0Wbsh0V+vQWtAy8WOiUCJm/xQgZQxmDsYtk8
	Dvo5pUN7+dH++4XeJrB0KO3exPmmQ2EB4cjh23Lqxfl4kGjEldB7PK3Es1r5ylpeP+hhexa/G9+yS
	fqYJapkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OVl-00000008vrS-0KiR;
	Wed, 23 Apr 2025 01:02:49 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OSf-00000008vSN-3Ulf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 00:59:40 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250423005925epoutp018f4e13b5a00bebe673ea46681584a655~4zLyK1pZp1417614176epoutp01c
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:59:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250423005925epoutp018f4e13b5a00bebe673ea46681584a655~4zLyK1pZp1417614176epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745369965;
	bh=V6ztsUA+eAokShdcpCUOewiM9eddy9endAMo3wt7Qqo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qXVxu9fjxOJfg6GrOgKCGfC1LVs2wpesQZ746HTo1+xllJAGwu9k+Uv4yNz/3jBRy
	 wStYpMVkETR3zRoJ+2qGcBpmFpzCm3IYQ/5KRpfRl1PZV+mY5IlBkeHmpSgQajR41q
	 Kpmm4oKzyanOulDfPNEuyHxh37ScBxe5SoqvC/U4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250423005925epcas2p1007d645e84480bc60750f8824e524dbf~4zLxk0CVr1610216102epcas2p14;
	Wed, 23 Apr 2025 00:59:25 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.70]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj13056mhz6B9m6; Wed, 23 Apr
	2025 00:59:24 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250423005923epcas2p4edb8b1de0f83043a1c78ec638a30fb9d~4zLwcXtXG0929009290epcas2p4p;
	Wed, 23 Apr 2025 00:59:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423005923epsmtrp2b9d4b73722e715865a8dd7c432bef4e4~4zLwaxtL60362803628epsmtrp2x;
	Wed, 23 Apr 2025 00:59:23 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-d7-68083b6b0a9d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7B.1D.08805.B6B38086; Wed, 23 Apr 2025 09:59:23 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250423005923epsmtip1237a991dc36e4fd2bd9798c4d4302602~4zLwK_7F80987709877epsmtip1K;
	Wed, 23 Apr 2025 00:59:23 +0000 (GMT)
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
In-Reply-To: <6de6030a-af26-4fda-8d49-fa8ac65a672f@kernel.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl0 clock
 support
Date: Wed, 23 Apr 2025 09:59:23 +0900
Message-ID: <003701dbb3ea$f42360c0$dc6a2240$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGPEGrsijGqefHqKZlvX6MGGm+h1AGZ4wO8AVHQIBQCbFZfi7Qe8T3w
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSnG62NUeGwY4NhhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGQve
	/WYpuMhVcfX7beYGxg8cXYycHBICJhKTDvxh6WLk4hAS2M0oMfvaJmaIhITE4RkTGCFsYYn7
	LUdYIYqeM0ps7ZzHApJgEzCUWPVjOxNIQkRgIrPEpQ8XwEYxC2xilDi3+yYbSJWQwHtGiSsT
	qkBsTgE7iUP3f7OD2MIC/hKtdxeArWMRUJXYtPcT0AoODl4BS4klawVBwrwCghInZz4BW8Ys
	oC3R+7CVEcZetvA11KUKErs/HWUFsUUE3CTmzOljh6gRkZjd2cY8gVF4FpJRs5CMmoVk1Cwk
	LQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgTHpJbWDsY9qz7oHWJk4mA8xCjB
	wawkwvvLjT1DiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkmDk6p
	BiZrrmkxS2b8Sn3/wa+7js8g7/bZNXMLXPamHVptZsi3VjDyhGFX5EIvA+vJ9c8L35uVS38u
	V3G79qbh8kbXzpzt3ApZu/7s+K2kV3Dpg8DlEyF3TorFWBxbW1in/VBk2rnH9/4opfyZflpg
	d4nU0Ysfwv2VjWXN7MWsgvucZq/8VPTgWG+vh/uKG4ovl/k/8Z/HtmpWr/T3X87TFb5nqu1K
	yn4bc3q/hqm9fsa2ssn69w/KXNK98k484c+92193nNgdOfPQ3k9VDArX1eau9nZLm8Gf2Bhc
	v3O/bcTkpU1u14v5jyRsc162/a26Q3Ufz5mQk3qMsqw+DfP7ju46IvTs9ipRDuXDD3I+lU88
	6dCixFKckWioxVxUnAgAStCikjgDAAA=
X-CMS-MailID: 20250423005923epcas2p4edb8b1de0f83043a1c78ec638a30fb9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f@epcas2p1.samsung.com>
	<20250418061500.1629200-3-shin.son@samsung.com>
	<6de6030a-af26-4fda-8d49-fa8ac65a672f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_175938_498485_4F9DDF97 
X-CRM114-Status: GOOD (  19.35  )
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

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: Tuesday, April 22, 2025 4:59 PM
> To: Shin Son <shin.son=40samsung.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Alim
> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob Herri=
ng
> <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Sunyeal Hong
> <sunyeal.hong=40samsung.com>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/3=5D clk: samsung: exynosautov920: add cpucl0 clo=
ck
> support
>=20
> On 18/04/2025 08:14, Shin Son wrote:
> > Register compatible and cmu_info data to support clock CMU_CPUCL0,
> > this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
> >
>=20
> Explain why this is needed as clk of declare, instead of platform driver.
>=20
>=20
>=20
> Best regards,
> Krzysztof

CPUCL0 refers CPU Cluster 0.
Since the CPU clocks need to be available as early as possible, I used CLK_=
OF_DECLARE instead of a platform driver.

I'll update the commit message and add a comment in the code to clarify thi=
s.

Best regards,
Shin Son


