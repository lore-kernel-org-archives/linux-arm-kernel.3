Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7508DC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mNvayiA4tnzp8kDTCtTD6lvIrDP/VYeD+91qYRCn74=; b=PqXocviSmYEZg7iq6+dne1o6G/
	FijPSNgW+QlosblDtiO/mj1pU1thGmmzleXXoMwbnaM5AsZTPeshGL0/vj/vV9+Ow6TYMej6hjSyV
	JF1Lu0CPfqGfxsWxyGgWZQexSmpCWBfqqRNClg5CB3u4OlcFc8Jr/ThBb0fsYv/vAwR692iw1cu2n
	Hs2izRECmDYai4Beqz8ypMQAMZinBnJZbslzXHY9NHbNbdmS8hXjHpZJrJeVuJnD96KuWweNLvmOA
	d2qymVgce6lCTD9DWzGg6jtAYvvPHeOAU1MDjmq+2V0Vr9ntD6mw9oqBoe2V/GstBNxMGdMxj92GP
	2f/xK0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbCh-0000000CIBH-01oR;
	Thu, 12 Jun 2025 06:14:23 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbAT-0000000CHof-3J9m;
	Thu, 12 Jun 2025 06:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uqsR+yBXJaeE7Gc/RSa8YhyVSpecmvVTUqnfn/mFK0k=; b=C
	cLJrhIVjF8wuN2+QsJ1M6HPkdsCWjG/xaKOhP6mySJWs7itSwCEKfpzaxPPYmU2z
	abGKCLAUZAb6MqeVwYAbmjnbu3LIhs6m+VzFcMBNtBAc0WYI23PimHBp/g6wSUXX
	cc37VpOttrVx/HfAp1WGwvCVZdlABqwEfFReyhHXzA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-106 (Coremail) ; Thu, 12 Jun 2025 14:11:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 12 Jun 2025 14:11:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/rockchip: vop2: fail cleanly if missing a primary
 plane for a video-port
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250610212748.1062375-1-heiko@sntech.de>
References: <20250610212748.1062375-1-heiko@sntech.de>
X-NTES-SC: AL_Qu2fC/ubt04i4SmdZ+kfmkcVgOw9UcO5v/Qk3oZXOJF8jCDp5y4hcHpTPUXy9sWDKyGinQiHTBd1y8NDfahcdIMob9tkaclLAvXdvK0Y9HVFTw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4a19525.4f96.19762c3f163.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aigvCgD3H3Oab0pooEUaAA--.55529W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB9qXmhKaNasWgABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_231206_180645_B10610A5 
X-CRM114-Status: UNSURE (   9.11  )
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

CkhpIEhlaWtv77yMCkF0IDIwMjUtMDYtMTEgMDU6Mjc6NDgsICJIZWlrbyBTdHVlYm5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5FYWNoIHdpbmRvdyBvZiBhIHZvcDIgaXMgdXNhYmxlIGJ5
IGEgc3BlY2lmaWMgc2V0IG9mIHZpZGVvIHBvcnRzLCBzbyB3aGlsZQo+YmluZGluZyB0aGUgdm9w
Miwgd2UgbG9vayB0aHJvdWdoIHRoZSBsaXN0IG9mIGF2YWlsYWJsZSB3aW5kb3dzIHRyeWluZyB0
bwo+ZmluZCBvbmUgZGVzaWduYXRlZCBhcyBwcmltYXJ5LXBsYW5lIGFuZCB1c2FibGUgYnkgdGhh
dCBzcGVjaWZpYyBwb3J0Lgo+Cj5UaGUgY29kZSBsYXRlciB3YW50cyB0byB1c2UgZHJtX2NydGNf
aW5pdF93aXRoX3BsYW5lcyB3aXRoIHRoYXQgZm91bmQKPnByaW1hcnkgcGxhbmUsIGJ1dCBub3Ro
aW5nIGhhcyBjaGVja2VkIHNvIGZhciBpZiBhIHByaW1hcnkgcGxhbmUgd2FzCj5hY3R1YWxseSBm
b3VuZC4KPgo+Rm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIHJrMzU3NiB2cDIgZG9lcyBub3QgaGF2
ZSBhIHVzYWJsZSBwcmltYXJ5IHdpbmRvdwo+KGlmIHZwMCBpcyBhbHNvIGluIHVzZSkgd2hpY2gg
YnJvdWdodCB0aGUgaXNzdWUgdG8gbGlnaHQgYW5kIGVuZGVkIGluIGEKPm51bGwtcG9pbnRlciBk
ZXJlZmVyZW5jZSBmdXJ0aGVyIGRvd24uCj4KPkFzIHdlIGV4cGVjdCBhIHByaW1hcnktcGxhbmUg
dG8gZXhpc3QgZm9yIGEgdmlkZW8tcG9ydCwgYWRkIGEgY2hlY2sgYXQKPnRoZSBlbmQgb2YgdGhl
IHdpbmRvdy1pdGVyYXRpb24gYW5kIGZhaWwgcHJvYmluZyBpZiBub25lIHdhcyBmb3VuZC4KPgo+
Rml4ZXM6IDYwNGJlODU1NDdjZSAoImRybS9yb2NrY2hpcDogQWRkIFZPUDIgZHJpdmVyIikKPlNp
Z25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgpSZXZpZXdlZC1i
eTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKVGhhbmtzCgoKPi0tLQo+IGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgNCArKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+aW5kZXggN2RkZjMxMWIzOGM2Li5hOGRjMmU1NTgxMmEg
MTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
Ywo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPkBA
IC0yNDI1LDYgKzI0MjUsMTAgQEAgc3RhdGljIGludCB2b3AyX2NyZWF0ZV9jcnRjcyhzdHJ1Y3Qg
dm9wMiAqdm9wMikKPiAJCQkJYnJlYWs7Cj4gCQkJfQo+IAkJfQo+Kwo+KwkJaWYgKCF2cC0+cHJp
bWFyeV9wbGFuZSkKPisJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkcm0tPmRldiwgLUVOT0VOVCwK
PisJCQkJCSAgICAgIm5vIHByaW1hcnkgcGxhbmUgZm9yIHZwICVkXG4iLCBpKTsKPiAJfQo+IAo+
IAkvKiBSZWdpc3RlciBhbGwgdW51c2VkIHdpbmRvdyBhcyBvdmVybGF5IHBsYW5lICovCj4tLSAK
PjIuNDcuMgo+Cg==

