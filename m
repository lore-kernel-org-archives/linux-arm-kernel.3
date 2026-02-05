Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B04ECD998
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 19:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6Qb+kMGvysBXnMkQffW3lm0/z4W8L2rlkrTy2pFEc0=; b=fuDSB9xR5q53PkUq1dRc8rKoCq
	Uk1Uz/upn9lmUN82rhgo6Zl5KnNV/wZOwmnXq9LP7Kvw7xMk0rMOB6ZraZLVtPudx+fC+tbRpZ0VE
	GVvAlnsDwCTWjP4gSgAMgf9XjniARcdrJ1C7K0m4Ud5Ahe6F9hVO/FpD2W/mKsrKEtKqzOyQF97sP
	FSsdBNUX9bnwmc1Q6OHXcT6fGf4VTku1HDqWDSv0RJ0ZSxNAxMRTNLPyk4fWtYt/KAxRGSF7aOsll
	PdkKEYjb1fEwzOS8W3YdHbDMElOgSguBGmbbCrwrIY12fC4RjVtWZAHRT6rl5YH9Brr0a3KAmNgET
	+DkUN2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4nI-0000000AQ30-3T2L;
	Thu, 05 Feb 2026 19:13:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4nF-0000000AQ2Z-0a3j;
	Thu, 05 Feb 2026 19:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770318803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z+xw3Y3WvFDUOy3hH85NY5r5cDEJeA6u+ukx4WKTUNjbl76sMNaZqdP0NfGXQP/JKPuGP6gQXG8zmE64f6gJ9IXat2p0Iaqi9BvhOpxeum7OVfIugEpgVpdcPHHrkanGeF9y9GC/xqt1rtKJZ9ts/ElDDFx0BSWNC2ZQxTRS8zQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770318803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R6Qb+kMGvysBXnMkQffW3lm0/z4W8L2rlkrTy2pFEc0=; 
	b=d90s0tIiwru4tr9Rsnz/IW9zYIP/shW+lDgwnK8POAsRjv8sxwHLHaWNAbh4qPyrf8f971JaF3TdRt4pkH5EG+DEDgIoqN9tWD25nTIVcJGmt5E3HMzV/IituNyZjYN7KaYzYQzUhexyQERHVJKQyuXigOo+uBw/k6ihYWWGxUQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770318803;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=R6Qb+kMGvysBXnMkQffW3lm0/z4W8L2rlkrTy2pFEc0=;
	b=ZcSB19c0VZy9ZSGzQJ4z2FnBfcEzpmYxPPYvlf6OiEFPGmeHWNm2qU9hdgVvU5/2
	+M8E9b72bFBuECEWcwL+xlYobCQub+RGpa5thc8wuxlJMMav0XwSMPNe0+EQLlvLnEQ
	7X57Pjp6zSs7rfkJ3M0YhhubEvWpk5h7eRhvhc4w=
Received: by mx.zohomail.com with SMTPS id 177031880234544.88725212487793;
	Thu, 5 Feb 2026 11:13:22 -0800 (PST)
Message-ID: <1394a4b34db511c921b2709a58dfaf28c1cce45c.camel@collabora.com>
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
Date: Thu, 05 Feb 2026 14:13:20 -0500
In-Reply-To: <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
		 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
	 <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_111333_234685_D03E57C1 
X-CRM114-Status: GOOD (  22.16  )
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

T24gVHVlLCAyMDI2LTAyLTAzIGF0IDAyOjAxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
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
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8Cj4gPiDCoMKgwqDCoCBOICogQUZCQ19EQVRBX0JMT0NLX1dJRFRIwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTSAqCj4gPiBBRkJDX0RBVEFfQkxPQ0tfV0lEVEgKPiA+IMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiDCoMKgwqDCoCB8PC0tLS0tPnzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfDwtLS0tLT58Cj4gPiDCoMKgwqDCoMKgIGNs
aXBfbGVmdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGlwX3Jp
Z2h0Cj4gCj4gQXMgSSBrbm93LCBjcm9wIGlzIHVzZWQgdG8gZHJvcCBwaXhlbCBkYXRhLgo+IEZy
b20gdGhlIG5hbWUgb2YgJ2NsaXBfbGVmdCcsIEkgdGhpbmsgaXQgd291bGQgZHJvcCB0aGUgbGVm
dCBwYXJ0IG9mCj4gdGhpcyBpbWFnZS4KPiBCdXQgdXN1YWxseSB0aGUgaW1hZ2UgaXMgYWxpZ25l
ZCB0byB0aGUgbGVmdCAoc3RhcnQgZnJvbSBheGlzIDApIGFuZAo+IGFwcGVuZCBnYXJiYWdlIGRh
dGEgaW4gcmlnaHQgcGFydC4KPiBJZiBzbywgY2xpcF9sZWZ0IHNob3VsZCBiZSB6ZXJvIGFuZCBh
bGwgdGhlIGNsaXAgd291bGQgYmUgY2xpcF9yaWdodC4KPiBUaGlzIGlzIHRoZSBub3JtYWwgYmVo
YXZpb3IuCj4gSWYgT1ZMX0NST1AgZG9lcyBiZWhhdmUgYXMgdGhpcywgYWRkIGNvbW1lbnQgdG8g
ZGVzY3JpYmUgdGhhdAo+IGNsaXBfbGVmdCBkb2VzIG5vdCBkcm9wIHBpeGVsIGRhdGEuCgpCb3Ro
IGNsaXBfbGVmdCBhbmQgY2xpcF9yaWdodCB3b3JrIGluIHRoZSBzYW1lIHdheSwgYnkgZGlzY2Fy
ZGluZyB0aGF0Cm1hbnkgcGl4ZWxzLCBvbiB0aGUgbGVmdCBhbmQgcmlnaHQsIHJlc3BlY3RpdmVs
eSwgb2YgdGhlIHBsYW5lJ3MKZnJhbWVidWZmZXIgd2hlbiBjb21wb3NpdGluZyB0aGUgcGxhbmUg
b24gdGhlIGZpbmFsIGltYWdlLgoKSW4gdGhlIHNpbXBsZXN0IGNhc2UsIHdoZW4gdGhlIGltYWdl
IHRvIGJlIGRpc3BsYXllZCBpcyBsZWZ0LWFsaWduZWQsCmllIHNyYy54MSA9IDAsIHRoZW4geWVz
LCBvbmx5IGNsaXBfcmlnaHQgd2lsbCBiZSB1c2VkIHRvIG1ha2Ugc3VyZSB0aGF0CnRoZSBwbGFu
ZSdzIHdpZHRoIGFsaWducyB3aXRoIHRoZSBBRkJDX0RBVEFfQkxPQ0tfV0lEVEguCgpIb3dldmVy
IGlmIG9ubHkgYSBzdWItcmVnaW9uIG9mIHRoZSBpbWFnZSBpcyB0byBiZSBkaXNwbGF5ZWQsIHRo
ZW4Kc3JjLngxIHdpbGwgYmUgbm9uLXplcm8uIElmIHRoYXQgeCBvZmZzZXQgY29vcmRpbmF0ZSBh
bGlnbnMgd2l0aCB0aGUKQUZCQ19EQVRBX0JMT0NLX1dJRFRILCB0aGVuIGFnYWluIGNsaXBfbGVm
dCB3aWxsIGJlIDAsIGFuZCB3ZSdyZSBiYWNrCmF0IHRoZSBzaW1wbGVzdCBjYXNlLgoKQnV0IGlm
IGl0IGRvZXNuJ3QgYWxpZ24swqB0aGVuIGNsaXBfbGVmdCB3aWxsIG5lZWQgdG8gYmUgdXNlZCB0
byBlbnN1cmUKb25seSB0aGUgaW50ZW5kZWQgc3ViLXJlZ2lvbiBpcyBkaXNwbGF5ZWQsIGV2ZW4g
dGhvdWdoIGl0IHN0YXJ0cyBpbiB0aGUKbWlkZGxlIG9mIGFuIEFGQkMgZGF0YSBibG9jay4KClRo
aXMgaXMgYmVjYXVzZSBub3Qgb25seSB0aGUgd2lkdGggYW5kIGhlaWdodCBpbiBESVNQX1JFR19P
VkxfU1JDX1NJWkUKbmVlZCB0byBiZSBhbGlnbmVkIHRvIHRoZSBBRkJDIGRhdGEgYmxvY2ssIGJ1
dCBhbHNvIHRoZSBzdGFydGluZwphZGRyZXNzIGluIERJU1BfUkVHX09WTF9BRERSLCB3aGlsZSBz
cmMueDEgYW5kIHNyYy54MiBzdXBwbGllZCBieQp1c2Vyc3BhY2UgYXJlIGFyYml0cmFyeSBhbmQg
d29uJ3QgbmVjZXNzYXJpbHkgYWxpZ24sIGhlbmNlIHdlIHVzZSBib3RoCmNsaXBzIGFzIG5lZWRl
ZCB0byBhY2hpZXZlIHRoZSBpbnRlbmRlZCBkaXNwbGF5IG91dGNvbWUgcmVzcGVjdGluZyB0aGUK
aGFyZHdhcmUgY29uc3RyYWludHMuCgotLSAKVGhhbmtzLAoKTsOtY29sYXMK


