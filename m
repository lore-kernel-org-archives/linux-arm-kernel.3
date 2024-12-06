Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3757DE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AS6B7LEf/P9SKixjkaV4gNLBVtsd9V7EEg30NeOjf/s=; b=jKoLu7WdJdHQXE2aCzoWZKU7qq
	uILtjvjOcDWJ/xQ7yuJg4wiBaadQ8FihR4pYHp43EFTID0DftWvotVH547b1S1OIQBL7fr+vYr0Hd
	LPncDTSDfUpbTPwO64w/08Ff/0aTsOq8gcwnZw4d2bGdf2JCn4PitUfrreo9rnM37/X9Yodi33kwC
	ukjvN2WkCFSKavg+YnJyiw++3YAKCbt5wTDXzvnRPXnkhGb9ykid/L+ujR6dJ+iSVGApk368DOGea
	zA1Ht6OO0s/Uz/hSB4RZd5X4MBsnqTGbC0euw7b506F18AnU3QrHQ1Iqc1IvnFw/CwKQHqmdQHQG9
	CFFoMTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXAj-00000001X2Y-2vNS;
	Fri, 06 Dec 2024 12:11:01 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJX9A-00000001WpZ-0ulK;
	Fri, 06 Dec 2024 12:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=n4hW/V/Xu2dnjj6AYJ4WjJceT096qx6cfGkMAL+BDWw=; b=h
	g1ELVI/I4z/oSYqyoWt4/Rca5z33HAmc9Rb1shux5Yco08X9sw16uhdQKUvbaLqJ
	H2nL1hi88EublB7N7C0MKLBzGFPJb3+6zsnyuJQH5K4zple2nEyCaCzlKGlmlajc
	qtknFjry0sJ/KJMuGlVEtTkEu/IdPwBe0lqJSyfrA0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Fri, 6 Dec 2024 20:08:47 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 6 Dec 2024 20:08:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Guoqing Jiang" <guoqing.jiang@canonical.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re:[PATCH] drm/rockchip: Remove unnecessary checking
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
References: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
X-NTES-SC: AL_Qu2YAfiTuUEp4SSeY+lS8zNM9K56MKvt5LljqcQFePgqqTHL3g4cZnlBM0vW6uJQJuqD7OHbXn3B2mnPVyPr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6db9676.aa57.1939bdf5e6e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgDXfwdP6VJnmyI5AA--.11968W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hetXmdS4Imk1gABsZ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_040924_599420_CD617AAC 
X-CRM114-Status: UNSURE (   6.15  )
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

SGkgR3VvcWluZywKCkF0IDIwMjQtMTItMDYgMTk6NDI6MzMsICJHdW9xaW5nIEppYW5nIiA8Z3Vv
cWluZy5qaWFuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPkl0IGlzIG5vdCBuZWVkZWQgc2luY2Ug
ZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24gY2hlY2tzIGl0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBH
dW9xaW5nIEppYW5nIDxndW9xaW5nLmppYW5nQGNhbm9uaWNhbC5jb20+CgogICBBY2tlZC1ieTog
QW5keSBZYW48YW5keXNocmtAMTYzLmNvbT4KClRoYW5rcwoKPi0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgfCAzICstLQo+IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX2Rydi5jCj5pbmRleCA1ODUzNTVkZTY5NmIuLjY0ZjVmNTQ3ZmI3YSAx
MDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMK
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPkBAIC00
ODgsOCArNDg4LDcgQEAgc3RhdGljIHZvaWQgcm9ja2NoaXBfZHJtX3BsYXRmb3JtX3NodXRkb3du
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gewo+IAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gCj4tCWlmIChkcm0pCj4tCQlkcm1f
YXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0pOwo+Kwlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93
bihkcm0pOwo+IH0KPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByb2NrY2hp
cF9kcm1fZHRfaWRzW10gPSB7Cj4tLSAKPjIuMzUuMwo+Cj4KPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QK
PkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

