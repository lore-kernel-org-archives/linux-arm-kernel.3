Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DBE81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=; b=HvMeZuL3EPFyAVPDHUHHW39QbF
	VLWQxLi19f1e5HEgJiMTbL/RI75PPBmuD+1uZNRPk97gTRCCG8icUdMqgN607cD4zaPpXLT6L6FdQ
	QBrxK8V66JgjV5zkX9gBXRegZRfuqfUDIVoCsqxgmrcDjqSQn25JlzfDwdBZfc06Zo36zAdrmvn35
	ffs/oH3pC4KC3h0nK/QENdvYNJGDZAYlN82RxhknKZcy05Y9W8sqXomt7RY9LHJpLyZ+92XQhXQ9n
	cpCvqbdqnyWfW7J0Yy4vU9Bpq6eCEwng/8CehDL4/UJuthy3TJEEHzVXe2h+n0v7GvEzg1UcpJcT1
	o4X+HrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSlA-0000000FZUf-02V2;
	Mon, 09 Feb 2026 15:01:08 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSl6-0000000FZSC-0UFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umbpWDF5zjn+yIMk4BlEFBerHFpY5W+i64GW2zKC7xV/Lvu6cV+zUTSlboLRnGd7CoPexHLInnyf885GxW+t/R8HaQb8cDzAZsmKVk+MXKmqtQTwXYGzeuO9WjETbrynDj3G320toIbfB5iuwqkWSwslYIM6PjTWXJTj5x5gCyT5qvXHVQTSzEiAWn+wziVMQop5BpQeY3D7w9cLd30EL4CUQ4ZlIGgMgRnlTm3kLb4wbB1/j3BvbRpTDocpQi6pHJuaPUhZ2oiluKO8bmEqnKnNtfQwHt6yVATs39Lw30KQCsjZpg+QJsOfQ4vDWoVZbLEpZ2fsUOlOV7LZna+bPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=AebnKMvCQrYJTJLFKU3o+7ZlRwlkzmGlkwm1RvMCuVmtYOr/bbefPZnwbQYQEETPJzEoNCKMnI12/Q+RSryNr/SjPTuTSE/6elQ/KBsBS/My865M8KT2sphs4u4HDI3h9NvEStCV7xoa8XOreRP9/bdUntlTYDerQDCzKzmmOxLiFYjTW88MUb5pNTFa4WQwDJ+mD5fvyvV2S1GCJLpmNB6S5trfVwPsRsmuDCx0kZiJvWefYBuHtyaU3E3/8nbWfReUXQ/gle4aYeJsKLsYmoE+NOgvrSDm/oFkqagvaxFXrnlYyU0jECPFcdztSnT9A3QvtrhyL3o/PD9iHv3YPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=nw0RWuBCi7rkMBNrIELIpzEpsSMUxGyYguCmjbsPwn0ODhO3t5f2PW14928IXuN7PrIcdmWUr6H9gJlA0T8F9xYANYg4UbzZXT85a2nUfgcE/BY44wFOmNPTqu6MfG/wzSdv6rXHofElLohimy+ywf7j7D1sSdJQSiDSuVkQ3hcHaUA5r0iHfUQLVPK1vwWTEdfvoy4ywyBsjxHwQsewU/f78WvGR2ljxoc/4Cc8mmha3NguiJU7t/FkWQjwLEzEB7sT6LgGK2Jucyr8jTot0cVmkFBx29/2F7Hdp0pjLddJYtyJQGL0rxGM7hHGtdgPoz4TELEXAEkGW05oELWejA==
Received: from DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) by AS2PR10MB6895.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5fa::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:58 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::4d) by DUZPR01CA0268.outlook.office365.com
 (2603:10a6:10:4b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 15:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:39 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:57 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:36 +0100
Subject: [PATCH 6/7] arm64: dts: st: enable all RISAB instances on the
 stm32mp257f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-6-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AS2PR10MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a2a713-aac3-4619-8b6a-08de67ec0857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFE0c1NObk9ob1Q0Z2NXNSsrRjJVYllsVEtmK1JIWTB3Mit3YmRjUWtwU3FN?=
 =?utf-8?B?N1FQNnorNHc1eGtrd0dOM2tFWDJyZ2dBU296TjExblpUUWZwd0k3UzU3ZVNy?=
 =?utf-8?B?emkwQU02eGl0enNhaWR6OVp4ZjdQc3dPR0twMmc3Nkw0MkNUN1BLZmpuTTJ3?=
 =?utf-8?B?Mm14Uklpa2hsaHdZa3crVGZWUmE1MGljbVpFWkdLZ3ZsbUU3anpCS2Q2WlFK?=
 =?utf-8?B?MkJuM09ySEVMSEc1SkdlWWFhdUFNUHZkMGdvcXV6WVhTSmVKWExCNk1EbUlu?=
 =?utf-8?B?a2t1ZnJDd29Dd3VvaUhBSysyVG8vUFQxZytOaWVsekNHOU50ZFZ0cmpWWFMv?=
 =?utf-8?B?dms4SnJCNUtZTDJhbWZ0aW5wbDNwYXdHaUlTRGc4ZG5USUUrMzlzRlRZa1RJ?=
 =?utf-8?B?MkNCTnZXL3grWWJkWUJ4ejRRQTZPNWRUNld2NTVpb3RxZDlYWEtXTlhVbmQx?=
 =?utf-8?B?T0RXbmtNVVYxVHhlOVBqN2tZQ0k4OER1QjhDWlJNVmtMYkhrcVpPMVB5dHFw?=
 =?utf-8?B?cDdGMGRHZzRDRHlrd2JMVmVsL1hqbnowcWxvZGFxTzR4NDZuWE15eWNBOVFv?=
 =?utf-8?B?L1Uzb0RneXcvdnBVcXVJVlJEREZyOUJjQktoYmdRejk4UzJXd01Ta2lDSURU?=
 =?utf-8?B?OUovQlNYVDRkbEJlaEYrZUtEY0RoeFJSaTdhMWRoQkVmV2xJYVhRNnNLU1Iy?=
 =?utf-8?B?UDdYMXY1ZTdRT1dnRmU5VmR1UUNZVWpmbDlVZmZyQTRPd0RjWDJRT1BSb1Zv?=
 =?utf-8?B?S1ZyaHErUDlseEp1N1FrZlpuZkZ1WmpjcjdQemtXN2NUYTFwck8waVNIc3FZ?=
 =?utf-8?B?Tk13UlUvY08vL3lFKzkxRnJHdjFmR09LRithMGdzVElzbGY5SEtpRFdYYldQ?=
 =?utf-8?B?WHE0UGthZ0hqaDdxcHJwV0ZIa0VTSSt5UTVhM3Npa29iQ0FtU0p1MlY1ZEIz?=
 =?utf-8?B?Q2FkZ3cxS1RLcGRWMUNGb0E2ZWtNWkhBTGg1VTRsaXc5QlNxM3NZcTdwc2dl?=
 =?utf-8?B?MDJFaG85Y0NlclRkY1FzcUJpeGlUcDNIMFRSc2hESnhXRDhoTEd3aFBRQ1Vn?=
 =?utf-8?B?VnJwc1hWQkdLcFpzQWt6RDFMZ0xSQVBBT29MUHpiTFU0SkxzOVlmL1JhKzVM?=
 =?utf-8?B?TzUwTmN0SCthNnA0Zit5akVWQTNhVDFEQXhCaHV5MjNXOXUxYlBucEJsMllP?=
 =?utf-8?B?TndoQ0R4YjR4VFVnWDM1N0pNVlRqMEl6d0k3MmdIMTVWOEhkTFZMUmlyakhK?=
 =?utf-8?B?MGlRNTlWTHhhMjVyaktJLzFJK21OZDI0SWEyMmNtU0tLcGJyTitCV1RIZCti?=
 =?utf-8?B?UG5kODhjd01tZWxLSHZtb25aUSt2K2tMVjZjZWNYWFowTUNDaTFab25zTU1k?=
 =?utf-8?B?YmRGY3FMRElncnVUSUFwejU5ZGhGeHR1UmpXZEQxTDdPaHMwajRVUTBsUDNR?=
 =?utf-8?B?bG1IaVc5dVVrUHFJRWFCaEMxKzhXU2lYSWRyNU9sYjNVaFU1WTZ5dWdrQjBv?=
 =?utf-8?B?NVgzZm13MEt1QXluNUdJZmkvL0tMTC9KZEVxV3JDMU00UVRRdmE4M1N3MGZ4?=
 =?utf-8?B?aXdvN0YvTXh2eGNGTlBxM05neng1RFpUMDZhNGMzU0hJWHdGbWRva2NGRUl3?=
 =?utf-8?B?MTFSV3JEN0N0VTZMNTRmSGhJWHloUUxzdGlBRHU4OEVML3huRFhGNkdidGRT?=
 =?utf-8?B?MXdJTi8zd2JRdjBoOGdNZjdiQzBETUwxTGZxUkpHRHdXbHNSUGoyWHFOZ1J4?=
 =?utf-8?B?UmIxS2I2RVJtOTVJZ2xiU3g2cldCbTFpQUhtdnQrM1BTRkFZME5Kc1BjMXJ4?=
 =?utf-8?B?M01ybkRNMzNkUU95dVdScW5kMjlkMU9IRGdpVXAxMVd5ZkV0cmFtZ3VyUkZa?=
 =?utf-8?B?UWtNWksrbHNMT0dzSEhNY2F0NW9PZXBpUjhURDRsUDArc0lxUkxCWmxqRUNn?=
 =?utf-8?B?SUsySEZ0b1hDRXpJeWNtM1pkVnorajNXV2pRcDZrSFRyTnd5bnFkc2YwZHN2?=
 =?utf-8?B?dnVaSFhjWHlybHVlRGM3anlRWFhHaTBRKzlvbHNXaG55a3ArRlhWVnAzN3pv?=
 =?utf-8?B?eEZqTFQ5V0V2eFBZTlRuVjBLekc3OGUxU3hCYzBGdExWTDc5NHVxM0lCbGgw?=
 =?utf-8?B?QjVEWGcyTklROVdwd096WnFxU0VBMXdwREhRK3BBTEhxTzZoRHFUS3BTT0dZ?=
 =?utf-8?B?bnViWmpTR3FsR3k5RjNkWS9pYmhWT3ZJcDE3RWxLalE3RGdGaE5VeUxJUW5V?=
 =?utf-8?B?N0ZlTGNCWGtqeTRtK25SZ0Z6Rm9RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VaBGbmVbegiQErnxx+zIt28gbmyDQSmLGWQ3I/FpH0w6jJufGEZXQSnZvJZR9b3X3RHlpYKISzjapKrNjBQHAx0StE39S1tmKuCJ3tSjj9S09mM8u9mflILAHNJoph65NDfTv5q28QI0xCop4FA7sNooYtMCDpGNLiAaeNu+c8TsUR8DEbwiUW7Z6h9mFH3wc5knW1hBqtuwCltrVmpy8QTxDwbdXrdrvzjK4CWxu3rkMW+OrBxh6K0y+LH4HjU5FdqFeny1khmGpYB9pmASDDkppzTYR3rRwtvjfWsgARt12yt0jvaVpprk0A0a0jQPfWCnZfT7QOSSKWqnYkcusoeC/7OPvx5y1N/bNh9x9NRrYvjVNIfQcVMkSihXtEutacpgmGR2JTGtXBRsi4bBP2t8ngURNecgUy/hWDh0TWFmtBEOUOo+bbHpH7eyWU3h
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:58.1874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a2a713-aac3-4619-8b6a-08de67ec0857
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_070104_275791_C8329374 
X-CRM114-Status: UNSURE (   6.81  )
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

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..42894ba954cc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -100,6 +100,30 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


