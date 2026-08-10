Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC688C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ3n2CqUVKc1gpkx+bfqZyf3Q3gE5n6voiUP3AsRypg=; b=C6itzCYY+KTqMuOhfSywinITcU
	rtXmZghzW/pCztBDsDJ1inx+vKiXNWx+8ot+2GTVIwC05hL1tz5C/lsfgv1rBOvy5Wv/P04CHnUDa
	ATawcI9xUhpHTQqG54FmF84tdphB4JpCq/UbHbFwWjMuWcu9zHJCR1cRBzAa2ledmIu7IyIw4349E
	F7nZKF5WwgVEKt2lLZJyqmARa67BQUg0miCP2aWs0bgQXKUcLSX9m+Je5+fGoBhry2KdS6Icos1B4
	i8Fg/CaM154UDj0YlcCO8CYzCNpGGzrZ/KHsdqxdkNicUKetp8vJAMwplnI06TaN5oiZ5yVdrEtcW
	GM6aFTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNGQ-0000000BVqx-2eMf;
	Mon, 10 Aug 2026 10:29:50 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNGN-0000000BVqB-2oDz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:29:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sAWsqAZ44gSl99b/sr311Li8ZAXRwZ5FhX8E53mxDAkUdQAoLbCQwboLx4b+8eZN9tnbVf7drqB8afo/eWYcBC+MKpSXpKksv5JW9144IWyEbCSSuW69Y8hjy3Z3LdhiHl3Sl8opoMl/3DN9tDwS3xlrb9/+P/l1uTWNeWugdnmAfPpoi3ioFbxjC0Cm4CZxLus1K0APS/xpOiUBf+77SI3y76ocwRoEtJa3rsvc5sUydi5hfLtlY6OoAmOxOBJ8oWXqOc+BsmoarDixxNA5vkHozqk51DdZInghofYJdVnrej3jgnTyxv23Fo68lybZ6k2s8XVht+DSNQ/mC7l2zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ3n2CqUVKc1gpkx+bfqZyf3Q3gE5n6voiUP3AsRypg=;
 b=PAYnGnYW5SPqnS/bSyZJs5lCHunMddZiib0AI6QaDwRnwoD3Hp40tgt7sKOliEEsQEJRWLBDKowS3AwdnJ+lCQrRMFp60K+jdD7/d47zs6VIXLrnNcHQ5A7Iy29mlIMiummL/YtjSgSJiTejc43Yf+6zum/SNUwn83mPgds5C9l4M8lAdeAT5lW/Ap0xkx+lLbP2Wth+N1j66r+p46DpeUHHQMwV9XYe70qVSi44JPjVsekBY6/1ayjAXlGLbVQOkCmGAt92kKoGe9Xd9kX5dB1Ovz3pQBKhBh1cTArQw1IhrChJYD8OHFHqTRzn/IlIimuT2XgUgpe1DMx4yb203g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ3n2CqUVKc1gpkx+bfqZyf3Q3gE5n6voiUP3AsRypg=;
 b=ColW0jcCHs+On2bIZ9Z72ENzHT+2Q648ZanE35bwuTGdGPGDXPLEgKOOFX62ns5L9MaRlx1buMN03bnpgiW0jjeZwkeEXjB3oC7adKgduY8yrmODIiIQCFcMT/gYCsDiHrCfv/AjgwwiXaOeEcgLWKY4Cd+aydr/jKT8X793H40=
Received: from AM8P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::13)
 by DU0PR08MB7520.eurprd08.prod.outlook.com (2603:10a6:10:314::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 10:29:41 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::76) by AM8P251CA0008.outlook.office365.com
 (2603:10a6:20b:21b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvkaMIfBI+V8lPdrszEoPiV7y9uZI9dHzhdK5sEjCH1hrTPN7btggdg3XfaEi1R2uy9RaKmPajdoKGScMcQTrS/4CuIRzEGYO6X6GI3VeHHNNeIV4fRthIhg2PjFgl+50urFGE0/iPeZB4cFGT4kSjJwKE8ke3Uieno9jyEt/iMcPj49oLlRH7JoUhUNDROgX8O+SLBZPohnrvrlo4vgMKWjmb2XyxlVQsqrOEQ7BkgeXD4mgjv6MrSbOyICwOBbDlo1CAdcM1RuFcmLKE/pLhf1aZ2m5USR7hGnG95ji1B9G6+KomWr6fw90XXgnlnpbOq1ML4DmVk4i2U08xjNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ3n2CqUVKc1gpkx+bfqZyf3Q3gE5n6voiUP3AsRypg=;
 b=Z4Ve9yrQO18X4ttz5oBIommMXqCJ49zQXM1zvltrfp33noy2wZG5ZeRg7sTnaSVOpgkuo6xubL4E1lN++S6wMtNzy323FE3VN2b2BuKHgStP6X2KcZm72HrYmSN9k5F0gPADFIRy7TBnsCz/CW5wLLb9nbEmzOkoR6d8s/KG6lOHG2j4GdMlKbw7bRG0ID/Kv4fBEGvsME+uD4tgJjEGJerv2tD0Bui3LRJugz1f58r+dbiTzNyyOOgKyPOzOjdtbeQHgFhQlsffpIoRKsS7illuWjJG963uNhCe9+MMkhxTQvoEAErMMpTu205ynJucLniAgiVQLmEIxT8UaYS0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ3n2CqUVKc1gpkx+bfqZyf3Q3gE5n6voiUP3AsRypg=;
 b=ColW0jcCHs+On2bIZ9Z72ENzHT+2Q648ZanE35bwuTGdGPGDXPLEgKOOFX62ns5L9MaRlx1buMN03bnpgiW0jjeZwkeEXjB3oC7adKgduY8yrmODIiIQCFcMT/gYCsDiHrCfv/AjgwwiXaOeEcgLWKY4Cd+aydr/jKT8X793H40=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by AM9PR08MB6179.eurprd08.prod.outlook.com (2603:10a6:20b:2da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:29:08 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 10:29:08 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH 4/5] KVM: arm64: vgic: Prevent speculative SPI array underflow
Thread-Topic: [PATCH 4/5] KVM: arm64: vgic: Prevent speculative SPI array
 underflow
Thread-Index: AQHdKLMTYLjzRTtSOEiJmRst+7xRFA==
Date: Mon, 10 Aug 2026 10:29:08 +0000
Message-ID: <20260810102652.758719-5-sascha.bischoff@arm.com>
References: <20260810102652.758719-1-sascha.bischoff@arm.com>
In-Reply-To: <20260810102652.758719-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|AM9PR08MB6179:EE_|AMS0EPF0000019A:EE_|DU0PR08MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2960b2-91e8-40db-b484-08def6ca496c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 1pxgaQZQsstcJVqH8Xx40a/ZFsEjf4O1o+S6OsMcm8LhD/3fLaougnkMMr9gpib7+BEaUoZ/AvytMVJChA4KP82WMq+ekX4ef0tIJZ3v6UnPw0i1q27kN80YNlu7mODPiouKQ2N4XT8EOyIoatk3vnKYUEucXLEf1UV7WPNBgZPH9wRanmW1RNNFOJD9QYAjaYCbZDDVstQ4RKbbzxw+ASbw3BsHwQEY+jJo9ZzlCW3Y6ERNBLVRYBkvCXwO0O62dxfKgMOm5Zb5IAC+WPK5OHMysQ5C8mWws2BdMSSuZE1rPZkNRt80DzaO6MFyXHYifzM1ApkVubzHOFdKA0af+m3haMeKN9W7s0YzFxbqtU9Lu8kWNKbMDz8U6F2HUxxqgihC8SfeZ/3imWKbYWV2J5/ATRhtJywOYpX5/jbV3NOnZeSIsCMTc+meH+m0MWP5iqdMtkj0Pjond/H/MexW8yKgfXDcixPRb1yBjEsFsYFOQKddpvdZIXDbYZwev4ffIwRWhw9ptzd938LtxztIaotlwoeruwFxCXGJM0XJXqxcuAkfVdjwXr9aizks0dIj8Ar1JE1Hubit0v2mOhxSewLvkZejbEg+VDX26HqkB6244Tjf39sqwJiiX/N2mis5wngq9O69J/gmWBtwXvfvlhZFoiVo17pdumEgCubRamk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FpyQSC9sRiA6+0PGrtTR63e9YF1KdyZ1QLbo4ETopsUoKrA1LLbq64X337QnxF3QL01D1B9g9gKt5Xdh0MmEST7GsGxUe2QxmFEAZy/2JkAivjbED520YDpTRpiY4ENE+QUInWjn7AeOVP58WiI4TS3qsjbd9EVJojG9cKO94IEEx4ebWXw6NZHBUgwwELPLGuCMgG7zYJPtWUuCe3ceeX41M0kvuaSQv9ENU0JxABSAQbtPEzdfYgqKdlRqq+aW9vVbw6JZyZDBj+Ms1iJ2Rgc2t9noWU5owWCv61g0bYTPxDeqJGTZn/RErTZ2rIKyyc/MiYE+NHNPKXaTA7/LWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6179
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fdb73eb4-d746-4a86-c993-08def6ca3628
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|14060799003|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 5LR4GVXjWoF9kidIGjGHhP2fFXdnDrZIH5DmHp25MGBnS+UplxLSnRKP6oDbOTheZfijwmzNtZCSxXidq+Gm5P3lXJ1plrY7PXkPzmVzufeXxIVFtxUakqFI6Xb8+Y2OpQ0j4anaYrCi+7ADoSU+D0gjt8ZDLVUE6eYCI+eGkI8BaLwJv17gxzIDqsl6m8NvFCtcOnBIWUgweU6PAuSFZM/95QiTJVMeAcELAo2T2eDAD248XPEuYjBzXrGB/f7KpjVPdgrYnYzaSlhZiBv0F/trmhL1NA8ur3tGEyQxDb3i99Fs86VKYoiT8A5+X2NUI6gInQtZTYXXlI2bNCu5u4pDxP5gCEhbVRhI9GoVNGUmFpLmqVOSUOp6RRjnk4nFbfWJxtVrvMaixghoKJTjsq0HC3pkQJValSCHExEpiYD9lrSiVnRxdosNlBK5LZMCq8SsdTLqcnZnFTgNFIqdbSQbk43TI0lI1w29lfQNk6GE2v3e7DaGCg0DDrJUE4lbRBC/gVP1DupHQt/wAqpjjQWV7H+fpGBXlIUDg/Q8jHStKIND4CFzVUxqUsNzjq9G1Z2e1Wga4SY9tmVNdh8ZkM625EA985P706ce5Akq77n5uBSYoWxp2sYJ/chw49zvpgQTQb/W8CRIT99KYN9luw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XSdTNKymxs46tL8neoiXe1EOJm8vWepWSUh49OZk2kC/SONJTI9qz+kxO8tlIlOoyepAYL1wN7dCiwu44eB/04NO1oSPev+VY3DQp5KMTwxAuDudj4NCnYDEoa6s54cCPTLzjOJ/AUWw9SXvmQ9WgELk5AzL3T7vEsSNIO7I90QYt9I8Cz68+CxK72eJyVXtMpl5DDwP2SbY2xHjrfacx86FXMtLIFRgRS0kRFCBR9Fauk99g2GzbSO9Ci7VqVuNjAsT8eACST4MuSWMhsY44Gd+rEEwJGyCouFPrQNPe/41b/uENR21sW1DeeVcPNjPNWphPzjA8jmrl+LVd46+ANfJmZunef+iPPGUn7u7YFQq87XaULMx2OiC89JMZlvvOC2yHPh6/9DDM4Vzfa8D5pMqfDzQFgG0vUpqUdhRKsn0VzBUJhGwkgtIDNrhxSCJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:29:40.7992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2960b2-91e8-40db-b484-08def6ca496c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_032947_712281_426FB6D2 
X-CRM114-Status: GOOD (  12.44  )
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

For a non-GICv5 VM, SPI interrupt IDs include the private-interrupt
offset, while KVM's SPI array is indexed from zero. The lookup applies
array_index_nospec() to the absolute interrupt ID and subtracts the
private-interrupt offset afterwards.

On a speculative bypass of the range check for an interrupt ID below
the private range, the clamp preserves the small absolute value and
the subtraction underflows to an out-of-bounds SPI array index.

Convert the interrupt ID to a zero-based index into the SPI array
before applying array_index_nospec(). This way, we ensure that we
clamp to a reachable SPI ID, rather than an out-of-range SPI index.

Fixes: 41b87599c743 ("KVM: arm/arm64: vgic: fix possible spectre-v1 in vgic=
_get_irq()")
Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischo=
ff@arm.com?part=3D27
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 74bace10a22ed..352d52bd6315c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -93,8 +93,9 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
 	/* SPIs */
 	if (intid >=3D VGIC_NR_PRIVATE_IRQS &&
 	    intid < (kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)) {
-		intid =3D array_index_nospec(intid, kvm->arch.vgic.nr_spis + VGIC_NR_PRI=
VATE_IRQS);
-		return &kvm->arch.vgic.spis[intid - VGIC_NR_PRIVATE_IRQS];
+		intid -=3D VGIC_NR_PRIVATE_IRQS;
+		intid =3D array_index_nospec(intid, kvm->arch.vgic.nr_spis);
+		return &kvm->arch.vgic.spis[intid];
 	}
=20
 	/* LPIs */
--=20
2.34.1

