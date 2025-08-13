Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10165C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cbz2DI5cwTsFRyE5YP4PtmmF7Ebol9Jgpl9atvQ7kp8=; b=zYTbesxFYciiljCgbMSu2CYPnO
	kgX6XwfEyG2lQ8rA3aUu6/wYWpkwUrzg+DNoLTgzKUEz9qQH3USDCKfSchsRVq5PWm6i1HImTHp2e
	tgHE2nBsbR6dAPm9EHz9F+XE4Hsek1w5sg+maod05Yf3T/ri/BS25Teb9zr9v7wZ6Btcd9G6lmG0O
	ajJIv74Ax/3XGcno26XfR7iqUcLCO6h2yDKJ8aT62M3o7eq0vfz9IbbfXUI/j04L8DGnmnO4zMVK9
	sOD5XGI5Mqj2C+zbXeRxkyQewETbRjkM7LNZnSYfXtTtMosrPmAqKLnvYuU3fdGlg4lV/cH57Hu78
	WXJkKHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6Wg-0000000D2aC-0A4p;
	Wed, 13 Aug 2025 08:08:02 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6Li-0000000D0Up-0AN5;
	Wed, 13 Aug 2025 07:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=jECFwx4pIXRDwOe+aduX16A+fUFcM2/6HU7bohWUDGc=; b=o
	HQT/PaAi8pUOtZeKPMoV7Wot/s3ouebC+zCZPU2UR41IMCP3i+L5X75P8LgyASSz
	ZenaPO3rY86qVXiN6hzJEyPGoMC2drGTLvfLGh9HU+7nIhfxMokXV/Xtw46umWmA
	kX3JdYbIpVWHSyUv82eNg23SSkOP+gW4oNvcBEJcv4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Wed, 13 Aug 2025 15:56:12 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 13 Aug 2025 15:56:12 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com,
	nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	"Guochun Huang" <hero.huang@rock-chips.com>
Subject: Re:[PATCH 09/13] drm/rockchip: dsi2: add support rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250707164906.1445288-10-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-10-heiko@sntech.de>
X-NTES-SC: AL_Qu2eB/ycvk8s5CedYukfmUkTh+o2Xca5uf0j3YBWOZh+jCzp0xowU31TOHjf/9CDICOtkAiHbAN808N6QrN4UbkoF22nqegBGsuYjTtBtlFcOQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2cef60be.5f55.198a26df85a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3H+AcRZxoWT8ZAA--.1718W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhqoXmicQps+AAABss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_005642_439950_B745BAEE 
X-CRM114-Status: UNSURE (   7.43  )
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

CkhlbGxvIEhlaWtvLAoKQXQgMjAyNS0wNy0wOCAwMDo0OTowMiwgIkhlaWtvIFN0dWVibmVyIiA8
aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkZyb206IEd1b2NodW4gSHVhbmcgPGhlcm8uaHVhbmdA
cm9jay1jaGlwcy5jb20+Cj4KPkFkZCB0aGUgbmVjZXNzYXJ5IHNwZWNpZmljIGJpdHMgdG8gc3Vw
cG9ydCB0aGUgcmszNTc2LXZhcmlhbnQgb2YgdGhlCj5EVy1EU0kyIGNvbnRyb2xsZXIuCj4KPlNp
Z25lZC1vZmYtYnk6IEd1b2NodW4gSHVhbmcgPGhlcm8uaHVhbmdAcm9jay1jaGlwcy5jb20+Cj5b
YWRhcHRlZCBmcm9tIHRoZSB2ZW5kb3Ita2VybmVsIGZvciBtYWlubGluZV0KPlNpZ25lZC1vZmYt
Ynk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKUmV2aWV3ZWQtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KCgpUaGFua3MuCgo+LS0tCj4gLi4uL2dwdS9k
cm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMgIHwgMjEgKysrKysrKysrKysrKysr
KysrKwo+IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMKPmluZGV4IGNkZDQ5MDc3
ODc1Ni4uMGFlYTc2NGUyOWIyIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3LW1pcGktZHNpMi1yb2NrY2hpcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
ZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMKPkBAIC00MzcsNiArNDM3LDE1IEBAIHN0YXRpYyB2b2lk
IGR3X21pcGlfZHNpMl9yb2NrY2hpcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAJZHdfbWlwaV9kc2kyX3JlbW92ZShkc2kyLT5kbWQpOwo+IH0KPiAKPitzdGF0aWMgY29u
c3Qgc3RydWN0IGRzaWdyZl9yZWcgcmszNTc2X2RzaV9ncmZfcmVnX2ZpZWxkc1tNQVhfRklFTERT
XSA9IHsKPisJW1RYUkVRQ0xLSFNfRU5dCQk9IHsgMHgwMDI4LCAxLCAgMSB9LAo+KwlbR0FUSU5H
X0VOXQkJPSB7IDB4MDAyOCwgMCwgIDAgfSwKPisJW0lQSV9TSFVURE5dCQk9IHsgMHgwMDI4LCAz
LCAgMyB9LAo+KwlbSVBJX0NPTE9STV0JCT0geyAweDAwMjgsIDIsICAyIH0sCj4rCVtJUElfQ09M
T1JfREVQVEhdCT0geyAweDAwMjgsIDgsIDExIH0sCj4rCVtJUElfRk9STUFUXQkJPSB7IDB4MDAy
OCwgNCwgIDcgfSwKPit9Owo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNpZ3JmX3JlZyByazM1
ODhfZHNpMF9ncmZfcmVnX2ZpZWxkc1tNQVhfRklFTERTXSA9IHsKPiAJW1RYUkVRQ0xLSFNfRU5d
CQk9IHsgMHgwMDAwLCAxMSwgMTEgfSwKPiAJW0dBVElOR19FTl0JCT0geyAweDAwMDAsIDEwLCAx
MCB9LAo+QEAgLTQ1NSw2ICs0NjQsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkc2lncmZfcmVn
IHJrMzU4OF9kc2kxX2dyZl9yZWdfZmllbGRzW01BWF9GSUVMRFNdID0gewo+IAlbSVBJX0ZPUk1B
VF0JCT0geyAweDAwMDQsICAwLCAgMyB9LAo+IH07Cj4gCj4rc3RhdGljIGNvbnN0IHN0cnVjdCBy
b2NrY2hpcF9kd19kc2kyX2NoaXBfZGF0YSByazM1NzZfY2hpcF9kYXRhW10gPSB7Cj4rCXsKPisJ
CS5yZWcgPSAweDI3ZDgwMDAwLAo+KwkJLmdyZl9yZWdzID0gcmszNTc2X2RzaV9ncmZfcmVnX2Zp
ZWxkcywKPisJCS5tYXhfYml0X3JhdGVfcGVyX2xhbmUgPSAyNTAwMDAwVUxMLAo+Kwl9LAo+Kwl7
IC8qIHNlbnRpbmVsICovIH0KPit9Owo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcm9ja2NoaXBf
ZHdfZHNpMl9jaGlwX2RhdGEgcmszNTg4X2NoaXBfZGF0YVtdID0gewo+IAl7Cj4gCQkucmVnID0g
MHhmZGUyMDAwMCwKPkBAIC00NzAsNiArNDg4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByb2Nr
Y2hpcF9kd19kc2kyX2NoaXBfZGF0YSByazM1ODhfY2hpcF9kYXRhW10gPSB7Cj4gCj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfbWlwaV9kc2kyX3JvY2tjaGlwX2R0X2lkc1td
ID0gewo+IAl7Cj4rCQkuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazM1NzYtbWlwaS1kc2kyIiwK
PisJCS5kYXRhID0gJnJrMzU3Nl9jaGlwX2RhdGEsCj4rCX0sIHsKPiAJCS5jb21wYXRpYmxlID0g
InJvY2tjaGlwLHJrMzU4OC1taXBpLWRzaTIiLAo+IAkJLmRhdGEgPSAmcmszNTg4X2NoaXBfZGF0
YSwKPiAJfSwKPi0tIAo+Mi40Ny4yCg==

