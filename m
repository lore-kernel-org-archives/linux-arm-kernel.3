Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B103BCA5FD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJTjhb+LT3DW9L50eBmFAh1TbPHorN/neuHBhCO7dDw=; b=1kbrKm1CiWEyCBpvId+FbayDku
	sB/sx9cBoqHpWo73dU1208HJMke/ntppK3xLPlCickJvQfYvxcyalMhoutkRr7I169aOA2tIedmmI
	K59E16B7hw022QtEHTKRkl5ALwdRWnsqRIEuXE3ToGVjwGsIkq/l//qVh7JcGCJUL8cwpShtFEZ/h
	LZtaJ+lDir7cyfOYMrQyK9m3XSIAvPhK/fEaYXUwNVEU/UWxrOSDeGpXgPu5SOFBadeuNZ2zHAl80
	74asG94IVAV/1Q6DEcZntKzhvUPCNlxNAiqQeRk5PNzAhB5PVkOUxVCHAOBTqQTPVl12vsGwMJVcQ
	WDZ/01ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuGH-0000000765q-05zk;
	Thu, 22 Jan 2026 12:58:09 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuGB-00000007655-3Tmi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:58:07 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260122125757epoutp035735a5d871b6c9866104bbbd0d4fb249~NDvXOyUQL1695016950epoutp03X
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 12:57:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260122125757epoutp035735a5d871b6c9866104bbbd0d4fb249~NDvXOyUQL1695016950epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086677;
	bh=HJTjhb+LT3DW9L50eBmFAh1TbPHorN/neuHBhCO7dDw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=IXaUfK148re5M9zeGZLL3qow8llSs14gfukM0TWelEPRN11o2LAwaXNQs8hs/kI7G
	 pUXyEe61Zi6/VpEo8RoneABmC3GRU2fMBWdePfpdkoYBfxA8Tcq88lGCDPeKF0EwCd
	 kEeHZG8jniJCAjKMRaPgoCA/qeavhVPDafj8nsMA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125757epcas5p4bc09f5a132e3fb2659feddf42bd0d791~NDvW2gFb11233712337epcas5p49;
	Thu, 22 Jan 2026 12:57:57 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dxh1c2nf0z2SSKX; Thu, 22 Jan
	2026 12:57:56 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122125755epcas5p4bb865a596b685d044c32f420dd705fb7~NDvVprkyU2134921349epcas5p4S;
	Thu, 22 Jan 2026 12:57:55 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260122125753epsmtip1292701b241f40cfe998c50d3fd6d7ebb~NDvTx4icF1131111311epsmtip1h;
	Thu, 22 Jan 2026 12:57:53 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <15119728-7a22-4e2c-8716-9b0c9def24ae@kernel.org>
Subject: RE: [PATCH 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 22 Jan 2026 18:27:49 +0530
Message-ID: <000a01dc8b9e$b82c0ae0$288420a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJC10xQ5cnsV5/dezQFmmCfFyZ4QgFqW1wVAUtqIAYBvejB87Rt8GNw
Content-Language: en-in
X-CMS-MailID: 20260122125755epcas5p4bb865a596b685d044c32f420dd705fb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
References: <CGME20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284@epcas5p4.samsung.com>
	<20251024114845.2395166-1-pritam.sutar@samsung.com>
	<000001dc8b8a$543269d0$fc973d70$@samsung.com>
	<15119728-7a22-4e2c-8716-9b0c9def24ae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_045805_575619_12162986 
X-CRM114-Status: GOOD (  22.28  )
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
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 22 January 2026 04:10 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com; faraz.ata=40samsung.co=
m;
> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH 0/3=5D Add and enable USB nodes for ExynosAutov920 =
SoC
>=20
> On 22/01/2026 11:31, Pritam Manohar Sutar wrote:
> > Hi All,
> >
> >> -----Original Message-----
> >> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Sent: 24 October 2025 05:19 PM
> >> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> >> alim.akhtar=40samsung.com
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com;
> >> pritam.sutar=40samsung.com
> >> Subject: =5BPATCH 0/3=5D Add and enable USB nodes for ExynosAutov920 S=
oC
> >>
> >> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
> >> controllers and amoung them, one is USB3.1 DRD combo phy and three
> >> USB2.0 phy controllers. This patchset adds and enables USB and
> >> USB-PHY nodes in dts.
> >>
> >> PMIC driver is not implmented yet, we rely on USB LDOs being enabled
> >> by the bootloader and used dummy regulators for now.
> >>
> >> To drive vbus for host mode, it needs GPIO pin to enable vbus regulato=
r.
> >> GPIO expander is present in the dts, we used it to enable the vbus
> >> regulator using GPIO.
> >>
> >> USB ports are configured as OTG, and default mode is configured as
> peripheral.
> >> These configurations might be changed based on requirements.
> >>
> >> This patchset has dependancy on schema and driver implementation=5B1=
=5D
> >> and role switch control from userspace=5B2=5D patches.
> >> =5B1=5D: https://lore.kernel.org/linux-phy/20251010070912.3758334-1-
> >> pritam.sutar=40samsung.com/
> >> =5B2=5D: https://lore.kernel.org/linux-usb/20251024085455.789555-1-
> >> pritam.sutar=40samsung.com/
>=20
> This wasn't even a dependency...
>=20
> >
> > Above dependent patches are merged, can you please review the patchset?
>=20
> I closed my tree few days ago, so next cycle, but please resend, because =
this is
> three months old now. I dropped it from my queue long time ago.

Noted and resent same patch series as v2 patchset.=20
Link for v2: https://lore.kernel.org/linux-devicetree/20260122130721.205664=
-1-pritam.sutar=40samsung.com/

>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


