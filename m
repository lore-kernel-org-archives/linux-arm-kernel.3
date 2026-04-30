Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E76BCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YYbmjLm863l1zTdG5L8ApD7U+rWWEEPtmlVi1GTPnSo=; b=W6hUF85Hpo6TU75X447oR7sUUQ
	u43SlBLi5pYbNESE79d9qc6OvvLZG89IDtIaBE90jXiNA60nxYVsYESPBD+QUbnqi1YmSAvzU+OYH
	DKZu9aBHBcbQAXaE2pdkW1DrZztFySAv1rZrDt9WOSNSOhQsS7G3qf4blsKFb3qPZ9l27bOmeq9f3
	pxEOctuh5S6PAKJfI3I0Z+ev7JsKDxJJhiCfUsy4tBUbwztjWcowVAP6Kn+3LwqQmVeWUYH00acrp
	fddWBWstNChm+BBi3WPbShhk4lcCmLBRD9VOFyAfnfbKtCEslouGOAgBK6IVRAAO8h/fL6YKDe5p/
	D2/RC5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQ3-00000005eru-0iW7;
	Thu, 30 Apr 2026 15:35:15 +0000
Received: from mail-northeuropeazon11010024.outbound.protection.outlook.com ([52.101.84.24] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITPx-00000005epi-0Zhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:35:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v5wwknDvn7WGj9MJevupWSE8f4r0IHoW0lLflo500edMCgGmICOmTvR//pc8spw5l8pxtJg22714ATvsGkT9yoL8EegQ/bPj/J5X2wWR75YtRqBOoFB+PXF2FJtWeAfbR6IweMIYwMm2t7lDa948pCtCYOWMGytFSx/3b+dj+Gff043uWq+MkyjblWDu9OVFVgU4vPuyPGggfq5HTK3kSOU+2OlAPc2c5YiNXyhAeNEYDBRBS7fQ4n0sxj97AS1V0rFbetZbx7UqcLfgkK0gPqftPpAt+unl1ZSiWAhfwIuGCSA2in/jORKgn+MBjcVHTWLqa2duvwgLqiR/DvTudg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYbmjLm863l1zTdG5L8ApD7U+rWWEEPtmlVi1GTPnSo=;
 b=JpGeP/elsUbROaBS5z7xQ6ZU9aNYp5S9Eqw1Ly0pgmg6zMDTXcwY1eguJtvhwx6FdeRXatArctt6XJhleV2camAELrtCcyjB0at1RjvoEnqYoWoedIvyJy+GokZ8fifhe55/JptUGMxxCVgc3gwitn4kU37wgLR6aZJNqvDU7WqY0xgM/Mx4BV0FGoRWAXL5NaCxnRWSMLJ3HEves8bvBqBx8cqsBjnv5dV1wfLUO/HB6hUds/MkOYVFp0CQZqc+Lig3o+ztl42dqnxO5F/YtmHpylQs/90IVMcJd+MDBalbsx20Cz+DZR0aiNY2Hti9FTOcU4NxyeEwUj4OKL74tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYbmjLm863l1zTdG5L8ApD7U+rWWEEPtmlVi1GTPnSo=;
 b=ny29ZUlQTTycSdLsDiYaiTW2Cvi7q0h8ULvfgYaI2Z34tTSQ5aYsghNHnVUIyTQVWbEC96vGut3GPhbvrbCBo91u1uPaGiCE7hBzysVGJo5edpOJlLCO0S7jbUaTS5bKwFZqRlfrjtcgDPpj7PEjZd1eqKJp6rrNn1hU7CHCiy8=
Received: from AM0PR05CA0075.eurprd05.prod.outlook.com (2603:10a6:208:136::15)
 by AMDPR08MB11553.eurprd08.prod.outlook.com (2603:10a6:20b:71c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 15:35:01 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::42) by AM0PR05CA0075.outlook.office365.com
 (2603:10a6:208:136::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Thu,
 30 Apr 2026 15:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 15:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5BypludO/iUSPjEs97+MjScaGaiP2fY2TL0+Qi+xipIAmdV22fz1wlx2ErFhNk6JS4oD4rcNaNAVB9FBqgvo8hcxAWX6H6EkfHmZkDPsDPaTfWTKjq5+w6CMPrEnYjL+HQAGB7eLbb6/QPCJQB6WMU0q5roFaVtLnSM1/RSUa/Na7khPxAZEcpRt62geD0yGUFL8UZql8B0I5M8Qi3r9tr8sghHAjP2SYvSBWEG6YncBMzEw4sZXn74BlGNYlkF35Eyd1XUzIwqgZXprOkzmtV2yxvN3wdLW0l2F/h7+StCQGkszQQg04qw/xmPy8d+Q/is8+YRsB3ILtA3TECo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYbmjLm863l1zTdG5L8ApD7U+rWWEEPtmlVi1GTPnSo=;
 b=v5Io02+ySkAdKE5NW8d9sjGDewP20dEE0xxuMg6gmAvL5tyI7UhoQbT6qj53wVZxqrZnn9Nhtn9dOXj89P+lKRVJftaXVkTLvNOue5X2qzqRpZWlzx3BhKXQ5YvWRiZp3rUc7N5GdHFH4rilQbmJ+8AQqVyLNSh/MANMgSceQAyHuXDgKsgt0D0khwUIg8iXIVOY9NaXMY1JnoA2yBz8G57EFbJwEq0HG7rzaqfUvKQjFQvIRH4zbxpButFP7+IX1JP3v2P44CYIKm8qCR5Qad9esVtdAJCYdDKUi3QxbszKiIx8owSjQryzf3ErwvpdyonZq5EMC66WAMGjuxjs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYbmjLm863l1zTdG5L8ApD7U+rWWEEPtmlVi1GTPnSo=;
 b=ny29ZUlQTTycSdLsDiYaiTW2Cvi7q0h8ULvfgYaI2Z34tTSQ5aYsghNHnVUIyTQVWbEC96vGut3GPhbvrbCBo91u1uPaGiCE7hBzysVGJo5edpOJlLCO0S7jbUaTS5bKwFZqRlfrjtcgDPpj7PEjZd1eqKJp6rrNn1hU7CHCiy8=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:33:58 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 15:33:58 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Topic: [PATCH 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Index: AQHc2LbDts5X6/KtBEa8jzb7QTCJYQ==
Date: Thu, 30 Apr 2026 15:33:58 +0000
Message-ID: <20260430153352.3654325-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|AM8PR08MB5828:EE_|AM4PEPF00027A65:EE_|AMDPR08MB11553:EE_
X-MS-Office365-Filtering-Correlation-Id: 4124ffc2-eb8d-4143-b0e6-08dea6ce0b19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: bpldAbrnZyD1JIQuAhQRwYnXNycrHFJmsRWdQbrL/5EA7Z8Llx51S8xBXXmwgG03AsmLLiToQecSIlT+R7XH0XfzGSUlzI9vyXrGdk3jOLnNx4lW9H4z//jE7q+Aq818+tBEG/3xpIVLWV1MIYAp7UCCsat0Ze4XQNDuzTC4LInNx/TUepdRtePhzjZDh8+ulbDd0L3UBuu51KUWcUQFMZ3mQQPAMca1ktuCouT8xEPr6HBWdhwqeq9jdVkeLruMsa0TCRm99TSl7cd4vNbQyA9bSloH/opAaDs5+SZ+q8NBd1rMx660pSrV11iepWoIMxG6FQzh6xVyT7kWZ/HZkYalaBf/xRz/FG+yP87O8qV+CG/IMGb2xgxmdTuvraWbv8zwu5O43nTjVe1vvkteIj8rcHrHmDsWZYdl1dD7Y8weEEik4kG42E9UBHwDjQKnbVLPeTIp6uIqkl1ppeQaX5QasG01H+DCjysBMt4wADjVn4xP91eHg0e7l3+dfU+4CIbvczn7lKxK2wO2k5OemZuoxyFLInHFqvSTicbQW9WWyO5Da+nAeDflv50v9eWeYnzin6Xl+IJoiHK/s4ckEdaKwuBEOTWAbuurWBA3z8ZnPacLanTKe5Jr3wD6SHDp8qLdboPZjXnX1FnjFVhkgXujZOWNaRiFZU2TQXfFe9/dkpehpPjGe6WRaN5MJnbTEX0itqEaSlerOX5S+yB0zcivel/ubcEq+FYkHdHobaxhx1tdoD8U0tLzwLBxaN8T2oItDJxOUkURaSM7NcEBGvNXcg35aXNLaGRWHA6h5Yc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vUHzMrdZU2TVgGlELkm0Eq2IWDtb0BBoBT1bgbi3E8Jijl1qjZfjrp5cGDHBlaBMPnXuu3MUyH0QfjsSZDZ7VGwFnwzo+6T5uvGAXOn5TT30OrzJwNdfic2h5dnTOvRt+R6/VbqF0URuX+z45yiX09scahWXKUTLVbXaEmL7xfskYEpJ1vz1ftA43zEXshCbZAUpE2YjGFyIYHNp7Hipl6cVOzppDXTzOXlsWljT1R2d558Q9SU9phzL6aKqUD+sITPzU/Fz710Fhj6MTNzy47FrZHZAihf533dL8XKS+US/dVrFa1Nm7HQTYECBVi9pr5m/EwLKrWr/FbTVmD7kHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f6e9ddaf-e9b2-4aa7-5e00-08dea6cde59c
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|35042699022|1800799024|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: oj2vvCUm5F0ehlUINHmXawPgBEYlL3RHAoohl5km0/XxDfIiomWmNyiYo3pHDedlN5sHgj9Jn00AyIz9D0S8J4VXergR42pRpbL54t3OvAr80tm0MSb1CXhI0Dqsl76aUF8X7bwE7tYDyiDzYOmBPy4qVQI7zwA9Q7mqokHCtS1zu9DAH1EsXMvRWY+h+XNRuGk+kwwNbwuVs2KB66wqoimRTpXBlvlb9+uSRnNq823NpUTHNkkQru8p1/fS58fcR9xXlyUF9F0OlXtDjw1bNuwYovObqHhUygc+MpqVc2bdUiAgr01vgWeRxw0guL/VPGS6jG6IrXDUbVdJO/9CdK8gR3aNhdEsGNXOpCCJ+Rt0Nd+r108r9yoaLTmu/5lThn9tvOujd6iMcsuSDim8EHFtO4n10qNkTBYRVHjCkI/YlXu2ku1hHRVojxq/eHWjyOokwAaNeidCE1obTtD6U/c88ZvJffwR25MLOElwysduxETXRSAT7nVM/6CWoI5exxJMiujQpa3Loq0T48p5iDgexlZEPXhylZ8BEREgDxglvlzMJTNNbxkr8m3jyDgafq3Biqubi9rCGLeBPtHZzAB3a0AoVaNBwg6iOxMuHvazjfzujDBsstHAY94POnIn8MxggJadkR9TaQJ3yHBmGD2fiWSAvbS0YqOR5rqbAYuX3F9AVaqPVBrp/74WDwFq85c1y55+ktOXFMBFoMRZ/JauunMy7UWIsJJxhfyejO9+5p0MgSQHuanucLTwHQulF3OVQdNPdesfGbm0J+m/Kg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bxj9zFLZiiUm+Ba8yuIjCM5LBo4IKg/Yto6NWApQWcS+X3MX2xT1Jj41zwazY0IcDsaeLqzn8VHXroaXnXWef8RHKUMN430RbHlgHpWDlNtDoxNJCQhLsD5zGqpIM0wJkpXpQ+9RQBnRRb3Wc3BVcgUHfDzBWxt5XSo56s3s+zL+ProZTQelHaljLew7dFrlV+rG8v70PNPgLiZdo4oNiEBvFA6DJh6yy8eIJsF/tI0nHr0VxqKPdQstjldd2q8ab15g43790xEG5n3xMJpXMsGpRsWV+uSxH2q7ELHsFir8XmXYr8dfzhZ09pkdQyecW4WbOX4k0WY+6kJHbLmYGowoWHr9QRX2mAVrqAzqbK2wLbWpl2ZvyW8cugRCqNVXcMip16rPYN/qRj4I8GiSJOc+kgBLHMfAb3RazlbWrhoUGcZkC8FNCvmAUQYDD7NY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:35:01.1919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4124ffc2-eb8d-4143-b0e6-08dea6ce0b19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083509_318657_C1CEB1D9 
X-CRM114-Status: UNSURE (   9.91  )
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

LPIs are owned by the LPI domain, so allocating and freeing them from
the ITS MSI and IPI domains was always a bit backwards. Those domains
should only ask their parent for interrupts, and never need to
know how the parent picks or releases the underlying LPIs (or do it on
behalf of said parent, as was the case).

This series moves LPI allocation into the LPI domain itself and
removes the exported wrappers that allowed LPI allocation from elsewhere.

With that done, the LPI domain can also be slightly reworked to
support allocating and freeing more than one LPI at a time. This
rework is extended to the IPI allocation, too. The last patch makes
the ITS MSI domain request its parent interrupts as a single range,
matching the IPI cleanup from the previous patch.

As a side effect of these changes, the IPI path now unwinds earlier
parent allocations correctly if a later allocation fails.

Thanks,
Sascha

Sascha Bischoff (3):
  irqchip/gic-v5: Move LPI alloc/free into LPI domain
  irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc and teardown
  irqchip/gic-v5: Allocate ITS parent LPIs as a range

 drivers/irqchip/irq-gic-v5-its.c   | 34 +++--------
 drivers/irqchip/irq-gic-v5.c       | 90 ++++++++++++++++--------------
 include/linux/irqchip/arm-gic-v5.h |  3 -
 3 files changed, 56 insertions(+), 71 deletions(-)

--=20
2.34.1=

