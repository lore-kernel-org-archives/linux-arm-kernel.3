Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF07C5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYN9LRzk6AV2CA6a7a1Oc5KBaqRi4PQJ0B/IiSbloaY=; b=d2R6wCeEQhv74QHGIKf4ZxGDZH
	FwaD9+AEBYtUy9RTD/4hWnBbiLftmEsPMrBsIfLoCIz+Yt9qJQralbp1DQQNHU6dPNkfp01RqTN7B
	0L95rqXyehZrCNjzhPawfr/29HiQgjiP+gHB7ei4Owao88pvAyHZPZ6sA0tE+8yokO2wNc743AY8l
	rVuYCImcFR1dAGpMkRplOGZ/OxnA26FwVLTS+qh9QMnnmHklb+Ts1LcmDpeO6kdyoAC5AWdeQzPXl
	TJXyMqK2Hs/k+DwC1ffIvyd91UclYUSDGiLHm1TFYOKmiGN/3RWLqzUIJhiVgtLGRtpO+b65DvNMF
	HpMMbjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaNI-00000004m1Z-1oO4;
	Sun, 16 Aug 2026 12:54:04 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaNE-00000004m0w-3n8k;
	Sun, 16 Aug 2026 12:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=jYN9LRzk6AV2CA6a7a1Oc5KBaqRi4PQJ0B/IiSbloaY=; b=V
	VkqwpYfOmt+eMyX0o1kRFn6BvxVl/rbbORD+O3yp9rvwv33llxj098bmqFAq6HRA
	r0jT4/w2l/AYpMnMo21VKXFIlLezdhTemok7cwMRoaGqWBwWcHg+kZb/b9GMyEAA
	T00JEPUhNDVQ+4M4++p6YFSDcjjfw0K8azyy9x8YKk=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:52:34 +0800
 (CST)
X-Originating-IP: [61.154.14.86]
Date: Sun, 16 Aug 2026 20:52:34 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Luca Ceresoli" <luca.ceresoli@bootlin.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	"Damon Ding" <damon.ding@rock-chips.com>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Alexey Charkov" <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re:[PATCH v11 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-6-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-6-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu08u4iGQZ+kfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXRa0mD8JbhNsB4mOL9YJNVA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2db27b91.1922.1a00aa18b0d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD3dwqSsoFquscyAA--.25143W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhLLKmqBspLp6wAA38
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_055401_370907_49B21956 
X-CRM114-Status: UNSURE (   9.50  )
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

CgpIZWxsbyBTZWJhc3RpYW4sCgpBdCAyMDI2LTA4LTA3IDAxOjAyOjEyLCAiU2ViYXN0aWFuIFJl
aWNoZWwiIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPlRoZSBEUCBB
VVggdHJhbnNmZXIgbWV0aG9kIHVzZXMgYSBjb21wbGV0aW9uIHRyaWdnZXJlZCBieSBhbiBpbnRl
cnJ1cHQsCj53aGljaCBjYW4gdGltZW91dC4gSWYgdGhlIGZ1bmN0aW9uIHJ1bnMgaW50byB0aGUg
dGltZW91dCBhbmQgdGhlCj5pbnRlcnJ1cHQgZmlyZXMgYWZ0ZXJ3YXJkcywgdGhlIGZvbGxvd2lu
ZyBEUCBhdXggdHJhbnNmZXIgY29tcGxldGlvbgo+d291bGQgdHJpZ2dlciBpbW1lZGlhdGVseSB3
aXRob3V0IHdhaXRpbmcgZm9yIHRoZSBpbnRlcnJ1cHQuIFRoaXMgaW4KPnR1cm4gbWVhbnMgdGhl
IG5leHQgb25lIHdvdWxkIGFsc28gYmUgYnJva2VuIGFuZCBzbyBvbi4KPgo+Rml4IHRoaXMgcG90
ZW50aWFsIGlzc3VlIGJ5IHJlLWluaXRpYWxpemluZyB0aGUgY29tcGxldGlvbiBkaXJlY3RseQo+
YmVmb3JlIHNlbmRpbmcgdGhlIEFVWCBjb21tYW5kLgo+Cj5BcyB0aGlzIGlzIHJhY3kgKHRoZSBp
bnRlcnJ1cHQgbWlnaHQgYXJyaXZlIGJldHdlZW4gdGhlIGNvbXBsZXRpb24KPnJlLWluaXQgYW5k
IHRoZSBuZXcgY29tbWFuZCBiZWluZyBwcm9ncmFtbWVkKSwgYWxzbyByZXNldCB0aGUgQVVYCj5j
b250cm9sbGVyIG9uIHRpbWVvdXRzIGFuZCBzeW5jaHJvbml6ZSBwZW5kaW5nIGludGVycnVwdHMg
dG8gZ3VyYW50ZWUKClR5cG86IHMvZ3VyYW50ZWUvZ3VhcmFudGVlCgoKPnRoYXQgdGhlcmUgYXJl
IG5vIHBlbmRpbmcgQVVYIHRyYW5zZmVycyB3aGVuIHRoZSBkd19kcF9hdXhfdHJhbnNmZXIoKQo+
cmV0dXJucy4KPgo+RHVlIHRvIGxhY2sgb2YgYSBzaW5rLCB3aGljaCBnZW5lcmF0ZXMgQVVYIHRp
bWVvdXRzLCB0aGlzIGNoYW5nZSBpcwo+ZWZmZWN0aXZlbHkgdW50ZXN0ZWQuCj4KPlJlcG9ydGVk
LWJ5OiBTYXNoaWtvIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPgo+Rml4ZXM6IDg2ZWVjYzNhOWMy
ZSAoImRybS9icmlkZ2U6IHN5bm9wc3lzOiBBZGQgRFcgRFBUWCBDb250cm9sbGVyIHN1cHBvcnQg
bGlicmFyeSIpCj5TaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJl
aWNoZWxAY29sbGFib3JhLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctZHAuYyB8IDggKysrKysrKysKPiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IGIxODU2NDE4
ZjQ0MS4uMjU3M2VhMmJiNTc0IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWRwLmMKPkBAIC0xNDY2LDYgKzE0NjYsOCBAQCBzdGF0aWMgc3NpemVfdCBkd19kcF9hdXhfdHJh
bnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKPiAJaWYgKFdBUk5fT04obXNnLT5zaXplID4g
MTYpKQo+IAkJcmV0dXJuIC1FMkJJRzsKPiAKPisJcmVpbml0X2NvbXBsZXRpb24oJmRwLT5jb21w
bGV0ZSk7Cj4rCj4gCXN3aXRjaCAobXNnLT5yZXF1ZXN0ICYgfkRQX0FVWF9JMkNfTU9UKSB7Cj4g
CWNhc2UgRFBfQVVYX05BVElWRV9XUklURToKPiAJY2FzZSBEUF9BVVhfSTJDX1dSSVRFOgo+QEAg
LTE0OTIsNiArMTQ5NCwxMiBAQCBzdGF0aWMgc3NpemVfdCBkd19kcF9hdXhfdHJhbnNmZXIoc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwKPiAJc3RhdHVzID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1l
b3V0KCZkcC0+Y29tcGxldGUsIHRpbWVvdXQpOwo+IAlpZiAoIXN0YXR1cykgewo+IAkJZGV2X2Vy
cihkcC0+ZGV2LCAidGltZW91dCB3YWl0aW5nIGZvciBBVVggcmVwbHlcbiIpOwo+KwkJcmVnbWFw
X3VwZGF0ZV9iaXRzKGRwLT5yZWdtYXAsIERXX0RQX1NPRlRfUkVTRVRfQ1RSTCwKPisJCQkJICAg
QVVYX1JFU0VULCBGSUVMRF9QUkVQKEFVWF9SRVNFVCwgMSkpOwo+KwkJdXNsZWVwX3JhbmdlKDEw
LCAyMCk7Cj4rCQlyZWdtYXBfdXBkYXRlX2JpdHMoZHAtPnJlZ21hcCwgRFdfRFBfU09GVF9SRVNF
VF9DVFJMLAo+KwkJCQkgICBBVVhfUkVTRVQsIEZJRUxEX1BSRVAoQVVYX1JFU0VULCAwKSk7Cj4r
CQlzeW5jaHJvbml6ZV9pcnEoZHAtPmlycSk7Cj4gCQlyZXR1cm4gLUVUSU1FRE9VVDsKPiAJfQo+
IAo+Cj4tLSAKPjIuNTMuMAo+Cg==

