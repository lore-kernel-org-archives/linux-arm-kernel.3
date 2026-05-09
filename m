Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C8CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 04:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:
	To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtLlE8BZecYSdlr9Dxuoyv1YHpTPgMWAv1Fu9o0Wbig=; b=ltD8rRg8fKFl8ZMqBYYyaYO3AS
	vPynlgwExu+w70QVgV9LhCuJUWQGkcbN1A2LWbh2LTplBapgjAmQHKs+AHaiJe/SYZTW2StG1j2Wx
	EfOcoe15iA6RxVBMcH+O7yCrynyNITXTT1OaiXmYOpxWFlpTUbeoF7+i9KXtDLWyZg3zF5PnkxQnw
	TMko1HFBOHtnaZ8uoKMV7YuverNOqQk8Pesdilj45h5KnEMU58sM8i7lZijZUWrwnu7XbigoWpDjW
	mrKSzjbuR8gQijz4nxJCsyiN2Ny7e5QWN5hLvieVWbI/l/Gqvuaa3uUnAu0EghNPBuXvKOARgu5o4
	wFkOMyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ86-00000008Azs-1afR;
	Sat, 09 May 2026 04:17:30 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ80-00000008AxX-1Mds;
	Sat, 09 May 2026 04:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=AtLlE8BZecYSdlr9Dxuoyv1YHpTPgMWAv1Fu9o0Wbig=;
	b=WOjjt65Rz/Qd5CN7oYpV8FjxlaB81wsSDPGpIHNOupNOoQyx85p83jAcSZQn9j
	GKxOuTJI7rpWRgWcy2YeHjoCAq0HQx03m0BD2h54RUcjtTEBTYC89vv98zbjRxFd
	VKeaeBXzw9QJ/2eeiuPnV8ntiFgqeR8s6y2oz9op69Pdw=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXZNs6tf5p6HVGAQ--.38867S2;
	Sat, 09 May 2026 12:17:01 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] drm/rockchip: Fix error handling and resource leaks in Rockchip DRM drivers
Message-ID: <177830021804.246051.8309807801406217751@openclaw.local>
Date: Sat, 09 May 2026 12:16:58 +0800
X-CM-TRANSID: _____wDXZNs6tf5p6HVGAQ--.38867S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw17Ar43ZFW5WrW8uw13XFb_yoW5JF1rpr
	s5W390vr45GrWj9rs7AF4xAr1F9wsFvayIgF97K343ZF15Cr17J34S9w1kuF17Jr93A3W7
	trnrJrWrZw4jvrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUpnQUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7x6W6Wn+tT7DJQAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_211724_975927_6C42C613 
X-CRM114-Status: GOOD (  11.27  )
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

VGhpcyBpcyB2MiBvZiB0aGUgcGF0Y2ggc2VyaWVzIHRoYXQgd2FzIHByZXZpb3VzbHkgd2l0aGRy
YXduIGR1ZSB0bwphIGNyaXRpY2FsIGJ1ZyBpbiBQYXRjaCAzLzYuCgpDaGFuZ2VzIGluIHYyOgog
IC0gUGF0Y2ggMy82OiBSZW1vdmVkIGluY29ycmVjdCBkZXZtX2ZyZWVfaXJxKCkgY2FsbCBpbiBl
cnJvciBwYXRoLgogICAgVGhlIElSUSByZWdpc3RlcmVkIHZpYSBkZXZtX3JlcXVlc3RfaXJxKCkg
aXMgbWFuYWdlZCBieSBkZXZyZXMgYW5kCiAgICBtdXN0IE5PVCBiZSBtYW51YWxseSBmcmVlZC4g
VGhlIGNvcnJlY3RlZCBwYXRjaCBzaW1wbHkganVtcHMgdG8KICAgIGVycl9jcnRjcyBsYWJlbCBm
b3IgcHJvcGVyIGNsZWFudXAgdmlhIHZvcDJfZGVzdHJveV9jcnRjcygpLgogIC0gUGF0Y2ggNS82
OiBGaXhlZCB0cmFpbGluZyBmb3JtYXQgaXNzdWUgdGhhdCBjYXVzZWQgY2hlY2twYXRjaCBFUlJP
Ui4KClRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIDYgYnVncyBpbiB0aGUgUm9ja2NoaXAgRFJNIGRy
aXZlciBzdWJzeXN0ZW0sCmlkZW50aWZpZWQgdGhyb3VnaCBzdGF0aWMgY29kZSBhbmFseXNpcyBh
bmQgY29uZmlybWVkIGJ5IHRlY2huaWNhbCByZXZpZXcuCgpUaGUgYnVncyByYW5nZSBmcm9tIENy
aXRpY2FsIChvZl9ub2RlIHJlZmVyZW5jZSBsZWFrcywgdXNlLWFmdGVyLWZyZWUpCnRvIE1lZGl1
bSAodW5jaGVja2VkIHJldHVybiB2YWx1ZXMpLCBhbmQgc3BhbiA1IGRpZmZlcmVudCBzb3VyY2Ug
ZmlsZXMuCkVhY2ggcGF0Y2ggYWRkcmVzc2VzIGV4YWN0bHkgb25lIGJ1ZyB0byBmYWNpbGl0YXRl
IHJldmlldyBhbmQgYmlzZWN0aW9uLgoKU3VtbWFyeSBvZiBmaXhlczoKCiAgUGF0Y2ggMS82IChD
cml0aWNhbCk6IEZpeCBvZl9ub2RlIHJlZmVyZW5jZSBsZWFrIGluCiAgICByb2NrY2hpcF9kcm1f
ZW5jb2Rlcl9zZXRfY3J0Y19lbmRwb2ludF9pZCgpLiBCb3RoIHN1Y2Nlc3MgYW5kIGVycm9yCiAg
ICBwYXRocyBsZWFrZWQgcmVmZXJlbmNlcyBhY3F1aXJlZCB2aWEgb2ZfZ3JhcGggaGVscGVycy4K
CiAgUGF0Y2ggMi82IChDcml0aWNhbCk6IEZpeCBkYW5nbGluZyBjcnRjLT5zdGF0ZSBpbiB2b3Ay
X2NydGNfcmVzZXQoKS4KICAgIGt6YWxsb2MoKSBmYWlsdXJlIGxlZnQgY3J0Yy0+c3RhdGUgYXMg
YSB1c2UtYWZ0ZXItZnJlZSBwb2ludGVyLgoKICBQYXRjaCAzLzYgKEhpZ2gpOiBGaXggdm9wMl9j
cmVhdGVfY3J0Y3MoKSBlcnJvciBwYXRoIGNsZWFudXAgaW4KICAgIHZvcDJfYmluZCgpLiBGYWls
dXJlcyByZXR1cm5lZCBkaXJlY3RseSB3aXRob3V0IGNhbGxpbmcKICAgIHZvcDJfZGVzdHJveV9j
cnRjcygpLCBsZWFraW5nIG9mX25vZGUgcmVmZXJlbmNlcy4gKHYyOiBmaXhlZAogICAgZG91Ymxl
LWZyZWUgYnkgcmVtb3ZpbmcgbWFudWFsIGRldm1fZnJlZV9pcnEoKSkKCiAgUGF0Y2ggNC82IChI
aWdoKTogRml4IHZtYXAgYWRkcmVzcyBjYWNoaW5nIGluCiAgICByb2NrY2hpcF9nZW1fcHJpbWVf
dm1hcCgpLiBOZXcgdm1hcCgpIHJlc3VsdHMgd2VyZSBub3Qgc2F2ZWQgdG8KICAgIHJrX29iai0+
a3ZhZGRyLCBjYXVzaW5nIHJlcGVhdGVkIG1hcHBpbmdzIGFuZCBwb3RlbnRpYWwgbGVha3MuCgog
IFBhdGNoIDUvNiAoSGlnaCk6IEZpeCBsZWFrZWQgdmJsYW5rIGV2ZW50IGluCiAgICB2b3BfY3J0
Y19hdG9taWNfZGlzYWJsZSgpLiBQZW5kaW5nIHZvcC0+ZXZlbnQgd2FzIHdhcm5lZCBidXQgbmV2
ZXIKICAgIHNlbnQsIGNhdXNpbmcgdXNlcnNwYWNlIGhhbmdzIGFuZCB2YmxhbmsgcmVmZXJlbmNl
IGxlYWtzLiAodjI6CiAgICBmaXhlZCBjaGVja3BhdGNoIGZvcm1hdCBlcnJvcikKCiAgUGF0Y2gg
Ni82IChNZWRpdW0pOiBDaGVjayByZXR1cm4gdmFsdWUgb2YgY2RuX2RwX2dyZl93cml0ZSgpIGlu
CiAgICBjZG5fZHBfZW5hYmxlX3BoeSgpIGVycm9yIHBhdGguIElnbm9yZWQgcmV0dXJuIHZhbHVl
IGNvdWxkIGxlYXZlCiAgICBHUkYgcmVnaXN0ZXJzIGluIGFuIGluY29uc2lzdGVudCBzdGF0ZS4K
CkFsbCBwYXRjaGVzIGhhdmUgYmVlbiB2ZXJpZmllZCBhZ2FpbnN0IGNoZWNrcGF0Y2gucGwgLS1z
dHJpY3QuCgpTaWduZWQtb2ZmLWJ5OiBKaWFxaSA8c2hpamlhcWlfZGV2ZWxvcEAxNjMuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jICAgICAgIHwgIDUgKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgIHwgMTQgKysr
KysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyAg
fCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jICB8IDEx
ICsrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
YyB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCg==


