Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4FFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFJe4qALkeQEhys3xW/L0dietQst9PmodQmHtovFhEA=; b=LyrDgmP2/Lqr6vwDL8nzwsXmH3
	ph9RQefE/4mR4d0mr68RC9kLjrjcdr1y4Xb2RVn1um3Ij9BC98cz5WwODykhERM0pQ1j29Iru9Jvl
	F7HQ8MCjGl1z8fR+3mDFZS0mzbOdlFFFYcy9//928sSXqVHIOfdfyDMgMih0vEPaImVN5RtSi8y3k
	g4J4GiiicI636Y6Mxc3Yp4YxbTYIV146I4Es9c42dDCGn5qPPn9HW5Vz/J/RYcxi3E5pJx3vjnf3w
	TEcL/68WK3rJO4K7/ktpnYx5CGOQVkZl9uTFCYRJslL8FSavZBtA+Au9Hncp/l4J+XRRTeAOUYsXv
	RDrRzZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinkP-0000000DeMk-0UV3;
	Fri, 14 Feb 2025 04:56:17 +0000
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiniv-0000000De66-2CP4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:54:48 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250214045438epoutp04e8962c2279172775533a39cd447aa404~j_hvczAyK0263702637epoutp04G
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 04:54:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250214045438epoutp04e8962c2279172775533a39cd447aa404~j_hvczAyK0263702637epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739508878;
	bh=GFJe4qALkeQEhys3xW/L0dietQst9PmodQmHtovFhEA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=OCSJZ3NGxdDlcKb32darMlmiZ9woTMMT0+iKvYj9+6VOgcr23M/cPHMpDXwV7R90r
	 Hj0yIWN7mJrwtZb2aCdAFsucsVLf0WfdJUylOlj7nLVHW6RE8pIIglbtzrZM9f9VOn
	 yYh275MWgLFb8JTa9dkuTKY34fit/TYk7wIISdww=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250214045438epcas5p40ed000ae5a1d8c794f122852605f60e7~j_hu587St1722717227epcas5p4t;
	Fri, 14 Feb 2025 04:54:38 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YvKTm1MtZz4x9Px; Fri, 14 Feb
	2025 04:54:36 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	43.3F.19710.C8CCEA76; Fri, 14 Feb 2025 13:54:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250214045402epcas5p3396c5963c8764122bd0ea8e6def478bd~j_hNb8N6R1547315473epcas5p3p;
	Fri, 14 Feb 2025 04:54:02 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250214045402epsmtrp17cf0464ecfc999f324a0bf7b16616463~j_hNaQEVX3205132051epsmtrp1b;
	Fri, 14 Feb 2025 04:54:02 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-19-67aecc8cc583
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2F.57.18949.96CCEA76; Fri, 14 Feb 2025 13:54:02 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250214045359epsmtip1b27101d3b6fca803c4f2c4f69c76a4e4~j_hK_pWn-1563615636epsmtip1K;
	Fri, 14 Feb 2025 04:53:59 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <krzk+dt@kernel.org>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<rmk+kernel@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <27b0f5c5-ae51-4192-8847-20e471c55be7@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Date: Fri, 14 Feb 2025 10:23:49 +0530
Message-ID: <00ad01db7e9c$76c288a0$644799e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFMfZy5LnHh86L+CikZ+hKlrx3PbgHP/Q5uAh59lGQBgzSo3AGBIR3uAawmoOC0H0U3EA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNJsWRmVeSWpSXmKPExsWy7bCmlm7PmXXpBjtOslv8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it3g56x6bxfnzG9gtLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0OHLmBbPFpf6JTBb/9+xgdxDyuHztIrPHlpU3mTye9m9l99g56y67
	x4JNpR6bVnWyeWxeUu+xc8dnJo/3+66yeRzcZ+jxeZNcAHdUtk1GamJKapFCal5yfkpmXrqt
	kndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0F9KCmWJOaVAoYDE4mIlfTubovzSklSF
	jPziElul1IKUnAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMN18+MhaclKzY0v+brYHxmkgX
	IyeHhICJxJ6Dt9lAbCGB3YwS/58ldTFyAdmfGCVmHzjLBuF8Y5RY/vgjO0xH44puZojEXkaJ
	e73voKpeMEqsOLoPbBabgJbEor59YB0iAroSm28sZwcpYhZ4wCzRM2MOC0iCU8BOYseW10Cj
	ODiEBQIl2o7ygYRZBFQlJiw+CFbCK2Apcf3JVShbUOLkzCdgNrOAtsSyhSCtIBcpSPx8uowV
	ZIyIQJjE9n86ECXiEkd/9oAdKiHQzSlxb+EjqA9cJNbMn8gGYQtLvDq+BSouJfGyvw3KjpdY
	3QexV0IgQ+LuL5h6e4kDV0DO5wBaoCmxfpc+RFhWYuqpdUwQe/kken8/YYKI80rsmAdjK0v8
	fX0NaqSkxLal79knMCrNQvLZLCSfzULywiyEbQsYWVYxSqYWFOempyabFhjmpZbD4zs5P3cT
	IzjVa7nsYLwx/5/eIUYmDsZDjBIczEoivBLT1qQL8aYkVlalFuXHF5XmpBYfYjQFBvdEZinR
	5HxgtskriTc0sTQwMTMzM7E0NjNUEudt3tmSLiSQnliSmp2aWpBaBNPHxMEp1cAU/uZfacRa
	9WT51PXLp52tv2pn5cncUau27/4kOamlve8KNfNvyl9o8dzeGNs+2+vUlHPaDtcFszuj1nwN
	YvNPPpp3P4PN4L7L6tWa753uCpQIuhUneJ+/FXno7Yzqn5P9bJa0qDYZBy14I1nkrS7XxbVa
	Y7Olwa13a99yXKw/v9y2X5A9dM+S1swqMe22yNm+P5x/tLXqtovNqA3bLVF1tyUwKFtNclnz
	ze9xrKK63hO+LJuyrdUi6si7I3ucb58LvnEtiy3xndht7YyD0tcVJa99dF8d2ad3xNBYj+Pf
	jYvNvWfnreW+rzRBper/qph3kdMT3l+ZsmJR5ovzB8JfX1c7evRLnd+FIw/4+ISVWIozEg21
	mIuKEwGklvbGfgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWy7bCSnG7WmXXpBl1nGS1+vpzGaLH8wQ5W
	izV7zzFZzDnfwmIx/8g5Vounxx6xW7ycdY/N4vz5DewWF7b1sVpsenyN1eLyrjlsFl3XnrBa
	zPu7ltXi2AIxi2+n3zBaHDnzgtniUv9EJov/e3awOwh5XL52kdljy8qbTB5P+7eye+ycdZfd
	Y8GmUo9NqzrZPDYvqffYueMzk8f7fVfZPA7uM/T4vEkugDuKyyYlNSezLLVI3y6BK+PplVbm
	gq8SFSe2b2ZrYGwS6WLk5JAQMJFoXNHNDGILCexmlJj4SxciLinxqXkqK4QtLLHy33P2LkYu
	oJpnjBIr359iAUmwCWhJLOrbxw5iiwjoSmy+sRysiFngC7PE7PuTmSA6zjJJLG1bxQRSxSlg
	J7Fjy2uwdcIC/hLve0+CdbMIqEpMWHwQbCqvgKXE9SdXoWxBiZMzn4DZzALaEk9vPoWzly2E
	mCMhoCDx8+kyoFM5gK4Ik9j+TweiRFzi6M8e5gmMwrOQTJqFZNIsJJNmIWlZwMiyilEytaA4
	Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOOK1tHYw7ln1Qe8QIxMH4yFGCQ5mJRFeiWlr0oV4
	UxIrq1KL8uOLSnNSiw8xSnOwKInzfnvdmyIkkJ5YkpqdmlqQWgSTZeLglGpg0jHubrzP6WGy
	ntHTZ8qKp/c2TjFfxTVtSqJcbfiJhWqrvxzpel/Q4NJwcU149AT188EGjxbGvPqQGfcrYfrS
	wsXef5vTGhamsgiZnmKos/7kw9qTWGdZcEbq8t4lWms/zbzVrXB9YvNFw2nJUy8lVlaycO99
	f0T94intueIXNrjOlfFkO1Ll8kB16o21i96eZz3dXXYg9taMsnQ1kz4NmTjjlD8cPA/sw/i1
	uq8GGAqEH3x468JCn6vG7EYxXe3nvkuuXvTvknyZ/rSu53cmMMg7Bp+VlIpNaou97l3A1td2
	/e7OItfYrPYrfjYvbObH8a7N/up4yWy5/uTD/ku/T3x9qEmh8s7x7++TzOetUWIpzkg01GIu
	Kk4EABZLXqpnAwAA
X-CMS-MailID: 20250214045402epcas5p3396c5963c8764122bd0ea8e6def478bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff
References: <20250213044624.37334-1-swathi.ks@samsung.com>
	<CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
	<20250213044624.37334-2-swathi.ks@samsung.com>
	<20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
	<009a01db7e07$132feb60$398fc220$@samsung.com>
	<27b0f5c5-ae51-4192-8847-20e471c55be7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_205446_191139_3B0CD42E 
X-CRM114-Status: GOOD (  26.07  )
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
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 13 February 2025 17:31
> To: Swathi K S <swathi.ks=40samsung.com>
> Cc: krzk+dt=40kernel.org; andrew+netdev=40lunn.ch; davem=40davemloft.net;
> edumazet=40google.com; kuba=40kernel.org; pabeni=40redhat.com;
> robh=40kernel.org; conor+dt=40kernel.org; richardcochran=40gmail.com;
> mcoquelin.stm32=40gmail.com; alexandre.torgue=40foss.st.com;
> rmk+kernel=40armlinux.org.uk; netdev=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-stm32=40st-md-mailman.stormreply.com;
> linux-arm-kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v6 1/2=5D dt-bindings: net: Add FSD EQoS device tre=
e
> bindings
>=20
> On 13/02/2025 12:04, Swathi K S wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 13 February 2025 13:24
> >> To: Swathi K S <swathi.ks=40samsung.com>
> >> Cc: krzk+dt=40kernel.org; andrew+netdev=40lunn.ch;
> davem=40davemloft.net;
> >> edumazet=40google.com; kuba=40kernel.org; pabeni=40redhat.com;
> >> robh=40kernel.org; conor+dt=40kernel.org; richardcochran=40gmail.com;
> >> mcoquelin.stm32=40gmail.com; alexandre.torgue=40foss.st.com;
> >> rmk+kernel=40armlinux.org.uk; netdev=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-stm32=40st-md-
> mailman.stormreply.com;
> >> linux-arm-kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> >> Subject: Re: =5BPATCH v6 1/2=5D dt-bindings: net: Add FSD EQoS device
> >> tree bindings
> >>
> >> On Thu, Feb 13, 2025 at 10:16:23AM +0530, Swathi K S wrote:
> >>> +  clock-names:
> >>> +    minItems: 5
> >>> +    maxItems: 10
> >>> +    contains:
> >>> +      enum:
> >>> +        - ptp_ref
> >>> +        - master_bus
> >>> +        - slave_bus
> >>> +        - tx
> >>> +        - rx
> >>> +        - master2_bus
> >>> +        - slave2_bus
> >>> +        - eqos_rxclk_mux
> >>> +        - eqos_phyrxclk
> >>> +        - dout_peric_rgmii_clk
> >>
> >> This does not match the previous entry. It should be strictly ordered
> >> with
> >> minItems: 5.
> >
> > Hi Krzysztof,
> > Thanks for reviewing.
> > In FSD SoC, we have 2 instances of ethernet in two blocks.
> > One instance needs 5 clocks and the other needs 10 clocks.
>=20
> I understand and I do not think this is contradictory to what I asked.
> If it is, then why/how?
>=20
> >
> > I tried to understand this by looking at some other dt-binding files
> > as given below, but looks like they follow similar approach
> > Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> >
> > Could you please guide me on how to implement this?
> > Also, please help me understand what is meant by 'strictly ordered'
>=20
> Every other 99% of bindings. Just like your clocks property.

Hi Krzysztof,
Thanks for your feedback.
I want to make sure I fully understand your comment.=20
I can see we have added clocks and clock names in the same order.
Could you please help in detail what specifically needs to be modified rega=
rding the ordering and minItems/maxItems usage?

-Swathi

>=20
> Best regards,
> Krzysztof


