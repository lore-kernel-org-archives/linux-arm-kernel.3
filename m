Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DE0CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9PNhWdZKvKC5QLQoG1SafrTDK+g/nY/6NgLl7hc3w5o=; b=epJ8YQAxarH/BZhkZp5QB2U7jA
	CxUBTeUmMjfg78zd2eH9LjrruNvZpFjZkqjoEE1g8HVBTrRRlPgGWO3wA8WhIHr3KZZ9lkC2elhwq
	HzUc8ERZiGDr3jcL8cMvufS6+y8i2ahwFIn9/dngYcWtpDU/X7qzZ+aRGx/lp7uDvKRnwQ36pOJvq
	0iH1giKvyVlptPIhDpzmoAQFjD4NfK5GNuXkM5x12ZGx+T0/FTmioaWG68x1Bq9ZcMcTrZniU+tf2
	FMMfhaqnGDz/gUoCvBWHfg9FNIQMGJ4ZjYGOfwKMUN3iVLei46LSX3GHYJ15ICvQhVammvp1ciE/V
	PFb2OcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbby-00000002osK-2Y0S;
	Wed, 03 Sep 2025 00:44:30 +0000
Received: from mail-dm6nam12on20728.outbound.protection.outlook.com ([2a01:111:f403:2417::728] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWUj-00000001gAW-3ere
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 19:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQYH4a3Qpcf7R/Fp2gt0jwSBiZ5d9lJQqOKKFxbhaxnspBrWauvDmN6k+56/+REBV5SjmpcohRFYIrCWf7WlRb03i6HkHFIJrJeRGKinEorGEeI+yylG5B+aztp/7gKVyFazEit3TB3QF/OpWjZJo8d+PQI9UK7MixmDI3Gq1N13KcK9ZWINfidgiqKqFuZgEZNjc8yBD7f2sAkQZAXbTGEYAiGsILpmcSGKJgJqWmaW64IuFXaO4FpFbTEZ+OPXKbhJ2SeKdA90obhLGBmK1IsFqfmuZ25FBRr8tnJ/QBp9qAATOgAhA7dnJ77Tvv2Lyj/ry7S1dmZZCmlJDaGlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PNhWdZKvKC5QLQoG1SafrTDK+g/nY/6NgLl7hc3w5o=;
 b=VaZcJgF8xXs4pRVbXmp66vOQ3yC9MyJMCZGQ2RVW4lLaSQuWY2HVUoeG+nDjoiAMFzmlw4LVj1Bs5zgwnjm/n2/Q1vuDui5U4hpdYGbK4hwfeynyoudC+5xa4uxFG7YNQ4Yz7pTuRm0iwgOgRxc5s1AlRVYlElPBUU7aGPKbMp4bF9qPxOUFKTYAJAYB12l3cwXB1HVXp6cwkBQpCI/7pM4Djy29piXJc7iPVxlT3puutPSg2R+CMDrv/4aBDWA5MBtlu36a1TTyCcBNmLwaxk3v0tm5ovHOysLrvO6b+n1qF+TVx3I9uhxqXnHSy9lTqi/mX9SMqsj6jEClh+pB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PNhWdZKvKC5QLQoG1SafrTDK+g/nY/6NgLl7hc3w5o=;
 b=ef55wGw4pErQ1/0CSRPbK9ZA+Aheo125ONAzaUQl9iMeeqB6xBF1ylxdME9fQ6G+Ywy6IU4JMLLv+DDiKTKCDIymus4JjFPCkvQtoV/GS6jitQmOtC+/5ZO0gQMvWHTt2HWXvP1+9YqdWlDl9VxsiT1/cXqaECIV4DyeOkw+6RPkRtL+SwUOOIaqjVu81sMIGS5nNSRII1i5Wr7oU7j72Pw1DT9xgWDocMJ3zCsbfj+zOldCsX2xiEXOAilKJNUvzj9X8WRlXX/Vrx7tNtk43jqIvPGWQHUotjwyvvLh/MLAJ1fViQAkMMxTTfgiOd3TIB10y4JUD7G4sesEM6eQnQ==
Received: from CH0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:610:11a::29)
 by DS0PR18MB5395.namprd18.prod.outlook.com (2603:10b6:8:12a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 19:16:37 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::68) by CH0PR03CA0345.outlook.office365.com
 (2603:10b6:610:11a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 19:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Tue, 2 Sep 2025 19:16:36 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 02 Sep 2025 12:16:29 -0700
Subject: [PATCH RESEND v3] serial: xilinx_uartps: read reg size from DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-xilinx-uartps-reg-size-v3-1-d11cfa7258e3@axiado.com>
X-B4-Tracking: v=1; b=H4sIAIxCt2gC/32OPRMBMRRF/4pJLWaTrCRUCloFpVHk44U3w65J2
 FnM/nexFBSU97055947SRAREpkO7iRCgwnrKgcxHBC3N9UOKPqcCS/4uNBM0BYPWLX0YuL5lGi
 EHU14A+qEBam81lY5kuFThIBtL96Q1WK9WM7JNt/3mM51vPZ9Deu/b/Xkl7phlNEiWCVKVnAR7
 My0aHw9cvXxWfXiOf/LK23GTgpnpQ+f/HNTIz528PKnR2SPlloFWRrFPXx5uq57AJNBRIlNAQA
 A
X-Change-ID: 20250813-xilinx-uartps-reg-size-c3be67d88b7c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3389; i=hshah@axiado.com;
 h=from:subject:message-id; bh=MX5KAO6csZFsbFEVKZWy3Y/sxP1r7U2UlJeUV+2RLdU=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBot0KTsgbPW0No1Xw0qQfokaBFKs/8Ai+KvJkkX
 y+nevha8VaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaLdCkwAKCRDxWHMRoTLV
 +w0IDACf98gRR3BoRdbE+0NtUC1QqXHK4xTxJMlUhWv+6gn+DgzvkVMKjyhhnytW4ev48ywaxKB
 xmkyoYHFKQFOzNKMbee3r3++tPNfG6WA9yDxZCUCo+SRj79kfs/Lyt39FnObVOXYY3U+1uae78B
 LS1WGgYhd1ho+4Xs64ekH5to/kfAu8fiXRdD8/ubkj6pPAdUraHe1+ULDlRkJIktMOL2w9NIpY2
 tvbj+C4+MhmUhr21hbaAux3nEJtGBjKcbnGgpDUiPEIx6/npRcIAZ0JlOWjDoSxwLtyMatqe9Mp
 D5G0qTPxbwNxZl7z7YFw16sOre61dtvYf1iih7QL55ga/5okHwU3QefO6+QW39Gmk9c2+D1u+gU
 nMDmr4iYi7kHvXZxvLV6CV65v0EKZYQx+bFffR19UDyWfMXv0GNZ6y6zdFxtS+oHxrxDP0cIH+q
 Ffl2aUzppknOvq8NA1F/T/ctixb8MxbkbyC5zSWlim/hw/lbnJmRh3xpquvSWcyIJb/1w=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DS0PR18MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8517f98e-54d4-43a3-2228-08ddea553cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzNqNTVKNHJqaXJ4M1VCV01wbCtsNVZBR1F4bldNL1ZXQmtDQ29oYkx1SHRX?=
 =?utf-8?B?dUE3VXFuUGlVNnV6UitsVjFIUzBSS2RHL0t5OGJaK1h1U1BOUlZZSHBCNUY0?=
 =?utf-8?B?VEM2OXlzUUoyTitMSFR2YWRSdzlQdTlIQk1jT2JYSE5pS2lFYWZEelI5Z2tX?=
 =?utf-8?B?amJaN29jSUpyRjhWVEpvM1IwaXBXR0R0UWttSnd6azFnbnVod2Z3dU1GU0Ry?=
 =?utf-8?B?a3RoOC9WV0pnaTBrdFdaNHVEb1dkZHNWTVZTME0wQ0Z1ZzlmVGJPQjJGTkd3?=
 =?utf-8?B?bWlJbzdxTFZxVW9zNFlmdkd6VzUzWHdEdkkwU01ObnVPYkE5UUZGUUZMUVZB?=
 =?utf-8?B?VnpnR2h2REtFQTA2ZHJNSVczWmhueHlHeGVUc0xieFQxRFJubmtzYk9WL3kr?=
 =?utf-8?B?Q1ZJeEZNbzFqRndQQkUxM2hIRmhaZDNWOGh0RjQ0RVozNmtiZXVTdFVxUGpa?=
 =?utf-8?B?anliZUkwS29QcmxUMm44VGZrUW9jd09TUU9Gamp2T3pUTThWV0FVNDRXakZP?=
 =?utf-8?B?RE92aWxKMzBXak5HdTNWMVFkTkZoL0RoR3RhU01lUlpRbkpFUW9uOUVRZVdo?=
 =?utf-8?B?aHpXMkVlOUdGeHV5UHBCbVZaM1VXSWNZUEZHa1BKUDVFWnpUaXgzaXlHbEQ3?=
 =?utf-8?B?enRWYTVHbFBaemtqK2cvOG9TaEM2aGpuYWVMSmNOTnJSQUlOVjhpeHF5dzhL?=
 =?utf-8?B?a2V3S0RITG81WkFhd3ZKdjFoT3I2VzBBaFFJd2RPYzYwcWVMblNMRktVMUIz?=
 =?utf-8?B?d3lGczFwQWJrNms4ZGUvNkJ5Y3o1M1NqNythdUMzVHBGMGpyanh4azZTbnE2?=
 =?utf-8?B?aEd6aDEzZnBFZXgxQUUyeXlVd2hPRVVvcXhBQ3lWUU0zVWJhK2Y3WFhBcXFM?=
 =?utf-8?B?eXhzSnVWRlRXV25iWTB1U0xtZ3YwSGJFWFRoVFZjWncxNmMrVzFHQytJRnY0?=
 =?utf-8?B?cWkyRENkcE91T24rSFZWb0hJdXBZM3Z4V1F3VEtLcDVZa2hSNzR6bUo0U1dv?=
 =?utf-8?B?djh0Wk41MFB5ZXh5NkI1QlNRYTUyTVdhQUZoWDRTcTJNemwxOFh0ZHVQNDFn?=
 =?utf-8?B?eCtmYUN4TGVHcmE0bDVPZ2ZKdmtNL2U3Q1d3MXRpaHNyd293aUczMGJQUk5k?=
 =?utf-8?B?d2lIRG15UHVsQ1hXMHd0VTZpck5vbHdrVnJZYndRazl2SFU5Z0xHdy9SQkFy?=
 =?utf-8?B?WjlpTDA5QUgrWUtlMzYyMXVsQTZKWlpndGQzL3R4N3BXT2l4ZnlkR3VwZkgw?=
 =?utf-8?B?dUxWN2w3TzJQVTVJV2l5MTBxUEVYN2ROR3ZBTkt2Z1ZRUU4xY2RZMzN1ei94?=
 =?utf-8?B?S3hJd2duRXFldlJSeWovY1dWdU9jTkh1SmZuYndpRHdwUkpFMHptM21IU095?=
 =?utf-8?B?YlVWL1ZEcnlGZnpRMzRYbG9BN1lpbzdubnByVk5NdVdLbmJrMVFqNm5pQllK?=
 =?utf-8?B?YWw5MVU1T2ZTeHo1cVhjVjVyM2hkb2FYSDUzc0JJTUJXd2RocG45VkFTYVpM?=
 =?utf-8?B?Y1Z1TjNRTmd4MG15YkJqUXg0QS96b3FkYjk1R2hNak5JNmMvRjZWSHNsSHFr?=
 =?utf-8?B?U0xoZzFVYUFYelVqYUQwck9nSjR3V25tUEc1a2VtTkJ4cVFyQ0JMK1lDd2lZ?=
 =?utf-8?B?Ri9MbHloS3RRTXQxeFVzUE83TnZZS1E1YlpXQ3RpMzlHSHhRL1djbWkvV2p0?=
 =?utf-8?B?MWxubUYwRGhkdjZVVTBZbTdwZlkxOHF3WUhUZEF0TURXdHk4S1g3UURNN2NX?=
 =?utf-8?B?UkZCWEVzK0Fub0w5V29ZMWNGa0kwOTdSMTlwTW9lSnFTNEQySnFGcWtaMVhG?=
 =?utf-8?B?QXdMUW9HNVJnSjluT2JiWWd0emd5cTRPcng4ZnRIVCtCajlYZndlOVdVdW4x?=
 =?utf-8?B?bVpDR1g2YW1WY0xyd2xEQWlsZmx6VUwvYXhTTEdUTGlPOVUvRm9CVHlYVFgv?=
 =?utf-8?B?ZUpUOTJ2Ny84cThmVHd4SW9ZVGNNSStWdHhtVXRxQmRyVjBwSDJJaEVZbnZr?=
 =?utf-8?B?UXFFUmdIdmV3PT0=?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:16:36.5306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8517f98e-54d4-43a3-2228-08ddea553cd5
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_121641_932661_7D2EF77B 
X-CRM114-Status: GOOD (  16.88  )
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

Current implementation uses `CDNS_UART_REGISTER_SPACE(0x1000)`
for request_mem_region() and ioremap() in cdns_uart_request_port() API.

The cadence/xilinx IP has register space defined from offset 0x0 to 0x48.
It also mentions that the register map is defined as [6:0]. So, the upper
region may/maynot be used based on the IP integration.

In Axiado AX3000 SoC two UART instances are defined
0x100 apart. That is creating issue in some other instance due to overlap
with addresses.

Since, this address space is already being defined in the
devicetree, use the same when requesting the register space.

Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
- Link to v3: https://lore.kernel.org/r/20250824-xilinx-uartps-reg-size-v3-1-8687f64a72de@axiado.com

Changes in v3:
- move Fixes: tag before Acked-by (Greg)
- Link to v2: https://lore.kernel.org/r/20250819-xilinx-uartps-reg-size-v1-1-0fb7341023fb@axiado.com

Changes in v2:
- Add fixes tag in commit msg
- Link to v1: https://lore.kernel.org/r/20250822-xilinx-uartps-reg-size-v1-1-78a5c63cb6df@axiado.com
---

---
 drivers/tty/serial/xilinx_uartps.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index fe457bf1e15bb4fc77a5c7de2aea8bfbdbaa643a..a66b44d21fba2558d0b2a62864d86d3b73152e26 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -33,7 +33,6 @@
 #define CDNS_UART_MINOR		0	/* works best with devtmpfs */
 #define CDNS_UART_NR_PORTS	16
 #define CDNS_UART_FIFO_SIZE	64	/* FIFO size */
-#define CDNS_UART_REGISTER_SPACE	0x1000
 #define TX_TIMEOUT		500000
 
 /* Rx Trigger level */
@@ -1098,15 +1097,15 @@ static int cdns_uart_verify_port(struct uart_port *port,
  */
 static int cdns_uart_request_port(struct uart_port *port)
 {
-	if (!request_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE,
+	if (!request_mem_region(port->mapbase, port->mapsize,
 					 CDNS_UART_NAME)) {
 		return -ENOMEM;
 	}
 
-	port->membase = ioremap(port->mapbase, CDNS_UART_REGISTER_SPACE);
+	port->membase = ioremap(port->mapbase, port->mapsize);
 	if (!port->membase) {
 		dev_err(port->dev, "Unable to map registers\n");
-		release_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE);
+		release_mem_region(port->mapbase, port->mapsize);
 		return -ENOMEM;
 	}
 	return 0;
@@ -1121,7 +1120,7 @@ static int cdns_uart_request_port(struct uart_port *port)
  */
 static void cdns_uart_release_port(struct uart_port *port)
 {
-	release_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE);
+	release_mem_region(port->mapbase, port->mapsize);
 	iounmap(port->membase);
 	port->membase = NULL;
 }
@@ -1780,6 +1779,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	 * and triggers invocation of the config_port() entry point.
 	 */
 	port->mapbase = res->start;
+	port->mapsize = resource_size(res);
 	port->irq = irq;
 	port->dev = &pdev->dev;
 	port->uartclk = clk_get_rate(cdns_uart_data->uartclk);

---
base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
change-id: 20250813-xilinx-uartps-reg-size-c3be67d88b7c

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


