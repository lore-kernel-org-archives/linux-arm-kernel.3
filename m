Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A2FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 05:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRQ6VYbR+TQAl593qF3BM3VZfrCtT4hvJ2iIj2q2yDU=; b=pv4Aw7wRGIJNVDbd8qHL12b++O
	ojCoZlZzC/SBaUk96UnCUp695MhonN9blknO/LXSlFfdoxusf8bY1T0KU6oKYDpBQk0K54DGJCnEv
	w8/oc4g20PEYyLQApp+S6gRcRYN9Sqs2RvW8eFCFtQnQXWSARFljVexHMNToqTHk4PcTrwyI7gdJH
	CBy+rin/FJ7d1q38EXHZK5/JaKAwjt8g8VJHThnwQnO2tL8cDAQU5g0qolYrr/0bYSv4zQhAXkq73
	xvbTPWpSyQjz+9BzZcpouIiE6GjoHZtv7biTqPcDJeSSbQIt5RZD3JSt+CbsYkA0nywEU00ZON+yF
	hZ31tdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Z50-00000008ro1-1mSL;
	Mon, 22 Sep 2025 05:27:14 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Z4v-00000008rmz-41jn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 05:27:13 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250922052702epoutp04a95e270817286210ba30f6e0cff98541~ng41bD5uH0754507545epoutp04H
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 05:27:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250922052702epoutp04a95e270817286210ba30f6e0cff98541~ng41bD5uH0754507545epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758518822;
	bh=pRQ6VYbR+TQAl593qF3BM3VZfrCtT4hvJ2iIj2q2yDU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aCUYp4DjFdiTIF0q8RsM0LWfcvQMzwD40f0EMVU1gQqBJdv4oSshWByhIdy+vWqd/
	 hln+tqDppQVZ6jzJtSCixGbc2JKT0zokD6hjtFuOZI5Az1bNnlpTcLAaNKnNTt7igs
	 zEh1jzsfzxBwyZTF43UprNuatfQkhXFui7eD7uiU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250922052701epcas5p10f94621bc5eaecb962b856c07434d0cb~ng40Tk9CU0734307343epcas5p1d;
	Mon, 22 Sep 2025 05:27:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cVWnc2r61z6B9mC; Mon, 22 Sep
	2025 05:27:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250922052659epcas5p135d8f9832a768030fc87b2e412fdbbc7~ng4y0apWs2794327943epcas5p1_;
	Mon, 22 Sep 2025 05:26:59 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250922052653epsmtip16c0b78c7e54941680c78cef5ec4caaf1~ng4s6V2_y2099220992epsmtip1H;
	Mon, 22 Sep 2025 05:26:53 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Mon, 22 Sep 2025 10:56:50 +0530
Message-ID: <007f01dc2b81$84ef19b0$8ecd4d10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDcA7fJUJgHIrfZJAofpNyCz6rDlMA==
Content-Language: en-in
X-CMS-MailID: 20250922052659epcas5p135d8f9832a768030fc87b2e412fdbbc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
	<0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
	<007801dc2893$18ed4a20$4ac7de60$@samsung.com>
	<02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_222711_449663_0867811B 
X-CRM114-Status: GOOD (  19.51  )
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
> Sent: 19 September 2025 05:59 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 18/09/2025 20:55, Pritam Manohar Sutar wrote:
> >
> > Yes, we have already discussed this and convergence was to use the
> > conventions which are mentioned in the Data-book. So, I updated the
> > supply names accordingly.
> >
> > Please see the below communications for the same.
> >
> > https://lore.kernel.org/linux-phy/83dc9435-5850-425d-b345-52e84ef9262c
> > =40kernel.org/
> > https://lore.kernel.org/linux-phy/6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef
> > =40kernel.org/
> Ah, ok, although next time I might ask the same, since commit msg does no=
t
> explain that.

Ok, will update commit message.=20
Please confirm the commit message if I updated it as below. =20

=22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy compat=
ible

Document support for the USB20 phy found on the ExynosAutov920 SoC. The
USB20 phy is functionally identical to that on the Exynos850 SoC, so no
driver changes are needed to support this phy. However, add a dedicated
compatible string for USB20 phy found in this SoC.

This phy needs 0.75v, 0.18v and 3.3v supplies for its internal=20
functionally. Power Supply's names are as per phy's User Data-Book.
These names, (dvdd, vdd18 and vdd33), are considered  for 0.75v, 1.8v=20
and 3.3v respectively. =20
=22

>=20
> I still cannot find constraints for the rest of properties, though.

Sorry I didn't get it completely. Can you please elaborate on the same?=20

Let me know if you want me to update the commit message=20
and send v9? And retain your RB on patch1 and patch3?

> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


