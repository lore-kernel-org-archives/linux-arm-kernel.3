Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B2AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG9TJ2L/zACNt5mQUh/jkFvy1Qa2TfFfH4f4dtsjYRI=; b=EPIWG0QCpPPf0hu/Xf++/k14kW
	KULRIsDDh1mP5PY+RGW/Tjj+HwuDejeHI6iq5w+dVl3nbCY8rbE9Y5+6XjhLdSoYup2DgDVjSjtm0
	6ttJFBdC+q4MkKRe+Udj9LPwGr8YngILyGYMmI5sQgqufYt1N7eoNnqa1a0+2zoxpGcrPFWlD+wOd
	MOn6ZulotiWQagob0T/0bfsAyVEUNZfYgR7w6fWMRIKWc18flYBvQ0v6FslANJJde7htQV2nY6HCY
	vK/aaOaRl9WOBhADSK+M+d2bNMqoWTD2fkiinC2Xvs8GP/jSPZse3M9wYZfEnBrRpkbSJOJS/QbR9
	Q70bFnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toMKj-0000000DwnZ-3xnk;
	Sat, 01 Mar 2025 12:52:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toMJ7-0000000Dwgz-26x6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 12:51:10 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 521AZo96011094;
	Sat, 1 Mar 2025 13:50:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JG9TJ2L/zACNt5mQUh/jkFvy1Qa2TfFfH4f4dtsjYRI=; b=C5bnyU29jfv1dGHc
	Mkz6xW6Qc+ZTWsNX33wJs2piEgGT3bRtxBa+NLFA8vMm1puc1yZfthmUV+pK/sGr
	OwfCmEg1qgxrK1I95qlpaWBNxO/4APnsieL7nAgtZ1DDGRlahwWy7C5PZsZntx9+
	CDfp/OA96bMyZzSf9DeS55BImW3Oqv7VIyTFbEITQUBs8v1wnd67vmy7IXg6meCp
	Fu1CX+qDR2JtBIoPQd/NawJKSvPBh+8jPFiMDL76Gy79AeD6PQGsESRKKv46urmq
	9nTTuiPTKwNo4EGUHSzVGLKGZTe57+bdkqU2j/0VR9eZJlI9lZTMHd9LmJr+f9yr
	LDpakw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453tc4avpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 13:50:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 875A6400B0;
	Sat,  1 Mar 2025 13:49:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E5CE586DBE;
	Sat,  1 Mar 2025 13:45:13 +0100 (CET)
Received: from [192.168.8.15] (10.252.9.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 1 Mar
 2025 13:45:11 +0100
Message-ID: <1ae59b115cb2e4570c6e77a01bcdac11dff03ae1.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: use
 IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-amarula@amarulasolutions.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Date: Sat, 1 Mar 2025 13:45:08 +0100
In-Reply-To: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
References: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.9.148]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_05,2025-02-28_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_045106_063558_BCF16B62 
X-CRM114-Status: GOOD (  13.86  )
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

T24gU2F0LCAyMDI1LTAzLTAxIGF0IDEyOjUxICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToK
PiBSZXBsYWNlIHRoZSBudW1iZXIgMiB3aXRoIHRoZSBhcHByb3ByaWF0ZSBudW1lcmljYWwgY29u
c3RhbnQgZGVmaW5lZCBpbgo+IGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNTdjLWRrMi5kdHMgfCAzICsrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTU3Yy1kazIuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2Mt
ZGsyLmR0cwo+IGluZGV4IDVmOWMwMTYwYTljNC4uZGNmMTdjNDkzMDIyIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMKPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1kazIuZHRzCj4gQEAgLTExLDYgKzExLDcgQEAKPiDC
oCNpbmNsdWRlICJzdG0zMm1wMTUtcGluY3RybC5kdHNpIgo+IMKgI2luY2x1ZGUgInN0bTMybXAx
NXh4YWMtcGluY3RybC5kdHNpIgo+IMKgI2luY2x1ZGUgInN0bTMybXAxNXh4LWRreC5kdHNpIgo+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gwqAK
PiDCoC8gewo+IMKgwqDCoMKgwqDCoMKgwqBtb2RlbCA9ICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RN
MzJNUDE1N0MtREsyIERpc2NvdmVyeSBCb2FyZCI7Cj4gQEAgLTY3LDcgKzY4LDcgQEAgJmkyYzEg
ewo+IMKgwqDCoMKgwqDCoMKgwqB0b3VjaHNjcmVlbkAzOCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYyMzYiOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4Mzg+Owo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHRzID0gPDIgMj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludGVycnVwdHMgPSA8MiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Owo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb2Y+Owo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdG91Y2hzY3JlZW4tc2l6ZS14ID0gPDQ4
MD47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0b3VjaHNjcmVlbi1zaXplLXkg
PSA8ODAwPjsKClRoYW5rcyEKClJldmlld2VkLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5i
b3JuZW9AZm9zcy5zdC5jb20+Cg==


