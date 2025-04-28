Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC9C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3ekUdVyc5lKna1B3ODGvGE5qt1aBk/h9qBhnTOllb4=; b=2PW3tToo98vxcNeOlvZyIsLQxb
	9O57nk/Fd1AinE5cVQ+2TbEJBtregKUUYToK4alWYXkgQSs+mLynueA4K2RMjcuAGcwQm6+1tdx/w
	3BWM9Sx8owrT7ljZHj5ArUpJWDxz2yFL+jTGLcTJPFZpD3vy96K6NyXgDmUYa9huNXybKWfBT1X5x
	/j4tZRJh3oxOBhWZZVxjBr9czIiFM7R8M76nGOkB4rzeWfvzdy+Au/b1MlkfcoOIH8tW0r/yPBBdf
	ikb7wtnU/uP3s88RQ73ktd79E6Ut6BwqU7DALRV4u8gU72d7fVig4OXyeZ9ElpQ5dk9xFz7loZXFK
	CVvFIRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K22-00000005UTA-0MCd;
	Mon, 28 Apr 2025 08:40:06 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JpJ-00000005Qdd-1hi7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:26:59 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428082648epoutp04f38db3731500622527d0d1ec1ff7b9b8~6bg0x4f8n0507505075epoutp04a
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:26:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428082648epoutp04f38db3731500622527d0d1ec1ff7b9b8~6bg0x4f8n0507505075epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745828808;
	bh=C3ekUdVyc5lKna1B3ODGvGE5qt1aBk/h9qBhnTOllb4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Pv7DxwpXM38xwIgOGr3ofXWmYLHIQJJmHK9SJYLLinNxtziegPvuuWtDV7diB44/9
	 mZzr8qWXaO+Pp3BLt9e+LCtHI3gQp7umnr/hLEnAjC85c3PfW3a1dq7EoowXkHKARy
	 xZBBRTGqEfbrnpSQs9DZ8QFGGC42wVWSYbQ8Xcys=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428082647epcas2p2dfc36e3cf5aa0bf32155279b15f89c6b~6bg0RZBUp0907509075epcas2p2C;
	Mon, 28 Apr 2025 08:26:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmGkv4Sssz6B9mB; Mon, 28 Apr
	2025 08:26:47 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428082646epcas2p4460f473df235e8546df6a71e05240119~6bgzSPIU_0314903149epcas2p4o;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428082646epsmtrp143bee6ba981f6e33c5cf36ee9e09b6c7~6bgzRdC8X1746317463epsmtrp1Q;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-12-680f3bc6c77b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.20.08766.6CB3F086; Mon, 28 Apr 2025 17:26:46 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428082646epsmtip1d3bbcbdee9a21ba30bf0891de9710294~6bgzCkV6Y0683206832epsmtip1I;
	Mon, 28 Apr 2025 08:26:46 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sunyeal Hong'" <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <cdbc8c9b-ecfb-4969-997c-52e873a3abf0@kernel.org>
Subject: RE: [PATCH v2 2/3] clk: samsung: exynosautov920: add cpucl0 clock
 support
Date: Mon, 28 Apr 2025 17:26:46 +0900
Message-ID: <02b401dbb817$47c67a70$d7536f50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGOlsMvr1R6l3BJizf5uOhEVh8iDwK47iPiAr6d9CQCUOddC7QUvGjg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsWy7bCSnO4xa/4Mgw9P9C0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MqY3
	qhX85q5YfPYxUwNjI1cXIweHhICJxJyNpl2MXBxCArsZJb6cusXWxcgJFJeQODxjAiOELSxx
	v+UIK4gtJPCcUeLhr3QQm03AUGLVj+1MIM0iAhOZJS59uMAC4jALbGKUOLf7JhvE2PeMEh3N
	F9hBWjgF7CQ+n/kFNkpYIEhi8tPlzCA2i4CqxPKed2BxXgFLidutN9kgbEGJkzOfsIDYzALa
	Er0PWxkhbHmJ7W/nMEOcpyCx+9NRsF4RATeJ9sv32CFqRCRmd7YxT2AUnoVk1Cwko2YhGTUL
	ScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBEamluYNx+6oPeocYmTgYDzFK
	cDArifBWGfBnCPGmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2aWpBaBJNl4uCU
	amAyaC/3uOd2Ip4tcUf7x75HT2rP8vLceeO+4Ovb/zodskoaJxRPC7589/HQq7y0rm3bmrM7
	FncpqTF/Ztpzy+hG+UW77OUc8t1r1XMYbvu36id2eb9tEN/EXLbuiMtpq7lz1ZZJx222eOgU
	t3d54tvPr3vNRe9t+Kc6IzyrbevOZ6prJh9Uvy7j0X0kI9hk5+4ui0+/1r3KOxW2P23GnO0v
	O7h/C8/nm6v725JLsraRw/nK9cWfdbOsOpPmyZ6bd0X62ZGAzy3HZK5K+MYp87C4v7I51FOV
	uNZ5f+Zk0/WX7df8U7WbrrFH5fLczOPHr+s8OSDQVuD+cxuPfWDbzdsdCSXPvrR4Ndv4KT5+
	otusxFKckWioxVxUnAgAJcX7djcDAAA=
X-CMS-MailID: 20250428082646epcas2p4460f473df235e8546df6a71e05240119
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78@epcas2p3.samsung.com>
	<20250423044153.1288077-3-shin.son@samsung.com>
	<cdbc8c9b-ecfb-4969-997c-52e873a3abf0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_012658_087556_82DA2D6B 
X-CRM114-Status: GOOD (  18.27  )
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
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Monday, April 28, 2025 4:23 AM
> To: Shin Son <shin.son@samsung.com>; Sylwester Nawrocki
> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sunyeal Hong
> <sunyeal.hong@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] clk: samsung: exynosautov920: add cpucl0 clock
> support
> 
> On 23/04/2025 06:41, Shin Son wrote:
> > Register compatible and cmu_info data to support clock CPUCL0(CPU
> > Cluster 0), this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
> > These clocks are required early during boot for the CPUs, so they are
> > declared using CLK_OF_DECLARE instead of being registered through a
> platform driver.
> >
> > Signed-off-by: Shin Son <shin.son@samsung.com>
> 
> Applied, but remember to use proper wrapping and run checkpatch.
> 
> [Checkpatch]
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)
> 
> 
> Best regards,
> Krzysztof

Hello, Krzysztof Kozlowski.

Ack, thanks for your feedback. 
I will make sure to thoroughly review my patches next time.

Best regards,
Shin Son


