Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D1CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=; b=THib1FRhd6hC4tVptAbSGzPeUy
	02op0IQZzi8EXKKi6usHhApFY/Gze0HZg72rF7oL2O8qA2RbXdGjRz6huAcjRXg52FuOG6J/8KqAO
	TSdXWwIlVn734DHITkccmsDN6rp9tCwN42V4OQe6i5BY3zmahioTRmzHflpc71tAcZoXCFoF9gb6v
	iaPzX4RLrZw4l+7NILAHCX1b/HodAJqT+qFa2YXDoYZ84PCdZpgQeuQYVgVCg2o6wPPcY1hBakk1F
	thxLfPIIxqOHcapLGuSRo6+xzF6dLp/nUbYbOWY0nI5VeW6Z7rmYThlZEsZ9sIL1+2HRLgKFRMew5
	0kqefdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlsH-0000000A2OD-2rK5;
	Thu, 11 Jun 2026 20:19:37 +0000
Received: from mail-westus3azon11020104.outbound.protection.outlook.com ([52.101.201.104] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlsD-0000000A2Mm-3ML3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zzl1Du/UuTn5uFs7bdldWhmdrMVe222XUAJy7kQLpgEsx0jBBF0o+T3iPDcycnHwdQwUhwYa4tWoE7e2WgM4Z9RuVYIuIoVg6K4w1mwhq/GesQYzkNmgjdYF2clAvfvHCAcDxchtiLqzbxY5MNLAdgdE+afozwvmx4Vh6HAxmsBQiqfl5tRkQZQq8YOL5Ob10im2BRQRG5Ocb+7oEotAZVRP2h55nqO5eKYb4/vRcGhfdbrjvdfevBe7fGwpRZS7nqikChgtxirwbnP/tMpORBhiLzzoO7tYeet5cms8Ap1f6WzwYLXID2mr2lUkcw8WjZ9AB0HMSJIyJT2yfICH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=h5gt6+fIxCujh+qRZH04Bd4W5xcTxbFSnWTxndM7gse4EBLU1QVJvZXeLcRK3QIYlH/R8TMAXycWjT90U8TRYdEQ33NoYMRHTT760dRcQSaGQdZBgbCnmdxEA8DcNNG96Ag/ralv/kNaFvi3GgyNixSYASCkoZIyMlVNRMOFfKttwELWeILkM605/exeOmCaJLgfAp0u2s46qI1YJKe0jy0g0TR1cMAIbmiqVK9BUHMgo7LxUS8/7rzyJuL59n/AifHr1AXZxWBeF3hDXFnW5oaimoL0vTzi0lHuuNmFUVN/GM91WdaUQPBVk45+wSK62QE+QGMewP52h8w6ektXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=DpXgQBbxhQfM/L0QLNFNRZp7X955c6DTn45G6CspeaezzKvJ0qpnb8wW9ty9TJZzF3rLzMnaGOYuMvEWEBh5xSBzOgpGYvJiRrhzpUW4y6tb1m5uxMLq76SDy2qWO0jSS18GPMwi10J3dYClkSKdHtl0zzOz5FgnJqeTUnWeE2ezrCosUrPAea+6lkb/zuTVZdVtyfSpF0Wxdw5926mHq/oMqu4PLXOOcS4TYBiPMzxTcVQDzRle4aS4ea6CDD3yDUwzuz1DIsWDr1jHN0+SFTPgNXe/Ap8ctBKRaq95ctgbUPMB2sLVkTz3bO1Rszos2w5W60QlMxgFR77BbDrllA==
Received: from SN7PR04CA0219.namprd04.prod.outlook.com (2603:10b6:806:127::14)
 by PH8PR18MB5333.namprd18.prod.outlook.com (2603:10b6:510:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 20:19:22 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::9b) by SN7PR04CA0219.outlook.office365.com
 (2603:10b6:806:127::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 20:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 20:19:22 +0000
Received: from sw-build-jenkins04.axiadord (unknown [10.4.1.35])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 6FC234186B51;
	Thu, 11 Jun 2026 13:16:48 -0700 (PDT)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Thu, 11 Jun 2026 13:19:14 -0700
Subject: [PATCH RESEND v6] MAINTAINERS: Add Axiado reviewer and Maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-00bdcddc0c29@axiado.com>
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Harshit Shah <hshah@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=fdns1mTxFg3dZbGt8+Km5Ro989C6XVxx5Foxq9uBn0U=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBqKxhJEmj99aKo+jOFGs3ITInsmV5hYbY3Gsw7B
 KP7n9nL64+JAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaisYSQAKCRD8pK92wMW6
 z+vvD/9kNiMnYpBwWxdtv5cKOzAtl0Smdb+5c4bNeosm2n1EUYWzNfDpZpX0MYDa4u7vodlcThP
 SO0o1WRMiyCfG8IB+XOUvLXauMdeVmhPOoj+BPegfN8yENTMsq7Gc9LbmKSBMPLA0id/BZ47YVL
 /LcFXnReytlIjMmHqHV9s1vF1azLd7hfp86aLsuclCgBbvwcPl08l/HjVqP9Xpo8qg3Og8T2Shq
 qul+KD3gv6YBBSYRJAWHKbhjveSP+zlVeb1E2+4NVQinT4w9m8cBQPJ9EBAi5GSB/Or/Ko4uoe0
 EcLp85auzl2pLaGoh2BVxr4OOJux+EMKzfga7CjdnDR7pRrvhNvkoznlHMSOPqBuz1gGqYNNZna
 /XsNKA7HtM38Cjbp2O5sw+/MFaa62o7D5qPnxgU14sZQue2aSuYEZ+gd8DxOdY9Z8vyOlsfyw5X
 dsjQM0r+2qkFLS/wXAOTScgppur6IhyzJvXXl33JG692Iu8bJ6PfJP/u1oUrNiLhtcUEoE4NwTA
 zGPcOxJmSmYGmYl3oGWBziVVzfNL0DEJk/YrrayyOuVhDWMWF3JGGO4t4P8KVZRqN5OlNVHoNR1
 y5T2mpW6YxPvMiAwn9mjhi9sp4OrfYpsCKIXyAx/nZ5YGgDt9iDpKHWJWL+gTz8VPaNgnl3mHX3
 mG3K6UZe0g5BCoA==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|PH8PR18MB5333:EE_
X-MS-Office365-Filtering-Correlation-Id: cf14e84f-1ea7-427e-6fcf-08dec7f6b9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: VRc/KoqcopDE74pMp+0gNnDIrKTDO++wt28OYTVCSXe6jTHxlZ8tMxY1yTLFzStWidVzWgXeF7pqZBj9K8V8tx2DA4OTBl78ht+1WASsqbyZPXcek3qeL+p0B1GaCocwgDvDr7KjPJqV9wA1sP510IH3hRoBAYuk8iodStFmio5a1SPeWeE6mDCGROS4HXCx0dQT3Ivkkn79FXNOYxYqIx/UE+cbST2/nejv6o040pSJKG1AMSRIJDr69/vlze/uVSbdqvs833kM80moKHurB2HMVATcGdHuLO2GUsDZYEWxo8fQ0+87HBi6c3OIOrX51NosIdoVnBs3w8HYbwaBVz2bh6kbUJeR2j0QvEjFukLD56q/ny+ivnpjFhh9/22eKNhqzr0hwaYae7lzObhcIlXtYVN2vcxXKBXdoV14LM1aNse3AfD0KeqXMI1kWJJ0zxs7zctjLRdItIcn3VHUD2NaJuPYpDmnb+7To+nlkZx6bszlBszUNxbp0z+BXCZYwe5v6POaRj5UfFYhPNtN2YqtFJtSf61id64ukUZZUhMz5wiNjy1D3LWPGJgpfaxVx3TX7cB5NsX0QdpnvZ4TSZw+mOqE2wY3Vz55H1X6Cce3xPCAgiZIa/iRQl5hnpdSVDqK15zZorzvzWnh/NdNZ7ASuSbRmWY/j5JZDGeeJ7kTApZxowNZ7wKxlmc4W9e98PPJfzy9l4+C0PwfexIKf/yh4e4r2Qid067ju8+kkoc=
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y22zHhANwJ4aSblmJ38Q1akBH3uP81TPjg0In2xzc7ZC/cyrLJI/J8bnBf3zrFbU3dhNpc48yU9WPRzKd/u38caTLYgNowmSePnTOKKpL5ge0OC28oxQ/ny+pOmaa4lZIiDIbEhFw0sp/dL2K15PbwtzFk6KNklE3kezkIooiD/t+7D5PlwRLr6WHPVbA+5jvmbfX+ufcp+k4MimOSWXN0VvbIMQB1alXvWy9sKqaWbrISlZh4PgWRw8Z+bwbBcyCugoFXyACPTHpcvNio23tMPxADDBreQDhzwfDhcxel5SicH64nm8M17Irl2oBsCApLS0GeY0qGK4PbNhn/7peGzDeoHqaz6GymIFVgBSAI7uqkAaC5oUYc6S4t2aWNws4lq51uRFplastY8jBe6JuTqkrsS0i2PjKUQn116UVYamcTfzJ8ZAH0nI7lXAa8er
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:19:22.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf14e84f-1ea7-427e-6fcf-08dec7f6b9d3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131933_855996_2FAF9ED8 
X-CRM114-Status: GOOD (  11.90  )
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

From: Prasad Bolisetty <pbolisetty@axiado.com>

Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
Removed previous maintainer as the previous maintainer moved from project

Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
----
This patch removes a Axiado SoC maintainer and adds 3 more.

A maintainer has moved on from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan). also commit message amended to have the same.

Patch 1: Removed one and added 3 new maintainers

Changes since v5:
- Removed review mail-list R:Axiado Reviewers <linux-maintainer@axiado.com>
- Link to v5: https://lore.kernel.org/r/20260326-maintainers-addition-and-axiado-ax3000_dtsi-update-v5-1-648dfe9bff29@axiado.com

Changes in v4:
- Updated commit message to clarify maintainer removal and additions
- v4: https://lore.kernel.org/linux-devicetree/20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com/

Changes in v3:
- Updated commit message
- v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/
---

---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..b1349bd178cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2605,7 +2605,9 @@ F:	arch/arm/mach-aspeed/
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
-M:	Harshit Shah <hshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Karthikeyan Mitran <kmitran@axiado.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/axiado.yaml

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053

Best regards,
-- 
Karthikeyan Mitran <kmitran@axiado.com>


