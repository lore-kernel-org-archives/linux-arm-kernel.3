Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6A2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/othrA++ZqQt3O9bGvixisrtGcHr5UiV2VOX048mnVM=; b=rFE7wdq19REAy9iuI8jXMFw8pq
	JT0yWAkbJoFOkLTP31YVvt6wglXx+ChLWyViuPfSedyFL9xjCv/pDV2J5+Ejdrna4uLDZfVrYSfzK
	eVisW79UUmv6sl28L0dNmIGQIhoS/oukt83oY5CKErL4EdjLIS3yPDkXFwneR29slqekdWXof9Qg0
	edN25MOWFuD4xfpoRMnwuqZoz8iNNJvwZpHbKGfsM7rgHUfPFtQgguQdC9fcVSNu2JL/87SEL6ux7
	zZBnSNQ0dT/19LV9qC/1Mo8CmTm2yqlMepvOvUufAdxTE2xitxdJVXvejYF3QPRx/IeG7IM6C+D21
	tJEdYRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iWn-0000000FoyZ-2sRI;
	Fri, 18 Apr 2025 10:00:57 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iNx-0000000Fnbi-3sxB;
	Fri, 18 Apr 2025 09:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/lz4kzDd+Ofx/tYRxsAmzeEQiMcP0P6DAZ6wk+IAMqs=; b=A
	8865jdie+Au4JHglYjTkQ0ldqnWZIR0oMh3m5Aq/jB2eTyOPM8AyGa1VWuNqhcUD
	B7FesdBs1MfaNnT9h2TYICN4dqOb0tOTn9Cg9v1bBk91R7PgLB64tSazJSStNfou
	663VV4GGjYsCwW1VpVVnNniDfMaUqKkXTBnrn3+3lI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Fri, 18 Apr 2025 17:50:55 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 18 Apr 2025 17:50:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: "Konstantin Shabanov" <mail@etehtsea.me>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>, "Dan Callaghan" <djc@djc.id.au>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on
 rk3399
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
References: <20250414095332.9674-1-mail@etehtsea.me>
 <20250417065759.5948-1-mail@etehtsea.me>
 <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
 <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
X-NTES-SC: AL_Qu2fBvWdtkAu4yadYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDLp/j0HdmVSAWfk9OO0GyOzmgmGQhZw7+16UYtfUYcQTnngy+GPTIlCzbjsNbhLSQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgD3P7Z_IAJowZyaAA--.49852W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hkzXmgCGhqq-gACsa
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_025150_288959_F8FCAE8C 
X-CRM114-Status: UNSURE (   6.14  )
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

CkhpIApBdCAyMDI1LTA0LTE4IDE3OjQzOjE5LCAiRGFuaWVsIFN0b25lIiA8ZGFuaWVsQGZvb2lz
aGJhci5vcmc+IHdyb3RlOgo+SGkgQW5keSwKPgo+T24gRnJpLCAxOCBBcHIgMjAyNSBhdCAwMTox
NiwgQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+PiBJIHByZWZlciB0aGUgVjEg
dmVyc2lvbiBQQVRDSFswXS4gVGhpcyBpcyBiZWNhdXNlIHdlIGRvIG5vdCBkZWFsIHdpdGggaGFy
ZHdhcmUtcmVsYXRlZAo+PiBkaWZmZXJlbmNlcyBhdCB0aGlzIGxldmVsLiAgSXQgaW52b2x2ZXMg
YSBWT1AtcmVsYXRlZCByZXN0cmljdGlvbiBhbmQgd2UgYWx3YXlzICBoYW5kbGUKPj4gbGltaXRp
YXRpb24gbGlrZSB0aGlzICB3aXRoaW4gdGhlIFZPUCBkcml2ZXIgLgo+Cj5BcyBzYWlkIGluIHRo
ZSByZXZpZXcgZm9yIHYxLCB0aGlzIGlzIG5vdCBlbm91Z2ggZm9yIGdlbmVyaWMgdXNlcnNwYWNl
Lgo+Cj5JZiBkcm1Nb2RlQWRkRkIyV2l0aE1vZGlmaWVycygpIGZhaWxzLCB1c2Vyc3BhY2Uga25v
d3MgdGhhdCB0aGUgYnVmZmVyCj5jYW4gbmV2ZXIgd29yayBpbiB0aGF0IGNvbmZpZ3VyYXRpb24s
IGFuZCBpdCBzaG91bGQgZmFsbCBiYWNrLiBJZgo+ZHJtTW9kZUF0b21pY0NvbW1pdChEUk1fTU9E
RV9BVE9NSUNfVEVTVF9PTkxZKSBmYWlscywgdXNlcnNwYWNlIGRvZXMKPm5vdCBrbm93IHRoYXQg
dGhlIGJ1ZmZlciBjYW4gX25ldmVyXyB3b3JrLCBiZWNhdXNlIHRoZSBmYWlsdXJlIG1heSBiZQo+
dHJhbnNpZW50IG9yIGR1ZSB0byBhIGNvbWJpbmF0aW9uIG9mIHRoaW5ncy4KPgo+UmV0dXJuaW5n
IHRoZSBtb3JlIGxvY2FsaXNlZCBlcnJvciBzYXZlcyB1c2Vyc3BhY2UgYSBsb3Qgb2Ygd29yayBh
bmQKPmVuYWJsZXMgYSBtb3JlIG9wdGltYWwgc3lzdGVtLgoKT2theSwgIGZpbmUsIEFDSy4KCj4K
PkNoZWVycywKPkRhbmllbAo=

