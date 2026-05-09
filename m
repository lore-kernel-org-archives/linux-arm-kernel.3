Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF0ECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v8CJ0e4//stA9Xc55Ta1qaFTlw77C4x6BLM2ypR4Sc=; b=ph8EVJAP3IW9A9yILm1F3ObvOl
	143t6SEbpGML5D/8Hrx5BA4wDF/XwC6BH2pNoZTcMPcHG+lg1QRClEW3XermlFLRkO7PMmSkpJHEl
	5y8h/+rEIeWav1jF9Ud1Iewypsqk3rnyN0JNc1/TXJrm5t0K2cN8TvTTIzgGYcoNCosP9ZuL07oY+
	LXRbM4wZKw7vAJnYsgeEdX5qeMHGiTdxK1x6fYnQrW1mGKRFkm8ui2k8DEw6wzSB7MznW2d1DEUbm
	Hsu+0pWYrWjDYupZM4x2xqOLsHo1qc2p+lUiePUbHpq5NjhhC4CCblde2DmJLJxhlt6Za+4k2pdfw
	Z1CaGwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKc-00000007zXt-1uJ2;
	Sat, 09 May 2026 02:22:18 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKX-00000007zUL-3w7I;
	Sat, 09 May 2026 02:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=7v8CJ0e4//stA9Xc55Ta1qaFTlw77C4x6BLM2ypR4Sc=;
	b=ajDoNrHletOKCVbSvQ6x5nvgyGU5mxoVGsSRs6d//JZnWocsMZ8cvZvNPiy7km
	lvzmnXJdFjSE/sHHdm1E5SztRLX4hPv2WxNkxTxhNytUuRyhNtFgsvQvUriPWPXl
	m+llYyZ10Vgij8o0g3XiXcL+ZEXXie1tEsI9F2/N2J1TE=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnP49Gmv5pCAI+AQ--.52851S2;
	Sat, 09 May 2026 10:22:00 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] drm/rockchip: Fix of_node reference leak in rockchip_drm_encoder_set_crtc_endpoint_id()
Message-ID: <177829331772.202156.3836399936739886169@openclaw.local>
Date: Sat, 09 May 2026 10:21:57 +0800
In-Reply-To: <177829330856.202156.9366848570650672090@openclaw.local>
References: <177829330856.202156.9366848570650672090@openclaw.local>
X-CM-TRANSID: _____wDnP49Gmv5pCAI+AQ--.52851S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4UWr18Xry5ZFW3Zw17trb_yoW8Ar13pa
	n3Gr9Yvr48GrWfWr10yr47ArySkws2va17CF97C3W3Zan3ArnYyw1fKF1vgr15ArWxuFyj
	yrs7Ga4j9F17urUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1VbkUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8AnSJmn+mkkVTgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192214_315981_25583879 
X-CRM114-Status: GOOD (  11.14  )
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

VGhlIGZ1bmN0aW9uIHJvY2tjaGlwX2RybV9lbmNvZGVyX3NldF9jcnRjX2VuZHBvaW50X2lkKCkg
YWNxdWlyZXMgZGV2aWNlCnRyZWUgbm9kZSByZWZlcmVuY2VzIHZpYSBvZl9ncmFwaF9nZXRfZW5k
cG9pbnRfYnlfcmVncygpIGFuZApvZl9ncmFwaF9nZXRfcmVtb3RlX2VuZHBvaW50KCksIGJ1dCBu
ZXZlciByZWxlYXNlcyB0aGVtLiBUaGlzIGhhcHBlbnMgb24KYWxsIGV4aXQgcGF0aHMsIGluY2x1
ZGluZyB0aGUgc3VjY2VzcyBwYXRoLgoKVGhpcyBsZWFkcyB0byByZWZlcmVuY2UgY291bnQgbGVh
a3MgdGhhdCBhY2N1bXVsYXRlIGR1cmluZyBlbmNvZGVyIHByb2JlLgpJbiBkZWZlcnJlZCBwcm9i
ZSBzY2VuYXJpb3Mgb3IgbW9kdWxlIHJlbG9hZCwgdGhlIGxlYWtlZCByZWZlcmVuY2VzIGNhbgpj
YXVzZSBvZl9ub2RlX2dldCgpIHRvIGV2ZW50dWFsbHkgcmV0dXJuIC1FTk9NRU0sIGJyZWFraW5n
IHN1YnNlcXVlbnQKZGV2aWNlIHRyZWUgcGFyc2luZy4KCkZpeCBieSBhZGRpbmcgdGhlIGNvcnJl
c3BvbmRpbmcgb2Zfbm9kZV9wdXQoKSBjYWxscyBmb3IgYm90aCAnZW4nIGFuZAoncmVuJywgYW5k
IHVzZSBhIHVuaWZpZWQgZXJyb3IgcGF0aCB0byBhdm9pZCBkdXBsaWNhdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IEppYXFpIDxzaGlqaWFxaV9kZXZlbG9wQDE2My5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyB8IDE0ICsrKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKaW5kZXggOGFmYWJlMjExOGE5Li4xMjM0
NTY3ODkwYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYu
YwpAQCAtMjc4LDE4ICsyNzgsMjIgQEAgaW50IHJvY2tjaGlwX2RybV9lbmNvZGVyX3NldF9jcnRj
X2VuZHBvaW50X2lkKHN0cnVjdCByb2NrY2hpcF9lbmNvZGVyICpya2VuY29kZXIsCiB7CiAJc3Ry
dWN0IG9mX2VuZHBvaW50IGVwOwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZW4sICpyZW47CiAJaW50
IHJldDsKCiAJZW4gPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfYnlfcmVncyhucCwgcG9ydCwgcmVn
KTsKIAlpZiAoIWVuKQogCQlyZXR1cm4gLUVOT0VOVDsKCiAJcmVuID0gb2ZfZ3JhcGhfZ2V0X3Jl
bW90ZV9lbmRwb2ludChlbik7CiAJaWYgKCFyZW4pCi0JCXJldHVybiAtRU5PRU5UOworCQlnb3Rv
IGVycl9wdXRfZW47CgogCXJldCA9IG9mX2dyYXBoX3BhcnNlX2VuZHBvaW50KHJlbiwgJmVwKTsK
IAlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCQlnb3RvIGVycl9wdXRfcmVuOwoKIAlya2VuY29k
ZXItPmNydGNfZW5kcG9pbnRfaWQgPSBlcC5pZDsKCi0JcmV0dXJuIDA7CitlcnJfcHV0X3JlbjoK
KwlvZl9ub2RlX3B1dChyZW4pOworZXJyX3B1dF9lbjoKKwlvZl9ub2RlX3B1dChlbik7CisJcmV0
dXJuIHJldDsKIH0KCiAvKgotLQoyLjQwLjAK


