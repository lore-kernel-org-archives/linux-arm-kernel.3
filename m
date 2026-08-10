Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD4C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5K2MdLEkqC3sX5oM+edaC96Yt7mhrR1LsyoA0AAGjk=; b=JGVqLsUOcPgbcT/fdChdr4+nCe
	aR+tCDttDHyZj/kmRHkJOqLt+iZoilECAxqIk/O0LEktjrU8kr2gFwjs9cPJ+hq1q3Ow2URx18E44
	BZ/oiz+lOPKFsE9ue3sZQeEejLG23W1p1625uHw5X73x7S+7N8ofYMMp7jdngPg/LYwe4DVSiWZf/
	fUxKgIKikVRLwC010IyteUOpb23tIZZARmG8HlOGk2nmlLBbsLpFx+W6gX9OR776cCbuUhqEDoWHm
	W3QRceDU8PwYfn/fIpD8CKmVdhOig93E68/HJ/InOVLYc4mGJiZnbcyvmRxCeftyOotA2TSbtf7/9
	d3usgrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNG7-0000000BVnu-2J5n;
	Mon, 10 Aug 2026 10:29:32 +0000
Received: from mail-westeuropeazon11011001.outbound.protection.outlook.com ([52.101.70.1] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNG2-0000000BVmt-2eB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:29:28 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iDaP+FoE4WDC1x9bUhEMssfDe9mtmB0PcSS0r1nl1XwWLBvyqpxf1+jRxM5t/ZMMMPCvz+vnds5j6nfEQ0OD6ee3TTeQKYHMP01erT6csY88UUqFzqOr5f2z1Tjs2BV1QqXlUqBYcGg051b9UrCa14LzGD7hKZFx+Bw4Qqi4lenLednUHro5i2dOsbLgAJufuM8R6e8aQC1bnsToPYRFx0RHoVLyEtEG6NyQaaTfD4YS7qZ07NRXpudXwpUTOUDw50I4sdazcZFZmfG8lL6Q+vyP38Zxuvt9KvkTt0eKw2ofayciJ+3YHzLN8O3tpa1PnmRkH459/SoWfZUXo+JjlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5K2MdLEkqC3sX5oM+edaC96Yt7mhrR1LsyoA0AAGjk=;
 b=xDjwSuTLvCsRQNmevDylaXbrC/gd3pBDMhGmh4QF47q6EBRJObh4ztQgh7bkJ/qCI1GL34hJOF0aX9v3mQpW215wsYHj6iaew/2PZuCsjphKyVe3q0gQSmMvhGQzbUs8NkXL0JMU+quw1w3yugSJiklWwJDn1fPXlxyoIdO0N+lE1fH93heyBx5kn68CP/dqk/bN1LmwQu6W1j/IYh5U38xKYzpKQLHNJoxyDBdUjGtoqtzAvHDWeBkX7av7cGCgvhTMlStGGU+Qzuu+oirg92NiY22y90Smo3LBuzwHvMP48cM+wxSK3uMtq2zJBIIZ7eE2BuTg6OrKvJq6+TvrZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5K2MdLEkqC3sX5oM+edaC96Yt7mhrR1LsyoA0AAGjk=;
 b=VU+VCySlU09qt9ptgxfGLogXFlUfHUHnZlcnCRjsivrrdt/aQ2+7kS0EUZ/uKSANfZ2r22zIYr1NZ4gG7kcYbjGTdd5dc77QHD4C4Bnkz+HySTRmTPj8aiWn38LAos6VzJSVEUhMMLy+AF2lnNwM2gqyLb5xw7+X+U3YrpXtpoc=
Received: from DU7PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::14) by AS8PR08MB8684.eurprd08.prod.outlook.com
 (2603:10a6:20b:562::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:29:13 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::1d) by DU7PR01CA0011.outlook.office365.com
 (2603:10a6:10:50f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 10 Aug 2026 10:29:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE/hSV8rUBi9/DK6CX/Fp3p7vFs/bJTlmjJpmsPRNMyTDhvVhKjJ2EnUq4idY6KMkbz7N6fWzGHZxzMasOjspCqOiNtO6IO+Pim1WcCXGjf8L0XO5WYi0VC44sovUsY7UmVu1jirv/dG6tm/GSrQRYUD8qwsTz+YV6Jo8XJlccK9dScp1cjGO5jBlolAz31yoHlQKi1Ut91r9WQhRF1nFH/SoKfOF176F1+2nYkvhu4cuShnvVHrIT8soyyvmeiQ0T9iPNZ2nzerq4bpvlsGdkwv7iYd3OOM260dWooXyZlbtG0iHPrs6PMffoLbe3MzKaGzkfoHHebApaOHtGHVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5K2MdLEkqC3sX5oM+edaC96Yt7mhrR1LsyoA0AAGjk=;
 b=SW1Ob3eEj60oak8FxYGHFkmF7nMRv2+ZEz2uWW+Qt1SQzVj2fnvz27cckru1kr6Elhyfp0bF1jtMk7Cz96f/ElVEVRN5F0eEMn6SMxkisikASKw95FbctmO9Sk8t7aIc8I5j/xkhsEzO8SrR/xaDjCWP8h8B/s+E+AS24dh/zZm8S2kSOma/9D+0jsJEbJfOxxpFF/HZQpge7XpXnGHZyBXgvYDl/U5p10LiYQzeclcZ2G4PyL7blmwYCDsrSooCOF9wR1Y6FuYrblSVwTQa9yGpDbLuvQMFm3O6rsd19D7mBhGc11sUIyb8GEHHxv65E1qb7jBID36y9/hXGrCxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5K2MdLEkqC3sX5oM+edaC96Yt7mhrR1LsyoA0AAGjk=;
 b=VU+VCySlU09qt9ptgxfGLogXFlUfHUHnZlcnCRjsivrrdt/aQ2+7kS0EUZ/uKSANfZ2r22zIYr1NZ4gG7kcYbjGTdd5dc77QHD4C4Bnkz+HySTRmTPj8aiWn38LAos6VzJSVEUhMMLy+AF2lnNwM2gqyLb5xw7+X+U3YrpXtpoc=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by AM9PR08MB6179.eurprd08.prod.outlook.com (2603:10a6:20b:2da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:28:38 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 10:28:37 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH 3/5] irqchip/gic-v5: Synchronize CPU interface disable
Thread-Topic: [PATCH 3/5] irqchip/gic-v5: Synchronize CPU interface disable
Thread-Index: AQHdKLMBZdu5TuNnZUO1ZxnHsrs54w==
Date: Mon, 10 Aug 2026 10:28:37 +0000
Message-ID: <20260810102652.758719-4-sascha.bischoff@arm.com>
References: <20260810102652.758719-1-sascha.bischoff@arm.com>
In-Reply-To: <20260810102652.758719-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|AM9PR08MB6179:EE_|DB1PEPF0003922F:EE_|AS8PR08MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d7412a-aba2-4518-119f-08def6ca38e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: aw8jEgs5qBt7E75SR24qSxhdHWa68kGO3rCR5Suk6NpRgWb/HGLlxOktIrUmRKCK3t42WjjkK0kRzDPi2FiHcFJFhABmXnwfc88T3skK9JsnQtfeM2dIZhYr3uLOewCiXc+MEV7ZsVoWQIgYjU34fKyxmrmX7D2QxGKuOByDWeQ2gmpGQsST4ABRwJvQZzjsaAZXtZhocZiHrgazW7El+DIKe3q/8B+nWNcEp2WMr5K7LaCdj3UGbf+DfoaSrR4xtkyNdO1XLDxS8750MfFZAFsCi4aIT/5e7v4Sknb6oPTXVFSDV0ktjceCpXwTh3kKYmbRIZFO2JUAIT9CZ7PoaZdrLJ47EG4y6NwZilNqTpVfs4wU208ykwrKy6IPdiqRTDZteByZDAOm9VMiJ1Lrfe2zZTNHpuwgCk6MKNoN38IxvoMoggiS4lbJOyY+/pI88CYQBf9lJmwQi9EJDzDFqiTZt6fEANQcPjBw4XmtwuuGhRSYC2upYfE1qdlz3BFK5TMbwDigMyYddOUWB6p8rlNKa8oRW+Pjvcb3VVpoe8v+bRHGvee+7I70UUZZmY4mP9CtWi3I2XzLB+O52sreG4v7uXpc/xRGE6n0Vwo/u6MEQo096TsFCRjFaCdUUJYOPB+reg4rPuLFYmDl63UM1dLTV65KS6lY36Y3EQ/d9Qc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZYF+zvinjCxvswYHqBx3WcMPQUn8A+YX5zZv5pF+PkKfmc14HJQ+44ybpZCnVNpcqMhucK4CS3yyyMmFsabovb5hBK+Fe/SkJaOR6YwlkRSK2pKs1wK/wBE/t4ueO9sEQ54U4lbT8+n0IjpQPD2iTB8d1UYz7/9aqAl8H/VJW6MnEHSij4DtHIeSG8V654p9Nb6FeqMq/qc/IQGO4hNtlr2eV6E/iDbuEmbqgBOUhuOBns/yk8hpuU916/veyh8hv9PK+aDnjfnRkMf/mu6rBb3W5gav1ZTnMTnOxAks2GIUSuWyukhE/XMm16DcV/2AmtjnbMGIegGeey7aNZog8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6179
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 065995cd-3a5b-4524-1d4a-08def6ca23e8
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|35042699022|14060799003|36860700016|13003099007|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ezRnwgeYrVOIkJkarlUz1BGMb3eWQQnpttaPc7hWYbw+gzJtm75G4kDmE66Vwp4/a9OqPasLDMh2ugQkImYF306VW6lb4NaW5ifoxgXyoQhwtOFXOjPQKCzDQtjT99kzgXFWp0ldUFZZ3jZa5cMq9JFy0POAOYVVa0uhHKvR8fSKg5GKzC+dk1IXyHgD0LS9fJnf8asj6yKAK4NdOjdNQumWs85DSPv8+orpY4P0aQuZ8Aa/Vqeek4tgQ2/TAjFzB7y/d6ZX2Bwh6FsXFHLDhKGHSBhPfH1RsyGPruM84oahfyQLI+C/wLmjhVczWc/7r+25MzcMqQglX+BO7fHjCSnQET+uaSZ1KDgZiJza+zePgjuaUkEmcWqxGeCPxr0l1z31S/HrdqiVAvVL9bJd+FiVNpUGl9CAfQh1t98YQ+zNKmElq2oRKE/fR6IXhEKkUxGF/9+d8Yf00xPjiHNUGB+mTaH3Ca/Y9/QlAZeFf0HHd6N9atYhUUpcY2v42bj/QTFFao5qQUSuOvnW9ohq0oRNm8LsWzpiAovDElfJSP4jJMGiu+gu/JExOGjeJlKuS4TmHA/5UQ+UzmhLEu+52uLrifXjXGTQvJCJjq5+4LtXkKjoxmuRKaBZ7mwIYTHhiZbggN4kbFfmCfRVnqOCNg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(35042699022)(14060799003)(36860700016)(13003099007)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6J8TDfJXh1shEpJ7NToGTWz4K4psyJb3gxgJryomO321Yy98scwmEm2LkChBeDFdcceQIDrd5JVWEGgpsiee8mNawhW45Dogmv8eGS42d+TdaQJSI+K6XZdO8p2ZhknTmraHhnP2LDBR0Yq9ANVifSn7O6N/A1VKnWkp1wJwFZj+O/0Ee8u5G4LCyt+P5Qj/GP8Sirc2xwZ7ZQ3K4q6wUq0OZb38ItZMbKiZ4avPYMohc+ACRLX5IfIagC+Fzvj7PX7ocM/H+N9JeMgUfTs/mQrN2CtJxaHP+FWA1qJ6uX0RZDGlaYNJBWz3qJjKb+AW7JOVVBTWiOwFbZnM/hU2654oUgFzASK14VAwoTu0TkGbqIPVmVkq9T7ZKn6sukDDMG+uTEV983xhgxm+9xMWHJK8dCCMA7TgexzxMhUCWh/9sTKtgraiws/c3rCmiswQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:29:13.0711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d7412a-aba2-4518-119f-08def6ca38e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_032926_671274_C28E6F2C 
X-CRM114-Status: GOOD (  10.36  )
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

The write disabling the GICv5 CPU interface is only guaranteed to take
effect after a context synchronization event. Without one, execution can
return from gicv5_cpu_disable_interrupts() while an interrupt is still
able to be taken.

Add an ISB after the ICC_CR0_EL1 write to ensure interrupts are
disabled before the function returns. No corresponding ISB is added
when enabling the interface, as interrupt delivery is asynchronous and
there is no obvious benefit to waiting for it.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischo=
ff@arm.com?part=3D6
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index e9d1795235a66..6a99c541b559b 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -983,6 +983,7 @@ static void gicv5_cpu_disable_interrupts(void)
=20
 	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 0);
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
+	isb();
 }
=20
 static void gicv5_cpu_enable_interrupts(void)
--=20
2.34.1

