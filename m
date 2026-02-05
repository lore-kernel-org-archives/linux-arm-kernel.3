Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA0ECD996
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVipZHTtEtAsUZ0knGXyLSrIQWXOrOHoviVlDOj8xh8=; b=kSsLlAoETDgOKg1mG3x9pvw82r
	z51zWiwROVMy94fO4zD1kddheXFlsEQ+z4Yz/dHJ+91gBbDTPEw9y42RrmeV/izFQcmMbvLl0xUau
	Cq2FLQGA21CKScIVw8/B+VQ0k71Fnxz68cLFZXXN5IlXxF9Hb5wuRrhzjArCjDqmVcKf2gRLCC3hX
	yue+7r0axd6/Gu4gBxMwaGZqfCjksI0dlhDFyDcbOT/EmT9LBjZ6f+ToFZTr3M7hkGGpydrq+ywTI
	jRRdJO05bxsvk/+yjAwauuU5KP36d4E7XOsCbJ+L5IjfPzZkF83+uM5r/5dp9cKB1Zcj7BZlb9DrL
	nSKg9nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4NA-0000000ANhi-1eQG;
	Thu, 05 Feb 2026 18:46:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4N6-0000000ANgg-2JSZ;
	Thu, 05 Feb 2026 18:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770317175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YkR+wT+X4Rb4vcb6yiBeFLUcErrR6ceCQQyiaUZkr+9bDVkzPXysW3A2PzfkEF2LSlsUjC4h7gHxuDXcYgs8j4bUmG8Kf3w9jRo6h04qlx6Z69VzGpS/X5rcNx3iJKCtYfqH5VCgr48o5b67YwGNXglEHj0LUsALaLaxL5/B37A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770317175; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bVipZHTtEtAsUZ0knGXyLSrIQWXOrOHoviVlDOj8xh8=; 
	b=hjJkx1m+Pm4TLqPHv0+mDvAvVayHHcgxpHC8jga5gE0ilhflM4wnahbRwRozqBacvqEE4p8X0KalHb5UxAM+zaWWZiiLm/BsjeSuM16zkPF1/yseSVZC5igoDZ/PTgJBA5PZWz1/vwLgys9hrO9iO4J4cgg8OYZV1MhFDiCka6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770317175;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=bVipZHTtEtAsUZ0knGXyLSrIQWXOrOHoviVlDOj8xh8=;
	b=QWJUCqoKL7iv7EqGpna37OO8Es2mDtSViHfd7pgg3eOcxCrLjR8FbIqhIjeP1+Ge
	cfz6iM6qr2WhG1fyZGJkhqZfCOVuGY767AWSSHG2Rb/HE9Qq1ctVqQHY48jYuPb5hRk
	PC7oGq8e8jfL8ofirQxKV0HYbKFK5mKh1eeLogKA=
Received: by mx.zohomail.com with SMTPS id 1770317174175743.7903155764141;
	Thu, 5 Feb 2026 10:46:14 -0800 (PST)
Message-ID: <02b19b310070df99e13aac97f1034299fa9652a2.camel@collabora.com>
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=
 <ck.hu@mediatek.com>,  "chunkuang.hu@kernel.org"	
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>,  "greenjustin@chromium.org"	
 <greenjustin@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 "dri-devel@lists.freedesktop.org"	 <dri-devel@lists.freedesktop.org>, Nancy
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=	
 <Nancy.Lin@mediatek.com>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, Jason-JH Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=	 <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone
 <daniels@collabora.com>,  "linux-mediatek@lists.infradead.org"	
 <linux-mediatek@lists.infradead.org>, "kernel@collabora.com"	
 <kernel@collabora.com>
Date: Thu, 05 Feb 2026 13:46:12 -0500
In-Reply-To: <b640f9839f16980b6e9582815ce8588180237977.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
		 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
	 <b640f9839f16980b6e9582815ce8588180237977.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_104632_629866_36950CDF 
X-CRM114-Status: GOOD (  14.54  )
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

T24gTW9uLCAyMDI2LTAyLTAyIGF0IDA4OjQ2ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToKPiBPbiBUdWUsIDIwMjUtMTItMzAgYXQgMTE6MDMgLTAzMDAsIE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIHdyb3RlOgo+ID4gRnJvbTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3Nh
bmRyb0Bjb2xsYWJvcmEuY29tPgo+ID4gCj4gPiBJbiBBRkJDIG1vZGUsIE9WTF9TUkNfU0laRSBt
dXN0IGJlIGJsb2NrIGFsaWduZWQuIER1ZSB0byB0aGlzCj4gPiBsaW1pdGF0aW9uCj4gPiBvZiB0
aGUgQUZCQyBmb3JtYXQsIE9WTF9DTElQIG5lZWRzIHRvIGJlIHVzZWQgdG8gYWNoaWV2ZSB0aGUK
PiA+IGRlc2lyZWQKPiA+IG91dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0
aW5nIHRoZSBhbGlnbm1lbnQKPiA+IGNvbnN0cmFpbnRzLgo+ID4gRmFpbHVyZSB0byBkbyB0aGlz
IHdpbGwgcmVzdWx0IGluIHZibGFuayB0aW1lb3V0cyBhbmQgbm8gcmVuZGVyZWQKPiA+IG91dHB1
dAo+ID4gd2hlbiB0aGUgQUZCQyBkYXRhIHNvdXJjZSBpc24ndCBhbGlnbmVkIHRvIHRoZSBBRkJD
IGJsb2NrICgzMng4KS4KPiA+IAo+ID4gQ29uZmlndXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBB
RkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLgo+ID4gCj4gPiBUaGUgZm9sbG93aW5nIGlsbHVz
dHJhdGVzIGhvdyB0aGUgYWxpZ25tZW50IGlzIGFjaGlldmVkIHRocm91Z2ggdGhlCj4gPiBjbGlw
Cj4gPiBzZXR0aW5ncyBmb3IgdGhlIGhvcml6b250YWwgY29vcmRpbmF0ZXMsIHRoZSB2ZXJ0aWNh
bCBjb29yZGluYXRlcwo+ID4gYXJlCj4gPiBhbmFsb2dvdXM6Cj4gPiAKPiA+IC8tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1cCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+IFwtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0vCj4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oCB8Cj4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHNyYy54McKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNyYy54MsKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwKPiA+
IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58wqDCoMKgwqDC
oMKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmNfd2lkdGjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiAKPiBUaGlzIHBhdGNoIGxvb2tzIHRvIG1l
Lgo+IEJ1dCAiSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBibG9jayBhbGlnbmVk
Iiwgc28gdGhpcyBncmFwaAo+IHNob3VsZCBzaG93IGFzOgo+IAo+IMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqAgc3JjLngxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjLngywqAgfAo+
IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8Cj4g
wqDCoMKgwqAgTiAqIEFGQkNfREFUQV9CTE9DS19XSURUSMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oCBNICogQUZCQ19EQVRBX0JMT0NLX1dJRFRICj4gwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfAo+
IMKgwqDCoMKgIHw8LS0tLS0+fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8PC0tLS0tPnwKPiDCoMKgwqDCoCB8Y2xpcF9sZWZ0wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsaXBfcmlnaHQKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+IMKgwqDCoMKgIHw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PnwKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjX3dpZHRowqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8CgpBaCB5ZXMgaW5kZWVkLCB0aGFua3MgZm9yIHNwb3R0
aW5nIHRoYXQhCgotLSAKVGhhbmtzLAoKTsOtY29sYXMK


