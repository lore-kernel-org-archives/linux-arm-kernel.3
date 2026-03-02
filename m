Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BDBEB3637
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNcCn6YcHDsdw9n4c2zD46zCJdF3z6AbHB0REpNNUnU=; b=vskX7ipR0sseKwb/6DNNZEQdJS
	jA4imi4Zmy13lMVZXEd1rnxEqDfcnWxjUxe2rjH8CeoCl8xbrCEyovfxVgZiN7b8liTBaxKqWHxRB
	d6HHjTFnDTdJxucT+bNXs1V02PWhD2TuaIpfamsLNQTkmor/jrtebIHu9MVH30f/DgW+cQ3KSXrkU
	4Eq+sl37jimiNAZkoPA0BMWekjc+Y9WY2qi8TOCELkaep1bO3NM/4RKwQfSHemcN9jzRBVL39qJls
	h6Dl+burD5zA/Qcw4pJ2paKI6PyoB/qAyEko6G2nEMq39kOCGec+6TIBYuTLLstc15fuhD1jm9F9a
	oTs+1CMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBK8-0000000E4jj-0ABT;
	Mon, 02 Mar 2026 22:01:08 +0000
Received: from mail-northcentralusazon11023120.outbound.protection.outlook.com ([40.107.201.120] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBK5-0000000E4j3-0ziI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oU3gIHUYmgQxcNe6aWgHX1nNhABSsm2voqoHCuiWVOQzE02JUXAE2YkmSr+S/kWuZQA97HunuWSIQYZVP++aTZUhX+AVWqw4XTk2lPKTyHASNRXg5x3vclmjvqRdC3Bg8lZIS8MlHR0Ttk1FnuABVyUsClnlocePwZ9vQlQ6bgC5TaPruiBYxZ5i/dqKpDJRyi9hyrkAoST3OFmIEX8976hOf75DPzoTAIpkBvsUmuYry/kuw9I1EFKqvoW2pjtczwxfCYanIMLhezT4Qke/drvPGxD2nSHG+7JQ5k9HKX2CTJAW4Z3GO2PM2BFTT5OBiHAkiIjmkq8mUf3UWaQrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNcCn6YcHDsdw9n4c2zD46zCJdF3z6AbHB0REpNNUnU=;
 b=jb7QeK57i04PavYvgHK2VHa5uMJViKsNGKTczN4MJmz7t2nMA0aW3SEXHtsrPw1C75d47ZiSDM7uBCHDmBz9DAXlzZwMNySj7GATiiyQrFNo7Vr8xjK+08B20fqIVHLNISsggwBww1XdWtz87NVhHIHbbfjxQr59ihFWQQ8auSgYJKR1ZH/5RoGN72No9rdZf9LRjtg4HoQublNS7xT7eJlDEnS9PGdnMb3eVvhv8qNgeLPVRw5ZurwsOg0fdvC121i7e9DwfI+I6sfKZP3bP9/+sKKNuYP0CAOwnfB98z9W+5KpS3d8d7zNhGEJddpJh6fQZZfiQfhluE0X8mZp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNcCn6YcHDsdw9n4c2zD46zCJdF3z6AbHB0REpNNUnU=;
 b=SJ9lp3qmtMUzrbIR3STTQ/L8JMTHx1xSFqAY+c61sGnot+7hslWUhxJAq7Jxj40Cxzp9z7EQyDLKuIxSb5NLFQrIYw52GITDPEbZEGRH7+zjqLKQX/1zvdJDyR6im9BgJad9Kt0FMVMv8JPhKZFkifl4ISqlrLlSnCSPNWbQz1sL3JW2ZvlhRGKljzT05kBiPVaFG4IPJY/u8R/oVTjolhCiMjDHXFWM88RoYteGoBOpkK6oDw9CYkuTPFlckbdsBCavINTkCv1D7y6y2OglteNGbUXPxQTZsEaL//wr1Oo/4vonTyuN+1aRnDVgTofJhpOdHG4SJyCVxBAsMVSX9Q==
Received: from BL1P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::19)
 by DS4PR18MB927491.namprd18.prod.outlook.com (2603:10b6:8:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.10; Mon, 2 Mar
 2026 22:00:59 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::d5) by BL1P221CA0041.outlook.office365.com
 (2603:10b6:208:5b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 22:01:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Mon, 2 Mar 2026 22:00:59 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 8968D4186B5A;
	Mon,  2 Mar 2026 14:00:57 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Mon, 02 Mar 2026 14:00:40 -0800
Subject: [PATCH v4 2/2] MAINTAINERS: Update Axiado reviewer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-2-84a5c9df6689@axiado.com>
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
 Karthikeyan Mitran <kmitran@axiado.com>, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=nAZItiP1XYriDI4padcnM9Rq2NsI91O5+qv87ARzTJE=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBppgiaYJ8TZk9wKhreFTer/ljBlsme2s4zcolja
 359qTh2m4eJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaYImgAKCRD8pK92wMW6
 z9MxD/9JEONK35G1XXKA2ObswEM8CYODO8trOifseAN4WkucIoy3wxtsNp08ZxDnANrRLRt/yS4
 s8U2wcXvk0dY6SHGSFeGgSsG68Cru2Sww/yEP8cAUA6SUMtgdWfK6sW0OgimQla/1XQ7Tz1G68I
 QvxkCbUUdktatjgU6grhheHPu8DDnCn3rfS/G3ItKoBb0/NtVQbkoH/OSfCN4A1dkljmx5vsMwD
 4somh+knbeovAXbfReyca28Fpcg2LJTj33B0P++eDzBLQRuX6txD6VL54uKuM+gZt+38wZpfuQQ
 YpL6Qyt7ST2LhQV/px0t1biDKEgSiPgkb01tGLdSznT5xEz4TomdCszS0yUHljjcxC5j78vhu3D
 tvD9mc5da3gkYTFtWI9KwcK7UhuXCiUCwzeid9+B+mvtGPUx18Bv6HsChzQEH83+ahebACqEYxz
 5/CybSGIksykSU3eIkfhwAD9CKG9M+GgzI0Fjk7l/KWchhplnVPbA1UthWYBDC34zX/hCgEQ/WH
 XmQuD4WfE9s02/+zx3GXPeGd9k17isjW11UENwDOaAZn1ICcNEnL1pFj0iAyb0dXJwJ2nb7xEh4
 wduLzpvMyHMqTqLe3cttbiKo8W7fd2HYY2QX3M9sMoK458fN5N8uLYkwjexgvlYVA63JKXll8ZW
 MowT9euhBtbl5mg==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DS4PR18MB927491:EE_
X-MS-Office365-Filtering-Correlation-Id: bc31befd-9728-4c92-751f-08de78a7303e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: gKCm9LN2azgKrDK834uOnWqMwtdozFTyZR2ZmB6ZYg88LCGMzSX8tHfET/hNiNVP+5jyLUKtiuhoZHuedfZ9q3qU7kSnYugNRbKWUaH6NO6Y3tSwPiuSNq6R8zQ+Yvmn/0yidu7Huf2VskfnnTWkKOpCHvFTa9IbjkTY7o7kB16NuFV8WeNHgz7D33PedlDZXIyLu8fBJ6R5qvkpH6sAj39o2gRaeLbfGtuTMDLXs8E8VsK0+SYGsZXzhL76a0Lh6YNFYg0NcttkoYWlunEsSPbP/2c03xfTzYKOpKFRsHcUJgqFox1UMs6z0JSpPSLRAcdiYIslhZvEWvqzxowF+K4yUi6iMVWJmugIAjRefVPTeP9Am/EauqyaTxx/38iqxU3jHFPZCywEdpgFl8/xjsz/6pVFw70K8OKMd0SIg5lUmXWymTMj8T5Mc2jL5jKhmJr2aqvVIOwfzrRNwxDsQNle0ENZ/WJeYwOxdU3qMoPz7h/ZgCymHKKOcbScGun19GhdDZSwEMhcT7TYBH6I5Wm+z9Nl/oqVvUs0hQV0xyr7Ij1BwN578VWxwyuy0G78fHY0rg75AXqlFplXhHMaCEMPhvxKe7lyrT3CCiQLS3cX0sIMlYUMR4ZxI7hMoTPO3y2chTMg1S7kN9brvvZL/JdZekvyQq7CsgMb2zdKAisVPciLUfzlKk9H/+D+0keaSMz3pCBkVGTI19qfA9GiOPbKxmcMDt2moZwNFHCG8tWy/7a8bDA2qK9ykgQ+PBw6Nl0xM5S+KpJG95MSX6Ivfg3BvxGur6/ea2W4AYExrSDLvE8TDYxb+ZtpiBMp5vrdbfZEXtyzAllW3SZCUYzD8A==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E/fJRSZGsZAMMlEBpmEGCA3mP1Hl48jIv0JmkeDUYvlVehzS7Xe0F8hOZ7IOrc5eTUYPNeKxVTBVLmgYUFeY9TgELkyaT3c/XfVZS4uNMULNabnRRxRkodP3PUIbY8WTc7bIsE8e2MZAllsb1lQXNAPjXo9Tcs8LUcKr36e6hDHHVwVlMiIzI8wguMTvyd5QGFcQnl1+h5ck5V6dTAKWhMCnyAoCa9uo87PwPBjGaXe2z3Mn8+KaYIgaK2ddEtl7XHVpyERrN4YnpU52WR15W81lwE+SsMQFaV3Oed4dOc1gh17FhlCDFzuwvteqKP+2aK0+MA51uW2fFCny5HVhd0FHF1LPuub0dPZfQyk3qV3JqNO0J4i7dMPTpRMQULVuvxbKVPhEhAJ/xjpxkEqJ243xPRF9ZhoCOpGyGRr/kxrIinKVVXWqoAH0M1iSdFp7
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:00:59.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc31befd-9728-4c92-751f-08de78a7303e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR18MB927491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140105_281108_CF77DC94 
X-CRM114-Status: GOOD (  10.18  )
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
also adding a group reviewer entry for review coverage,
as the previous maintainer moved on from this project.

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


