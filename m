Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46C9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdCx0a0uooAEmwgKJAXSoYL3eEeZT4nzJSwFsvAOD8k=; b=GJpg/k15qEyzQFcAtSBB95UxsM
	fe2Sex4kDCUHVqtRKL9xBBM4u9KfFqElr+LVloIRtbjpfZM7pzOZ72A6XzJ6FaDKn12PX6qz3TpyS
	nRemeIanLqiOhbJuDax+17JGaGOiprlnDipAiN+K5Ign+ifvMPQ041td2IXDrfQxSeYyRGZo0V2nu
	74nl52N9ACd645BGQAYRalYSvoY8FKhgWDs7s30BShOOMO2JYMsBrRm/WgUCgToW1mPkiJLwlYlTl
	9T2+meon1ZgSxRH3vj5hmDSJu56f9hBQQkIULcwGwuOPnunwfcdASnDySHUF0iB9ZQqTRQ3pzNMGF
	0wQ9WE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuod-00000006Fpa-2kTh;
	Tue, 10 Jun 2025 08:58:43 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuhX-00000006EjF-14r1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:51:25 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 10:51:17 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 10:51:17 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v5 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v5 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHb2eTUrq3ZCiDJTEuBMgC/eD8VYQ==
Date: Tue, 10 Jun 2025 08:51:17 +0000
Message-ID: <20250610085110.2295392-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445362776A
Content-Type: text/plain; charset="utf-8"
Content-ID: <0423180830A00341BE5A88454E6144E6@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_015123_293418_0ABDCC34 
X-CRM114-Status: GOOD (  12.44  )
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
IHZhcmlhbnRzKS4NCg0KdjU6IChkZXRhaWxlZCBjaGFuZ2Vsb2cgaW4gZWFjaCBwYXRjaCkNCiAt
IEZpeCBpbmRlbnRhdGlvbiBpc3N1ZXMgaW4gYmluZGluZ3MgKFJvYiBIZXJyaW5nJ3MgYm90KQ0K
IC0gQ29sbGVjdCB0YWdzDQoNCnY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlw
dG8vMjAyNTA2MDUxMzI3NTQuMTc3MTM2OC0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBE
ZWNsYXJlIG1vcmUgY29tcGF0aWJsZXMgaW4gYmluZGluZ3MgKEZyYW5rIExpKQ0KIC0gTW92ZSBq
b2ItcmluZyBjb21wYXQgY2hlY2sgdW5kZXIgdGhlIGpvYi1yaW5nIHN1YnNjaGVtYSAoUm9iIEhl
cnJpbmcpDQoNCnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA1
MjgxNDQyNTkuMjYwMzkxNC0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBGaXggZGV2aWNl
dHJlZSBDSSBkZXRlY3RlZCBlcnJvcnMgKFJvYiBIZXJyaW5nJ3MgYm90KQ0KIC0gRGVjbGFyZSB0
aGUgY29tcGF0aWJsZXMgY29ycmVjdGx5IGluIGJpbmRpbmdzIChLcnp5c3p0b2YgS296bG93c2tp
KQ0KDQp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3J5cHRvLzIwMjUwNTI3MDcx
NTUyLjE0MjQ5OTctMS1qb2huLmVybmJlcmdAYWN0aWEuc2UvVA0KIC0gQ2xhcmlmeSBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UgaG93IHRoZSBjcmFzaCBmaXggd29ya3MgKEZyYW5rIExpKQ0KIC0gUmVz
dHJpY3QgcG93ZXItZG9tYWlucyBvbmx5IGZvciBpTVg4USogU29DcyBpbiBiaW5kaW5ncyAoRnJh
bmsgTGkpDQogLSBDb2xsZWN0IHRhZ3MNCg0KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWNyeXB0by8yMDI1MDUyMzEzMTgxNC4xMDQ3NjYyLTEtam9obi5lcm5iZXJnQGFjdGlhLnNl
L1QNCg0KSG9yaWEgR2VhbnTEgyAoMSk6DQogIGFybTY0OiBkdHM6IGZyZWVzY2FsZTogaW14OHF4
cC9pbXg4cW06IEFkZCBDQUFNIHN1cHBvcnQNCg0KSm9obiBFcm5iZXJnICgzKToNCiAgY3J5cHRv
OiBjYWFtIC0gUHJldmVudCBjcmFzaCBvbiBzdXNwZW5kIHdpdGggaU1YOFFNIC8gaU1YOFVMUA0K
ICBjcnlwdG86IGNhYW0gLSBTdXBwb3J0IGlNWDhRWFAgYW5kIHZhcmlhbnRzIHRoZXJlb2YNCiAg
ZHQtYmluZGluZ3M6IGNyeXB0bzogZnNsLHNlYy12NC4wOiBBZGQgcG93ZXIgZG9tYWlucyBmb3Ig
aU1YOFFNIGFuZA0KICAgIGlNWDhRWFANCg0KIC4uLi9iaW5kaW5ncy9jcnlwdG8vZnNsLHNlYy12
NC4wLnlhbWwgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKy0NCiAuLi4vYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDgtc3Mtc2VjdXJpdHkuZHRzaSAgfCAzOCArKysrKysrKysrKysrKysrKw0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpICAgICB8ICAxICsNCiAu
Li4vZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNzLXNlY3VyaXR5LmR0c2kgICAgfCAxNiArKysrKysr
Kw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSAgICB8ICAyICsN
CiBkcml2ZXJzL2NyeXB0by9jYWFtL2N0cmwuYyAgICAgICAgICAgICAgICAgICAgfCAgNyArKy0t
DQogZHJpdmVycy9jcnlwdG8vY2FhbS9pbnRlcm4uaCAgICAgICAgICAgICAgICAgIHwgIDEgKw0K
IDcgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mtc2Vj
dXJpdHkuZHRzaQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4cXhwLXNzLXNlY3VyaXR5LmR0c2kNCg0KLS0gDQoyLjQ5LjANCg==

