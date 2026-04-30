Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B28FCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j49/ivFxAi4ti+W3UyRbCXT7+aIM6afFVDH28pIQhE8=; b=KHWaFxxLmmQDxH6b0C1oxQoK65
	MFL2/pI1PKfqXcRMdZtCQi1QjcNEwRw5TwL2PIAlaxAZlMrfaY+rHEVwEKiTKbWULgY6F00K5cdq+
	MxCUsHxZBtwGiUuGjpGn2GRuUfwkEVvLOlzg7NGzXtQt0ZsYhLOjXhN9iuiR5TkstbFzgRKP2ltr4
	fLKKMY3Rh7Cb7Go3orr8liRdIhuEEHcX2Lw7LZigiLtQ9NJ6gJWUu2Q/MJ/QvQiB946lv0ugmI2e1
	srWf8/sU/+SNn2UVI9roX58bBiydyGveoCFgw5hd1WwFg+4pImUTDkBXlmKsSzplnG0pT9whLaaKW
	mJZrjY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQe-00000005f11-1FhV;
	Thu, 30 Apr 2026 15:35:52 +0000
Received: from mail-northeuropeazon11012044.outbound.protection.outlook.com ([52.101.66.44] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQb-00000005f02-2eZi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:35:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QFCa5ALfXo0NmJUpjZhEhIDSWoEYgQ7ZiXGnwrawjn273OHeeOupa0Q9E33C+UMC7VhGrxQKGHwFcD7AgBB5c5U6YBFeBk44ivrTWGk+zMEXSYO8kAQjCS34/gghjqx8SkHel+Jd6CtXGS149UJ1Ow55n0L+T7v5tGc979aQN9DBC9m3nV3+t9PBBh+0Ze891wBHCvBPlZQRZIkzXtMdWBabpw55V/nnG0p5FzY2OF60yVlIdZPpWxNB6QPMpOvKelY/cEbfz5La92CADPAJb0Gzpb9GmfF7bp1GW8nERHWjP1wrWZTxi7oGx3QeA6ADDcoo9o9AAy3IYgd2g8cqkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j49/ivFxAi4ti+W3UyRbCXT7+aIM6afFVDH28pIQhE8=;
 b=Ugn2p4LzaAkyMdwfnPrSL6AYBJz0LUMCtiXR2qGX59zn4i+pCggZ4G0DyPnzIwd5lbg8sBTzprKl5tlKy6AdR9b9qRXwYNgSLGvu09IrMaw0duFKrQ1QNUPYHeSEjeWTBpAq5d4SHQRKULmnyismEIfWGmiM3DsQXcY+7PJtiy+pEW71U4cR1qUQz9jxH3Z31Uol0fci4JR7h57LLGa7haA9iOcAQJIpouMQh86h1Egk7v8Asgm6kulcpkxIg55UgErAcbXTuoz5PaEMwkCQYYlkYj8sD2k0C7QySfSjULhNF4kVGnY1Za0bgEUIlSeK3RBzlOSQr408mCdAGiTRlw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j49/ivFxAi4ti+W3UyRbCXT7+aIM6afFVDH28pIQhE8=;
 b=mwqwEf2eucEN1268VamXoo8v++V8wVqBt0d+QHOzUEcbRLO/DcGQ69m7OZH1rSvCNew35lMcBxclztyNmRU0/N8kkqKxwSHnRVnl3kJtRTSvoe/pfrHGZb5qaBtnovSuZBKuBYQGkP3YG6tRXmKjNBrPSSrq40Anmf4Kovx5wO4=
Received: from DB8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:110::16)
 by GV2PR08MB9302.eurprd08.prod.outlook.com (2603:10a6:150:d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:35:42 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::a5) by DB8PR04CA0006.outlook.office365.com
 (2603:10a6:10:110::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Thu,
 30 Apr 2026 15:35:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Thu, 30 Apr 2026 15:35:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsBVufJYKKIFnP50x2MI7jpWTnTcQQonyPcneEiHQcvx5JG41KNx9dxZyu9tlnABVQ4aifBt0s4QsXlS8456g9WjPdFhUilDrtuHzi4Y0xOvKv6RwhttXvF3o2vKcoeIA0AT3A5SxvNCdeu32x2QgLMJ1kDIcF323ZzstgGoDEQJxYUWj3TCF+tpzJDTxoZOTe9KtdNPuydwkzlBH7aGR8COyKw076TxS15P7JGDTwkiM6bpxIX63DG+Wr7tFS5QpxenfdW3wGWSUeiiYoQUhyI7m5uHbbBfWP6L9PCE809TGPEbOd6jXZWnmVBMJ4IVn5ajsyeieCYOJSZb4HmZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j49/ivFxAi4ti+W3UyRbCXT7+aIM6afFVDH28pIQhE8=;
 b=fp15qasTDv0qNGMBRQ/RNNbs0dnINO2ll2aS0L1Eib9Oz/FahgPugcrtVSlc4QBcPAw78CSd+t4Jplh52a48a49me0ZCLcilO59rH7L2lNhQiPepbweRYcLFwnJxPXz5Pxqqon6CDvgHXSiEpFwinkTtaV8i2KlLtPjh4vBnIs1CBrxcLVkGphqHYNhg4Tqu0tGygHKbEpVPJ3/KMOl9Yq9f4qPZsfmeEwc46ZoqpXiNVdHaLOgfzW4CTwmfd8u/hmv21NG4g5K45c9dYgR5KTDDjxq+hZiFw65tDmMJ7ENtdwPffrRMd3eghtp2C0+nzCWV2RC19n6r0RSVjtxRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j49/ivFxAi4ti+W3UyRbCXT7+aIM6afFVDH28pIQhE8=;
 b=mwqwEf2eucEN1268VamXoo8v++V8wVqBt0d+QHOzUEcbRLO/DcGQ69m7OZH1rSvCNew35lMcBxclztyNmRU0/N8kkqKxwSHnRVnl3kJtRTSvoe/pfrHGZb5qaBtnovSuZBKuBYQGkP3YG6tRXmKjNBrPSSrq40Anmf4Kovx5wO4=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:34:39 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 15:34:39 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 2/3] irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc and
 teardown
Thread-Topic: [PATCH 2/3] irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc
 and teardown
Thread-Index: AQHc2Lbb0knNe6Mm9U2QLy3yD6nFRQ==
Date: Thu, 30 Apr 2026 15:34:39 +0000
Message-ID: <20260430153352.3654325-3-sascha.bischoff@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
In-Reply-To: <20260430153352.3654325-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|AM8PR08MB5828:EE_|DU2PEPF00028D05:EE_|GV2PR08MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e0ed34-86cb-4263-3a67-08dea6ce235b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 3ra4iPXXzcRqCNKZ/d0G4G3V41iSl8PEdqE8itP4DbQzh5FnPfnogFM4BtyvpjLXE1eGEYIgHsrqe1p9aGQ3FWiaGZcuRr5qXKotOFQDBfckeCiIizAA6rsC4OEEC398Dn/JW1RisD7JSuJ8ZsxX4YSEG1iYxnUVsIyyUfLefeK7P8KpnsuRsZ29AzeaP5cKkgNgNeMnhB+R8zDfZhifTg/csSIofT/pyWfYDjOcb2aDdHLg4PnAnaIVmTws5BZ1j0LsJ/kNoVad48xJwscz/EQGacPxN9Hu3AyxbVuWkAto2/ztHQ26Ph2f3jSQAmVlB2BLKTiqW9H+oFjJfMiw9Wp4u1Qh29QPnt+/Qma6gFD+/p9/6Y6nFTKphZgeSLxRc7b66Z1zd0715k3leNjI2E2pPzZKKJA4gYxM6ZVx81wo+mDrYivposWnG8H2+ewan83k0slz3Ed+T922ZxzRB18g+cYDWUs/UC1f+GRcIPZnZUWGSJzsa82UOxhLb7seiCrel1fsBOtWutQ0uzxpFIrP+RdiRWWNdkJxB7DL49oZJEOaPATVPr0Ve48zhD8KXLC574utBo7B2YHhHTfb3luWzg208BO3wKBTj2scnem40tUhmXHxjzwNcg3mnD/92slLLjyLJKgKIFQh8oTVkTJ5TrXHRBbttlnq8SIygYLBCINJav1UhxYbC9B7p6qNA5EST4gQACDThBxs/ILq41e2SgVeb8jz+h/2OUm205XYUtOZqiwwDiSu72gzt5h116Yh+NmsDY8XiR/KabbLqA/70BYXcmx2hBeQBMC0FII=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O9R8n02l2i+RI2JXiPXceC0wpoE8r784YeHa9i7DSiKs4y0gd4ymCXEHRMirCwS/dZFIPizZ76sbKSdfUHL69RiooGl4eOQSe0ajxtSlg760yzjdstUO9n4SoMh9gOcoDWq/v3Ndc9evirJs+kfjbjBREn6IpomYwbyjUffuBdWoPzKyjhSFWYmY1DuhMutfTrDoKi/qDVsD0dRlkDip9h31TZnIpZCogb+Tvb4p2HGNFngn0cgpSpDtkEUfYOQ/WKkS9/WT/v2o/Uo9GJH8pq+Fkqgh4BWCpcIW7URqC/Mhq+N8R11PcDwYUZGUz6zuimPu7ccLKSGCL3Gu7C2cKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: abc0c9c1-74a7-47f1-5d3f-08dea6cdfe11
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|36860700016|82310400026|14060799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: MGpvPI4o1Rw4YfPgi57XB8ud/DobOIoickvmRb9w3wBPZfGrMGyMicEh2hc82oYmfR3tfcFraTSvYpnmL4X+3omfK9DFQlE7AT8guPV1PI6PCVWh0wDfr7tunaLHrTzydfOy+xObI1q9M/b4cbnugBHyspnf/dotV5lx2oIPHesGPmnMr8ZFzFycWNP77f3lyl3jsl5otcCVLGtB4ZPwAVcotP6t1ZnZXKTcTzRkdHOwqdS9FFptm5ouLhCmk5v8kNGp1RoYAV5G+uJwKJk0h9G/Y7NtqjCh+robV2MN7DcHbr9xwCE3ZbIC+xadL+E1xuW1rIREcJfGXoyYpikn/sqIkuXfqZla5sZj7apmYmAbNxzTyqZNfrWtLVJCa/EAq+iKspcu3JohEzduwjLxNe614TMf2jHyVtyQ7ATVoyZuL5wr2GBBmAbsbOYy3cRF9Lga3kkkw3ya4p51pQp3wGaIQx8LEIPRJfr6q45Fyn26GYUCM9o2rd/fC2aO0GZnqaKmPnalekCW1dzfDemGxls+Ftbib7lm5waCkN4AOacdbsmFCfXapS7ur/oBVdeH9LPElwlx/Vd5M67tAsYxKbI5IhhXz2Tfu+LTMVo06R+sq+GwIZh2C6gYIS2ygzcfpScE4OJDLm8GiKM3WKe32xY7IIk20AWFpZFtyqu5Cpa7T8JbzuSA4+7eMyOsUwOX27joggX/Ofujb1Tl0yQMDmNo7xxDJi5kb7/fZe7IGwuydEevVOUJTn4e3cIuOH12jS1lJS+vweayhrBd0cfS1w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700016)(82310400026)(14060799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gVjtvZbJHtlggHfNBv+yJ5woHgUxlbNSVTA/PB7PiGBg981a4VaSiCbxhQ9gSboHQIqBHaEZKnssc1nmsDhlEcnT4susauRdV9JOHl+uHqU69VcWxv+RmKlbyQ+qvDUdpWPsh9aLsF8c4NCSKpSDmy93slJ8ksKlxtnuamuilZ3//D3AE8mus7WT9EpqmgaMGcgH7+3DZ7o4kHerp8VikxzQio88lCl+WIJCJ1BkRZymNE5Fha1NOx5y+Ba/2qdGAflLA0/UjHqK7i4g+lwuOSCcHyTR6vV7r5YcL//87ENBRPHthnjOjHxbIi1ZVN1tTfKDZMgGrXa+96VYxWZJrJ/SC1vt2GLoB3ziIYBPtgRI3BKxNLDhR6uGcavQCXG4zN13LlrBzKBsdswdSQ1+v9GPmKBrTw+gP6+gyB+Y5oHTlQHISn+7dkMQtnsJqcdV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:35:41.8822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e0ed34-86cb-4263-3a67-08dea6ce235b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083549_811659_5F76D72B 
X-CRM114-Status: GOOD (  19.53  )
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

Formerly the LPI allocaion and freeing was handled by the domains
built on top of the LPI domain, and hence the LPI to use was passed in
from the child domain. This mandadated that LPI allocation and freeing
was done one at a time, rather than for a range of interrupts in one
go.

Now that the underlying restriction has been removed and all LPI
tracking happens within the LPI domain itself, drop the requirement to
allocate and free LPIs one-by-one.  While we're at it, clean up the
IPI allocation to request all LPIs in one go, rather than requesting
them one at a time.

Incidentally, this fixes a unwind bug for IPIs where previously
allocated entries were not unwound on a failed parent allocation.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 70 +++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index a3c9eaa8ff486..61a70fe48bc32 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -800,17 +800,16 @@ static void gicv5_irq_lpi_domain_free(struct irq_doma=
in *domain, unsigned int vi
 				      unsigned int nr_irqs)
 {
 	struct irq_data *d;
+	int i;
=20
-	if (WARN_ON_ONCE(nr_irqs !=3D 1))
-		return;
-
-	d =3D irq_domain_get_irq_data(domain, virq);
-
+	for (i =3D 0; i < nr_irqs; i++) {
+		d =3D irq_domain_get_irq_data(domain, virq + i);
=20
-	release_lpi(d->hwirq);
+		release_lpi(d->hwirq);
=20
-	irq_set_handler(virq, NULL);
-	irq_domain_reset_irq_data(d);
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
 }
=20
 static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
@@ -818,32 +817,38 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 {
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
-	int ret;
-
-	if (WARN_ON_ONCE(nr_irqs !=3D 1))
-		return -EINVAL;
+	int ret, i;
=20
-	ret =3D alloc_lpi();
-	if (ret < 0)
-		return ret;
-	hwirq =3D ret;
+	for (i =3D 0; i < nr_irqs; i++) {
+		ret =3D alloc_lpi();
+		if (ret < 0)
+			goto out_free_lpis;
+		hwirq =3D ret;
+
+		ret =3D gicv5_irs_iste_alloc(hwirq);
+		if (ret < 0) {
+			/* Undo partial state first, then clean up the rest */
+			release_lpi(hwirq);
+			goto out_free_lpis;
+		}
=20
-	irqd =3D irq_domain_get_irq_data(domain, virq);
+		irqd =3D irq_domain_get_irq_data(domain, virq + i);
=20
-	irq_domain_set_info(domain, virq, hwirq, &gicv5_lpi_irq_chip, NULL,
-			    handle_fasteoi_irq, NULL, NULL);
-	irqd_set_single_target(irqd);
+		irq_domain_set_info(domain, virq + i, hwirq, &gicv5_lpi_irq_chip,
+				    NULL, handle_fasteoi_irq, NULL, NULL);
+		irqd_set_single_target(irqd);
=20
-	ret =3D gicv5_irs_iste_alloc(hwirq);
-	if (ret < 0) {
-		release_lpi(hwirq);
-		return ret;
+		gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
+		gicv5_lpi_config_reset(irqd);
 	}
=20
-	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
-	gicv5_lpi_config_reset(irqd);
-
 	return 0;
+
+out_free_lpis:
+	if (i)
+		gicv5_irq_lpi_domain_free(domain, virq, i);
+
+	return ret;
 }
=20
 static const struct irq_domain_ops gicv5_irq_lpi_domain_ops =3D {
@@ -871,11 +876,11 @@ static int gicv5_irq_ipi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 	struct irq_data *irqd;
 	int ret, i;
=20
-	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
-		if (ret)
-			return ret;
+	ret =3D irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
+	if (ret)
+		return ret;
=20
+	for (i =3D 0; i < nr_irqs; i++) {
 		irqd =3D irq_domain_get_irq_data(domain, virq + i);
=20
 		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
@@ -903,8 +908,9 @@ static void gicv5_irq_ipi_domain_free(struct irq_domain=
 *domain, unsigned int vi
=20
 		irq_set_handler(virq + i, NULL);
 		irq_domain_reset_irq_data(d);
-		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
 static const struct irq_domain_ops gicv5_irq_ipi_domain_ops =3D {
--=20
2.34.1

