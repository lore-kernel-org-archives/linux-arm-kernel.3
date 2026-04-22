Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC09F94CD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 06:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS2QBWs2obdiLzxAoZ0EJnbYRNECZXvcOmREgencDsI=; b=eJpByZpSH3qjyPTCVD1+GNX/HM
	5p0i59/xSkYadTdcG1CnCBlpk4SPRNTbftvRyjairdJd1LY8kIrN5jiJ0qF3h8q2gEQ6bdCaVTIhD
	NSlUvkwnaXIqqTtcK7CmjoES8byVJgmQYIJRL8d4wN3buXYfuesy5cCeX+de5HuBOLRqug/e5iBjZ
	I6m+J408ReviXgdYOFg25ZBYxG+6lfkXk+4uOdhoTZ3VI+kjc/kG2Qi0IdYSIlGiaXQVUxX4nkOzE
	+GvwCFWpU2dFv8HPLCL54e9r1chIofdKecyGs6YpSQqacRcmOHAfgUm66coxv+pkVUDb/dmVbR4Tj
	Z2HRkKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRKL-00000009fsk-1ai0;
	Wed, 22 Apr 2026 06:44:49 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRKH-00000009fsJ-0maW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 06:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1776840285; x=1808376285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fS2QBWs2obdiLzxAoZ0EJnbYRNECZXvcOmREgencDsI=;
  b=kF8MpEAJu4AiqK3gD0DFuT3foYkvlNqEOjW+Wzr07UjldJlyU11/Mn8a
   rYZm6pFq7pA0mFrdgLNsuRUr1GqRkY7LYrm2YiiiEgcQIn17Oc7IIADCq
   uhgIgleh9Kt8U2JxyrYUsmf4AfWgbs/1I482Wz2tM4cZKBH3Mkt/jc2EK
   2OAwvj5tkqdHie6R2T6mt567kje+I/1IHz+TV0GryDIQ5iEvSefocK4AH
   yJ/94UZH6D4tn5GBJsr2jlUCAUOHRUKB5eU+zPkLFV7cBeOamEfTGLt1c
   GJma/ckYzT8kHLXFIFKQNOxsTLOBAXP/beYlVnMu0zR7L/5f2gHN+Medh
   g==;
X-CSE-ConnectionGUID: wVTeWmHYSoCCAFjgXUCPeg==
X-CSE-MsgGUID: +HvSaA9xRrqsZCPGoSILhQ==
X-IronPort-AV: E=Sophos;i="6.23,192,1770595200"; 
   d="scan'208";a="17712173"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 06:44:38 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:9319]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.77:2525] with esmtp (Farcaster)
 id bbe86f27-fd78-401d-abb1-03ac4b44e654; Wed, 22 Apr 2026 06:44:38 +0000 (UTC)
X-Farcaster-Flow-ID: bbe86f27-fd78-401d-abb1-03ac4b44e654
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 22 Apr 2026 06:44:36 +0000
Received: from dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com
 (10.253.109.105) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Wed, 22 Apr 2026
 06:44:34 +0000
Date: Wed, 22 Apr 2026 06:44:31 +0000
From: Evangelos Petrongonas <epetron@amazon.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Zeev Zilberman
	<zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260420124032.GO2577880@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.253.109.105]
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_234445_299469_1C0BFFF1 
X-CRM114-Status: GOOD (  19.99  )
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

T24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgMDk6NDA6MzJBTSAtMDMwMCBKYXNvbiBHdW50aG9ycGUg
d3JvdGU6Cj4gT24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgMTI6MzI6MDFQTSArMDAwMCwgRXZhbmdl
bG9zIFBldHJvbmdvbmFzIHdyb3RlOgo+ID4gV2hlbiB0aGUgaGFyZHdhcmUgYWR2ZXJ0aXNlcyBi
b3RoIFN0YWdlIDEgYW5kIFN0YWdlIDIgdHJhbnNsYXRpb24sIHRoZQo+ID4gZHJpdmVyIHByZWZl
cnMgU3RhZ2UgMSBmb3IgRE1BIGRvbWFpbiBhbGxvY2F0aW9uIGFuZCBvbmx5IGZhbGxzIGJhY2sg
dG8KPiA+IFN0YWdlIDIgaWYgU3RhZ2UgMSBpcyBub3Qgc3VwcG9ydGVkLgo+ID4gCj4gPiBTb21l
IGNvbmZpZ3VyYXRpb25zIG1heSB3YW50IHRvIGZvcmNlIFN0YWdlIDIgdHJhbnNsYXRpb24gZXZl
biB3aGVuIHRoZQo+ID4gaGFyZHdhcmUgc3VwcG9ydHMgU3RhZ2UgMS4gCj4gCj4gV2h5PyBZb3Ug
cmVhbGx5IG5lZWQgdG8gZXhwbGFpbiB3aHkgZm9yIGEgcGF0Y2ggbGlrZSB0aGlzLgo+IAo+IElm
IHRoZXJlIHJlYWxseSBpcyBzb21lIEhXIGlzc3VlIEkgdGhpbmsgaXQgaXMgbW9yZSBhcHByb3By
aWF0ZSB0byBnZXQKPiBhbiBJT1JUIGZsYWcgb3IgSURSIGRldGVjdGlvbiB0aGF0IHRoZSBIVyBo
YXMgYSBwcm9ibGVtLgoKSXQncyBub3QgYSBoYXJkd2FyZSBidWcgdGhlcmUncyBubyBJT1JUIG9y
IElEUiBiaXQgdGhhdCB3b3VsZCBtYWtlIHNlbnNlCmhlcmUuCgpUaGUgbW90aXZhdGlvbiBpcyBs
aXZlIHVwZGF0ZSBvZiB0aGUgaHlwZXJ2aXNvcjogd2Ugd2FudCB0byBrZXhlYyBpbnRvIGEKbmV3
IGtlcm5lbCB3aGlsZSBrZWVwaW5nIERNQSBmcm9tIHBhc3N0aHJvdWdoIGRldmljZXMgZmxvd2lu
Zywgd2hpY2gKbWVhbnMgdGhlIFNNTVUncyB0cmFuc2xhdGlvbiBzdGF0ZSBoYXMgdG8gc3Vydml2
ZSB0aGUgaGFuZG92ZXIuIFRoZSBMaXZlClVwZGF0ZSBPcmNoZXN0cmF0b3Igd29yayBbMV0gYW5k
IHRoZSBpbi1wcm9ncmVzc8KgICJpb21tdTogQWRkIGxpdmUKdXBkYXRlIHN0YXRlIHByZXNlcnZh
dGlvbiIgc2VyaWVzIFsyXSBhcmUgYnVpbGRpbmcgZXhhY3RseSB0aGlzIHBsdW1iaW5nCm9uIHRv
cCBvZiBLSE87IFsyXSdzIGNvdmVyIGxldHRlciBjYWxscyBvdXQgQXJtIFNNTVV2MyBzdXBwb3J0
IGFzIGZ1dHVyZQp3b3JrLCBhbmQgYW4gZWFybGllciBSRkMgZnJvbSBBbWF6b24gWzNdIHNrZXRj
aGVkIHRoZSBzYW1lIGlkZWEgZm9yCmlvbW11ZmQuCgpGb3IgdGhpcyB1c2UgY2FzZSwgU3RhZ2Ug
MiBpcyBtYXRlcmlhbGx5IGVhc2llciB0byBwZXJzaXN0IHRoYW4gU3RhZ2UgMSwKZm9yIHN0cnVj
dHVyYWwgcmF0aGVyIHRoYW4gcGVyZm9ybWFuY2UgcmVhc29uczogQW4gUzIgU1RFIGNhcnJpZXMg
dGhlCndob2xlIHRyYW5zbGF0aW9uIGNvbmZpZ3VyYXRpb24gaW5saW5lLiBUbyBoYW5kIG92ZXIg
YW4gUzIgZG9tYWluLCB0aGUKcHJlLWtleGVjIGtlcm5lbCBvbmx5IG5lZWRzIHRvIHByZXNlcnZl
IHRoZSBzdHJlYW0gdGFibGUgcGFnZXMgYW5kIHRoZQpTMiBwZ3RhYmxlIHBhZ2VzLiBBbiBTMSBT
VEUgcG9pbnRzIGF0IGEgQ29udGV4dCBEZXNjcmlwdG9yIHRhYmxlIGFuZCBhcwphIHJlc3VsdCBQ
ZXJzaXN0aW5nIFMxIHRoZXJlZm9yZSByZXF1aXJlcyBwcmVzZXJ2aW5nIHRoZSBDRCB0YWJsZSBw
YWdlcwp0b28sIGFuZCBiZWNhdXNlIHRoZSBDRCBpcyBrZXllZCBieSBBU0lEIGNvb3JkaW5hdGlu
ZyBBU0lEIGlkZW50aXR5CmFjcm9zcyB0aGUgaGFuZG92ZXIuCgpJbiB0aGUgbG9uZyB0ZXJtIHRo
ZSBwbGFuIHNob3VsZCBiZSB0byBwZXJzaXN0IGJvdGggc3RhZ2VzLgpIb3dldmVyLCB1bnRpbCBh
IHBhdGNoIHNlcmllcyB0aGF0IHByb3Blcmx5IGludHJvZHVjZXMgU01NVSBzdXBwb3J0IGZvcgpp
cyBkZXZlbG9wZWQvcG9zdGVkIHdlIHdvdWxkIGxpa2UgdG8gZXhwZXJpbWVudCB3aXRoIFMxK1My
LWNhcGFibGUKaGFyZHdhcmUgd2l0aCBhbiBlYXNpZXIgdG8gaW1wbGVtZW50IGhhbmRvdmVyIG1h
Y2hpbmVyeSwgdGhhdCByZWxpZXMgb24KUzIgdHJhbnNsYXRpb25zLgoKWzFdIGh0dHBzOi8vbHdu
Lm5ldC9BcnRpY2xlcy8xMDIxNDQyLyDigJQgTGl2ZSBVcGRhdGUgT3JjaGVzdHJhdG9yClsyXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMDMyMjA5NDguMjE3NjE1Ny0xLXNraGF3
YWphQGdvb2dsZS5jb20vIOKAlApbUEFUQ0ggMDAvMTRdIGlvbW11OiBBZGQgbGl2ZSB1cGRhdGUg
c3RhdGUgcHJlc2VydmF0aW9uClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5
MTYxMTMxMDIuNzEwNTIyLTEtamdvd2Fuc0BhbWF6b24uY29tLyDigJQgW1JGQwpQQVRDSCAwMC8x
M10gU3VwcG9ydCBpb21tdShmZCkgcGVyc2lzdGVuY2UgZm9yIGxpdmUgdXBkYXRlCgo+IEphc29u
CgpLaW5kIFJlZ2FyZHMsCkV2YW5nZWxvcwoKCgpBbWF6b24gV2ViIFNlcnZpY2VzIERldmVsb3Bt
ZW50IENlbnRlciBHZXJtYW55IEdtYkgKVGFtYXJhLURhbnotU3RyLiAxMwoxMDI0MyBCZXJsaW4K
R2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RvZiBIZWxsbWlzLCBBbmRyZWFzIFN0aWVnZXIKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDI1Nzc2NCBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==


