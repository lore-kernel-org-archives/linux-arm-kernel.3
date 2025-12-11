Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E85D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSCsNDXRTbhutBX9NCXK3CKOOwqTbSlygnCMk74EA64=; b=p8gyK5dKm9xFG31xg01nhrEwpo
	cEdsTa6fVzKX4e9aoPaPc57qCNRGYn7CqoLSrcZ0Bt23RBccjiBlwIw2ChAhOwdJbxvfbwFmVXpCY
	7o2AZFWXgNdC2O8eeMYuuuijx2qOaEITxPIod09pf8LZo/kdIOX2seiQb/UuX5/eLcpYfVvizWSXF
	yBouGNuvBNSI4Ho8i5evPHYUZuyOb2PjPkLp9XgSexzWcmvLqELsvxRBpB27UkcOKLLUHcgl2IHK0
	f68hTXTgOCfQuqtMhRyGgKmk77SMD5Cx52a6ifdSbZuW7B+wVLw5i3mnqv0Vki9TtNYXP0Hc3/pD5
	R9qSbmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXdP-0000000GBBp-22VT;
	Thu, 11 Dec 2025 03:46:31 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXdM-0000000GB9x-1P9D;
	Thu, 11 Dec 2025 03:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZSCsNDXRTbhutBX9NCXK3CKOOwqTbSlygnCMk74EA64=; b=W
	S3mN0nH12O/E1MsYSOL05QamwOXwXdowXkXmwtDDyQwCY6mzLo+1hPTA47QTWh9K
	RVm9hGQ1j2P30bwwA0Lfv7Dq26SfisS4ocJgI2DDqOsVzgdf3TnM6+T1zL7zTN0s
	CQyAEnsEEN9Hr3NYM+L3z6EE+ytraUlhWbScKP6vgA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-144 (Coremail) ; Thu, 11 Dec 2025 11:45:31 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 11 Dec 2025 11:45:31 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Daniel Stone" <daniels@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, "Diederik de Haas" <diederik@cknow-tech.com>
Subject: Re:[PATCH v3 6/8] drm/rockchip: vop2: Enforce AFBC transform stride
 align in plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251209-vop2-atomic-fixups-v3-6-07c48f0f1f0d@collabora.com>
References: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
 <20251209-vop2-atomic-fixups-v3-6-07c48f0f1f0d@collabora.com>
X-CM-CTRLMSGS: s1eSsnBsdXM9MTc2NTQyNDczMDczMl83M2ZiZjMzMmY4Y2E0MmRmM2ZhNWMwN
 zFmM2NmMDlmMQ==
X-NTES-SC: AL_Qu2dB/iZu08o5yaebOkfmUgWjuw/WsG1v/Ul1YBSP556jC3r8wYiVlR5P2XTzf6vNiCitTmzciJJ8dxKdqZYY4Q6oqQFipl1U2BrZmZoBYWT4Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6aed0bff.3ccf.19b0b839621.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kCgvCgD3vwtbPjpp_oU2AA--.1214W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRuO7Gk6PlvzeQAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_194628_747557_FF976EC7 
X-CRM114-Status: UNSURE (   6.67  )
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

CkhlbGxvIE5pY29sYXPvvIwKCkF0IDIwMjUtMTItMDkgMTk6MTQ6MTksICJOaWNvbGFzIEZyYXR0
YXJvbGkiIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5Gcm9tOiBE
YW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3JhLmNvbT4KPgo+TWFrZSBzdXJlIHdlIGNhbid0
IGJyZWFrIHRoZSBoYXJkd2FyZSBieSByZXF1ZXN0aW5nIGFuIHVuc3VwcG9ydGVkCj5jb25maWd1
cmF0aW9uLgo+Cj5TaWduZWQtb2ZmLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3Jh
LmNvbT4KPlNpZ25lZC1vZmYtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmljb2xhcy5mcmF0dGFy
b2xpQGNvbGxhYm9yYS5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcDIuYyB8IDEyICsrKysrKysrKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCBhMDI5ZWQ3M2RkYTcuLjMzN2IwMWVkMjlhNiAxMDA2
NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4r
KysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTEw
ODMsNiArMTA4MywxNSBAQCBzdGF0aWMgaW50IHZvcDJfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPiAKPisJaWYgKGRy
bV9pc19hZmJjKGZiLT5tb2RpZmllcikgJiYKPisJICAgIHBzdGF0ZS0+cm90YXRpb24gJgo+KwkJ
KERSTV9NT0RFX1JFRkxFQ1RfWCB8IERSTV9NT0RFX1JPVEFURV85MCB8IERSTV9NT0RFX1JPVEFU
RV8yNzApICYmCj4rCSAgICAoZmItPnBpdGNoZXNbMF0gPDwgMykgLyB2b3AyX2dldF9icHAoZmIt
PmZvcm1hdCkgJSA2NCkgewo+KwkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLAo+KwkJCSAgICAiQUZC
QyBidWZmZXJzIG11c3QgYmUgNjQtYnl0ZSBhbGlnbmVkIGZvciBob3Jpem9udGFsIHJvdGF0aW9u
IG9yIG1pcnJvcmluZ1xuIik7Cj4rCQlyZXR1cm4gLUVJTlZBTDsKPisJfQoKQXMgRGllZGVyaWsg
cHJldmlvdXNseSBwb2ludGVkIG91dO+8jHMvNjQtYnl0ZS82NCBwaXhlbC8gCgo+Kwo+IAlyZXR1
cm4gMDsKPiB9Cj4gCj5AQCAtMTI5MCw5ICsxMjk5LDYgQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFu
ZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IAkJICogd2l0aCBXSU5f
VklSX1NUUklERS4KPiAJCSAqLwo+IAkJc3RyaWRlID0gKGZiLT5waXRjaGVzWzBdIDw8IDMpIC8g
YnBwOwo+LQkJaWYgKChzdHJpZGUgJiAweDNmKSAmJiAoeG1pcnJvciB8fCByb3RhdGVfOTAgfHwg
cm90YXRlXzI3MCkpCj4tCQkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLCAidnAlZCAlcyBzdHJpZGVb
JWRdIG5vdCA2NCBwaXhlbCBhbGlnbmVkXG4iLAo+LQkJCQkgICAgdnAtPmlkLCB3aW4tPmRhdGEt
Pm5hbWUsIHN0cmlkZSk7Cj4gCj4gCQkgLyogSXQncyBmb3IgaGVhZCBzdHJpZGUsIGVhY2ggaGVh
ZCBzaXplIGlzIDE2IGJ5dGUgKi8KPiAJCXN0cmlkZSA9IEFMSUdOKHN0cmlkZSwgYmxvY2tfdykg
LyBibG9ja193ICogMTY7Cj4KPi0tIAo+Mi41Mi4wCg==

