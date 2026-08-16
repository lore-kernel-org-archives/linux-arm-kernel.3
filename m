Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A3C5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xeSCS2YI1dQ6ACetAfj7iAYg4mVS0nJaQNqMk76rwI=; b=sEdGBqWEdIcIbO2DCF8HPihk3Q
	wpYJFhfzsPoc1vZK09X+c/ZNzr/b4P8vRh90GxxbY3UgCWNLZDtlOFJpNKe+/e/DC9SumPsoh1zhx
	2Ed5FqTKGtZFXl7kjUQo+nv1LkOzQM6uDPaohpe2n+7BawhHviPg8ucfJhvL9rdDlDqIJSkpH1Res
	KNr6rizkaRFk17EBNnJQxCtx/QBnrUS4HiWH4udB8E64gErrd/1s3f2pLyL1ExrOVjhBhh8EtW4am
	MwSB/vsVPB2aHTQImKHp6/hXt8JRjLKSYWPEUqCIaOxCkIMLKtiGNTwIN3tvDfXrrKmuT7XKV0xry
	fImCYwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaI5-00000004lbp-11ra;
	Sun, 16 Aug 2026 12:48:41 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaI1-00000004lbD-3xSu;
	Sun, 16 Aug 2026 12:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=8xeSCS2YI1dQ6ACetAfj7iAYg4mVS0nJaQNqMk76rwI=; b=Z
	KQ6hHDGc16FxYH6VnX3lwlTTuhz0DgAO+EeM40AwbOC2Js57zlbgBw6Vo0DivuYz
	k4idzZ3x6N/dtcZtcKopSFrPcO4ubBfugJ+qjpJtFNqZsTU63XD09qAX0VfI3Ydi
	LV0me+O4eDC/ZxxIadVRsMqsQS1/xlhjiCaVPl2KWo=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:47:08 +0800
 (CST)
X-Originating-IP: [61.154.14.86]
Date: Sun, 16 Aug 2026 20:47:08 +0800 (CST)
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
Subject: Re:[PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu0wp7iadY+kfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXcFtjQ4Frsq6oUGvCHo/TTw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2b761354.18f3.1a00a9c9379.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD3HxNMsYFqiscyAA--.25027W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgx62GqBsUzUMAAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_054838_451926_A724C613 
X-CRM114-Status: UNSURE (   9.79  )
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

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDgtMDcgMDE6MDI6MTAsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+SWYgdGhlIGRy
aXZlciB1c2VzIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKSBp
bnN0ZWFkCj5vZiBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KCkgYW5kIHRodXMgYXV0b21hdGljYWxs
eSBkZWFzc2VydHMgZHVyaW5nCj5wcm9iZSwgdGhlIFNvQyB3aWxsIGhhbmcgd2hlbiB0aGUgZGV2
aWNlIGlzIHVuYm91bmQuCj4KPlRoaXMgZG9lcyBub3QgaGFwcGVuLCB3aGVuIHJ1bnRpbWUgUE0g
aXMgYmVpbmcgdXNlZCAobm90IHlldCBzdXBwb3J0ZWQKPmluIG1haW5saW5lKSwgd2hpY2ggc3Vn
Z2VzdHMgdGhlIHBvd2VyLWRvbWFpbiBpbnZvbHZlZCByZXF1aXJlcyB0aGlzIHJlc2V0Cj5saW5l
IHRvIGJlIGRlYXNzZXJ0ZWQuCj4KPkV2ZW4gd2l0aCBydW50aW1lIFBNIHRoZXJlIGlzIG5vIGd1
cmFudGVlIHRoYXQgdGhlIHBvd2VyLWRvbWFpbiBpcwo+ZGlzYWJsZWQgYXMgaXQgaXMgc2hhcmVk
LiBDb25zaWRlcmluZyB0aGUgcG93ZXItZG9tYWluIGRvZXMgbm90IGhhdmUKPnRoZSByZXNldCBk
ZXBlbmRlbmN5IGRlc2NyaWJlZCBpbiBEVCwgZG9jdW1lbnQgdGhlIHByb2JsZW0gYnV0IGxlYXZl
Cj50aGluZ3MgaW4gdGhlIGN1cnJlbnQgc3RhdGUgdW50aWwgYSBiZXR0ZXIgc29sdXRpb24gaXMg
Zm91bmQgYXMgdGhlCj5yZXNldCBsaW5lIGlzIGRlYXNzZXJ0ZWQgYnkgZGVmYXVsdCBvbiBhbGwg
c3VwcG9ydGVkIHBsYXRmb3Jtcy4KPgo+UmVwb3J0ZWQtYnk6IFNhc2hpa28gPHNhc2hpa28tYm90
QGtlcm5lbC5vcmc+Cj5TaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFu
LnJlaWNoZWxAY29sbGFib3JhLmNvbT4KCiAgIFJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keS55
YW5Acm9jay1jaGlwcy5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWRwLmMgfCA0ICsrKysKPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IDIxZDYwZTg5MTI2Zi4u
NTJlM2IzNzI1OWE2IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMK
PkBAIC0yMDkwLDYgKzIwOTAsMTAgQEAgc3RydWN0IGR3X2RwICpkd19kcF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QgZHdfZHBfcGxhdF8KPiAJCXJldHVy
biBFUlJfQ0FTVChkcC0+aGRjcF9jbGspOwo+IAl9Cj4gCj4rCS8qCj4rCSAqIFRoaXMgcmVzZXQg
bGluZSBpcyBkZWFzc2VydGVkIGJ5IGRlZmF1bHQ7IGFzc2VydGluZyBpdCBoYW5ncyB0aGUgU29D
IGlmIHRoZQo+KwkgKiByZWxhdGVkIHBvd2VyLWRvbWFpbiBpcyBzdGlsbCBhY3RpdmUuCj4rCSAq
Lwo+IAlkcC0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsKPiAJaWYg
KElTX0VSUihkcC0+cnN0YykpIHsKPiAJCWRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRwLT5y
c3RjKSwgImZhaWxlZCB0byBnZXQgcmVzZXQgY29udHJvbFxuIik7Cj4KPi0tIAo+Mi41My4wCg==


