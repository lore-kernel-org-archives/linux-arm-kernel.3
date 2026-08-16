Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A28C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsxiuRuiaXu9QWdEGxKrQ+0iwvXtHK0dR2ygl/r7rJY=; b=M4ommlJ0gtu+yzvRudZjXx+nw6
	XK4ee9VJtdPrs/97IiAHCLxEJfvYMO2JUEIoZk/zIbiHs3uk9z8UL0uRIqMH/pw53lgw3Bn7RzNlv
	9MB6x5VN6kCcpvebGHIMcwXpAq2HyppjHQAs1PNspT8hGqSdhOaTlY5r+UJpiuiGXitwXJGRKFi3F
	wESevtWINmbwEd04rTp1lm7yvqha2khi/+esUkbVvKyNvMIXfeTOT556aM5kcmNrMq7S8XnaGb/xn
	jxwDYiYNR047r6m4uCBvbYALDezavY8ls0G/kqsMDJsXvIGiohbu15JmJJFlbGWJFRrv0VsEW56IZ
	sirAJwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaQr-00000004mNO-2Ynf;
	Sun, 16 Aug 2026 12:57:45 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaQo-00000004mMq-29dQ;
	Sun, 16 Aug 2026 12:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=CsxiuRuiaXu9QWdEGxKrQ+0iwvXtHK0dR2ygl/r7rJY=; b=A
	dixgLQ8GC3uzAWJbog6oeDzbXOg+KYg4PYHW9QyWBaYKli3okIqzibs0W1QXzhxA
	Q91olqreEchq5209hGRHErC1oKiVriA7PfLBJDbwUSmo6WYXpDCH+7+PtWD81twm
	/OMsWWj33RaVLGV1iBJLWzhDXjVP1nfMThEEp2qdJ0=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:56:29 +0800
 (CST)
X-Originating-IP: [61.154.14.86]
Date: Sun, 16 Aug 2026 20:56:29 +0800 (CST)
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
Subject: Re:[PATCH v11 08/21] drm/bridge: synopsys: dw-dp: Free output_fmts
 when none are valid
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-8-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-8-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu0Ej7yOdYekfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXHZfeFpAM1yEHZl4OkKR0hg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <136552e4.194d.1a00aa521b3.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD3HxJ9s4Fq48cyAA--.25348W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7R0HZWqBs32X8QAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_055742_865892_83F5ABB5 
X-CRM114-Status: UNSURE (   5.81  )
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

CgpIZWxsbyBTZWJhc3RpYW4sCgpBdCAyMDI2LTA4LTA3IDAxOjAyOjE0LCAiU2ViYXN0aWFuIFJl
aWNoZWwiIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPklmIGR3X2Rw
X2JhbmR3aWR0aF9vaygpIHJldHVybnMgZmFsc2UgZm9yIGFsbCBmb3JtYXRzLCAqbnVtX291dHB1
dF9mbXRzCj5taWdodCBlbmQgdXAgYmVjb21pbmcgMC4gSW4gdGhpcyBjYXNlIGZ1bmN0aW9ucyBj
YWxsaW5nIGl0IGFzc3VtZSB0aGF0Cj5ub3RoaW5nIG5lZWRzIHRvIGJlIGZyZWUnZCwgc28gZnJl
ZSBvdXRwdXRfZm10cyB3aXRoaW4gdGhlIGZ1bmN0aW9uIHRvCj5hdm9pZCBsZWFraW5nIG1lbW9y
eS4KPgo+Rml4ZXM6IDg2ZWVjYzNhOWMyZSAoImRybS9icmlkZ2U6IHN5bm9wc3lzOiBBZGQgRFcg
RFBUWCBDb250cm9sbGVyIHN1cHBvcnQgbGlicmFyeSIpCj5SZXBvcnRlZC1ieTogU2FzaGlrbyA8
c2FzaGlrby1ib3RAa2VybmVsLm9yZz4KPlNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVs
IDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgoKICBSZXZpZXdlZC1ieTogQW5keSBZ
YW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctZHAuYyB8IDUgKysrKysKPiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IDhj
ZWIxMzlmMWE3Mi4uZDM1ZGNkNGE0MTNmIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWRwLmMKPkBAIC0xODIwLDYgKzE4MjAsMTEgQEAgc3RhdGljIHUzMiAqZHdfZHBfYnJp
ZGdlX2F0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
Cj4gCQlvdXRwdXRfZm10c1tqKytdID0gZm10LT5idXNfZm9ybWF0Owo+IAl9Cj4gCj4rCWlmIChq
ID09IDApIHsKPisJCWtmcmVlKG91dHB1dF9mbXRzKTsKPisJCW91dHB1dF9mbXRzID0gTlVMTDsK
PisJfQo+Kwo+IAkqbnVtX291dHB1dF9mbXRzID0gajsKPiAKPiAJcmV0dXJuIG91dHB1dF9mbXRz
Owo+Cj4tLSAKPjIuNTMuMAo+Cj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPkxpbnV4LXJvY2tjaGlw
QGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcm9ja2NoaXAK

