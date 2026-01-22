Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226EFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTQS2Ub48cluoF04AksxVAcZz1dPPLXQ7ZO9ToPloD8=; b=KG6BkGlKCFNNMqnH8JYdo21zSh
	BO3nCs1AJYYnUo/eUyHN1ZuBYiYQcbC5cS57tHlacEsIAhBO/HlSicjA0PZvnyLbOvxjtEG29HM2w
	IUP1ESaNXG79ZzOz6YGNUpkkxwAlpXYOWdNFyRBpxXoqRVdwrMtiT6u0sCWS4tNtWWduD+McY4uJw
	HwA9i5Y2Tcl50ofa46zoMkRpIda/TfQsrVORtWWtcaBd8fq8Zy4BIGyPBZlBjvMSloefStOrXQQza
	EmW7eezvwxSucaSDD3kmSpMrgVRXhVmwDxIYwBf39K5NkZmQF4xLKPc2tQX7SrW+Ef9OgIYx1L3y7
	14OI7LiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqJs-00000006flC-3u0B;
	Thu, 22 Jan 2026 08:45:36 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqJp-00000006fkN-0Vo1;
	Thu, 22 Jan 2026 08:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=bTQS2Ub48cluoF04AksxVAcZz1dPPLXQ7ZO9ToPloD8=; b=k
	g/vJ0TPJyGvaf2ouh7+ZkgLUAP8nvM10am5Erku9m7bIbDckHfw0bURZa0D/VQb4
	nX7Sf5y4c+Eqiu8X38rRqxwoeOJXcn3ThpWJfObzkfeaAc8S9/n6PdA45lsFq3q3
	L1SiiNyCptSK+e3S0ohSaxovyeMZr1hT3qdJdBa8QY=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:44:24 +0800
 (CST)
X-Originating-IP: [110.83.51.2]
Date: Thu, 22 Jan 2026 16:44:24 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
	"Rodrigo Siqueira" <siqueira@igalia.com>,
	"Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Jani Nikula" <jani.nikula@linux.intel.com>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>,
	"Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
	"Tvrtko Ursulin" <tursulin@ursulin.net>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Rob Herring" <robh@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
	kernel@collabora.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re:[PATCH v7 13/22] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-13-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-13-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: RtNQZnBsdXM9MTc2OTA3MTQ2MzM1NV8yNGY3NzZiM2I2YjU1M2E3ZjVjMWNiM
 GY5NjQzYTBhNw==
X-NTES-SC: AL_Qu2dC/ycvkwt4iOcYukfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbYkh+3JfXd1VE6LuMWmOAAQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <27c44445.7a56.19be4e04fa9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDnDxRo43FpXbFcAA--.14910W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgjJKGlx42hHoQAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_004533_645772_0EC263B7 
X-CRM114-Status: UNSURE (   5.77  )
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

CgpIZWxsbyBOaWNvbGFzLAoKQXQgMjAyNi0wMS0yMSAyMjo0NToyMCwgIk5pY29sYXMgRnJhdHRh
cm9saSIgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPkZvciBSSzM1
NzYgdG8gYmUgYWJsZSB0byBvdXRwdXQgWVVWNDIyIHNpZ25hbHMsIGl0IGZpcnN0IG5lZWRzIHRv
IGJlCj5hYmxlIHRvIHBpY2sgdGhlIHJpZ2h0IG91dHB1dCBtb2RlIGluIHRoZSBkaXNwbGF5IGNv
bnRyb2xsZXIgdG8gZG8gc28uCj4KPlRoZSBSSzM1NzYgaGFyZHdhcmUgc3BlY2lmaWVzIGRpZmZl
cmVudCBvdXRwdXQgZm9ybWF0cyBkZXBlbmRpbmcgb24gdGhlCj51c2VkIGRpc3BsYXkgcHJvdG9j
b2wuCj4KPkFkanVzdCB0aGUgd3JpdHRlbiByZWdpc3RlciB2YWx1ZSBiYXNlZCBvbiB0aGUgU29D
IGFuZCBjb25uZWN0b3IsIHNvCj5vdGhlciB1c2VycyBvZiB2Y3N0YXRlLT5vdXRwdXRfbW9kZSBk
b24ndCBoYXZlIHRvIGNhcmUgYWJvdXQgdGhpcy4KPgo+U2lnbmVkLW9mZi1ieTogTmljb2xhcyBG
cmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4KCgogICAgUmV2aWV3
ZWQtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IDNkZDdiNzU3MTQ4Ny4uZDkzYzY3NzkyODZl
IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5A
QCAtMTcwNiw2ICsxNzA2LDIyIEBAIHN0YXRpYyB2b2lkIHZvcDJfY3J0Y19hdG9taWNfZW5hYmxl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAJaWYgKHZjc3RhdGUtPm91dHB1dF9tb2RlID09IFJP
Q0tDSElQX09VVF9NT0RFX0FBQUEgJiYKPiAJICAgICEodnBfZGF0YS0+ZmVhdHVyZSAmIFZPUDJf
VlBfRkVBVFVSRV9PVVRQVVRfMTBCSVQpKQo+IAkJb3V0X21vZGUgPSBST0NLQ0hJUF9PVVRfTU9E
RV9QODg4Owo+KwllbHNlIGlmICh2Y3N0YXRlLT5vdXRwdXRfbW9kZSA9PSBST0NLQ0hJUF9PVVRf
TU9ERV9ZVVY0MjIgJiYKPisJCSB2b3AyLT52ZXJzaW9uID09IFZPUF9WRVJTSU9OX1JLMzU3NikK
PisJCXN3aXRjaCAodmNzdGF0ZS0+b3V0cHV0X3R5cGUpIHsKPisJCWNhc2UgRFJNX01PREVfQ09O
TkVDVE9SX0Rpc3BsYXlQb3J0Ogo+KwkJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgo+KwkJ
CW91dF9tb2RlID0gUk9DS0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9EUDsKPisJCQlicmVh
azsKPisJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBOgo+KwkJCW91dF9tb2RlID0gUk9D
S0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9IRE1JOwo+KwkJCWJyZWFrOwo+KwkJZGVmYXVs
dDoKPisJCQlkcm1fZXJyKHZvcDItPmRybSwgIlVua25vd24gRFJNX01PREVfQ09OTkVDVE9SICVk
XG4iLAo+KwkJCQl2Y3N0YXRlLT5vdXRwdXRfdHlwZSk7Cj4rCQkJdm9wMl91bmxvY2sodm9wMik7
Cj4rCQkJcmV0dXJuOwo+KwkJfQo+IAllbHNlCj4gCQlvdXRfbW9kZSA9IHZjc3RhdGUtPm91dHB1
dF9tb2RlOwo+IAo+Cj4tLSAKPjIuNTIuMAo+Cg==

