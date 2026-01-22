Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49407C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CK5jvCEjZaFYLQYoZXkEENe4Tnp4vbjlGczZ89edr4=; b=38ueyzjTCf83m7BjCOScpBJwpD
	63bT+hd0Zt+6uuQhQ7alF1CTCyeLl6ZD/xRiT+AqpSdslGjyaqRoCX00jhDmtPETJ9JIl/eQCMc8X
	PZiaCknGWDedFfMfj5UFV9cWP+V69Z6CxOQ2CPD0MMFy83UX3ELQYA9E1RCY7VLAgRuRoXnQdQQai
	jREoWHPS0iEwgJtaAbuGlwO43F3Jpm5CyJzJVRhQeJedVoC31sYxJQJS9duo6ByBUs6jMzjIDmpkg
	0FEOAJD1VccyLfJNI2+dty2gQ+Q7vi3FrhdvKXax7JWLbtLZVCTgYHBOPfxMraCqi3hVe4En/bwa+
	v8TDbPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vioEb-00000006VBb-0uEw;
	Thu, 22 Jan 2026 06:32:01 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vioEY-00000006VAF-1ekm;
	Thu, 22 Jan 2026 06:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=8CK5jvCEjZaFYLQYoZXkEENe4Tnp4vbjlGczZ89edr4=; b=A
	viskXnWYQ0DpZ3HeAt0DEjXT7KX5KRh0ZUetPugTt8Mz2JZ+b5R1Un+4YewTXuWF
	Fy5XKZ6dX0VN6AHtif4EVGM85Cgq3eNuVnjibGsWGUsqUho0bHVzYmJg6sFiVFi9
	6QrQFX1rjlcsWsaeCAPI1u4Qw6AiGv6mZ6zy4chWSI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 14:30:33 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 22 Jan 2026 14:30:33 +0800 (CST)
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
Subject: Re:[PATCH v7 09/22] drm/rockchip: Add YUV422 output mode constants
 for VOP2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-9-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-9-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: VGsUV3BsdXM9MTc2OTA2MzQzMjEwNF80ZGY5MTA1NWM2ZGEzOWU1N2NiM2Y4Y
 WE1NDkyMWViMA==
X-NTES-SC: AL_Qu2dC/ydvEwo5SCeZekfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6Bkepsbla4s24V6ov96gBpNliJpeg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <ce42aa7.51d0.19be465c36f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDXvwQJxHFpWHhcAA--.14313W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxQnpSGlxxAleLwAA3J
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_223158_834898_F0778274 
X-CRM114-Status: UNSURE (   3.80  )
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

CgpIZWxsbywKCkF0IDIwMjYtMDEtMjEgMjI6NDU6MTYsICJOaWNvbGFzIEZyYXR0YXJvbGkiIDxu
aWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5UaGUgUm9ja2NoaXAgZGlz
cGxheSBjb250cm9sbGVyIGhhcyBhIGdlbmVyYWwgWVVWNDIyIG91dHB1dCBtb2RlLCBhbmQKPnNv
bWUgU29DLXNwZWNpZmljIGNvbm5lY3Rvci1zcGVjaWZpYyBvdXRwdXQgbW9kZXMgZm9yIFJLMzU3
Ni4KPgo+QWRkIHRoZW0sIGJhc2VkIG9uIHRoZSB2YWx1ZXMgaW4gZG93bnN0cmVhbSBhbmQgdGhl
IFRSTSAoZHNwX291dF9tb2RlIGluCj5SSzM1NzYgVFJNIFBhcnQgMiwgcmVnaXN0ZXIgUE9TVCpf
Q1RSTF9QT1NUX0RTUF9DVFJMKS4KPgo+U2lnbmVkLW9mZi1ieTogTmljb2xhcyBGcmF0dGFyb2xp
IDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4KCiAgIFJldmlld2VkLWJ5OiBBbmR5
IFlhbiA8YW5keXNocmtAMTYzLmNvbT4KCgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV9kcnYuaCB8IDQgKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5oCj5p
bmRleCAyZTg2YWQwMDk3OWMuLjQ3MDVkYzZiOGJkNyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmgKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmgKPkBAIC0zMCwxMCArMzAsMTQgQEAKPiAjZGVmaW5l
IFJPQ0tDSElQX09VVF9NT0RFX1A1NjUJCTIKPiAjZGVmaW5lIFJPQ0tDSElQX09VVF9NT0RFX0JU
NjU2CQk1Cj4gI2RlZmluZSBST0NLQ0hJUF9PVVRfTU9ERV9TODg4CQk4Cj4rI2RlZmluZSBST0NL
Q0hJUF9PVVRfTU9ERV9ZVVY0MjIJOQo+ICNkZWZpbmUgUk9DS0NISVBfT1VUX01PREVfUzg4OF9E
VU1NWQkxMgo+ICNkZWZpbmUgUk9DS0NISVBfT1VUX01PREVfWVVWNDIwCTE0Cj4gLyogZm9yIHVz
ZSBzcGVjaWFsIG91dGZhY2UgKi8KPiAjZGVmaW5lIFJPQ0tDSElQX09VVF9NT0RFX0FBQUEJCTE1
Cj4rLyogU29DIHNwZWNpZmljIG91dHB1dCBtb2RlcyAqLwo+KyNkZWZpbmUgUk9DS0NISVBfT1VU
X01PREVfWVVWNDIyX1JLMzU3Nl9EUAkxMgo+KyNkZWZpbmUgUk9DS0NISVBfT1VUX01PREVfWVVW
NDIyX1JLMzU3Nl9IRE1JCTEzCj4gCj4gLyogb3V0cHV0IGZsYWdzICovCj4gI2RlZmluZSBST0NL
Q0hJUF9PVVRQVVRfRFNJX0RVQUwJQklUKDApCj4KPi0tIAo+Mi41Mi4wCg==

