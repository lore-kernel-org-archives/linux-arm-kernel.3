Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850DBF9D0D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zId+5TVYAXJATNMn5KcJzAqrhS1LRW/2tp29vPuvmCY=; b=r8V5QmFqDx0gSTq6bHy1JB+dco
	Fc0Ttjv7D80DM9uBEfaLVvVMVIpcaENPUzHDtWK435G0x1XFQC+PHC91Fu3hUep2CRVTYTPzSAI95
	1DruhUOsVReRetvhRQ72lJGmy4HnllkEg63xU0UahyoM/Ud+xXGJIRwNqca6+lpxSRcZHNjjpblMc
	1jX8ItoGQZM7z7DswUWejNY/CBy95nCwJycCg3lWygRQTr0xjD2QsvxR9U6VWTaFbjgLrXEPihRQQ
	ft8iJO+Tr3LsxR1EMiw98WEx7eRKx7dLQcMpVhOguP1fSklAjj2/DeGAf4c2j1h/sZIoaikFaUQKH
	bzp1sVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8Z-0000000HOy8-0apl;
	Tue, 14 Apr 2026 13:49:07 +0000
Received: from mail-northcentralusazon11020120.outbound.protection.outlook.com ([52.101.193.120] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8T-0000000HOvU-3kdf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Imboo+I/Ue6uIGnlCWjmhq+QQft6mzthsXqjypa6TyTUJnw+hO0KZsdeneBEy7cFYfF3zaK8NVDsqI9B4C9aGoQAwaYzYD1Zaqk5vrR1ixWlcYOZDwOxcgx/HUviZ4QeOoth2snar2pwwIKDGBIghbLMUZG65Pojyqiw1KMus+6B/2MCl0rvhNmd+w2mR2pC8CbZXEp0hy8XWGZSkbUuIl/COaRIlYncEmugStCGTQTwU2v/DwsIpEhmX9pFxQwhPrLlSwQhdNK6FbHuKCoRh+xMDr8/mZv+rrW6sman2JZn09LaaPgcvbHTxgyoWEG6mTs7HQqljBA0b6gNHELDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zId+5TVYAXJATNMn5KcJzAqrhS1LRW/2tp29vPuvmCY=;
 b=tSQo7Vtv0TSnt4HLwcZfsPnIBo6+IUc/KTuW4imcQafwcIoXjGOvQnMw5xb3x/Yr48Mo5NZ7Gv/cQzdB0rrWGzSJwL0JS9PyzMEPen43RqBLbVD9B/C64A1zbxwfLGlVVKlUt7pFBbqCW3jmmBi5oIXax6SFUCZmrrqnRqZYEAri/IPcZu3QHbsunVP1PWgrG7oDD4gGJrhU4Gbnd/93C95faysYwx5qQ3i5BFqiE2TltnBHSDLfEQvJvG7uzKwFtjkg9qBpO1bHDqMa0FEk6caEgY4y2YM5eVWgaH77Mc9M3O4C/jRKpasqay6z9S1V6H89iJdKQ3VYmF4bmtBfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zId+5TVYAXJATNMn5KcJzAqrhS1LRW/2tp29vPuvmCY=;
 b=eOguIwwOrbyw3iNJ+lardiFHhzdcXd6JrGd03B57qCpYs5Ai2OzeeLZGS0JwXzVhhoeiinXpAWmZe1oHmmqawhJaeM2+IOWFJ0aOUMYk0kS4xqeMnnj0WRz0P+VUxtJTx6aR+TfH3DI/GuArHSJq1rNVnHVkCp7eGn11YeLY/spOJHbYzFZAHiWG0CPLe6/Rbaa3AowpBZIwY9qH/w8AvOg3XnsyRKUsZuLCqeUwCjwzqXYUrntXZQWl3nhppDSdShvR+BptrHh6OquizDlbBv/oP3+mmyzCRluOOUHvPtptRFjYyumb+7dm5aqqK0rRQ1qw6s5BY+myF8j87TVpRQ==
Received: from PH8PR20CA0011.namprd20.prod.outlook.com (2603:10b6:510:23c::14)
 by PH3PPF6D3BD054F.namprd18.prod.outlook.com (2603:10b6:518:1::ca1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Tue, 14 Apr
 2026 13:48:53 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::75) by PH8PR20CA0011.outlook.office365.com
 (2603:10b6:510:23c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.0
 via Frontend Transport; Tue, 14 Apr 2026 13:48:53 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 8CE594186B5B;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 14 Apr 2026 06:48:34 -0700
Subject: [PATCH 3/3] MAINTAINERS: add Axiado SGPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-3-b5c7e4c2e69b@axiado.com>
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=927;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=O/NQ15M3jf6zoB3avakSr+NPUQcnUOEs0mRcdd+JWkw=;
 b=uHvkvAfBgxfkT6nA/m5Aa1Z+P8HZWLqbAuvTUUSbHOgqy0Q0838lC9VTw1L+mpZDeFObztmTl
 WvbC1N/QsSNAdfQe4PqaFa05iIqI3+VC2PgsIyJmFVlMJEk7D4CM9m5
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|PH3PPF6D3BD054F:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fd6cdf-9857-4cd5-e0f4-08de9a2c90e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 2mpQJPwv66mgsG5xeAZ+tKmil7uZpvf3fdeaqw+1foFrCxdhl8E2PGrr0pNgvGAY+X7rlrWCDrXDiXTpbKJK8V6zD1KjOPUSKeUPTQgIa8bE6+okck1mywgvz7qQzuhUEd2mh6tkTCGrPI6JHXWFZ6Ln+MNCsT64WjsPTq2Lfab0W1w3Hrv2DousB8I3hf2PUD/XD5ZVT0VdWik0GseX/AMmoP782ibXkWwU/X7zvZQsweQXQ6xQuKqyhoEnipMa/up1xuOql4KJtx9EfmkO8ES7mLPVYgkVZqUHYHztIhaC1B8AktHezHWbWIuU7aTC8D4AO749v7LFNq/9EvN32O0DWLG9hW89S0NpgpUo14fV5V9gu6149hVi/0puAeTQh9wZii2AjvP/o0ghIMAberES+XtfYYm+XOjYEmJP43mb2jnCySvqxamIkY2e+V6AwuMM8YbZ5/TL1UkBP69bb1t38LaYnbccC6WzbWFBToBQ6QNoTm0ZwEHtVmPmNwXO+iBNnYrJn+IJ39GxtMqEhl4sa3dARpbvuLFnlI2HbSkiZSaDjPHZ8nKvngkW7V43Qme91rxvHh6RFps5xjIad2nkDlpQQ7zk425QYHJjzKl77FgyzTfrc3SE4xXOFEVGUWhOrNWQhiUIxCFafIMNBMpLbiSY8Tag6S3vjKWXrp0U1rECHfCnldAain4wDpPQAz6rZQ+7nfmdj+Kepphwsre8MJtvlhv2sPMIrAqNf+L0HU9M3pnvjzdNh/Gy1GV2el2D7gdTgC0Xpd0XuCT0ZNaG7u7kVTUqRUPxi4imZUNUHbg5Hem+nuI+qgMAWrZ6
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GPGYhW90D+Y8ZzeccibGMbHha+t9JG/L18pXqf3q36nOwbiLhBWaAvp78ydRyLvf1SokkHQnWkyhrjp+w+dd4o/3AROaYUG7cxNJGOzyQWWt5szxqjuia4IFxEHzLcy4gCGiUUJoiS83Q4Dnz7yPzGh4Ary6SYWee7Uk8w3FkYUIGhYvqF/XhWZMOYKwcf8jHPsgSq346sfO1W25wt58ix7fEA+BL3ahxLB3FZGAQlCU3sEv8mcxg8pAQQ8RuzdH1VRsurVCMGzzKwWSwo+fzTKLkaCNSsRdXEJ+/yNed8S5urJ22VqaLuiRS4rXZsOgvTGgMMHBOjoBLTPpqQhQwLsearQ2JGPUEJZ2OS1syUaMYRrATbR9FT/VDwrG6FZ+EmOOMDSilsw+1NL/VEQVJPIJ9XUlaNKyr03CtaXgwtut6ZNb/fH+smiKDrFugCEO
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:53.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fd6cdf-9857-4cd5-e0f4-08de9a2c90e7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6D3BD054F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064902_025909_8BBB9192 
X-CRM114-Status: UNSURE (   8.66  )
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

Add MAINTAINERS entry for the Axiado SGPIO controller driver
and corresponding device tree binding.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537..56835c0a1863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4234,6 +4234,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SGPIO DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
+F:	drivers/gpio/gpio-axiado-sgpio.c
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


