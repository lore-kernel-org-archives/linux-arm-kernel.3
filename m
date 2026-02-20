Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2106FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+wuZD7fnoMz1vMv9I6+6XrDXEIS1f7V/dm1LAv54IA=; b=46hHR+DuQCYB5MUdcw2nngKkTB
	CUG9RPsVh8W6TDE2ZepLd1xaU36rqdD1ow7Iq1tDukzZlLXotzhvwe8zrdrAoyPpLrbaMHYtlUiSE
	ogI4JfGrHIzUCzDzc5+gXek3ZwMfaVnJ6SYivMZH+QVJP8s5zwA/ckv+wIgCOMTSIqcn3tVoAx9tU
	AIH8ZsWunQEvYyhylVaeFXvua8+oOGAQsbwH6tfEV0MnO/CB6tc4vctbPA8aOWj3nqLRYh99RA7H4
	LOadnY0lJ/cB7wXFCsBgdlE9l4vIXa4jDHI4MtEVFSAtayHUyQgD6acUPKCuJcUqHxIZbdgoe6sSA
	lRtkQohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLhr-0000000DP50-2FUl;
	Fri, 20 Feb 2026 08:17:47 +0000
Received: from mail-westeuropeazon11010053.outbound.protection.outlook.com ([52.101.69.53] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLhp-0000000DP2E-2d5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:17:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K8N0uARsWNpSTCK0SDupdlA/BCe5ztXH2gKRs/1LZ1CXzc/2SFjvLZmcE88K7kS4qasGBJRD604vwFmpClrS8cUDwOGg1RMZZ34yeBl9iKjBhq2h2tKUI+xR4zvfSyybL34S76AtBdYmm7oe+wJrcCVYKgRXv1KVtBIW80Ak4U6znoBsDUllMa2ahhyUo1Pp/QW9CyUU910N9geZU6Jg5gL3geV6vQ2PEjhtMXu59FJxZb+GkoTCL5DlaeJZnn7+6R5IxAcQPLDxhEwffgk6NtaR5D9+SD4NUAAzIJM/QcXMVBVyo6rvguAk0z0T2m2DZBqmaIRHB/gjxm/KaZ+NgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+wuZD7fnoMz1vMv9I6+6XrDXEIS1f7V/dm1LAv54IA=;
 b=H9Yiw8rOFV3qcFELSU1qr+JJoeIUIeMKbagrcYl4xMX/Em+SDjWI7bgDTjG7Kl5RfAJh+09d+8BROc0Bq0iJJ3/HHka4TtWbMe86OwGPNV7Vyf3k1KS4lIFB/mrxifTTHa9IX3Dy0hd0CWtjrF6+D/WYHaBBFUw5NRt8hboKi81mBq79qjL9bIDjA9R7VTCLSfri6JoRatTc64wt9QwaHc+RnHKe2WHa3G1r2V5X5H6769lBhpKNy4THbQQNvo6MqyVGAVPTXJzDNcVfn37+AcYtZUAS1i0KAHrJoMGa0RRjoT+jH7B5Eh16bs9AYZRXvk4H4ztQpmWr86Qg2R9cMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+wuZD7fnoMz1vMv9I6+6XrDXEIS1f7V/dm1LAv54IA=;
 b=eOsuLnpCUCbWzicUqfXKbOjsE9RoSY0eFKAFYpv44GQO9uwDyqmWNtQUYwNak827QEHi9mv8x/KVRMZyI8gp9rhWlwsr6eckOirH3LdbT/HRdydYvi6f5BKS5IdCobD6JaEktz4JnCaUiyJYPWY9b/54CgJBDyN9kDMChuBiKls=
Received: from AM0PR02CA0159.eurprd02.prod.outlook.com (2603:10a6:20b:28d::26)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:17:36 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::a1) by AM0PR02CA0159.outlook.office365.com
 (2603:10a6:20b:28d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 08:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQXi2zlSZ0fxtEDLLOfB033t3hAEyn3g5MVrx2LBDYwwhLsqnidJfVY+hjRqzWL6En+Nxw8SQ9jrM0vtq7wzLU8MqxZHjCc2Ja9GrT38h3s5gv+MlitBWFRqsk702zKXZbj6gZ3zAsFJEmsTbPxNF+2YdD3M4ztVPUrQuDQZ0JqL0NYXqSCEt+AxEjrh7vRgrXgaCS0Ki6XjfMl97JjPz0+zGeBDcuuJf2I2R8eQiQQv8lZsKSilvxmwKUqMen24GMp6i6MieRg8m+Jw5RW2079eX+TRetJ0p9rH8YOPRrToh3Slo0Q0NGTmupZFXXDGpgoeFnRGfuB8rKBSIs4+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+wuZD7fnoMz1vMv9I6+6XrDXEIS1f7V/dm1LAv54IA=;
 b=A6SDok0f3DTMohROkUaaAMC8aH+y/VmOLP+JghPb4y1CisLLose9q6hFh4P1eaA1/cOoWnGZaK98EIXbsy7AVpentEfecnBwEJHYAUxrlFeYv5X2nV7VsZjpXC5dmKGaNg4Y+q4E04Gq1BwkbiSEoG/NJbgVVawVjvfQyV3IZUgUZK7XeGLU+8xXJmbvnpwVDJ1zA1yMwUNlT3BTsaUVLbiedO+GJshVVsSeYkG45UkGhiBqcXl1+WPjQQz23cEw3XgDxqGZLoJ5skE9iEoWSRwZFREMIBYMFamK9LcQvG95gesrP/+kHEJEDW7p3sfOMJur6EWkzjTLYWcmdtWM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+wuZD7fnoMz1vMv9I6+6XrDXEIS1f7V/dm1LAv54IA=;
 b=eOsuLnpCUCbWzicUqfXKbOjsE9RoSY0eFKAFYpv44GQO9uwDyqmWNtQUYwNak827QEHi9mv8x/KVRMZyI8gp9rhWlwsr6eckOirH3LdbT/HRdydYvi6f5BKS5IdCobD6JaEktz4JnCaUiyJYPWY9b/54CgJBDyN9kDMChuBiKls=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:16:29 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:16:29 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Jie Gan
	<jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 3/8] coresight: cti: Access ASICCTL only when implemented
Thread-Topic: [PATCH 3/8] coresight: cti: Access ASICCTL only when implemented
Thread-Index: AQHcme4j5YuB6Bw9DUeWDhBQfdQxN7WLTeSQ
Date: Fri, 20 Feb 2026 08:16:29 +0000
Message-ID: <PAVPR08MB9674C1B8D878731DB752D2088C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-3-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-3-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|DU0PR08MB8471:EE_|AMS1EPF0000004B:EE_|AS8PR08MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0859812c-6f44-45a6-89c0-08de7058815b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aVNyOG54TzlpSkRRR1BmdnkzNENZU1luZER6TzZiMlNTZWlUYW9oZXgwSWM2?=
 =?utf-8?B?Vk9Ud09ZalFHNGxxdC9BRUxGN1lJM3paTyt3Z2MvbzJOU3dHa0RFWW1NVGFK?=
 =?utf-8?B?QUlqT3AybWVaMFdRWWx3UENLSXJEWFFGcWhQa2VwRGU1V01Xc0MwcFYzYVRK?=
 =?utf-8?B?NFVHdHhCa3VDdytxL1JlWHY0MVY5aVpjdjJQVG9Vc09yMkY3UW5ka0ZFd2lX?=
 =?utf-8?B?NVgxTURuV1QwQW1pSjFVdkdrTnZCNTl2M2JDb3V1YWxNbHRyb2JDSmpySEJk?=
 =?utf-8?B?TDlkNzVYU2FCV29pK29Xelh0VG1wbk4vZTB2OWhUL0h2aVAvSW1ycEdZQjdz?=
 =?utf-8?B?UnJTZTFlZGVETVZJQmY3cUk0Zk41MXJPQ1JPaEc2UnF0OGt5N3puY0hRcWJH?=
 =?utf-8?B?VXFlSmNiUTVjTGZKcEE5NDVMM201c0gwUUM2WExBWWFFc0lvcWVIYzRReDFW?=
 =?utf-8?B?OGpaTFgralA5VXFLUHpwaDB1Qkh1TmJKa0ZGblRiVWRrQU9DSTN4M2Nac21y?=
 =?utf-8?B?ZkFSVlhaYXdpLzBkeTA1Vzg2RTZDMFlDSnFHbDNZVUF2WDgyQU4vd3ZVZnZx?=
 =?utf-8?B?aEdYc0lqd2tYS1Q3TWRjS1dUa21TU3dxTnNHS09INEpKL1YrTWhHV3A0c0hU?=
 =?utf-8?B?Vm1SOVZxYnM3R2N2dnN3MlE1enZqeGtKaGdvZTJaU2pJK3NsZFBkQTRCNkdP?=
 =?utf-8?B?YkRUVnlEUDA4UmNEQWhyWGhxUWhTNnRwd1FTVGd4WUZqRUVrZ1hQS3QwQUdB?=
 =?utf-8?B?SU0wNVV5Zm1mZm5yem9zd1FiQmwxUFhwaXlFRjV4aExkVVlZbXBZb0dyZ3pt?=
 =?utf-8?B?QkV4N1ZjNndNR24vR1ZTK2c2clF4ZnU3cVBLcjZSSUJGWGhWWktJRXF0N3Bh?=
 =?utf-8?B?R0R3NFA3TkgxUXNyZzNNUUg4ZWNkTWo1QmZrVFQydDBGOVRGTkRvRitTcERt?=
 =?utf-8?B?Tlo0a2JWZVcwMHZDMlhzNXA5d2FTUGZBekx4WTVOYmNieXJvTTQ5Y3NQSUs2?=
 =?utf-8?B?Z1M2Y3Byb2liTklwK05MYm9WRXBGY2V3NkRwNGZObVVLa3dsdlNMRDFYNG93?=
 =?utf-8?B?bnNkN1BwUGF1L2FaN0tteDVmUjJISlg4aEdXSEpOVkhKd0J1MWNZME1lUmpY?=
 =?utf-8?B?ZkdWQlpDaldZcVgyVS8xMFNwdDdwRWxKMXpFQkdoeHFHME1SSkh1QUM5eUhl?=
 =?utf-8?B?aFhXeHl4ZmFLOERBd2YxM25XVVl5ZHNQVXdZTnE5L0ZSdCtMUXoxTnJUdnBl?=
 =?utf-8?B?ZFErVUpTWGxKb3RBWlZSQ1M4ZExsUVF1eTdISG12cHE5VXBycGo0czhHY1Bx?=
 =?utf-8?B?L2V3d1VvYnlES0doZDdTQXpmOWlVZ1Nqd1QzTFR0WG8rY2VBSXJQdVZJSW5l?=
 =?utf-8?B?dUpDMkd0aGZZSjUySlBXcFMrY1JTME1kWldUN1pyMGJDQUY0ZmJJV2VXZjRn?=
 =?utf-8?B?cFR4WnZMVGhJRGYwYjQ5ZVpDMFhZSzlqc1BIcXlwcDl0anZlL3ZpN2ZzaVVh?=
 =?utf-8?B?STV4OEFPMXIremdGQTdINythMlhFYVcwakx2UnE1TitrbGVaYitYQzBybjlI?=
 =?utf-8?B?dnNSTG8xeDQ1cWR0ZFRzQWMzOE9oYW5hVmxob0UxY3ZkS1krS3kyYzhNRXYz?=
 =?utf-8?B?TFFXQjMxUjUwNzVyV2QydDNXMytyU1NjaEJZQzR5TW53WmtjWE5GeS9hWlds?=
 =?utf-8?B?VTB6a05wVWx6aW9LSXBHeGtpclp1ZlNRMlc3STVUVTNjTXhyVk5DZk9JUlhv?=
 =?utf-8?B?RTVEemQ1aSs4TGM1bDV1NjhiSGlGaHNFSzFHbXJGdTJYU2lBMzlnSWJQK1dQ?=
 =?utf-8?B?aFZJY2NTME1PdVRBMDhQYjViRFR6VWpneTF0QUpnMm9UZHpEVEFmOCt4L0R4?=
 =?utf-8?B?V0tndVNNTzFKUG5mQXlGUnhKUTROOEkrMnQ1Y1NqUXdGZnE3QmRpTDNSUXJW?=
 =?utf-8?B?OUpRSTRDcWtNQ1preXhZNi9uQVVNT1ZkNlp3QnhqVHM5VUw2cnYzeGV1UU8v?=
 =?utf-8?B?MzZINmg0c3E4S3FPOVJxM3RQUnZjTWhuelJZYS9aRnoybUFmdEV1MzFta3dQ?=
 =?utf-8?B?MXVnMGJzanRGT3JmeitwWEVMbHB2ZGVpYnpzL2FXR1lWSENwRXkxdFM4Qkly?=
 =?utf-8?B?dDMvRDN0blNsZmZiNEh0ZlJmSFR0b0FFRFZYWGsvSlFxR3hYeTFpZHByYitl?=
 =?utf-8?Q?A2f2xZV5DBGBiIrkTVRg28Q=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d2f55de-9801-4e1a-c57d-08de70585991
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|35042699022|14060799003|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWFrVXRORzZZWjNkeEZnTWIzR1ZxUzZoMnZmZVk2RFo3QjR4bm4xUWo4cUhn?=
 =?utf-8?B?SGlER0ZRM1NndGVhcGVlTEh1MmtqdjRjYjI1NkF1cms3c1Q1L0tEWEZIKzRn?=
 =?utf-8?B?WGF2eHplYkF0Wlo5MGlnSmNPZGNqaGJTVTc2UW9ZZk1oU0lLNHlXZFdpazYy?=
 =?utf-8?B?bTN0T1FETWxFdytBQXllK2ZHMlZpNVBpQTJiNVVjY09UZnc5ZEgweXlhVFZJ?=
 =?utf-8?B?eWtFOXhnZDBoZ0lxKzQ4QkNnaTN4ZGRLdXE4TzB6Nkw2WHNHNTMrU1BhM1lN?=
 =?utf-8?B?M2ZteGV3QzFrMVpkTThZa3cwTXJpQ1Erem5ZbW9IVkhWWU94SUo5NUNzcFcv?=
 =?utf-8?B?S212NjNQUnk1OUNtU21YUjZGN2tKc0hHZGtFd3ZudkxobzhndFQ1NnBkR1Ry?=
 =?utf-8?B?QVBocUxrZE03L1RCWnRMdmR3UTJDV0JxeWFDcjdqN2Rib1hLMW1TQjJHb0dX?=
 =?utf-8?B?NjRoTlJ5NzRENkgzVURXNm12NTYwWVhFamJ6SmFNclZMeXlHOXU2RVhWY2Ez?=
 =?utf-8?B?Sy9BeTllVVI2OXBDRm44MVZlbDNMR3RWeFAySytBZ3dtL0tvL0JqWU1FR2tL?=
 =?utf-8?B?dGkvM1lYSk9qMWVocFhnTXBZZjZoTS92UEVTZk1OejE5TXJuTmsyODRmcUsx?=
 =?utf-8?B?Q2pJVmIrRHJTNDJ1c2R5SlVjR1hIcER5QmpzMVZtVVdkcU1wU3RGNXBzZWNR?=
 =?utf-8?B?NU5OckVaTFVIc09zWVIyUUltc0RRUDhOOGpPL0o1dEdEWmliVHhFTGNtR3FE?=
 =?utf-8?B?dU8wNWpCYmxybjR6UTIyN1pFM25GZ1lhZUJEWnVyZzBKRy9DbWNRNG5WTDl2?=
 =?utf-8?B?emJ1T3BqSUNGQUFjNW1NT0xZMnB6bnJpU1BpZmw4bkI5RHNKaTI1ejI4M3pY?=
 =?utf-8?B?TFlQY0dSa2ZZQ0FYUk9qRFFRZWtlZVVabGJucUJyR3R4ekN2SG0wQzcvL0pY?=
 =?utf-8?B?UnlmVUxaK3BKWVRrMUszOFRxamlhQVB3azlqckFMOGxSVXozZjN6ZXo2bHNB?=
 =?utf-8?B?WmlBS2JkRGpxcFE1eEc3WG5PTnB1SHc5Y2NpWVBMczZlQ0pvM1JTMVMyWGlF?=
 =?utf-8?B?V1dYY2RoMm9IcHJDOE54Nnlub0w1aGlsdlE5Y0RGRzBrbmlLUEdxL09TYyt6?=
 =?utf-8?B?ZGo1ZUl3NFZPV09oY015VzVPaVQ4RC8vWE10SkU3aHFYZGRicjlkMkNicU0w?=
 =?utf-8?B?S20wclF2dXAvTUtINWlrejhIaW5RU29FajdKQkYrRFZldGh5Z3hGUE9kK3cy?=
 =?utf-8?B?MDVGNCtqWmZwUTZ3L0w0QmR4RnQySjdaSHpES1ZKQ1FQbDNOYVpJaHY2WXVv?=
 =?utf-8?B?My9adVdQUGtPc0tITll1Z29IeVZTTVVNaDZRcGNudFdBZXU5NWUvbHZZRmpN?=
 =?utf-8?B?QW5TV1UwRlBSY09qQWt6d0tHUzJXQ21JaXNXNTdmNnpIN2pZQUUwSDJ0dlVB?=
 =?utf-8?B?bkJOM2ZxK3d4K05mbXZyTm8wWXZiK2M2ZGJ3bzhKdWRUVFhZYVhpY3Q1Y2lR?=
 =?utf-8?B?ZWJaT3M2bnBkMUlWSk9MQ2JOSEpEN1NPT1ZEWTQ1OSszMjFhVG9qNldrT1ps?=
 =?utf-8?B?T2Z6WGVKem9zSlNWWm9ldXhjOGo4WmM2UmpjZy9BNjVFNWdiN0N0QmpxSzg1?=
 =?utf-8?B?cTJhNStqVjBGaGFqSVczeXh3ZTlRY0Z6a3JRN3ZaTGFqanFEL2p3bkJZUnFw?=
 =?utf-8?B?S0lpY3Z6eFJaSExLMHVDMDN6VHdUTGhpYVVFbHdrTFN4OWtiSy9tNjNxMjM2?=
 =?utf-8?B?VzlqSEptSHlvSThKRkduSmtpTHNsSnEyWWdVYmN6TTRRblJZYzRwdGFmRWNU?=
 =?utf-8?B?cFZ4OTdZbjhPTkcrV3IveGp5cFdqUmU1RGk5OFRvR0UyY2dKamw5WjhXSERF?=
 =?utf-8?B?QWtyZk1TczgxTnZ1elRUQko3cVpMUDFxd3VHT1p3WHBPc1d0ZDZMdDlCNUxX?=
 =?utf-8?B?NC82TDNFZGNXZ0EyWXFydm1XVHZXVld3UjA1Tk9TRFJBQ2NkUCtUd1FkcW1T?=
 =?utf-8?B?ZnRoYjd1eDhGWThvNWJQNERFUWhTdkQwY2I5QWtzOW9PQmlvL0YvSGdyaWJB?=
 =?utf-8?B?ZFo2UXRRQUNLemh5SlRQWFJSZ1I4SkprMkZ4OVJvZXdsZUFGcmh4WWhVMmJJ?=
 =?utf-8?B?RW8rZ3lwOW5XTG9aMlAxdGMwWWtWTXV4Z2ZVVURnbzh5eGQ2Mk92L3JzcGt0?=
 =?utf-8?B?VEVJWjNONUhvMkNPNkpMWWo3TkN2c2dtWkVFUnlkbFMwMEpUanc4YitQUk55?=
 =?utf-8?B?azJMS0lyendmdmgrbHJBd294Tnd3PT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YAEtHJdi/fFxOQULtOSPyrI+y56GlenPMx0NXasEKlCPE2gghj/SwtndcaCCCPjXGMs5kWuzO3s16an2JshEfVR36KJtZNCEVtze9AlRNLI4riAWDdJKH2xlHnDJ2JP1H0XrHgsnBsORseuoDF4S6vp3iHXrYLtDq/c44HzSvE0RNYigY82OYzorMsZqLFFBS4PiVu39sZ+/3PSmSKxfMhDoVTG1xq9TTGbJs0WDGRZctzB5cTaJzX8OehXqZyWHRM5r1olp8UIV02n2OU55iH4YNuv8yZA3gYKKggrXiNfB9a6RUFw+fCpzj0cbfeGxaYz+IkXTNxJ/5aJoZtkbvNensJnObCzfRKcuaUBeJpIrdvVSMfeogJsrL8y7GmVl8dLn4Q3wXJ2qwRrg/2BSf4ckSJLpJ8eUT9kCioOVoFhLnS9PiBqpWIUR68e5n5dn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:17:36.1887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0859812c-6f44-45a6-89c0-08de7058815b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_001745_693155_35C5D47B 
X-CRM114-Status: UNSURE (   5.96  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDksIDIwMjYgNjowMSBQTQ0KPiBU
bzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtlIExlYWNoDQo+
IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9y
Zz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVs
LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgVGluZ3dl
aSBaaGFuZyA8cXVpY190aW5nd2VpQHF1aWNpbmMuY29tPjsNCj4gWWluZ2NoYW8gRGVuZyA8eWlu
Z2NoYW8uZGVuZ0Bvc3MucXVhbGNvbW0uY29tPjsgSmllIEdhbg0KPiA8amllLmdhbkBvc3MucXVh
bGNvbW0uY29tPg0KPiBDYzogY29yZXNpZ2h0QGxpc3RzLmxpbmFyby5vcmc7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDMvOF0gY29y
ZXNpZ2h0OiBjdGk6IEFjY2VzcyBBU0lDQ1RMIG9ubHkgd2hlbiBpbXBsZW1lbnRlZA0KPiANCj4g
QWNjb3JkaW5nIHRvIHRoZSBBcm0gQVJNIChEREkgMDQ4NyBMLmIpLCBBU0lDQ1RMIGlzIGltcGxl
bWVudGVkIG9ubHkNCj4gd2hlbiBDVElERVZJRC5FWFRNVVhOVU0gaXMgbm9uLXplcm8uDQo+IA0K
PiBCYXNlZCBvbiBDVElERVZJRC5FWFRNVVhOVU0sIGFkZCBhIGZsYWcgJ2FzaWNjdGxfaW1wbCcg
dG8gaW5kaWNhdGUNCj4gd2hldGhlciB0aGUgcmVnaXN0ZXIgaXMgaW1wbGVtZW50ZWQsIGFuZCBh
Y2Nlc3MgQVNJQ0NUTCBjb25kaXRpb25hbGx5DQo+IGJhc2VkIG9uIHRoZSBmbGFnLg0KPiANCj4g
QWxsb3cgdGhlIHN5c2ZzIG5vZGUgdG8gYmUgdmlzaWJsZSBvbmx5IHdoZW4gdGhlIHJlZ2lzdGVy
IGlzDQo+IGltcGxlbWVudGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtY3RpLWNvcmUuYyAgfCAgNSArKysrLQ0KPiAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1jdGktc3lzZnMuYyB8IDEzICsrKysrKysrKysrKysNCj4gIGRyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmggICAgICAgfCAgMiArKw0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+
IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IGlu
ZGV4DQo+IDJkOGIxY2JlNWJmNWM5Y2UwMzgzZGM5MDMzNWYwMDg1YjIyYTdmNjEuLjE5NTBlOWI3
NTdhZTQ4NzlhMjY3DQo+IDFkZGFmNTY3NWM1NGFhNzk1NmQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMNCj4gKysrIGIvZHJp
dmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+IEBAIC03Nyw3
ICs3Nyw4IEBAIHZvaWQgY3RpX3dyaXRlX2FsbF9od19yZWdzKHN0cnVjdCBjdGlfZHJ2ZGF0YSAq
ZHJ2ZGF0YSkNCj4gDQo+ICAJLyogb3RoZXIgcmVncyAqLw0KPiAgCXdyaXRlbF9yZWxheGVkKGNv
bmZpZy0+Y3RpZ2F0ZSwgZHJ2ZGF0YS0+YmFzZSArIENUSUdBVEUpOw0KPiAtCXdyaXRlbF9yZWxh
eGVkKGNvbmZpZy0+YXNpY2N0bCwgZHJ2ZGF0YS0+YmFzZSArIEFTSUNDVEwpOw0KPiArCWlmIChj
b25maWctPmFzaWNjdGxfaW1wbCkNCj4gKwkJd3JpdGVsX3JlbGF4ZWQoY29uZmlnLT5hc2ljY3Rs
LCBkcnZkYXRhLT5iYXNlICsgQVNJQ0NUTCk7DQo+ICAJd3JpdGVsX3JlbGF4ZWQoY29uZmlnLT5j
dGlhcHBzZXQsIGRydmRhdGEtPmJhc2UgKyBDVElBUFBTRVQpOw0KPiANCj4gIAkvKiByZS1lbmFi
bGUgQ1RJICovDQo+IEBAIC0yMzAsNiArMjMxLDggQEAgc3RhdGljIHZvaWQgY3RpX3NldF9kZWZh
dWx0X2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAJY29uZmlnLT50cmlnX2ZpbHRlcl9l
bmFibGUgPSB0cnVlOw0KPiAgCWNvbmZpZy0+Y3RpZ2F0ZSA9IEdFTk1BU0soY29uZmlnLT5ucl9j
dG1fY2hhbm5lbHMgLSAxLCAwKTsNCj4gIAljb25maWctPmVuYWJsZV9yZXFfY291bnQgPSAwOw0K
PiArDQo+ICsJY29uZmlnLT5hc2ljY3RsX2ltcGwgPSAhIUZJRUxEX0dFVChHRU5NQVNLKDQsIDAp
LCBkZXZpZCk7DQo+ICB9DQo+IA0KPiAgLyoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLXN5c2ZzLmMNCj4gYi9kcml2ZXJzL2h3dHJhY2lu
Zy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+IGluZGV4DQo+IDlhOTk3YjJmMDkw
NDcyNzYxZTk3MzRmZmZjNTM0NjYzZGY4YjA2YzYuLmMxNWE1ODBmNmU5MGY1N2IxMzc2ZTANCj4g
Yjg4M2EyNzcwMDk2NmZlYjFhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY3RpLXN5c2ZzLmMNCj4gQEAgLTUzNyw2ICs1MzcsMTggQEAgc3Rh
dGljIHN0cnVjdCBhdHRyaWJ1dGUgKmNvcmVzaWdodF9jdGlfcmVnc19hdHRyc1tdID0gew0KPiAg
CU5VTEwsDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyB1bW9kZV90IGNvcmVzaWdodF9jdGlfcmVnc19p
c192aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLA0KPiArCQkJCQkgICAgIHN0cnVjdCBhdHRy
aWJ1dGUgKmF0dHIsIGludCBpZHgpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0ga29i
al90b19kZXYoa29iaik7DQo+ICsJc3RydWN0IGN0aV9kcnZkYXRhICpkcnZkYXRhID0gZGV2X2dl
dF9kcnZkYXRhKGRldi0+cGFyZW50KTsNCj4gKw0KPiArCWlmIChhdHRyID09ICZkZXZfYXR0cl9h
c2ljY3RsLmF0dHIgJiYgIWRydmRhdGEtPmNvbmZpZy5hc2ljY3RsX2ltcGwpDQo+ICsJCXJldHVy
biAwOw0KPiArDQo+ICsJcmV0dXJuIGF0dHItPm1vZGU7DQo+ICt9DQo+ICsNCj4gIC8qIENUSSBj
aGFubmVsIHgtdHJpZ2dlciBwcm9ncmFtbWluZyAqLw0KPiAgc3RhdGljIGludA0KPiAgY3RpX3Ry
aWdfb3BfcGFyc2Uoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtIGN0aV9jaGFuX29wIG9wLA0KPiBA
QCAtMTE3NCw2ICsxMTg2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAN
Cj4gY29yZXNpZ2h0X2N0aV9tZ210X2dyb3VwID0gew0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXR0cmlidXRlX2dyb3VwIGNvcmVzaWdodF9jdGlfcmVnc19ncm91cCA9IHsNCj4gIAkuYXR0
cnMgPSBjb3Jlc2lnaHRfY3RpX3JlZ3NfYXR0cnMsDQo+ICsJLmlzX3Zpc2libGUgPSBjb3Jlc2ln
aHRfY3RpX3JlZ3NfaXNfdmlzaWJsZSwNCj4gIAkubmFtZSA9ICJyZWdzIiwNCj4gIH07DQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGku
aA0KPiBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gaW5k
ZXgNCj4gNjRmNzMyNGYwOThlOGI1ZjkwYzY1NTRlMzg3MmUzYmYwMTk4ODcxNy4uN2EzZTdmODA2
ZGNiMDkzZTUwNGYxDQo+IGFhY2IzYjI5NTY0YmVhMjhmNmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gKysrIGIvZHJpdmVycy9o
d3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGkuaA0KPiBAQCAtMTE5LDYgKzExOSw3IEBA
IHN0cnVjdCBjdGlfZGV2aWNlIHsNCj4gICAqIEBucl90cmlnX21heDogTWF4IG51bWJlciBvZiB0
cmlnZ2VyIHNpZ25hbHMgaW1wbGVtZW50ZWQgb24gZGV2aWNlLg0KPiAgICoJCSAobWF4IG9mIHRy
aWdfaW4gb3IgdHJpZ19vdXQpIC0gZnJvbSBJRCByZWdpc3Rlci4NCj4gICAqIEBucl9jdG1fY2hh
bm5lbHM6IG51bWJlciBvZiBhdmFpbGFibGUgQ1RNIGNoYW5uZWxzIC0gZnJvbSBJRCByZWdpc3Rl
ci4NCj4gKyAqIEBhc2ljY3RsX2ltcGw6IHRydWUgaWYgYXNpY2N0bCBpcyBpbXBsZW1lbnRlZC4N
Cj4gICAqIEBlbmFibGVfcmVxX2NvdW50OiBDVEkgaXMgZW5hYmxlZCBhbG9uZ3NpZGUgPj0xIGFz
c29jaWF0ZWQgZGV2aWNlcy4NCj4gICAqIEBod19lbmFibGVkOiB0cnVlIGlmIGh3IGlzIGN1cnJl
bnRseSBlbmFibGVkLg0KPiAgICogQGh3X3Bvd2VyZWQ6IHRydWUgaWYgYXNzb2NpYXRlZCBjcHUg
cG93ZXJlZCBvbiwgb3Igbm8gY3B1Lg0KPiBAQCAtMTQwLDYgKzE0MSw3IEBAIHN0cnVjdCBjdGlf
Y29uZmlnIHsNCj4gIAkvKiBoYXJkd2FyZSBkZXNjcmlwdGlvbiAqLw0KPiAgCWludCBucl9jdG1f
Y2hhbm5lbHM7DQo+ICAJaW50IG5yX3RyaWdfbWF4Ow0KPiArCWJvb2wgYXNpY2N0bF9pbXBsOw0K
PiANCj4gIAkvKiBjdGkgZW5hYmxlIGNvbnRyb2wgKi8NCj4gIAlpbnQgZW5hYmxlX3JlcV9jb3Vu
dDsNCj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQpSZXZpZXdlZC1ieTogTWlrZSBMZWFjaCA8bWlrZS5s
ZWFjaEBhcm0uY29tPg0K

