Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7CEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/3C21Ouc5wb7m+EDDkgsSLMwPz7bLpJ3rYm+hP4Uyc=; b=2L1A10eHuk82ItrgU9T7iZylLz
	C/IdzmuygUD9oiytvLjnrf4mEihATm2DeeUYL2aBME+eY7S/LbWePBv8aD0IZZQcxsZ9gAQVRdMC+
	h+TuEGA6/gdK6oMZGYaeN39GBZSUyHOiNJJUstdnzH6upTbM+ThCo8kOWrla6X2vx/Myc1OESUPQO
	CIxQ8yUqohubggjd+I8BpKvbB+FCVwdkgABqvUwOFymL8ljKnsr5KlP7IbFROBKkHAZPnBs7AM3N/
	+6M93isW31IkUO1J5P+OibXG6RJXzi19wU6r27a/lEx4V09h8YGEJ31OkaoLCHztAX54D1b6NlhC7
	RakHBIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwYJ-0000000GpJk-1NEf;
	Sat, 08 Mar 2025 15:57:27 +0000
Received: from [203.254.224.25] (helo=mailout2.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwV8-0000000GoXq-0425
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:54:13 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250308155404epoutp0274b32bd43bb646520616ad64deaeae33~q3tyWkTuM0383103831epoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Sat,  8 Mar 2025 15:54:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250308155404epoutp0274b32bd43bb646520616ad64deaeae33~q3tyWkTuM0383103831epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741449244;
	bh=i/3C21Ouc5wb7m+EDDkgsSLMwPz7bLpJ3rYm+hP4Uyc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dNAlUtBvWU+htWdxzpD8J/U6LU4UvPGjU11TezQby00F4saXZHe1iRHUUqP2eamZO
	 HAS2f2PTv2BiRmSZwSEHqlMWbJD3KwCxaPxMIIyWMd/GZJulhzxLQqJ/vtb1RhQosQ
	 TPX5tb1YorkST6y6S6DW8fJS01bV7rkp6fM78mBc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250308155404epcas5p4132d2632e3ceb47fb6e35c789c35faca~q3txzkTg70499304993epcas5p4u;
	Sat,  8 Mar 2025 15:54:04 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Z974V56MTz4x9Pt; Sat,  8 Mar
	2025 15:54:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	50.14.19933.A186CC76; Sun,  9 Mar 2025 00:54:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250307093725epcas5p21294e7d29137ea21d796443ec5a7352d~qe7oZNUzp0034000340epcas5p2-;
	Fri,  7 Mar 2025 09:37:25 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250307093725epsmtrp26a951bd218eefa7ccff21c0651d036b5~qe7oYM4rD2029620296epsmtrp2q;
	Fri,  7 Mar 2025 09:37:25 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-de-67cc681a4c85
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E3.8F.23488.45EBAC76; Fri,  7 Mar 2025 18:37:24 +0900 (KST)
Received: from FDSFTE462 (unknown [107.122.81.248]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250307093721epsmtip231d01e7dfbab692194535a6d9e733a1f~qe7lKsuCD2446924469epsmtip2x;
	Fri,  7 Mar 2025 09:37:21 +0000 (GMT)
From: "Shradha Todi" <shradha.t@samsung.com>
To: =?iso-8859-2?Q?'Krzysztof_Wilczy=F1ski'?= <kw@linux.com>, "'Geert
 Uytterhoeven'" <geert@linux-m68k.org>
Cc: "'Manivannan Sadhasivam'" <manivannan.sadhasivam@linaro.org>, "'Bjorn
 Helgaas'" <helgaas@kernel.org>, "'Fan Ni'" <nifan.cxl@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<lpieralisi@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
	<jingoohan1@gmail.com>, <Jonathan.Cameron@huawei.com>,
	<a.manzanares@samsung.com>, <pankaj.dubey@samsung.com>, <cassel@kernel.org>,
	<18255117159@163.com>, <xueshuai@linux.alibaba.com>,
	<renyu.zj@linux.alibaba.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	"'Yoshihiro Shimoda'" <yoshihiro.shimoda.uh@renesas.com>, "'Linux-Renesas'"
	<linux-renesas-soc@vger.kernel.org>
In-Reply-To: <20250306090234.GA390800@rocinante>
Subject: RE: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Date: Fri, 7 Mar 2025 15:07:20 +0530
Message-ID: <075401db8f44$88861bc0$99925340$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEfDkyGHW8mDgaJp4uj/OEWTCMyQwKytmxvAcZ+scYBKKrTNAJ2u5flAr85U7YCi7TZA7R1SUug
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0ybVRjGPb0zU/atAznUyGo3SXahtltbDg5EGSOfMCOLLiYYLg18tkhv
	a4swdBOhAuvYAhsbUJHLYMgaQIUxigPUsg0hJQtycWFDRRAGU8Yo4mq52NLO8N/vvOd53vc8
	5+QwyKwyOpuRqtQRGqVEzqVtoVzv2b07iC2zSvnrjl1oON9BR6U9L6K6HBm6XdRARtNjXSQ0
	Z22ioYalcjoy1YzSUHahg4paJkepaOjbChoaqOyloeG2Zgpqm50nIf2KnoLG9aep6MrPgyS0
	er0LoMttS3RUkzsL0HqnmY7090Xokb2Vhv7ustFeg3htQwkVb6xsBHiHcZyOV7ek4/qbf1Hx
	FtNpGn5/tJOGW3oKnJsTIfjUcCkJb637BF+2FlPwc9dMALe1BMR6x6WFyghJCqHhEMpkVUqq
	UhrGjXk78VCiSMwXBAlCUDCXo5QoiDBu5JHYoKhUufMKuJwPJfJ0ZylWotVyX341VKNK1xEc
	mUqrC+MS6hS5WqjmaSUKbbpSylMSulcEfP5+kVOYlCZbmz5PUhftyKxp/46aDWoDDMCLATEh
	rBn7ke5iFnYDwLlsrQFscfIigPNVg1T3YhnAx6s2YACMDYf5Edtd7wLwq9pGj+gBgBajgeJq
	RcP2wanhFbKLfTAFfNBjJLlEZGycCm3dMxudvDA+/OzOey7NdiwaXp2Y2PBSsF0wr2KN5mIm
	FgKHrKsUN2+DfeVTG0zGeHC63+jhvbC+5iHZHYcD7X/UU91z4+DNmRGyW+MHb9kLya4zQOwn
	L1i1NkJyGyKhY7KX7ubtcK73mofZ0DbfRXOzFF5tLfMMkMPl1jqPNxx+P1xBcfML8GJ/M8k9
	zBuedUx5NExornzKO+HSaqdH7w8rbw9RiwDXuCmbcVM246Zsxk0ZqgHFBPwJtVYhJbQi9X4l
	kfH/iyerFC1g44vsiTaDid8WeBZAYgALgAwy14cZ2N4vZTFTJCeyCI0qUZMuJ7QWIHLeeDGZ
	7Zuscv4xpS5RIAzhC8VisTDkgFjA9WPmduilLEwq0RFpBKEmNE99JIYXO5t0JNoWUZrbcszE
	Nx//6M+yo2+2lgDHB7Jb1EM3IqPS5OewgaX4zCu+zYyCHTzzs8VffM2qv2uo0mSIF7GkzM5O
	/cWMk/aScH3Bhb4LC18GNL3+6Tf167PivIW4O3t178Sv/z54KTohb/KHMz3Zi1kGQ+K/VnMS
	L1+3utO+srXvgOhdenm1bfxX1XNjj/cdNM02db4/kqFgPilHOeH64I57gfnz845Tx4RnY8qK
	QNTnnNqJfwIuH46pyRg4+qRs5e7hwhMHS9qCnudfyvEesVuzWBHdWyJYoLshIWnaJ5B5/JkM
	v63bfjH4vhEfOpP00snzD/NOLVs+nn3rXrC41Hs9x5rQ4d/OpWhlEsEeskYr+Q9Ta3POqwQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7bCSvG7ovlPpBksLLK60/2a3mH5Y0WJJ
	U4bFsQkrmC2e3drLZPHqzFo2ixVfZrJbrFp4jc2ioec3q8Wmx9dYLS7vmsNmcXbecTaLK1vX
	sVhsffmOyaLlTwuLxd2WTlaLpdcvMln83baX0WLR1i/sFgubXzJa/N+zg92i5Y6pxfufm9ks
	vu79zOYg4bF4xRRWjzXz1jB67Jx1l91jwaZSj5Yjb1k9Nq3qZPO4c20Pm8ehwx1AyYeWHk+u
	TGfy2Lyk3uPbmYksHn1bVjF6fN4kF8AXxWWTkpqTWZZapG+XwJWx9vk/xoLTohUH7n9haWDc
	LNjFyMEhIWAiseO9VBcjJ4eQwG5GiWezbEBsCQFJic8X1zFB2MISK/89Z+9i5AKqecYo8fV8
	NxtIgk1AR+LJlT/MILaIQK7E8jstrCBFzAKfWSXmN35jhOh4zCTx6u9nFpBtnAIGEq3no0Ea
	hAW8JFY+fMgCYrMIqEi0zfkHNpRXwFLi8pm/LBC2oMTJmU/AbGag1iULfzFB2NoSyxa+Zoa4
	TkHi59NlrBBHREkceX6VGaJGXOLozx7mCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PTfZ
	sMAwL7Vcrzgxt7g0L10vOT93EyM4hWhp7GB8961J/xAjEwfjIUYJDmYlEV617afShXhTEiur
	Uovy44tKc1KLDzFKc7AoifOuNIxIFxJITyxJzU5NLUgtgskycXBKNTDZnfJrYdEr3bUww05f
	cOOF/87PTZpXSzzzfmxQfeSe8uU9XFU+v17nR7x/Hyzo2Xp44pQ0y0835rvsCn/9WkJFKSt8
	jn3puWiWlaeyy0tE6z/sOPP+keGDhRvuT9iT7eNulHQ+WXS70aPsllPx0n+u8vq41db2iWQ/
	PXVIKav924Hsy6l/2+4EH9FcZyQd/es4a53L9LT4D6enVZy+YvA5R6ygZtPHvQILo5/d1kj7
	LTp5PeMC0ZaGn0k1u+6kHH3q+fZPbveXiIaaJXc4nU4E6e6/fjBc+f2ZrL7PR/K69c9/ub/j
	ueq0Mu8XeuevHviVqt/NLh5wRoehbU1RYunLs1tnWwUdazLknXf2xncmJZbijERDLeai4kQA
	ys3uW5ADAAA=
X-CMS-MailID: 20250307093725epcas5p21294e7d29137ea21d796443ec5a7352d
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250306090240epcas5p4f5ce09cf67a116dd3c976bfc846f1b14
References: <20250304171154.njoygsvfd567pb66@thinkpad>
	<20250305173826.GA303920@bhelgaas>
	<20250305182833.cgrwbrcwzjscxmku@thinkpad>
	<20250305190955.GK847772@rocinante>
	<CAMuHMdVRSjkss3gPnocXpfPQ=mEo4AevpaU=fdGvm=kb3RTmcQ@mail.gmail.com>
	<CGME20250306090240epcas5p4f5ce09cf67a116dd3c976bfc846f1b14@epcas5p4.samsung.com>
	<20250306090234.GA390800@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_075410_372062_BE82FFEF 
X-CRM114-Status: UNSURE (   7.54  )
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
> From: Krzysztof Wilczy=F1ski=20<kw=40linux.com>=0D=0A>=20Sent:=2006=20Mar=
ch=202025=2014:33=0D=0A>=20To:=20Geert=20Uytterhoeven=20<geert=40linux-m68k=
.org>=0D=0A>=20Cc:=20Manivannan=20Sadhasivam=20<manivannan.sadhasivam=40lin=
aro.org>;=20Bjorn=20Helgaas=20<helgaas=40kernel.org>;=20Fan=20Ni=0D=0A>=20<=
nifan.cxl=40gmail.com>;=20Shradha=20Todi=20<shradha.t=40samsung.com>;=20lin=
ux-kernel=40vger.kernel.org;=20linux-pci=40vger.kernel.org;=20linux-=0D=0A>=
=20arm-kernel=40lists.infradead.org;=20linux-perf-users=40vger.kernel.org;=
=20lpieralisi=40kernel.org;=20robh=40kernel.org;=20bhelgaas=40google.com;=
=0D=0A>=20jingoohan1=40gmail.com;=20Jonathan.Cameron=40huawei.com;=20a.manz=
anares=40samsung.com;=20pankaj.dubey=40samsung.com;=0D=0A>=20cassel=40kerne=
l.org;=2018255117159=40163.com;=20xueshuai=40linux.alibaba.com;=20renyu.zj=
=40linux.alibaba.com;=20will=40kernel.org;=0D=0A>=20mark.rutland=40arm.com;=
=20Yoshihiro=20Shimoda=20<yoshihiro.shimoda.uh=40renesas.com>;=20Linux-Rene=
sas=20<linux-renesas-=0D=0A>=20soc=40vger.kernel.org>=0D=0A>=20Subject:=20R=
e:=20=5BPATCH=20v7=203/5=5D=20Add=20debugfs=20based=20silicon=20debug=20sup=
port=20in=20DWC=0D=0A>=20=0D=0A>=20Hello,=0D=0A>=20=0D=0A>=20=5B...=5D=0D=
=0A>=20>=20Another=20issue=20is=20that=20the=20caller=20does=20not=20handle=
=20failures=20correctly,=0D=0A>=20>=20given=20(A)=20the=20irqdomain=20WARNI=
NG=20I=20got,=20and=20(B)=20the=20half-registered=20PCI=0D=0A>=20>=20bus,=
=20oopsing=20on=20=22lspci=22...=0D=0A>=20=0D=0A>=20This=20is=20something=
=20we=20will=20look=20into.=20=20A=20more=20robust=20DesignWare=20core=20is=
=20something=20we=20would=20definitely=20want=20to=20have.=0D=0A>=20=0D=0A=
=0D=0AThe=20issue=20here=20was=20that=20=22=20pci_host_probe(bridge)=22=20w=
as=20being=20called=20right=20before=20doing=20the=20debugfs=20init.=0D=0AS=
o=20upon=20failure,=20the=20cleanup=20path=20should=20have=20included:=0D=
=0A=20=20=20=20=20=20=20=20pci_stop_root_bus(pp->bridge->bus);=0D=0A=20=20=
=20=20=20=20=20=20pci_remove_root_bus(pp->bridge->bus);=0D=0A=0D=0AI=20miss=
ed=20that,=20which=20was=20probably=20causing=20the=20half-registered=20PCI=
=20bus.=20Since=20we=20are=20going=20with=20no=20error=0D=0Apropagation=20n=
ow,=20there=20is=20no=20issue=20anymore.=20Sorry=20for=20missing=20that.=0D=
=0A=0D=0A>=20Sorry=20about=20the=20issues=20with=20this...=0D=0A>=20=0D=0A>=
=20=5B...=5D=0D=0A>=20>=20>=20-int=20dwc_pcie_debugfs_init(struct=20dw_pcie=
=20*pci)=0D=0A>=20>=20>=20+void=20dwc_pcie_debugfs_init(struct=20dw_pcie=20=
*pci)=0D=0A>=20>=20>=20=20=7B=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20char=
=20dirname=5BDWC_DEBUGFS_BUF_MAX=5D;=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=
=20struct=20device=20*dev=20=3D=20pci->dev;=20=40=40=20-174,17=20+174,15=20=
=40=40=20int=0D=0A>=20>=20>=20dwc_pcie_debugfs_init(struct=20dw_pcie=20*pci=
)=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20snprintf(dirname,=20DWC_DEBUGFS_=
BUF_MAX,=20=22dwc_pcie_%s=22,=20dev_name(dev));=0D=0A>=20>=20>=20=20=20=20=
=20=20=20=20=20dir=20=3D=20debugfs_create_dir(dirname,=20NULL);=0D=0A>=20>=
=20>=20=20=20=20=20=20=20=20=20debugfs=20=3D=20devm_kzalloc(dev,=20sizeof(*=
debugfs),=20GFP_KERNEL);=0D=0A>=20>=20>=20-=20=20=20=20=20=20=20if=20(=21de=
bugfs)=0D=0A>=20>=20>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20retur=
n=20-ENOMEM;=0D=0A>=20>=20>=20+=20=20=20=20=20=20=20if=20(=21debugfs)=20=7B=
=0D=0A>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20dev_err(dev=
,=20=22failed=20to=20allocate=20memory=20for=0D=0A>=20>=20>=20+=20debugfs=
=5Cn=22);=0D=0A>=20>=0D=0A>=20>=20There=20is=20no=20need=20to=20print=20an=
=20error=20message=20when=20a=20memory=20allocation=0D=0A>=20>=20fails,=20a=
s=20the=20memory=20allocation=20core=20already=20takes=20care=20of=20that.=
=0D=0A>=20>=20So=20please=20drop=20the=20dev_err()=20call.=0D=0A>=20=0D=0A>=
=20Done.=20=20Thank=20you=21=0D=0A>=20=0D=0A>=20=09Krzysztof=0D=0A=0D=0A

