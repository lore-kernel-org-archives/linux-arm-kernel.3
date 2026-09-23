Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B363C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkZQ04tP2NNFMCmVvm54ZQ/Ggyr92WEvjO4M3D7tpGc=; b=bSxA8Edf3qwUD2MlWKoaUGWOC9
	bG226VyDWJ7q9orHzyigOzStAlhsBdzNeKIzU1nMztS8C1krA+uT7B27XxGddpCj3ChWm5knzXSIv
	/+v8G7frwoZnzhqwGEo4zmltC6xr7yBNfku5hVKdB6z+5Oh5WgFhuuXgQ/9qA49V533qyaaRSXRmk
	hg4Rl4fk7Vif99wTfJKcH/PEi4jNsv7M7oC62cOVYGM7U2cBxQ7lEZHMgJ2c0eYj3RnIcXc4hrp08
	E6JFgIpptHE/yF12ssOxHf9nW3i8EYb4G7oGjd3liCyFFbmMqR1noaSXzQquOUkGN6EE4VkdJnG8o
	hhR2qk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DCA-000000070J0-1Upo;
	Wed, 23 Sep 2026 02:58:54 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DC7-000000070I8-06lB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmFvob1i6IwL8m0sZSw2Myd3akMvElHBslarqERKm5S6A6eGxOnKmWTHL7gA/T/ThMSpwlHpTSnceWkB4QJyaAiNmlJliBZ6iMeCI2H2N2mM+eiqbog0RJec0ecsy1HAG6IxeE9gvACjn1pu0FST6ZfUb3I7GBrS/OKkO8dWacw04zs6LObfS/aRZZ2t+4OU8wj4Enas8irT2Qndq11cZjghmxMHY/WQSmCpTBuvR20tdh2gz7gS0MOHwLb+1cyOVBIfkyjxVLZUcnVAHWftpZowoDGubvr5E0B7GfN61i4sJD89NqXnWaqLr3COkx6LbT7IbwrZp9rBX8Zsrzrw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkZQ04tP2NNFMCmVvm54ZQ/Ggyr92WEvjO4M3D7tpGc=;
 b=lVwkLbHF/iH5XemVLsBMujHFSEbmu+2Bwbc+z2HCBXMhNO9l2RvzwEb5qo5ClPHbUYRXCnkfBURCwkE3hdWnf4/WM3VvFfBVV8m3i/rJyDl/6EFj6H5sHSYyGg/T4lsjEZWq0wEMC/GIcGzWJ0/BeHOItid/mo2bXrAYiYFtSQiBRo+O98HTnc3TSoFh6zOb6Sz54zWI6Y49wpuEnakwL0GFKRIMzUwCv69/F53D+QEUpeCTFcplrgGKvxXCs/UvSbHdyyMAflb+KMol9XTJXRMji9SerhwLtSQQ8r8F33f2vOuzcaGCOQbDI8KId3Hxk9OOeg0LhrM52fKVMn8oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0001.apcprd02.prod.outlook.com (2603:1096:4:1f7::15)
 by TYZPR06MB6095.apcprd06.prod.outlook.com (2603:1096:400:342::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 02:58:37 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::af) by SI1PR02CA0001.outlook.office365.com
 (2603:1096:4:1f7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 02:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 02:58:35 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9FDEE43B1063;
	Wed, 23 Sep 2026 10:58:34 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Wed, 23 Sep 2026 10:58:34 +0800
Message-ID: <20260923025834.842467-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910025227.2490151-1-hongliang.yang@cixtech.com>
References: <20260910025227.2490151-1-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR06MB6095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d798a6e-a1cb-46db-9f81-08df191e8f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|82310400026|36860700016|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: O8bzqpUYzXUm8P45/MMHRfNfL+jm++G9kpiEAFlcJNodCnOZNUKoBlatxJ5SyqXWbuia8fUY9xWQ+XwtltZM6nvzJKfcQjXvuyzsyV7tMQUSQbo5GxSWrgB7mX6Qfmlj3SuoKBa4X/FIycr1CrUlaMvPVsS5E+h4ArWQezn+tapKNOU2qhjp9917QmYoTB4CwGSu9xGQaNrYpsJA9YUKR5HH/AFlQikHSSbsonrEXSFC+ilVzjmjjItpIdNvMfO4lTiF2ljsX7Da1vz8n3ztb1fH7a0/IPhnjgtY4UonlrDnd7I3GPT/u2TAYPcjYz9NZsRfbdPfaMoG6V74gfK23qmMhLxTHHewkJeQuxy9I/Zm5G1P1P+PEvLGTS/YozLuDNx6nO9xXcLGaqv6J3QjKh00vcV1T5K8JrkvX6K/2oWUJqIA/ER3bthTqS7jQAfMo/w5ZBBxX8FnhUNKgPLl0SWjua1HtXsOHrxwrAS6U+BMer2LVBIsBpbiO0sW2fHfyI3zHncrzLCMeUqOj8oplo9sKaJyr3TYdRq55w1cUXS5MMhpxK6JRjjLRnR27L960WGEFhJwPVPvOdzyBZbrb+7TdCmi6EIUr4PX0J8+Jn1E+i5qCgDnjCmVGKtHfJEnxUVVdyML9Mby0wv3SnvMNxUjdMcX/hqeJNWY+2xL3Errcb69aEkqWeHBcDTQt39H0V+f47Xf40+N1fFUgiY3bw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VAs8fR0sXQUFtnJjFQlq0UOwqUtVKe4s4GU364hbwC8psCM2xO0Vy4JmRJLKseZ0cyBFI9qKBd+ACznUDJoHRZuCLDV1sZHhCH1tmcwKE+Q9cWENVk0nqTdVS4w7HonoAkEBykEImdBjdJgsKpLrv3+/24aoiwPSBwwGlVLB7sIUYrZnwVNBUBgltiF4RLqBRJ13h3t7waeKxn67795Ll29xHWIXppxOgX71Jb3ybNDkCn5n70braUaR3UD9KCRT5AjLhPAFjKING9s5OBByrYu7BIh1H+o4A+fMLo+uIzS9T5/eBlvUDx5z+Y6Xf36sovX/8HB5rXV5RgXwv8wDxmNTCzGzmq0Lpi8jPkq3yl68GqtQpxz/66W+U43rkl9Bxs4a67M9Ld3hdWh7VP3eYBDc/w441GTSIDYfbwl0dsbDuQD8m6Xq7BmkEfENYUJe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:58:35.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d798a6e-a1cb-46db-9f81-08df191e8f94
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_195851_084493_ABAE9CD7 
X-CRM114-Status: UNSURE (   6.33  )
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

Hi Krzysztof,

Gentle ping on my question below about representing the shared RCSU
region with a simple-bus container and translating ranges, versus
absolute addresses in reg directly under the soc node. I would like
to settle this before sending v5.

Also noted your comments on the missing blank line before the
Signed-off-by tag -- the v5 commits are created with git -s, so this
won't recur.

Best regards,
Hongliang Yang

