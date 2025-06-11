Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE192C71148
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvhYokJxK28Arta44pXJmYqjnB6o8hx+XMuOOdqUSl0=; b=Et4rmVINsLE2FxYfujX6XFEIRn
	QoYyeIFXqPEypm7MSWZPT/GtVeI8M68VX5zpYAl7UZY307wiDdDPspslCs9S0Kck/56c8atx1Cmz/
	y2NRLAgqvQMWYxNuScQEXBXDFQBX6DgGYBcbj8ze1fihnZpeH+GgfdgtJpM0GLie1XegSKxcr7Ewi
	WnT/Fz6BZpEbiLZO1cm48H16jSr2vazL6seo3gKJ0x/PqOjVBFQ2SMu5gKUMofS5W5nXCv7SnhtSL
	qMEZ7qdV810ViFoTJYYPG67VO6zn78mwiPXeG3qg05dd3WrdfY3dTa0p7ZQNCjUxkkQ3s7uGxEA/V
	w8wv5p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjY-0000000Alfx-2xjQ;
	Wed, 11 Jun 2025 17:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJme-00000009lKv-1clp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IvhYokJxK28Arta44pXJmYqjnB6o8hx+XMuOOdqUSl0=; b=LxG1U2JdzdGdWh1DX9rr4Spzl7
	44tVc0WthClFExCbt0nk8lHleBnt32BiSHfN8jQiQGfi2kia5QFFHCGGRb7c37TmtAXDEkPoS+Uhm
	DhDE9C0+ZLjEjDD9uL2lXtdWadcELq8bt08tb3dFZh/owMkRKNSANyWPXFTeIxV3qkn5MhTdeDLMW
	PKV0vbZDoyA2PDhwCynVkZdfnoXsYV4FkN02+a36YmHkHbENRBrZEZj+4LHy0nLp1MYhmC/6DrCam
	RIllzCW4Vxt1SaPLq49xxFrP2i+I9a2G2uuMiZHbdd0hqLt7OZF7t/ErgurHKBCKROZsp+t5LwR5+
	eAEKUpnQ==;
Received: from mail.actia.se ([212.181.117.226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJmc-00000002MHZ-2F1a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:38:20 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 13:38:09 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Wed, 11 Jun 2025 13:38:09 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
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
Subject: [PATCH v6 2/4] crypto: caam - Support iMX8QXP and variants thereof
Thread-Topic: [PATCH v6 2/4] crypto: caam - Support iMX8QXP and variants
 thereof
Thread-Index: AQHb2sVNSN6Tna4ATUu1t4WZeEYssQ==
Date: Wed, 11 Jun 2025 11:38:08 +0000
Message-ID: <20250611113748.2986988-3-john.ernberg@actia.se>
References: <20250611113748.2986988-1-john.ernberg@actia.se>
In-Reply-To: <20250611113748.2986988-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453627160
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_123818_690630_CC4DC950 
X-CRM114-Status: GOOD (  12.89  )
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

The iMX8QXP (and variants such as the QX, DX, DXP) all identify as iMX8QXP.

They have the exact same restrictions as the supported iMX8QM introduced
at commit 61bb8db6f682 ("crypto: caam - Add support for i.MX8QM")

Loosen the check a little bit with a wildcard to also match the iMX8QXP
and its variants.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

v6:
 - no changes

v5:
 - Collect tags

v4:
 - no changes

v3:
 - no changes

v2:
 - Collect review tag
---
 drivers/crypto/caam/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
index 766c447c9cfb..ce7b99019537 100644
--- a/drivers/crypto/caam/ctrl.c
+++ b/drivers/crypto/caam/ctrl.c
@@ -573,7 +573,7 @@ static const struct soc_device_attribute caam_imx_soc_t=
able[] =3D {
 	{ .soc_id =3D "i.MX7*",  .data =3D &caam_imx7_data },
 	{ .soc_id =3D "i.MX8M*", .data =3D &caam_imx7_data },
 	{ .soc_id =3D "i.MX8ULP", .data =3D &caam_imx8ulp_data },
-	{ .soc_id =3D "i.MX8QM", .data =3D &caam_imx8ulp_data },
+	{ .soc_id =3D "i.MX8Q*", .data =3D &caam_imx8ulp_data },
 	{ .soc_id =3D "VF*",     .data =3D &caam_vf610_data },
 	{ .family =3D "Freescale i.MX" },
 	{ /* sentinel */ }
--=20
2.49.0

