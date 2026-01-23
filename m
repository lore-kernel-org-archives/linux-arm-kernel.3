Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6047D7236A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dpK1G1zyhqRLebM2ec8klIRzJtOw3YAUikKSAgaYVbE=; b=PAEP4Wig0ItLA+
	WDKarZrGB3YBY0FSpDXXsYro3lQqZ+y2Pm+PQyiVTREfca3p2nn0vv82POrb+ZvCReRCbo5P+e98z
	e4Zv1N77zpnlBpmd6Mn3sonSo/tmSp3XmTraXdxgh0zxAMu0kbLJ8EzK84R2MkJdisHdCnN1/EgtB
	lM/jPHc4IaGYgtEgB6QoJZLw1zJqXTSVuPSqm9sGmXBPuYpZiY5Ll8RKDR0n7cPgkKz0TLdom+x75
	rEITZ5CTvdhY72u1WNH80buzmyJpEQkpOe16skWXwiYcmb1erXK66v1p1x9BBHxJpgk0z9f6XPg5g
	fX63DTQTvETsa4Fl69YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBW-00000008h08-39tp;
	Fri, 23 Jan 2026 10:14:34 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBQ-00000008gwp-08ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYKMcDsXqjfvYbbppaMaGimNLfIYDYOXllJLr9TvaNzUmQbQXQpUjDnQ4b8NjbQi4GTLVTUQfjCjUquTHi7Vr6An3ygD0PMwqOfFiBHpag54DQZP+/aKTzlyWYosVw3FeC2aEhfxiNPlON3SItXdYkqQkUXZ7btWKC3tz4Ce9513PlLvlQwnf/WFLnUlG+iWusv6iPmEuXu7oXNR7tSV0DBGaZAsWpBtX5PpTGG+xiLBF+zTEUX83HeqHSc1sZwn4+4MAiEuLzTC77JIpVLVOUlrimiWVhDCRTMA5GH6teAOvWg4ZAUYoFSfbRRHE7tfFYX26MTHqDujqLkwCbcVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpK1G1zyhqRLebM2ec8klIRzJtOw3YAUikKSAgaYVbE=;
 b=C07jUEbTSPRDoDyggRrv6hhKsR23qaDDOnG+FQDBWi2VHKQTJ9PwuSNm/hFE0ju6cxMy0bCO3d18sNpxHBrqytc0krHLNUmZI+wFQ2Uw4esp3Ei+sQRNTFLFicuetl3+fVKL01cPuVIRYeApOQNk9nsa1mU7jB0mjZzqQqrVq7G1VOkQWLqgg8QeG8+bf8QGpYNTfZ9hmBMlUk5uv/0ZOF4x6mhnu8hj0VBIkadBq4wgx4pYu1dZshaX0QizjYF7Qu2RlpV09M9pSmZcJSTu5tg0uj/8da9FhiOPqRXX4sm6Cw2r57B0l8hM9MBpOoa6yt3mYo2IBP6LZBRu+Q7fKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpK1G1zyhqRLebM2ec8klIRzJtOw3YAUikKSAgaYVbE=;
 b=bJObHldgGhvMXsvwePHmR3rC8cT5n8S/MFA0RmwM4PR+HNjP8R8zRV3rxx4QKtRnERAlwRvUgAcD9zoby6CRpkesIM5cHz5Fjwd35avZj3GJhQR6x+8y98YgObcnThYm6FBWnSjCROnX6f3MdAN5lDVC8kGmx/+O/M1CmQOTUi+NErmoxx3VBHN0ZSIjpRG43gLB4JNOXVA1/eAPpgulvisHUPwkCYynrT0C2va04+UcblkV1rWSnm0/JkazTkb8I1m2VXGVSBoVuuxRt797yeF6R9exfvD5If5LVDangWq/nYQU6z6Km3F50LWtcbVQ7VAd6Tiv6+HEBybWUAT41Q==
Received: from DU2PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:10:232::18)
 by PAXPR10MB5352.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:14:19 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::76) by DU2PR04CA0073.outlook.office365.com
 (2603:10a6:10:232::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:35 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:03 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v5 0/6] Add boot phase tags for STMicroelectronics boards
Date: Fri, 23 Jan 2026 11:14:02 +0100
Message-ID: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpJc2kC/43OwYrCMBCA4VeRnDcyk6Rpuqd9DxFp0smag6Yks
 SjSdzcKgigUj//AfDNXlikFyux3dWWJppBDPNZoflbM7fvjP/Ew1GYCRIOIgp/GXBL1h93Jxlh
 2Y4ojpVIJLoQyYMEqi47V/TGRD+eHvdnW3odcYro8Tk14n36jTsiBg8UOpWwRSP75mPM6l7WLB
 3Z3J/FqqSVLVEu2RnmvtekJPi35tDQgmCVLVsuh7QblhSMzfFrq1eqWLFWttiHQummdhre/5nm
 +Afy17j6oAQAA
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|PAXPR10MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fe78f1-54a6-40ff-5ed8-08de5a682bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME9reDVYSVA3dkFKelBHaGZjQ3d0Nlh1d0ZRZ29uMHJLQ1JaWndpNWdVZE00?=
 =?utf-8?B?dW5ZYnYrclZDQzgyVzNLM2laa3Z2am1zQkNBNElQbEIwcmszM08rR1Y2bUVl?=
 =?utf-8?B?VnpTclFPdFpCd05xNlg0enhRYkZmZ0Jkb0lTL2dQS3dCT3hqTnRqWDA2ajdD?=
 =?utf-8?B?SHg4TWdLSXp4enNLYUJlcGorZWUrZTR5SWdpaHRlWlJTS3pPRzgxSUZqeGhQ?=
 =?utf-8?B?R0FhbStyZjNDVFN6V1dKUDU2YjFTWWFEQVZRdDhvbHRpQk9vTWFQdm5HRllJ?=
 =?utf-8?B?bUdjQXJQQmNrN205ZzBzVytrRnltUWc0VE9RMGlVM0RZWUp0MjFZNUpMUklU?=
 =?utf-8?B?YzVXMVFvUzJMYWlDNS9NZjdCWUdBcFZKcXNoVldwZGpCcFpzNWNoMnhQODdM?=
 =?utf-8?B?TTZsTWR4YkEyd296eUZ1SkNkWFdnK2Y4M0RoZUszRWhCRnZUOFlOaEJXQ1BZ?=
 =?utf-8?B?TnExUTlIQXI1NEtiUXl4MmNFUmFEeWRGa2ZXNEdNVThKaGFFY3lCbWFOM21p?=
 =?utf-8?B?Qmx5d3BLaEJDSzhaU3p0T1B1aGlzOWpEZEtseUFuOEYrRkFnR1lSc012MDV4?=
 =?utf-8?B?OVVha290bHEyU2s3WFdGcEtlWUFDamZWajNTeTU1YVo2bFVuOUpJUDlMeHFH?=
 =?utf-8?B?MllnNzNVSHBETUFwa0x5MFkwcTM1eFI2VzJUd3ZJYmRsV3BCellzSDR4Slp5?=
 =?utf-8?B?MUJOcVFXZURvUU5BOFZUVUZGWHVaNW1ZQlNJcW1YQXkvV2RzTzYyRGRRMXZZ?=
 =?utf-8?B?Z2pLVkFDN3BEYXNqYUtZSk92TkFVL1NEVHZPMlpXK1NqV0lPd0dyeTJJV1NO?=
 =?utf-8?B?cmZhMWJZVUVseVd3MDJscXc5Vk5mdkVLd25FMlN4blMvLy94b1MrMURYTDBE?=
 =?utf-8?B?VTZsR3pNcmNDakJWTTcraWE2RFZlcXF0UDNWdXVvdkU2Q2VRWWlGamI4Y0Zk?=
 =?utf-8?B?c0FRWVo1SVBYNlVjdENLaDNiVkdTNHNVQ0lFVzUzZEd4V3NPWTIzeVlxd05V?=
 =?utf-8?B?NmMrbjZkRTlnTndBdFpTeG5lYmxjYWpqdHdiNGJSSytIM2Ntdk9hSUV2SzBl?=
 =?utf-8?B?azNrQlhZZ3ViYnZYYXZ2TDVYTlN0SnJFMUtpaC9YWjJpR1MyNDBLcEoxT0s5?=
 =?utf-8?B?RXkrYzVqZXVFK0NkZzZ4UGcxUm5lQWNaOEJtNkFLZSttWDVGbDR2TEgxK0Q3?=
 =?utf-8?B?bGZyTWhrcTlIc1o1RHhQR0FiTzN3OWx0WXUrN0orVDVsb0tFT1dlellHa0hY?=
 =?utf-8?B?dG9KMHhvZ3BEM2Q1MkxLaG1ocEkzZnhFbGhFSlFrTXhpQUVtMG4wVFZGd2JH?=
 =?utf-8?B?L3BnbVlJUXllNDIyU0JGZlhiZVNMR1Rtb3FFRkxzL0tzSkU1d1hITHdnZWU1?=
 =?utf-8?B?NzM0a0s4UGRMTWxPSW1nS1d3NFRGMDh6V2pFRzkyWGp4Q2dzTlhjZ21JUVd1?=
 =?utf-8?B?bm9nUGIxZTRBeGFxMFF5Y2VETDYvcUQrSFpqRlNLTlVaMVdCQ2RPWHBOK2Jp?=
 =?utf-8?B?aFdMWmxHRzh5Nk9zbUFjRlVvTkJjNGt0YjFvUzlKd05rTGxIS25tQzhTREFK?=
 =?utf-8?B?cWQxL0pyVWFTNkVweTVlQVdEVjZpeTFHYzNqUE52NkhpTEhDSXhiK0U0RW1z?=
 =?utf-8?B?Q3NmZUM4WjY5S1ptbzdTejNWSTZLZFVCbWR1b0RFakx1NVhZWnEwbjdhV0I5?=
 =?utf-8?B?MW5vZzZqSHdMcWhGQ0h3YlQzekx6enJabFFzYmFuU0tDbXpWeW8yeTNOTko1?=
 =?utf-8?B?enFRVkNncWV4cVgrV3N4RytNMy8vSXdBRWV1RWtwMDcyN0FOTFhGdERQRmFV?=
 =?utf-8?B?Zi9MY1ZQWjYvcVRFazhXVjVCV3FwV2hVR3J6T3AwZ2xSVUdtNGNPY1RrUE5G?=
 =?utf-8?B?VzNLUzJHcHJpekVoWTd0eXR4eUF4MkdoeURBZmZGa01rOElCeFNjeUdKQi9w?=
 =?utf-8?B?WUs1SVk5c0JGSDUyRXoyTWNJMXN4alpWWmxwQlBUbjFsT1QwemFLMWdIUHE4?=
 =?utf-8?B?YkU5cWtYRmhZMkpUKzIzb3BNaGg0UWZCYThkOGEzWWxYM1ZkNU9MQ0VMWkYv?=
 =?utf-8?B?ZCt3THN2SEMrbmlFeVdlZkhwREptRi84WFRleVU2U08vWnZpcGVXWHFzMHor?=
 =?utf-8?B?T3lRSE4xSEFic0pZNEVzd0NuU0VPWHpZYWQva0NGaHJKanZvTHlFUWJySEQy?=
 =?utf-8?B?OTJnZDFDUFNIeFFaalpuTGN6Nmk0aEpiU09Rei8zbnVsdVlVS1M4eGlVbmgr?=
 =?utf-8?Q?mPEgnZyqAcUg8284P8XYXONHy5QB2cO272Z4hiOdME=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pM+z8EAiOvD/n9jKNDL4CJW14Ya3cUBzJnd4KVo5IiqzM4roAYUqB92jQlh/QcJjjGt71ofyxFyiSi7wIUXw/ewIBUVj3UbDDhlCZi9r9KmcFCasrgxi0w4vBKT2efHNU8XvZBAE5bJnFGcBNa8fJZWbxIa6wzTdd214Jew8nqwUeAN8VKqgG9SAQKf6CZDYsPdC47Y7JL4YpALoVAiGFyfJOJ3EGat3YUCUJBN5J3/GcBW5sK5xfgQu+QphUuf8/p6nzn23a1HvY3DiiOwJOKomg+S6rFtUprIcNBz6Mi24SEqNMN48jd8ua0DYhkX8CK3pL+j1uBZiYbAmb3nRObqgTliO4odog0CV7SK0V0+Tib/tj0iKGeoEtOGLM3L02DaTWaGdL20rZ5y/DpDpY1BAh6DxC5UauM/XBOUInb+UQPNP5JD22i0wCDZ6UPLCXT4sl6nakuRxIOpl0UHdlpxAKzjCBm21mtyA4kup/4F6RN1t+fNT2AIH+/FzedXdPsMOFcSg9MjoOfUhtgmFdqYjXkP0KA807MJegSjml/Ed67qQiIT/ABTLy/1GqvB0W1RKwGVGYIDuC6n9gJ93TavgSbX6+x3WcBjcODuhr3LxGin7As3z+fz+yAxqbqCElQv9tRegl9sEB2DvabEYaW0Gyp5HPaGIfCFsS3OaBXQzqgrIdmHSRTwQU4eX09FzfMHPbjv8MzOJzuBnQusV6A==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:19.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fe78f1-54a6-40ff-5ed8-08de5a682bf7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021428_218052_B06D6AF2 
X-CRM114-Status: GOOD (  11.62  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v5:
- Initial implementation allows to factorize and add bootph-* properties in a limited number of DT files.
  After internal discussion with Alexandre, choice has been done to add bootph-* properties only
  in board DT files instead of SoCs/pinctrl/boards DT files.This impacts a greater number of DT boards files.
- Link to v4: https://lore.kernel.org/r/20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com

Changes in v4:
- Remove useless nodes in stm32mp15-scmi.dtsi
- Link to v3: https://lore.kernel.org/r/20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com

Changes in v3:
- Remove duplicate bootph-all property in ltdc node
- Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com

Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (6):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts            |  80 ++++++++++
 arch/arm/boot/dts/st/stm32746g-eval.dts            |  10 ++
 arch/arm/boot/dts/st/stm32f429-disco.dts           |  80 ++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts           |  72 +++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts           |  75 +++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi                |   2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts           |  76 ++++++++-
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |  69 +++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |  69 +++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |  69 +++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts         |  69 +++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  21 +++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            | 101 ++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi    | 145 ++++++++++++++---
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |  19 +++
 .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |   1 +
 .../dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts  |  25 +++
 .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  26 ++++
 .../boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    | 100 ++++++++++++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  27 ++++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  27 ++++
 .../boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  97 ++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |  19 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           | 151 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  38 +++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |   1 +
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  | 119 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-odyssey.dts       |  21 +++
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |   5 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    | 172 +++++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  55 +++++++
 .../boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    | 157 +++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi   |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          | 122 +++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |  25 +++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  95 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          | 103 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 105 +++++++++++++
 51 files changed, 2545 insertions(+), 37 deletions(-)
---
base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


