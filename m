Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BF7CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=; b=4xPNWpEtbiGDo4SCzKTuAicUpF
	uO3V4aLShJ7nnZ99pQJ5n72HVO682U69y+WHNjySK6qPstxdx62/m/ovuSRcTVcAMZ+NN5wO7GFuW
	2HD7GqPNP41PS+WhY4F+hwbbVq0YIEB/ZQ6NrTfHoTrAAwLUGCSWS+ClfdPuYch9OAgf+0cLOJRKV
	w91n/QZzF+wBr9IPQp1i14N9Dp3r6AScstQp65XbjjZKl/xfIQM528JEgqJVSTkEOC0Kt7vWKLE0A
	REEWjT5Gz0sdS3lBuh9sNXbrpPg58bVDBZTWtIyxT/SgICcKEAJP/oeWOdJvfy/Gvuo8z2fN6MixT
	KV5d1FYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEl4-00000004FHF-39JY;
	Wed, 27 May 2026 13:57:18 +0000
Received: from mail-westus2azon11022098.outbound.protection.outlook.com ([52.101.48.98] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEl1-00000004FGc-2fci
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjNtAOUgJtRmV1+zIPHjMIjq4SWsGoj0WbL3a5B87Tnl2iE5GWk88kWy0/znePg0MKQZJhlf5aXKAi4ImU8E8esIr8I7TQOdk4rUHNWseT8LEcAY7KoK78tUTSwqOvqZPodPE+b6K3LcA2oKS9zd46iCdlNjzZMIBXQdCyjlGv3W8MdmVypKxd4zzBu40dtosV7D4FLt885niPS8gC8P+369gY7Y9HIA9mpM0rpl/HMsY+A7v1CbMnXluus3j/sICvQvhS5FEJaLqnGV37UND4XHTRRnHzTUn+PSzZs8Y+FFWYSTwyTsBjjeeyJF0rlY4LS1SF43KbOXV2SD541KCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=RklxodJekVloRchFSQ5F+HOgDgJYH6CXlKoJVjUmS/nJZU5seonOmo6D5eIcKdchXgopXGdRQMKQqtI7Ba1OYaaYEkrBHb8FEblO1JZJIMTmVZ5ZodsWSG8obtBbaI3X7et6LZfXw1Y9VyzkIuXLiD7T7rdKB4pFUBE5pwqbM7ahpBVTeUs46e0A/VaaDswSk73EYLbH1kfVY6V+hwVIeH+DWIroB8Jaf9DK6skTHYvIzNg0PYa2Un8uA2LC9NwKhi9qzdpZMJW+WcZzy6ygfdGfhqXQL/w3kxeijthLURs5F5Zs4Zg+sZbNaGnypNEQ+5JTxVNmiWJJfU7PM3NN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+dYadGWFOqd7KcSHu8BnbgElb2TEi7r9IQjzygBJ3c=;
 b=MRoidVhm5JSV5hKwWqV7Tpt9eIvisPORjEd5OVSbinKeosuAWPGSKqCEPczbvEMXWabDDsK9JotXad6sCrdBrKQjm5BGdFsgGPFCxbkgC8UGFKi5FGFYkofJVpKWXyMy2r9fGSKj0yTPk3HpOgc+e+7esnUMD1X/fb36RIn6iKCBftLKvUeGAWcED0TOeb1WPqSVEItxZ1RKQUsl/lw1yHKFonCXLp1ZWfqnAqJ+kdL6TiiMmr6UMYC5kRkLfQzCED0VZmpDodXaZZJN2La9n+u41BHgI/dfcBUiJDZpfW6ZzEW6zzuJBc4RJD42hk2z4wb+Yrv4HcCg3+30OgxyWA==
Received: from BY5PR03CA0030.namprd03.prod.outlook.com (2603:10b6:a03:1e0::40)
 by LV9PR18MB927612.namprd18.prod.outlook.com (2603:10b6:408:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 13:57:02 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::28) by BY5PR03CA0030.outlook.office365.com
 (2603:10b6:a03:1e0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Wed, 27
 May 2026 13:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Wed, 27 May 2026 13:57:02 +0000
Received: from sw-build-jenkins04.axiadord (unknown [10.4.1.35])
	by smtp.corp.axiado.com (Postfix) with ESMTP id EE8C14186B58;
	Wed, 27 May 2026 06:54:42 -0700 (PDT)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Wed, 27 May 2026 06:56:30 -0700
Subject: [PATCH v6] MAINTAINERS: Add Axiado reviewer and Maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-bdfdad4fed91@axiado.com>
X-B4-Tracking: v=1; b=H4sIAA34FmoC/6XPwW7DIAwG4FepOM8VhcBgp73HVE1ObFYfmlTAo
 lZV3n20PbTTbt0BWT/C/sxZFc7CRb2tzirzLEWmsQX/slLDDscvBqGWldHGa2M87FHG2g7nAkg
 ktTUAjgR4FKSpFau1/qRaBL4PhJXBJPvKG99H7axqgw+Zkxyv6Me25Z2UOuXTdYfZXm7/xc0WN
 KDtdXQxxGDs++3tepj26uLN3d2w2jxldM0IHbohUvI+xD+GezCe/IeDDfguUOLYp2R+G8uy/AC
 b2q/CvQEAAA==
X-Change-ID: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053
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
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBqFvglXvxZOem1rbNmITBgRzI/oOaZJ9b/BUnyX
 wUTPpoRTa6JAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCahb4JQAKCRD8pK92wMW6
 z2J+D/9nDi6wbjK6KkQR+kpOsP/nBp1IMFYaKUK2at7UlCRALc4QrGtzOkc+3u6O8IQsCvj74B9
 qNT1mncsnybOEgkokxxbBwA4N+WmcBD/rAsR8BGfhaXGnG8I8QqszFO5ki7def30ZgK3/AZnoKp
 Xrdmwr4mFZlhF8ZiX4zLvww9O1fm4v2XvV30d2V43bcmdEXmyOCVGtVzagIQTrhRNtugOKOWRug
 E8wfU1tjm/QBJrfQiXa9lotz431b6j/24VhMdV9VYy94d0uL4GmYK58VWa5xTWM783rms/IQBio
 HsNV+2ZlwgSRPDcHjOn+K0HVeYBUfSqQAG3iKZa40Jv98tP/+SnALbb4/K3tCNvKjr13T3GXUlQ
 edckwU27YumfQNHfbcuJbZ8yk6TFXyxoVphcGzcKO6EtStbUCo68WgHegDIu98AID/L1EBIxPxY
 N8ovDG3PVFOqZcUBu6v+yEleA515+WTxwxxhdy+/lFc4QeM2GWKpJ/etwfl4+f6pOy3FGhrLKkG
 8TiBDRsx2TQoU+vKRJ8v3Ph3FfHmLdoLCKswVEMAr059+v5LCgmV38E6JrHlu50PeBuLmG2RJPb
 +CeG6TtoSAjg/+uywhG0FR1kNy9CacvNvcvTO1gf/rRAzuy/5dVfEFF9ODy9wj14wXP0bAWXuKe
 7pmLpC88QLdlRlw==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|LV9PR18MB927612:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd7c54b-6bdc-41d6-c399-08debbf7d402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|13003099007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: QJOu22/uzarrhdoezbjDqkfkXWp+TRfLHZ7Zt7h02hOtbDOP6uGTzNnQOyR71ezo6xmMyUWevamj0Hb8C+YUmVu05HWyPwCr27Dwza4iDXdOWoAKC2Tii9/qPRFwY/eYHM6/ZhbCYXru293OKhsy8fYwzgLgPgvLAxMOibT9YckVRkHFpB+Ua7WaOFNjxNvCW6aAzrb8MJbwLbJtWIUstCh9mA66ZDUS9bsER/cMjRIiCA1SAehciEucOJFOfXXQnQoJDvH5tf+Y4RwhxVunig4WQyJh6aiKQ58mtnbr+/ZBNtFGUqCQOdpz0oKnH/M5AnYruaYHzblaqLkqfhk12yf2aSXl/vMcw3m9C4XSG1mTr3C1Ddan1IjtXeuxsXJqrK7WJMcBspU8yHHmNZeCNOgSoEWk96JofxpeSc49aiKzNAEfityU8wHrPX2PS/Cxb20jLYxATJfXw6MwBWl7Y+zvcG5tr7h7WcGvApUTYKIciU0g3AauKi3+t2nsfLqjPCESNRhgEI3kjqe+gSY/gLc76Y3NlRJ215kHx7esC2zNzZwzzmyp9i+pdtiOG3YawiJZnkQD4CajU+h3Ebn/9hHVKYwOvmUIX5SdAGbubwJmRnlsy7AKosoGWpAoAPmiEkkicELFdE7yLsfdjTRQ1P6dAU2R7LRktxvs9EUSooGcwYRLAKk/6oZXZ0f4ZdGiTykiwwFXIW7pKuwIN+EhHl9x5AugO/w+ygGq6E33f6Q=
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(13003099007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: weayfv6TT1N2Es0cK05BwSSPDPCFvru4zSBwMuqB2C5M+mfeO71KPVJ5wXXQx/VyRGuf61tgyIWAq3RMi3J1hzOePN2y5dxt19gcixqUaMKDArrRjxUGMtwseZMhkCpfjX3dtru8ECqlN4pIhzMYEsIM39XoazuE0iA8k+aHD6zY3xtjSg5kaXBSTF4K+skRw/MJyFKMzKROUp6X5JrGPm8Aa80fYfymtFtSt/J4v8hf9i1faibWD3teCFqPIr3uLkq+uKAmx3AXET/uoODGDVKlf3h3KZgpyvtfUvZpT5lnNG33T1gsnLRq/7SB/biNNNT6yFQdaWiJzM+Nwgc8/wdn2A5l8rARLoRWNDK/6ZOpg27meR730M4rMKb2oOVDHMZmio21Suc1y8ErO8kh1hk6NbQT6Zt3mazx9p5yVjBwTt1lv95zvQjBEiZPeMqL
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:57:02.0573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd7c54b-6bdc-41d6-c399-08debbf7d402
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR18MB927612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_065715_705770_45B959E8 
X-CRM114-Status: GOOD (  12.94  )
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


