Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A38CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mbl+x1W7P7FyK/cziWr1i5ksKRIVvTwpS2LBhPZA0IM=; b=KdohjmCaSYl29odLEn5D2l+/cG
	YhMENgGghM6qW3Z4Mbqshs9KeT0cbxDOmbn8JAFAMsUecCoTyvd7ug+1bF0PuIljb+D31qCkv+F/4
	JnUGQCph+WKLJ6Z/U6KSHF5csTXb9iLGyLO13BkXBJ6xisYbJpCkDm8nxKvM2stFImAVyXPG5sWgi
	vVBzJZG2x6mW8heRs1ZF2pnR7qlBAP8sM36N7WRvi4b73NjNWL3YNeChiKzRLS+gV+zmSLmFzPSRq
	XiQMNBUtpsF6uai3+p+QxSDtGIK9qkMQbXIYwL3+Wl1yP5hA736YssTT6SdMEx88kd7TxyiEyj7Sz
	j93XeUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKm-00000007zei-1usP;
	Sat, 09 May 2026 02:22:28 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKh-00000007zal-2FJj;
	Sat, 09 May 2026 02:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=Mbl+x1W7P7FyK/cziWr1i5ksKRIVvTwpS2LBhPZA0IM=;
	b=HondrNQsemqku1dydGZgV8O/3Ps1SlEF+xIYnwR4OioVR775loUWgGjTgdU9p1
	9rrYaoFro7thQvZDpimSE0sm5biqJiNYmByUO5mS4pMywei9iJlGVQ7oRw6OTqzz
	A2vtKU1JVjD9r8C9lvfoszFl06HubuBg9hEtEZniIESXc=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3D1FPmv5pgcdYAQ--.5161S2;
	Sat, 09 May 2026 10:22:08 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/rockchip: Fix dangling crtc->state in vop2_crtc_reset()
Message-ID: <177829332608.202156.2367375924447302991@openclaw.local>
Date: Sat, 09 May 2026 10:22:06 +0800
In-Reply-To: <177829330856.202156.9366848570650672090@openclaw.local>
References: <177829330856.202156.9366848570650672090@openclaw.local>
X-CM-TRANSID: _____wD3D1FPmv5pgcdYAQ--.5161S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1xGFykGw4kCF4DWF4rKrg_yoW8Jw4fpr
	s7Cryj9r4UKrWjqrnrJr1xursak3ZFyayxGr97Gw13u3Wjqwn8CrnI9ryqv3y7ArWfA3yj
	yrs7Jw45ZF4qyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UqdgZUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzRHUKGn+mlHTMAAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192223_889944_4F69C688 
X-CRM114-Status: GOOD (  12.48  )
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

SW4gdm9wMl9jcnRjX3Jlc2V0KCksIGlmIGt6YWxsb2MoKSBmYWlscyB0byBhbGxvY2F0ZSBhIG5l
dwpyb2NrY2hpcF9jcnRjX3N0YXRlLCB0aGUgZnVuY3Rpb24gcmV0dXJucyBlYXJseSB3aXRob3V0
IHNldHRpbmcKY3J0Yy0+c3RhdGUgdG8gTlVMTC4gSG93ZXZlciwgdGhlIG9sZCBzdGF0ZSBoYXMg
YWxyZWFkeSBiZWVuIGRlc3Ryb3llZAphbmQgZnJlZWQgYnkgX19kcm1fYXRvbWljX2hlbHBlcl9j
cnRjX2Rlc3Ryb3lfc3RhdGUoKSBhbmQga2ZyZWUoKS4KClRoaXMgbGVhdmVzIGNydGMtPnN0YXRl
IGFzIGEgZGFuZ2xpbmcgcG9pbnRlci4gQW55IHN1YnNlcXVlbnQgYWNjZXNzIHRvCmNydGMtPnN0
YXRlIChlLmcuLCB0aHJvdWdoIHRvX3JvY2tjaGlwX2NydGNfc3RhdGUoKSkgd2lsbCByZXN1bHQg
aW4gYQp1c2UtYWZ0ZXItZnJlZSBvciBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGxlYWRpbmcg
dG8gYSBrZXJuZWwgY3Jhc2guCgpGaXggYnkgc2V0dGluZyBjcnRjLT5zdGF0ZSA9IE5VTEwgd2hl
biBremFsbG9jKCkgZmFpbHMsIGVuc3VyaW5nIHRoZQpwb2ludGVyIGlzIGluIGEgd2VsbC1kZWZp
bmVkIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogSmlhcWkgPHNoaWppYXFpX2RldmVsb3BAMTYzLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDQg
KysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKaW5kZXggOGFmYWJl
MjExOGE5Li4xMjM0NTY3ODkwYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fdm9wMi5jCkBAIC0yMDgyLDggKzIwODIsMTAgQEAgc3RhdGljIHZvaWQgdm9wMl9j
cnRjX3Jlc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAl9CgogCXZjc3RhdGUgPSBremFsbG9j
KHNpemVvZigqdmNzdGF0ZSksIEdGUF9LRVJORUwpOwotCWlmICghdmNzdGF0ZSkKKwlpZiAoIXZj
c3RhdGUpIHsKKwkJY3J0Yy0+c3RhdGUgPSBOVUxMOwogCQlyZXR1cm47CisJfQoKIAljcnRjLT5z
dGF0ZSA9ICZ2Y3N0YXRlLT5iYXNlOwogCWNydGMtPnN0YXRlLT5jcnRjID0gY3J0YzsKLS0KMi40
MC4wCg==


