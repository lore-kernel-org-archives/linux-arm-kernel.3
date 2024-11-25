Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A178D3B7E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tiTwZavYbBT9O4hqUqfK5GRnjxrq7s1woxn+ljSWac=; b=Gyb0sg+5Vy737d+1upVYMvqR6o
	QQLSuY4c0c+hHJjgaoc7FUoxz4WAjc8lcCwiE4XRmPOAmJ1jdVQxN0qnXIh7mfeWRxJwWV/Oqik90
	Y37Q37DezNd6uWGlzwSRdtb/eJMsKgaNJ0In/vgtUWB9OEZtq6ljwrXRECTkGLJopJi/N3ivDVBMn
	pHn81yryXlxnIaK+2iyM8AxPOzpPPLsS408vObXWRW3ByNiATRcMTYATQfQmgdm+NN/dw0GflSdKk
	IjhUA2Jdb74YVoGvn4SnqB96lf26g20AkI0XGz9MQ+AT1EPwqvWi0lMcK9yci9tas5keyov3wFoCb
	5zIoYLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTyI-00000007I5f-0Y7b;
	Mon, 25 Nov 2024 07:57:26 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTxK-00000007HzI-3aXy;
	Mon, 25 Nov 2024 07:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=lWCuFhfEEKaJ3GUTrOrOQrEiKfJAVkt+IjzyiGjhhsc=; b=d
	/W2sNUon1A5TrNFPVd/HnCzuRvVoFeaTeqUvynbz5k6KJzbjF3prXezzfvGgYxGi
	3lyvYeOdNNt5gmcOKMOj7Muy1mes9W+lgrerxXCOYJNV2z49HRdZUOecLIA17mry
	53NK8KG7+odK7pBsUeDQQk+GwqT7e8/dlXjvVUNPWM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Mon, 25 Nov 2024 15:55:41 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 25 Nov 2024 15:55:41 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, "Sandy Huang" <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	"Andy Yan" <andy.yan@rock-chips.com>, 
	"David Airlie" <airlied@gmail.com>, 
	"Simona Vetter" <simona@ffwll.ch>, 
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
	"Maxime Ripard" <mripard@kernel.org>, 
	"Thomas Zimmermann" <tzimmermann@suse.de>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Sebastian Reichel" <sebastian.reichel@collabora.com>, 
	"Dragan Simic" <dsimic@manjaro.org>, 
	"Alexey Charkov" <alchark@gmail.com>, 
	"Jianfeng Liu" <liujianfeng1994@gmail.com>, 
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	"Algea Cao" <algea.cao@rock-chips.com>
Subject: Re:[PATCH v4 0/3] drm: rockchip: vop2: Add VP clock resets support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241115162120.83990-1-detlev.casanova@collabora.com>
References: <20241115162120.83990-1-detlev.casanova@collabora.com>
X-NTES-SC: AL_Qu2YAPmZvksv5yWRYekZnEobh+Y5UcK2s/ki2YFXN5k0qiTx3icwbG5AE1jE9fm/KwSmoQmXQjhw185jW61SUJh5vIZhoMZOdqc6vyh/TPcw
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3e8f91fa.8700.1936251b29e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgCHP8d9LURn0i4vAA--.51834W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR+iXmdEJXnuHgABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_235627_202496_BA19676E 
X-CRM114-Status: UNSURE (   9.81  )
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

SGVsbG8gRGV0bGV2LAoKQXQgMjAyNC0xMS0xNiAwMDoyMDozOSwgIkRldGxldiBDYXNhbm92YSIg
PGRldGxldi5jYXNhbm92YUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPlRoZSBjbG9jayByZXNldCBt
dXN0IGJlIHVzZWQgd2hlbiB0aGUgVk9QIGlzIGNvbmZpZ3VyZWQuIFNraXBwaW5nIGl0IGNhbgo+
cHV0IHRoZSBWT1AgaW4gYW4gdW5rbm93biBzdGF0ZSB3aGVyZSB0aGUgSERNSSBzaWduYWwgaXMg
ZWl0aGVyIGxvc3Qgb3IKPm5vdCBtYXRjaGluZyB0aGUgc2VsZWN0ZWQgbW9kZS4KCkNhbiB5b3Ug
cHJvdmlkZSBzb21lIGRldGFpbCBhYm91dCBob3cgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgPwpJ
ZiB3ZSBjYW4gcmVwcm9kdWNlIHRoaXMgaXNzdWUsIHdlIG1pZ2h0IGJlIGFibGUgdG8gZG8gYSBt
b3JlIGRlZXAgYW5hbHlzaXMuCgo+Cj5UaGlzIGFkZHMgc3VwcG9ydCBmb3IgcmszNTg4KHMpIGJh
c2VkIFNvQ3MuCj4KPkNoYW5nZXMgc2luY2UgdjM6Cj4tIFJlYmFzZWQgb24gZHJtLW1pc2MtbmV4
dAo+LSBSZXdvcmQgZmlyc3QgcGF0Y2ggc3ViamVjdAo+LSBSZW9yZGVyIGNvbW1pdHMgZm9yIGRp
ZmZlcmVudCB0cmVlcwo+Cj5DaGFuZ2VzIHNpbmNlIHYyOgo+LSBSZWJhc2Ugb24gbGF0ZXN0IG1h
c3Rlcgo+LSBBZGQgZGV0YWlscyBvbiBob3cgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZQo+Cj5DaGFu
Z2VzIHNpbmNlIHYxOgo+LSBBZGQgQVhJIGFuZCBBSEIgY2xvY2sgcmVzZXRzCj4tIFNldCBtYXhJ
dGVtcyBmb3IgIXJrMzU4OCBpbiB2b3AyIGJpbmRpbmdzCj4KPkRldGxldiBDYXNhbm92YSAoMyk6
Cj4gIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiB2b3AyOiBBZGQgVlAgY2xvY2sgcmVzZXRzCj4gIGRy
bS9yb2NrY2hpcDogdm9wMjogQWRkIGNsb2NrIHJlc2V0cyBzdXBwb3J0Cj4gIGFybTY0OiBkdHM6
IHJvY2tjaGlwOiBBZGQgVk9QIGNsb2NrIHJlc2V0cyBmb3IgcmszNTg4cwo+Cj4gLi4uL2Rpc3Bs
YXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wMi55YW1sICAgICAgIHwgNDAgKysrKysrKysrKysrKysr
KysrKwo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4LWJhc2UuZHRzaSB8IDEy
ICsrKysrKwo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jICB8
IDMwICsrKysrKysrKysrKysrCj4gMyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspCj4K
Pi0tIAo+Mi40Ny4wCg==

