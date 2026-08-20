Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0184C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCMCnlVm4+ZYRv/IwB6MsayWprzl+dNBwx5Ic+qtN5Y=; b=ZQUsMnpqeJTU1cCCrw0+FtVA5K
	Wpn4aup6ybho3KMlmztldELxq/L09rw5gxi0XU5/+iQAxaEToTbS/z+z7pMZ/ODEmkpPEJ3KG6Ljh
	AAHcZLrgTsmsgkcpo5Zl0C+rStSbeNnfabL2xyh/nafV2/K4d0i+NbZTHQFR9bw0dKT57wI2IHcwt
	J7RfrGwGMdkwGO/3cDBsaCyACNQMIlKGPNUr+9QCBmxWzT8sxLw8qJG209ooEtjCaAH8BGXA5IrIW
	oGkCsUYq0nJiMYAe51haKjWRk9GhB1UwgJt8q14BHUITszB48vSvqI24TBIfA10Im83eCfkV8sEp1
	Wz9RTEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvma-0000000AtCk-1mo7;
	Thu, 20 Aug 2026 05:57:44 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmS-0000000At5k-1haU;
	Thu, 20 Aug 2026 05:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205457; x=1818741457;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rCMCnlVm4+ZYRv/IwB6MsayWprzl+dNBwx5Ic+qtN5Y=;
  b=KoZ7aK3gBFOO3ONApszvzZkFTZzdInmSnfC1jLysW4QBr9gs6r5mb0GT
   TDivlgJz2jTSNUtOKHWqk4EEFhUOjd/Wv8vXYqQNxc12dwNZYhs5Ly7xp
   Yy2oPl68PzN5pOpMsVO2xyBfyn5vzGixmH8a3pA+L6QYZyju18V3Dseuo
   k=;
X-CSE-ConnectionGUID: Bo52KQ4+T6miXnf+yps28Q==
X-CSE-MsgGUID: vXOrP4HDS8Sp+50fT9gIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105416088"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105416088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:57:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:18 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:57:18 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Topic: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Index: AQHdKzc1AHXJ+KOQ0UmpAsXDUzHYBramevIw
Date: Thu, 20 Aug 2026 05:57:18 +0000
Message-ID: <b8197d8e5f7d435397536b0187a4297b@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225736_777175_0817D1BC 
X-CRM114-Status: GOOD (  12.40  )
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

PiBXZSBjdXJyZW50bHkgcHJpbnQgdGhyb3VnaCBzeXNmcyBhbmQgZGVidWdmcyB0aGUgbmFtZSBv
ZiB0aGUgcGFydCBpZiB0aGUNCj4gLm5hbWUgZmllbGQsIHdoaWNoIGlzIGxlZ2FjeSwgaGFzIGJl
ZW4gZmlsbGVkIGluIHRoZSBJRCB0YWJsZSAob3RoZXJ3aXNlDQo+ICIobnVsbCkiIGlzIHByaW50
ZWQpLiBUaGVzZSBJRHMgaGFkIGFuIGludGVyZXN0IHVudGlsIG1hbnVmYWN0dXJlcnMNCj4gc3Rh
cnRlZCByZS11c2luZyBtb3JlIGFuZCBtb3JlIGV4dGVuc2l2ZWx5IHRoZSBzbyBjYWxsZWQgdW5p
cXVlIEpFREVDDQo+IElEcy4gQXQgdGhpcyBzdGFnZSwgYSBuYW1lIHRoYXQgd2FzIHRhaWxvcmVk
IGZvciBhIGNoaXAgc29sZCBpbiAyMDE2IG1heQ0KPiBubyBsb25nZXIgYmUgcmVsZXZhbnQgZm9y
IGEgY2hpcCBzb2xkIGluIDIwMjYuIFN0aWxsIHNob3dpbmcgdGhpcyBuYW1lDQo+IHRocm91Z2gg
dGhlIHZhcmlvdXMgZmlsZXN5c3RlbXMgbWF5IGNvbmZ1c2UgcGVvcGxlLCByZW1vdmluZyB0aGVz
ZSBuYW1lcw0KPiBjYW5ub3QgYmUgZG9uZSBzaW5jZSB0aGV5IGFyZSBub3cgcGFydCBvZiB0aGUg
dXNlciBBQkkgKGJlY2F1c2Ugb2YNCj4gc3lzZnMpLg0KPiANCj4gSW4gb3JkZXIgdG8gYWxsb3cg
b3ZlcndyaXRpbmcgdGhlIC5uYW1lIGZpZWxkICh3aGljaCBpcyBwYXJ0IG9mIGENCj4gcmVhZC1v
bmx5IHN0cnVjdHVyZSksIGxldCdzIGNyZWF0ZSBhIHNwaS1ub3IgcG9pbnRlciB3aGljaCB3aWxs
IGJ5DQo+IGRlZmF1bHQgcG9pbnQgdG8gdGhhdCAubmFtZSwgYnV0IHdoaWNoIGNhbiBiZSBjbGVh
cmVkIGluIGZpeHVwIGhvb2tzIHRvDQo+IG1ha2Ugc3VyZSB0aGUgbmFtZSBpcyBoaWRkZW4gb24g
bmV3ZXIgcGFydHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogVGFrYWhpcm8gS3V3YW5vIDx0YWth
aGlyby5rdXdhbm9AaW5maW5lb24uY29tPg0KDQo=

