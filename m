Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177A4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xItSIxShYGLizEiPeNAw2E0IXnl6XenbDcDTP5neiw=; b=dEQXyvlFhn0wl62K0BQi58VdP8
	889ygs2X7bSdzYHA/Ymw1r6l3/Y9K1s7hr8fegKGG44OxM6PioL0rGdpIykK1D7Z5QlnBoUjuXPVu
	+89gEGMJ6HtvEahX1Vewwl6TSsyLESn1fXisxPe8kZiO9AGIThUbDFZ/ZuVWLLz3+nrUIM+DisvGn
	GR7lxM7b+SENhkwkyiiVqHDoEevMuk1oA/KWiBZ+LFHHzaWmnSTINmA5yTGV6xhyrD1cogedRUQUa
	5LidxT5NaK3NJe6O6oK6VeWhrw1VHJfUr2tViVTpkQy0Z9gFr6lguVj4nsgH66RzV8CYOMCNpZ8aB
	x4RGKPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJIF-0000000AF44-0hkI;
	Thu, 02 Jan 2025 11:23:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJCh-0000000AELM-1drd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:17:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502A1PJ6028659;
	Thu, 2 Jan 2025 12:17:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0xItSIxShYGLizEiPeNAw2E0IXnl6XenbDcDTP5neiw=; b=qAgP656flRQouaIy
	0guIhoP9E0Yyyue5L0iYG8n4UuLuxjanolFg/wSdO26j4SsjxLTMlK9ogzVvvcmv
	83n7ThZ02ljMPZUA4PgDL9axSQJN0ZYt4u6iJAhh/I2IrnEa4QB8zp34yzZEEzWb
	Bp5NggKq2nUNSPwRIEwbUomKdhI1WWe6l5qVAw/6nuvXPRIrj6sO8etAI9nqagI7
	IoUiKbTX5QJZKKQnr4dUL+xzM7A68ldBT34As8vH9366pjOd+v5UOCZVktj88Zhh
	iAYJt5yJbio0PrXb2y020wSITZhhk2E6bLUZN+AQHGtT7T7eyA9ur0YTtzCoeHr6
	n1M8PA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43vuwmbx6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 12:17:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DCB540048;
	Thu,  2 Jan 2025 12:16:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FA0627607A;
	Thu,  2 Jan 2025 12:15:18 +0100 (CET)
Received: from [192.168.8.15] (10.252.9.169) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 2 Jan
 2025 12:15:17 +0100
Message-ID: <01c0ce6be637669ed07cfaf0aa6ef27fed7b8b16.camel@foss.st.com>
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, Mingwei Zheng <zmw12306@gmail.com>
CC: <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 2 Jan 2025 12:15:15 +0100
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
References: <20241215204014.4076659-1-zmw12306@gmail.com>
	 <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.9.169]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_031727_714758_FF4205EE 
X-CRM114-Status: GOOD (  15.79  )
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

T24gTW9uLCAyMDI0LTEyLTE2IGF0IDAwOjQxICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBP
biAxMi8xNS8yNCA5OjQwIFBNLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4g
PiBAQCAtMTYxNywxMCArMTYwMiwxOCBAQCBpbnQgc3RtMzJfcGN0bF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVJTlZBTDsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
cGN0bC0+YmFua3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5rcywgc2l6ZW9mKCpwY3RsLT5iYW5r
cyksCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdG
UF9LRVJORUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAKPiBQbGVhc2UgZHJvcCB0
aGlzIG9uZSBjaGFuZ2UuCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5iYW5rcykK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gPiDC
oCAKPiA+ICvCoMKgwqDCoMKgwqDCoHBjdGwtPmNsa3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5r
cywgc2l6ZW9mKCpwY3RsLT5jbGtzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5jbGtzKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0g
MDsgaSA8IGJhbmtzOyArK2kpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGN0
bC0+Y2xrc1tpXS5pZCA9ICIiOwo+IAo+IElzIHRoaXMgXiBhc3NpZ25tZW50IG5lY2Vzc2FyeSA/
IElmIHNvLCB3aHkgPwoKVGhlIGV4aXN0aW5nIERUcyBkb24ndCBoYXZlIHRoZSAnY2xvY2stbmFt
ZXMnIHByb3BlcnR5LCB3aG9zZSB2YWx1ZSBpcyB1c2VkIHRvIHNldCB0aGlzIHN0cnVjdCBjbGtf
YnVsa19kYXRhOjppZC4KV2l0aCB0aGlzIGZpZWxkIGtlcHQgYXQgTlVMTCwgdGhlIGVycm9yIG1l
c3NhZ2VzIGluIGNsa19idWxrX2VuYWJsZSgpIGFuZCBzaW1pbGFyIHNob3VsZCBwcmludCAnKG51
bGwpJy4KVGhpcyBsaW5lIHNldHMgaXQgdG8gZW1wdHkgc3RyaW5nLgpJIHdvdWxkIHNheSBpdCdz
IG5vdCBuZWNlc3NhcnksIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyBiZXR0ZXIgdG8gaGF2ZToK
IkZhaWxlZCB0byBlbmFibGUgY2xrICcnOiAlZCIKb3IKIkZhaWxlZCB0byBlbmFibGUgY2xrICco
bnVsbCknOiAlZCIKCkFudG9uaW8K


