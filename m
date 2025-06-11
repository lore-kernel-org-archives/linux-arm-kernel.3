Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D171C71144
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLT6Szq/xGEa3XXcxtJnhZSsdic8SU0ZR7G+WQsu4dI=; b=tYeNitKYujaF2AcqDpE151qyX5
	4Ilu1E5m5l27dZc6Y6mg6Uw7lROAhJCaNz3Uwg2fWYuC/6kaouy3/Znu8NEwglYGeOj9IGhTzXvn0
	Y3MkxZlpF7AlH2zIxbGxXfkSxGAK5E3Mw6C4utJjT1JXm3H0M5JxAIDTwD0b2kEvHNsWRBzqGtAuB
	+/Tyqs8VtHYHKtbPVD2V8Z0vgtMYGTDno1AUwLH1rHOW1R9o88oGv1JM3zIOQ775kkuFSxOXv1vTK
	Le84j9Wf8pcJEab9UYnoFYqf/LYHlrJm2gwh8dMHnXD/lFsbyL3td/El1Dkj8yS1Yt5+MT92Ufo2Y
	xoFYfVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjX-0000000Alfm-2gJf;
	Wed, 11 Jun 2025 17:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJmc-00000009lKh-2993
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Description:In-Reply-To:References;
	bh=mLT6Szq/xGEa3XXcxtJnhZSsdic8SU0ZR7G+WQsu4dI=; b=Bh9ybvFLRxM8e/DVsN4TY3ZVzg
	54t1znRuW+mg+mTlgrL0MtmOq5E6uLbeMX0ZCvmowIPMnx5gS4VNoj48CczyZaeEg1CTZKhaBaDqe
	zUjn+m4/aJ7xHG/1HBQ71gNMTqA+ZFSmaJuzYRSBz4Y/qnaxM9q05pf67RQlHl1dE+a4Wx98I82nO
	J9fLsrE+5pJAZRNH4wlaIioQQD0ZtU8enlZGQ+PU3uYKbcWWG11Kj+6wIK/duz/vFSu7bDSOAjRo3
	Zxlh73RGwYtviGM2+kZ17h0IzzIYLX1RJcWb3iHPP2cwx/7/kZcuvqNR9XZWfq/mgQLvf5ksfAg6I
	djBvIttA==;
Received: from mail.actia.se ([212.181.117.226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJmZ-00000002MHZ-43Gp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:38:18 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 13:38:08 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Wed, 11 Jun 2025 13:38:08 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v6 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v6 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHb2sVNVczInQ6djkqz+g3DSp7mBg==
Date: Wed, 11 Jun 2025 11:38:08 +0000
Message-ID: <20250611113748.2986988-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453627160
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FD4A6CEBDB8CF48B68EA0CA7731A73B@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_123816_075662_536B8357 
X-CRM114-Status: GOOD (  12.47  )
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

VGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgdXNlIG9mIHRoZSBDQUFNIChDcnlwdG9ncmFwaGljIEFj
Y2VsZXJhdGlvbiBhbmQNCkFzc3VyYW5jZSBNb2R1bGUpIG9uIHRoZSBpTVg4UVhQIChhbmQgaXRz
IHZhcmlhbnRzKS4NCg0KdjY6IChkZXRhaWxlZCBjaGFuZ2Vsb2cgaW4gZWFjaCBwYXRjaCkNCiAt
IEZpeCBwcm9wZXJ0eSBvcmRlciBpbiBiaW5kaW5ncyAoRnJhbmsgTGkpDQogLSBDb2xsZWN0IHRh
Z3MNCg0KdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8yMDI1MDYxMDA4
NTExMC4yMjk1MzkyLTEtam9obi5lcm5iZXJnQGFjdGlhLnNlL1QNCiAtIEZpeCBpbmRlbnRhdGlv
biBpc3N1ZXMgaW4gYmluZGluZ3MgKFJvYiBIZXJyaW5nJ3MgYm90KQ0KIC0gQ29sbGVjdCB0YWdz
DQoNCnY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA2MDUxMzI3
NTQuMTc3MTM2OC0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBEZWNsYXJlIG1vcmUgY29t
cGF0aWJsZXMgaW4gYmluZGluZ3MgKEZyYW5rIExpKQ0KIC0gTW92ZSBqb2ItcmluZyBjb21wYXQg
Y2hlY2sgdW5kZXIgdGhlIGpvYi1yaW5nIHN1YnNjaGVtYSAoUm9iIEhlcnJpbmcpDQoNCnYzOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA1MjgxNDQyNTkuMjYwMzkx
NC0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBGaXggZGV2aWNldHJlZSBDSSBkZXRlY3Rl
ZCBlcnJvcnMgKFJvYiBIZXJyaW5nJ3MgYm90KQ0KIC0gRGVjbGFyZSB0aGUgY29tcGF0aWJsZXMg
Y29ycmVjdGx5IGluIGJpbmRpbmdzIChLcnp5c3p0b2YgS296bG93c2tpKQ0KDQp2MjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3J5cHRvLzIwMjUwNTI3MDcxNTUyLjE0MjQ5OTctMS1q
b2huLmVybmJlcmdAYWN0aWEuc2UvVA0KIC0gQ2xhcmlmeSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
aG93IHRoZSBjcmFzaCBmaXggd29ya3MgKEZyYW5rIExpKQ0KIC0gUmVzdHJpY3QgcG93ZXItZG9t
YWlucyBvbmx5IGZvciBpTVg4USogU29DcyBpbiBiaW5kaW5ncyAoRnJhbmsgTGkpDQogLSBDb2xs
ZWN0IHRhZ3MNCg0KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8yMDI1
MDUyMzEzMTgxNC4xMDQ3NjYyLTEtam9obi5lcm5iZXJnQGFjdGlhLnNlL1QNCg0KSG9yaWEgR2Vh
bnTEgyAoMSk6DQogIGFybTY0OiBkdHM6IGZyZWVzY2FsZTogaW14OHF4cC9pbXg4cW06IEFkZCBD
QUFNIHN1cHBvcnQNCg0KSm9obiBFcm5iZXJnICgzKToNCiAgY3J5cHRvOiBjYWFtIC0gUHJldmVu
dCBjcmFzaCBvbiBzdXNwZW5kIHdpdGggaU1YOFFNIC8gaU1YOFVMUA0KICBjcnlwdG86IGNhYW0g
LSBTdXBwb3J0IGlNWDhRWFAgYW5kIHZhcmlhbnRzIHRoZXJlb2YNCiAgZHQtYmluZGluZ3M6IGNy
eXB0bzogZnNsLHNlYy12NC4wOiBBZGQgcG93ZXIgZG9tYWlucyBmb3IgaU1YOFFNIGFuZA0KICAg
IGlNWDhRWFANCg0KIC4uLi9iaW5kaW5ncy9jcnlwdG8vZnNsLHNlYy12NC4wLnlhbWwgICAgICAg
ICB8IDQxICsrKysrKysrKysrKysrKysrKy0NCiAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgt
c3Mtc2VjdXJpdHkuZHRzaSAgfCAzOCArKysrKysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpICAgICB8ICAxICsNCiAuLi4vZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLXNzLXNlY3VyaXR5LmR0c2kgICAgfCAxNiArKysrKysrKw0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSAgICB8ICAyICsNCiBkcml2ZXJzL2NyeXB0
by9jYWFtL2N0cmwuYyAgICAgICAgICAgICAgICAgICAgfCAgNyArKy0tDQogZHJpdmVycy9jcnlw
dG8vY2FhbS9pbnRlcm4uaCAgICAgICAgICAgICAgICAgIHwgIDEgKw0KIDcgZmlsZXMgY2hhbmdl
ZCwgMTAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaQ0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNz
LXNlY3VyaXR5LmR0c2kNCg0KLS0gDQoyLjQ5LjANCg==

