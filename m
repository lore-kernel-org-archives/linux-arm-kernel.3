Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CB7C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cWYj8nUimPQgLWMnVkDgPNsgpaXAYF17iaSLoeAjd8=; b=0x/fudpagSWDC0vW8QXsxJ2psP
	9FC+FuUE7JUGzDmkZixOTICyuTW7Rb3r9rjYAsHHhIuws8UX9Hf7rLcwdIraMeQ57bsJPtwWqz2vZ
	iV9G3rqJqjHmihAqlQy6LUGoRuR/n/2utEdnc2WDlqpL4jsehLkZG0MZTlscVsVSOZQdGCtsvBLa/
	aRWLWd20KiH9ttRgMomTZSBxosbQQO5v5PmUwmikub+nAv9j2rHoViewhaGLd7bcj64YahbFLGP4a
	Gj6APXI0T4RbOpTXD632m+zLTKdoWD/yi+CKXfDigJDb9KLEiQjBBj8MKMVIk8MJ9PoSk8xWEc0Cc
	aaTDtDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IEl-00000007W0s-0DyX;
	Wed, 23 Sep 2026 08:21:55 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IEh-00000007W09-3T6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:21:54 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwCnr58WjLNqr2fbAA--.31028S2;
	Wed, 23 Sep 2026 16:21:42 +0800 (CST)
Received: from zhuling2709$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Wed, 23 Sep 2026 16:21:32 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Wed, 23 Sep 2026 16:21:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pyx6aKG?= <zhuling2709@phytium.com.cn>
To: "Zenghui Yu" <zenghui.yu@linux.dev>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC
 helpers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250512(e7b47ee3) Copyright (c) 2002-2026 www.mailtech.cn OP_ICM_ICMVM
In-Reply-To: <6b668efe-ef7a-474a-957c-893755ebba46@linux.dev>
References: <86ldjlp0qi.wl-maz@kernel.org>
 <20260921022101.20941-1-zhuling2709@phytium.com.cn>
 <6b668efe-ef7a-474a-957c-893755ebba46@linux.dev>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: dO2y/GZvb3Rlcl90eHQ9MjEyOjM4Mw==
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <dda9852.22f.1a0cd5b128e.Coremail.zhuling2709@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf8Dw8nUNjLNqzNbbAA--.37064W
X-CM-SenderInfo: x2kxzxlqjsliuz6sx5pwlxzhxfrphubq/1tbiAQAFAWqwNEoBFQAI
	s9
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=zhuling270
	9@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWruw1UAF1DCry8tr13uF4DArb_yoWkGrXEyr
	4qyr47tr1vyF1kWayrtF43Xr18WrykJF1jyr4qq3ZrGa4UJ345Ja4kua1jyw1rZr9rGw1D
	tF13W343Jr1DJjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_012152_033176_0FF92F25 
X-CRM114-Status: UNSURE (   1.12  )
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

PiBnaWNfe3Bva2UscGVla31faXJxIGluIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLmMgaGF2ZSBh
IHNpbWlsYXIKPiBwYXR0ZXJuLgo+Cj4gTWluZCBmaXhpbmcgdGhlbSBhcyB3ZWxsPwoKWWVzLCB0
aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIGhhdmUgZml4ZWQgYm90aCBoZWxwZXJzIGFu
ZCB3aWxsCnNlbmQgdjMgc2hvcnRseS4KClRoYW5rcywKWmh1IExpbmcNCg0K5L+h5oGv5a6J5YWo
5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA
5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOA
guivt+aOpeaUtuiAheazqOaEj+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN
5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr
5L+h5oGv44CCDQpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mg
b3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNp
cGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQg
YXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVu
aWNhdGlvbiB0byBvdGhlcnMu


