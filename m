Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE51CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXsPS3KhA5/iDl1AWC3RfGMkwHSxxC2+KnC8nvz5Ku4=; b=t9grOcTFRWqfUf2Sqy5sR8Osh+
	lyrSPxUGYZKTAOWLS6XQJ7xOtPuU5gS8FngtGDV0Y8vFe96CnF1YHAoCID2U8uEcOMPn+fEJ/jAlW
	GfH2IhTOJHz5F7XQOCHilPAGVBM6JwamcZyQnglfuY+fC0EbbWdTLrdXKbWDLLRiz7sd+JUtNZtGI
	2b7BnXiDrjWK/f5/sWPuseCR5Ah6ziiLj2Ak5QqP56XAJMx8xHpGaOLV0b9wFY4DBVEAc9a++ZC8C
	INEwME+Q1/R3z6Pn8SzzJcLguOa6IR9yh3I3cUBhGMAQ+m8WN8hJmAQpJRWVKxbz8ds0r4CFq4boE
	vzoeJzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyvD-0000000BN8Y-1P9B;
	Tue, 10 Dec 2024 12:00:59 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyu8-0000000BN2p-37ue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:59:54 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241210115946epoutp04136c68a3a4187365c7e1cf3db4394e26~PzwGE81Vm2724127241epoutp04m
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 11:59:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241210115946epoutp04136c68a3a4187365c7e1cf3db4394e26~PzwGE81Vm2724127241epoutp04m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733831987;
	bh=CXsPS3KhA5/iDl1AWC3RfGMkwHSxxC2+KnC8nvz5Ku4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HGYq3ZnMYiY3Qs+aIcV52EOSHtBinJMFYLUEAKM+36RcuioihmUJwMR6Pu6TYCu2c
	 PDC9ZYr84Kj3HQQDbvXQb7VDzpwpOFqd1dP0+k+OKQayeRyV/8ubA2dYT0YH8Vyoim
	 5rb+g0QpIrJYhEQ0nOg78LjaFXe9NB99ikgzYU+k=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241210115946epcas5p16a0d95e855ad6cfa24c35a43529a3dc6~PzwFzviab0849908499epcas5p1u;
	Tue, 10 Dec 2024 11:59:46 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Y6y2n3FMDz4x9Pv; Tue, 10 Dec
	2024 11:59:45 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.69.29212.13D28576; Tue, 10 Dec 2024 20:59:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20241210115322epcas5p37a1410d0c91a1fa90b87b77a490bfef7~Pzqf8RmM70985109851epcas5p3S;
	Tue, 10 Dec 2024 11:53:22 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241210115322epsmtrp1f5d56192c869dea1dfab559fd64d2c90~Pzqf7pFJh2065520655epsmtrp1B;
	Tue, 10 Dec 2024 11:53:22 +0000 (GMT)
X-AuditID: b6c32a50-801fa7000000721c-22-67582d31f8ff
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	75.5E.33707.2BB28576; Tue, 10 Dec 2024 20:53:22 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241210115321epsmtip2c057b84502f5e24c86df180706c4553d~Pzqet90oQ2043820438epsmtip2u;
	Tue, 10 Dec 2024 11:53:21 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <alim.akhtar@samsung.com>,
	<rosa.pila@samsung.com>
In-Reply-To: <0bac139b-c89c-43a7-978a-e5fe001d3dd2@kernel.org>
Subject: RE: [PATCH] arm64: dts: exynosautov920: add DMA nodes
Date: Tue, 10 Dec 2024 17:23:09 +0530
Message-ID: <030f01db4afa$1cb672c0$56235840$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFjpTq5mUG5UMRch2oPlNEF/ignPQHSFX3YAc7cLEKzsaGa4A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmuq6hbkS6wcuJIhYP5m1js5h/5Byr
	xctZ99gszp/fwG6x6fE1VosZ5/cxWfzfs4Pd4svPB8wOHB6bVnWyeWxeUu/Rt2UVo8fnTXIB
	LFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
	lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK9IoTc4tL89L18lJLrAwNDIxMgQoT
	sjOWTJrFXLCGo+L3hOXMDYx32boYOTkkBEwkPnd/ZOpi5OIQEtjDKNHe9pURJCEk8AnIWScE
	Z2+7X9bFyAHW0H3TFqJ+J6PEke997BDOS0aJuxd+sII0sAloStz5/BRsqojAbEaJAx9Wgk1l
	FkiQ2PCsE2w1p4CdxNHZW8FsYSB7TstvZhCbRUBV4sP2d2BxXgFLiTv3J7FA2IISJ2c+YYGY
	Iy+x/e0cZogXFCR+Pl3GCnKdiICTxMcPbhAl4hIvjx4BO05CYCKHxPeuJYwQH7hIXN7jC9Eq
	LPHq+BZ2CFtK4mV/G5TtIzH56Deo8gyJO2tFIML2EqsXnAHbxAz04vpd+hBhWYmpp9YxQWzl
	k+j9/YQJIs4rsWMejK0scXLPHlYIW1Li0O0XrBMYlWYh+WsWkr9mIXlgFsK2BYwsqxilUguK
	c9NTk00LDHXzUsvhsZ2cn7uJEZxCtQJ2MK7e8FfvECMTB+MhRgkOZiURXg7v0HQh3pTEyqrU
	ovz4otKc1OJDjKbA0J7ILCWanA9M4nkl8YYmlgYmZmZmJpbGZoZK4ryvW+emCAmkJ5akZqem
	FqQWwfQxcXBKNTAtncG26hr/nYB1v7Z80r3w2aP1W1e87kbXsxPyBFokg/pjZ9o+Z2j1Mme9
	M9suimEFD9uTgreHA39+ZD+ZnzMtpVmmIsBs+ZkHq6bJeWyYys9Un2ZXty15hqT5Epn653yp
	l9/NMlyY+vDC9ZAXR/4X7oqIzdrOn6pjc+u6im/ziS3nmyq3xj4MPtrtN3fGUU39gM7ARxy3
	75WdUost812YbVS/ne+cYcVehqB7HrtsZmtahbe+XRP6h4GfuyWnuuBV9qUFK+6dnVEi5f2r
	WPVT/LG2GzcSfdOv8SzxuKSpdW3im5dVrneDREvuz92gY/8o26xASej0zw1mrXbeP34ofdVk
	6g+4Zr+cN2LD+x4lluKMREMt5qLiRAD3LgepKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO4m7Yh0g2X/RCwezNvGZjH/yDlW
	i5ez7rFZnD+/gd1i0+NrrBYzzu9jsvi/Zwe7xZefD5gdODw2repk89i8pN6jb8sqRo/Pm+QC
	WKK4bFJSczLLUov07RK4MpZMmsVcsIaj4veE5cwNjHfZuhg5OCQETCS6b9p2MXJxCAlsZ5TY
	s3IqUxcjJ1BcUuLw07usELawxMp/z9khip4zSuz88IQFJMEmoClx5/NTJpCEiMBCRok5PVPA
	OpgFkiQeNM9lhejYyyhx5OVyRpAEp4CdxNHZW9lAbGEge07Lb2YQm0VAVeLD9ndgcV4BS4k7
	9yexQNiCEidnQmxjFtCW6H3Yyghhy0tsfzuHGeI8BYmfT5exgrwjIuAk8fGDG0SJuMTLo0fY
	JzAKz0IyaRaSSbOQTJqFpGUBI8sqRtHUguLc9NzkAkO94sTc4tK8dL3k/NxNjOAo0grawbhs
	/V+9Q4xMHIyHGCU4mJVEeDm8Q9OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8yrndKYICaQnlqRm
	p6YWpBbBZJk4OKUamMqXXlU4qOJZ8eyM/okPB4SZc46uMJ8lt2dhs4z6v2rzGTL37qz1tahJ
	sUgpOxL8I6be9w7zuhb9HSvOlEvFe7TGLPzgnTOfjenKaUOJFZdnhose51t2ePppk+PFuzvZ
	3vLF7rw+o0LpW0CTzwbvdabmRayJe8584fLeMWmuHI+mzvaKJsNdjEySta4mN35eePp3pUjD
	3aJHiZMYLHRuHCxfKGGQY6jU9Vwq4+S0OK+j1dVR9+cVN+aVTYw87Zb3O6gqOvDu/D+dhq3f
	VOpU9n8VOSN3vGb/rNl9+98L1Mwpai7eYbzRaM+J1tMbrvNY53y+tqZDXe3sNt7Dc1QLr7TO
	az9+15XVqiiwvjl/ixJLcUaioRZzUXEiAMtFP3cRAwAA
X-CMS-MailID: 20241210115322epcas5p37a1410d0c91a1fa90b87b77a490bfef7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83
References: <CGME20241204122402epcas5p2412733eb46d495fadfa30e5af3c5ce83@epcas5p2.samsung.com>
	<20241204122335.1578-1-faraz.ata@samsung.com>
	<0bac139b-c89c-43a7-978a-e5fe001d3dd2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_035953_361047_11AF9609 
X-CRM114-Status: GOOD (  15.35  )
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
> Sent: Monday, December 9, 2024 1:04 PM
> To: Faraz Ata <faraz.ata@samsung.com>; devicetree@vger.kernel.org; linux-
> samsung-soc@vger.kernel.org; krzk+dt@kernel.org; robh@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; alim.akhtar@samsung.com;
> rosa.pila@samsung.com
> Subject: Re: [PATCH] arm64: dts: exynosautov920: add DMA nodes
> 
> On 04/12/2024 13:23, Faraz Ata wrote:
> > +
> > +		spdma1: dma-controller@10190000 {
> > +			compatible = "arm,pl330", "arm,primecell";
> > +			reg = <0x10190000 0x1000>;
> > +			interrupts = <GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cmu_misc
> CLK_MOUT_MISC_NOC_USER>;
> > +			clock-names = "apb_pclk";
> > +			#dma-cells = <1>;
> > +		};
> > +
> > +		pdma0: dma-controller@101A0000 {
> 
> Please do not send downstream code directly, but fix it to match upstream.
> Lowercase hex everywhere.
> 
Thanks for your review,  will takecare in future patches. 

> Best regards,
> Krzysztof


