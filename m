Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E945C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6+cZeW6Ay55rwOZYOuu9MXLhRXiR355yXRspAsnMRs=; b=A1mRDflXa3227JnztZy7x4POxS
	hCV1ieG/VJl9PuklcvP64VEpuhdYskz9jvWNL5gW+T9NWXsBvl/UXuIFafI2GsFweAMbeK8C5RQuE
	YVN6ZON9j67ra3Vk8ulvVF5uhk9VlSKExQcCfE+wL9GId2ge7IwszJB78ize0lziKxJ7srYJCRpSa
	4k3rjUA+wz4OK+ETfb+Y6QOlwePuR8JjrPk21vEqanjl5SWdwlginfhK8Q51C3gYLO9h7TJLl0fSo
	dKXMH/OeASD3ldeOymLiBK2ouuPf3/0V3DFBGbzXUcZpfro701fmKIz8CchIJ6q+dsR/TiQ/zkCcE
	2Iz99otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaFe-00000004lQU-33It;
	Sun, 16 Aug 2026 12:46:10 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaFb-00000004lPy-3M3C;
	Sun, 16 Aug 2026 12:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=A6+cZeW6Ay55rwOZYOuu9MXLhRXiR355yXRspAsnMRs=; b=U
	1cT3udkpYA3SnlJnYeG1vYVLhQdH4XhnSTnpYeDIMjubliX7a64eIh9KFnzdHBOh
	TbVHYvcmCeCH0y+AaWKOC1DtRKmZ8J36l/aQXQC0QYrKU/UC3oYAAINTN/RvjNMi
	cdUM+d6KL2Iv2zcnxdxChmnPDkRhU4uPQKSPpGmM0U=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:44:36 +0800
 (CST)
X-Originating-IP: [61.154.14.86]
Date: Sun, 16 Aug 2026 20:44:36 +0800 (CST)
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
Subject: Re:[PATCH v11 03/21] drm/bridge: synopsys: dw-dp: Fix error
 handling for DP link enablement
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu0os4CGQZ+kfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXdYYIQ0n+4TP3uodDng6hMg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7d149316.18da.1a00a9a3fe0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD3Pw20sIFqbMcyAA--.26584W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7RRUsmqBsLRnuwAA3s
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_054608_212187_0EC4CFEC 
X-CRM114-Status: UNSURE (   9.95  )
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

CgpIZWxsbyBTZWJhc3RpYW4sCkF0IDIwMjYtMDgtMDcgMDE6MDI6MDksICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ZHdfZHBfbGlu
a19kaXNhYmxlKCkgbWF5IGJlIGNhbGxlZCBpbiBhdG9taWMgbW9kZSBkaXNhYmxlIGV2ZW4gd2hl
bgo+ZHdfZHBfbGlua19lbmFibGUoKSAob3IgYW4gZWFybGllciBzdGVwKSBmYWlsZWQgZHVyaW5n
IGF0b21pYyBtb2RlCj5lbmFibGUgYXMgdGhlcmUgaXMgbm8gZXJyb3IgdHJhY2tpbmcuIFRoaXMg
d291bGQgcmVzdWx0IGluIGJyb2tlbiBQSFkKPnBvd2VyIHN0YXRlLgo+Cj5UaGlzIGlzIGZpeGVk
IGJ5IGludHJvZHVjaW5nIGEgbmV3IGVuYWJsZWQgc3RhdGUgaW4gdGhlIGxpbmsgc3RydWN0dXJl
Cj50byBlbnN1cmUgdGhlIGxpbmsgZGlzYWJsaW5nIG9ubHkgaGFwcGVucyBpZiBpdCBoYXMgYmVl
biBwcm9wZXJseQo+ZW5hYmxlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPlRoZSBwYXRjaCBhbHNv
IGFkZHMgbWlzc2luZyBlcnJvciBoYW5kbGluZyBpbiBkd19kcF9saW5rX2VuYWJsZSgpCj5pdHNl
bGYgdG8gZW5zdXJlIHRoZSBsaW5rIGVuYWJsZW1lbnQgYmVjb21lcyBhbiBhdG9taWMgb3BlcmF0
aW9uLgo+Cj5GaXhlczogODZlZWNjM2E5YzJlICgiZHJtL2JyaWRnZTogc3lub3BzeXM6IEFkZCBE
VyBEUFRYIENvbnRyb2xsZXIgc3VwcG9ydCBsaWJyYXJ5IikKPlJlcG9ydGVkLWJ5OiBTYXNoaWtv
IDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPgoKPlNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWlj
aGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgoKCiAgQWNrZWQtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1kcC5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+IDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IGQ3OTQ1ZjdmZTlmMC4uMjFkNjBlODkxMjZmIDEwMDY0
NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1kcC5jCj4rKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPkBAIC0yODAsNiArMjgwLDcg
QEAgc3RydWN0IGR3X2RwX2xpbmsgewo+IAl1bnNpZ25lZCBjaGFyIHJldmlzaW9uOwo+IAl1bnNp
Z25lZCBpbnQgcmF0ZTsKPiAJdW5zaWduZWQgaW50IGxhbmVzOwo+Kwlib29sIGVuYWJsZWQ7Cj4g
CXU4IHNpbmtfY291bnQ7Cj4gCXU4IHZzY19zZHBfc3VwcG9ydGVkOwo+IAlzdHJ1Y3QgZHdfZHBf
bGlua19jYXBzIGNhcHM7Cj5AQCAtMTYxNSw2ICsxNjE2LDkgQEAgc3RhdGljIHZvaWQgZHdfZHBf
bGlua19kaXNhYmxlKHN0cnVjdCBkd19kcCAqZHApCj4gewo+IAlzdHJ1Y3QgZHdfZHBfbGluayAq
bGluayA9ICZkcC0+bGluazsKPiAKPisJaWYgKCFsaW5rLT5lbmFibGVkKQo+KwkJcmV0dXJuOwo+
Kwo+IAlpZiAoZHdfZHBfaHBkX2RldGVjdChkcCkpCj4gCQlkcm1fZHBfbGlua19wb3dlcl9kb3du
KCZkcC0+YXV4LCBkcC0+bGluay5yZXZpc2lvbik7Cj4gCj5AQCAtMTYyNCw2ICsxNjI4LDcgQEAg
c3RhdGljIHZvaWQgZHdfZHBfbGlua19kaXNhYmxlKHN0cnVjdCBkd19kcCAqZHApCj4gCj4gCWxp
bmstPnRyYWluLmNsb2NrX3JlY292ZXJlZCA9IGZhbHNlOwo+IAlsaW5rLT50cmFpbi5jaGFubmVs
X2VxdWFsaXplZCA9IGZhbHNlOwo+KwlsaW5rLT5lbmFibGVkID0gZmFsc2U7Cj4gfQo+IAo+IHN0
YXRpYyBpbnQgZHdfZHBfbGlua19lbmFibGUoc3RydWN0IGR3X2RwICpkcCkKPkBAIC0xNjM2LDEw
ICsxNjQxLDIyIEBAIHN0YXRpYyBpbnQgZHdfZHBfbGlua19lbmFibGUoc3RydWN0IGR3X2RwICpk
cCkKPiAKPiAJcmV0ID0gZHJtX2RwX2xpbmtfcG93ZXJfdXAoJmRwLT5hdXgsIGRwLT5saW5rLnJl
dmlzaW9uKTsKPiAJaWYgKHJldCA8IDApCj4tCQlyZXR1cm4gcmV0Owo+KwkJZ290byBlcnJfcGh5
X3Bvd2VyX29mZjsKPiAKPiAJcmV0ID0gZHdfZHBfbGlua190cmFpbihkcCk7Cj4rCWlmIChyZXQg
PCAwKQo+KwkJZ290byBlcnJfbGlua19wb3dlcl9kb3duOwo+Kwo+KwlkcC0+bGluay5lbmFibGVk
ID0gdHJ1ZTsKPiAKPisJcmV0dXJuIDA7Cj4rCj4rZXJyX2xpbmtfcG93ZXJfZG93bjoKPisJZHJt
X2RwX2xpbmtfcG93ZXJfZG93bigmZHAtPmF1eCwgZHAtPmxpbmsucmV2aXNpb24pOwo+Kwlkd19k
cF9waHlfeG1pdF9lbmFibGUoZHAsIDApOwo+Kwo+K2Vycl9waHlfcG93ZXJfb2ZmOgo+KwlwaHlf
cG93ZXJfb2ZmKGRwLT5waHkpOwo+IAlyZXR1cm4gcmV0Owo+IH0KPiAKPgo+LS0gCj4yLjUzLjAK
Pgo=

