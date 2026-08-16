Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251FAC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLOs8/Cq1hY4p3GUBLBBD+0bp3Z46zJBwR56Gx9TMjs=; b=c5etWixhE+iHdbugwe1rDtN9q5
	J8bRm1zbMP/OMZ3tzUH1WB8MiaxsY/QwL+J+5G0X80ebIoDOTa0hSHo3M3RLOCwRDeDJN9ZjMXREO
	6+IxpZtkvYPlST9KMdAQOBGa3BXBRJ/m0T4c0ZnjlVIKeQuZC7GBBw5BCL4RAph3BYL2+moTVRGkE
	MNWJvb8Fp9iUs7zF+2ho+GRScDetL4N656i6b/cvtZb7/YwVoBH9VVp9nNoto6ICUI7taFj3m9C9U
	qcCEga8sfMT2QU+xn18g8rlf7fdBnEnoP3HNW3c02TmYDP9/tEot6yJbjLH7jHm+3YK/iGl0V+2lq
	NblG526g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaJj-00000004lkB-2ugd;
	Sun, 16 Aug 2026 12:50:23 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaJh-00000004ljf-0dfu;
	Sun, 16 Aug 2026 12:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vLOs8/Cq1hY4p3GUBLBBD+0bp3Z46zJBwR56Gx9TMjs=; b=j
	BMk5qmfKwRIXscCZbmHieCZOk6SXtO+r/9McydOhsctfTSANtbPUBq77zGaSZmid
	eUiAxNv1DxN2jHphc0FPSu+WqIIaU7YVbGN7mpPGDYXjEbwo0QGCYsqgrb9bUIYj
	6SCql/6pvtTlcIHwBpI/h+o4ozX59uh2WwjtIOdPXo=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:49:01 +0800
 (CST)
X-Originating-IP: [61.154.14.86]
Date: Sun, 16 Aug 2026 20:49:01 +0800 (CST)
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
	"Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	"Dmitry Baryshkov" <lumag@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	"Alexey Charkov" <alchark@flipper.net>,
	linux-rockchip@lists.infradead.org,
	"Damon Ding" <damon.ding@rock-chips.com>,
	Sashiko <sashiko-bot@kernel.org>, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re:[PATCH v11 05/21] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-5-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-5-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu00v5yWRZOkfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXpuotpAjslLbAL7XqfVDlCw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4b076889.1900.1a00a9e4c9f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD310G9sYFqmMcyAA--.24943W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7R2W9GqBsb16fwAA3w
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_055021_538714_B06BE69E 
X-CRM114-Status: UNSURE (   6.37  )
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

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDgtMDcgMDE6MDI6MTEsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+VGhlIGRyaXZl
ciBpcyBjdXJyZW50bHkgbWlzc2luZyB0byBmdWxseSBjbGVhbiB1cCBhZnRlciBpdHNlbGYuIEVu
c3VyZQo+dGhhdCB0aGUgbXV0ZXggaXMgY2xlYW5lZCB1cC4KPgo+Rml4ZXM6IDg2ZWVjYzNhOWMy
ZSAoImRybS9icmlkZ2U6IHN5bm9wc3lzOiBBZGQgRFcgRFBUWCBDb250cm9sbGVyIHN1cHBvcnQg
bGlicmFyeSIpCj5SZXBvcnRlZC1ieTogU2FzaGlrbyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4K
PlNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xs
YWJvcmEuY29tPgoKICAgUmV2aWV3ZWQtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBz
LmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyB8IDUg
KysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IDUyZTNiMzcyNTlh
Ni4uYjE4NTY0MThmNDQxIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRw
LmMKPkBAIC0yMDQwLDEwICsyMDQwLDEzIEBAIHN0cnVjdCBkd19kcCAqZHdfZHBfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgY29uc3Qgc3RydWN0IGR3X2RwX3BsYXRfCj4gCWRw
LT5waXhlbF9tb2RlID0gcGxhdF9kYXRhLT5waXhlbF9tb2RlOwo+IAlkcC0+cGxhdF9kYXRhLm1h
eF9saW5rX3JhdGUgPSBwbGF0X2RhdGEtPm1heF9saW5rX3JhdGU7Cj4gCj4tCW11dGV4X2luaXQo
JmRwLT5pcnFfbG9jayk7Cj4gCUlOSVRfV09SSygmZHAtPmhwZF93b3JrLCBkd19kcF9ocGRfd29y
ayk7Cj4gCWluaXRfY29tcGxldGlvbigmZHAtPmNvbXBsZXRlKTsKPiAKPisJcmV0ID0gZGV2bV9t
dXRleF9pbml0KGRldiwgJmRwLT5pcnFfbG9jayk7Cj4rCWlmIChyZXQpCj4rCQlyZXR1cm4gRVJS
X1BUUihyZXQpOwo+Kwo+IAlyZXMgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRl
diwgMCk7Cj4gCWlmIChJU19FUlIocmVzKSkKPiAJCXJldHVybiBFUlJfQ0FTVChyZXMpOwo+Cj4t
LSAKPjIuNTMuMAo+Cj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPkxpbnV4LXJvY2tjaGlwQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcm9ja2NoaXAK

