Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BF3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 00:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rWNM+qD+qZAOvGwbeuMLkw3Csee6ucWshMZJqwF6yE=; b=Atq9WC5RrxuN5SzTlynZaUNqn9
	oTubViUxXc/ZQ+lLTTbcLPKJLRwfnACg2Wz7Sj38/itpw29sEBMsv+eMsYpd2jXI6H5HsjoO0txFw
	gmoccZqXaYQA1zRBcF0wQkIqv0AvnGUfxMWw49VXn8vxJN3ZrwVFczTw+IVmez5uVYga0jpmv93Fs
	eH2gcnj3h/PuevzCJdhlYXt3pGup1tEc6FqJ+t4LvkkEj6Fnpcbz/R1clZCImqbpEadrR8c2x2bYh
	kETOoFkkTLBvmkW0idkG1BNGNepD3F/TEAIR+gMm2LWEImAGVBMEt9z/IzfvdGXuKTJtrZQglbZOI
	u2k6rDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZRu-0000000EfPy-2Rwm;
	Fri, 18 Apr 2025 00:19:18 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZQ3-0000000EfJg-2RZK;
	Fri, 18 Apr 2025 00:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ACoMjeqQEK5QbJmghOEEcrUjtymI5asACgjcWs598NQ=; b=O
	KIOo5KHOR64c/8UirzmT5CgdF5UgcdDCpO+iHZkeqW+oIiHSaxkhd8X66jBfmIKL
	49bD6AZ2R5tAtRDB0iI8RSLsk0em5BcxtOK5O8gNFFR+pVs8GhplAsh8/1WZCj73
	0cOsaOPhovHRVT0AKtxSOg1YZpsPW2GWr9Q5r/W4Ic=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Fri, 18 Apr 2025 08:16:11 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 18 Apr 2025 08:16:11 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Daniel Stone" <daniel@fooishbar.org>,
	"Dan Callaghan" <djc@djc.id.au>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250417065759.5948-1-mail@etehtsea.me>
References: <20250414095332.9674-1-mail@etehtsea.me>
 <20250417065759.5948-1-mail@etehtsea.me>
X-NTES-SC: AL_Qu2fBvWYukss5yeaYukfmkcVgOw9UcO5v/Qk3oZXOJF8jDLp/j0HdmVSAWfk9OO0GyOzmgmGQhZw7+16UYtfUYcQ2sF/6GvOriIdCw400ymGgg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgCnzPPLmQFoYdSZAA--.47571W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBQzXmgBloInMwAEsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_171723_918849_1153B3D1 
X-CRM114-Status: GOOD (  10.17  )
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

CgpIaSBLb25zdGFudGluLAoKQXQgMjAyNS0wNC0xNyAxNDo1Nzo1OCwgIktvbnN0YW50aW4gU2hh
YmFub3YiIDxtYWlsQGV0ZWh0c2VhLm1lPiB3cm90ZToKPkFzIGl0IGlzbid0IHN1cHBvcnRlZCBi
eSBoYXJkd2FyZS4gQXQgbGVhc3QsIFJLMzM5OSBkb2Vzbid0IHN1cHBvcnQKPml0LiBGcm9tIHRo
ZSBkYXRhc2hlZXRbMV0KPigiMS4yLjEwIFZpZGVvIElOL09VVCIsICJEaXNwbGF5IEludGVyZmFj
ZSIsIHAuIDE3KToKPgo+ICBTdXBwb3J0IEFGQkMgZnVuY3Rpb24gY28tb3BlcmF0aW9uIHdpdGgg
R1BVCj4gICAgKiBzdXBwb3J0IDI1NjB4MTYwMCBVSQo+Cj5NYW51YWxseSB0ZXN0ZWQgb24gUm9j
a1BybzY0IChyazMzOTkpOgo+LSBBUk1fQUZCQyBtb2RpZmllciBpcyB1c2VkIGZvciAxOTIweDEw
ODAKPi0gRFJNX0ZPUk1BVF9NT0RfTElORUFSIG1vZGlmaWVyIHVzIHVzZWQgZm9yIDM4NDB4MjE2
MAo+LSBObyBub2lzZSBvbiB0aGUgc2NyZWVuIHdoZW4gc3dheSBpcyBydW5uaW5nIGluIDRrCj4t
IER5bmFtaWMgcmVzb2x1dGlvbiBzd2l0Y2hpbmcgd29ya3MgY29ycmVjdGx5IGluIHN3YXkKPgo+
U2lnbmVkLW9mZi1ieTogS29uc3RhbnRpbiBTaGFiYW5vdiA8bWFpbEBldGVodHNlYS5tZT4KPkNj
OiBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29pc2hiYXIub3JnPgo+Q2M6IEFuZHkgWWFuIDxhbmR5
c2hya0AxNjMuY29tPgo+UmVwb3J0ZWQtYnk6IERhbiBDYWxsYWdoYW4gPGRqY0BkamMuaWQuYXU+
Cj5DbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9pc3N1
ZXMvNzk2OAo+Cj5bMV06IGh0dHBzOi8vb3BlbnNvdXJjZS5yb2NrLWNoaXBzLmNvbS9pbWFnZXMv
ZC9kNy9Sb2NrY2hpcF9SSzMzOTlfRGF0YXNoZWV0X1YyLjEtMjAyMDAzMjMucGRmCj4tLS0KPlYz
IC0+IFY0OiBDb3JyZWN0IHJlZHVuZGFudCBoZWFkZXIgaW5jbHVzaW9uCj5WMiAtPiBWMzogUnVu
IGNoZWNrIG9ubHkgb24gcmszMzk5Cj5WMSAtPiBWMjogTW92ZSB0aGUgY2hlY2sgdG8gdGhlIGZi
X2NyZWF0ZSBjYWxsYmFjawo+Cj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV9mYi5jIHwgMTIgKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
ZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwo+aW5kZXgg
ZGNjMWYwNzYzMmMzLi40NWUxNjE5YjVjOTcgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fZmIuYwo+QEAgLTUsNiArNSw3IEBACj4gICovCj4KPiAjaW5jbHVkZSA8
bGludXgva2VybmVsLmg+Cj4rI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4KPiAjaW5jbHVkZSA8ZHJt
L2RybS5oPgo+ICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgo+QEAgLTE4LDYgKzE5LDggQEAK
PiAjaW5jbHVkZSAicm9ja2NoaXBfZHJtX2ZiLmgiCj4gI2luY2x1ZGUgInJvY2tjaGlwX2RybV9n
ZW0uaCIKPgo+KyNkZWZpbmUgUkszMzk5X0FGQkNfTUFYX1dJRFRICQkyNTYwCj4rCj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXJfZnVuY3Mgcm9ja2NoaXBfZHJtX2ZiX2Z1bmNz
ID0gewo+IAkuZGVzdHJveSAgICAgICA9IGRybV9nZW1fZmJfZGVzdHJveSwKPiAJLmNyZWF0ZV9o
YW5kbGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV9oYW5kbGUsCj5AQCAtNTIsNiArNTUsMTUgQEAgcm9j
a2NoaXBfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSwKPiAJfQo+Cj4gCWlmIChkcm1faXNfYWZiYyhtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7
Cj4rCQlpZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJyb2NrY2hpcCxyazMzOTkiKSkgewo+
KwkJCWlmIChtb2RlX2NtZC0+d2lkdGggPiBSSzMzOTlfQUZCQ19NQVhfV0lEVEgpIHsKPisJCQkJ
RFJNX0RFQlVHX0tNUygiQUZCQyBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGUgd2lkdGggJWQgKG1h
eCAlZClcbiIsCj4rCQkJCQkgICAgICBtb2RlX2NtZC0+d2lkdGgsCj4rCQkJCQkgICAgICBSSzMz
OTlfQUZCQ19NQVhfV0lEVEgpOwo+KwkJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPisJCQl9
Owo+KwkJfQo+KwoKCkkgcHJlZmVyIHRoZSBWMSB2ZXJzaW9uIFBBVENIWzBdLiBUaGlzIGlzIGJl
Y2F1c2Ugd2UgZG8gbm90IGRlYWwgd2l0aCBoYXJkd2FyZS1yZWxhdGVkCmRpZmZlcmVuY2VzIGF0
IHRoaXMgbGV2ZWwuICBJdCBpbnZvbHZlcyBhIFZPUC1yZWxhdGVkIHJlc3RyaWN0aW9uIGFuZCB3
ZSBhbHdheXMgIGhhbmRsZQpsaW1pdGlhdGlvbiBsaWtlIHRoaXMgIHdpdGhpbiB0aGUgVk9QIGRy
aXZlciAuIAoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI1MDQwMjEy
NTMyMC4yMTgzNi0xLW1haWxAZXRlaHRzZWEubWUvCgoKPiAJCWludCByZXQsIGk7Cj4KPiAJCXJl
dCA9IGRybV9nZW1fZmJfYWZiY19pbml0KGRldiwgbW9kZV9jbWQsIGFmYmNfZmIpOwo+Cj5iYXNl
LWNvbW1pdDogNDg5MGQ2OGRiNjUxNTYyZWE4MDI1MGYyYzkzMjA1YTVjMDMyN2E2YQo+LS0KPjIu
NDguMQo=

