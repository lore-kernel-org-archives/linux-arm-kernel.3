Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5VLAojzpnIxDBE6zPAULs5TyBvsQa4MKoJmkjGV5zA=; b=TIqqCa7GeETbJsD0x7m10PWqKk
	UAN349tuYmWvqv5ZSY3pDokmwDkPGsSFX+tuTdDvLz2olw7hzIOVWJ6gAmCHMMyeuqyfQmYZKEmpT
	WTXQd7H8m9HeIF1NypM+4Z/nrCYNNQCIqKHwjrXK6QhWc2VCPq7H30h8+veLXwmdRaqizHTCqopxi
	UJtTWtU2ZR10UXAyfAVMEwym0ZBTKWX2zZuyXZ9LVd/R05JBImL2ih9WhkPaISR0sPvymh2q7irfM
	EWb+JNXn4ItMDIgf3UZGzyIN6c1tG1iVbtUbSfy9zvRcz0uLCJ+5fIV984dPUC9AaOXX0xX84L33a
	xIf4dTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV7R-00000000CWc-34YU;
	Thu, 15 May 2025 09:43:13 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUwL-00000000APw-314L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:31:47 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250515093143epoutp03b70a737f2088d5bea573c42b320b2209~-qXXGxugo2591225912epoutp03p
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 09:31:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250515093143epoutp03b70a737f2088d5bea573c42b320b2209~-qXXGxugo2591225912epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747301503;
	bh=P5VLAojzpnIxDBE6zPAULs5TyBvsQa4MKoJmkjGV5zA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bLTfuhwUoi/ZOLE1iXg+ioM4p54mZsCMui4ElYk/ZqXxGrIR6KbgqLLl2whkcHo7A
	 E8qrxu7SmfAVCZ6Ha+lEnud404Fk4TPK3QGdQQDa+w+aCYQjA8yAoREeppZ54DEHFk
	 hChpcvRxgG+pWvvDL6AkdAaODuWtaDqmYcPH0Jks=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250515093143epcas5p2409f7bc212f1f6c8fbe25b72f73f6208~-qXWuzwPM1138511385epcas5p2Q;
	Thu, 15 May 2025 09:31:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.177]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZylMx0zR3z3hhT8; Thu, 15 May
	2025 09:31:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250515093140epcas5p1c735205578916f52954430b1db18f5e2~-qXUKreQ80539905399epcas5p18;
	Thu, 15 May 2025 09:31:40 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515093140epsmtrp2e3c56fd7433b4343ddad05abbccc6505~-qXUJ1cDK2264422644epsmtrp2G;
	Thu, 15 May 2025 09:31:40 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-78-6825b47c083d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.34.19478.C74B5286; Thu, 15 May 2025 18:31:40 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250515093138epsmtip21ebcf2ce07b9046da78413250900fa0d~-qXR--lqR0096500965epsmtip2y;
	Thu, 15 May 2025 09:31:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>,
	<gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250514140741.415981-2-pritam.sutar@samsung.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 dt-schema ExynosAutov920
Date: Thu, 15 May 2025 15:01:37 +0530
Message-ID: <0efe01dbc57c$29955270$7cbff750$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHb4atmIwpdDAkGWt442tTNHGskkAKMImHcAsHMHkuzqMU0AA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWy7bCSvG7NFtUMg9V9shZr9p5jsri3Yxm7
	xfwj51gtrt1YyG7RvHg9m8XLWffYLDY9vsZqcXnXHDaLGef3MVksWtbKbHH+RRerxbN7K9gs
	/u/ZwW7x5ecDZosjyz8yWaxacIDdQcBj06pONo/9c9ewe2xeUu/Rt2UVo8eW/Z8ZPT5vkgtg
	i+KySUnNySxLLdK3S+DKOP5Zu2ASe0XDqj7mBsZFbF2MnBwSAiYSOyf/Zu9i5OIQEtjOKLF8
	0nlGiIS0xPWNE9ghbGGJlf+eQxU9Z5R4cucpWBGbgK7EjsVtbCAJEYE9jBIdCx8ygjjMAvuZ
	JKb9XsYE0XKYUeLO5vssIC2cAvYSP66dAlsuLBAj0XJuOhOIzSKgKjG56STYWF4BS4mFR9vY
	IGxBiZMzn4D1MgtoS/Q+bGWEsOUltr+dwwxxn4LEz6fLWEFsEQEniTP7+lkhasQlXh49wj6B
	UXgWklGzkIyahWTULCQtCxhZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIER6tW0A7GZev/
	6h1iZOJgPMQowcGsJMJ7PUs5Q4g3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZq
	akFqEUyWiYNTqoFpcS+zi/KnTk1PAY77wq97osJz5NcvFWjKapWe4TQleLXWlt4ZnD1iKx1c
	+zZyzenZJ7I8JDpr+mXb2PVJT88//PW7dpe5xH7fxXEmGY0BCQLnTGL13q/+XrDw4LWvq1UF
	Fyd6rdv5af11iwupa0Nnz5hjevjYlYgTmw7MYZ3+SfDBjL2O/7WPHCo4NP2NcMeeX35bgzP3
	li7I5hdOXWppOe9c949G9y8fr1hXuluUSdlGNUWkNP97N2211Y7YFx+XLn6/bsnLUma7gxIy
	28O+V66Yyv+xx7p4RkdUTtF935x1ezvcHDszzfgntf7k+jLnE/MchZjT+/ffsfkd+ulwmrUc
	6/lVziZu+x+9OL/9lhJLcUaioRZzUXEiAPTyNRRFAwAA
X-CMS-MailID: 20250515093140epcas5p1c735205578916f52954430b1db18f5e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d@epcas5p4.samsung.com>
	<20250514140741.415981-2-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_023146_075523_14D00CEF 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, May 14, 2025 7:38 PM
> To: pritam.sutar@samsung.com; gregkh@linuxfoundation.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; Thinh.Nguyen@synopsys.com
> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add dt-
> schema ExynosAutov920
> 
> Add a dedicated compatible for USB controller found in this SoC
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


