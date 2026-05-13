Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF18ACD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FR1ynSWLf/a3DjFevCCFAVASGYEm+gIIG8K5PH2dTM=; b=CQHAbBzqIiT2Za0x/PljtVQL6S
	JAyVSBDpgJqIN+FoVbn0Cv+ieU3Jy7MKaJZaQhVCZdVo6IfGa1LjynKZQ1mVFeRgrpa7K0w2y00pi
	HgSKrgTDMjFk8w8HWJJPSzuq2OLAz17gfBJ51JLR/7drL4OJvt4DBdYOQrmJUQyyyOpdcQis44JdD
	bD2fBVaTUIind1JGHyJ8k/qSRbvrsnlKUC0mMiOcA0IgzL7s4OLud34s9rE40Wew0bb2oVcuh8BPl
	0hsII141R8kJvAre/oiTg0skpOqrJm20S3Zt5p9Mjg+GiN0YIJjtly0swoRB6LBQlej3r0QZu/ykC
	WXhHE9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6g9-000000028uW-47VB;
	Wed, 13 May 2026 10:19:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6g5-000000028sn-3dPk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:19:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YjqjrOC8/Uf8ULTo5eIg+0vhb9d+VT4jcd3SSMMLN3jtKtLJF/s7fnbVfEucFz+KotrvI6rG/roJ3wu9ZnfSs89Z5kVaROT71YZcCAnbZy7I8U5XBp7yUwKEqfU/GmnTcXAR7dUKwgg9261Z6Wu6BMoJsHCjT6AJWLbdPw/eJpJ/B/EEfMF+rbWNyWK/Cl2leCMTIOrXAZRTQkVndIWzgbKnmSvONtl3zUtG1Sy/+Wo9n61wwZcWhT6xVvplUMQd7w1SlwYwqWOTRt/tyIGVc+f8DcZ/jQO33PUnH5nO8buGLDzf/U12TEgZKuhX+yCcz9+Ist03XVubdJzzltS04Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FR1ynSWLf/a3DjFevCCFAVASGYEm+gIIG8K5PH2dTM=;
 b=xMIg6Io1vz+L+nORLQlxa8j6C8gRZ+yf0KbzMKpmDpwSfDUVMEbkrHdTc6UI/Lnvt0mldQdr6B6ApHrJ8/6nzO8KQfkFP4rhHJPJgYVgub+ocbW75PaypcjDDgZ/RvRarm73E1LkOgbcWlQNrmc6u3HvYpuWMK048NbPzOXx3hQTGCto5cbNKpIsGs87UTvqZCN8uCO6+2Q3O+TJL+ceEscUCzfDoOL9/2t1576SUTjz+19v73hPtPjvIsDq5gOliCAXjATxlJn5NPtmLll/jH+I5k/nP4zAmErJmcdJuOHRjl1wQifN1RrsC04NzUAHbKS17+Sx7SEd/xO6eoSGEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FR1ynSWLf/a3DjFevCCFAVASGYEm+gIIG8K5PH2dTM=;
 b=BtbVzEXXyhY3OJBdRN63EmxeyNgHbN7ehVj6lUPwzcz/jmqns7ii8lQxugxGs49bP6+vFgJjIzejQZ3FOzX7AoL/pNSHq5y/QZOtX6+RYcEVeDCpO+Uf+GklQp6tPCMHLN5jsIL6I2mMRyx9S4iS+9epvfBzFRHEGxyrSPjjLIg=
Received: from AS9PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:50e::16)
 by PAWPR08MB11204.eurprd08.prod.outlook.com (2603:10a6:102:469::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:18:45 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:50e:cafe::4f) by AS9PR04CA0100.outlook.office365.com
 (2603:10a6:20b:50e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 10:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 10:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKQLVAvNd49RZr+cIPM+0Sr95TfTmNSdg9uL0tIn18MBhWbWj+in/VFqZuX6agu18HScFrweeAgHMwDiAVVptg4lsA+XP0jIRftr9eVla8PWJNj5sIKFgi6VE5wPGY5BntJAdyqDxWsdjBW3oApBvP8JdE96UDkN3Di7o2tboEB+Zil9sjtEXCjTU76RT9Xxs7vnwFmY4E5xyzEgRUrm67Rg7SczzCOFH1uDxSrtnL6CXhPgm9HlfFqzUsKtFNEUgDtqVBy4ok6mYlDhD9VmFHoHxNLw/aB1akUgpkdai+55TndtBqTLDHG48CP6Y4sOQpRNKcvvOjAlQoUGu6o/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FR1ynSWLf/a3DjFevCCFAVASGYEm+gIIG8K5PH2dTM=;
 b=n92q2G5KgQ3/FZYLxz+1pFc4QCtCcOQsBG2JWDUX/0dhHQW9nEbmbITptH6s4M6uk5uGplrPmDaMF9BBCTJfksuh4MBAob1ofB0ToUIK4oHmaCpoCQCh8qMfAmPmuqQ4QIbV4YQDSeYCkExZcWpDUiuifDblLhiZa07dvjVkmCvfiPrUe4oXGXpRiFKwE8/OKF0QT/4QqyLvFgqeXVhsVE4/hGnqwl9I5fvv+btkf+HIgC/6HI8x9qUcWqfhAMF7vipC90CXDEaQF8bqqwfwhp3cVq1X+XAaBaFk1kFPjXlubBb76hjovzp94iKIzw2S7idj7FITk9I5wx9lRdESmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FR1ynSWLf/a3DjFevCCFAVASGYEm+gIIG8K5PH2dTM=;
 b=BtbVzEXXyhY3OJBdRN63EmxeyNgHbN7ehVj6lUPwzcz/jmqns7ii8lQxugxGs49bP6+vFgJjIzejQZ3FOzX7AoL/pNSHq5y/QZOtX6+RYcEVeDCpO+Uf+GklQp6tPCMHLN5jsIL6I2mMRyx9S4iS+9epvfBzFRHEGxyrSPjjLIg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20)
 by GV1PR08MB8177.eurprd08.prod.outlook.com (2603:10a6:150:93::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:17:40 +0000
Received: from DU0PR08MB7616.eurprd08.prod.outlook.com
 ([fe80::ec0b:cee1:2dd7:8b3f]) by DU0PR08MB7616.eurprd08.prod.outlook.com
 ([fe80::ec0b:cee1:2dd7:8b3f%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:17:40 +0000
Message-ID: <6f1a64ba-4ba3-4ca3-b894-f5b3587f4208@arm.com>
Date: Wed, 13 May 2026 11:17:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] arm64: realm: Support for probing RSI earlier
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 mark.rutland@arm.com, steven.price@arm.com, aneesh.kumar@kernel.org,
 sudeep.holla@arm.com, robh@kernel.org, maz@kernel.org
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
 <af2aJKSbWIONhrMK@lpieralisi> <ea10bfcd-0890-4dab-836b-ff3bda946a39@arm.com>
 <af3DiIibnKvu+Tpt@lpieralisi>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <af3DiIibnKvu+Tpt@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0385.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::12) To DU0PR08MB7616.eurprd08.prod.outlook.com
 (2603:10a6:10:320::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB7616:EE_|GV1PR08MB8177:EE_|AMS0EPF00000197:EE_|PAWPR08MB11204:EE_
X-MS-Office365-Filtering-Correlation-Id: e88d55dd-fbaf-4ac7-825e-08deb0d903f2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info-Original: Rakrxf6sHjOQazW/Z06qv5Z+xrDrwPJZBAHtdeh0ZgFL2pz0YeSPAjTGhwyZFhUl8GD9GuwMJ4R89+ULREJ2zKx3+XTG3dTbs34rVekzg6y/d95cSfpQVtShK+SSCNGMqQg0VFvzq+S2a8xYjQR/++7b4CKZ1/U+LiEdvKFtpAopRpL4Ev7pjEaaVvRq1rbp45rw9zS1BuQHKnM6h46Xw7u4FlYItpO5SkYpNo4F9uVuK9IZ0jKk8yGbLrszPkm4/PIs/n/yvyzZQrhsQTSOLrjfyhvZQBuV8F4utss2qHSV0I88l41A+z840b3OdBgKTNp4t5L6X9B2cENrRUhDXfuUTROpBD9/weuvZA1ps9q9GhMQvY2Hlw6PtX1qZ3qnnMKGu4EFLlpUR8uxcV8wgNr9m7XtRhgL7l9fUYvcXpdidU71nojHWjDV65Nq9+c+SgXO7mG43fNei5nmuBrJ2L6MwG49ooNC+7/3oyhVtQWEaowC5/BacM2ShrCvUZ99B0lHw1w8SVo4/JEgXD9L6+6TVVPXm9dPV/HDYVlBT7C45FBUT6Dav4QAG+nu77+Ubm1dMkBxRIWmM4Ol6j4ZyPmyo01o9btfmE0AHtgAWb7TLPaNu9ARV0l4JIjY/UeiK0yE0LlSm8BIQajhK/H35cLUgDK8LmTPIr2tvf90WFxgjqvjb3CtfypzS624MgR1
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB7616.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: QgdY+sTZdaV4SMl6YraYVVYm5+jZq9+6rNq9gq9o2UOK+ZMIBbiUQ4kbSQ28UCg2YSxmge7xS6tY6pKizX3JSRTfxEEwvqgsTSM1tYX8b9HAlI0jxfJ+s4VXGRdv/6y76GJw2YqfIOtAmqcbUGjNty8aipLpJKAY3+OgSjIymhT6ofRYGU7WzJXQ0lg+l8+y4PmwU36poXjpvHHBHUVfv9XYHvFGFr1e2eOR2HrOVfagIWx4pWcxf6J5MIauxcr8GcpmsCXbHFEG+qxyJ7Cmcz3TtN5yb0HdoOZJneGjFcflQZG7aXYsXc1cmkf1dB55IIzC4VA9lNeaafF7F58BrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8177
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 672ba449-8739-449c-c07d-08deb0d8dcf9
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|36860700016|14060799003|13003099007|18002099003|22082099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: FtU6R3opW8Ew2XFOnC1i3LxguWSRjV4HXouNRUhMOhReqQUeucf23Kvu0NhcSUi0Oqrrgg4bpniEtpsfsuYJuJU5KzrjW7y4dc5RJxYFSff2Qz1f1o+ogwdStkcgWb6NMrRteKUCCEh5JCnjn6qavVUMcBTVVx3KYCHOqVZk7BYDYbE6MYVY3LSPB1AuiI3tn3Pu01rReYFrjGOcqa07lZjyWQ23QNTmj1MxZ3+kRhO5zpA/bGOD5PN16nRflSc3fyYH+pBZ5ChyXXkrhnoS9tromGIXqk1obkZdO9sBitV5NSMWC3ztBXnGGwX1zc82rIeMcQpoilCxT4JPdtO+yzZewuSwaHGdjsx8F3e09fWKz6fbLLt8c7JhfMIMjm+mlYkB56ytu6+k4mN/OxPUa8GcZcqq8k4oSGCcBdYGkZX9iJkilQqaD0lIbZKDuhF2qPcQwLdkp3n505QShae49wAjDbq3/YogXxM4rP3rBwRT+tGpN0d6s0BKKTL+OVYDl6Hc6wCUt3N/5LqvI6LiztyjMTnBpGl5zTZl1Ie8DbtoXDY4ZBzye/erMQ6eOzj9y6fJ3TtQYoGTiUMb5aeY2gRwJfr5zUTOVRI3DML4m9mBQX/y+rouImtTvbh5xZNcB5uwXwiTF5pyVy1KFQQp9UVs1+kkY/ZnzZopQ31J/dtKamHFRYWhsItSnTkylKIJ2tYu4JK7HiWI6OCaBi+Xq2qwXZ9zbZC5nwm2Y1CgOz0=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700016)(14060799003)(13003099007)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hv3Uh3OuRwbrCOfmqTDwsF4KVR0K7ZaYOb1sdh/RIeLHzBqyw+6ALs2PDjBbQI4MW2Y0YGE9dwBfQ0oK4YuJA4boo9+UmRnTqDO3bQ5DmAcPHaSideMj/NaA/60x5eFd+45cdjZt19HhDc7hNsy+9oCCVOVNH1ufoPd8388liE98CgGoUPKcfPtP0/ozx0GO8wxzU4JgUUbu2QdHCc8MxKgDAklTF9BE8ezaPn/34E3lkza6rlpwP37riqkydAifxO5KKVby+wV54jHUfR/HNpYrHZlJO/OVtWqmWe1rneLC5YnNysC1sk2nEuaKJBjDJjQbgtrutfbHwt2GX90BUGDMPndrpuzWmcitS0CUo+hjMLqo72xf0mItvfawoJyLRozYjzBkDJ+UgQuTUhKEoUwCKge2Kj9o2iCiyRno16uuSJ8Z5u4BqhdMs+hgvNdt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:18:45.2831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88d55dd-fbaf-4ac7-825e-08deb0d903f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_031858_116079_B387CC25 
X-CRM114-Status: GOOD (  28.16  )
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

On 08/05/2026 12:05, Lorenzo Pieralisi wrote:
> On Fri, May 08, 2026 at 09:28:32AM +0100, Suzuki K Poulose wrote:
>> Hi Lorenzo,
>>
>>
>> On 08/05/2026 09:09, Lorenzo Pieralisi wrote:
>>> On Wed, Apr 29, 2026 at 11:35:31AM +0100, Suzuki K Poulose wrote:
>>>> The Realm Guest linux support is broken without rodata=full (fortunately default
>>>> for arm64), as we detect the RSI support after we have created the Linear map
>>>> with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
>>>> (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
>>>> we are then not able to split the page tables down to PTE level if the system
>>>> as such doesn't support BBML2.
>>>>
>>>> See the following link for the discussion.
>>>>
>>>> https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
>>>>
>>>> The available options are :
>>>>    1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
>>>>       to Block/Cont mappings after we have the full picture available. Looking at the
>>>>       future (with BBML3), this might mean "additional work" for most of the systems
>>>>       at boot. But not bad as splitting them ?
>>>>    2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
>>>>       by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
>>>>       with the page allocations required to add the page-tables.
>>>>    3. Move the detection of Realm support earlier to make a better decision for
>>>>       paging_init(), with an added bonus of earlycon support for Realms without
>>>>       the user having to work out the "top bit" for the Realm.
>>>>
>>>> This series is an attempt to implement (3) (without the earlycon support). We try
>>>> to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.
>>>
>>> Nit: you mean unflattened here.
>>
>> Yep, thats right.
>>
>>>
>>>> ACPI table is not mapped in full, so we have to map one table at a time and walk
>>>> from the Root of the table (RSDP) through to XSDT and find the FADT table from
>>>> the array of table pointers there. Minimal verification is performed on the
>>>> tables (e.g., revision checks, standard FADT sanity checks). Checksum is not
>>>> verified, but should be possible to do for the parts we consume.
>>>
>>> I went back to tracing acpi_boot_table_init() (joy :)) and it does what you
>>
>> Welcome back ;-)
>>
>>> describe here above (it has been a while since I touched that code) relying on
>>> early_memremap() mappings (as you re-do in this series) before acpi_permanent_mmap
>>> is set in acpi_early_init() (that happens later in the boot process).
>>>
>>> I am sure there are caveats in moving acpi_boot_table_init() before
>>> paging_init() but I thought I'd mention it in case (3) is what we are
>>> pursuing (I am most definitely in favour of alternatives if there are
>>> any).
>>
>> I believe we might have issues with acpi_table_upgrade(), which would
>> need access to initramfs for any tables. We may not have the initramfs
>> mapped by then ? Anyways, FADT cannot be upgraded from the initramfs,
> 
> I think it can:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/tables.c?h=v7.1-rc2#n407

Oh! I misread the FACS as FADT :facepalm:

Thank you for correcting me.

> 
> Obviously this is a debugging/bootstrapping tool but hey, here we go.
> 
>> so if we can work out a way to do the necessary may be something
>> worth checking.
> 
> I don't think we can init the tables before enabling the upgrade (which
> requires reading from initrd).
> 
> I will try to think a bit more to see whether we can reuse some code
> (again - if that's what we eventually want to do).

I will continue to explore this too.

Much appreciated

Cheers
Suzuki


> 
> Lorenzo
> 
>>>
>>>> With arm64, during the normal boot, we could fallback to using DT if the ACPI
>>>> tables are not useable. So, during the early probe, we try to follow the similar
>>>> logic and probe the conduit from both DT and ACPI where available. If both of
>>>> them contain a conduit, we only proceed if they match. Otherwise, we skip the
>>>> early probe and do things the normal way. (Any sane system shouldn't have such
>>>> a mismatch, but..)
>>>>
>>>> Once we probe the PSCI conduit, PSCI is probed, along with the presence of SMCCC.
>>>> With that in place, we try to probe the RSI support after the early probe and
>>>> advertise the Realm World. If the early probe wasn't successful, we fall back
>>>> to the late mode, where we could end up with (on a possibly rare broken firmware).
>>>>
>>>> NOTE: This is an early RFC attempt to moving the PSCI detection earlier. The other
>>>> option(s) that may be worth exploring are:
>>>>
>>>> 1. On systems with EFI, parse this from EFI Stub and pass the data back in the
>>>>      DT Stub, under chosen node. e.g., "linux,uefi-arm-psci-conduit".
>>>>      Challenge: EFI stub doesn't seem to be ACPI aware. We could make that change,
>>>>      we only need a few table walks.
>>>
>>> What would we gain compared to (3) above ?
>>
>> EFI stub has 1x1 map for the areas and we don't have to do the map/unmap
>> dancein the kernel and potentially end up crashing ourselves.
>>
>> Suzuki
>>
>>>
>>> Thanks,
>>> Lorenzo
>>>
>>>> 2. Have EFI firmware provide this information (with my limited knowledge on the
>>>>      area, this looks like too much work, and bending the standards)
>>>> 3. Append arm64 boot protocol to have this information passed to the kernel.
>>>>      (Firmware provided) - (Steven's idea)
>>>> 4. Any other options ?
>>>>
>>>>
>>>> This series is also available here :
>>>>
>>>> git@git.gitlab.arm.com:linux-arm/linux-cca.git	cca-guest/early-rsi-detection/rfc-v1
>>>>
>>>> Thoughts ?
>>>>
>>>> Suzuki
>>>>
>>>>
>>>> Suzuki K Poulose (4):
>>>>     arm64: acpi: Refactor FADT table verification
>>>>     psci: Add support for Early detection and init
>>>>     arm64: psci: Move detection and SMCCC probe earlier
>>>>     arm64: realm: Move RSI detection earlier
>>>>
>>>>    arch/arm64/include/asm/acpi.h |   1 +
>>>>    arch/arm64/include/asm/rsi.h  |   1 +
>>>>    arch/arm64/kernel/acpi.c      | 136 +++++++++++++++++++++++++++-------
>>>>    arch/arm64/kernel/rsi.c       |  23 +++++-
>>>>    arch/arm64/kernel/setup.c     |  69 +++++++++++++++++
>>>>    drivers/firmware/psci/psci.c  |  49 +++++++++++-
>>>>    include/linux/psci.h          |   2 +
>>>>    7 files changed, 252 insertions(+), 29 deletions(-)
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>


