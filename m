Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89097C36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eSSfttpcw0lJBajJNCu7ORS5sYa5GsLsfivP46rMak=; b=POjxAPJDCbFq0h4dvbL77NLcec
	+U12mpzLagPx9YgOSfqMAeRx7YRqKrltbHDbOJys6vu19MHCti4SIjYXjfMHd4PZ1ChvlNQVyPDP1
	LIuBaDwZmTD1/MJOIZBFBhUbBZJ++u+maXACTuh7fRTff0G7hLoP5RV2ySC0x6IP7mOK086PrmSVP
	MbILRAA/URxbaOMeYiQc53KWxzIrohjmcQfGztLSuGwqPcFG50a6ZTF1hn8RECEex7dTlcSgTFHBK
	MaADDxeESuyG/i7hc8APTpSKEe2RrjhhBIO1PM9XaGsi2pRnPO3UR5F5KcbToTEOjywQlgV6/qVZi
	xlx8Y1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twb8W-00000002Ip5-22jj;
	Mon, 24 Mar 2025 06:18:13 +0000
Received: from mail.crpt.ru ([91.236.205.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twb6l-00000002IdU-2WbM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:16:25 +0000
Received: from mail.crpt.ru ([192.168.60.3])
	by mail.crpt.ru  with ESMTP id 52O6FoPN018457-52O6FoPP018457
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Mon, 24 Mar 2025 09:15:50 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex1.crpt.local (192.168.60.3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 24 Mar
 2025 09:15:50 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Mon, 24 Mar 2025 09:15:50 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>
To: Michael Turquette <mturquette@baylibre.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>, Stephen Boyd <sboyd@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH] soc: xilinx: vcu: modify the order of devices unregistration
Thread-Topic: [PATCH] soc: xilinx: vcu: modify the order of devices
 unregistration
Thread-Index: AQHbnIQwE54gprkZdUqVTZP34SoMOg==
Date: Mon, 24 Mar 2025 06:15:49 +0000
Message-ID: <20250324061543.15150-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX1.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 2/17/2025 9:52:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.3
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=9eSSfttpcw0lJBajJNCu7ORS5sYa5GsLsfivP46rMak=;
 b=ITGIpFypKaB6RSoCLt1/wetbTrDJMw+CmjIoqPiHBS5QO/3pp4Mcdri1sahof3hzEDt7wquw5fAR
	AYRSdBTgKbOoargnFt83PAPCT6GqQMCnUP/xR4vPs9qwtcy6/OTD/PkFacUgxbUdjjv4wyK7CKmA
	cAAMRaZsrW1WS2np15fSBSK5ENdFaxVMBROJ8spJPKbXAVHwcukg3hLj4POA+hokV1wnJsS3/EJN
	XF+LhWtB7gjKeO1fY2o4Q3C3ZYYEyHXBAtSRPyqjohsQARiT9YsEaAk4fo9eqkpJn18rKwMuoMnE
	3W0oVQo7l55qoSkufvQwwKUQA/1Ppoc5+9yBNg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_231624_506490_DC96E27D 
X-CRM114-Status: GOOD (  10.08  )
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

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KVGhlIG9yZGVy
IG9mIHJlZ2lzdHJhdGlvbiBvZiAnc3RydWN0IGNsa19odycgaGFuZGxlcyBpbg0KeHZjdV9jbGtf
aHdfcmVnaXN0ZXJfbGVhZigpIGRvZXMgbm90IGNvcnJlc3BvbmQgdGhlIG9yZGVyIG9mDQp1bnJl
Z2lzdHJhdGlvbiBwZXJmb3JtZWQgaW4geHZjdV9jbGtfaHdfdW5yZWdpc3Rlcl9sZWFmKCkuDQoN
CkNsZWFuIHVwIHRoZSBvcmRlciBhbmQgcmVwbGFjZSB0aGUgZHVwbGljYXRlICFkaXZpZGVyIGNo
ZWNrIHdpdGggYSBtb3JlDQphcHByb3ByaWF0ZSBvbmUuDQoNCkZvdW5kIGJ5IExpbnV4IFZlcmlm
aWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQoNClNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBWYXRvcm9waW4gPGEudmF0b3JvcGluQGNycHQucnU+DQotLS0NCiBkcml2
ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYyB8IDYgKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3hpbGlueC94bG54X3ZjdS5jIGIvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMNCmluZGV4
IDgxNTAxYjQ4NDEyZS4uZTRiMDhmNTAxOTU4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsveGls
aW54L3hsbnhfdmN1LmMNCisrKyBiL2RyaXZlcnMvY2xrL3hpbGlueC94bG54X3ZjdS5jDQpAQCAt
NTExLDExICs1MTEsMTEgQEAgc3RhdGljIHZvaWQgeHZjdV9jbGtfaHdfdW5yZWdpc3Rlcl9sZWFm
KHN0cnVjdCBjbGtfaHcgKmh3KQ0KIAkJcmV0dXJuOw0KIA0KIAltdXggPSBjbGtfaHdfZ2V0X3Bh
cmVudChkaXZpZGVyKTsNCi0JY2xrX2h3X3VucmVnaXN0ZXJfbXV4KG11eCk7DQotCWlmICghZGl2
aWRlcikNCisJY2xrX2h3X3VucmVnaXN0ZXJfZGl2aWRlcihkaXZpZGVyKTsNCisJaWYgKCFtdXgp
DQogCQlyZXR1cm47DQogDQotCWNsa19od191bnJlZ2lzdGVyX2RpdmlkZXIoZGl2aWRlcik7DQor
CWNsa19od191bnJlZ2lzdGVyX211eChtdXgpOw0KIH0NCiANCiBzdGF0aWMgaW50IHh2Y3VfcmVn
aXN0ZXJfY2xvY2tfcHJvdmlkZXIoc3RydWN0IHh2Y3VfZGV2aWNlICp4dmN1KQ0KLS0gDQoyLjQz
LjANCg==

