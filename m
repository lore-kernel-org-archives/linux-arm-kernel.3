Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B172DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JTRNA5NCsV3w38QEBtEYPTyU2LIGhefbfBunxHUQiM=; b=PA8nsBaTkgavyI6AT9BdWQ63aG
	s11YTGr+Qh0T+kngqTLwqm7CTk3KIINwu1QGdRYI99XFQR3gahDcVsAhUzyrJkmzbLzWmKCdjY1I1
	qPmM/ws2DQKYkdq9ZTuD3HrI4EdVmsCBLL9Jn3E1Wm01JvbcSILIWcXDq0L57JQ/Vy7Fu9cmy8vaN
	VPqPtNevFZwbLVlYbdg3U878nQ3qz/8E2fITRHP+Xfpps/YcT1kHRXnZhcOe5dBcFK/RlcWlhFYDZ
	dzvh1RcyLJ9R12cuIInsFrqUa5zhzTd53BDOnxOhs4d+7pVsikEy5WTv9J0w6+dV2yiAc3FAT7mXe
	CJjko4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJoX-00000003S6N-1ZJH;
	Tue, 22 Jul 2025 20:42:17 +0000
Received: from mail-bn7nam10on20703.outbound.protection.outlook.com ([2a01:111:f403:2009::703] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJPO-00000003PNV-1jLm;
	Tue, 22 Jul 2025 20:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCAKPrAG8nz6/Iip588L1MtsuCnc3yUopW9xNHIkDDqbOTE/jaHgAPNOIPg4oTo6Lr/RIeUIroa1FMmI8XGlr+hV+Nut0laaRsxd+hxc3QZ2Sdqr7Q7xUfqqjkLOBEbz4M/wLm6zaxFQWQRMF/wH2IgqEGOZqIBQ3w8eCyVCI1SgjeWK5ofZEdvVKmWgffadrLVAwf/R/H3JepI1mhHzwG0SU/DN6exQMmZYpmkuUeC5+PFZ6uqm9okxgcC7GAS4w7EWD3t7nWJnUB7J7BbgTnuafkvZTs4X77cptNaq60pl3ZhAkvfo/jjwmYZLjwJSZpbTJe/g7sGeMC/m08rYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JTRNA5NCsV3w38QEBtEYPTyU2LIGhefbfBunxHUQiM=;
 b=JPpj8H0LfIEcMlNs5rob3lMqNGLVJeA5xaqqaLDWKztBOfBR+b88ejDMZTv+g8uDZ5Bkft3vVGA13e0WtLW85c/jtWL3bNOKW3U1dGwmkQXTJNfu3IFOto8Ku0Rio8R8Hw56QgotP7Np+cLWwwu3VqU5+LiB9iBFPdTldzMzZySm0R/8GeCqXVebkKxeuZp8iFnKUbmzSIxEqTgLam9BxIsl4iwMy+l6qaDIHl+/gEQVo3zk6BKJGwhzmeL7pWTJ+NJK2ZHvBgrAU11VqHsRMV5HzkxCzYIxpUronOtNBfhrvk5TjJSQnZEw0+5byeg0zdDOCyegQMzonEoo+cWUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JTRNA5NCsV3w38QEBtEYPTyU2LIGhefbfBunxHUQiM=;
 b=s4lAdIDfJVQ1FdK6/UR19/yYaNLQZmO+xHImPIi6pd2oLnqO/y4AJzmr6fxjnP+/JXdooJfCVYyYFbdNEhgVLwqTNzg/TpsGN0YUoMAYRrhpvSnhhcUkYnE1ENHt91r9vYw3WSplRisbI6PF6oeWOlhPdXRZrKNmsM8VpG7d8Ug+52GXYrpennS/mBrmAfT17RPgZ4uUCJ2RMBekJ5j7Wd44Oz9YUes25meu0svKgVA6aHiD6kZpcpNuu+Da3g+j8vyN6IKy9egUmbQpI3y81Zg8KFxZ8sNOHxWpPkmIcTbWEPAFU8DjnnreyeJfnw1uMWCgD4FBNP2bvkryjsgldQ==
Received: from CH0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:b0::26)
 by IA3PR18MB6381.namprd18.prod.outlook.com (2603:10b6:208:532::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:13 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::95) by CH0PR03CA0021.outlook.office365.com
 (2603:10b6:610:b0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:12 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:33 -0700
Subject: [PATCH v6 05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-5-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=hshah@axiado.com;
 h=from:subject:message-id; bh=mDq98u5ucUqGM+XsQxf30xItWh1DXiHfxPJ4anYYEps=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GDUd+LtFbhpage0iKMVliXNEd671ioifAZZ
 3QitCGrhdqJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xgwAKCRDxWHMRoTLV
 +7r+C/9/lQS3/RYWjo0YR0rG4h7D3KDg1komUZcZ70LFDPruNU3siS/gQEn/g81XaMna+2wjDSH
 OIWXYI33v/mAh4GxRGxahuRnXQQmd/7II+D45SjuIr3pinCeADSM4G4XVjoM5UQn0ZkLomBOnOi
 3RsLHQZzxNxwOaN5sfmmAQKJNGcsjFhZxs+1B+fWY8fmfXOb7SH/jv7eVurgLv/66eI/I3fKcel
 wXnxmXe5DLk6NYGbeXJHYxWh932VXAlSw7G8VXoI0SaKsjnjV15076+PZSqG1icD662V+mqyO/z
 3v/wj2/0mYNKNgWF1vxnS61Tq6Cnb7uo8BJ823bzujKkZUOel5LErZcpa/JPSLwDxKPsGiyDp2w
 FXObxkGfvDA6mZRCXi1sjjSPS+iQew4m9/aUeN+LLocuR4/qETOFCx2ncTIB4Fh885iXIavu23F
 bjvAP8vxzPDoLMCqi+GwZPQJLtzxM5ISd+L4sIa6+FQEZEV0JIj8vN9WsuJ9RBY5BnFds=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|IA3PR18MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d601ba-6958-4298-0d11-08ddc95c9b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2QvUXpsSXRDRkY4dGRyRWEvWU0zNTRhd0dBUlNlY0xiVDZTaUtXU3ZBUjFz?=
 =?utf-8?B?bXFKNzVUNUQ0VHZ6MXZhWkZkY0ptREs2NTI5bitBamlVZGF4bk13OGJvcUth?=
 =?utf-8?B?aStkKzROVzhrQlFDQnFjRExsaEtHM0pnVlVvbTF1by9BUUdWRldiL0ZTOTB0?=
 =?utf-8?B?ZTRXbDdFa01tVUp6cXFoMk91OEs4UXRaeVBEYjN0bXNKaklLeTJaT1dMZzlT?=
 =?utf-8?B?ZEVjcFBzYjhTa1I0dUFJZGdNMDNlNnBHSitjSlN4N0pzbDRRQUpFeStTdXEx?=
 =?utf-8?B?ZVFQUjJFSEl3NzlvcGNwVjh3ODdNeXJTLzlGWFQ5c0FZREwxYzlIMzFxbW9E?=
 =?utf-8?B?VE9pWEgwUlFac0h1QjJPVHBFVWRxZmpKWjB5SjR4bXNJTzJzdGNSTlVsdlRw?=
 =?utf-8?B?MkMxV1o3TDlnc24rL0p1bTlCWHl1MEtKRDUrSDlQc2NERnZoK0pUWks5RlZh?=
 =?utf-8?B?d1ZkR1luUVhJTnV5bGdYVGZBMmxOQ0UyMXdxd2VqY09Mc1FtQUFvS2ZKeEE5?=
 =?utf-8?B?Vm1jSlJ3N3k3QVRxM2dTb2VkcUQrVk0yelNESXRYdndydjZZSVZTdUJpbWhU?=
 =?utf-8?B?eDVDMDhHQUQ1cS9RdDVpTG9HeDJCMmIyM1REOFVBMENmbXJ2QnNKb0l4MVFJ?=
 =?utf-8?B?U0c2SW0ySG1ITXFOaUVWVWtPcDN1MTZ2WW5yc05UU255MHA5cFA2NEdTUktC?=
 =?utf-8?B?ZHZ4WWVQV1Bvam4yblhLUmdLT1JneHM0Z0VaZEJmWnAwREFpNjhOQnErZ0JS?=
 =?utf-8?B?dVJTdHoxc1RtWkN3alczMVJwQU1KUGRDc1U2OHZnVThHV1NES0x4U2RFZkpI?=
 =?utf-8?B?ZVlKZU5OK2ZxSGxTU2l3d0ErMzJWM0xDMDBFOGsxR3BJRU5uWDB0MWdLM0Qw?=
 =?utf-8?B?UkxqdGdpcDV1WXNOWjkwNTVxZ3ZsOHNmQ0xWeGw3Vk9HKzkwbnhlbUFRTm9P?=
 =?utf-8?B?bkFlZ2xkWHlRS1RncjVLWklqdVZnSElzNzBtV3pBbnBxazJ4OG1EUEpoVURo?=
 =?utf-8?B?V3l1dWhCWGtYbGgzWmNpY1Z6ZlZMTTRkMkEyWjdFclAyVGMwaHd5NHFMeld3?=
 =?utf-8?B?NGdYQThOejlOWkdrL2tSU2lEdzcwNmF0QWwvS1dmMXlMWUJTZVlPcFE2MC85?=
 =?utf-8?B?cmlEcEw4d2oyWFNqQ0FEZnUrQ0FiOUl3QU1xeFNqZHFpVlQ3aDJjQlRmU212?=
 =?utf-8?B?Q0c1QUswZlJISVpNWFNWejVrYnBoRmR1QVZVSGpuVW00a3pvTzBMSjRmYVh6?=
 =?utf-8?B?M3BpcE1JQ3pYb1FrS0toWm42anNtT0svc0x3Rk81ZUVJSnBTUzVqWCtieG43?=
 =?utf-8?B?cVNtOUxpMXkydkVtNDJYQkxNc0xHWUwzcXgvZ0kwRys3QUdQUHpPUFFQbG5r?=
 =?utf-8?B?TjliMHc3RXFUbVRIRHB2Z0Z6L2tEQ2s0d1drM1ExTFlkRDRwRlVlNFdHTmtq?=
 =?utf-8?B?UDI0QVBUaXJtdy9QczdPdkVaMnFYVHdITGpTbEpVV2tNM2MwTTJEa2xZZFJK?=
 =?utf-8?B?dHNKN0RCMGVxWGJ4bmp5M3NvVDY1T2hkeEV1R25uempEVnJCNUMwbWtYUEFs?=
 =?utf-8?B?eHRVRHpNQitpaGEyQmJGRVpydGdSL3p3KzE3Q1hGb2RFbHlrQVZuUWtPc0lz?=
 =?utf-8?B?VFQvdzRYejlTekdMU3E5OG8vbU1teDZOMzl1NlpRUmpvWHhueERpWnZtNGQx?=
 =?utf-8?B?NEhRM0R2dTZ6dE1ZNHovRlJjMzludUJRQzFJOG5uaWg4RXpVaU1kTjZweTBL?=
 =?utf-8?B?UWZFZTZXODFzUTlJTHk0bU5wUjNGY3pZS1ZKd2swdFUvUHRoTjFndDZnc08w?=
 =?utf-8?B?c1M0MlBuS0h5dzNmVE5wQnJMVzI2Tzc5d0VpdFNQNzhrcnlDRHFpU1g4N0Z1?=
 =?utf-8?B?Zy9CUkhqbnJpTkhtM0tPTHhETnA2OUlnQUNsMVkvRTBaNzdEZTIxWkJjVXJV?=
 =?utf-8?B?ZDVqdkd2Y20vQ0N2TEVuSy9INmF3WlY1OVQwaEJPR3FjNU5YNkx5dDJVbTNI?=
 =?utf-8?B?cXJsQnFnWGpNdWJBUm5iUm5QNDZEbjJ5djhxbG1uZ2dqQm8vSWI3d2ZvaTNT?=
 =?utf-8?B?Rk5wZTZwRjRmZHhFN3VhbzRQV3gyb0VRZm5CUT09?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:12.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d601ba-6958-4298-0d11-08ddc95c9b04
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_131618_458385_B4D8500C 
X-CRM114-Status: UNSURE (   9.72  )
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

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24c444e2d81e0156fb01a89207ee2a..9d3e5c1d8502272f8b08f7d59f18d5e6be25d891 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -16,9 +16,10 @@ properties:
         items:
           - const: xlnx,xuartps
           - const: cdns,uart-r1p8
-      - description: UART controller for Zynq Ultrascale+ MPSoC
-        items:
-          - const: xlnx,zynqmp-uart
+      - items:
+          - enum:
+              - axiado,ax3000-uart
+              - xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
 
   reg:

-- 
2.25.1


