Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B64FFD9E29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 00:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THqJOJpOkGv0WRcDYTwGCuptGTWknWnzgTIQMPtNz8c=; b=hyD04qH1EC3IUHVp3iaSm5ZRhp
	sY9y2uiCEn+noqGmMjz2Hd3Zuef9y+kh3ApsS7j8vWbVjm7s+6PF8+AyvDw8NRtA6G0bVdDnLSLGQ
	/FmIJzDYhRA/9wCkUUjFEKooKsKsvk54lwAFfTxvubdb5BD+6QUVN7XVcC5a8WZHbKG3B80VVagwb
	OOdIbtdAM8tFPUqSM7jGFmhdPGKkGxXQ+kjIZvl6WbC4r2MLFlDWC3FF08a+dpeTOQ9icSfbUOvSN
	U/gv7SflYGmPOP/Iu/MisWnbP9q8KubuM1oSnJHGGknRWfKxxThGrhoM4vuJGwcCQCznSVHKqpGA1
	UrzohSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvllk-00000007Qu6-0m6y;
	Fri, 27 Feb 2026 00:31:48 +0000
Received: from mail-northcentralusazon11022091.outbound.protection.outlook.com ([40.107.200.91] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlla-00000007Qru-07or
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 00:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+neJTdgof7bFEzTKjvAOduteSe2wLUYwHxB4CPuB73z45qUStoAEZBCMkHJ83yx1OmVHitp4JMVETE8PLPC7J2UOrSKPIjzNLTj6df7D9zvLchsSX+BGnV/ZURy1W+wXS9V86dMfYxYbBnN/0MhDyB51onyYC9GzKF07hDagbIJFKBw9lZoPa1jPcNFt1EbwlbHKKw+Ce5AI0L3NVyf+QC95AAWVBZTVbP4gNk81UmO4Etd0Rf312i9Q67bxIGbfQrU0o4eH+fB9Lvk9tpt9SHaj4MFEfmgiHqQQD5CrE9vuV405aq719LhyizraCuqx6mjBSf5RvT4WlEK6Lmnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THqJOJpOkGv0WRcDYTwGCuptGTWknWnzgTIQMPtNz8c=;
 b=ya8vV2vgQOUmBEoG8HO8l7a8lYCZ+tLzPeWgq/ATFVc1zG//M0Rw/XmNtTqh0hsrT392TMnrKn6JlmHL3+zkR1UMNd0feqRrF7xtnpvRQK16t0+Q4ICeDLXoUpdFRFeUDkFplclSDA2ACK0DGzdwPrtFB0MAq3G3N4xVyQw2kFAxOf1wejdE5C+kRwB6TwRJb0KLnt1CUMvDXTtryTCPuMjniVdvMe3itL13jfFrcvaGnXbU25ovunCdKL4KV74qMgQy2m04cakyqUnjhaTteBtglAZa3rmFYf+pavsHPFR2OP4guNwX1elFiTR4PzjLguHc+Fc3IofroQZFa6PCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THqJOJpOkGv0WRcDYTwGCuptGTWknWnzgTIQMPtNz8c=;
 b=iIBWS4eR3+FbXp0vG4B3hiCVu3ZZ2pDVpo7APg34xtOwNxhM0xcYdBKpoWFJcom0UU0RjDYBbFfH3ogXA2/z7EHbqlcfLXlayRBQit3jxMVpaSQAPNPja3D1gTPCXG8XHYIzrDjpoateJ8RwpJhb6oXiNS7vEvrfjfi8Mbl+uiV0AVbBiB5x6Xh89uW7ZqPFwIC7nPBdbJTqbnUFl9fz86knHXkRq9u440kjkzZ8hq8Uogf8O32ROCNYA2z2YQhR1/pZRStnhTD3PgXB0o8GR9uOTYwe9ceZ81Mux2NDLrqbkBB/fcBoOJaLwfe8DXDxlAzTguhQKbGgB2k+R8ic7A==
Received: from SA1P222CA0170.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::26)
 by DS2PR18MB927617.namprd18.prod.outlook.com (2603:10b6:8:333::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Fri, 27 Feb
 2026 00:31:30 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::c4) by SA1P222CA0170.outlook.office365.com
 (2603:10b6:806:3c3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 00:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 00:31:30 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 009E94186B5A;
	Thu, 26 Feb 2026 16:31:29 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Thu, 26 Feb 2026 16:31:27 -0800
Subject: [PATCH v3 2/2] MAINTAINERS: Update Axiado reviewer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-2-a3b095989823@axiado.com>
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
 Karthikeyan Mitran <kmitran@axiado.com>, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=Fzi4PzhkmoOR/4UdDbOj4B4k0kyNNWs4gqKE/GRQLMk=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBpoOXhBS8FiceQQGCyDvFR6IG5Rrdljr8AOZNM/
 rGme8cr5jOJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaDl4QAKCRD8pK92wMW6
 z9wFEACfaU8Ep4xpTPHY5HKBy1RFS6/ULngrIKG0gU+XCvkTerXLQhuzNSOpLVDc6ygJiyHIJ/P
 ip4Z46thVxms9KqxHVsD2GaWb0hcqHyA6w89QnxzzK0vrTY72DvzJWSxgIYtIUKLNHGzD4evDoL
 bYwekNHOkiG75yM10yHTwKTp+qSiIu4Kj9PPabhk9G4TwD+9lXeh4hqCp+ECazNNCkYc/knXGSw
 nATosP6WOcCWr9tWGKNkU8QvlgYOpxni3EHoETL78G3D8RCdYX3hJkcrVWvS3TWOgMRFZw9wK50
 n4aYYXx47bCkfJnLENTSyy9AwdWmn5rXrjEAUr/DvREr2QHLf6ItodSjXHwvq04aWMRqFaO8Pdj
 rc4XH+kAQvqcg9mVPqMPhedfcYMwpQN5dGJvEAxjL3WBF4OVixpwiFCpN8ohxafLwLzI+jNpaWr
 CE/+iIF7qPxSjza10I5D/GgGtMi9S2XlYEI+x+CYGhPLP4+3a6Misgbn3TYKkkeR10NrpIHsz2L
 U7yILtHShiqXHjre7apn7Fdxo8ew1PR9nF/UzsrQzvL2B2Af4HfLMBfD7bIKAQ87XMoifusjQML
 acO9q/tPrrwi9aIjMx47gEqseKeF+Zrt+6sNxmzk42eY0xpbrjG2u6Y9P5d8cwCrBzmG0ciLX3J
 1GbCK3+FIAYr4pQ==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DS2PR18MB927617:EE_
X-MS-Office365-Filtering-Correlation-Id: ce959a54-0616-4cd9-7af1-08de75978d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: K+RKNqOPbXVYIsb052zb5VeSzSKSB3BDqMs6yn1CX01BFtWsAtYa/WE5JP83aImWKCFDB09yIuBaDnisAb/JIND3XUGnKZIjXdVslwqVlhm6y9A9G3w7LnHE3DNd7a1pZtMSadyHM74OKhQerWFXE4VTcEVtBjJMXEaTWfCJnc23FAcQUHdrhUY46eYQDw9lSMJ8bF57Qk9rggPreGt7r+CxuouB8uHJrCP0yaa+KF0cuB+xCRtNVMJ7q/zwwkhPhIy7dOzQO1gyFplqS7xeU/D5JC3C3EEZkLqSApReNoAT75Jv5VesFabGUyijNpGzA/zkUHc32W/4vidDLgIDL/qJlI12TrfRwLFcnlPPO6mm/tv/xai8Kzdqt3DkeV+1vEqog/Lp6zY8jnv8pnedcwsTnLSR6QSRR27iwYB6pWmaw0mHi5owd8oIl4SlcVKW/EBUXi0K6oy2Ao1fe9U0GPatha/0X/vpwltiQzd3J0O9q5Pr2xBsnKPBgZ8bS5uOeRPRQoVrxOFlLrq1gSARsiERBnyljIhSWIYhgklh2xE6SY+aFa/OdQou7cR0ndOCh3XtcIQ7zQdEZNKDU89HjEbRyCTuicawqp/uWpJRQvEcva0YZa8Pj3gnu2UVLX26mHnrTNz2mNqaMCFUtP5czmBF+4YYG9l3ev4/x283r4uK1ZIsegl6/7kl3B4vBEjWTX64Qp4Q9Kr411afTAXZcec8rTU59CFLJVBIweiK7lvBQTXkbcwg1WUpAvjAp5z0iIdBADDIP+E2IiLEiOyyeKRvISTUCk2JLk2xow54Sv+zNnguFQ0eJpn3xhtNL4O+UkCfI11Ilq07UrGFFI4Ihg==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AsP9m6LOzcA1cCYIDr7rw7od0QDwBwuuVdiICFeNHnXPo7FM60aRiOL+Q/XvGoOKTCH/Drf02HsNe1Rd8F08ooKB1a51A80QwmMJPRhIVImaOFqMEsrXZG1QDYCSPTf5n/2GARJG6P2+xJzE96Wb70+/+8gccY+57PXALZsKI3TjVJSQkvQl1ZztHRaqWayZKD14YZLw9J24uSd0cwT69gcfeBMYVc5fI2Xa1RLlPDZgchYtnZRSoyik4Pm+u2pZWq8N/ltdS3EPEHX/rNyZEhkzwTeJS4pYOZob12VBjCBeOOCI75YeX1Z/FFG4h42CPD6z9zH+XEWwrRk7ZZGu8sf/6f9/ehZ3fyH6yqqDJtWQ/lmm7L1lCNA/vvQFkAp07YycoMe9CD6vG7FVotgcvURgwXRRiWbGyl0Z3DidExTx8eNja4gP6ftIpJ+sBIcX
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:31:30.4363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce959a54-0616-4cd9-7af1-08de75978d60
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR18MB927617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_163138_073035_070C56F7 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Prasad Bolisetty <pbolisetty@axiado.com>

Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
also adding a group reviewer entry for review coverage.

Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..52f1228bf137 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2554,7 +2554,10 @@ F:	arch/arm/mach-aspeed/
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
-M:	Harshit Shah <hshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Karthikeyan Mitran <kmitran@axiado.com>
+R:	Axiado Reviewers <linux-maintainer@axiado.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/axiado.yaml

-- 
2.34.1


