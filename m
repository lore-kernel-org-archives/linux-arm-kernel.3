Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36470C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 05:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjzZ8g1rId+ba7sBsfiAyhOJa4sqp8a1IhoPL8J8YzQ=; b=r1sT8BQ+unNtCJjAHyGBV3apYW
	hklaawq7ctN6WY4SUU1+s/6Zg4VyeMsIqh00n/8SipinqakXCRrNgMnrxBysUhEZBFbDyLZBtj2X7
	o5S00pgNF0B9UFElM3Rk/JH6AWNOgduPoiRTJoUUuXzGGTSjJAXbYQ2t3O+X1R+/bXdKfMXEZ8Uze
	5V/N054Qxey9hDP2ebfH4P3XLQPnAXpaMR4UlHw/h22HSdXiNyXOeMQhd5i1J/VKtOUiH8LQRF4Ut
	GxHmj1b10MQpOJpwsFyq0pRhIcSIqRO/VLf+OZ7tNngDZp/5NkDUcsk8LFVt5vBX2UWFwn8W1uPCn
	7TAL0wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tioCJ-0000000Dhaz-0CO0;
	Fri, 14 Feb 2025 05:25:07 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tioAr-0000000DhCh-1Z3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 05:23:39 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250214052324epoutp0338a85d5f79332a84affe3bd86a053f10~j_622c8u61074810748epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 05:23:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250214052324epoutp0338a85d5f79332a84affe3bd86a053f10~j_622c8u61074810748epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739510604;
	bh=fjzZ8g1rId+ba7sBsfiAyhOJa4sqp8a1IhoPL8J8YzQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=irqqnmASkQa7cNtEGnYM4PV9/8czDACH+/ZI5FXUk2TQtMEAdh4bqGZNlHDVgHiDV
	 SUpK+peH3ql2DAfrza3cRo1mhmWfpQSCaDBaVJHfYakptthXVrGm8XrwxelZIwuJec
	 fkmOW1FW11DVpyIGJ5Yo2bfe2u51VPSCW4OWimyE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250214052324epcas5p28619e8fcb61431668ad2fe26a2df304e~j_62Ut5Xr1362413624epcas5p2A;
	Fri, 14 Feb 2025 05:23:24 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YvL6y2Y81z4x9Py; Fri, 14 Feb
	2025 05:23:22 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.13.19956.A43DEA76; Fri, 14 Feb 2025 14:23:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250214051751epcas5p13fec2d1ca9c6505cab1d4c1476346ed6~j_2ANQKv51034810348epcas5p1F;
	Fri, 14 Feb 2025 05:17:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250214051751epsmtrp1f0278ea4befacc1dbd7830b91405ea38~j_2AL8CY71384613846epsmtrp1f;
	Fri, 14 Feb 2025 05:17:51 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-34-67aed34a1690
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	80.22.18729.EF1DEA76; Fri, 14 Feb 2025 14:17:50 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250214051748epsmtip2eee9fbb4db52194ff8db30436d46d2f9~j_19qkrIS0466404664epsmtip2G;
	Fri, 14 Feb 2025 05:17:48 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
Cc: <krzk+dt@kernel.org>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<rmk+kernel@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"'Pankaj Dubey'" <pankaj.dubey@samsung.com>
In-Reply-To: <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
Subject: RE: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Date: Fri, 14 Feb 2025 10:47:39 +0530
Message-ID: <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFMfZy5LnHh86L+CikZ+hKlrx3PbgHP/Q5uAh59lGQCP3Rr5rQy085A
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMJsWRmVeSWpSXmKPExsWy7bCmhq7X5XXpBjP381n8fDmN0WL5gx2s
	FufvHmK2WLP3HJPFnPMtLBbzj5xjtXh67BG7xctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFkTMvmC0u9U9ksvi/Zwe7g7DH5WsXmT22rLzJ5PG0fyu7
	x85Zd9k9Fmwq9di0qpPNY/OSeo+dOz4zebzfd5XNo2/LKkaPg/sMPT5vkgvgicq2yUhNTEkt
	UkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAH6UEmhLDGnFCgUkFhc
	rKRvZ1OUX1qSqpCRX1xiq5RakJJTYFKgV5yYW1yal66Xl1piZWhgYGQKVJiQnXFxaz9TQSN3
	xfYDFg2Mkzm7GDk4JARMJB5uY+ti5OIQEtjNKHHw23emLkZOIOcTo8SNM9IQiW+MEm8XLAJL
	gDQsnjqPHSKxl1Hi2ZSJjBAdLxglvq8DK2IT0JJY1LePHcQWEVCRmDd3ChNIA7NAP4vEsxet
	bCAJTgFriTunH7KDnCEsECjRdpQPJMwioCpxZOt2sDm8ApYSK24uYoWwBSVOznzCAmIzC8hL
	bH87hxniIAWJn0+XsULscpNYs/4PO0SNuMTRnz3MIHslBOZzSlxZcQ3qAxeJyZemskDYwhKv
	jm9hh7ClJF72t0HZ8RKr+65C1WRI3P01kQ3Ctpc4cGUOC8jNzAKaEut36UOEZSWmnoL4nVmA
	T6L39xOoVbwSO+bB2MoSf19fgxopKbFt6Xv2CYxKs5C8NgvJa7OQvDALYdsCRpZVjJKpBcW5
	6anFpgXGeanl8NhOzs/dxAhO/VreOxgfPfigd4iRiYPxEKMEB7OSCK/EtDXpQrwpiZVVqUX5
	8UWlOanFhxhNgeE9kVlKNDkfmH3ySuINTSwNTMzMzEwsjc0MlcR5m3e2pAsJpCeWpGanphak
	FsH0MXFwSjUwiX3NKLzUl2LJb/t2mf3jnqxNLfdNQpc0vM6YkfRVMuRtknmUbOt+zq7Um9N3
	6Ii7vmaP5jHmnrnkabH6GwmWPfxTQ+al/VG48zje7d3nuE3XFZtMg3bv7Zuc9IalxsG80X3x
	h//u04u5pAuN6w25BY5vELofcqD9xoQEn1iH9sbq2Z5Vt/2cTp/iTVzglj1JbtHma18fB07V
	VSlTffB2pqdtzymnVQem6Acda059KrfNPzM+fMH08rbLiQKXiphMt1x4qvR35ZudqiYt+xfd
	VhcPU3b9cOhBRcHOifa+EvvUU5fasJz8JMhmdmZlWP5qIxXnxr9s269MeRKooK+y0fLm/Wkc
	Tw6xVzVHuB5XYinOSDTUYi4qTgQA2fa+FIYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRzGec9lO8eyTi7yzaJsWZC12UDqlcSkwE4klH7IqA+23GmZTuem
	ZhdLy5JMt26THMtkk9KlmbM1Vym1LAxL87ayWnTx3sWwm5bd3Ir89oPneX78P/wp3MdF+FHx
	SamcKkmaKOR5EVdvC+eKfrZeki+tqQlBowOFAF14UUuiFpcDRxV1zRgytOQQ6FxDM4l67r7i
	owH9cx56eFVDIstrJ4narxl4KM/ZTaLiH5UkulsyA31peguQ0fqJjxru9+OoTXsCQ79u1PLD
	BWy7sxVnr5R3YWyP1spn7XoXny2xpLEW81EeW1N6gLXXfsTYofpOHqu5YgbsrXoJ+9EyZ8Pk
	zV6hMi4xPp1TBYVt9drRatViyuxJGbabKAucovMATUEmGJp0xfw84EX5MNcB7Ous4nmCmXD4
	kI70sACW/+z7W+oFUHusmz8e8JhAaNTUu3k6EwCLz57Gxks4YyKgznEU8ywGAbQf6QDjLZpZ
	AZ81vXQvBMx6OFRwz80EswA2WG3YOHszIbCsy0h6eBq8V9RN5AHqj1UMj1S7NTgzF9reGXDP
	df5wtOc86TkiAlZUjfE9HV94ZzQfPw4E+gkm/X+TfoJJP2FRAggzmMkp1Qq5Qi1RSpK4XWK1
	VKFOS5KL45IVFuD+gMBFtcBm/iB2AIwCDgApXDjdGxZWyH28ZdLdezhVcqwqLZFTO8AsihD6
	evv2F8h8GLk0lUvgOCWn+pdiFO2Xha2sW4iFdVUtj6gM7J0S9NlfWC3aVKbCFJOoJQlyV9RB
	mVLGiAYGr7WVLbG/GT6RTose5/Qv+wwkvJ3fhPrGJrMmouN728uHoQVbCEnk8MbnUfbcmrey
	+ZExdOPh+NKEVU5tmkZdlD+qygw3mbL9q/Nj96wyCqw5RbqKEcXXmLCMbY/j6uYVGHVcPqJT
	cwvHst9UUll9D4RzEsWuJ61DUSGX38c1jw0P/ohzOk0Bot7r6Sen0pvqE/bHltOCNfdTw8sf
	GTKTj4eevpjSaPsWGb3dBHYvXR2zOHOv4eYyeiRlLTn16ew7++LbXbkX1+EjGUUh2y6cGYv2
	C/bVNuwihIR6h1QSiKvU0t+jXAZjcAMAAA==
X-CMS-MailID: 20250214051751epcas5p13fec2d1ca9c6505cab1d4c1476346ed6
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
	<85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_212338_066252_5B64974F 
X-CRM114-Status: GOOD (  17.12  )
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
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 14 February 2025 05:50
> To: Swathi K S <swathi.ks@samsung.com>
> Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> > +  phy-mode:
> > +    enum:
> > +      - rgmii-id
> 
> phy-mode is normally a board property, in the .dts file, since the board
might
> decide to have extra long clock lines and so want 'rgmii'.
> 
> The only reason i can think of putting rgmii-id here is if the MAC only
> supports 'rgmii-id', it is impossible to make it not add delays.
> If that is true, a comment would be good.


Hi Andrew,
Thanks for reviewing.
I think we already discussed this part some time back here [1]
[1] :
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.7
0453-2-sriranjani.p@samsung.com/#25879995
Please do let me know if there is any other concern on this.

-Swathi

> 
> 	Andrew


