Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EAAC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4O6AIteUCAriBordHlXeYzCQisJv+HKoG0OR6tUthTU=; b=KPDMhhqPeRR0PjhPRUG9+793CT
	qjV63KpmdnQpVqjqY0Vyubbyvhg/ywvKeWoKkGlEmTekOtp1toZ4BGVBsIVn9BwJI8YEbc78M9QxS
	cQAJvKfArrRtc/ZxYNw6+TFrg+b208TkWNgzfxsnjcv8ClxSNaj6Y9CYG5cXbxEoOMTCJidtrvqH0
	rWE33F8mo35J79LE+as40LJAahKk5INohh6h4BO8GL/fGKIjpPQ0Craig1FebTrlg64GiAIur/tn7
	w2gORZxcGhVunVVb4Xg0EXh8xARFo8pBpdhp7T28igN8VCjZWhIdu6RKog9CWSPdsXAFQYHG/UCsx
	g+jeHofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoNn-0000000EJXC-0R6V;
	Tue, 11 Aug 2026 15:27:15 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoNj-0000000EJWQ-3B2L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:27:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R6FwpcJDPKBGuY1I+r4xuDqPCjYybWVPoJ3hLrMgFVuodPSOqM7oYccbtAh1k3chekplnO6EeZnLnYZdXD6yFI/13zhAPLczOtsFaPmMFVWLzIvrbvuZguJgzu50xtEhf1VGDDdFa2abMXfWqsZBZOOJM2VFn83kXO+2+pephKT2ZdPyevp8baJAYE9vg5xflNVcuGDXfXc1VTyhQeblw689Trnsz2M9de+IWz+d7LqaZT2ZHSd79LHAJ08yOm1e9konmSBSVueGMSoqqoFfbu0+uLvZKP/hw1imk/ZyJOJHzYlKKeTtPW3saLP3+7X+suSGW0B3TjQU20BiF6hjsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O6AIteUCAriBordHlXeYzCQisJv+HKoG0OR6tUthTU=;
 b=etX8zIDt2FRvkTmbbGK2679OnXnrxWtlw0y4laSCSVTnW7a7zLg5SY8X83DoAsTctccpSYqf0kcAEgC4X+gaA6jWts2BChfdP/avpeDH3kW+fEu6GuKLOgaIsPx95yJKcQZuXTpsUidpFKrfl1acaJMUEZJHGPadjcM8AAbMhgRGDiwNoAK2xmjloVQaWxGw+/G0WSmJn+ulHo3W4tDnHdFGZNqRS+9D8AWv6CooMELT9D7p6Y72NpFyOpZczwSV2jom9VqE70GS7e0bz1z2uRBxUevRpDjqBClbRdqodjV+Rreibh1RvpkgRG/ZqyaqJJKnJ0Em3U2hRj5lIUaymw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O6AIteUCAriBordHlXeYzCQisJv+HKoG0OR6tUthTU=;
 b=goGIuGEkaC43jgvwUaAb3Us0pKE7+roQ3O+JiHbi5tgEE0gJvAtar7w/I0slcNAcrxdEvh69fdKzgANojPRvfmrlx2SNCnT3ticl29pXuc9LRsTDOuczTa8q4wwjWw/BuCpjq++iu6oKda7CcfE4eH/omw0jnRVx8uUo/hhpOBI=
Received: from AS9PR06CA0138.eurprd06.prod.outlook.com (2603:10a6:20b:467::24)
 by PA4PR08MB7644.eurprd08.prod.outlook.com (2603:10a6:102:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:27:03 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:467:cafe::4c) by AS9PR06CA0138.outlook.office365.com
 (2603:10a6:20b:467::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 15:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 15:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFpg12tMy47LicxQN7div8qh9df3iTTQkCOAPfrubQlBwGokaBTRijSr8u1j7pN3P3jaVZEys9QC4Vesa02NYYN16j4I/Qblwb1NEHSNNXlGIHlRlgOYYVMJv+ZshXB6XBWHP5Fd97mkm0bzM3tIexZSjBCBHpJXPRn+27DfKDFZgO9HQ0GrgFa1JQDQUhVyvYcStbf6blz+qsIcHY8mkbI6hlWLeoAzICrDMUUtQgx/2xKDgQ9W0cLyOcHYdHfpF+O7YoSOipUzYE4aEGuWliOzMDVO22X3R2P7LieLtMcewwK+cDQelee8O/F4AJQRMJdOPP/o/EKmGdApEMcOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O6AIteUCAriBordHlXeYzCQisJv+HKoG0OR6tUthTU=;
 b=mnUV6w6lc/yejEzbMJ7X5HUEfk+wPvP1JcwW5u87TvK5FQssKVgAYXXWA++6XZwpk5KkTkjjXOl9F4ZAJnF+VnqX79q4Yq6xwzl/eBP/pExV6aJicKxOWE1Cx5+sBgbMkCszUPUvh4ZJFjoo+g3wKVFcDLX+dZzCNZEGaaaoy0plAlEEw4vrcBssKWSKDu53DO13Sr0j2fiZ8gwCqkLGaskJSwhsi0wI/2g1FF3hlUD0ka7Oi/s/kz8PY5opOwHvw+YQRBfuKtu+OeVEBCM/loiTwjxdgUDkUmhPePh0PNVFgWOBD7QR7iNXvPMlECmAj1M/YiKtmSpZ/2LHbgstew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O6AIteUCAriBordHlXeYzCQisJv+HKoG0OR6tUthTU=;
 b=goGIuGEkaC43jgvwUaAb3Us0pKE7+roQ3O+JiHbi5tgEE0gJvAtar7w/I0slcNAcrxdEvh69fdKzgANojPRvfmrlx2SNCnT3ticl29pXuc9LRsTDOuczTa8q4wwjWw/BuCpjq++iu6oKda7CcfE4eH/omw0jnRVx8uUo/hhpOBI=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 15:26:30 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 15:26:30 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH v2 0/2] irqchip/gic-v5: GICv5 KVM IRS review fixes
Thread-Topic: [PATCH v2 0/2] irqchip/gic-v5: GICv5 KVM IRS review fixes
Thread-Index: AQHdKaXIuMgRheEJfkis/wNgQADMjA==
Date: Tue, 11 Aug 2026 15:26:30 +0000
Message-ID: <20260811152630.942023-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|PR3PR08MB5577:EE_|AMS0EPF000001AC:EE_|PA4PR08MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 41db0c1e-f7ce-4e91-1835-08def7bcfea9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: hUTydpCFJttIn5iaG9C/WSc1lkqsBfMQe1/SP2JrH2hxCfvjt1BLZHrhdQNDNS5y2Fay5fmsaIVSB/oBDdMA0H2Kd6MBoTcGqdJL+IL5DjwdnSmxLT4Oy6GRc5ThA/J0TS6kGj04oxyxni/47cjGobrKXozovqMv64nWf8N5a0UKDTMcgNdXYLpEveECLIN8MHo0ivc+lcFBHxAMcRLKKMBx9+UCJZD5v1aLLujN0Xyly5izLWH/npbpZ6GGCpde1k03/yccOSbpCyyWYg/RQdzFsvu8QhaWIuoa3K0CeXw2XTH/LmpE3XuB05WMWrLBQUWeVhYURXJ/5nfeiJQrJ6tFo3QpNRaeATMjHfzF7BQAtrmK1NrV3Whg6b33o/+JUbd7DGjrXF+U9OJiy+VD/X7Edt7qew6TvPAA/QQcRrFQJESqennKLAtH7ZrUrqa1IhW6iZJBiZXiYre6xtnGf+onVOGGTtJ/qXg2G5j+XCsXI1bAdVkKZARKGIGJcq5B1lI/f8Lpxc6IPZtSxTMTRMAyXcW9kSWb4jXreqKfYJtB3WAfE57N4J+KeC+8npZk1ZnrZoGkKYrzbQTDOj5n3GWgxY+nYjeBHSNtqbmXHKY9ki0QmNzI/vj3cmfFyWB4bknQXvexrfMERVxaja7kiDwWxn4XoHqCp/N3jqMVvHQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MbB5FlteAZQUzCDJgoZSr8NHkM+wshzHbKuI2Duil29Oh1wze+PR5xx57/OIzmaCgZ7Vln/p+npykIKh4UXq45xz5bwT2naSuPGPKQee23ssZQDIVP92dCLa9amk5U3KHMYs6bcLE+Z1J5BJXF8JkaFBCUQyHJh+FRxgxM3LiebI7Atqkt2yWiU6kw81LKLCHu7aC+hDRwg2Wv65/GZPpRgUGVpFhIZJYUpWC60FwqFon8CEtJlY/qv2fIl2w9BubCtSfw0uVOsZmsMHMiiSeUY5zbwqRhpnqAQz9GerNlBCJNLVqr73djPJMcX/5GkqRdDIeNIoUGL85NMYzLZM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 82f29deb-521f-4cb4-801d-08def7bceb35
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|14060799003|35042699022|36860700016|82310400026|376014|1800799024|13003099007|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: wx6adEgpwMvnc7ObnWxtDmBjIJo0hILO/sONT8XP+80zkBiEwyo8FKMIcDOHVS1DovGtaFE9hf2zNX6tJ2s4kAV0EDohC8QgzshCFWuDIvLiOvqmvzXegYbWlcpSLqAlDlX0PSbYXdHVn2CLNPEbPhRR3shRx7fU+dQh+OD3CzxE06QI5JOs8S2q0XEHzuPRrct5mrS4R6RpK8zV3+S70uampmV/5hJHHKpIvVupWu9gbJevlK7W46V5U5zeauacE3vXD7A3gZq2WHV5v0n180B6KaHR1IA7c0fDSCWYPDJhBnC9XmPMO5g+5+GppecbKbHQd4QwePv8KhRf/10Ux5QIo/XBVm8SHDi+SyrCY4nO2jjmA2Ocx2LQE9ZfvhFWBJq8/MYGcuHfc4oba/NglSAYH/9Irb/NLe/D3N0k0xe8DQKVff5t2d+EQjdE390q23MkAFAzFwqUt+hwUtq4RD+mbhHZcFYNfyFlLKFH9V7iUvqtkHiVKhpGsMRxHJtEIPbH1rGgs54j6ReFQnXXg+4YQ/K0DURzHoPcp6aeGqPxHpSO4bzjjSjOas8FGEyTnOL4m5Hg0ZenVqtgQbaTYlVPZynPzHh9mxGLBQlqKO5uf7DkdNSvWPLsg+lLu0iHleQGygEqxgZhWBhzfMHk+g==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(35042699022)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Baes+Y2vM7Ktr8PC9Hath61bJl7PmqhQcrL6UDiZi8Ha2mm7mRwnC2A2SaecwCy2xJVz2N6XVXlfjtpu2dICftvDiQc3BPkC4KSlLQJOvVv86BPXNvNJMrGeebqapNwZnNXjN4sJket8lMpEHq4ULpJ6dxUw/GV2fGWBE5fcaz5Ngb0MbkbQFkCE7vcfQCUeMGM/L8zgTXiZkUx6+sEU9bqXhWrKvA0wmHCEgcN3E7lFWPrHOI85vQupUABnxQ/z2EXoo6jINSPVEXMukNOdc05EPWADQ8h/45s3QB+FBu2nCRxoZ2boHb58wfSNaoJPSRNbivdEsJo0Uz4opz2Fcw6peLpH0NkIgp7xQB/JMZsPbRXDMh0CozeB/OfotzcBs/rvZkc0VlOtQaosTtF6mA6JEGgGtJejZKxGV/XKk0DQMR7rP4Q+H/pUJPjLvmxa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:27:03.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41db0c1e-f7ce-4e91-1835-08def7bcfea9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_082711_797826_C755CF6C 
X-CRM114-Status: UNSURE (   9.13  )
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

SGkgYWxsLA0KDQp2MSBbMV0gY29tYmluZWQgaXJxY2hpcCBhbmQgS1ZNIGZpeGVzIGlkZW50aWZp
ZWQgYnkgU2FzaGlrbyBbMl0gd2hpbGUNCnJldmlld2luZyB0aGUgR0lDdjUgS1ZNIElSUyBzZXJp
ZXMgWzNdLiBGb2xsb3dpbmcgZmVlZGJhY2ssIHYyIHNwbGl0cw0KdGhlIGZpeGVzIGludG8gc2Vw
YXJhdGUgaXJxY2hpcCBhbmQgS1ZNIHBvc3RpbmdzLiBUaGlzIHBvc3RpbmcNCmNvbnRhaW5zIHRo
ZSBpcnFjaGlwIGZpeGVzOyB0aGUgS1ZNIGZpeGVzIGFyZSBwb3N0ZWQgc2VwYXJhdGVseS4NCg0K
Q2hhbmdlcyBzaW5jZSB2MToNCg0KKiBTcGxpdCB0aGUgY29tYmluZWQgc2VyaWVzIGludG8gaXJx
Y2hpcCBhbmQgS1ZNIHBvc3RpbmdzLg0KDQoqIERyb3BwZWQgdGhlIHNldHRpbmcgb2YgYSBDUFUn
cyBJQUZGSUQgdG8gMCBvbiBjbGVhciBhcyB0aGlzIG1pZ2h0IGJlIGEgdmFsaWQNCiAgSUFGRklE
Lg0KDQoqIEFkZGVkIGEgcmV2aWV3ZWQgYnkgdGFnIHRvICJpcnFjaGlwL2dpYy12NTogQ2xlYXIg
cGVyLUNQVSBJUlMgZGF0YQ0KICBvbiB0ZWFyZG93biIuDQoNClRoZSBmaXhlcyBhcmU6DQoNCiog
Q2xlYXIgdGhlIHBlci1DUFUgSVJTIHBvaW50ZXIgYW5kIElBRkZJRCBzdGF0ZSB3aGVuIGhvc3Qg
SVJTDQogIGluaXRpYWxpc2F0aW9uIGZhaWxzIG9yIGFuIElSUyBpcyByZW1vdmVkLiBUaGlzIHBy
ZXZlbnRzIHRoZSBwZXItQ1BVDQogIHN0YXRlIGZyb20gcmV0YWluaW5nIGEgcG9pbnRlciB0byBm
cmVlZCBJUlMgZGF0YS4NCg0KKiBBZGQgYW4gaXNiKCkgYWZ0ZXIgZGlzYWJsaW5nIHRoZSBHSUN2
NSBDUFUgaW50ZXJmYWNlLiBUaGlzIGVuc3VyZXMNCiAgdGhhdCBpbnRlcnJ1cHRzIGFyZSBkaXNh
YmxlZCBiZWZvcmUgdGhlIGhlbHBlciByZXR1cm5zLg0KDQpUaGVzZSBjaGFuZ2VzIGFyZSBiYXNl
ZCBvbiB2Ny4yLXJjNy4NCg0KVGhhbmtzLA0KU2FzY2hhDQoNClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjA4MTAxMDI2NTIuNzU4NzE5LTEtc2FzY2hhLmJpc2Nob2ZmQGFybS5j
b20vDQpbMl0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI0MTA0ODE5LjEy
OTY4MDMtMS1zYXNjaGEuYmlzY2hvZmYlNDBhcm0uY29tDQpbM10gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYwNzI0MTA0ODE5LjEyOTY4MDMtMS1zYXNjaGEuYmlzY2hvZmZAYXJtLmNv
bS8NCg0KU2FzY2hhIEJpc2Nob2ZmICgyKToNCiAgaXJxY2hpcC9naWMtdjU6IENsZWFyIHBlci1D
UFUgSVJTIGRhdGEgb24gdGVhcmRvd24NCiAgaXJxY2hpcC9naWMtdjU6IFN5bmNocm9uaXplIENQ
VSBpbnRlcmZhY2UgZGlzYWJsZQ0KDQogZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUtaXJzLmMg
fCAxNSArKysrKysrKysrKysrKysNCiBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jICAgICB8
ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCg0KLS0gDQoyLjM0LjE=

