Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3C9CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:
	To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7edoRH6rJpdI38RUa1hZTvGslhZW1R8r4luZRYeOTK8=; b=DxTJyoa2DuNo9palQwHdCQBE71
	qql7T32sXeszNTSA+KpJTlUaCyXgeHRPzGYvtRYr5xnsDDV9sD0NPurWzJ3tJ8OXmgPBWH3ObNzZr
	mkqytFXCloC+KM+GyvIO78p7YHCAue1MEZTbhyo6koAyTsC557UjcCZyaGo1uXjvUbY2IRP2bpWwo
	nA2pAz0VojVAY7YgdPnjDKKdDQSIBRVfDoOVI9gnHnZh29KG0dNnKrvIzlXGMbMKln9eCEVKyF/PG
	mtBKeGARXlV5ZQxir0NvA4Y4TkmDTE5Q95cl+H0sR9Ua1u1tUdttMIeItqGarcqejGldvr7dmFeof
	HnaJm11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKZ-00000007zWL-48sq;
	Sat, 09 May 2026 02:22:16 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKW-00000007zTn-09Pk;
	Sat, 09 May 2026 02:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=7edoRH6rJpdI38RUa1hZTvGslhZW1R8r4luZRYeOTK8=;
	b=dwOgoAk36toC7MxRIhDvL2x2ZjnB8CATUALHU2Q9zziMme725NcjA2QAHWnnyc
	glvZB3hS4bFNl0Pd+8bEHI0vHkM356CZCeUblxsoDXABfa72WAgki3jlCc4gr4xg
	Ah/VsKMcnh3/mRBapqlISF2mdEFtU05hOLhBhtNSMOzhc=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDHLAs9mv5piBw7AQ--.41485S2;
	Sat, 09 May 2026 10:21:51 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] drm/rockchip: Fix error handling and resource leaks in Rockchip DRM drivers
Message-ID: <177829330856.202156.9366848570650672090@openclaw.local>
Date: Sat, 09 May 2026 10:21:48 +0800
X-Patch-Series: drm/rockchip: Fix error handling and resource leaks
X-CM-TRANSID: _____wDHLAs9mv5piBw7AQ--.41485S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1UGr45JFWxZrW8uryDZFb_yoW8Zr1Upr
	Z8u390vr48GrWS9rs3AF4xAryF9ws2vayxKr97K34fZF15uF17A34Igw1kuFy3Ar97A3W7
	trnrJrWrCr4jvrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1E_NUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8ADQJGn+mkAUhQAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192212_386278_EBA26219 
X-CRM114-Status: UNSURE (   9.17  )
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

VGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgNiBidWdzIGluIHRoZSBSb2NrY2hpcCBEUk0gZHJpdmVy
IHN1YnN5c3RlbSwKaWRlbnRpZmllZCB0aHJvdWdoIHN0YXRpYyBjb2RlIGFuYWx5c2lzIGFuZCBj
b25maXJtZWQgYnkgdGVjaG5pY2FsIHJldmlldy4KClRoZSBidWdzIHJhbmdlIGZyb20gQ3JpdGlj
YWwgKG9mX25vZGUgcmVmZXJlbmNlIGxlYWtzLCB1c2UtYWZ0ZXItZnJlZSkKdG8gTWVkaXVtICh1
bmNoZWNrZWQgcmV0dXJuIHZhbHVlcyksIGFuZCBzcGFuIDUgZGlmZmVyZW50IHNvdXJjZSBmaWxl
cy4KRWFjaCBwYXRjaCBhZGRyZXNzZXMgZXhhY3RseSBvbmUgYnVnIHRvIGZhY2lsaXRhdGUgcmV2
aWV3IGFuZCBiaXNlY3Rpb24uCgpTdW1tYXJ5IG9mIGZpeGVzOgoKICBQYXRjaCAxLzYgKENyaXRp
Y2FsKTogRml4IG9mX25vZGUgcmVmZXJlbmNlIGxlYWsgaW4KICAgIHJvY2tjaGlwX2RybV9lbmNv
ZGVyX3NldF9jcnRjX2VuZHBvaW50X2lkKCkuIEJvdGggc3VjY2VzcyBhbmQgZXJyb3IKICAgIHBh
dGhzIGxlYWtlZCByZWZlcmVuY2VzIGFjcXVpcmVkIHZpYSBvZl9ncmFwaCBoZWxwZXJzLgoKICBQ
YXRjaCAyLzYgKENyaXRpY2FsKTogRml4IGRhbmdsaW5nIGNydGMtPnN0YXRlIGluIHZvcDJfY3J0
Y19yZXNldCgpLgogICAga3phbGxvYygpIGZhaWx1cmUgbGVmdCBjcnRjLT5zdGF0ZSBhcyBhIHVz
ZS1hZnRlci1mcmVlIHBvaW50ZXIuCgogIFBhdGNoIDMvNiAoSGlnaCk6IEZpeCB2b3AyX2NyZWF0
ZV9jcnRjcygpIGVycm9yIHBhdGggY2xlYW51cCBpbgogICAgdm9wMl9iaW5kKCkuIEZhaWx1cmVz
IHJldHVybmVkIGRpcmVjdGx5IHdpdGhvdXQgY2FsbGluZwogICAgdm9wMl9kZXN0cm95X2NydGNz
KCksIGxlYWtpbmcgb2Zfbm9kZSByZWZlcmVuY2VzLgoKICBQYXRjaCA0LzYgKEhpZ2gpOiBGaXgg
dm1hcCBhZGRyZXNzIGNhY2hpbmcgaW4KICAgIHJvY2tjaGlwX2dlbV9wcmltZV92bWFwKCkuIE5l
dyB2bWFwKCkgcmVzdWx0cyB3ZXJlIG5vdCBzYXZlZCB0bwogICAgcmtfb2JqLT5rdmFkZHIsIGNh
dXNpbmcgcmVwZWF0ZWQgbWFwcGluZ3MgYW5kIHBvdGVudGlhbCBsZWFrcy4KCiAgUGF0Y2ggNS82
IChIaWdoKTogRml4IGxlYWtlZCB2YmxhbmsgZXZlbnQgaW4KICAgIHZvcF9jcnRjX2F0b21pY19k
aXNhYmxlKCkuIFBlbmRpbmcgdm9wLT5ldmVudCB3YXMgd2FybmVkIGJ1dCBuZXZlcgogICAgc2Vu
dCwgY2F1c2luZyB1c2Vyc3BhY2UgaGFuZ3MgYW5kIHZibGFuayByZWZlcmVuY2UgbGVha3MuCgog
IFBhdGNoIDYvNiAoTWVkaXVtKTogQ2hlY2sgcmV0dXJuIHZhbHVlIG9mIGNkbl9kcF9ncmZfd3Jp
dGUoKSBpbgogICAgY2RuX2RwX2VuYWJsZV9waHkoKSBlcnJvciBwYXRoLiBJZ25vcmVkIHJldHVy
biB2YWx1ZSBjb3VsZCBsZWF2ZQogICAgR1JGIHJlZ2lzdGVycyBpbiBhbiBpbmNvbnNpc3RlbnQg
c3RhdGUuCgpBbGwgcGF0Y2hlcyBoYXZlIGJlZW4gdmVyaWZpZWQgYWdhaW5zdCBjaGVja3BhdGNo
LnBsIC0tc3RyaWN0LgoKU2lnbmVkLW9mZi1ieTogSmlhcWkgPHNoaWppYXFpX2RldmVsb3BAMTYz
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyAgICAgICB8
ICA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jICB8
IDE0ICsrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
Z2VtLmMgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
YyAgfCAxMSArKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMgfCAxMyArKysrKysrKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkK


