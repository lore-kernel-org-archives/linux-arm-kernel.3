Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9B8CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTG7qchiHqeqMFWuTMOT+gd1Ea0jVcixNMJtGw+oY0A=; b=GgPNP4AwabqSzepIcSyhCuaIJE
	H2tAdPph1wRYLsRqCHO/4KtQoNuA8QN1MyTG5NqpaKiIveYJZ7jOU0ixQIuC5K/KqxaSzh7gRzabY
	7Gh3e5M1hyjFJzmo9ydYxwLnhfMzGcIGDEZqGbfTfz2aJ1s3j/aBkXznAqXdqQXPW153p9mERUtj1
	K0xYfQkvBEC92OHoAG75e5OoJn7ybwYjOHsHUmDYKEaj0LGuZcJ8Gz1Ng7j7QUhyVHpgWN7XoEm3U
	hyYKUbDG2mtkohAL0yaNamtuueftOnVGLn+V6r654bXbqLB0lAdKLTpjPUT7N0MVJx/tA4pcA7gpf
	xIn9QxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnb-0000000Cu3d-26rn;
	Thu, 04 Sep 2025 16:27:00 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9oZ-0000000Bopx-2XDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:15:49 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250904131539epoutp019f7336fe5ac66e3d4a0f7f26380aa7e8~iFq2qwm871793917939epoutp01K
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 13:15:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250904131539epoutp019f7336fe5ac66e3d4a0f7f26380aa7e8~iFq2qwm871793917939epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756991739;
	bh=JTG7qchiHqeqMFWuTMOT+gd1Ea0jVcixNMJtGw+oY0A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BLMQ8FSbfQ91l7vyXTL8w/v8fv8SAMr/Fsk8SGsXM5eXT1Qu0An22RULOcd6X6wtn
	 vj/o0YobavLKg6ak5iJY6tpJg7WtmGVKBjCUU/EhwxX1sM2at6e161ds3oJxC9s5V4
	 DThVud16RTY5uyQOVuDaAZdTO8+I/8Zg9f36c0Wg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250904131538epcas5p486a8856f505d224a648a60508c13ab7e~iFq15YM1e0207602076epcas5p4q;
	Thu,  4 Sep 2025 13:15:38 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cHg2d6Nydz6B9m4; Thu,  4 Sep
	2025 13:15:37 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250904131537epcas5p4118d6ba9cee9c0ed472b423c33f12023~iFq0MP_KJ0207602076epcas5p4o;
	Thu,  4 Sep 2025 13:15:37 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250904131535epsmtip2d279d32747258521bfc1fb18051f45d3~iFqybtU1v0228702287epsmtip2I;
	Thu,  4 Sep 2025 13:15:35 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <andi.shyti@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: <5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org>
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu, 4 Sep 2025 18:45:08 +0530
Message-ID: <08cd01dc1d9e$00d416d0$027c4470$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GAuUAJa2xsTgNkA==
Content-Language: en-us
X-CMS-MailID: 20250904131537epcas5p4118d6ba9cee9c0ed472b423c33f12023
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com>
	<5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_061548_164689_6FF3550C 
X-CRM114-Status: GOOD (  15.05  )
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

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, September 4, 2025 1:35 PM
> To: Faraz Ata <faraz.ata@samsung.com>; andi.shyti@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com
> Cc: linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; rosa.pila@samsung.com;
> pritam.sutar@samsung.com; dev.tailor@samsung.com
> Subject: Re: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
> compatible
> 
> On 04/09/2025 09:28, Faraz Ata wrote:
> > Add "samsung,exynosautov920-hsi2c" dedicated compatible for HSI2C
> > found in ExynosAutov920 SoC.
> >
> > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > ---
> 
> Where is any user of it? I looked on lore and found nothing.
> 
I will send dt patch shortly.

> Best regards,
> Krzysztof


