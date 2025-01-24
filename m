Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B76C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Date
	:Subject:CC:To:From:Message-ID:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiaSOjvay0PDEU6IvhGDA9srpEJb+zcTJ9i8VAYmvDs=; b=hAIMnMnKapEDPfAbJEV6IF+v0F
	zVHWCKMDXCFtXo0zT4s2ym7i4O/uLgNE6l784F9KQrax7sutn0MGFct0b75qb7BQjusVo0sP5730d
	FGPKHDEg6FqEAq5KOGMwoboyv2IFNl3P9VrROFAcsiIL5ClCIkrnnvb/wqlUDfhsSmShj7wINthMs
	/GR+YUO6jRTCRy3ELAFAyITB39tHx5ybohDj7hy9O8KNeel7tNM2MsTB89p+P0S8jLRpn+F3Q3xIC
	V70V360or8bqyEqkohPDFGao0Bw5FbxsJpB0q+jVk1UNgP3hLCvWw1lOi4vSSM9XQekZIhFdvfomM
	FYvAY67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGDu-0000000ENwI-2BtJ;
	Fri, 24 Jan 2025 09:43:34 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGCV-0000000ENlK-1R6O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 09:42:08 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso149049639f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 01:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737711726; x=1738316526; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-id:msip_labels
         :content-language:accept-language:in-reply-to:references:date
         :thread-index:thread-topic:subject:cc:to:from:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiaSOjvay0PDEU6IvhGDA9srpEJb+zcTJ9i8VAYmvDs=;
        b=NZYf36wt56jRLV2yIB58qmzXH6ZlfuIo+/hkW5b6hgMxw93LTnjJa50XbdeqvJTHHL
         J8TkCgO2SSPwQ2FXF+qyLYCy3zz5Nnf9cSTghBno7dKTq/gFk/hssrjRQi26pzfXweZx
         X0q1rBcxVNr3alFdgn3/LA1KtX4IPbfWceVQK1c2Bik/f+HkI2V1Y0tFrv4r8Q5x47aU
         y7Zj5qZyhEiv17WDzY768voLLzrHQXecX5FSASOh2hd+edvHvSJ2JzOQqMZwYiUjwopA
         1Hk/01qOqciSMhXrqKntn1QluYI5qpndhO4Y4SIRCbCm9dFQkPcS0tONdIKZ00AUsiQn
         wKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737711726; x=1738316526;
        h=mime-version:content-transfer-encoding:content-id:msip_labels
         :content-language:accept-language:in-reply-to:references:date
         :thread-index:thread-topic:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiaSOjvay0PDEU6IvhGDA9srpEJb+zcTJ9i8VAYmvDs=;
        b=CMlqeYylBCJROLvu+4nAiH00vx3Rh/x5Yyb7XaPBX1+kb02YK+L+A2FVEVnx76cc+w
         pCOiVXewWzdRhBtD1NmAptBnzcKn648eGfzGAQVUsnL/tcWt2rcwnZSaH0x2wEL2sxhQ
         QYrgiNBBsuPpoSTyL16Ujn/5WOqwbLIB6Vn6JblF8+Xfx/2/Ve/zr3lChtiiMlaQFYVW
         sXAGCI38PYZJpn5cMeaHfSZsbfSdU2zA80dR+QJoBQhJFMXNyAFy3OiDS6V3Z4OcyatL
         C8FhxpQTpoZ3YJvwzxjVKnU8BsLSzyd4iqHI7tVYmj4lNkVV3SDJ7H7MqdB1WXWMwbNW
         jqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl5YR+xJtFlxU14cEDFpeFBJmiKTWfZvYGlOBEoO9X0/8zlnuJEW3F8a4KstP2ETBimrsfoDN2Pc/2Ifl4wlQx@lists.infradead.org
X-Gm-Message-State: AOJu0YyQBwsgO7Px71FVr1YsUzsK2CgheP2PhJePMZbxv+ub0ngUyRxN
	R5HJX6caIR8R8Y9+umnE89z9MTt4B+EoCFgXt1jRnN4igPXSfbK6
X-Gm-Gg: ASbGncuNA1jvffuiNXBuBYwhYL5KV++5xW9KocBuLw1HEJZlpWospMyRtEkWHRKfQiE
	lop/JJZ/Cq4bK+OtlL7s+u22nXhpqbWnRFk300fZlz1R83D5CUi4dhKd9cqiLjTPIJ+d0dqZqGB
	z/gLLVq7LtWlt6MPTBZkYNk7nsqOrEu2FsnkSeJ701wCGvh6x3HfMFYU2YaDUk7wRKPgd+tf/3U
	DRgbyBvHGr+kK+MsMbn+GO+4RBQ8w5sHvM7q2qpyzAhaJjdwnEcok+EmAg6XLOYTueggxrwwoxX
	rV2MXfbFKhDNJQaRR7IGz64FBu2lT6qpeGsjtSIoF+2hsv4V2Ietxjrf6mwtnL+0jNY=
X-Google-Smtp-Source: AGHT+IGPe4dH5t61pJCPEVfqud58UJpTXEmd8lE5AaqTQQZAHJ3kvJz0t72oV4bVGYoL13iA4wBmPA==
X-Received: by 2002:a05:6e02:12ec:b0:3ce:afa6:93cf with SMTP id e9e14a558f8ab-3cf74495d71mr198873785ab.17.1737711725772;
        Fri, 24 Jan 2025 01:42:05 -0800 (PST)
Received: from AS8PR05MB8006.eurprd05.prod.outlook.com ([2603:1026:c03:646a::5])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1db6c462sm465754173.92.2025.01.24.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 01:42:05 -0800 (PST)
Message-ID: <6793606d.050a0220.a73fe.0803@mx.google.com>
X-Google-Original-Message-ID: 6.8
From: zuoqian <zuoqian113@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Sudeep Holla <sudeep.holla@arm.com>, Ionela Voinescu
	<ionela.voinescu@arm.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Thread-Topic: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Thread-Index: ATNxLTEzzjf736TYkxRUUnZFlp+LHjNkMjQxbnl0VHo0MzE0Njg4ODg4
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 24 Jan 2025 09:42:01 +0000
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <ad11dfc1-5e88-4421-b427-3955d4220133@stanley.mountain>
 <Z5IzMhTOhtujyH0n@bogus>
 <8ebf8f26-c3d9-43c0-b417-ce3131a84eb4@stanley.mountain>
In-Reply-To: <8ebf8f26-c3d9-43c0-b417-ce3131a84eb4@stanley.mountain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: text/plain; charset="gb2312"
Content-ID: <62F0EB0C10D4AF4A92DE832A2CEA22B1@1>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_014207_393216_6CDBC089 
X-CRM114-Status: GOOD (  39.31  )
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

T24gVGh1LCBKYW4gMjMsIDIwMjUgYXQgMDQ6MDQ6MTNQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAyNSBhdCAxMjoxNjo1MFBNICswMDAwLCBTdWRlZXAg
SG9sbGEgd3JvdGU6Cj4gPiAoZm9yIHNvbWUgcmVhc29uIEkgZG9uJ3QgaGF2ZSB0aGUgb3JpZ2lu
YWwgZW1haWwpCj4gPiAKPiA+IE9uIFRodSwgSmFuIDIzLCAyMDI1IGF0IDAyOjEyOjE0UE0gKzAz
MDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSmFuIDIzLCAyMDI1IGF0IDA3
OjUzOjIwQU0gKzAwMDAsIHp1b3FpYW4gd3JvdGU6Cj4gPiA+ID4gVGhlIENQVSByYXRlIGZyb20g
Y2xrX2dldF9yYXRlKCkgbWF5IG5vdCBiZSBkaXZpc2libGUgYnkgMTAwMAo+ID4gPiA+IChlLmcu
LCAxMzMzMzMzMzMpLiBCdXQgdGhlIHJhdGUgY2FsY3VsYXRlZCBmcm9tIGZyZXF1ZW5jeSBpcyBh
bHdheXMKPiA+ID4gPiBkaXZpc2libGUgYnkgMTAwMCAoZS5nLiwgMTMzMzMzMDAwKS4KPiA+ID4g
PiBDb21wYXJpbmcgdGhlIHJhdGUgY2F1c2VzIGEgd2FybmluZyBkdXJpbmcgQ1BVIHNjYWxpbmc6
Cj4gPiA+ID4gImNwdWZyZXE6IF9fdGFyZ2V0X2luZGV4OiBGYWlsZWQgdG8gY2hhbmdlIGNwdSBm
cmVxdWVuY3k6IC01Ii4KPiA+ID4gPiBXaGVuIHdlIGNob29zZSB0byBjb21wYXJlIGZyZXF1ZW5j
eSBoZXJlLCB0aGUgaXNzdWUgZG9lcyBub3Qgb2NjdXIuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogenVvcWlhbiA8enVvcWlhbjExM0BnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+
ID4gIGRyaXZlcnMvY3B1ZnJlcS9zY3BpLWNwdWZyZXEuYyB8IDUgKysrLS0KPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL3NjcGktY3B1ZnJlcS5jIGIvZHJpdmVy
cy9jcHVmcmVxL3NjcGktY3B1ZnJlcS5jCj4gPiA+ID4gaW5kZXggY2Q4OWMxYjk4MzJjLi4zYmZm
NGJiNWFiNGEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL3NjcGktY3B1ZnJl
cS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9jcHVmcmVxL3NjcGktY3B1ZnJlcS5jCj4gPiA+ID4g
QEAgLTM5LDggKzM5LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBzY3BpX2NwdWZyZXFfZ2V0X3Jh
dGUodW5zaWduZWQgaW50IGNwdSkKPiA+ID4gPiAgc3RhdGljIGludAo+ID4gPiA+ICBzY3BpX2Nw
dWZyZXFfc2V0X3RhcmdldChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSwgdW5zaWduZWQg
aW50IGluZGV4KQo+ID4gPiA+ICB7Cj4gPiA+ID4gLQl1NjQgcmF0ZSA9IHBvbGljeS0+ZnJlcV90
YWJsZVtpbmRleF0uZnJlcXVlbmN5ICogMTAwMDsKPiA+ID4gCj4gPiA+IHBvbGljeS0+ZnJlcV90
YWJsZVtpbmRleF0uZnJlcXVlbmN5IGlzIGEgdTMyIHNvIGluIHRoaXMgb3JpZ2luYWwKPiA+ID4g
Y2FsY3VsYXRpb24sIGV2ZW4gdGhvdWdoICJyYXRlIiBpcyBkZWNsYXJlZCBhcyBhIHU2NCwgaXQg
Y2FuJ3QgYWN0dWFsbHkKPiA+ID4gYmUgbW9yZSB0aGFuIFVJTlRfTUFYLgo+ID4gPgo+ID4gCj4g
PiBBZ3JlZWQgYW5kIHVuZGVyc3Rvb2QuCj4gPiAKPiA+ID4gPiArCXVuc2lnbmVkIGxvbmcgZnJl
cSA9IHBvbGljeS0+ZnJlcV90YWJsZVtpbmRleF0uZnJlcXVlbmN5Owo+ID4gPiA+ICAJc3RydWN0
IHNjcGlfZGF0YSAqcHJpdiA9IHBvbGljeS0+ZHJpdmVyX2RhdGE7Cj4gPiA+ID4gKwl1NjQgcmF0
ZSA9IGZyZXEgKiAxMDAwOwo+ID4gPgo+ID4gPiBTbyB5b3UndmUgZml4ZWQgdGhpcyBieSBjYXN0
aW5nIHBvbGljeS0+ZnJlcV90YWJsZVtpbmRleF0uZnJlcXVlbmN5Cj4gPiA+IHRvIHVuc2lnbmVk
IGxvbmcsIHdoaWNoIGZpeGVzIHRoZSBwcm9ibGVtIG9uIDY0Yml0IHN5c3RlbXMgYnV0IGl0IHN0
aWxsCj4gPiA+IHJlbWFpbnMgb24gMzJiaXQgc3lzdGVtcy4gIEl0IHdvdWxkIGJlIGJldHRlciB0
byBkZWNsYXJlIGZyZXEgYXMgYSB1NjQuCj4gPiA+Cj4gPiAKPiA+IEp1c3QgdHJ5aW5nIHRvIHVu
ZGVyc3RhbmQgaWYgdGhhdCBtYXR0ZXJzLiBmcmVxIGlzIGluIGtIeiBhcyBjb3BpZWQKPiA+IGZy
b20gcG9saWN5LT5mcmVxX3RhYmxlW2luZGV4XS5mcmVxdWVuY3kgYW5kIHdlIGNvbXBhcmUgaXQg
d2l0aAo+ID4ga0haIGJlbG93IGFzIHRoZSBvYnRhaW5lZCBjbG9jayByYXRlIGlzIGRpdmlkZWQg
YnkgMTAwMC4gV2hhdCBhbSBJCj4gPiBtaXNzaW5nID8gSWYgaXQgaGVscHMsIGl0IGNhbiBiZSBy
ZW5hbWVkIGFzIGZyZXFfaW5fa2h6IGFuZCBldmVuIGtlZXAKPiA+IGl0IGFzICJ1bnNpZ25lZCBp
bnQiIGFzIGluIHN0cnVjdCBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZS4KPiA+IAo+IAo+IAo+IEkg
bWlzdW5kZXJzdG9vZCB0aGUgaW50ZWdlciBvdmVyZmxvdyBidWcgYmVjYXVzZSBJIHJlYWQgdG9v
IG11Y2ggaW50byB0aGUKPiBmYWN0IHRoYXQgInJhdGUiIHdhcyBkZWNsYXJlZCBhcyBhIHU2NC4g
IEl0IHdvdWxkIGhhdmUgYmVlbiBmaW5lIHRvCj4gZGVjbGFyZSBpdCBhcyBhIHVuc2lnbmVkIGxv
bmcuICBUaGUgY3B1ZnJlcSBpbnRlcm5hbHMgZG9uJ3Qgc3VwcG9ydAo+IGFueXRoaW5nIG1vcmUg
dGhhbiBVTE9OR19NQVguICBJIGhhdmUgaGVhcmQgc29tZW9uZSBzYXkgdGhhdCBuZXcgc3lzdGVt
cwo+IGFyZSBidW1waW5nIHVwIGFnYWluc3QgdGhlIDRHSHogbGltaXQgYnV0IHByZXN1bWFibHkg
dGhhdCB3b3VsZCBvbmx5IGJlCj4gaGlnaCBlbmQgNjRiaXQgc3lzdGVtcywgbm90IG9sZCAzMmJp
dCBzeXN0ZW0uCj4gCj4gVGhlIC0+ZnJlcV90YWJsZVtdIGZyZXF1ZW5jeSBpcyBpbiBrSHogc28g
YSB1MzIgaXMgZmluZS4gIEkgZ3Vlc3MgaWYgd2UKPiBnZXQgZnJlcXVlbmNpZXMgb2YgYSBUSHog
dGhlbiB3ZSdsbCBoYXZlIHRvIHVwZGF0ZSB0aGF0LiAgQnV0IHdoZW4gd2UKPiBjb252ZXJ0IHRv
IEh6IHRoZW4gd2UgbmVlZCBhIGNhc3QgdG8gYXZvaWQgYW4gaW50ZWdlciBvdmVyZmxvdyBmb3Ig
c3lzdGVtcwo+IHdoaWNoIGFyZSBvdmVyIHRoZSA0R0h6IGJvdW5kYXJ5Lgo+IAo+IAl1bnNpZ25l
ZCBsb25nIHJhdGUgPSAodW5zaWduZWQgbG9uZylraHogKiAxMDAwOwo+IAo+IFRoZSBzZWNvbmQg
YnVnIGlzIHRoYXQgd2UgbmVlZCB0byBjb21wYXJlIGtIeiBpbnN0ZWFkIG9mIEh6IGFuZCB0aGF0
J3MKPiBzdHJhaWdodCBmb3J3YXJkLgo+IAo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+CgpU
aGFuayB5b3UgZm9yIHlvdXIgdmFsdWFibGUgZmVlZGJhY2suSSB3aWxsIG1ha2UgdGhlIGNoYW5n
ZXMgdG8gdGhlIHBhdGNoIGFuZCAKcmVzdWJtaXQgaXQsIGluY2x1ZGluZyByZW5hbWluZyBmcmVx
IGFuZCBrZWVwaW5nIGl0IGFzIGFuICJ1bnNpZ25lZCBpbnQiLgoKUmVnYXJkcywKWnVvcWlhbgo=

