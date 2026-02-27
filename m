Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1F4FD9E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=; b=PfOW9Y7M++NVhohFciC5MsJXdl
	C8FopLYtbkU71A8rGnPtl5dmMhvUk8ZhkpBEiqbNK4ZuxJT/8PIjLnxCCFggFqACy3sSdzH5Vxqjq
	yTZ1A1kg59eQpbr3MWHo8Cv5ZyQTSfqte1nO5zl8OP2tD2QoDrJe5GGPz4vHufcWPYy1h8tjViwtV
	QGN1C4x7VOipDrJO1rGf18sdlz14kz5zW1xQ907GkMMYmEkE6N3gJf4FTfUe4fp/DMauhNogbNGvv
	fGnrtp8YAfsHdtmxtbjNb3MMBkKb3daerjfMSQA9LmFDO5WYy5bShU1/2OGtaKA8KxeDFVkDecqgL
	bN8cfU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlle-00000007Qss-1gHS;
	Fri, 27 Feb 2026 00:31:42 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvllZ-00000007Qrq-27Or
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 00:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnJsCw99kGkH+hw4BQuqPkQxKEiXOA2mtGqViYXWMDbCjxg0sbadJAsaMArMZfg3EYgkH8rAne03YYhV93WB0luGW1dJWWp/aYSICrFEFCUOku03ofU7R91BCSuzTwZrrq7Hhe+oUI7ECvZO0/NZpL0wIDg+NrnUk/cp6cfvhvU7Gg25oYOn0lT1FwpH0VTKfC10e/0QPWDLxx86apv1INYP04GZ5mM2BnxBKoX2kIiE0k1wofkKXx/zb3QzzER8nQ2JnR0f4UQGzwDWw6wxH4NKopoTumA6ZOgPUv5DPYZ8ahcNCptiWbEFEWq00BUg4cCVWaYnjDh90cc7gF2rsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=;
 b=FdTTuu+7ShCLidEI63UjncZ51HlT9Ray443UCcSdgGUpoFsZp7kXMqeS2GQmQjE9Y2kgcACVIKhIuIQOmEYxduYsR7KNeU6tw5df3GVf5Cn+TayFEVRMxP+m8yGg29lVssutvxIVg2xKmgvWEosuwmyxgqrlszoTnyMAYqoGb1oW0zJoyylcjz8Z1HYZtExwDoI6ToMNQ+SaX44rmjoXsfNSw0LEQsrOY2ajzzFwUNvpt9+lEHGlthACIj9knEKcIWcWuOIcElr+40Oh6uoE7ue6+o00rrwYiNqezV7Bie+3fJLqm7m5ktXIpnrTZWinTuq2gULZY04hsbc/bNnEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=;
 b=Q7ikQnkg1ki7ssAS8K2cw7ZOPki21oPJ5v81FEVGccuk9pRyEUrQ9/tenafjZV6LNX0HoB+QrocKwS2KCTjkA5JdWfjwd7O/+Bi3HzUKPHRjR1ku/nUztq0qMEv4RKJmFMAcC4JrjCrGuifkILYjCijmppjiVdt1xAZoL3s5+t/uI3KkhvgA8+aS+rqnu7AMxfQUzaf+LMiqr7ltMmKZwEOz6WvEcgYwA5GK5dfrqsHpWbf8bgybLRrsIrWb5Bbef5dWYZX+PR7lji7M43mLiKEduKeNCQ4A61HmHWpBzlMccWRlLJ6iFQ6S9ge/iGLYK2kyjc0DYVbaOhXzVpaFKg==
Received: from SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::19)
 by SA1PR18MB5904.namprd18.prod.outlook.com (2603:10b6:806:3ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 00:31:30 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f0) by SJ0P220CA0015.outlook.office365.com
 (2603:10b6:a03:41b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Fri,
 27 Feb 2026 00:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 00:31:30 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id F30304186B59;
	Thu, 26 Feb 2026 16:31:28 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Thu, 26 Feb 2026 16:31:26 -0800
Subject: [PATCH v3 1/2] arm64: dts: axiado: Use lowercase hex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-1-a3b095989823@axiado.com>
References: <20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com>
In-Reply-To: <20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Axiado Reviewers <linux-maintainer@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=BGjstTWXM8EwzVmreSW0TuWco+4YYKACGi0r3fNb8xU=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBpoOXhTSUc6bF2/Nsk5beF58Rbo+UWFWI8L1KvX
 SRK+7oc9MqJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaDl4QAKCRD8pK92wMW6
 zxdoD/0dTxHQ6S8r5BjcZk0+//6gu8AHkfnQD8w9O05Odh+Z3Fx3vj7bzXTZnbJeXODnYee/4Pe
 9bj4yvtLRzrvvSkwMy8d6tQPOQJA2jvHT/uiziR4aKb4jmQSnxlY3BYVprd8p58Qtg8Nnl96hFf
 sGv/tNflkGjzf8TN0jSBrPnVinQqcbVKBNUqvINe8/q76W4KPjjwvAHZWxSEYCBRJFwJs2C49wj
 pI1IUGuU6FNW/j85OE9yeEQvfLfqQFkuyJsZ9vmmoe6aAiiWHDPY4LZszVzSaG/lkHSNi2F9J9n
 +HsbE8jrii3O3Ykv8irfjgVswNQSCErGZbO+00kdq4d7bjtkglTsMnQ/0t4pWM5XaU43Fc3t8Cj
 mYZYCOW7iEJzg9broKnTLfy+sji798e5FMok94iYqZqYk//zU5kuxc85Dk6OFBO5Ova855ycZh1
 9bpaV+T2zL+qJE2tykdb9Qi7qOTecEFnB17itLQEEcCPwHK6MhUfy2BlVf1rrHRnjxTlgnBMOpw
 LOYX4qxwIsCijuXeIB32h3Qakzrp8e+hGwK2vD2m3jMu8YU7v+QpRAEQji7/i0D+nr5kmrTDTfz
 01RNgWR9lq1ZHtLMSaB3tHblKetbqUwnr3hQgAlnvquRsHchZEOqowVK33LoF6RHl5DnhDVxwq/
 qZcEbEJ41gOEG1w==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA1PR18MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ab0484-8920-4304-febb-08de75978d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: cQiubVSgZSfwmKJOlpKRcDo9htHMXU0s2cklpNZ9KkXMzW9uA2txrV8bwRWFZz/Jugxm/fnXhyYB721NLaaY0obR1iHJAURXsPexZ8jFPTouUON94DgF0Dzg1BBOsH+7QWX+H0pOsHMrcdeJ1Tk+G7ucHUzTN2hsA3ESkZgvpCVpmewQzZ9VrcVIk/5VuR3H0yxHDGhvSN0IEgLldkIL8CUUndWxV71BXWjxUNCI+dzIF7VmXVqSFBSoWn4m2wzT8p1c0dpeHhsORYUOPWGP/4VAlac52l29x+6RsHydVfoZTor0M0zwmX5iM7Yt80q5TVc5QknH9zviMhEXmI5Osjc1hrDRwaVfq+/pkho4OW5ng6tm5e+aqOt/EUMXYfTpLTGqH25c30+5vvp8wphLxYLwYvbUe/i+myDAPFoN8EdyWaBRI5TNmxGpt1jy1RucgkAhEDCgEgSmU84NYRufXFNImVDWS3tUc4jWoUKeV5sTWiXjElZYCwSvVReo4/XUk0lrzUviTUuznXSfCq3DINNDuZkDSf3xM7tDSrX/Tt+LlrKdxiEEM6d5LdpwRDjV3H7FiLIL7gweCkJjAOCQK0Wy6MbM09MvMo0O+TKwoHpGBpcm8pcrtPxiJtpoAVXJ0zV3wYrwY9Lqp3ws2Ds/VWg/V7AjTrUW8hVCuooa8ZnX/MmQbP6F8IsVUunxVXjeLMD7bdVha/39gsS8jWpiv1AHj3Pw9r4J5XB+JS5jDNlyBnHexa9FLpSb0j8m+AXztWdBbNvxEeJQQkUWBwgBCAfycc+GiwtwDQr1eOHtyBQttFk5X/DnRTlLTuaTI6Rm
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +uQGRvPuVp0Romfq9xmGbdXXQsRbyAFCv1/zK4CzYriQiihtHoLSI+aOHrFlJL/Op+7FN0HPtLtWD/+ex9Z3wrGHL85QALPR4WPDrgsoNTKua1klvWH2qVjwwk9CtSmY0009ZpG8cl0JN5f4JC0cBBjOLXFTwhSf3TnKo1Oj5RZsSIZky4yfXj9MGkMxwEQb9w91zawGxa8z+UDWe5dPqdUqBv4mIS+bGzvGFQ4iymWu91VZuAAamh1FhqJ30LxSntnF7weVHQtchMPB1k3BXy1pYaQFyMw60Sp/vQzt2YfCl+11yo2t1n8Ggmai3fk2muT/Z7/RYEUziKih7JMGdnwshGqQRga2EpzvIWuTW6+Y1pQ7t7P2unsNaelsQDrWl0lykySWBcLtJRkfH+7BxSe09/rXMNtG3rXf3b1WLMsFJEbk+pTYOcOwITqzbQPq
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:31:30.1240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ab0484-8920-4304-febb-08de75978d27
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB5904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_163137_561946_89F8A682 
X-CRM114-Status: GOOD (  10.23  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd..d515f3141529 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -480,7 +480,7 @@ uart0: serial@80520000 {
 
 		uart1: serial@805a0000 {
 			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
-			reg = <0x00 0x805A0000 0x00 0x100>;
+			reg = <0x00 0x805a0000 0x00 0x100>;
 			interrupt-parent = <&gic500>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "uart_clk", "pclk";

-- 
2.34.1


