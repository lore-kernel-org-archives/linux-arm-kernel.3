Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E47EF99E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v5pAbslEMYTGdjdZQDhHSyvhMUMNQICQR+cUdc+GgQ=; b=Avddl1mkdNpPvK9AidL3g3mUgL
	u8KQrnj+pig+5dfTc6Kn2ivxKRb9zSmhx/sGDmct+VYC+YR+l4+/apLDQWDMFg+fvQYqRmE09EBzh
	nG1rSmrOzDEw7D1KQXhjYcrXeDnxQo7x20c8Ng/v9bYVg/RIzFVbQgV1i3VBEm809f+KMxe8J9ZPa
	R2WFNQsYQI6QXG0Y2VqTT4ZhDeSwRS3faCzC24V1cmQBHmq0amyGtsDYhK3iIIBan0moD1kyT4mIW
	TZ3NP6pj4AwV9QGla0cT+B0J0fGww1/yudN8PuTZfRX5TYbFw2QvfJnStvyt1+1sH1Pev59a/0L75
	mwv+nQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAIm-00000004NBI-1wpZ;
	Sat, 14 Feb 2026 07:42:52 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAIj-00000004NAM-08DW;
	Sat, 14 Feb 2026 07:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=+v5pAbslEMYTGdjdZQDhHSyvhMUMNQICQR+cUdc+GgQ=; b=T
	BKEyd/70P5p0XXP5OUHUtm7AZ6I6tqNyhILHrI5l9oDiwXO9E6zlXh8dlH/Q1CgJ
	b0CECQKVUi9zqQqMEF7KLrnKN9dr2BYwQP3p09ofL8ozkJ2SA5YJBUMEhb5aYFMX
	zO75HP4EvO/Pm0dUyQ/gssxxwt/NaUUBdsumlSqklE=
Received: from andyshrk$163.com ( [2409:8a55:33d7:2431:f10b:187b:3f26:ab0c]
 ) by ajax-webmail-wmsvr-40-117 (Coremail) ; Sat, 14 Feb 2026 15:41:12 +0800
 (CST)
X-Originating-IP: [2409:8a55:33d7:2431:f10b:187b:3f26:ab0c]
Date: Sat, 14 Feb 2026 15:41:12 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Louis Chauvet" <louis.chauvet@bootlin.com>,
	"Haneen Mohammed" <hamohammed.sa@gmail.com>,
	"Melissa Wen" <melissa.srw@gmail.com>,
	"Jani Nikula" <jani.nikula@linux.intel.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Robert Mader" <robert.mader@collabora.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	"Diederik de Haas" <diederik@cknow-tech.com>
Subject: Re:[PATCH v7 4/4] drm/rockchip: vop2: Support setting custom
 background color
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260204-rk3588-bgcolor-v7-4-78d1d01c5ca1@collabora.com>
References: <20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com>
 <20260204-rk3588-bgcolor-v7-4-78d1d01c5ca1@collabora.com>
X-CM-CTRLMSGS: 0xem7nBsdXM9MTc3MTA1NDg3MzAxOV9mMzIxMGMxZjQ2NDU5YTk3OTJhOTllM
 jYyODkxNTJkNg==
X-NTES-SC: AL_Qu2cA/yeu0As5CiZZ+kfmUgWjuw/WsG1v/Ul1YBSP556jD/p5wAhYnlFJHL90dOvNj6tnyiuTwJi+sdlbbJff74t27OnGnXYj8g71xfaPiVNkQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7d35324b.1f93.19c5b18b8f6.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgB3p7oYJ5BpAj4oAA--.41162W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hhOrGmQJxgIRwAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_234249_472931_83614BD3 
X-CRM114-Status: UNSURE (   8.85  )
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

CkhlbGxvIENyaXN0aWFuLAoKQXQgMjAyNi0wMi0wNSAwNDowMjozMSwgIkNyaXN0aWFuIENpb2Nh
bHRlYSIgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPlRoZSBSb2Nr
Y2hpcCBWT1AyIGRpc3BsYXkgY29udHJvbGxlciBhbGxvd3MgY29uZmlndXJpbmcgdGhlIGJhY2tn
cm91bmQKPmNvbG9yIG9mIGVhY2ggdmlkZW8gb3V0cHV0IHBvcnQuCj4KPlNpbmNlIGEgcHJldmlv
dXMgcGF0Y2ggaW50cm9kdWNlZCB0aGUgQkFDS0dST1VORF9DT0xPUiBDUlRDIHByb3BlcnR5LAo+
d2hpY2ggZGVmYXVsdHMgdG8gc29saWQgYmxhY2ssIG1ha2UgdXNlIG9mIGl0IHdoZW4gcHJvZ3Jh
bW1pbmcgdGhlCj5oYXJkd2FyZS4KPgo+Tm90ZSB0aGUgbWF4aW11bSBwcmVjaXNpb24gYWxsb3dl
ZCBieSB0aGUgZGlzcGxheSBjb250cm9sbGVyIGlzIDEwYnBjLAo+d2hpbGUgdGhlIGFscGhhIGNv
bXBvbmVudCBpcyBub3Qgc3VwcG9ydGVkLCBoZW5jZSBpZ25vcmVkLgo+Cj5UZXN0ZWQtYnk6IERp
ZWRlcmlrIGRlIEhhYXMgPGRpZWRlcmlrQGNrbm93LXRlY2guY29tPgo+U2lnbmVkLW9mZi1ieTog
Q3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4KCiAg
IFJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMTcgKysrKysrKysrKysrKysr
Ky0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuaCB8ICA0ICsr
KysKPiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IGVj
M2I0ZmRlMTBkYi4uOGYyMmU5MGEyM2RkIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5AQCAtMTU1Miw2ICsxNTUyLDcgQEAgc3RhdGljIHZvaWQg
dm9wMl9wb3N0X2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gCXN0cnVjdCB2b3AyX3Zp
ZGVvX3BvcnQgKnZwID0gdG9fdm9wMl92aWRlb19wb3J0KGNydGMpOwo+IAlzdHJ1Y3Qgdm9wMiAq
dm9wMiA9IHZwLT52b3AyOwo+IAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9ICZjcnRj
LT5zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKPisJdTY0IGJnY29sb3IgPSBjcnRjLT5zdGF0ZS0+YmFj
a2dyb3VuZF9jb2xvcjsKPiAJdTE2IHZ0b3RhbCA9IG1vZGUtPmNydGNfdnRvdGFsOwo+IAl1MTYg
aGRpc3BsYXkgPSBtb2RlLT5jcnRjX2hkaXNwbGF5Owo+IAl1MTYgaGFjdF9zdCA9IG1vZGUtPmNy
dGNfaHRvdGFsIC0gbW9kZS0+Y3J0Y19oc3luY19zdGFydDsKPkBAIC0xNTk3LDcgKzE1OTgsMTUg
QEAgc3RhdGljIHZvaWQgdm9wMl9wb3N0X2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4g
CQl2b3AyX3ZwX3dyaXRlKHZwLCBSSzM1NjhfVlBfUE9TVF9EU1BfVkFDVF9JTkZPX0YxLCB2YWwp
Owo+IAl9Cj4gCj4tCXZvcDJfdnBfd3JpdGUodnAsIFJLMzU2OF9WUF9EU1BfQkcsIDApOwo+Kwkv
Kgo+KwkgKiBCYWNrZ3JvdW5kIGNvbG9yIGlzIHByb2dyYW1tZWQgd2l0aCAxMCBiaXRzIG9mIHBy
ZWNpc2lvbi4KPisJICogU2luY2UgcGVyZm9ybWFuY2UgaXMgbW9yZSBpbXBvcnRhbnQgdGhhbiBh
Y2N1cmFjeSBoZXJlLAo+KwkgKiBtYWtlIHVzZSBvZiB0aGUgRFJNX0FSR0I2NF9HRVQqX0JQQ1Mo
KSBoZWxwZXJzLgo+KwkgKi8KPisJdmFsID0gRklFTERfUFJFUChSSzM1NjhfVlBfRFNQX0JHX19E
U1BfQkdfUkVELCBEUk1fQVJHQjY0X0dFVFJfQlBDUyhiZ2NvbG9yLCAxMCkpOwo+KwlGSUVMRF9N
T0RJRlkoUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JHX0dSRUVOLCAmdmFsLCBEUk1fQVJHQjY0X0dF
VEdfQlBDUyhiZ2NvbG9yLCAxMCkpOwo+KwlGSUVMRF9NT0RJRlkoUkszNTY4X1ZQX0RTUF9CR19f
RFNQX0JHX0JMVUUsICZ2YWwsIERSTV9BUkdCNjRfR0VUQl9CUENTKGJnY29sb3IsIDEwKSk7Cj4r
CXZvcDJfdnBfd3JpdGUodnAsIFJLMzU2OF9WUF9EU1BfQkcsIHZhbCk7Cj4gfQo+IAo+IHN0YXRp
YyBpbnQgdXNfdG9fdmVydGljYWxfbGluZShzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwg
aW50IHVzKQo+QEAgLTE5ODMsNiArMTk5MiwxMCBAQCBzdGF0aWMgaW50IHZvcDJfY3J0Y19zdGF0
ZV9kdW1wKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IHNlcV9maWxlICpzKQo+IAkJICAg
ZHJtX2dldF9idXNfZm9ybWF0X25hbWUodmNzdGF0ZS0+YnVzX2Zvcm1hdCkpOwo+IAlzZXFfcHJp
bnRmKHMsICJcdG91dHB1dF9tb2RlWyV4XSIsIHZjc3RhdGUtPm91dHB1dF9tb2RlKTsKPiAJc2Vx
X3ByaW50ZihzLCAiIGNvbG9yX3NwYWNlWyVkXVxuIiwgdmNzdGF0ZS0+Y29sb3Jfc3BhY2UpOwo+
KwlzZXFfcHJpbnRmKHMsICJcdGJhY2tncm91bmQgY29sb3IgKDEwYnBjKTogcj0weCV4IGc9MHgl
eCBiPTB4JXhcbiIsCj4rCQkgICBEUk1fQVJHQjY0X0dFVFJfQlBDUyhjc3RhdGUtPmJhY2tncm91
bmRfY29sb3IsIDEwKSwKPisJCSAgIERSTV9BUkdCNjRfR0VUR19CUENTKGNzdGF0ZS0+YmFja2dy
b3VuZF9jb2xvciwgMTApLAo+KwkJICAgRFJNX0FSR0I2NF9HRVRCX0JQQ1MoY3N0YXRlLT5iYWNr
Z3JvdW5kX2NvbG9yLCAxMCkpOwo+IAlzZXFfcHJpbnRmKHMsICIgICAgRGlzcGxheSBtb2RlOiAl
ZHglZCVzJWRcbiIsCj4gCQkgICBtb2RlLT5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXksIGludGVy
bGFjZWQgPyAiaSIgOiAicCIsCj4gCQkgICBkcm1fbW9kZV92cmVmcmVzaChtb2RlKSk7Cj5AQCAt
MjQ3Miw2ICsyNDg1LDggQEAgc3RhdGljIGludCB2b3AyX2NyZWF0ZV9jcnRjcyhzdHJ1Y3Qgdm9w
MiAqdm9wMikKPiAJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkcm0tPmRldiwgcmV0LAo+IAkJCQkJ
ICAgICAiY3J0YyBpbml0IGZvciB2aWRlb19wb3J0JWQgZmFpbGVkXG4iLCBpKTsKPiAKPisJCWRy
bV9jcnRjX2F0dGFjaF9iYWNrZ3JvdW5kX2NvbG9yX3Byb3BlcnR5KCZ2cC0+Y3J0Yyk7Cj4rCj4g
CQlkcm1fY3J0Y19oZWxwZXJfYWRkKCZ2cC0+Y3J0YywgJnZvcDJfY3J0Y19oZWxwZXJfZnVuY3Mp
Owo+IAkJaWYgKHZvcDItPmx1dF9yZWdzKSB7Cj4gCQkJY29uc3Qgc3RydWN0IHZvcDJfdmlkZW9f
cG9ydF9kYXRhICp2cF9kYXRhID0gJnZvcDJfZGF0YS0+dnBbdnAtPmlkXTsKPmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuaCBiL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5oCj5pbmRleCA5MTI0MTkxODk5YmEu
LjM3NzIyNjUyODQ0YSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fdm9wMi5oCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcDIuaAo+QEAgLTY1OCw2ICs2NTgsMTAgQEAgZW51bSBkc3RfZmFjdG9yX21vZGUgewo+
ICNkZWZpbmUgUkszNTg4X1ZQX0NMS19DVFJMX19EQ0xLX09VVF9ESVYJCUdFTk1BU0soMywgMikK
PiAjZGVmaW5lIFJLMzU4OF9WUF9DTEtfQ1RSTF9fRENMS19DT1JFX0RJVgkJR0VOTUFTSygxLCAw
KQo+IAo+KyNkZWZpbmUgUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JHX1JFRAkJCUdFTk1BU0soMjks
IDIwKQo+KyNkZWZpbmUgUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JHX0dSRUVOCQkJR0VOTUFTSygx
OSwgMTApCj4rI2RlZmluZSBSSzM1NjhfVlBfRFNQX0JHX19EU1BfQkdfQkxVRQkJCUdFTk1BU0so
OSwgMCkKPisKPiAjZGVmaW5lIFJLMzU2OF9WUF9QT1NUX1NDTF9DVFJMX19WU0NBTEVET1dOCQlC
SVQoMSkKPiAjZGVmaW5lIFJLMzU2OF9WUF9QT1NUX1NDTF9DVFJMX19IU0NBTEVET1dOCQlCSVQo
MCkKPiAKPgo+LS0gCj4yLjUyLjAKPgo=

