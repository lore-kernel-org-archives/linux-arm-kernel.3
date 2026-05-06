Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF653CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TbvABB3kHRvbagdOT3WkZo19M8CZboLskdL0gbXGIxA=; b=TmP09CTh4ADPOcvVwsb0CRRJ/C
	x5DS+WyG/xo+wxPx3IseEIj41oCUiY6H2b6jr4LBMIhKttinFz/SOkq6fmebD4gC9dDOuuphWd0Hs
	d67V4JBumJkcR1cgkQlPWYn0bwcFGVYhfnIw5jSEl7/QU4cnHPmsvtd2ml51svvVcUmIk1SP4hUQ4
	OzMzyAOc88ntje9VKc6d4npc8KNU7cgQN2IgvXT2SI2ITFZx8KVqvOPGCLliIt65UH8A2YQEXyZHs
	7kyfQG0Pm/W5xYL6n0kJqpALKXCaDXVRGN8rUGdg+iuaBViSmr3iL4U1csm2DjOkAMb47+n0Q0w7v
	22OY0p/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYhV-00000000N04-3W9L;
	Wed, 06 May 2026 09:37:53 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYhU-00000000Myt-464Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:37:53 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sbkt2BxtBsZM37k/WSc1CT3V2NIN0D+8wa4tamXj5jSZquGiyOzMmZhu1h1KiuQT62ZMilSoLNdURensFF8nta6ua1Uu8be5cpekROIVDTJxGpLBywFUiA2Wo6GlYnZtTbLaH9qxTwm/zR27uUnfwWm0oKZ3aJsEe25T88skMAOLvcPDWMHzfRnRFQKdoDO/dZ8KyRL0drBjTLqV8jTQMjGDDvgZ33tgglHfcbOK2JoLH64XdjFFpsfw/W1MXYsMlTIv10w3hboZDItba9RVPq2C51XvcCEk85w7C5VlF51VmBzi7JCZjXhgyiH8FyFl2PkKNBpBo6uiCqIUzCftAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbvABB3kHRvbagdOT3WkZo19M8CZboLskdL0gbXGIxA=;
 b=NFr3FF/fk/tqOKYo1EM6z1DXg8PAKmtacWVnz3agKpIsJsG4yRblaOiPkFWhMCCA87fuu3Xblxoz9caPahWqPvTkWXSfXQPA2rD94dDp6whsAPuc/M85jSnhpN57yuL4T87Xd/BF/j+myhz3kYAp2j9E9/b+4tlJOfSRjIz1FvFpiDRiQkAsklIPV8bm6b+YHKlw9q2r8jEozBoRjrdDIm4aipat88t6Wsymesb97EgL0jovv4Vb9B9X2OnlhMUBXfi1GLm0FmmVR6xuMfNdTvTK3bIZOcrMg2p2isvo/rtujZXgNXKuViuozUAPTUTwXlgIsQohMHMsxyvfBVI9+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbvABB3kHRvbagdOT3WkZo19M8CZboLskdL0gbXGIxA=;
 b=OOJccg5n6rDKTMNdaOK7dFzSgV/n7aCppnZRb4iic4q9wjaAv0m1Jb2BfFKUX7HXgfbh5K5xcTpTx/vFlK/xAYysrzzHpkeSIr/32X9jkKGDt9/pCeFUrulk09Zchbe9iy9g7NeaUcAtIIiWyx7oby0upasxq3vVwUgZznUFjlg=
Received: from AM6P195CA0070.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::47)
 by AS8PR08MB8467.eurprd08.prod.outlook.com (2603:10a6:20b:567::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:37:45 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:209:87:cafe::57) by AM6P195CA0070.outlook.office365.com
 (2603:10a6:209:87::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:37:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS661zb3tqXFQBQE6mHDbLpH+fFzElyvZVdoHG14J6yPuWr2/LFBf8Dt39ZTTIkaDkpKWs+p5mhjOR6nH9lyesrNQqyN9G3deAEE0KbpfPMH/Q4wgLZhS/ygUhZtu8zGETCn2p0GBC5c27D9Xp+z6vo9tKsodQQVZNQcDEZ1bwZ9bHe0peeFXRQtL7zAEwkYSVHE1Xf2GLiI0l/IFpyN6MNfOA5MbwpUAgSneIkoUzdWYnVTPTPVS6nademgwIVVd/vLgdNhogljus6r7eIHGCaa42QZUxaWz7rf/ubXxIMzsYL9TC9As3+iEXipY4Y3maisBGwPAJYQxlQm/Etv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbvABB3kHRvbagdOT3WkZo19M8CZboLskdL0gbXGIxA=;
 b=M5TYibwsoErtTAYCxvDhCNTORaXZLNEs/sSeKu4BWNcO9p4lwR2aTH1PPuwPTHY7kW+5kfxeVpsVAtx+MTOf+qcQX1uZZosv47hXM/7GZAaiOvnUpabXjJgAabBHbaC5iW8+hXLr08OXEHaGwAPawNsfNmm7y6BmE+ZocR85YuFzQGREzLTz+fxKxLTABlvuOC/q3Z4rbHWmxL1Byp5ByfONZehj+W5V4CEWPY5E8KFwoZ0Z8/8augIZkIibE7csndohlz5eZW1SoLTW5wpr5F6FDFqnloOsd9XB2KmtpvnHFoiS7tdjObvvASncfdGURefDcXQ6UC3mEk0erjnkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbvABB3kHRvbagdOT3WkZo19M8CZboLskdL0gbXGIxA=;
 b=OOJccg5n6rDKTMNdaOK7dFzSgV/n7aCppnZRb4iic4q9wjaAv0m1Jb2BfFKUX7HXgfbh5K5xcTpTx/vFlK/xAYysrzzHpkeSIr/32X9jkKGDt9/pCeFUrulk09Zchbe9iy9g7NeaUcAtIIiWyx7oby0upasxq3vVwUgZznUFjlg=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:36:42 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:36:42 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Topic: [PATCH v2 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Index: AQHc3TvY5gIWiyaYbEaI6j5yd7h5Jw==
Date: Wed, 6 May 2026 09:36:42 +0000
Message-ID: <20260506093634.382062-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|DB9PR08MB6425:EE_|AM3PEPF0000A790:EE_|AS8PR08MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 633bb9e9-6fee-4b05-2490-08deab5320b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: Tju2dEIUKMd/yNg/YDDDMmMbCv1xyAJBISgPr8S4y2ONt7iDRNZQQ99KbSH7QDlasraXXcuS2XDlJvUlcr95hffFmOvTFx2Q0uT5IRUdanO3CmqVwjMthHezFzVT24VZWi36czrF4r5TXJhh9M80gumshM65LHPe2Q34ROCWFUWjmltDn5e9jwsvINLlN/5wLoWxZ8s0vUelq7QtdNE1TY1Rm614O13Vgt1hQ9QMFAh2ChTce1cnXHqhfnvl+9GaqQPjZZ1N710ytrJlZXOPbqPQwMmhpMqHYzjFHjQxM1BZ7Gao8gnC0Uygc1Kjq9QbdI2mA1YqX7H8Fb3vYUh+E92A/Nm6U1X1Qwkp68wb+da5DxVN3CSG3mvcgc+b0hgOvMCacTIJ967DbtsMC8LydTm3YFpYfSQ97W+8BFKwn4WImZ8Oz8CgGjr8ZvTeIjdCDrbofc2bTihVywLElbxmKTtvIrwjzpZeaFn7lsLAjuNTcdy4hMuENnhjfPFB+6sMTZr7MGwatK2uat0O7BjrSYZECOezK69akOdvw1/crywk4XFb1uytn+7zsvPMCVRC14sROcZN470KYSLyllBv0jIYYM8OQKeKyw4hO0besvQ2FhrRDwmH02ewIcY0hdKeuR1Fm8thqdqd/K+wwLRP1X8ADphZ1IV5Qlf73tAcBE3eksY9fJKsA8Vol7SRwAQhib3cdFuFlpfodymsK0/1WbgtunxGysaN+ZJcFC/M6RfHBt9dq/YW3H81L91mTNki
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jsDw47byStuMQdu+Xyrf92hrkyBL7Xp+WJbZCS85mGYwSfi3yw3mhvRfv8hwAgFDpqLBQ4zDoP9lrq1veokE2CIyL808spnKeXHLEb6N6k9PmHpwFBC9njPuttuqtlDnswBk6mB55flU3I7WVI8kwMG52AcuQRlFCVhgoQ6zsrU2DfctcJhLwxmGmy3kawO0gmhPxrJkh1wctz21hNGkRnEL+osbUt+Fg7fFPvTnn8K+HyaFTaDaqBmXnyeXWr0AMqUTGC/YGd09UDIMhKAJAgeQ/c6CU7ECZys40YAIvY+kea95rPSOsUJ+08a+bU3fjtTwgyJIxXO1xgRznnApIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: db222edc-29b3-4236-0d3a-08deab52fb29
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|1800799024|376014|36860700016|14060799003|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3/4Z/7Jt3gpskscexrmBQps2w/h9aZQBSqXzwz3OKPpW4UuRdN3NcXNLSFhZ1IZ1IHSbqJ/ex+yoG6rfE9Lmv3jT6rehCQe5OkKKwnhNW67Q53c/bgQDmR0Z9de7N3bLxhKDqAubLkQNhphwcPqVBfnFyiTpMEP5PTmGuDsXHo4eHyQAaQoJFytqsRImxcjpFiRwZhSIyrZBLwgSifO75gagfbg6gExaL5bXVJhXdaxWUpXA1UmFwqpzxUmMtqDLKlJvRVTHoacmm8+ttNehb1wuBOfu6PHmn/Ed/ANrqhAUroZDsEm8mLmu2k1IYa/6oUNY85KWF22XEWJUGTAEnv/FwRDHxz/XNFgXzJ1gC4yqbNIUw5Bwq4FBPbBcF0aJEwn3RKApcfCx/Yf/YQyp/IZLm/OgglBr/BpgHPkHoYu47Bgx7fTve0hXQp63Okhqc21DC6891GsapCiYFn2KTUTn76Mm7/OhFhobHfYkGQwgiNfA2W9SlHh1CGWgGV+l7tGPMsFyEwapF2CI1bpTB/ZNAZ9WJCE4aPFh9hlvYgoVU2kzIH4N6s1VY7pvFe4SFjauuW6WCVDFnPb9I3MbW2gXZ4j/GaDMsC8w0u1009ohLjm3I7zoDgKR3wNKb+TDo2tkRGuLcv2du8IVOGy+ID6MXKqfSrbxQSmHN9UrKwZylW+r8vQFl0NwKUiWWq7GhdDtZhrTxA49hlbuhd6IL/A6RyIeH6C6XyveAwjdFhx/IaakeF2S/4woqXQc7xji
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(36860700016)(14060799003)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I4DQVu6jKq2BruYAgfMrOVgMr1ckiZeabMqKvp7YtGX2GNSThY3niqBnTxrsUFYhLILkFwC70SpHN6JEyGMTUwfzR4Akc7+o0pGG3Dm4i3/mbCfQ6SqS3pqE5cKsexiK55/nUbe1vO8PmAD93Y8fz+0ooGrXmPqnOISDT3Gp4L8ZsGmIefLi9lybU4p097l3ZkgR+hGjXF9fqIarz5d6KFh3cmwZdAL4n1MjvjbFvzxz2+TyCnKD+q4y/Dtqf4PslNS5RTc0ktx6NKNxtW1JwO9XSo6rDQFpwMps4QC5gT5n/bDC44R6owqMpCO2gcLNWFCY4wLxpPyyqe4w8CEpOIgV6yKxCUdYX93o9EJqVM4YzgjEjAWgtCKv4injD36YQvUDISWnt/M0+PeGV/sKPZt9hID5tr3sRj4pv8WXs5t/8gZwSEPzU8i5oH46bEvf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:37:45.1804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633bb9e9-6fee-4b05-2490-08deab5320b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023753_014373_39812EB4 
X-CRM114-Status: UNSURE (   8.99  )
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

LPIs are owned by the LPI domain, but the ITS MSI and IPI domains
currently allocate and free them directly. This exposes the parent's
allocation policy to child domains and requires the children to release
resources that belong to the parent.

Move LPI allocation and teardown into the LPI domain and remove the
exported wrappers that allowed external callers to manage LPIs
directly. Then update the LPI, IPI and ITS MSI domains to use range
allocation and teardown instead of enforcing one-by-one operation.

Thanks,
Sascha

---
Changes since v1:
* Re-wrote commit messages for patches 1 & 2 to be in keeping with the
  expected style.
* Cleaned up loops in patch 2 to use unsigned int and minimise usage
  of `virq + i` (using `virq++` instead). Thanks, Thomas.
* Added Reviewed-by tags.
* Added a Fixes tag to patch 2 as it does fix an existing bug.

v1: https://lore.kernel.org/all/20260430153352.3654325-1-sascha.bischoff@ar=
m.com/

Sascha Bischoff (3):
  irqchip/gic-v5: Move LPI allocation into the LPI domain
  irqchip/gic-v5: Support range allocation for LPIs
  irqchip/gic-v5: Allocate ITS parent LPIs as a range

 drivers/irqchip/irq-gic-v5-its.c   | 34 +++--------
 drivers/irqchip/irq-gic-v5.c       | 98 ++++++++++++++++--------------
 include/linux/irqchip/arm-gic-v5.h |  3 -
 3 files changed, 60 insertions(+), 75 deletions(-)

--=20
2.34.1

