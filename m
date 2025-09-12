Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B09CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 05:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBl1cCA3xHTcpiIdbq4ZV4glfFTpYxnU35Smjtoz8C4=; b=LScTYMqCP9hQkgDaQpa32gQxYu
	3e5gN1TBPLEeO9wJe+Ml3w5wgvAF5m9TUcYkpPgx3LBcdj4+0EugcfbA3GayamBSFLr+WOeT0nGQA
	bEnCDfNh39VD4AALPAo7GaX+kRYBeyFX1JZIsFM489fXCmbHYfGolOdQ16DyqUGy7xNSvSmMW+7Cv
	Nya3kFZAb8negkX4GzB3uVZ73vZvgyyvIyWhNqgDMwwofAYYVoS1j+qnMBORNMn1gQrEH8uBVLdZJ
	fbScp2maeHbvXyMezaDU9Y3bPpClp50x63emDYaopoxB38c6ZONQFeoQVKsCQMIA5hF3o26Xr1Ul+
	uClnFnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwCm-000000078ua-1XZQ;
	Fri, 12 Sep 2025 05:20:16 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwCj-000000078tL-0Jlh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 05:20:15 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250912052002epoutp04cad5ba780327923bd2e473b772e47d9c~kcV29hukW2162521625epoutp04J
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 05:20:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250912052002epoutp04cad5ba780327923bd2e473b772e47d9c~kcV29hukW2162521625epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757654402;
	bh=SBl1cCA3xHTcpiIdbq4ZV4glfFTpYxnU35Smjtoz8C4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oc7Hunzf6UFQCt4xaZ7hYqWXb32NZXpcnP/b02Dj0YpjMWc/CB/hhH2gxTENBqJFY
	 FeqCfKDr6nKG9IzWUnaPkI+9LNLnIIEPyif2sNeXTCX6ANJGDEcJixFtWq4FV5/awf
	 uzBwcSAe2cPf3+k9N4R0ST4RWcJaWrLFA9eeMYJE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250912052001epcas5p245dd958eda4e47543eca23ea52c48340~kcV2IUOzm0647606476epcas5p2d;
	Fri, 12 Sep 2025 05:20:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cNN6825DYz6B9m6; Fri, 12 Sep
	2025 05:20:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250912051959epcas5p17511cbcad9f9a50495677bc3bf44b8e2~kcV0tAR4b0582905829epcas5p1M;
	Fri, 12 Sep 2025 05:19:59 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250912051955epsmtip25fe3af81aa42f9f80904ec2a9c2d8bda~kcVxFhMUc0678906789epsmtip2S;
	Fri, 12 Sep 2025 05:19:55 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Geert Uytterhoeven'"
	<geert@linux-m68k.org>
Cc: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jesper.nilsson@axis.com>,
	<lars.persson@axis.com>, <alim.akhtar@samsung.com>, <arnd@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <geert+renesas@glider.be>,
	<thierry.bultel.yh@bp.renesas.com>, <dianders@chromium.org>,
	<robert.marko@sartura.hr>, <schnelle@linux.ibm.com>, <kkartik@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<ksk4725@coasia.com>, <kenkim@coasia.com>, <smn1196@coasia.com>,
	<pjsin865@coasia.com>, <shradha.t@samsung.com>
In-Reply-To: <abfaef6f-dd40-441d-86ec-7cd37c1e06b5@kernel.org>
Subject: RE: [PATCH 3/3] tty: serial: samsung: Remove unused artpec-8
 specific code
Date: Fri, 12 Sep 2025 10:49:54 +0530
Message-ID: <002201dc23a4$e27e29c0$a77a7d40$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJu8uqH6fYxQzG+hnF7rWV1C9oliQHCvJCeAevVl18Bulx3hgI90RbxAdnEKbQB9/8vTwGziL2EswACVSA=
Content-Language: en-in
X-CMS-MailID: 20250912051959epcas5p17511cbcad9f9a50495677bc3bf44b8e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50
References: <CGME20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50@epcas5p2.samsung.com>
	<20250911141605.13034-1-ravi.patel@samsung.com>
	<20250911141605.13034-4-ravi.patel@samsung.com>
	<CAMuHMdVe-FULHWk3QCBENG7TsbEZyxj0N5shhESxWBWd49JmOw@mail.gmail.com>
	<6df0e227-896b-438a-913e-95b637aa2b14@kernel.org>
	<8aeda67e-404e-4deb-ac90-015f2325ef64@kernel.org>
	<000101dc2335$ccd62f60$66828e20$@samsung.com>
	<abfaef6f-dd40-441d-86ec-7cd37c1e06b5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_222013_743625_0B1E0BE4 
X-CRM114-Status: GOOD (  23.42  )
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
> Sent: 11 September 2025 22:52
> To: Ravi Patel <ravi.patel@samsung.com>; 'Geert Uytterhoeven' <geert@linux-m68k.org>
> Cc: gregkh@linuxfoundation.org; jirislaby@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> jesper.nilsson@axis.com; lars.persson@axis.com; alim.akhtar@samsung.com; arnd@kernel.org; andriy.shevchenko@linux.intel.com;
> geert+renesas@glider.be; thierry.bultel.yh@bp.renesas.com; dianders@chromium.org; robert.marko@sartura.hr; schnelle@linux.ibm.com;
> kkartik@nvidia.com; linux-kernel@vger.kernel.org; linux-serial@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-arm-kernel@axis.com; ksk4725@coasia.com; kenkim@coasia.com;
> smn1196@coasia.com; pjsin865@coasia.com; shradha.t@samsung.com
> Subject: Re: [PATCH 3/3] tty: serial: samsung: Remove unused artpec-8 specific code
> 
> On 11/09/2025 18:04, Ravi Patel wrote:
> >>>>> -OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
> >>>>> -                       s5pv210_early_console_setup);
> >>>>>
> >>>>>  static int __init gs101_early_console_setup(struct earlycon_device *device,
> >>>>>                                             const char *opt)
> >>>>
> >>>> Removing these breaks backwards-compatibility with existing DTBs,
> >>>> which lack the new "samsung,exynos8895-uart" fallback compatible value.
> >>>
> >>> This was just applied, so ABI break would be fine. It should be however
> >>> clearly expressed in the commit msg.
> >>>
> >>> I have a feeling that not much testing was happening in Samsung around
> >>> this patchset and only now - after I applied it - some things happen.
> >>> But it is damn too late, my tree is already closed which means this is
> >>> going to be the ABI.
> >>
> >> Ah, no, I mixed up patches with recent DTS for Artpec-8. This serial ABI
> >> was accepted three years ago (!!!), so you are Geert absolutely right -
> >> that's ABI break.
> >
> > Thank you for your review.
> >
> > The DTS patches for ARTPEC-8 is added recently (https://lore.kernel.org/linux-samsung-soc/20250901051926.59970-1-
> ravi.patel@samsung.com/)
> > Before that, there was no user (in DT) of "axis,artpec8-uart" compatible.
> > So I am not convinced of ABI break (considering patch #1 and #2 goes first with review comment fixes)
> 
> 
> ABI is defined by bindings and implemented by kernel. Having DTS user is
> irrelevant to fact whether ABI is or is not broken.
> 
> Having DTS user determines the known impact of known ABI breakage.

OK. So does that mean if someone adds the ABI then it cannot be reverted,
because of it breaks backword compatibility (users are using ABI in their local DTB) ?

Please suggest what should be the proper way.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof


