Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C17ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg6FJchwfJ8zN6I2FUJoXfv9OwhuxxtuYrxZSgqZMwo=; b=ZfLhxBeYcsfG1ssxuwqJPs8K6R
	pd2UkTQgUcLI4wITjnXgYuMMxrg/hjjlOrF8DiWbt1jbiZMdsT2HbxiltZPGnVtE+yMLyR5gzuSuh
	8zm2fqiMl9jdvcGd0nybha7jupB2dd+phIkgD/MBnb73GJ1QnhbV7wPqucYAKXKcVm2897lF3Xq3M
	iUUZlT9pyBIfvk+OqHFtfkho4RosuXI7BLOjYQAhC7oRN++BpoBhzW0T0W2VugdgY4hD4c2uCw7XI
	9neM+/QVIfH7Mk49c3sOFMwinB87QsVM+32ruWEyymdnBUFP5m7h5kW7upcOln1xkjpxuXAi+PlqS
	XeIlcURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlO5-0000000F8On-0oT9;
	Wed, 03 Jun 2026 13:12:01 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlO0-0000000F8Nq-0T5g;
	Wed, 03 Jun 2026 13:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=mg6FJchwfJ8zN6I2FUJoXfv9OwhuxxtuYrxZSgqZMwo=; b=L
	Q2qGwyOgZHlMBoHwj51br7LRUPRuIlEK2+0caJH5WEC8C8CwxMbXQQIC9w1oDR9M
	ESrxyKEG07ydC/0aCmG06FgwOsKpiuxkSBkBIlgsJyi0TmkZsjDrnRyjKaxq7YKF
	MsScrXgC36cvFtbzACKhF8exzBx4tKPhPZaD5Ebd44=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Wed, 3 Jun 2026 21:11:05 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 3 Jun 2026 21:11:05 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Alexey Charkov" <alchark@flipper.net>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/2] drm/rockchip: dw_hdmi_qp: expose "overscan" property
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260602-hdmi-overscan-v1-2-31f71b817c80@flipper.net>
References: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
 <20260602-hdmi-overscan-v1-2-31f71b817c80@flipper.net>
X-CM-CTRLMSGS: p6ycunBsdXM9MTc4MDQ5MjI2NDk2Ml80Yjg5M2U0ZTNiMzFmOGE0M2VmYWJkZ
 Tk1ZTQ2YTYyYQ==
X-NTES-SC: AL_Qu2TAviSvUot4yKQZOkfmUgWjuw/WsG1v/Ul1YBSP556jDLp4yQsdlhFB13k6v+RMTGlqAieVTxg0OFXWa1WfaYttWbhLTOOMg6JwleuQaNBCQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6f7ae6e2.a68c.19e8d9be74d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgDnD_XpJyBqUMUBAA--.17783W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QmmBWogJ+mj0wAA3z
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061157_681819_06A8AF3C 
X-CRM114-Status: UNSURE (   8.32  )
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

CkhlbGxvIEFsZXh577yMCgpBdCAyMDI2LTA2LTAzIDAxOjAwOjQwLCAiQWxleGV5IENoYXJrb3Yi
IDxhbGNoYXJrQGZsaXBwZXIubmV0PiB3cm90ZToKPkV4cG9zZSB0aGUgIm92ZXJzY2FuIiBjb25u
ZWN0b3IgcHJvcGVydHkgYXMgcmVjb2duaXplZCBieSBLV2luIGFuZCB0aGUKPmxpa2VzIHRvIGNv
bXBlbnNhdGUgZm9yIFRWIG92ZXJzY2FuIGNyb3BwaW5nLgo+Cj5UaGUgQ1JUQyB3aWxsIHVzZSB0
aGUgbWFyZ2luIHZhbHVlcyBkZXJpdmVkIGZyb20gdGhpcyBvdmVyc2NhbiBwZXJjZW50YWdlCj5p
biBpdHMgcG9zdC1jb21wb3NpdGlvbiBzY2FsZXIgdG8gYWRkIGFwcHJvcHJpYXRlIGJsYW5rIG1h
cmdpbnMgb24gYWxsCj5zaWRlcyBvZiB0aGUgb3V0cHV0IGltYWdlIHNvIHRoYXQgdGhlIFRWIGRv
ZXNuJ3QgZWF0IHVwIHZpc2libGUgY29udGVudC4KPgo+U2lnbmVkLW9mZi1ieTogQWxleGV5IENo
YXJrb3YgPGFsY2hhcmtAZmxpcHBlci5uZXQ+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaV9xcC1yb2NrY2hpcC5jIHwgMTYgKysrKysrKysrKysrKysrKwo+IDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHdfaGRtaV9xcC1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3X2hkbWlfcXAtcm9ja2NoaXAuYwo+aW5kZXggZjM1NDg0NzE1YzJkLi5mYWU0NGQxMWRiZWYg
MTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaV9xcC1yb2NrY2hp
cC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaV9xcC1yb2NrY2hpcC5j
Cj5AQCAtMTM3LDEwICsxMzcsMTggQEAgZHdfaGRtaV9xcF9yb2NrY2hpcF9lbmNvZGVyX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gCQkJCQkgc3RydWN0IGRybV9j
b25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCj4gewo+IAlzdHJ1Y3Qgcm9ja2NoaXBfaGRtaV9x
cCAqaGRtaSA9IHRvX3JvY2tjaGlwX2hkbWlfcXAoZW5jb2Rlcik7Cj4rCWNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICphZGpfbW9kZSA9ICZjcnRjX3N0YXRlLT5hZGp1c3RlZF9tb2RlOwo+
IAlzdHJ1Y3Qgcm9ja2NoaXBfY3J0Y19zdGF0ZSAqcyA9IHRvX3JvY2tjaGlwX2NydGNfc3RhdGUo
Y3J0Y19zdGF0ZSk7Cj4gCXVuaW9uIHBoeV9jb25maWd1cmVfb3B0cyBwaHlfY2ZnID0ge307Cj4r
CXVuc2lnbmVkIGludCBvdmVyc2NhbjsKPiAJaW50IHJldDsKPiAKPisJb3ZlcnNjYW4gPSBtaW4o
Y29ubl9zdGF0ZS0+dHYub3ZlcnNjYW4sIDEwMHUpOwo+KwlzLT50dl9tYXJnaW5zLmxlZnQgICA9
IGFkal9tb2RlLT5oZGlzcGxheSAqIG92ZXJzY2FuIC8gMjAwOwo+KwlzLT50dl9tYXJnaW5zLnJp
Z2h0ICA9IHMtPnR2X21hcmdpbnMubGVmdDsKPisJcy0+dHZfbWFyZ2lucy50b3AgICAgPSBhZGpf
bW9kZS0+dmRpc3BsYXkgKiBvdmVyc2NhbiAvIDIwMDsKPisJcy0+dHZfbWFyZ2lucy5ib3R0b20g
PSBzLT50dl9tYXJnaW5zLnRvcDsKPisKPiAJaWYgKGhkbWktPnRtZHNfY2hhcl9yYXRlID09IGNv
bm5fc3RhdGUtPmhkbWkudG1kc19jaGFyX3JhdGUgJiYKPiAJICAgIHMtPm91dHB1dF9icGMgPT0g
Y29ubl9zdGF0ZS0+aGRtaS5vdXRwdXRfYnBjKQo+IAkJcmV0dXJuIDA7Cj5AQCAtNjAzLDYgKzYx
MSwxNCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcXBfcm9ja2NoaXBfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGhk
bWktPmRldiwgUFRSX0VSUihjb25uZWN0b3IpLAo+IAkJCQkgICAgICJGYWlsZWQgdG8gaW5pdCBi
cmlkZ2UgY29ubmVjdG9yXG4iKTsKPiAKPisJcmV0ID0gZHJtX21vZGVfY3JlYXRlX3R2X3Byb3Bl
cnRpZXNfbGVnYWN5KGRybSwgMCwgTlVMTCk7Cj4rCWlmIChyZXQpCj4rCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwKPisJCQkJICAgICAiRmFpbGVkIHRvIGNyZWF0ZSBUViBjb25uZWN0
b3IgcHJvcGVydGllc1xuIik7CgogICAgICBJIHN1Z2dlc3QgY2FsbGluZyBhIHNpbWlsYXIgQVBJ
IHdpdGhpbiByb2NrY2hpcF9kcm1fYmluZCwgYW5kIHRoZW4gYXR0YWNoaW5nIHRoaXMgcHJvcGVy
dHkgaW4KdGhlIGNvbm5lY3RvciBkcml2ZXJzIHRoYXQgbmVlZCB0byBleHBvc2UgaXQuIFRoaXMg
YXBwcm9hY2ggYXZvaWRzIGludm9raW5nIHRoZSBBUEkgbXVsdGlwbGUgdGltZXMgaW4gbXVsdGlw
bGUgZHJpdmVyc+OAggoKPisKPisJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmNvbm5lY3Rv
ci0+YmFzZSwKPisJCQkJICAgZHJtLT5tb2RlX2NvbmZpZy50dl9vdmVyc2Nhbl9wcm9wZXJ0eSwg
MCk7Cj4rCj4gCXJldHVybiAwOwo+IH0KPiAKPgo+LS0gCj4yLjUyLjAKPgo+Cj5fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+TGludXgtcm9ja2NoaXAgbWFp
bGluZyBsaXN0Cj5MaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj5odHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCg==

