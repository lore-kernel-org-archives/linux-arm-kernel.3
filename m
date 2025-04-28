Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Per/s3GLdQBrXVmnb/0ApsgYI11Thl7c7vR99d1KZKM=; b=R9wR2x1Bqrssin94TtAzqL5HO3
	Ek7ZCsentwZFKHvAvFyHu5aLQIPHmMDyZfKZbw7utOHwOQM32GQO8CljAeC1Em+TQW97XXjaTyTkF
	cVYNtif+FC+MtJfrCQibJsBlr+WJSv8jzBRHF+mkn3zx/kfskqxmGbLJtcTt6Cx5wnU0uU/ZlYWeH
	qCuupUaLkTF7SmvSy/1zavQ/BoVEAEZ/05dq6jXtsSRoLKYsipARhgR/GNCc/IaANE3zwtJqeaZa0
	FwEJ0BPHXx8KDmMT0x8ATf+DYpQ4YrNpykpiQbETbL7myKJS5ZZ+815rONwe75dOERw/AD0R3ixBv
	OMFq+ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LxQ-00000005pLb-1pJD;
	Mon, 28 Apr 2025 10:43:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LvS-00000005p7b-38En
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:41:28 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428104122epoutp0453880bc0a9b5d4872256ee13a638e87b~6dWUXFu_Q0469104691epoutp04d
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:41:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428104122epoutp0453880bc0a9b5d4872256ee13a638e87b~6dWUXFu_Q0469104691epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745836882;
	bh=Per/s3GLdQBrXVmnb/0ApsgYI11Thl7c7vR99d1KZKM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Y/c59yuTJakOag9K+40eNUz9PH9sRJFBfm1xoAnH5Ls30XiqEkSF4MvAAGXm+2lQJ
	 ocAabOUQHDPLuUC+6gDNw67JksZX1Z56wHNjn+R0yAhQp4+z1Ft4A4VrdiLtfWRe/u
	 ScTpn5K7laGU1e56j7poE5ljdEr8Hx0Xi0e9/ztE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428104121epcas2p2664c11c25322a64c834805e7b64726d4~6dWTzEM-40152201522epcas2p24;
	Mon, 28 Apr 2025 10:41:21 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZmKk94plkz2SSKd; Mon, 28 Apr
	2025 10:41:21 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250428104120epcas2p2678b32dcf4967de037b092d61a98b78b~6dWSyFRJd0152201522epcas2p23;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428104120epsmtrp2387a91d294cc6c3c812a787510e16d16~6dWSxKUGB1266612666epsmtrp2c;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-3a-680f5b50f7f8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BA.9D.08766.05B5F086; Mon, 28 Apr 2025 19:41:20 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428104120epsmtip2a4b3dd0caed8045c506ad944f0e99973~6dWSkeRA_1158811588epsmtip28;
	Mon, 28 Apr 2025 10:41:20 +0000 (GMT)
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
In-Reply-To: <cc76fdc3-761f-4171-aec4-02f5e6013cb8@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2
 clock definitions
Date: Mon, 28 Apr 2025 19:41:20 +0900
Message-ID: <02d401dbb82a$14449de0$3ccdd9a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJbASRnoWq0F4GjHT9tcwPYQHtTxAF8kF2mAeFCTbUCVbay3LKMpwCw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvG5ANH+GwYJ2I4sH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujOZ7
	85kL1ghUnDm3mqmB8QBPFyMnh4SAicS21U+Zuxi5OIQEdjNKbF//hgkiISFxeMYERghbWOJ+
	yxFWiKLnjBILFv4HK2ITMJRY9WM7E0hCRGAis8SlDxdYQBxmgU2MEud232SDaHnPKPF1HUiG
	k4NTwE5iw9KPYO3CAtESU77fAIuzCKhKfDsxmxXE5hWwlPh9aBILhC0ocXLmEzCbWUBbovdh
	KyOELS+x/e0cZoj7FCR2fzoK1isi4CYx6+V9JogaEYnZnW3MExiFZyEZNQvJqFlIRs1C0rKA
	kWUVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwXGpp7mDcvuqD3iFGJg7GQ4wSHMxK
	IrxVBvwZQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZODilGpgS
	um90xa2a5twz31bQ5ZiSysIZVvtswo+eDV1rqn2jcAafwJZGnRrVy+8O2vetnvpdKO/LnutZ
	CV55h/t+lc8RXFReNb8r4pmKVPaElyb6mzgPMJYZFpu1ie9+kv+jd7P8xhs3b93ftWjxVIHy
	v8mdzwouZz6Z8Nnlbe9XI9FrxYvT4p56ragN+X6xT/FI+72clac/WVWIVYatTsx42Rm0/9qH
	b0uK16/eY71jvQ6T9/z5Nqv9Xs3+UXC8sKfwcEK30HFlX1EHrlmr5O0+rlO55/Hhztwbet8u
	W6WW13LE9gZOVq3fOOtz+8GQlxscnypd+uirdKkxbyGbu4BE9OvAuLU3u85NmnnP/FHg6u8T
	lFiKMxINtZiLihMBlBwKVzoDAAA=
X-CMS-MailID: 20250428104120epcas2p2678b32dcf4967de037b092d61a98b78b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4@epcas2p3.samsung.com>
	<20250428084721.3832664-2-shin.son@samsung.com>
	<cc76fdc3-761f-4171-aec4-02f5e6013cb8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034127_099950_CDBD3AA6 
X-CRM114-Status: GOOD (  20.60  )
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
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 6:13 PM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2
> clock definitions
> 
> On 28/04/2025 10:47, Shin Son wrote:
> > Add cpucl1 and cpucl2 clock definitions.
> >
> > CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2, which provide clock
> > support for the CPUs on Exynosauto V920 SoC.
> 
> You should have sent all cpcl0-2 together, so we see complete picture.
> 
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   | 45 +++++++++++++++++++
> >  .../clock/samsung,exynosautov920.h            | 32 +++++++++++++
> >  2 files changed, 77 insertions(+)
> >
> 
> 
> ...
> 
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_CPUCL2 SWITCH clock (from CMU_TOP)
> > +            - description: CMU_CPUCL2 CLUSTER clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: switch
> > +            - const: cluster
> > +
> > +
> Just one blank line.
> 
> Best regards,
> Krzysztof

Thanks for the feedback.
I will group related patches together next time for a more complete view.
I will also remove the extra blank line and resend the patch.

Best regards,
Shin Son


