Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6278FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jii81chrQXLhQ+vRfonQxQ5UT9liCP8Ow95fc2/UQ00=; b=dETf5iDped6bcT8mCSfdtorbcL
	7yuwNlTy4Nn0kqqJUnENsniwOCrC+aX4X2EqOI8SIYdIGHuadXqFDFXOX1WU43ASZk4hLYut7+Rht
	8HhEDtjGinb4rpPXTbm6ArmbCGxcn5Lih2qdgA3TbUHGe7S1FgTQyZv+GMvXH/VkaDiYRymn8BSJC
	2WM2XRgvPodwuVNS2y0nigI30ydBnKoDslBFjSyX+dehIDJUik5F02QBBD5GlJHv7dbhZbAkh/79k
	J1bs1NeCZoHcPBv7yQx6P8XzIgpvDcSD7YQUQCOGAdFsbWEeiocdvWAcQTErvcakjaPC3czxrjDh5
	n6A3ipvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOdZ-0000000HK9D-2DbR;
	Mon, 27 Apr 2026 16:16:45 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOdX-0000000HK7C-1Erq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:16:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oaXwAatJFB1iiA+W/uZN/AMRctUvGacNtc50BgJorT5H6SqywLeAkxtwrkpniNF/4i7UDrAbiwJjHqRgqQBVccFLLDfbKEVG7XsNNzhoxYwGAlAqGtxgHy5sT+4/1p9NXX4uQMdivnIwc0llyp/oSutSB0XTji/KafjNf8Iajljc+vV3GcqYS+1BBHT8tL8+dPeLRdGHuBii4JVJYKZ/8w/8vkmTHP1SSqae0gSXntxyDqfhw365FQODRYIN8IFFGDAD728jSLcjxJk67NpQOW+M9fiGtL9uraTdbmSC0dqsqUml2xdnwFJ4vgl5iKKtXpAGj++q3g1sePAWvOsXDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jii81chrQXLhQ+vRfonQxQ5UT9liCP8Ow95fc2/UQ00=;
 b=IZ7exh2mvIfXxv2y8MU+dQbBEseThRLsgbVBekG+gcVz6CHbbSjH7Cfx9D4k8arTQ6i62jI8GWkUqlaYOnW3gVjPVw/E5CMnGO9DHCEgwyzlc52neUnAfirML6S+eUiGdTbly7p6D7YChtIcHIxIjhPjudffBthY6FEMXJU+/UyaB4x3fF/PiIbYaUoHYgHhhidpvkcY+DadZtXPCTzny9Tf4yx/qYiJ9TcdKL0RnLJ++eMLp66s7SB8gF3ATWyR/h9Bg1c7EFBSr/RMN48YvMySoohWBV0y6cXSaCn1dC7Ual6mHBI/wqoBLMV/g9BEx6qcKNpCua++fA4rkBTpQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jii81chrQXLhQ+vRfonQxQ5UT9liCP8Ow95fc2/UQ00=;
 b=VVHrNyjoS3ZF/tqh8RrulwTcF+WbWoJWCcG9m0ZvsTip5PzyYGUmIwvpIocRsu0Hjy2ZLZxr1r3InJGtX102pFLJFUeZZ8AYUT8CmFK7aUdesll1f9joBpugOnAWmIAsKNLuNs6yiji0njEaGpJxz+g4jbicRoNDP4grAio4gog=
Received: from CWLP265CA0478.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::22)
 by DU0PR08MB7662.eurprd08.prod.outlook.com (2603:10a6:10:318::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:16:39 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:400:18a:cafe::4b) by CWLP265CA0478.outlook.office365.com
 (2603:10a6:400:18a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 16:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCL9g76GHhBTef1JjJ4mrEmSf8eu6pvtAp1B419PmAPhTRbA9+JkKYjDTyPysgTRBPTSa9gnzHFJwj65UF5P6IyaOjzWDg8OwTjU03DgHu66CXAm5CWAU7sQTJIA2sWhLZBPiGltSG/xF0yxpyz9uF7EC//U1e/noy/iO2NuZm+bdXJ+Er4a6H8CbK1QAuE3Ld25zFUZEhCXxzvNpbH3/eaxGh48X2DiLXo0k6KqIbkoSIM4dvHCm6xAkc/AcEe+62XMBQsyNYRYXj5TmsmWGRBu4ZJl4NxNdMyEn6nLtHUCDYCb/LhHOnQqWa+Sgf8lOPX5HJrXmQcREAldd5mxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jii81chrQXLhQ+vRfonQxQ5UT9liCP8Ow95fc2/UQ00=;
 b=OsbgcHI0vguBi8beM7JArb3HhrrTOo6ontsxof3cF2rSEyxdt4X7JP1ZafzM3jo1LC7XkKlJtfRBERq5jDMEz5OkuZPBm/bHSwiNR3o5fS99doJcbwqhPaZjz2grcg8AE/kIEv/0RqD5U52NEa1EMkoNjW4JokVMxNvnwpdcZhtL7CQZiU1F3evnV5NPBxH7XWPHHdg43GwoktIXcDj7uKqHx9PoA+3cC5eLQfYKuFWple4cUuQCEhP0nslqlabJT7yZXYXwSNGFyRDZtMMI8ldYi5g0qfesh8LVX6GV3P8eIo/HP1oIYbGNvPifPBuGlAPo3/o+7M8OFA8NNQLtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jii81chrQXLhQ+vRfonQxQ5UT9liCP8Ow95fc2/UQ00=;
 b=VVHrNyjoS3ZF/tqh8RrulwTcF+WbWoJWCcG9m0ZvsTip5PzyYGUmIwvpIocRsu0Hjy2ZLZxr1r3InJGtX102pFLJFUeZZ8AYUT8CmFK7aUdesll1f9joBpugOnAWmIAsKNLuNs6yiji0njEaGpJxz+g4jbicRoNDP4grAio4gog=
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com (2603:10a6:803:7c::10)
 by AS2PR08MB9919.eurprd08.prod.outlook.com (2603:10a6:20b:545::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:15:36 +0000
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba]) by VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba%7]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 16:15:36 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH 28/43] KVM: arm64: gic-v5: Introduce SPI AP list
Thread-Topic: [PATCH 28/43] KVM: arm64: gic-v5: Introduce SPI AP list
Thread-Index: AQHc1mEU1jzRDrHmW02WTSA96drvhA==
Date: Mon, 27 Apr 2026 16:15:36 +0000
Message-ID: <20260427160547.3129448-29-sascha.bischoff@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
In-Reply-To: <20260427160547.3129448-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3408:EE_|AS2PR08MB9919:EE_|AMS1EPF0000004D:EE_|DU0PR08MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: b8859f42-4fdc-40ac-2597-08dea4785c7b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 51A6sOfkDW/lvJuaDDWU57etOvd5pF7tS+O+eFirBUNSmkx/XYdREx/O9hy2bcAja5+tZC/wLoqRTXiz49BpniTgl5DmjV+gNjz8OTP1wWvldYiz/82UwtNlv9LwKfI9rqiSjB3Rdl3/UZPoToJ5dQK+dAr351cQXrOeuuGy80KqXQhggXkyDVg0Agt8BM55JsGyw2IsgMM/3N9uBWDvPK5gDwpgE7qytb8EmDtP/U90sp8qKrGwWh8PI+QntpN5309tyyQCBL85C1BPLw2hX1vRQN5gdXnagfbnBhkaBcOQqLuM/qyFhWUZNjrqS8Hqi8E9y7XHCktEJ7Egvk7qATEGvcVW85TvDRwB50yxLuiikprbOSmX8SbiYKpwE/JuJnpbNqWTgLQCKuYCfLPb4YxfHBgHVYhEeXWwBlfJBruVbWOI4/e2L/DxMFaEMc/Xy0rEVENFHjwQKnAVUOjmenLtlTor17YpMdVo2P30g7Y2BB9ogZU98cJamPHHGlqt5mUsJgYlk/aE/9KiEa025BaRkrSs+rTj7Ahbka2b5EaKpSwXb9iXuy2qeiOlLwUr82az0jok2tzGfT9yTdgSxuDA60+QkygAkSBsmr277fRLsCFGPpCikK+8aI4nWCXopQw+mxWlTJmKNyGpB3cJKxD/PbJJAKayUYDrHXs/QKXYBB7joJXNV4o0cP+IfBUe9oQwm4/I791p4NA+m1J1Y2xMxk4eFSaWFEL5ydPBpNAAdzHpTTigTj8d8ru5xtzb8jstdldzfieZbuYNgh+OgeRC1Z/vVnfNRMCy1ctXizQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3408.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LGmC/lHWFW1/f7mLyIs3DroNwsfQPNM0+rDFZ+c/ZVgHEMGpwsL5NiUc5NvEnC4bQphTdB2n+E7D10yjuynh7RTvEpm6nVoU82lP733Ujg5Z/wSUqLSyiMPLvqMMscXYFOHJHT7FQeW/jyoqeGb/E0rrbQuUOwDYMOqYKtOiBylSiNMk4pPFI5MaTcTeEWHEdlmrsnefKSAsDeNapGmJVj4o4Z988Yus8oWlcCQPJ/qg2RhObjI1kPhepG0uSpS67uNsSunXx9vC+RaEpyFnPjhFkduwd8sPnsEgYcavJfFcq5XR7u1xb3kwHBBynSZk2P80H6vcdkYtTHaoAe1qMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9919
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6fafd4f2-413d-4ae9-6264-08dea478372b
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ybWsRlQm+Vl9cZtzesouvR+hTKUMp/1Ns2qOc/ox7YhC22mNkRSP0rNfTewLb09J02+Qkg4Q/KrIC9o8hWHG/vrsjAVGQsy3Q7XqJqnynkjCheDx2MnWq77/sAVmqjiPOprnje1aNuX2Wi0GeAXxnM2oNiChohV0rAbWZs4LZekUKhRAZnU55RhE9QgUCyPPXxyUfCEOswSI646qgwCp6uBHNGNaPmRHiCmWahybXw14/mm40QjmfzqpbT59rs+4QocCjNqsfCG7zjaozoBn4iA/q9YNlSoNuHC/EzXMcIGocpJJg1NVnXizZp3Vcqrf8IH+Rma9Xunfu/XERXmJI+HkU1FWGPKpkSJTelzpcJ41TEsGiiBJvoOEG9Ope5p9PryTxn59VJu1vNpLc/8liSN8DFG1/+dgcnINlyhhB+Tq5hq7oKuq9lqgl4ngI/3vJmteDtF1qXylxsJQwRlblIvDnAlpesEtmwam0qn/Qz/6OHVVlOnAzxdxtXmLQ6wIyRB1NMbtLNWkvZ9b6naYtamgSSdWOmLRDoyJouJO83IEtkTMev1fP6Kbu2VCofBc1ceN537pOgyHcxiShFN5wWeSxqJyXs+xzV5/uL2Vx4Msi9S5VzUhjJrdk/LRDansMdM5IB39UMg8G0nd38a7RYAoaumiJNRnvidIgXUOKAsMdurj9WELpFDIqr77wO31+y1R+6uIO10gxp+EciIx+rZRZFBOrrLOluZBVepciK7PN9+CRI9sBeX2E0EbcSQ5PPpTz2HrxwJjPRx1laFaaw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X/N3+4IPEA6Q4uHpnlvTCBMKKasWhKiEDHJHLYwAa0Vfn5Rwjubh3L0KsPLMDgw5uewFKInSxvSyEpTA1oqC0VwuxAVLpdWQRDaYrBewUQd8JKdbeoPHT02LRRIPj91AyPVpl0KXXUIDvPJpAg5Sjwf6uDxmflqqkWIpkDcfuGv6+sysHK1eoBq5E7AXjcTMDPFfZ0QEXbB0EXrHvpUgZaCYNPF4D7wHG8MYNVzMUvjMhgTEja/iLBLxluteF6NDQlML/LwgBZY0pZARU28CHvMqwTyvoE/P5xbwJu0xtOzdKMh2Yy4pBpAXOwf4izYy3YyPp+ObpACh1BpG4tU0VHDVqBc35AZErrL5ySsOqBrg2dz8UCmdQ0SHC8LXrYcA0mtMkMoOrCUr4tpRLcVa5zSH1mWcgahuaaTY50aViS8xNawjdqx/kIYbYAG38vlB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:16:38.6750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8859f42-4fdc-40ac-2597-08dea4785c7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_091643_483171_74EE6676 
X-CRM114-Status: GOOD (  21.18  )
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

As a general rule, GICv5 works a bit differently to previous
generation GICs. When it comes to virtual interrupts, as much as
possible is handled directly by the hardware and requires minimal
software interaction.

So far, the GICv5 support has been limited to PPIs. These are handled
via a set of ICH_PPI_*_EL2 registers, which are used by the hypervisor
to manage the PPI state exposed to the guest. They effectively take
the role of the ICH_LR*_EL2 registers found in earlier GICs, but do so
for EVERY PPI in parallel. For this reason, the GICv5 PPI support
doesn't use AP lists at all - all PPI state is always presented to the
guest.

The lifecycle of a virtual SPI is largely handled by the hardware with
GICv5. GICv5 itself provides a set of system instructions that act
upon the virtual domain. One of these, GIC VDPEND, can be used to make
a specified interrupt pending for a guest. The state of guest
interrupts is tracked by ISTs, which are allocated by the hypervisor
and provided directly by the hardware. The enable state for SPIs and
LPIs is driven directly by the guest (using the GIC CDEN/CDDIS system
instructions). Priority, affinity are also driven by the guest.

All of the above means that it is in theory possible to handle virtual
SPIs from KVM by just executing GIC VDPEND whenever new state is to be
injected into the guest. Of course, reality is a little bit more
complicated.

KVM itself provides an interface to register a notifier on interrupt
deactivation - specifically intended for use with SPIs on Arm-based
systems. This notifier requires KVM to track when an interrupt has
been consumed by the guest, so that the notifier can be called.

SPIs are not per-vcpu - they are effectively global to the VM (even if
they are affine to a specific VCPU, KVM doesn't need to know this
information). Therefore, this change introduces a per-VM AP list
specifically for tracking SPIs for a GICv5 guest. The intent is that
while an SPI is in-flight (pending/active) it remains on this list,
such that KVM knows to track the state of said SPI. Once the interrupt
has been consumed by the guest, it can be popped off the list.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-irs-v5.c |  3 +++
 include/kvm/arm_vgic.h            | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-i=
rs-v5.c
index 729a3a3aca3a3..8e69b624194d5 100644
--- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
@@ -685,6 +685,9 @@ int kvm_vgic_v5_irs_init(struct kvm *kvm, unsigned int =
nr_spis)
 	int ret;
 	int i;
=20
+	INIT_LIST_HEAD(&dist->vgic_v5_spi_ap_list_head);
+	raw_spin_lock_init(&dist->vgic_v5_spi_ap_list_lock);
+
 	/*
 	 * We (KVM) allocate an Interrupt State Table (IST) for SPIs. The
 	 * hardware mandates that lower 6 bits of the address are 0. Each ISTE
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 3a2dfbd5210f2..812ad325b01be 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -544,6 +544,20 @@ struct vgic_dist {
 	 * GICv5 IRS data. Dynamically allocated due to the size.
 	 */
 	struct vgic_v5_irs	*vgic_v5_irs_data;
+
+	/*
+	 * The GICv5 SPI AP list is global to the VM. This spinlock ensures that
+	 * we don't do anything untoward!
+	 */
+	raw_spinlock_t		vgic_v5_spi_ap_list_lock;
+
+	/*
+	 * List of global (non-private) IRQs that must be tracked because they
+	 * are either Active or Pending (hence the name; AP list). This list
+	 * will only ever contain SPIs or LPIs. All private IRQs must go into a
+	 * specific vcpu's AP list.
+	 */
+	struct list_head	vgic_v5_spi_ap_list_head;
 };
=20
 struct vgic_v2_cpu_if {
--=20
2.34.1

