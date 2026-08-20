Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47566C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+3GNmh1yOZtivo+s78FLEik/xOcGS18TsuSqjh9ss0=; b=Bu28v+esfVyjfNY1mpjqNRAGwo
	frk34mStBz2jgk1UDV/cuQnAYnO6mZ4u6yR9Eo9l2VLiRknaJkgbGjGVYNsM03UMIfX40g9BIeeWb
	rB9/TUvBdcygfIlwIrguyK7LwcrT+6OTNFoKXV2wTH40nsIb8fda/f40uKn85bAhk5NqwCG3RXvdu
	iVpdK+H3hX2IfEmxnTvEY0rpn06ikCOJFwctMr6mAc6I6DQt5IURULIJHbKuJYXojJTqb8IBNB0c5
	WWODxoqjldIo8NimKiu5eOpxJcabakmf/JqRubUrKSsd9g5asexENhz2cAQttdbffZ4ZU7tgvxeMx
	Q654Y6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvhO-0000000AsYZ-2NWo;
	Thu, 20 Aug 2026 05:52:22 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvhL-0000000AsXq-1r33;
	Thu, 20 Aug 2026 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205140; x=1818741140;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D+3GNmh1yOZtivo+s78FLEik/xOcGS18TsuSqjh9ss0=;
  b=R7GQdaqpUAFFTwDrf1BuWh9kyIjZf0fGNpTtW1niyMt6wodNG1WCjAxq
   If0+QOuqZ3WsHiDR94w5XhGKbfYeoFBog2PDnDPvyN1/du6ERAvZ/u2TR
   5X3BbyxTF/yJgK5oCT2AsG9YRaHyflP8hy+AIpN9bDsGhZlCoyNAQCmaM
   w=;
X-CSE-ConnectionGUID: Ui2XMQjFQ4CgFbp+PS6UJw==
X-CSE-MsgGUID: /0mau9jjT/G61PmdvflxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156701181"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156701181"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:52:18 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:52:17 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:52:17 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing the
 flash opcodes
Thread-Topic: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing the
 flash opcodes
Thread-Index: AQHdKzcn1MP1V+y9ZUuiJHx2Cv1ozLameVcg
Date: Thu, 20 Aug 2026 05:52:16 +0000
Message-ID: <e1c58d4707274cde88e81c02fd1e1549@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225219_795191_0D9AB129 
X-CRM114-Status: UNSURE (   8.26  )
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

PiBDcmVhdGUgYSBzdHJ1Y3R1cmUgbmFtZWQgb3Bjb2RlcyBpbiB0aGUgZmxhc2ggcGFyYW1ldGVy
cyBzdHJ1Y3R1cmVzIHRvDQo+IHN0b3JlIGFsbCB0aGUgZmxhc2ggc3BlY2lmaWMgb3Bjb2Rlcy4g
VGhleSBhcmUgdHlwaWNhbGx5IGRpc2NvdmVyZWQNCj4gZHluYW1pY2FsbHkgdGhyb3VnaCBTRkRQ
IHBhcnNpbmcuIE1vdmUgdGhlIGRpZV9lcmFzZSBvcGNvZGUNCj4gaW5zaWRlLiBMYXRlciBvbiB3
ZSB3aWxsIGFkZCBuZXcgZmllbGRzIHRoZXJlLCBsaWtlIHRoZSBzdXBwb3J0ZWQNCj4gb3Bjb2Rl
cyBmb3IgYWNjZXNzaW5nIHRoZSBzdGF0dXMgcmVnaXN0ZXJzLCB3aGljaCBhcmUgYWxtb3N0IHZl
bmRvcg0KPiBzcGVjaWZpYy4NCj4gDQo+IE5vIGZvbmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9uLmNv
bT4NCg0K

