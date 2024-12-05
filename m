Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02180E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPXMlTZi12QvOahzFxlfj0ZntAWpM5vwwLRm2I9tu2E=; b=F65W0BWEBU9Q2CcDcdq5l+/o/u
	5mV44G9/bEhi77E/4xQ3N7nRxNgfaIwZDa+fleULpZa+ILJVi1TObtNZu7GCzouyiLx7fojQGQttK
	ur4pk63lZ3nCDHbVjSTCm5hhHiRxtTs77IxUCcv1xtbGFt4+i03k5Vk3nFLkOjGmi4lVl05B94662
	1Z8JhnGaq4ao3mLdDKqXxGcv2lU1bhu00OPGB1+o4rhIPhCveFG0V09VvV9pDO6qavemsz94qwIQm
	RjHT+FacAfvHDgwyel5GPxY+JPHFz0HlIhdNXA7smE8biMhYAIY0w8Xe35kQp841KxTqljLZUxWgQ
	dYEwhciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAxB-0000000Fwd2-2t8v;
	Thu, 05 Dec 2024 12:27:33 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAv6-0000000Fw4T-3GfL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:25:28 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241205122518epoutp03b617ca4e6699b3b6c7b24791b3a22e59~OR39JK_qw2406024060epoutp03E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Dec 2024 12:25:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241205122518epoutp03b617ca4e6699b3b6c7b24791b3a22e59~OR39JK_qw2406024060epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733401518;
	bh=WPXMlTZi12QvOahzFxlfj0ZntAWpM5vwwLRm2I9tu2E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EP1p28uEugGXbU++hClVaTxLLjdfTy+uFt6cLPfo/bz++b4/PSpA1XU9Qv8s66/ct
	 mddRSPgXWAT6FyWmgdqeNenKJUrZEStG8ZrijVzoU4K2jqj+VHrRueG+YUO7r6v5vI
	 fVF3yi84qD6uFhbumvkv10tKA2WrM6bRkiCOZZH4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241205122517epcas2p4ec38c7b502dbeae3929411f3f27e07a1~OR38LuJSv0892808928epcas2p48;
	Thu,  5 Dec 2024 12:25:17 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Y3trY1ZYSz4x9Pv; Thu,  5 Dec
	2024 12:25:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.73.22094.DAB91576; Thu,  5 Dec 2024 21:25:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241205122516epcas2p40e6821cea8284c7be97e97c39786903d~OR37eqBAC1431414314epcas2p4Z;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241205122516epsmtrp1cf56288ce90ef0b1e0d82733f72324e1~OR37dUsld1598715987epsmtrp1F;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
X-AuditID: b6c32a48-e7eec7000000564e-5a-67519badc2b1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.31.33707.CAB91576; Thu,  5 Dec 2024 21:25:16 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.8.143]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241205122516epsmtip17e3ef31be9c4e9da5215bc7a78d99ca9~OR37PGvFj3180031800epsmtip1n;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
From: =?UTF-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <171072ed-c35f-430e-a8c0-5cf718efed0c@kernel.org>
Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Thu, 5 Dec 2024 21:25:16 +0900
Message-ID: <000101db4710$bdac8310$39058930$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMd16p+X2UldERt9X3UXGHKyeOT/gFfR1PzAhOyk7QBWm0aqwINNyvVAoah3z0BqLdGjwJ1Uc7oAYTj+0gB7mXbwQHAQo3Er7zbaRA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqe7a2YHpBrN7OSwezNvGZrFm7zkm
	i/lHzrFavJx1j83i/PkN7BabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awO3B7bFrV
	yeaxeUm9x87vDewefVtWMXp83iQXwBqVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGto
	aWGupJCXmJtqq+TiE6DrlpkDdJmSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8
	QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvjcNMx9oJ+9oqF3a+ZGxivs3YxcnJICJhI9DTeYOli
	5OIQEtjBKNG2aQ+U84lRorOrlRXOeTnrCjtMy5PGf0wQiZ2MEs/XzWWGcF4wSuzeexmon4OD
	TcBCYlZfJkiDiICuxOYby8GamQVamSX2XhUDsTkF7CRubbvFBGILC/hIzN97jhnEZhFQkfg5
	8RNYnFfAUuLz/F4WCFtQ4uTMJywQc+Qltr+dwwxxkILEz6fLWCF2lUnsmbyNCaJGRGJ2ZxvY
	bRICazkkWjYsZYJocJH43PoW6hthiVfHt0DZUhIv+9ug7HyJlStPQNXXSNxr28UCYdtLLDrz
	kx3kR2YBTYn1u/RBTAkBZYkjt6BO45PoOPyXHSLMK9HRJgRhqkpMXxYAMUNaYuKMtWwTGJVm
	IflrFpK/ZiG5fxbCqgWMLKsYxVILinPTU4uNCkzgUZ2cn7uJEZxktTx2MM5++0HvECMTB+Mh
	RgkOZiUR3sqwwHQh3pTEyqrUovz4otKc1OJDjKbAkJ7ILCWanA9M83kl8YYmlgYmZmaG5kam
	BuZK4rz3WuemCAmkJ5akZqemFqQWwfQxcXBKNTDNErx57Fdjwtcjd3vcGeU8lE93yv9857Tj
	Z+6PvT+il+rMnR/gcJ0p4JzNtXkmn+SfNnwUzBacIeCiqfqBfUvSpD6nk/kNHzbn1PW72oeV
	snVdZEx45rzdefvc0rzNp9PrPsunrnm2UF1GtvP6t1a/C1L9LV8cFknkrSnZuuCWlafPtD33
	s2/r7MzVayv0ibBUM5XKf6m/8E5d3uI98z4/ktHZd6I3edna2oy912Y4NbNktVo7a0mtr/PY
	0nlANFDOYeXryV+OPBe5cfbh3CNzzzQsNmXXP7PY55HcG/WPdYy8GSblJWVPw2bO8FvHWOIa
	F8vx4TfLjSlzu2+HXZQIXjbL9m+tsrFB2s/iWRVKLMUZiYZazEXFiQDqOH4HOwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnO6a2YHpBk1bNC0ezNvGZrFm7zkm
	i/lHzrFavJx1j83i/PkN7BabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awO3B7bFrV
	yeaxeUm9x87vDewefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlXG46Rh7QT97xcLu18wNjNdZ
	uxg5OSQETCSeNP5j6mLk4hAS2M4o8XTFFXaIhLTEkd8v2CBsYYn7LUdYIYqeMUp8mXEaqIOD
	g03AQmJWXyZIjYiArsTmG8vZQWqYBXqZJfbf3skM0XCcRWLjyUVMIFWcAnYSt7bdArOFBXwk
	5u89xwxiswioSPyc+AkszitgKfF5fi8LhC0ocXLmEzCbWUBbovdhKyOELS+x/e0cZojrFCR+
	Pl3GCnFFmcSeyduYIGpEJGZ3tjFPYBSehWTULCSjZiEZNQtJywJGllWMoqkFxbnpuckFhnrF
	ibnFpXnpesn5uZsYwfGmFbSDcdn6v3qHGJk4GA8xSnAwK4nwVoYFpgvxpiRWVqUW5ccXleak
	Fh9ilOZgURLnVc7pTBESSE8sSc1OTS1ILYLJMnFwSjUwhaTtZzB7dd9tU+nzeMZbrbPn+7hz
	K3M1HPRx/RMg8mqOs3RQ2ZV8mXl79C8ebP1Wzvpt1bNlpceXcZmdiWuWVX+ksm6Oefglp/V/
	PP+8efXjw7Iqp4hNHA/2xTRGcnBPWnXx6twQWYaJP/yNf85JDW7WDb17ZePa440PPBvV1tzf
	W7P9LcfKGHW2jMTEc0IXYpUlC84tmXRGplzGnPP1x2XmH1feOr6pv6vj/hGWB+sDpommVVp1
	Nj9U6S4T6Am8VrDURVF8a6z6vdWqT56xcVioLkxuPOF6VzhJSM6ozbzMcdXRS26X8qZ9VuPr
	m/HbZqOm5+e5xznfngi7Z2flEjfz3cHLf2/oR+j9csuOVmIpzkg01GIuKk4EAMJ1jYQmAwAA
X-CMS-MailID: 20241205122516epcas2p40e6821cea8284c7be97e97c39786903d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
	<CGME20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc@epcas2p1.samsung.com>
	<20241021063903.793166-4-trunixs.kim@samsung.com>
	<961e1aca-cd90-4db1-87d7-afd2e542421e@kernel.org>
	<20241107103331.GA4818@www.linux-watchdog.org>
	<589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
	<20241107113325.GA5284@www.linux-watchdog.org>
	<c487babb-84a5-4e47-a58f-75fec55cbabb@kernel.org>
	<000201db46ac$8d7cfee0$a876fca0$@samsung.com>
	<88950a3a-c3de-4ff5-9ff8-9b85e1b0ad14@kernel.org>
	<171072ed-c35f-430e-a8c0-5cf718efed0c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042525_516748_E19107D6 
X-CRM114-Status: GOOD (  16.10  )
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

on 05/12/2024 12:25 UTC+09:00, Taewan Kim wrote:
>>>>> But that's a never ending discussion, so we won't go into that :-).
>>>>
>>>> DTS is hardware description independent from Linux, therefore always
>>>> goes separate way than Linux drivers.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> I found that the first two patches have been added to the linux-next
>>> git, but the last patch has not yet been reviewed.
>>>
>>> I would appreciate it if you could take a look at this patch.
>>
>> Since this patch was applied, I dropped from my queue. I don't have it
>> in my inbox anymore. Please rebase, resolve any comments and resend.
>
>I found it in my inbox and tried to apply but it fails:
>error: patch failed: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:172
>
>
>please rebase and resend.

Thanks to your hard work, I will resend it after rebase.

Best regards,
Taewan Kim


