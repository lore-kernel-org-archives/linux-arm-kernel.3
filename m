Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE9EC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtzJlKviKTg4EeOJnu9m7mXPMOcMeOOkIaqhictCvJU=; b=SuaD0nQoZ0/+6pSoyJ+RfQ644D
	DLVTXNmFzpSxMRJwSw2PiapfM1ByXRmxAn5I77+2POYuUTxpbN36aYUyty+D7jOnBgmhHvdiP5k3L
	528Np0xGV/Tn0YFpAjPLWRZTRjZeNYYaoGxlVofnu4n3gS6nkkUwzFZiUChoSMVVWedVIuErC22yY
	WvCah5kPmYEO9fpniiYVTXMTSyhhV5vHL/MGhsZgrzNQ6UoaHswxZ1QuHWEclwhfeg5wFmlX6N6aF
	GObOFt02Q6dK4pLgI0VQ1lei2hW52mBb49fS9qDMMqbP7yk/O6kR511Otylv5LSo5Ms+HNIyVVKu7
	RJ+Hd0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhP-0000000AYl7-3nqx;
	Tue, 21 Jul 2026 23:16:31 +0000
Received: from mail-westeuropeazon11010001.outbound.protection.outlook.com ([52.101.69.1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhH-0000000AYh4-3OeT;
	Tue, 21 Jul 2026 23:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkJ8synmhbOBLav/opGmHNwp+D3vwnAdTVKC5DcSn3ClEVzaEwke1wzUWaUEo+wv52pui6BNXtOEeVjG0uxUkXNdi8xQy0nOCm7/evOjp2GXpEn8OotNIfq568TEgaRfh73j9uMO9QkHi4almtZAoofWtmHdyBCvqaBDO7fHIMf94ATPw3tLVo6GXyYkm8k2Y2t9l/Gk9YMUdmIQ444TetbSYrKsqiBf7g6yKNNlwLC55IjFo9fDbLLN4536V71AmwbW5mBw0A0jgs5eiWeE9WLLv/Dsu0NUTzDqVB9d3MZ0k5VwU7Gz+1ICqBGvD3NL1I7ZbyOTt48BectJmB1wBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtzJlKviKTg4EeOJnu9m7mXPMOcMeOOkIaqhictCvJU=;
 b=TAi8M4Aor4Bp6CRjYUM8yc7tKD/UDf7ESIXZIxEsZ84WxsUw/KfDupSSSrWypYZK82nZbaYyynnoCAGfd+9giaFTClcoByes/hF+FMdCd2OsSobd1iY/yvsRhB50QUgjmF3PCeWmGSkFpuJ2aQtPM+nfdKik0VP73FrDsP2EZxAc0JGW1P9DFQv+dMHmFDfyOHcFGGeUhq9/OUvPwxST4NDUeZtmOe82THNcozRYtOx/K0ZmOk97uZfbaCBEMNTs01L718suTRBI1X4UIXMebAV9yV8DH6hy6i6FfIDzXQoPB7mRepb1nk41C96OzSftBWVjW5hPlxZ1d4aQvyjUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtzJlKviKTg4EeOJnu9m7mXPMOcMeOOkIaqhictCvJU=;
 b=nG9fsCVDDmZ6A+7BUTf8ZyGrNnsyXEN/rVSjSi/LW3ThL0c0FXXqN5OD6/e3Pg3j6g2jVLHmGsJugaFKg2CPP7pja8Or/hMYkZfoUFNUrFPOB8FafgA2a+GlQ6hvyY3Yj4B6L4G/xGa2Ukrd1gjw6rB9m5/tmqSVv1RLWGdECpmrxbaofnXNj4pbqZhT/L3KahLWDbzWiLjGOjvyMFcyhXTgxCkersLwNXMUVp1Cieil5y/2Re/amWFpN0r4wzUFzB1ChJc9AS1y3cNljQjthqFxJYcorb3v/1afz1OykHSg+z77Ot8jjy5vuqM4wwCu3ZcXtZWOVrosm8lCd73zEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI0PR04MB11817.eurprd04.prod.outlook.com (2603:10a6:800:2ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:16:15 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:16:15 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init() error teardown in reverse order of setup
Date: Wed, 22 Jul 2026 02:15:55 +0300
Message-Id: <20260721231603.67865-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721231603.67865-1-vladimir.oltean@nxp.com>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI0PR04MB11817:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a948e20-66e3-416a-34af-08dee77e0fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|6133799003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SvjkhI3AT4KNHfIP0/s/0fqNfOEbcF3DoJeBz2GIVLMS3a5cml8hRA4hhf6FgIno28XBkiDMf6QyOwcuQ8A+ew7hOzg89VEOK3iaV0XqwzFBmTu2TpcL8+ZS7srQqlUEi09dJ+AqkFhYdvnNsb9okVpbeyFSgrrzjkDbS2ipaIWGszWbrhyy3r7PMEf5LOvk5yxa4U7Fw3zSao6//bZy7/UeER9Up7865QcOBNyexlm4SGP31nHwmsFH/bWOdGOa7pkAmik58ANEKATEylkPADoMOqSHxyiKh19BrDKf9bo0ygmHBvreIxDdrRRO/CrVVQo2N4m3nuMnRGoQQ7YipiDVyTJ8DbIaMwiPKVYJWbnw6A7j+XQH2m3ls7Oj5xZFLLJu+Hnm+LKctkF5MD1w0N2+QSGUL3wbNIAeQveOOANJqSzsh24aCT9DA0fzqTvaFNC8IFy3eIKkfwvmfrxfxZWAWu97Ho39l5IycLJ5Cbj6LMUhGR9wEvYIojgOvF4iKT/xAVLxigHmIsUa2kGe0H8XMi96WpRg5uK7iwhGoe3tczJaq8I0KNW1VnyT+vwZU/fCoY4Lt5NyuBhs08IbuMCapJgqlD1Z2w4OCn05eS6ny4efoGtQHxRERExYjC+joaLGGPFXkksVG6vhDzY3/xc4JrVnGNBvyNJKMpYzwnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtqNL9I84nId4iv1KNDQer+JFKpOuanBnzgrqd88XxyZsB+oj24uyRiv8DLF?=
 =?us-ascii?Q?2HL5l2rqCa1a01Y3iUhVI5Cr1ZAOyyrVedYzZ84MKdSn4HrgvX2CBROySLJu?=
 =?us-ascii?Q?1RMhMMsPjzQAXGxEkVvtpFaiWnylF6otL9XddVNpX6VoTglyftNYw7Y8LFJp?=
 =?us-ascii?Q?lQh7hMyn20O+h+LMzk+dRSdOuP9tb1oUA/XSxPK53hP112btaILsMDSguPA6?=
 =?us-ascii?Q?P74vALtG4bX0fH2ryp9IbLuqhdCcTqo6gXZNIsHHBxQgFL7aRnUD06YFVSRZ?=
 =?us-ascii?Q?uTrqfX+Yt8Bz7dsg7cYWw2+e2kDuUiGForbT5uYTCnhbKNMbYZS6AQCkdttJ?=
 =?us-ascii?Q?7st28wip6dQorhoT7IYo6DrQf8BkNgkKNxFNtK9alafbXCsMKZ7V80owzGTA?=
 =?us-ascii?Q?2XCi8fuvbgjltTazraoPCv3LYL6DdE4hbctEqv400s3V8U2z0UJDMt44xYmj?=
 =?us-ascii?Q?BfFE0p66VO18Av6YSAjpEpMAz+DLShawqpfrOpoOpw/8CHwgM87ZwCofxgmn?=
 =?us-ascii?Q?MCb7VgdN3TUhf8J82axKs9aS0RXJ7+rEkqGdoq48EPqWfKDpRd1CJ2VVAluk?=
 =?us-ascii?Q?Fui9glw5cUiltUx9jaOVlCZ+8gZLp5zAB+5aUc5f3tON29O6TI19ZmD0zbbk?=
 =?us-ascii?Q?woV1D6bQmt5t1oZ0NCm6Zd+zBFA9k/eqGoopWG8RJTjssLyUlX5JCMo4rNzS?=
 =?us-ascii?Q?x0zhlVvBOdmS5gUZCXbctXTf2VzcTDejNYASjFm0M3RKyHvC+M/JWIcDc5ZP?=
 =?us-ascii?Q?Lrgc/clzKtAvFBu1XYGQ6ZV3sZV0ZcDW/UJn7p3/+HUBZC7Wr/13N9D/G+G0?=
 =?us-ascii?Q?PXfBRhhG+xf2whrbBo1yLmgplGQBy0mFfPve4GBc7PShj7/oxbpV+eXVjWqH?=
 =?us-ascii?Q?ymleCKiYj6EncqY9o9a9MZWfHrAmKFIpQCnXS0FHd35EwIfNBEXJJJ+An9Jz?=
 =?us-ascii?Q?AO7xQd9dTxpvycYaiOqGvEwuRujI8s9IG+/Z/ZA+IzAQoxC05Iu+sI5Y2KkU?=
 =?us-ascii?Q?ql8Lse5IubPx2HRN2QazzWDiR74A57oxrAEpCFNxDwCYZDyWc6L3HG2ZC+zw?=
 =?us-ascii?Q?xaIO+oEIT6eV16VFyP6jYqjDgkEVCW5s8flK/j4RhGeks/xxg6q26bt714No?=
 =?us-ascii?Q?2/0z+hUrdLpDy+dEct5YlQSWLF0xzYQE72UpvE95UcvBXbY7roi1UibuYlON?=
 =?us-ascii?Q?WH+WSKRiTdXAJxRimldQRJleNYdVOVgyuQBxIEJTSTbccLCKiMolEoPbNzY2?=
 =?us-ascii?Q?XntwmH1864PpooP1FRcYxVbCk2hJS8SwBLK2oqiHd0PofKJYhxRCvLM5Duhm?=
 =?us-ascii?Q?/6Bg+yJ3y/D5S3WXEjxmoDAtrxt6MOcGOvT4zHaC+XzpWAszhbroL8HwIrI2?=
 =?us-ascii?Q?p1UP7oilDWI5m6Wwi0cow5cpr5cZdQ5/UYUgpaD57iqpx4G4xJS9mHu/Iggj?=
 =?us-ascii?Q?i8eK7wlep83u5I3I6J8/1pBtaoX0YGjigwFXKcgrDuX68QYPO/qzsWGeotIT?=
 =?us-ascii?Q?VBLYr7FwEFQqOPbVGL8+hHcIl+AW9LBqBG9YDWKIQ0YRo7lKmnCjDjtLImmw?=
 =?us-ascii?Q?OwXJO5m1hRo12gHtJyuqweW/BrBYCzQjtU+q5wVbFQg2XcRTIW7YzuwlxSfD?=
 =?us-ascii?Q?T0IDmKqYcTCPwOr7Pe4k3vjrddhaX+mfmGbnQjg9WwGTvzGxRsa9HkTgnw1w?=
 =?us-ascii?Q?djxvrtiMZ4Snm+MNgqN0TwnQ4ahrSPqNZhmMwFT1Ogl7hVAef06WTSJZxadf?=
 =?us-ascii?Q?3645F/RZVw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a948e20-66e3-416a-34af-08dee77e0fe3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:16:15.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyay8RTBl5atsW9FRywCuOqGQlg8d9QlbuHkQUx4xzxYlCKDcP1Y2vkFuDXiJZRSi3jVQ/zAuOH9hWf6mN0YuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_161624_007022_070DC87D 
X-CRM114-Status: GOOD (  17.01  )
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

fsl_guts_init() is about to get much more complicated and the central
error handling procedure cannot scale in its current design, unless we
add a lot of "if" conditions to detect what has been allocated and what
hasn't.

Currently the code relies on the fact that kfree(NULL) is safe, but this
doesn't scale to the case where "soc_dev_attr" itself is NULL, because
this would dereference "soc_dev_attr->family" and friends of a NULL
pointer.

Convert to the more typical error handling pattern where the teardown is
in the strict reverse order of setup, and a teardown step is only called
if its corresponding setup step was executed.

At the same time, maintain the optionality of soc_dev_attr->serial_number
by not checking whether that kasprintf() has returned NULL. In the error
path, kfree(NULL) is safe, so we don't need to add an "if" condition for
it. Michael Walle has confirmed that ignoring the error was intentional,
and we preserve that:
https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v3->v4: patch is new
---
 drivers/soc/fsl/guts.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 9bee7baec2b9..453456f31800 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -227,17 +227,23 @@ static int __init fsl_guts_init(void)
 	} else {
 		soc_dev_attr->family = kasprintf(GFP_KERNEL, "QorIQ");
 	}
-	if (!soc_dev_attr->family)
-		goto err_nomem;
+	if (!soc_dev_attr->family) {
+		ret = -ENOMEM;
+		goto err_free_soc_dev_attr;
+	}
 
 	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "svr:0x%08x", svr);
-	if (!soc_dev_attr->soc_id)
-		goto err_nomem;
+	if (!soc_dev_attr->soc_id) {
+		ret = -ENOMEM;
+		goto err_free_family;
+	}
 
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%d.%d",
 					   (svr >>  4) & 0xf, svr & 0xf);
-	if (!soc_dev_attr->revision)
-		goto err_nomem;
+	if (!soc_dev_attr->revision) {
+		ret = -ENOMEM;
+		goto err_free_soc_id;
+	}
 
 	if (soc_data)
 		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
@@ -249,7 +255,7 @@ static int __init fsl_guts_init(void)
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		ret = PTR_ERR(soc_dev);
-		goto err;
+		goto err_free_serial_number;
 	}
 
 	pr_info("Machine: %s\n", soc_dev_attr->machine);
@@ -259,13 +265,14 @@ static int __init fsl_guts_init(void)
 
 	return 0;
 
-err_nomem:
-	ret = -ENOMEM;
-err:
-	kfree(soc_dev_attr->family);
-	kfree(soc_dev_attr->soc_id);
-	kfree(soc_dev_attr->revision);
+err_free_serial_number:
 	kfree(soc_dev_attr->serial_number);
+	kfree(soc_dev_attr->revision);
+err_free_soc_id:
+	kfree(soc_dev_attr->soc_id);
+err_free_family:
+	kfree(soc_dev_attr->family);
+err_free_soc_dev_attr:
 	kfree(soc_dev_attr);
 
 	return ret;
-- 
2.34.1


