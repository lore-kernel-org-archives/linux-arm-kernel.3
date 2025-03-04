Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 03:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUnqr75OoCvUiSRApxk6t53XmWVcdinIUHGuIV/vlgc=; b=sokUbOwl5VDD3uhI7eW17aW3zN
	dXV2YS/VYFZD1yBo/J76dlJsuf7EuZJm7j4JrXesUULe70XSkwPQDpFwEFYRULwjPayDT8GybQuLw
	utHJ7OR1AYX5oIxbw8DvggQ2TQQbHC6WkHFynqxdWPFg+Dj2UbzZuv4s+cooQNC1H/n4BFrsySNHj
	11Ocouh3HnmZKr8CpSH/GNy9ZshFQzzfrYf1/DBuEl+WcPkRfpec+q1626uu+QWDKOOlilbR2xXEU
	rzFHw0JhIqcyz8SELiSVfbFitzRhxPnykfavtOr/pBfiO9XfE8r3nKtUAT9DVHy8ExGlyxBQczeee
	UrVCE6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfKF-00000006sdh-3moA;
	Wed, 05 Mar 2025 03:21:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfFm-00000006sGG-2l3Z
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=References:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yUnqr75OoCvUiSRApxk6t53XmWVcdinIUHGuIV/vlgc=; b=IzUJmAqKBHltzSwFfTbEMGanTG
	eJMZAmdk5vSvYssHay5ll64LqpRlcRopowD57GAHdSvtOMW6ltSgLJXDznINLpfBPcieG8aSAQqCj
	tptomC9cXzgL+LzzjHPBloNklXPjEW9sE/04HW/jYXqQ0t2aJANlvBykCg0T/KyklOUqPHOesJjrA
	UNEZGddMPKixS3/Uc7QvdBtp5nC4GUOOrdv15fN7JNlfIPhUSkZPaHgs5auFF/nWkWxY7eb3v+A2p
	hi9DL7ofT9mL9Xrcd35n3ikIoXfcIzCqPXTbQe1MAe/1mV5hu1eWvJIF2voUoYHjB8+YRzM752/gX
	GbbL9dOA==;
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfFh-00000004boZ-462S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 03:17:01 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250305031641epoutp047889e880165db145365c8f18bd32ed78~pycox8gn80565005650epoutp04W
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 03:16:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250305031641epoutp047889e880165db145365c8f18bd32ed78~pycox8gn80565005650epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741144601;
	bh=yUnqr75OoCvUiSRApxk6t53XmWVcdinIUHGuIV/vlgc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HNnxajzQW9ktUHZKaLgXr2GuMbqGysHb4ZcKmdsdw/rKaaX+9P2LbfWEDUYkkyxln
	 2EkFpFJAhj9rgaU2ssd2jmpUSXRV7292Bu5pRVMEhn32zUaBEBxEX5foLMRGfmej5l
	 eWz4S+gdXbxpbthBtuuX+/wzkeMQqEa/xtrfwRYM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250305031640epcas5p17112cb670dbd138db618b188e4c14264~pycoJdGRR1492314923epcas5p1D;
	Wed,  5 Mar 2025 03:16:40 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z6yPy4SPRz4x9Px; Wed,  5 Mar
	2025 03:16:38 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.02.20052.612C7C76; Wed,  5 Mar 2025 12:16:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250304170103epcas5p167ff23f37994f7465edfcf0c7228128b~pqDHjxXv62873728737epcas5p1a;
	Tue,  4 Mar 2025 17:01:03 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250304170103epsmtrp1341325dae096ffea3adb264573f4dbea~pqDHij8aB2899628996epsmtrp1s;
	Tue,  4 Mar 2025 17:01:03 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-99-67c7c216f562
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	54.69.18949.EC137C76; Wed,  5 Mar 2025 02:01:03 +0900 (KST)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250304170100epsmtip25c61f68cfcc753ee4402054c958c813f~pqDEvT7ue0734807348epsmtip2G;
	Tue,  4 Mar 2025 17:01:00 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: =?iso-8859-2?Q?'Krzysztof_Wilczy=F1ski'?= <kw@linux.com>, "'Manivannan
 Sadhasivam'" <manivannan.sadhasivam@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<lpieralisi@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
	<jingoohan1@gmail.com>, <Jonathan.Cameron@huawei.com>, <fan.ni@samsung.com>,
	<nifan.cxl@gmail.com>, <a.manzanares@samsung.com>,
	<pankaj.dubey@samsung.com>, <cassel@kernel.org>, <18255117159@163.com>,
	<xueshuai@linux.alibaba.com>, <renyu.zj@linux.alibaba.com>,
	<will@kernel.org>, <mark.rutland@arm.com>
In-Reply-To: <20250304153509.GA2310180@rocinante>
Subject: RE: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Date: Tue, 4 Mar 2025 22:30:58 +0530
Message-ID: <061301db8d27$02e0ced0$08a26c70$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJfby7SiE0e/TbLvAHLJIl0P7SXpgJyxCsJAS8UdNQCRCuPiwHsN3CQAvWEj/yyBTAYoA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xbVRzHPb19Mce8Fhhn6LTcoZFNunYUdljG3CLBa7Zl+FqY/gFXuGmR
	0tY+nOKCwKoIQy0DNmhGeXVYeWWjQEAeg4K8ZkkmDSN0qNvqwjAbOHkKiJQWw3+fc87nd87v
	e04OF+NlcAK4SXINrZJTMoK9jdncExwcstPaLxEuOl5E9qxlDrrcE4hMmVLUpzdjKLNmgoXM
	s8UcVF0+ykbpucss1HB/lIVGfrzCRjZjPxvZm+qZSLeiY6IJXTYLXb19i4FWmzsAqmia5aDy
	8w8BWmtv4SDdnTA0vWRhH/UjK80FLLLWWAvIVsMEhyxr0JK63kcssqE6m03eGW1nk613I0in
	/TKDtJi+IL9trAbk3w0vxGx/P/mwlKYSaRWflicoEpPkkkji+Dtxr8eFhQtFIaIIdJDgy6kU
	OpKIOhETEp0kW09K8D+hZNr1qRhKrSb2HzmsUmg1NF+qUGsiCVqZKFOKlQI1laLWyiUCOa05
	JBIKD4Sti/HJ0oymGqAc2PnpojULSwcLfjnAiwtxMRy6bWPlgG1cHt4GoLN70jN4AmB+6SWO
	y+Lh8wAWPw7YrCgxmD1SB4Bd+nrPYBLA1cxOlsti469Cp30Fc7Evfg7eL+xkuyQMv8CEjUOz
	wLXghYvgnKNlg33wE9D8r2ODmXgQXLtYtbGRNx4B8yqymG5+Fg4WOzcYwwXwwZDBw/tgVfmf
	mLs9Plz6w13ri5+GI+Y6ttvxhz8t5WKuJiBe6QWNv9k8BVFw4O48w80+cKq/kePmAPjwu688
	LIE/WIo8vgzOW0we/zXYZb/CdPNuWDhUz3AftgN+s+z0ON6wxbjJe+DsarvH3wWNfSMsPSAM
	W7IZtmQzbMlm2JKhDDCrwS5aqU6R0OowpUhOn/3/zRMUKQ1g4y/sfbMFTPw+I7ACBhdYAeRi
	hK93ZU6/hOedSH2WSqsUcSqtjFZbQdj6jedhAX4JivXPJNfEicQRQnF4eLg4IjRcRPh7n2/V
	SXi4hNLQyTStpFWbdQyuV0A6w38p7dCvu6281B33PhoZPzn38Zq4Y9+0iZaFSOsYDr2St9RR
	miY49njhWrR4LfTIK50Xu21nnwtcienNr3pQnXbdp3Pg0iBLH1n3XsxCdu3zx3tjB7VPmo+e
	ahtjTP2V8TURlZ0anfTuDbTn3unS66aXGgMT7LIKviW0bS3Q/2lTfLnt2C/6blNzfJww/2Vt
	ApU2Y1398ODb56aCHGccsfOfB493xY5PflAyPl1Uc+vnxfaxoilB6P632qZV1/C8m3VEifAN
	Rb7fcNnwU6ICbLzgS3pyYdTitJn/uaGoOZA7d6HnzNRMI3eobKxQn3O1c9BysyQ2T7J9OHqy
	8BH3++xngvoIplpKifZiKjX1H1EEwT+UBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRzGfXcuO45Wpznz1VnmqCiteVZab1BRH8Jjdwr6ENQaeZia07GT
	3SOzVWpZpka4dDkzm1NHzjQtu2kpBSnlssv0g7TsKlpe8pbGXIHffvA8v4f/hz+FSb7gAVRs
	wgFOn6COl5MivLpBHrSkRdmkYa6fwpDj3KgQXW0IRkUpMagx04KhlNIOAln6c4XIam4jUfKF
	UQLZP7YRqPVeHolemppI5Kiy4cgwZsBRhyGNQDffvhKgP9UPACqs6hci8+mvAE3U1QiRoT0C
	9QxXkmt92RuWHIItM5UBttbYIWQL7Ems4Wk3wdqtaSTb3lZHsrWdK1mX46qArSw6yV68YwVs
	n33Otmm7RKuiufjYg5w+bM1eUcyLviGgG5pxuNlZDpKBSZwOvClIh8N8o4VIByJKQt8HMN+U
	J/AE/rDvle0f+8CS8c9CT6kLwNG2N8AdkPRi6HKMYW6W0sdhnnMEd5cw2ozDjsxK4DFuC+Cd
	lBahu+VNK+GAs2bS9qE3Qcu4c5Jxeh6cyCom3CymV8LLhedwD8+Ez3Ndk4zRDCwyjwg8HAqL
	zd8xz3lz4fAnjyuld8JWSznp6fjBZ8MXsEzgY5wyZZwyZZwyZZyiFADcCvw5Ha/VaHmlbmkC
	d0jBq7V8UoJGsS9RaweTzxASUgPqrL2KeiCgQD2AFCaXiiP6GjUScbT6yFFOn6jSJ8VzfD2Q
	UbjcTzz4PSNaQmvUB7j9HKfj9P9TAeUdkCy4u/YHsS+PezsRfOsBE5eq89MhSXlV9rve4/yx
	NcU9y+Wrz5SkK649CXtxS/4tWLpj4Vi1zMaP/3x5MzN/Vvcm46nNltDuVb2OnOuyx18i/SRx
	WZ3dM294yQLjfDOSmciNgQb/Ff0lrukcW1pQkqq6u310/8DFtFrteleDVRpVfz+l6P3R6dm0
	ThGkkexmTgye+aD6sCcnt3124ZKdofbzDN/cKR4x22zvozbOz/nlUj7qmm9QqgLC8R1bd2+W
	BcOHDOX8SW/Dlz3NWKpbz1xZVOH1bUMFqAt/12XaohKBsKbImtcVp9kF9y71j8RmGEKfn21N
	XOa9bp2WGaikfs+W43yMWhmC6Xn1X5Rmp217AwAA
X-CMS-MailID: 20250304170103epcas5p167ff23f37994f7465edfcf0c7228128b
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250221132039epcas5p31913eab0acec1eb5e7874897a084c725
References: <20250221131548.59616-1-shradha.t@samsung.com>
	<CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
	<20250221131548.59616-5-shradha.t@samsung.com>
	<20250303095200.GB1065658@rocinante>
	<20250304152952.pal66goo2dwegevh@thinkpad>
	<20250304153509.GA2310180@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031658_623620_86E964BD 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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
> From: Krzysztof Wilczy=F1ski=20<kw=40linux.com>=0D=0A>=20Sent:=2004=20Mar=
ch=202025=2021:05=0D=0A>=20To:=20Manivannan=20Sadhasivam=20<manivannan.sadh=
asivam=40linaro.org>=0D=0A>=20Cc:=20Shradha=20Todi=20<shradha.t=40samsung.c=
om>;=20linux-kernel=40vger.kernel.org;=20linux-pci=40vger.kernel.org;=20lin=
ux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-perf-users=40vger.ke=
rnel.org;=20lpieralisi=40kernel.org;=20robh=40kernel.org;=20bhelgaas=40goog=
le.com;=0D=0A>=20jingoohan1=40gmail.com;=20Jonathan.Cameron=40huawei.com;=
=20fan.ni=40samsung.com;=20nifan.cxl=40gmail.com;=0D=0A>=20a.manzanares=40s=
amsung.com;=20pankaj.dubey=40samsung.com;=20cassel=40kernel.org;=2018255117=
159=40163.com;=0D=0A>=20xueshuai=40linux.alibaba.com;=20renyu.zj=40linux.al=
ibaba.com;=20will=40kernel.org;=20mark.rutland=40arm.com=0D=0A>=20Subject:=
=20Re:=20=5BPATCH=20v7=204/5=5D=20Add=20debugfs=20based=20error=20injection=
=20support=20in=20DWC=0D=0A>=20=0D=0A>=20Hello,=0D=0A>=20=0D=0A>=20=5B....=
=5D=0D=0A>=20>=20>=20>=20+=09=0929)=20Generates=20duplicate=20TLPs=20-=20du=
plicate_dllp=0D=0A>=20>=20>=20>=20+=09=0930)=20Generates=20Nullified=20TLPs=
=20-=20nullified_tlp=0D=0A>=20>=20>=0D=0A>=20>=20>=20Would=20the=20above=20=
field=20called=20=22duplicate_dllp=22=20for=20duplicate=20TLPs=20be=0D=0A>=
=20>=20>=20a=20potential=20typo?=20=20Perhaps=20this=20should=20be=20called=
=20=22duplicate_tlp=22?=0D=0A>=20>=20>=0D=0A>=20>=0D=0A>=20>=20Looks=20like=
=20a=20typo.=20As=20per=20Synopsys=20documentation,=20there=20is=20only=20'=
duplicate=20TLP'=0D=0A>=20>=20field.=0D=0A>=20>=0D=0A>=20>=20Good=20catch=
=21=0D=0A>=20=0D=0A>=20Updated.=20=20Thank=20you=21=0D=0A>=20=0D=0A=0D=0ASo=
rry,=20this=20was=20a=20typo.=20Krzysztof,=20we=20need=20another=20change=
=20for=20this=20typo.=0D=0A=0D=0Adiff=20--git=20a/drivers/pci/controller/dw=
c/pcie-designware-debugfs.c=20b/drivers/pci/controller/dwc/pcie-designware-=
debugfs.c=0D=0Aindex=20729ac14ff700..4d77db3ca6ae=20100644=0D=0A---=20a/dri=
vers/pci/controller/dwc/pcie-designware-debugfs.c=0D=0A+++=20b/drivers/pci/=
controller/dwc/pcie-designware-debugfs.c=0D=0A=40=40=20-113,7=20+113,7=20=
=40=40=20static=20const=20struct=20dwc_pcie_err_inj=20err_inj_list=5B=5D=20=
=3D=20=7B=0D=0A=20=20=20=20=20=20=20=20=7B=22posted_tlp_data=22,=200x4,=200=
x4=7D,=0D=0A=20=20=20=20=20=20=20=20=7B=22non_post_tlp_data=22,=200x4,=200x=
5=7D,=0D=0A=20=20=20=20=20=20=20=20=7B=22cmpl_tlp_data=22,=200x4,=200x6=7D,=
=0D=0A-=20=20=20=20=20=20=20=7B=22duplicate_dllp=22,=200x5,=200x0=7D,=0D=0A=
+=20=20=20=20=20=20=20=7B=22duplicate_tlp=22,=200x5,=200x0=7D,=0D=0A=20=20=
=20=20=20=20=20=20=7B=22nullified_tlp=22,=200x5,=200x1=7D,=0D=0A=20=7D;=0D=
=0A=0D=0ASo=20sorry=20for=20the=20inconvenience=21=20Should=20I=20post=20a=
=20patch=20for=20this?=0D=0A=0D=0A>=20=09Krzysztof=0D=0A=0D=0A

