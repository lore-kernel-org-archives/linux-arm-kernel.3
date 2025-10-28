Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE4ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOVvQiJpGvp6+xA294rJerEG3dTHQnXxn46jZXjb5wY=; b=uddWgK4iB5s/+4Aqi9FS7k3d8N
	961qKPiOUIvd0xh1pODwT0t01cI0cIfiZU9AyQC1RFfRfNPjYNBcvhTSsboG9PGlBZxBGULgN/Xy8
	f1Jq+qJHPFbiNQzQHYQljaHLfMPECRriixUPF6Av1jZLZUOx7Wrupc3eeAOc9qTgXRiybIzX5xUDZ
	Fd6pt47JqlSjfZ0BzFZj0MmwPiLibp77XNc54+RrH1pt3M8u3U0G6iMHJzcMPJ9Kkx1T5iAgQHDs0
	cmRfkCbKG+uICCPxaeDDv+11Ju7OTv+o+hG8o49kzxy1HgeK34V/GhcotwSQU1BaNaqvF7WE/YCcF
	1exswAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXhk-0000000EzvQ-16q8;
	Tue, 28 Oct 2025 00:36:52 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXhh-0000000Ezuw-329s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1761611809; x=1793147809;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=IOVvQiJpGvp6+xA294rJerEG3dTHQnXxn46jZXjb5wY=;
  b=D4FhpE5sI9ROyhZoj7LTzwcE9rhkGuTZ9z6/Gx3X2zPhPEvRGkUcfCsG
   Fda7VBLhJpuJ/ZJhVqzpNduLxSIR98bUkgiStqzhS6wccvYxpnrhMhay2
   rWVKJ+vzUt06QWD27l2DjeJJtLrpt3/xOZv+nfn0twY4QwNh2ht+SQ4pI
   RegUnQn2l+nDg6Op39rvwLSXEvIVEjLY+qRTNq3e64T59x8D2EyCdmWCt
   psO9iBdpjMXi3Snw9r79uTn9kVco96qGd6BOCeIo+ViOm+snnwSMtS18k
   4i4KNLbKlHCor+aA9wRukcSbOmPktC2OEC3QjqjPr76bDtZh2EtqVNEyk
   A==;
X-CSE-ConnectionGUID: 26SJ8qqZRE+FNdoNM3ro3g==
X-CSE-MsgGUID: YiTQtjjxR1CtkjkcG+NhGw==
X-IronPort-AV: E=Sophos;i="6.19,260,1754956800"; 
   d="scan'208";a="5635122"
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Thread-Topic: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 00:36:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:26105]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.58.51:2525] with esmtp (Farcaster)
 id 9f41d556-68c3-4916-acdf-260b786a1eb9; Tue, 28 Oct 2025 00:36:45 +0000 (UTC)
X-Farcaster-Flow-ID: 9f41d556-68c3-4916-acdf-260b786a1eb9
Received: from EX19D032UWA004.ant.amazon.com (10.13.139.56) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 28 Oct 2025 00:36:37 +0000
Received: from EX19D032UWA003.ant.amazon.com (10.13.139.37) by
 EX19D032UWA004.ant.amazon.com (10.13.139.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Tue, 28 Oct 2025 00:36:37 +0000
Received: from EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497]) by
 EX19D032UWA003.ant.amazon.com ([fe80::8e94:8f60:9531:c497%5]) with mapi id
 15.02.2562.029; Tue, 28 Oct 2025 00:36:37 +0000
From: "Bandi, Ravi Kumar" <ravib@amazon.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Manivannan Sadhasivam
	<mani@kernel.org>
CC: "thippeswamy.havalige@amd.com" <thippeswamy.havalige@amd.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Stefan Roese <stefan.roese@mailbox.org>, "Musham,
 Sai Krishna" <sai.krishna.musham@amd.com>, Sean Anderson
	<sean.anderson@linux.dev>, "Yeleswarapu, Nagaradhesh"
	<nagaradhesh.yeleswarapu@amd.com>
Thread-Index: AQHcKoFWBnk90o/gZUOv7QYU+iHxwrTJOZeAgA2kSICAABLnAA==
Date: Tue, 28 Oct 2025 00:36:36 +0000
Message-ID: <C863FB65-E6B8-48B8-A2FF-779330D9BE5A@amazon.com>
References: <20251027232847.GA1488235@bhelgaas>
In-Reply-To: <20251027232847.GA1488235@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.171.62]
Content-Type: text/plain; charset="utf-8"
Content-ID: <34DBB2AF1B6DC649B354F3E881A47C26@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173649_822063_77520B86 
X-CRM114-Status: GOOD (  16.85  )
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

DQoNCj4gT24gT2N0IDI3LCAyMDI1LCBhdCA0OjI44oCvUE0sIEJqb3JuIEhlbGdhYXMgPGhlbGdh
YXNAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBbK2NjIFN0ZWZhbiBldCBh
bF0NCj4gDQo+IE9uIFN1biwgT2N0IDE5LCAyMDI1IGF0IDEyOjM5OjI1UE0gKzA1MzAsIE1hbml2
YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToNCj4+IE9uIFNhdCwgMjAgU2VwIDIwMjUgMjI6NTI6MzIg
KzAwMDAsIFJhdmkgS3VtYXIgQmFuZGkgd3JvdGU6DQo+Pj4gVGhlIHBjaWUteGlsaW54LWRtYS1w
bCBkcml2ZXIgZG9lcyBub3QgZW5hYmxlIElOVHggaW50ZXJydXB0cw0KPj4+IGFmdGVyIGluaXRp
YWxpemluZyB0aGUgcG9ydCwgcHJldmVudGluZyBJTlR4IGludGVycnVwdHMgZnJvbQ0KPj4+IFBD
SWUgZW5kcG9pbnRzIGZyb20gZmxvd2luZyB0aHJvdWdoIHRoZSBYaWxpbnggWERNQSByb290IHBv
cnQNCj4+PiBicmlkZ2UuIFRoaXMgaXNzdWUgYWZmZWN0cyBrZXJuZWwgNi42LjAgYW5kIGxhdGVy
IHZlcnNpb25zLg0KPj4+IA0KPj4+IFRoaXMgcGF0Y2ggYWxsb3dzIElOVHggaW50ZXJydXB0cyBn
ZW5lcmF0ZWQgYnkgUENJZSBlbmRwb2ludHMNCj4+PiB0byBmbG93IHRocm91Z2ggdGhlIHJvb3Qg
cG9ydC4gVGVzdGVkIHRoZSBmaXggb24gYSBib2FyZCB3aXRoDQo+Pj4gdHdvIGVuZHBvaW50cyBn
ZW5lcmF0aW5nIElOVHggaW50ZXJydXB0cy4gSW50ZXJydXB0cyBhcmUNCj4+PiBwcm9wZXJseSBk
ZXRlY3RlZCBhbmQgc2VydmljZWQuIFRoZSAvcHJvYy9pbnRlcnJ1cHRzIG91dHB1dA0KPj4+IHNo
b3dzOg0KPj4+IA0KPj4+IFsuLi5dDQo+PiANCj4+IEFwcGxpZWQsIHRoYW5rcyENCj4+IA0KPj4g
WzEvMV0gUENJOiB4aWxpbngteGRtYTogRW5hYmxlIElOVHggaW50ZXJydXB0cw0KPj4gICAgICBj
b21taXQ6IGMwOThjMTNmNDM2NWU2NzUwMDA5YmU0ZDkwZGJhMzZmYTRhMTliNGUNCj4gDQo+IFBy
ZXR0eSBzdXJlIHdlIGhhdmUgY29uZmlybWF0aW9uIHRoYXQgd2UgZG9uJ3QgbmVlZCBlaXRoZXIg
dGhpcyBwYXRjaA0KPiBvciBTdGVmYW4ncyBwYXRjaCwgc28gSSByZW1vdmVkIHRoZSBwY2kvY29u
dHJvbGxlci94aWxpbngtZG1hIGJyYW5jaC4NCj4gDQo+IEl0IHdhcyBhdCAyMDAyNDc4ZTUwMzQg
KCJQQ0k6IHhpbGlueC14ZG1hOiBFbmFibGUgSU5UeCBpbnRlcnJ1cHRzIikgaW4NCj4gY2FzZSB3
ZSBuZWVkIHRvIHJlc3VycmVjdCBpdC4NCj4gDQo+IElJVUMsIFN0ZWZhbiBjb25maXJtZWQgdGhh
dCBoZSBkaWRuJ3QgbmVlZCB0aGlzIHBhdGNoIChSYXZpJ3MpIFsxXSwNCj4gYW5kIHRoYXQgYWZ0
ZXIgVml2YWRvIGlzIGZpeGVkIHRvIGdlbmVyYXRlIHRoZSBjb3JyZWN0IGludGVycnVwdC1tYXAs
DQo+IGhpcyBwYXRjaCAoU3RlZmFuJ3MpIHdvbid0IGJlIG5lZWRlZCBlaXRoZXIgWzJdLg0KPiAN
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjliYzVlOTItMDRjOS00NzVhLWJhM2Qt
YTVlYTI2ZjFjOTVhQG1haWxib3gub3JnDQo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzljN2U0M2MzLTI0ZTktNGIwOC1hNmNlLTIwMzViNTAyMjZmNEBtYWlsYm94Lm9yZw0KDQpIZWxs
byBCam9ybiwgYW5kIE1hbmkgZXQgYWwuLA0KDQpUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byByZXZpZXcgdGhlIHBhdGNoIGFuZCBleHBsYWluIHRoZSByZWFzb25pbmcuDQoNClNpbmNl
cmx5LA0KUmF2aQ0KDQo=

