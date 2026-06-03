Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46420CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSxM2lCcoRcWoRnJum7ophYHxt88SInRwqEVIpSnFYw=; b=xlqeOXQLFxfF3n5DzG7VC4bK89
	ADIOk77rDBJAkn+/cLtWVPjWG8tQTdUHnTN1hrXrN9qs92Mi/HigfxWnTh52M1CLBk8waCGEYwrGm
	TWfAisy9NFdqez9desVp5k11NsZhPZWnyW4IcEyeX1+K6719YuP6hQIfmKPxCR2LdvakELrms7XXS
	PGO5ha4CiTWIKRoQW9/RF1x41jMWOzzA/WhMZfgW72/Pr40O/DDtfhYoZkUwVbAYNWoyb/i95oEa1
	m5M0NZ2YLPw2RYuhDDK/XZtmJBbJLd1Y7GKB9wGm5iCA1gTzRBvTmGE5JgYygSNbbybztpeqyoeUC
	AjJY8qZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHW-0000000F7AW-49AC;
	Wed, 03 Jun 2026 13:05:14 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHU-0000000F79q-0eUv;
	Wed, 03 Jun 2026 13:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FSxM2lCcoRcWoRnJum7ophYHxt88SInRwqEVIpSnFYw=; b=g
	jQZqIBQtbqi5QhDUOk0S9x8CsYKjnhTcwhypPhxUChGysdlZQBvUuzQnRDhH39bE
	EeJ1QlJpns/lszV2pRezmXn2/w8TTMDA5oR7fxE+RcrIFzKren7MTHAKJVc0TDzi
	x11vNv2MlsxuXcKcO2/Joq43S3YQgHGbwatB9cf1CU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Wed, 3 Jun 2026 21:03:44 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 3 Jun 2026 21:03:44 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Luca Ceresoli" <luca.ceresoli@bootlin.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v4 3/3] drm/rockchip: dw_dp: Release core resources
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260601-drm-rk-fixes-v4-3-c3f3f123e1da@collabora.com>
References: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
 <20260601-drm-rk-fixes-v4-3-c3f3f123e1da@collabora.com>
X-CM-CTRLMSGS: 1KSxpHBsdXM9MTc4MDQ5MTgyNDM4OF8zZmFhZTRhMWVhMzRhNWQ0YTc5NDcxN
 TUyYjJhMDQyMQ==
X-NTES-SC: AL_Qu2TAviSvkAp4iWfYukfmUgWjuw/WsG1v/Ul1YBSP556jDLp4yQsdlhFB13k6v+RMTGlqAieVTxg0OFXWa1WfaYtKsyT5fxGL2QDWrlTpZsrFg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1f9bf6c3.a5dd.19e8d952dc9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgDHT+cwJiBqhMQBAA--.16781W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRA4lmogJjAMDAAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060512_582067_C0BB9012 
X-CRM114-Status: UNSURE (   9.14  )
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

CkhlbGxvIENyaXN0aWFu77yMCgpBdCAyMDI2LTA2LTAyIDAwOjEzOjQ2LCAiQ3Jpc3RpYW4gQ2lv
Y2FsdGVhIiA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Q29yZSBy
ZXNvdXJjZXMgc3VjaCBhcyB0aGUgRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgZ2V0IGluaXRpYWxp
emVkIGFuZAo+cmVnaXN0ZXJlZCBkdXJpbmcgZHdfZHBfYmluZCgpLCBidXQgYXJlIG5ldmVyIHVu
cmVnaXN0ZXJlZCwgd2hpY2ggbWF5Cj5sZWFkIHRvIG1lbW9yeSBsZWFrcyBhbmQvb3IgdXNlLWFm
dGVyLWZyZWU6Cj4KPlsgIDIyNC42NjEzNzFdIEJVRzogS0FTQU46IHNsYWItdXNlLWFmdGVyLWZy
ZWUgaW4gZGV2aWNlX2lzX2RlcGVuZGVudCsweGUwLzB4MmIwCj5bICAyMjQuNjYyMDE1XSBSZWFk
IG9mIHNpemUgOCBhdCBhZGRyIGZmZmYwMDAxMWFlZTg1NTAgYnkgdGFzayBtb2Rwcm9iZS82NTgK
PlsgIDIyNC42NjI2MTJdCj5bICAyMjQuNjYyNzUyXSBDUFU6IDcgVUlEOiAwIFBJRDogNjU4IENv
bW06IG1vZHByb2JlIE5vdCB0YWludGVkIDcuMC4wLXJjMi1uZXh0LTIwMjYwMzA1ICMxNCBQUkVF
TVBUCj5bICAyMjQuNjYyNzU5XSBIYXJkd2FyZSBuYW1lOiBSYWR4YSBST0NLIDVCIChEVCkKPlsg
IDIyNC42NjI3NjJdIENhbGwgdHJhY2U6Cj5bICAyMjQuNjYyNzY0XSAgc2hvd19zdGFjaysweDIw
LzB4MzggKEMpCj5bICAyMjQuNjYyNzcyXSAgZHVtcF9zdGFja19sdmwrMHg2Yy8weDk4Cj5bICAy
MjQuNjYyNzc3XSAgcHJpbnRfcmVwb3J0KzB4MTYwLzB4NGI4Cj5bICAyMjQuNjYyNzgzXSAga2Fz
YW5fcmVwb3J0KzB4YjQvMHhlMAo+WyAgMjI0LjY2Mjc5MF0gIF9fYXNhbl9yZXBvcnRfbG9hZDhf
bm9hYm9ydCsweDIwLzB4MzAKPlsgIDIyNC42NjI3OTZdICBkZXZpY2VfaXNfZGVwZW5kZW50KzB4
ZTAvMHgyYjAKPlsgIDIyNC42NjI4MDJdICBkZXZpY2VfaXNfZGVwZW5kZW50KzB4MTA4LzB4MmIw
Cj5bICAyMjQuNjYyODA4XSAgZGV2aWNlX2xpbmtfYWRkKzB4MWY4LzB4MTBiMAo+WyAgMjI0LjY2
MjgxM10gIGRldm1fb2ZfcGh5X2dldF9ieV9pbmRleCsweDEyMC8weDIwMAo+WyAgMjI0LjY2Mjgx
OV0gIGR3X2RwX2JpbmQrMHgzNGMvMHhiMTAgW2R3X2RwXQo+WyAgMjI0LjY2MjgzMF0gIGR3X2Rw
X3JvY2tjaGlwX2JpbmQrMHgxOTQvMHgyNTAgW3JvY2tjaGlwZHJtXQo+WyAgMjI0LjY2Mjg2NF0g
IGNvbXBvbmVudF9iaW5kX2FsbCsweDNhOC8weDcyMAo+WyAgMjI0LjY2Mjg2OV0gIHJvY2tjaGlw
X2RybV9iaW5kKzB4MTIwLzB4MzkwIFtyb2NrY2hpcGRybV0KPlsgIDIyNC42NjI4OTldICB0cnlf
dG9fYnJpbmdfdXBfYWdncmVnYXRlX2RldmljZSsweDc2Yy8weDgzOAo+WyAgMjI0LjY2MjkwNF0g
IGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2grMHgxZjQvMHgyMzAKPlsgIDIyNC42NjI5
MDldICByb2NrY2hpcF9kcm1fcGxhdGZvcm1fcHJvYmUrMHg0MjAvMHg1MzggW3JvY2tjaGlwZHJt
XQo+WyAgMjI0LjY2MjkzOV0gIHBsYXRmb3JtX3Byb2JlKzB4ZTgvMHgxNjgKPlsgIDIyNC42NjI5
NDVdICByZWFsbHlfcHJvYmUrMHgzNDAvMHg4MjgKPlsgIDIyNC42NjI5NTBdICBfX2RyaXZlcl9w
cm9iZV9kZXZpY2UrMHgyZTAvMHgzNTAKPlsgIDIyNC42NjI5NTRdICBkcml2ZXJfcHJvYmVfZGV2
aWNlKzB4ODAvMHgxNDAKPlsgIDIyNC42NjI5NTldICBfX2RyaXZlcl9hdHRhY2grMHgzOTgvMHg0
NjAKPlsgIDIyNC42NjI5NjRdICBidXNfZm9yX2VhY2hfZGV2KzB4ZTAvMHgxOTgKPlsgIDIyNC42
NjI5NjhdICBkcml2ZXJfYXR0YWNoKzB4NTAvMHg2OAo+WyAgMjI0LjY2Mjk3Ml0gIGJ1c19hZGRf
ZHJpdmVyKzB4MmEwLzB4NGMwCj5bICAyMjQuNjYyOTc3XSAgZHJpdmVyX3JlZ2lzdGVyKzB4Mjk0
LzB4MzYwCj5bICAyMjQuNjYyOTgyXSAgX19wbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIrMHg3Yy8w
eDk4Cj5bICAyMjQuNjYyOTg3XSAgcm9ja2NoaXBfZHJtX2luaXQrMHhjNC8weGZmOCBbcm9ja2No
aXBkcm1dCj4KPlNpbmNlIGEgcHJldmlvdXMgY29tbWl0IGV4cG9ydGVkIGR3X2RwX3VuYmluZCgp
IGZ1bmN0aW9uIGluIERXIERQIGNvcmUKPmxpYnJhcnkgdG8gdGFrZSBjYXJlIG9mIHRoZSBuZWNl
c3NhcnkgY2xlYW51cCwgdXNlIHRoaXMgaW4gdGhlCj5jb21wb25lbnQncyB1bmJpbmQoKSBjYWxs
YmFjaywgYXMgd2VsbCBhcyBpbiBpdHMgYmluZCgpIGVycm9yIHBhdGguCj4KPkZpeGVzOiBkNjhi
YTdiYWM5NTUgKCJkcm0vcm9ja2NoaXA6IEFkZCBSSzM1ODggRFBUWCBvdXRwdXQgc3VwcG9ydCIp
Cj5TaWduZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBj
b2xsYWJvcmEuY29tPgoKICAgUmV2aWV3ZWQtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNo
aXBzLmNvbT4KClRoYW5rcwoKPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19kcC1y
b2NrY2hpcC5jIHwgMTMgKysrKysrKysrKysrLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvZHdfZHAtcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19kcC1y
b2NrY2hpcC5jCj5pbmRleCBmMTM3ZjY5OTczN2MuLjBkZTgyMjM2MGM4ZCAxMDA2NDQKPi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19kcC1yb2NrY2hpcC5jCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHdfZHAtcm9ja2NoaXAuYwo+QEAgLTEwNywxNSArMTA3LDI2IEBA
IHN0YXRpYyBpbnQgZHdfZHBfcm9ja2NoaXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqCj4gCQlyZXR1cm4gUFRSX0VSUihkcC0+YmFzZSk7Cj4g
Cj4gCWNvbm5lY3RvciA9IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoZHJtX2RldiwgZW5jb2Rl
cik7Cj4tCWlmIChJU19FUlIoY29ubmVjdG9yKSkKPisJaWYgKElTX0VSUihjb25uZWN0b3IpKSB7
Cj4rCQlkd19kcF91bmJpbmQoZHAtPmJhc2UpOwo+IAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGNvbm5lY3RvciksCj4gCQkJCSAgICAgIkZhaWxlZCB0byBpbml0IGJyaWRnZSBj
b25uZWN0b3JcbiIpOwo+Kwl9Cj4gCj4gCXJldHVybiAwOwo+IH0KPiAKPitzdGF0aWMgdm9pZCBk
d19kcF9yb2NrY2hpcF91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsCj4rCQkJCSAgdm9pZCAqZGF0YSkKPit7Cj4rCXN0cnVjdCByb2NrY2hpcF9kd19kcCAq
ZHAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPisKPisJZHdfZHBfdW5iaW5kKGRwLT5iYXNlKTsK
Pit9Cj4rCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfb3BzIGR3X2RwX3JvY2tjaGlw
X2NvbXBvbmVudF9vcHMgPSB7Cj4gCS5iaW5kID0gZHdfZHBfcm9ja2NoaXBfYmluZCwKPisJLnVu
YmluZCA9IGR3X2RwX3JvY2tjaGlwX3VuYmluZCwKPiB9Owo+IAo+IHN0YXRpYyBpbnQgZHdfZHBf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+LS0gCj4yLjU0LjAK

