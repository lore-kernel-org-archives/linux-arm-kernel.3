Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA12C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahpxrhIzwwIAbwOr+R2KucV63JvnpiADURbuUKzU5hc=; b=CL6ljKbGPwXR6B8EjIg4Tdx+Ny
	eYT9rLZo87EWPkHH9s/w5seNZpyLkjmLy3tTmP8BNtaS6+xzwl47dKFEdvfCnf8Z2z91Ad8vy0tqy
	6fa2uPogZpqnz737gF+X8nA/ezOVv+Btmn5Zpy+IKvDZHfXSqoAv2KRUeLaqUY5Kqx11tQ+f7pjnO
	gOMMazOQhC8tPqndaRd8+wZPviLbxmeD/4ye6mVFZ/6B8o/tRai8aZ+2XLZC5GrZzQwhyfmS+Dlbs
	zPZenl8quOybx1R/jY1a+C+eTUrs5sik3cs6F8lbTFU386RpCACv6x0T4HLjBC/77h8J73+FyjGJo
	lc5icD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvg8-0000000AsP8-0lnL;
	Thu, 20 Aug 2026 05:51:04 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvg5-0000000AsOe-1GsD;
	Thu, 20 Aug 2026 05:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205061; x=1818741061;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ahpxrhIzwwIAbwOr+R2KucV63JvnpiADURbuUKzU5hc=;
  b=N7I72poFLc/4abJ/riJXck6jnfLqCO6d3yvaenUfVE4HztG4myhnoedb
   mygIOoSNiWcDEtcYFBvvXqhbon8ZBf/bNt2Hmmqsg8lQyR5iYr4iIFomK
   sMV3PXEq90aqILomQAnUn1TYIaW05XWnFNg/hMye9wkyfTP3KADPALoLu
   0=;
X-CSE-ConnectionGUID: 7zVRjOo+R9WeBIwxbZHEBA==
X-CSE-MsgGUID: kFU9UMleT+aI19KSF7xBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="142730413"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="142730413"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:50:56 +0200
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:56 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:55 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:50:55 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Topic: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Index: AQHdKzcjyw4WlRlF90aItjoNCif4ULameOMQ
Date: Thu, 20 Aug 2026 05:50:55 +0000
Message-ID: <c7e7f557f17647b1b7134facaa1cefc1@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225101_685403_DC7E3DD1 
X-CRM114-Status: GOOD (  10.68  )
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

PiBUaGUgX0JVR0dZIHN1ZmZpeCBpcyBub3Qgc3VwZXIgYWNjdXJhdGUuIFRoZXJlIGlzIGEgYmVo
YXZpb3IgdGhhdCBpbmRlZWQNCj4gc2VlbXMgc3RyYW5nZSwgYnV0IGl0IGlzIHNvbWV3aGF0IGRv
Y3VtZW50ZWQuIFRoZSBmYWN0IGlzLCB3aXRoIHRoaXMgUUVSDQo+IGZpZWxkIHRoZSBzdGF0dXMg
cmVnaXN0ZXIgaXMgY29uc2lkZXJlZCAxNi1iaXQgd2lkZSBhbmQgaWYgb25lIHdyaXRlcw0KPiB0
aGUgZmlyc3QgOCBiaXRzIChTUjEpIHdpdGhvdXQgdGhlIG5leHQgOCBiaXRzIChTUjIpIHRoZW4g
dGhlIGNvbnRlbnQgb2YNCj4gU1IyIHdpbGwgYmUgYXNzdW1lZCB0byBiZSAweDAwIGFuZCB3aWxs
IGJlIGNsZWFyZWQuDQo+IA0KPiBSZW5hbWUgaXQgQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMV9O
T18xQl9XUiB0byBhbGlnbiB3aXRoIHRoZSBvdGhlcg0KPiBuYW1pbmdzIChfTk9fUkQpIGFuZCBj
bGFyaWZ5IHRoZSBtZWFuaW5nIG9mIHRoaXMgZmllbGQuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBUYWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1
d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

