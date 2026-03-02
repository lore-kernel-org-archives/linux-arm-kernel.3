Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919BAEB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=; b=SZouL+mHyCZ4VmC1TyiDomraEq
	CZJncWNyllIjzEAspF+KOpThgyVU6EINdidvF3E3w/aBx/CZtiikydHHjYuQ/0+VEsm3Yy5/4ICBC
	ktFLbnZi/xCK2ANtzIDW+pXAXOE+cG3MRtXZNwj0YrldRioCJ3oLunefnPn9r4IwFuPui5+01TO+y
	VQfcnHWzKZc8XQSXoWHBwLA257PTN6MGryhWuWhRecjTD4x6XURhCek8xTJS1XR33IIS8hy2VF1td
	gyiPRPUq3mR9J4hQ2x6tSwXlSjZAMfIBqH6L223/hoknRAzoQu399pCrXVy3QwydQakNr4xKENKBj
	JHz1SUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBK8-0000000E4jz-1XNU;
	Mon, 02 Mar 2026 22:01:08 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBK4-0000000E4j0-1eLV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+J9vpcRqs8x324JC8ucgcvyg9GSkXsY7E0O0vdAFNoBf42f2TjRSEpKjxfiMGkStbmO04zln1m+JBwNE/WtBLVCJjAg/CvXE04Nnjhuvq5rEvhcqgruA4k7n7En07/amNIDzO8GuvT/gmO+OGDYtL4IKqqgZ88jj6m9Xwi8aHHRGKrrtg7IrisM03tjP+unpz/XVBcSo3ri6q/dWmjZA6tE9Wc9OTBzSd2ltJtzsDzFpjTm6CgZJrdeijJtXauR0oPq5a+YlnyNrmTpqNlubr6eZ5LAY8s6WdwvSKeZ/YUHAouc8ZBDTeMgN4N8KOMzFO1BXQeb0/MqwkAY3XjOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=;
 b=vhzEE+SNoj2m6olTBPiIRAOKP/xGiIpWiI8Rnb9LdKy2ZUW5iH5puUg13vRFUjXUWwZWZGL9X3fkanjZ4tzBRP9sasqt1XDEgTH0mo/WvoJdpXB8w9lbBcClSYb13T/ftLK8CK4DowLZkEfMVHVBZmp1dkVR3p5MD+GC7OAKx+zH9u2svO/1GTKAU7DqaAatxRyfZ28HRbmc0Vbr216ln0s435JJHFTF9yEZoqkj0T4ewQZz+HoELkoW5krnkXOIAIWf+n40NJotnDsQ7MMC+NQpSlCFbSom13V3hnpMHd7OhM+UZUH5fQ1bRSDn8FTSEbtlLCyU+z678vMZrG+e/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCMLQSYvtIqya9aEyo6BVCUSmqrlsEsojIsJtj/t038=;
 b=oS3W2wUwW7RWhEfkaJx92rygtbzAZK9fmywBTqDXuelKGRHGrQBKPmJ3FWFsuhf8ssSARvLeaCnTdSH5bDDJuBlyWcR0tXvyOhs/FHXNaKstVtcxe2w6tUpo9s0qletbGbd0PKZ504+A9Iswda5Yd2tsLs5IfF/vPWhzVFD43WtffVdCb4sxIG8psCipC3G5LIT396dsxZdQyiIqQaNGL7hn48K0PqOtwe3JVMoRQz+NnBrZxbWDZjt8eeMTTsoDL2E5UKwNc3lKE9S3xNzXTFasmem/LXH5tN5zSVFdNb34uAuOy4/age3FGoaQamlRanN7yBS6fzAc9PyNnJBsng==
Received: from DM6PR03CA0071.namprd03.prod.outlook.com (2603:10b6:5:100::48)
 by CHAPR18MB927661.namprd18.prod.outlook.com (2603:10b6:610:2f5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.10; Mon, 2 Mar
 2026 22:00:59 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::68) by DM6PR03CA0071.outlook.office365.com
 (2603:10b6:5:100::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 22:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Mon, 2 Mar 2026 22:00:58 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 87A114186B59;
	Mon,  2 Mar 2026 14:00:57 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Mon, 02 Mar 2026 14:00:39 -0800
Subject: [PATCH v4 1/2] arm64: dts: axiado: Use lowercase hex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-1-84a5c9df6689@axiado.com>
References: <20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com>
In-Reply-To: <20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com>
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
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBppgiZ3pvV6+iVSJHiTOO6TqhMFWhT4VxTMnJSo
 3bh46WRvpCJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaYImQAKCRD8pK92wMW6
 z+YPD/9Zpm7k7fdhei0QFnVQtYMhQQTVfqmod4+6Aer8pZiTe9tvfarRWNfc6pFSj7E6UXvHafI
 F7XeuVM9Yuj3KW81+IUAi+3b+oEutR6EsbBHKzi8Z8X1+DLETkPmUfZFj80kx7rLesHpfaHcNO/
 h3+YhO41qXhcfP3cERPQYmTZXBSLFSAOwx76F8RK8HxF8uvh5F0GT8TYXGcas1H1+L04Adhg6HK
 SS3+YN1c11K5h48qH/C69OnhroSgsWDRmpRuhJ8VjtGwy2c6TtB+FFv9ppo27XpHRXsXC4Kw5u0
 vtAB9tsVqxGTPJydGj/AmSN9n2karpWrok0R3ixZqCl/2LxSg5+v45Fmnrb2FuROSIECs+EHwEB
 +i94d/DUmpFuGCTISyqrlqD2PyZGTPOs3YAWgxn88GakyOqdubOc69MJNGhDAvVwZT3j96lffbl
 7MpoQCCmCP5XiU+lVYB7Cq8qFBeHfFQ0j+o5YKhwG5x6l3guPUxKmzd5X2yiTEBlrVxQWbnQn5w
 IoTX8X71WnlA1EoxciGCdDAXYt8lqxjA4Fq7ENDg/yjjpkHKu8l+PP5WgyJdXDVbz3ObRQXJ3OK
 YWqfCBp/XGF0nu3r1e3sHD6PrRjcWtIWrHQSN7zLFCQPGgdySX0n3GnlhrYa2B9y/8eNNWwkutx
 6BhDh0MtPCy1InA==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CHAPR18MB927661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6c47fd-40d0-4de3-7def-08de78a72fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: n8BCc/yItMiV5tj+2TfZUpbUtCfimggaoJUx65LHItL022YgEu/twmnRVOA6n/+wdkSQCgacRzBsh8lbis3damNu3Mq6cVFf6zDTqUCPoGIHwbTDYCN2gLLE5f6hWQQRmZkqnouMtgxS3tJ8raBpVWEUEHIajsOVR1zxxbuw8jAKAHId+Pl6YfwvzpGuC8zGSLC3EyRW1We2KXArNqgnT8CxmKTIZK65H+QZWvEapR7utQod4Hm/3kLaEcqpiUyUPwmBdisPyXewIFDfOYUBGit8IBADYnnTpvbzhgjRaEgSTGLkn/BozSsL+GzmK1c6hJY3pAkwl5D4+7DXsAW6diBurFJL4/ZSiKUlVo58T8zxZZwsk53mqfnussCwMI4beZuceT9V2gQuG1gVkc8vvQB39BD2l00tPInXmIhsB5rtMo0oVrWinB/2szguPhYQhh01RPwR24fPO3dF7BW41ckbxDscWi9lmitCECX2zTKqt8LmYVGmjjGWvxcq3vozJhRonT9/PDVFiRz6b6vcZ22ysQTCl1QybQrlj1wxhEAvFkXX2DEsy40cWLbnfGL8BpX6KUR6Rt1d64CtO28FB3RdMpCo18KodneRRUuVhhbvkRRaAYa+0j/doed7nMVR+KnhU4FBLrDtUFdnYYpmoqDQybHMGs6ilRPTNYYLGsB0LRak+CBHmN1x3jGvEblpn9hEXtisI6rE668gPASYrHEltyz6nlEpWUZrblRt8yaUsI7S8dch5skrVO4r5NBKa1pcXlYTYJXJhES3FzeNiot/CoA68bmlK2LpF1KFCI7Eg9xvMIAYk7Fg+x1xyAD0
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vYDYzFmdK80lPXwuppDkDV3kCIv4odvCyIND/uHzVykZRBPHLzrOgAJn2UxeFPpdjSgJAiRyvXOz/Lae14hw6wMAWtlUCH+akoUsdx6WHinl1Nzl+2+SGK/WLYci4sEYFc9/ub8cape9/7MXEYMEbesq2skcd6lI4vrWBZDuP5K/OgEWc+HtVmTpwvBoxKGdgMEuep9NCR+smrNPwIQWOVQbjtDF8pQ+W3yCAPCsKhzancSJUpF/q2risNxQBQ1RD1CmS92F41LdH6BqFM3BYKYsSAZIZx175B4iEHnCrqDD9rleDuCRuUcO/ZdJnv8wlETr1P38Z5N/HUmt4hsAT27g00wicjWRnEyDw09/qnU175MrmuuSZfks3OSWsp5jOeeI4HsOK0YZGmfScQrJl8NeCErzK3al9b1CRFtF7Yh10MRXzcZYiTIrmMWduwM0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:00:58.9390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6c47fd-40d0-4de3-7def-08de78a72fd8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR18MB927661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140104_461880_E71BD940 
X-CRM114-Status: GOOD (  10.59  )
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


