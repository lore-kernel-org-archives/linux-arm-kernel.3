Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EC3FEDA0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=; b=leZASNgxJ8+DpzkkwH6CkIs5g7
	+EsV716MREJnWJGABq3ztOKSevVQufEvlF2RmBAi071QyExWv3bIubXa22lfWJ1LnfqC+eeZpgJYO
	INnlFkDUcSpk/KYkmqly/76N3So89rsV+9WuBYQyjPIjnCVRhT5VvOZL0PxEIRLD7qRSSHjCzgMGB
	PEYMlgb4rTtT7Hh2dyXICA0UR+WpsawW6Ph4TmkW/E6474i0CXtJQIKqyIK9VO4O0rVG9cT1yTvlA
	TeYrGsYJBOlp8f1ADKufmO6judq7yeN1nOEhf7Bii29fU97jzd225KVNTzlngnjSpY+RP5Wt7J34I
	/RvwMvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSi-000000079N5-1gpt;
	Tue, 17 Mar 2026 19:52:20 +0000
Received: from mail-northcentralusazon11022136.outbound.protection.outlook.com ([40.107.200.136] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSg-000000079Lc-17j5;
	Tue, 17 Mar 2026 19:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH+kc95gGktTWK1kFO27bAw3YPQjJubdiQ8xnNuWzzmvrP0OBH2WdQRv/zwTEIk2GWgRXxnQziF6iMn7yEEbEE3SF5DPHhfHfw1eiVjy7DtMn55/XO4W2Jpvnr/Upt4qnM9uW0uZGPFcUQ4SBJvpq+vSUVEKoFDqeUDGCGsjVzUqMEZQE82ldP9x+06rP2cLizfptvFb9GrLbsZP5W5Tn5QPiCzITaznSLfj2zatmPgtEL6VjcSOnc0W+2G3zst2obaELhlcBdSop+cx/NPzvIYy6PHZf+rksTrIM/0isedcL1XW72Fkg4jFRwDWus2aTrGTqYqMJTihR4a7SCZoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=;
 b=HwjqrAbEQOSb1vMbhlg5CDTi0Pq1EFTNOUpMH4gsyKEo1KsVwGK0ih2+zZgrBCdl/fK6LmjOwwXRBf/vZQ1wfdSqQW1+MxeMpjMDEW/xvs6DlH3Qi1G5TUAZymZT1ULTnH5FzwjQjYYVyo46i+I9z9vnIaVGesOJ5KLIintXvDTDUKhmEnyBahTJsacdbvsh5PZqQBPzQgWUejFVPphY0WRyaKwZOfbXHoKyvYbU3BpTUk08RTNOwCBwxXc+ZG993OsbX0jMZPM4gOe2HtSINGGkFjwL1QWmUE6/Eqrjj8m7LWntvN3LMMoHi8Y9jpoNGF838Lf0pOu2jOl9YJIZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=;
 b=s//xkQB8fU2kIKADvcGrxuwxv+BCPlGNNTLxL3oRNsv+PEIFDIsOSpuC8eYlctmLJB0/WI/j960McP6c7di5TvPBQOPo4ujGDb2RsS3oi15prxOn4OmfygLns4tEfaG4Y6kOoC10+o1XjCTndC6v1WgrzXU1XB/qJQ76XlYfiud5f/aQ5Jci1pywiQDejhHnQbUqdLAU2IxgeDT2S7SI0EJwm3d1ajKlr0Qn6PjRI5ZqhZDbWh0+EnnneVoSTbxSm9pCV1QiIYpdIp9vfaVzAxycx+Hi/gk3pQjqO4+BYDM4V790sg5bP6NUWtuDx88MzFdy5kPQ8GYVdCKxJFt38g==
Received: from SJ0PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:33f::20)
 by MN2PR18MB3591.namprd18.prod.outlook.com (2603:10b6:208:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 19:52:12 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a8) by SJ0PR05CA0045.outlook.office365.com
 (2603:10b6:a03:33f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 19:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 19:52:11 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 8FE524186B5B;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:10 -0700
Subject: [PATCH v3 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-3-fbf790f3f711@axiado.com>
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=twei@axiado.com;
 h=from:subject:message-id; bh=ObP8N1UtvWKp2CtmzxJN3VKa1vOSFezLpJd8KJulKic=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDrb1NM2w7EhoDbqiS83WaFUAYmj1y+5kcQN
 EHMtwLX4n+JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6wAKCRB4EDBdxFrx
 16skC/0RprPmiwcCS2bL8Mh0rYwUstnXldyM/hHJiZYaOLyEW8nAvYMNDPTek48CfT6IHFYunPW
 LoIdxswwHU7Fm+Be76+mwyRDuD7ur4q29IPQjj5Cv16Q0A6QI8lJSWD8O4Sk4/feJim/0OdB1iU
 hjqn7ZfBWuhiz+Mh6XSv3FLiv5a5h+UGv6qTDUCdvPRFzjaX/yLD+dgTso0UrnW6Z3Ru2La8nSJ
 j9VI43BWYUKTACRgwzXjpZWieeQWGWJNgbHavBOxMBPBoT6rbLSsGBKQVv4XeccfarwZvaOus/7
 j0T2VxOkGv2WuSvpdKq/pYzjLwdrdjGkavNyNe2l9N/FYBVR7jIFr1OD6OpYqnc8K+cImh22GmG
 PxeDHlpcXjbaPURyG652bu3Za5zP5UgRGTO2A8tmPew61fxvpCps5pOdI+VHrziXIf+8YjeHBPO
 7+rvs07XYMe92nTr5oKmfRxWoxqoaw8m9ClkttuGg8t8Ruu/Y2jkVdK6mFyhw1lCq98rY=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|MN2PR18MB3591:EE_
X-MS-Office365-Filtering-Correlation-Id: 87108a5e-88d5-4586-69ad-08de845eae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|82310400026|376014|7416014|1800799024|36860700016|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: nKqhlNenAiXIMD3pICwNNEZH1eiQ6mMbOlkttW/I2zKlAF5KvJI+PbDWLO+knF3Ld365pssmYhMofkiiO82QyMx4HF8p/e3hx0Vp6r8hT7OWxxrT0xZ8n0dsFmZei5Pv696mQySZAjKi//Pu7XFD1d9G29YPK2lNIJP3XYcWw4X1Zbu2A7gfXDYo2uLuWz8ENbxTnNm1RBmPPRLg/VXRr+AQlOGxi9P3i2Usr39CoFZ0MO7WIzCXSsMZb68JKxJfc4G1IAVOKVjApjZy6Yzn3T22RbltAlLh1+bro/jFEenEE1cLXQ+gH29LqKvuj/+CaflUuUi0pug7oXWR9iHAwkF0ihsYsA2DALaHsLMrkyLKzBwuZa02+P9sB5y8R3e6he5IoytZZcIoQlzlZQ+LpDDF1GFkAjkkjHnyYITOR6UhKYXG9IXVWa2X+Iwe1Gkm+wDZIYo0Q/4BtTxzuiHAjv+tcst8pflBpmsmPQZKjNdmMEl2ZXFLBA5IbWF3pjqS83lE4nxIwQVqTwEYI6+IwcJwXl2vxarrHaxYNWBhR8WlZwYuMF2GDGff1UoPcyQC3rm4xGoSmeniHCgFzHi1ui4OYe5a5zVLW06WJG9E0+nAqp8vP2hcXih/igwyPHEvylGcfJnA3RI1sbc2hAc1Zxq0n3bGso0KjEYIwar+rkjKqOGeXgTNLNvhH8B+00TYc41L4mSUziUZWDnP0AocYtAvauzACLO55r+BwHihoQiMF8Hg4tLUK2jzlEEjEcpiE22AAFxSBXydsvzR2fE+uQ==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(376014)(7416014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8NnNlaCbU8nlaHc8Nbw7RX93JqV6HuX3Pw097U8DaOg8W7FDxNtBom+0P01BSFFKfgFVwmpnUcvOU8zWlMxxCVu9i2znOzpL/FvKZ6XmcKCPVWTcQU//xV/QRSXflvxv6x/BIQc/dLSOoKlU6EMbm2501zqHYsgTK5Etdzb2EonTzKFrcwzaMezm46irUR0HcvMdBnLKVcofuyRmhCF7iE30UjfixVBgVBJLgpazGVSg3VhhDwfKN9P12vX3ORUXUvMXR8Fog51ARsvsuyoCGwAqkZ7PpngngKC9Mo83HoTSoWSZXWEuKl2Zl7A8lMyu3WtLxZ0PIijgf7Ek1wl5NwAEMjs5SjkZbZ9pobzN0cFjP8TwHqbMh6TPfQLk35lnyLeM2xRX+WmPmRNNFfOy3mxutO3WoiF2JnTRLO0ca2a1Pw1yFZspIBbqSo/4008r
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:11.7923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87108a5e-88d5-4586-69ad-08de845eae40
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_125218_311955_A6D79D83 
X-CRM114-Status: UNSURE (   6.73  )
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

Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
driver

Acked-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537b431c927b73624993233eef43e3f..c33b0aa94de81c89b674e44d4813c4e3b95b7b2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4254,6 +4254,16 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 F:	drivers/hwmon/axi-fan-control.c
 
+AXIADO EMMC PHY DRIVER
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
+F:	drivers/phy/axiado/Kconfig
+F:	drivers/phy/axiado/phy-axiado-emmc.c
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1


