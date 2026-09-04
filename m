Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351CC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCalhb05CxZ1gDL/cWbJWSU2QHc55x+70R2AKTjCVfA=; b=tsrv2QFUjtIcS3Tk482gWloKf5
	uWva8ZU5T4JfaEN2Xs/TYXUSAFVB8B3XYtG3SpYUTD7/SvU1D9bCwFI3KrYnXNCiGtHDg9jLYlGBz
	NVmTzOvCZyMcZpSgR7VpojpZrAyaJLwJPsGhLaBnFfmXsdtWfFVTmTiFKx1rsO+zx84a/mPcn5yF8
	uBGjWY16fEUF+UmOXjjakwt/JnJ24rW3hXo1uhvomSNl6GbkorqXIswH9t+74MqS+SNFwfy+G4cag
	Gu9ICGlYMXSSb1Al6x337QS1TT2u0nH9sz8WJpPqYtjeuVaBmCodaw52mNbMB+0Z2jkRF17fcywmE
	Z+zQf7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SEf-00000001qjE-0Gdc;
	Fri, 04 Sep 2026 11:37:33 +0000
Received: from mail-northeuropeazon11012020.outbound.protection.outlook.com ([52.101.66.20] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SEb-00000001qhL-49hn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:37:31 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IVdk0A9kqEmJcEMcQybSMbap9YQ9FjhvcNBp5/kWci0GJLgxI8FRN8LDmmATuGJofm2shUCvc6oVqED0neG/g0f4b64jSWJqtwpk24zEqkWrx8LYWUkrlxqgN1X9LxPr9QLUDjwi4ujh5DxEaHxA7Fso0da1DuI/EQKj9tJKe4gBAdC5ttQfaB0TakF7xchP6iuxawsCv0w8VmVu2uHQlx3o1hkMJhoAT2F6Kfv4tSj3eEEsKIwa74L66RGqjs+POn5qKYatdgdyjt/frlaqw19YnWdFzaLhYR9D11ogOh8Mft6K3dqiqQqgxSXdQJuy3goQIX8kUks1/snM2juxXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCalhb05CxZ1gDL/cWbJWSU2QHc55x+70R2AKTjCVfA=;
 b=WFqFmZCLNjbEfig9WzljG3PoBwZZYMd5arSXvl1e6mc0mcN8dvzkg1L0Sgah1fuAV3Q+U9/ZaWlqe9XVBHYb353eVTA4zXjKiXzN/orRkZrN0IkglcgOs3jd1fl2ziHHtp7DO2Xt/IXZ9WFzvT57ke6XtDr3VPiEUXxsbcIBnjs80exR3+dDn3II7LkInSzgvU6EecU6A0uZtQxaqDygl/8s2Zoe1SO9xKyiazriMubRIwM3goWG7u4WPcUKh7jwSAROWPlZPG9mw+n/sRdJhW5++GTTiTFsPLy71xWaMSk/Fhwgj43NsjdHDY24tLxmOelabNzczXXbf4J3ng9PKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCalhb05CxZ1gDL/cWbJWSU2QHc55x+70R2AKTjCVfA=;
 b=YuwNoeZU+jeyDpEoHuuA7O3O7PHXpgx3M+Z+3DmMd3hqwYL2S5AbR3ParxFLgOzq82Uz3BG9M7Aqf+lQd54L5pkyEyYY7+50y6zjys7deO8F7FXiHIdi8GP/9oFef12EvcYzSRzma1Qx84Hf9posYfRy6aqc97VfF0/LY3f8z74=
Received: from DUZPR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::7) by VI0PR08MB11773.eurprd08.prod.outlook.com
 (2603:10a6:800:313::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 11:37:24 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9b) by DUZPR01CA0110.outlook.office365.com
 (2603:10a6:10:4bb::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQpSRKH95bjqnPcTYJzLFQTR19QA0legtkL5/GUHXu+fEteLHF7JSk8q0g9asPkSsL5EYoAtCeVVbPCfKbfnLhS6gwbfrfi2fLdihQP63TgUAXogCOmT5umKHZAwpRy0gDRYLr0LrzQNxkmmrmU88JznqlrXMPxjp0qjAr86VqZsreXlBVAcyQiobih3jk4Mxzk0lKc68sE+O4Rooik8UXgDIaBQ4dujrU4+bHw20PrEesmTg1VlBfbgobZfJ7Dk/d6em2o6/RV6NoPHQfIOq8R3GOPfRAchpoLhLPUdmrx4IVufUkz6q4X7VNVhUIHhT+iSemIp9/NJywgd7Pe9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCalhb05CxZ1gDL/cWbJWSU2QHc55x+70R2AKTjCVfA=;
 b=c4nvhF8ZZDm5etCFA7XkeMrTqZNjT3JobRdSkNrtxk2+BwHm8AQ0K+k1Kx+H7qgNrtIyKIsIM2ldi4dIr4G1HeDzk2dQLca7nJqz6WFgzPGTr1J2Yuzg1h8ruAAtbDuQBc0KCDXjA2O9PVV4qFbx+gADUxKJTOrBvgZjs45HQ0d7ICUbIVHclOQlNOe4rsaqxI2nAFt8H7ltg45JhelIFbH9V4WcycPhUXisBX6EidW6TZqWkihxSTqnsbgriIaJ9VlKywnaQet/iIT6XZe1iLX2DZwygizsbtSaIGqnSTeSI+F+dTCbrtA525P0AILdbXUk68Tto6wK5CrooNGpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCalhb05CxZ1gDL/cWbJWSU2QHc55x+70R2AKTjCVfA=;
 b=YuwNoeZU+jeyDpEoHuuA7O3O7PHXpgx3M+Z+3DmMd3hqwYL2S5AbR3ParxFLgOzq82Uz3BG9M7Aqf+lQd54L5pkyEyYY7+50y6zjys7deO8F7FXiHIdi8GP/9oFef12EvcYzSRzma1Qx84Hf9posYfRy6aqc97VfF0/LY3f8z74=
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by VI1PR08MB5504.eurprd08.prod.outlook.com (2603:10a6:803:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 11:36:49 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 11:36:49 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "fuad.tabba@linux.dev"
	<fuad.tabba@linux.dev>
Subject: [PATCH v6 05/49] arm64/sysreg: Add GICv5 GIC VDPEND encoding
Thread-Topic: [PATCH v6 05/49] arm64/sysreg: Add GICv5 GIC VDPEND encoding
Thread-Index: AQHdPGGs9GwENqzYvkWWk2sgtvYmtw==
Date: Fri, 4 Sep 2026 11:36:49 +0000
Message-ID: <20260904113404.4051341-6-sascha.bischoff@arm.com>
References: <20260904113404.4051341-1-sascha.bischoff@arm.com>
In-Reply-To: <20260904113404.4051341-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PR2PR08MB4889:EE_|VI1PR08MB5504:EE_|DB1PEPF000509FC:EE_|VI0PR08MB11773:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e22c1e9-1767-44e1-e5f9-08df0a78e35b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: AgQQmpyBQjvL8NaYM+Z96E4007aJn2NHRoiWeISlDsfxPqDPfq2WiPvflWEZOYfagXiJx89py59aQPstKokz4769xITTOlXvws8/deAnoqDpvlrr2JYOOFlMXR9rajJuwptBTu/cR0E7fZjn+BLnnWmts0L/KGg5NeuN5UkfN5YyPGFdA4SQTxK/EAbNHr2xUZggNd8x1A89IQkX/3uWztB6vSQICCrjxns6u/iyeK22s1sD2Uff9ArQbH+NX16MqfXG0u6yZFoQnitM8DYBS8CJxLBgM1mg+vJhIjttJZZnbljo81Pzn20hQASOXIKQh5C5P03gB3w3K6LxiFwMQ0zSjJg7qGWglLSfCYN8mgtuyF05kridEqku6FofTrsev67/GiWyl3tldjH9JNIbKBUrXHAJnE/T1AHLWDj+afgTooigTFP/qBqNFGQAajdHUGPqbAaK0D0M8GgeViSAoGZU8dNI4LCWEQqdiMrGl5CWvFj5N/ssRh8pFVh31F+5tT7OYrhcPRo/wF/E82QZbfliPtxInGXQxYRU9FhPHyvq2Jy7sz9bhul4gEuxLYGlo1o6JzZd3MyuUFw68fsBLIbFwRbQnKXu6mm+blARNx2df+o/kz+RLVUG9fZnzsUl/Xho9R1hQhIk0lSjxnTfUAi6VWTOoDQMMFu/KzcQuvgG4uv98YPLOML5Q6JvlEr7OnHx4pFmBdYaAZshvqyZv1tOpBKd+yKQpjapePRL/eo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nJU4Gph2KWHps9SK/paa6jwTY1mEl9eZ36lAr7Hv/6K0SlH+sfHImcKIcDqctw4rRlXiZXy6PhGX1Yznztod4+shKMetqRuqjooQtakMnQjjbIMtQfJba6O4ry5/+fwSvV1JT5iyPv1YZnTdQneh8uwXCPPAZe8mBC+RbB2XWXFjOVO1XOt8o1jvATnpogRO/V3ZzBi9y/5Olcsz9XXU0p0II/tFV6ZNEbZXAdXM3zxQ7JgQBG9tcGSZPr+8rQvA8R7kWoMhxeU7l9/a1SpbFSDws5edFX11q6IlxcVTKqrvxMyV9X4hixy/NsBTXmqUBzwmUOUTWz6pgjIZWwYWqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5504
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6948e336-364c-4f2d-5d37-08df0a78cef9
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|23010399003|376014|1800799024|3023799007|6133799003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: M0V7oU4MIipekKxxg1q76HETExnCnjG/dOm/Yo7H/1DflIEKWmuSigZ0SWSm0zo69U0c/l01/lvmNPwokQNSOzWOo59LX7dlwA4QIk2Tr6V5FuXe0EnJv1hKUgHvbsesza0hz41GLlZSQIESCs6YskkYqEVjNmxLpjKW6EnelNw4HjM83tCJY1r0ksv/oGpvIY5yFWftkNH0Dbrd2wlqEtIYghyvMjOpmYS4bBNQ6IhYr3q9m5K7Q+koFIXzP2nuzm7gdEBacUVNAJka7soT5xPs7yFzATG47uh7ahEMob0DCQH2EfHfaWODK8Sz07lMZPtCIo1ZXXBz5aQuOxOmNwyBPnRlvOlB1brrxYfIBnHuIkl1Yf29TKwh1v+BdoreySFi700RDq10jW++GxqX/Yo+4ZrVx49hM2AFhWjjK7jWNqRC9Bj4Sh+DNikosvTShp/f1y8klz81sNO27Gqy5fKI988Ya+8ejNhz5oXr+mEmNnISgH2XiXrCkSoYHFgsSQ5jL9O/tQ+yKSu6F1JCSKRL8wDD6Mlst6tEspZi9ndBSy0YqBSCEa+4aJmiS1gO2qnlXPtLphF3L1ERiW1yTHsuMplOhlKL9kxFyXnUYlz6HwAzagfQz1BA8t41zRfkAlZtb64cXhINwtqjwyaTbaXVzjefHKG6CRYG9UaI1mo=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(23010399003)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ijrwX5CoRzXVjYKacYFbKXP8Wno6jJoIx33BBJq8wcHnRX4YW7NimQQoESlNuJPALoWCuT3FpmxhxkNvhNWDPw6Enughft5+zPGfSYazuklFgPZCCjfqupWLwJIJttxDwzLzS5OgAlaaZZg38ZNbwFKu359r/4k9yW1+MKc8Z+YgStRXiUjz7QeqIMW1nzqP5mxjzrbnc1suI7VlBG21A9HVHi8Avucz6RIBljO6jGEt173UTCnIVTGLFLS6+pc4uHM1/zxzb91X/1OE2jdFPsPPmNGehPyA0wiIXoHCn6o1/6vZwj0X+bqU57SCcrgfiRhAF0OdX/slIRv8kC46Og86JsPVhxN9+d+9+lnC+7VWZOW6+YdJZDKTzlYoWY6c9xqfOliwq5l0DsRy8RBzzCxCl04nhvbWHC5SaA0/nv6FMzW7j93zJ53zMKS+DxIh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:37:23.5684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e22c1e9-1767-44e1-e5f9-08df0a78e35b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043730_049177_00504D0B 
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

Add the encoding for the GIC VDPEND system instruction. This operates
on the virtual interrupt domain, and is used to make interrupts
pending for a VM.

This is part of enabling GICv5 KVM support, and is required for
injection of SPIs and LPIs.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/include/asm/sysreg.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index 7aa08d59d4944..c840b37adb2fb 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1040,7 +1040,7 @@
 #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
 					       GCS_CAP_VALID_TOKEN)
 /*
- * Definitions for GICv5 instructions
+ * Definitions for GICv5 instructions for the Current Domain
  */
 #define GICV5_OP_GIC_CDAFF		sys_insn(1, 0, 12, 1, 3)
 #define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
@@ -1105,6 +1105,17 @@
 #define GICV5_GICR_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
 #define GICV5_GICR_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
=20
+/*
+ * Definitions for GICv5 instructions for the Virtual Domain
+ */
+#define GICV5_OP_GIC_VDPEND		sys_insn(1, 4, 12, 1, 4)
+
+/* Shift and mask definitions for GIC VDPEND */
+#define GICV5_GIC_VDPEND_PENDING_MASK	BIT_ULL(63)
+#define GICV5_GIC_VDPEND_VM_MASK	GENMASK_ULL(47, 32)
+#define GICV5_GIC_VDPEND_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_VDPEND_ID_MASK	GENMASK_ULL(23, 0)
+
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
=20
--=20
2.34.1

