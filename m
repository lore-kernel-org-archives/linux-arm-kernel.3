Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE86E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fwn8Lk/ttab1XUIk4P6AXTCr+1bXvJRipK2h+AOLyhY=; b=oxOUIqlm2g8oSkrJ5KLS25+Etu
	YEJSplSxTyudjljeRmOKd3a6asnfvkAPUDcIYkXsLhlaIuaQxTwi5pl1LKftuqZgg+3Zj8hd0vKe5
	dmPg/ROdu3vNrd1HaILgTZPXLPFB3Obzl0j1lgH7udisH/jjHSkuJLDW5ruQ4Bho3qKo878YOcHk7
	7sTAesZdZYp/TaAxSplltmo5dMe0qnSqwikiGivARmE5pBiyAnVscEFE5o795Qhu+TyNypu4k6blM
	nsTLOE5gLjWrlbbPJtLXK9q0hZNYUEFdkDuw2bBWbZ5CBHAL3HnxuWg3bkeHigcJeCdJYFzXu4Tnl
	jqsxJrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM66x-00000003u5z-1syv;
	Fri, 13 Dec 2024 13:53:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5z1-00000003s2x-13p2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 13:45:32 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwJxn007433;
	Fri, 13 Dec 2024 14:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Fwn8Lk/ttab1XUIk4P6AXTCr+1bXvJRipK2h+AOLyhY=; b=Y76ajKurx4fFzyX8
	mGfXG58Uz0SX5DBiuxE/ritxhAKXfjrTebRd3mFacDoLdlKNLM7vHUignbGci4q4
	CPRDjo9uuAtUvE2kEo3TEK0FiS8vPxx0cfbPdP3TXw7Sy8/8VG3MyKXqNqg2aQLU
	cC7nmN2OjotF41ZulTzUOkOpMTuKCUumZkz5SHh5vkqNaGFB3Aoy5beqgudEjlLE
	cowPCsgMjt5hhIRV1lyKll1yvBu5Joy0Luj36kKDX2shgv2UIPvL02aJ3GIaYdxs
	ldMNMtlCJZjeS4Bdb+UbmKfUzLDYs5g6UstbBHCc4Nw5sC2BtTc4QrY+c5/Vmhxf
	PPR+Hg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ffwc8mkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 14:45:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3D8140049;
	Fri, 13 Dec 2024 14:44:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF55F27667B;
	Fri, 13 Dec 2024 14:43:21 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 14:43:21 +0100
Message-ID: <05081f6ebe19ce3e0e989aebf415c9ff86a39e3d.camel@foss.st.com>
Subject: Re: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, Mingwei Zheng <zmw12306@gmail.com>
CC: <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Fri, 13 Dec 2024 14:43:18 +0100
In-Reply-To: <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
	 <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_054531_585239_493E2589 
X-CRM114-Status: GOOD (  15.51  )
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDEyOjQ1ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBP
biAxMi8xMy8yNCAyOjA5IEFNLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4g
PiBAQCAtMTM5Nyw3ICsxMzk3LDcgQEAgc3RhdGljIGludCBzdG0zMl9ncGlvbGliX3JlZ2lzdGVy
X2Jhbmsoc3RydWN0IHN0bTMyX3BpbmN0cmwgKnBjdGwsIHN0cnVjdCBmd25vZGUKPiA+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgIAo+ID4gwqAgZXJyX2NsazoKPiA+IC3CoMKgwqDC
oMKgwqDCoGNsa19kaXNhYmxlX3VucHJlcGFyZShiYW5rLT5jbGspOwo+ID4gK8KgwqDCoMKgwqDC
oMKgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjdGwtPmNsa3NbcGN0bC0+bmJhbmtzXS5jbGspOwo+
IAo+IAo+IFNob3VsZCB0aGlzIGJlCj4gCj4gLWNsa19kaXNhYmxlX3VucHJlcGFyZShwY3RsLT5j
bGtzW3BjdGwtPm5iYW5rc10uY2xrKTsKPiArY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjdGwtPmNs
a3NbYmFuay0+YmFua19ucl0uY2xrKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXl5eXl5eCj4gCgpO
byBNYXJlaywKcGN0bC0+bmJhbmtzIGlzIHRoZSBwcm9ncmVzc2l2ZSBpbmRleCBvZiB0aGUgYmFu
aydzIHN1Ym5vZGUsIHRoYXQgaXMgYWxzbyB0aGUgaW5kZXggZm9yIHBjdGwtPmNsa3NbXS4KSW5z
dGVhZCBiYW5rLT5iYW5rX25yIGNhbiBiZSBjb21wdXRlZCBmcm9tIGdwaW8tcmFuZ2VzLCBhbmQg
dGhlcmUgaXMgbm8gZ3VhcmFudGVlIGl0IHdvdWxkIG1hdGNoIHRoZSBpbmRleCBmb3IgcGN0bC0+
Y2xrc1tdLgoKQWN0dWFsbHkgdGhpcyBpcyBxdWl0ZSBjb25mdXNpbmc7IEkgdGhpbmsgaXQgd291
bGQgYmUgbXVjaCBjbGVhbmVyIGRyb3BwaW5nIHRoZSBjbG9jayBoYW5kbGluZyBmcm9tIHN0bTMy
X2dwaW9saWJfcmVnaXN0ZXJfYmFuaygpIGFuZCBtb3ZpbmcgaXQgdG8gaXRzIGNhbGxlci4KSW4g
c3RtMzJfcGN0bF9wcm9iZSgpIHdlIGNhbiBqdXN0IGNhbGwgY2xrX2J1bGtfcHJlcGFyZV9lbmFi
bGUoKSBhbmQsIGluIGNhc2Ugb2YgZXJyb3IsIGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKCkK
CkFudG9uaW8KCj4gPwo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiDCoCB9
Cj4gPiDCoCAKPiA+IEBAIC0xNjE3LDEwICsxNjE3LDE4IEBAIGludCBzdG0zMl9wY3RsX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDC
oMKgwqDCoMKgwqBwY3RsLT5iYW5rcyA9IGRldm1fa2NhbGxvYyhkZXYsIGJhbmtzLCBzaXplb2Yo
KnBjdGwtPmJhbmtzKSwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgR0ZQX0tFUk5FTCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmICghcGN0bC0+YmFua3MpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gwqAgCj4gPiArwqDCoMKgwqDCoMKgwqBwY3Rs
LT5jbGtzID0gZGV2bV9rY2FsbG9jKGRldiwgYmFua3MsIHNpemVvZigqcGN0bC0+Y2xrcyksCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcGN0bC0+Y2xr
cykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBiYW5rczsgKytpKQo+IAo+IGkr
KwoK


