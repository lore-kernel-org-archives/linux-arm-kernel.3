Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F94CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tydq5bl4Lid7dHHgeyO1M936S9mVL9K3D2tiHZQ1bf0=; b=u4tVqrkvYN8ZKdO9XaZVmTt6/c
	du9w/8wm4dvfw3JjLPBV5LpmMI6HDC1gz9IARd+HPxhgmAaf3dtWR5s/UQhNsucyMBv9Uw7UsuAbo
	Y1yspUjZkrRSz5MQesHU488YFvEvjrswTbcFWeILo4GKOlSx1UK25tfrX+LgcErfQr+7lAkOQMV1Z
	8XHeQt3geRCGb+ssr1lu/y24scAmINx1JHWsrMXLsfTIflRm1f3qy3nxq3aSi/Ml0IrLDpVhcHCb/
	bQIqZLki1hQmgzUjZW3sJ0UojafSsaXJPkzMly4tcnCybwEZ5i+4PO/hueJ7pv/q3QembxZZKXcs4
	S7K5HyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyWo-00000007ZlA-3QoO;
	Fri, 29 May 2026 14:49:38 +0000
Received: from mail-westus3azon11010065.outbound.protection.outlook.com ([52.101.201.65] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyWm-00000007ZkK-2swX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4Nzox21HTBmqEVwHb6wO0BX9tpu171ESHkvSxRCSUVye2Dx8v2ak6tFaZ1DjTsRHVFHke7fOzP77eEkL6aNM5X1Op3sMwBLe1FlVcbCaA1uRJvC06yXGSvWhVEZRGRpoCVuD6l1bWL3CTUgsPueNj6cD+jHOe+A4VIfpwP+rxTu/dwMuRX0HD7Q+Oyamv83j+Hzo7R9zqzZcA4hu4wt+vGDkQKpNVkuLcz75e02diK5N+yOgoHNXUEO46H9ZJUw+P+ZppmcjhuxbHNeBRHoULByXdgGvthljFybJChicRI5j8M6i27F8caiGipT8RdCn39jvjTLKvIfZY/t4UsOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tydq5bl4Lid7dHHgeyO1M936S9mVL9K3D2tiHZQ1bf0=;
 b=C/mbgOJ5Ee5t53GGNqsVmbv517bsZbetpq9pjqvZbtW6GwaHJsJJPu7NvefLshCxXH4Po2HJ1Zm+x3XpWEYipozxH8VAUAr3tfRG/wCX5U3cBzLZ2nM8o51yjvY/k/HVM/n7JZIIRFlHLBtlTD8z+zko7ZraE7AT/Lft8WcKWDxd6TF9dHnaFYlaO4t6yD7xyck67SpxKeo6rjq1fMiqNbI4vga73T948INdn/jy6g2UxOdJvFCcXr0yzqL3MtNNk73z0KwgpJNSsB1d0N23Sm+1OGFXZVc/rRqD2bFMLGHzuHBQKeRC+UYIESmhbZkeGnFovlTqaUOhwwWt3G/7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tydq5bl4Lid7dHHgeyO1M936S9mVL9K3D2tiHZQ1bf0=;
 b=sdNQmRJYr3KMcU6Go9LgH4LaVP76xzIEHYFsTR82+TrEcc4jo9VXsapbffTlI9uqq/+m8D+3GpuBVe7zqiBDTjt6wuResCqkavXLIhLGr49oGpEoav8lCGfz0sQ3qw3g/IfIPwdBixFPIJGDvalxCZeTwiR79Oe4Q8GW24Rbxeg=
Received: from BL1PR13CA0301.namprd13.prod.outlook.com (2603:10b6:208:2c1::6)
 by SN7PR10MB6332.namprd10.prod.outlook.com (2603:10b6:806:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:49:31 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::77) by BL1PR13CA0301.outlook.office365.com
 (2603:10b6:208:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Fri, 29
 May 2026 14:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:49:30 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:49:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:49:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 09:49:17 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TEnHij3830103;
	Fri, 29 May 2026 09:49:17 -0500
Date: Fri, 29 May 2026 09:49:17 -0500
From: Nishanth Menon <nm@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
	Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI0
Message-ID: <20260529144917.wp46oj6z3clarvft@blabber>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SN7PR10MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a114a4d-e959-48bb-d5b4-08debd917d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ounNTAm80SXYdx9Bs//JfJKrShwcYF1WdlNIHU7neONMjwlfUNMAtl5BIeN0GA2+RMjX8/yN8Qu4nv2fSiHUhi2nm7yTuGlW2jfP22k5ybfSFZVXIrRf3+eOeoW+TsyU+y5FDVcxUVGitQeuCrSt+dQkGk22Bg21z+APTwqKMsMx9GaUn1fb4Gs60LvMSpvQ7DezLd6U8vPDLDx5hJSvclHBNa502iI1jPUogIWGevbLVc9ifDubYpMdN/5vVguqukfhn3cCjc5PjRhtFKbXhLcAALux2OkuA9g9uYQDXwrivfaJMt7tOqZ8rfgEve+UK/4e8JD9OIkX61WM6yGysFeul1dpRtcC6sFqRIHBJerYMr4uUrJgcXB4iaLB72CumVK4tfgXHsjuE24AFn63SDToLjirwfdEgMdZvQ7yoHVjRrVDhlHNoafoEvKimsfBJvfEn+/wd/5UUw0axo3KL+J0HyYnjEX4QmdohfI369EHiki0a0Luq+W+ve8r7vFz3dU5LA9NeLFcND9mld18cCsVI5NnX+nTbjuAYId98NDEIApvdjlUr0cyJrKgCs3cBuYW+d9MLT9juAfXN9VGy50Gd56sUIllBOGfwPzTkrKa71QTI3kxKnDfOAiE9iCNlWiVK8tRigtrOZg2g/6foK5++VqQtsp8zvkhKnS9JwnslwWqIcX+C0yLatMIkvDX
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m2P119DPJbhu+Q5dDXhWImvhKLD+QLXMqqQelVrUKZvwkYiipJzbvMdhMEB98OWMCZXxbU4nn71s+Uqqwaip13ccOfU4wUeRgh+x7a4r/IaPEf8jJFyx3RQ/1wurBtgbP9IIiG3B3nLY1D7RnhOyX1axYkvgOR0VepsV6wY/46NWww/MgttCSP3WqPt9lpBYJ6NjsJf3EKIHbmBm+92OMMlij4MoV541CqJD7ni6dLpXr+ULnlAPnucVbkWFTXYZbBq4T6YmT5zdBiUVASC9nP7QO3Ne8tjHl5Mjr4JnB3mHuICoRw2Oorp5reh9mlHKVkAAysefKFeJXTlijIepmn/2IP0lfbIj7hf8YKr0DgKqq1PNMuKJ+RU0ZaCBNx2NaXmuGfx9/OpjPGSb2z+f+bbMLbycEUKiBSG0clCet7TsqOnOr+Q5hCSzG10XxOHV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:49:30.1609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a114a4d-e959-48bb-d5b4-08debd917d46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074936_728955_20F9561E 
X-CRM114-Status: UNSURE (   7.73  )
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

On 06:46-20260515, Jai Luthra wrote:
[...]

> +&main_i2c2 {
> +	status = "okay";
Comes last.. please follow:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n117

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c2_pins_default>;
> +	clock-frequency = <400000>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

