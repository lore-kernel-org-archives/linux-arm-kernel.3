Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1FCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD8+tRQ9yczq97bDkKCs9boNr7QjVtsd8Wx9F1lqCOU=; b=HXR89Dv8YA3t4uW1Rdsnrn9A36
	AYy1RxbcmXvbzUAf3F/Jvzkqnb8dzhXzBeqRv6e3lac7LmSetoxk5wOwCGb9XHNBd77D898gqsxbU
	iNDQWhhZYxoWWNbVAeUkMmBYqvpA6hHNsA/DjZAULY03ETGo97+QG3BGQ5qKdSXB/t29tHHpSNu2n
	GKkwFSLsq/xl9dL6hU9ejzWJYIfyihQytaMAqCJvdoMAHbXkj1B0k21vIkf0smg+liwclpVR6Us5t
	yWznpXXU/wnA3Lj7ascMX+YirPaVcSv1IPi//K6c66uxfG9FG+Eo3DiMVMszkcEWvHYXI8/kJn7JD
	bLb6vEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYhm-00000000N4d-40cj;
	Wed, 06 May 2026 09:38:10 +0000
Received: from mail-westeuropeazon11011058.outbound.protection.outlook.com ([52.101.70.58] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYhl-00000000N3w-3tCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:38:10 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OzsgFMb88yEbmFFwFaTuzLDNfMT76XoYwKFXwXAuaL0YzDOo3f1uO4V1ELrj6OK9nBp2BJ9jKAk5CDSy15SS2WGvswyKq1oAmavAdwepnJ0z7woVqmCTWtybj4BJvavkvXGutTJgwU425ZWKSlKzQTNdcc7+JwJOgnDwBk88OcZVU7gTX7NhZL/L1KyPHQgfrpl0Tuwd04foQ91zLVPUzOOr1pRiwNLCSFq8oH4ugi9NX9E9JzAjoxwPWTbP1LqE/hMP//gm80l15n8RzgFU5xEv4pChsUhaIxM1lD7YanvsP7+/qnG6cmeX/+YcHkQv4/Dbc84gUXirsxQf0vCPmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD8+tRQ9yczq97bDkKCs9boNr7QjVtsd8Wx9F1lqCOU=;
 b=airmHMVwX1fyYYlbAD8NJyPjRySDrf5ZL18ouhUoYUPBpSThOzWeeF5TMnntrCqVj8ydAcOUg8gn+Uchx3yNKFH1Nx8B7Qw5f8eyN7qrpm8nH/U1Ql8VMExghM0n8B/a50N8gh3bhMMlG8NsNctgFATb1SM/g1CvOsq07BVGyWrle3oGzOijOh+lO1nvubruH7DM3OB1kAcqiqwfE19A9qBgmkkcOUA2FJuDYx75sCRmlWik9D+HHPp5GGn5RQmoiB2Z8QKfNu5+6nwkisFif3v0dN71X2mdRGp+51rrqomYurreuMEsCapH7zv29sPU1ae4nZfrIK8BxC76jv/Zgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD8+tRQ9yczq97bDkKCs9boNr7QjVtsd8Wx9F1lqCOU=;
 b=oFbL/ETK2P7Ft3rYZmVzfZ7pew6TAgdegviX6EOl83qbd8OJS4OzQ7lAZWlbCL4ofdZhQ/VWZx1W5U1fHIW1OLuWPha10oY3PE7694ViHExpUinkgQd2hlNMn+FZg+W29IQjDzINa9uGMSXexMMIYvGkTVWsbDRuT7GgTENVvCs=
Received: from CWLP123CA0208.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::13)
 by AS4PR08MB7508.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:38:05 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::b9) by CWLP123CA0208.outlook.office365.com
 (2603:10a6:400:19d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfgNyc659VNYd8WJxwFCsf4jIx2SocodhZqms1vBDQJPbyyScGhw8s72JFXKXgaGX5sc6fOgpqW8hH3tgGGfi7Pk7x50yG1vHwheBSg9IX+lZGgbhLPa+yqINC2U1KRal6TT8gWCKmt19r5T504Z+SNVnCHjZ3ZXYNh46JAsi8qahWXPL5a1fAbDCdzKqvimmChczkBnu2aHnmBxhYCN7BGRh8JHg2idLaIIYTRx5BTL62nJjPnzxcBn88vb10F+OuNw6KvJiGu6H85cHuFqKMpdzx9kSuCfxwH/0Za6b6nEGNrgHe7YI20DpzRpQMNgx4XT96IgdUMvGCgHo1a0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD8+tRQ9yczq97bDkKCs9boNr7QjVtsd8Wx9F1lqCOU=;
 b=A4zasyLEHEqHGKUeUoFaGqaLTyqli1yQPtU5Dxe7aX28kDOyiEkb88f+VXRxRQqSAo6sLq8Sg8c2wEvtKTu4+SUNlv5WjVo23d7Bi52OPPnrtwmCpigwFuV2IomPd/2PXgJ0tES7WMLh4wCiv7UdJ7KCe+Rqi30Sj5Fdz3GRDhZMQVE3q5zzK2VUjQYr4zkRj4JrhbVTpfi9ejpS0ZYO2cTh0mt+k3c6N/EnX/vtNhfXuM+P9TI75E0vTAZs2zzzGfeTglvouaNgqoBoz7bFOwLi1CFU9kAjeCAPmmwnHzDXlq/lSuT8JfI/oZ6a/IbVG4P8qW/WSX5wYZCCsjPSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD8+tRQ9yczq97bDkKCs9boNr7QjVtsd8Wx9F1lqCOU=;
 b=oFbL/ETK2P7Ft3rYZmVzfZ7pew6TAgdegviX6EOl83qbd8OJS4OzQ7lAZWlbCL4ofdZhQ/VWZx1W5U1fHIW1OLuWPha10oY3PE7694ViHExpUinkgQd2hlNMn+FZg+W29IQjDzINa9uGMSXexMMIYvGkTVWsbDRuT7GgTENVvCs=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:37:02 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:37:02 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 1/3] irqchip/gic-v5: Move LPI allocation into the LPI
 domain
Thread-Topic: [PATCH v2 1/3] irqchip/gic-v5: Move LPI allocation into the LPI
 domain
Thread-Index: AQHc3TvkhhlLmmTEVkex/DEC+Fokaw==
Date: Wed, 6 May 2026 09:37:02 +0000
Message-ID: <20260506093634.382062-2-sascha.bischoff@arm.com>
References: <20260506093634.382062-1-sascha.bischoff@arm.com>
In-Reply-To: <20260506093634.382062-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|DB9PR08MB6425:EE_|AMS1EPF00000046:EE_|AS4PR08MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d7b91c-85b8-4959-6e14-08deab532c77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: ceQ+f+1FkyPyuIo9f7/GTx+p625y0jjvMDp7+FG5kqdOezkd9ME78FQpIZ2eBu9Zgh1r6MTiodQ0BycLBxCWOUCFWy1aX9SJlbnV7kcGy9d2O6mcDMwqUkhL3w3nozOsUhj+86+dypxRdPt+CcdmJJE1g4Mfu4HBq4cI3gLRg+0DnDJnv1Z8WIPkycVroktO4gtc5pQpc0FTPlDhn6Rm0KXdd9W+cWdgTH7SyB7K5gVDFPMbNHsGI7c9r5mYGXe7PtmbUOhqcbzTG0+zqqJlFkQNsin9gRV5CyE0cwMgldqIctrTwuF2bTEJz8XpAPm9YZRnab/PB1ze7e+eryQT3GvN/efgxfY2XGSsqbvMVaAywBnZLDXM6w02J5+FBnswU7244qX5sKgHsNY5b/8HIZRHeGERAOIuzqJOi5AWQ41X9Si+cEXhqZSa7+cCbDZpjdnYIB80MfUKAHmHTyesojZFhEF4AdgP80zeV7YhCIpHSwDB3WcMmuzCgoeztpWH/LIQyoaxEvZcd/hPG0ecyUobvo+3PBXq090jhcxgLyWNYWM3wGgvnQd/f7FeFZLCNuo+SkVxS5M0ud1ueL+m0PGVgfN2Oq9vc0UoJf+0R6K5qOh7iJ+W1M8xCxSviFHBTRFKr9FOJhKMBrfzAMdSRXFtZauskWRR08QUsjZfXhYmDoEwSDND/R0pvEiIVF34MueKI/YC7QNYQRFUgsjqV0DdW4PMl8CFUj6j5l0LcPzryMQ4P9e7jsygiBt2Bst+
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Dv0kAHOcseIMVxOFkWkiLJGmMIKBXpuI+apcJhzDmNWXDi/mfzc+sWUtsobrqkP92BGjhc+h7hpMYUqTS6/uYotBDSprBPjwKrTtbi03+q2XeQeUv0+ySzMnJ9b52msiG66R3ZQ4AkRuT6QVUxCFfbRSf6qoBEACZ310q3AzcqjlyZmadq6dzdNjmB+09UYMLST9iNGJN29gu6xpRvH/5vIxnooWwgYzdjvbHdb4RXTruVu65Y/e5Vi3t3nKZESjm+G0bHAnfJJn1MtzKgwS3EKVg4VTk+9wW9SHNNPkjJij+WqBgwrbatuljA38ta8sUWAEos0+WuKoM54OKgFWWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9a059e08-16d0-48a5-daca-08deab530751
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700016|35042699022|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sBoNqj95OuZxwjQLdyWhGis/Rd6SeP3BplxRLKJ1RYspe8yidzt9CBmG2wImt5H8tUEpFANhIHlvBl1JGNkzgFtMRstZh0qs/JI62bJEFCjnnjzs76CnzeasRSqDGUK70CyyGqzCA5/VpEhQ2tcZ7+AvFFbLvrmhDiDHSZPC1U0PQaOfjmfQufLERUjo5E+Lua62VTO0Voe6wLywQI7p+x+Xl35BRAgMI2j+/C9IuOmIYXHQBC0eduJX2D97pHbCj0MzeK/g0RN1tglmJCDNjRwtGQirAct9Ge8yxAr9wr/tcxTs7tnk5rNXE7ylP4hi99XbNfxJj1DpLDBzDpPgPhVr3dMHOnlepN4Gy5H6R1bYjVMzSlkwDT+MvS0/kNcmzOt8ClTPpcYqqkRq89fBr9JTzDKBtXgDOE49tLqgv1Iwk/nJ6e6D3FPfc4niEpZtCKY7S/6fkoZS+plCeU1FgJrNSTqDVfJSKJeysHgJjDxxbIYUb3i615ABN7lPZ031UL7AZgVqPodgmLkU8gB35CDyGIdQGTR7OeHX7TBL5ZKBH2bRpqnlLdd8TkT92MziY/5LUpCnbXg2Agt1u//leU87wpvwihaeviysxJIeDk/MJozpM29FRbew9ql4P6aYj79YkZvoMFn9M30gFBoBr/xcXMJbxdpN8SL3Cs6aXI5BDTXAOeiywzBYhWGFFIj6Z4BKw50SS04tmSH5UlAwYK8xJAmWF0OoHqF03RcZlCc=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700016)(35042699022)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5+UZM/yEm+Opbd1REvXfo9v33d+qBjvn9+ppJJ5CL4p093Rrk2tPTd6ntupmkGBKQxfI3nBVUI2kCXCtjXJWf2mGHS5rE+reogqjUja7gNo7M+Q+EjJHiAX7pFybBwMaN+qy7gjEcLdjf1R/WWH3RkQkwjZmbya6WItCTd44ZorGNp1EuuSFST9fYsxi0EF5nF6oA37xSmPBTN00Y5U4TdH+DBL1dXnFQH0ycALzxKqOvKZGtcBqSMekB5vnl63wS7PtvNmOFVolg9d00dHr38jvspsjVIn6+s4kVeiV9pH9XG/CYhO+oyThbGQlKo93dtd6ubwHA+vcgsRvXB9R+pjk1/63XNZ6pkvxFyfOmePtO2or34AEDZh8njb3MiS1gpGFaT69UxbVpZWgwQRtM27sOObT8iUrqoy22AKpDhyZSyrixzSdPKAJjgf3SgJN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:38:04.8798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d7b91c-85b8-4959-6e14-08deab532c77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023810_115362_311ED3D4 
X-CRM114-Status: GOOD (  16.49  )
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

The IPI and ITS MSI domains currently allocate and release LPIs
directly, then pass the selected LPI ID to the parent LPI domain. This
leaks the LPI domain's allocation policy into its child domains and
forces each child to duplicate part of the parent domain's teardown.

Make the LPI domain allocate LPIs in its .alloc() callback and release
them in a matching .free() callback. Child domains can then request a
parent interrupt without passing an implementation-specific LPI ID,
and the LPI lifetime is tied to the domain that owns the LPI
namespace.

Remove the gicv5_alloc_lpi() and gicv5_free_lpi() wrappers now that no
external caller needs to manage LPIs directly.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c   | 14 ++------
 drivers/irqchip/irq-gic-v5.c       | 53 +++++++++++++++---------------
 include/linux/irqchip/arm-gic-v5.h |  3 --
 3 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-=
its.c
index 36a8d1368f0e4..36d03f82ef684 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -929,8 +929,8 @@ static void gicv5_its_free_eventid(struct gicv5_its_dev=
 *its_dev, u32 event_id_b
 static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
 				      unsigned int nr_irqs, void *arg)
 {
-	u32 device_id, event_id_base, lpi;
 	struct gicv5_its_dev *its_dev;
+	u32 device_id, event_id_base;
 	msi_alloc_info_t *info =3D arg;
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
@@ -949,16 +949,8 @@ static int gicv5_its_irq_domain_alloc(struct irq_domai=
n *domain, unsigned int vi
 	device_id =3D its_dev->device_id;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D gicv5_alloc_lpi();
-		if (ret < 0) {
-			pr_debug("Failed to find free LPI!\n");
-			goto out_free_irqs;
-		}
-		lpi =3D ret;
-
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
+		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
 		if (ret) {
-			gicv5_free_lpi(lpi);
 			goto out_free_irqs;
 		}
=20
@@ -983,7 +975,6 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain=
 *domain, unsigned int vi
 out_free_irqs:
 	while (--i >=3D 0) {
 		irqd =3D irq_domain_get_irq_data(domain, virq + i);
-		gicv5_free_lpi(irqd->parent_data->hwirq);
 		irq_domain_reset_irq_data(irqd);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
@@ -1013,7 +1004,6 @@ static void gicv5_its_irq_domain_free(struct irq_doma=
in *domain, unsigned int vi
 	for (i =3D 0; i < nr_irqs; i++) {
 		d =3D irq_domain_get_irq_data(domain, virq + i);
=20
-		gicv5_free_lpi(d->parent_data->hwirq);
 		irq_domain_reset_irq_data(d);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 6b0903be8ebfd..15a2a04398d25 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -59,16 +59,6 @@ static void release_lpi(u32 lpi)
 	ida_free(&lpi_ida, lpi);
 }
=20
-int gicv5_alloc_lpi(void)
-{
-	return alloc_lpi();
-}
-
-void gicv5_free_lpi(u32 lpi)
-{
-	release_lpi(lpi);
-}
-
 static void gicv5_ppi_priority_init(void)
 {
 	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR0_EL1)=
;
@@ -806,18 +796,36 @@ static void gicv5_lpi_config_reset(struct irq_data *d=
)
 	gicv5_lpi_irq_write_pending_state(d, false);
 }
=20
+static void gicv5_irq_lpi_domain_free(struct irq_domain *domain, unsigned =
int virq,
+				      unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	if (WARN_ON_ONCE(nr_irqs !=3D 1))
+		return;
+
+	d =3D irq_domain_get_irq_data(domain, virq);
+
+	release_lpi(d->hwirq);
+
+	irq_set_handler(virq, NULL);
+	irq_domain_reset_irq_data(d);
+}
+
 static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
 				      unsigned int nr_irqs, void *arg)
 {
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
-	u32 *lpi =3D arg;
 	int ret;
=20
 	if (WARN_ON_ONCE(nr_irqs !=3D 1))
 		return -EINVAL;
=20
-	hwirq =3D *lpi;
+	ret =3D alloc_lpi();
+	if (ret < 0)
+		return ret;
+	hwirq =3D ret;
=20
 	irqd =3D irq_domain_get_irq_data(domain, virq);
=20
@@ -826,8 +834,10 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_domai=
n *domain, unsigned int vi
 	irqd_set_single_target(irqd);
=20
 	ret =3D gicv5_irs_iste_alloc(hwirq);
-	if (ret < 0)
+	if (ret < 0) {
+		release_lpi(hwirq);
 		return ret;
+	}
=20
 	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
 	gicv5_lpi_config_reset(irqd);
@@ -837,7 +847,7 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_domain=
 *domain, unsigned int vi
=20
 static const struct irq_domain_ops gicv5_irq_lpi_domain_ops =3D {
 	.alloc	=3D gicv5_irq_lpi_domain_alloc,
-	.free	=3D gicv5_irq_domain_free,
+	.free	=3D gicv5_irq_lpi_domain_free,
 };
=20
 void __init gicv5_init_lpi_domain(void)
@@ -859,21 +869,12 @@ static int gicv5_irq_ipi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 {
 	struct irq_data *irqd;
 	int ret, i;
-	u32 lpi;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D gicv5_alloc_lpi();
-		if (ret < 0)
+		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
+		if (ret)
 			return ret;
=20
-		lpi =3D ret;
-
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
-		if (ret) {
-			gicv5_free_lpi(lpi);
-			return ret;
-		}
-
 		irqd =3D irq_domain_get_irq_data(domain, virq + i);
=20
 		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
@@ -899,8 +900,6 @@ static void gicv5_irq_ipi_domain_free(struct irq_domain=
 *domain, unsigned int vi
 		if (!d)
 			return;
=20
-		gicv5_free_lpi(d->parent_data->hwirq);
-
 		irq_set_handler(virq + i, NULL);
 		irq_domain_reset_irq_data(d);
 		irq_domain_free_irqs_parent(domain, virq + i, 1);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm=
-gic-v5.h
index 40d2fce682940..f78787e654f4c 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -425,9 +425,6 @@ struct gicv5_its_itt_cfg {
 void gicv5_init_lpis(u32 max);
 void gicv5_deinit_lpis(void);
=20
-int gicv5_alloc_lpi(void);
-void gicv5_free_lpi(u32 lpi);
-
 void __init gicv5_its_of_probe(struct device_node *parent);
 void __init gicv5_its_acpi_probe(void);
 #endif
--=20
2.34.1

