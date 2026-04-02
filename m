Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89673D39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOi590e4zPmoM2GtJDI1V57nl5fPXBjONLKlB5dZ8K8=; b=YaSR4p50M6sRI8tSr0NxE8Puky
	+L864wwLu6SFGbtLQwajVq2QOIWw67mJirVjRbzkdNMJmatLJSeIVvSLtSm3VBMqsbMH02ztB2PcZ
	8kwtqBEKWYklW9lVlQ7XfZdxvuZ91B4x/8bQsWiFzqUwkkXBJqyQ+4FEbCBDd9RmCaVAGubL34/qe
	TjjtOWU8CDaWAPMeIWQ0WH/i4HYwYbqRXTtZm0S0kMWqzEQx0OWdRlD7Vzj9Yh5tNkThyiXKYg1bG
	ZSxBzpO/HBacKNm5/wQRVzdMWdDB0vbmfmEqT/ICyCfBGrhQIHB96OdvhpSbS5vHWgCi7IvhTn9vu
	oCm8Q0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eh4-0000000HIhD-2fGg;
	Thu, 02 Apr 2026 09:50:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eh3-0000000HIgO-02ut
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zOi590e4zPmoM2GtJDI1V57nl5fPXBjONLKlB5dZ8K8=; b=lA4oX/crn1fpkzk6uUzTwf1KTH
	FOhivxCLWYA/t+qGe8A+xMqQ5zX2lPeOs2Ua0DhhELNznN9x7mkz8HWXyNuJ0PX61iyliTsdPoZjv
	wHqaYHztF7lH9AHlFTnnyawWnTrTpjUg3N3ZTrxvZ0K8M/eWcyDzxHkJGFL9z+Hm78fNHGvpV2Ot5
	eDoZm19caqCc1f3m3auNPNaMnigJz17z4rU47zi8NB4W4qeCuk1mWoj0g5rw+fvpSNfFnwjyjBiIm
	fdtJs6eIs1gWcji5L6mnKZDbzXUqH2CSxb8hmlEddxqBjzcITY9Q6kBaLPNSsFUUaG6XHSC+sbrm2
	wpa3Y3QA==;
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Egw-00000002A9E-3rTn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbehUwCS4RZ8tq9WP+mBM0KucT4DUp0x+ld8FqTN/zu88JN2pBTVXx89eHJXab6PgXtTZ9XMYJrDAtCPW4Af8z1Cdc9ZDWA2+MRIyV3D62QLxFqsmYBgQ7ge5HxlEe77/cQAzuKnxeuPUIcUVZs9AS/kxrenPm6fQqvg2lpghnFlCHml0mxR+m7VxgdAVn1YaSWafMQpNwXNBnNSlYGJvLvoHWLMnnkTTVF6YK1hpvOVaNpjSlRpa9LetdWp392Au1FVdMxUGObjuOHakwhAKLmHIVVqM44UR9Y5Jb4o+LrE/rwpnkcH5wS6Pl1G987k6X43b0CRyGIUMYFH6wyK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOi590e4zPmoM2GtJDI1V57nl5fPXBjONLKlB5dZ8K8=;
 b=hlzb/fqZvqgyN/GxAEk6yvnA0H3u+gk2h7nymtkiXU/Zp2FC6lF9DccQvMFiL/Ct8FauWjsJhGbxBf2IZy/kSLsx4v+w38U7GvrKcYqo1+nHGvyAE2Ev3CJTFXQ4e4QkU1TVPE/zUF1TlNs9da3kaThXOdvuMKcDhs2d8KhK+Zrhp9l0XTbi0uW9NwCpkAXESuMIgGbWrvZLrqGQ+xgW/b1G4fCT89KDANNZE/U6EYmydRXXan8EGu91C02NyCxWxW+fzDRI+4QPW4sZgKwL41FvvL1xoEbh9E/EoDQ5NJPjozjBR3vHsXry0R/xGNBbtdv8bvJUgwsJ7loXC7Hm2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOi590e4zPmoM2GtJDI1V57nl5fPXBjONLKlB5dZ8K8=;
 b=lDnWSZViFODQDqaL7QDZetgQI2TB8iVcnBcH1d7Xh9tGMRAl2EG9mkAPsZPlKEc3lkB4odStlfLqxzSV5b8AUK1hl0R/5YtJsoJCofQQfvFVy1lVsTPfw5ZeopZP8ViCL1oq7DqRM38yNCkXAcZTFNhykxNQg/on3xgNeyA0WjNukEzX0Sm35kisi82gGSPkH99d3JgroFcDTH/ZdILlJTjk73sAv171mv0366D9QnUk0blGX/QS9PqNPc4dRwhvGqL+7yQr+A19+NQbx0A5Oycmvgy/Vm6Wv6E+lZCUw9930/pdF3YuqjclLRDJl+pI1G7bOS5cQZ4FQoI+Xa0Ytg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8471.eurprd04.prod.outlook.com
 (2603:10a6:20b:416::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Thu, 2 Apr
 2026 09:50:20 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:50:20 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 03/13] PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
Date: Thu,  2 Apr 2026 17:50:57 +0800
Message-Id: <20260402095107.205439-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402095107.205439-1-sherry.sun@nxp.com>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 012c1792-fbde-4ceb-468a-08de909d4071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info: cLjcNa/7sibJh5uNCwF1eHIQfj9EzEanu/54A0DYfTZF/2aelDWaksfiXHBhW65RrZGfW7nuY0Jt+JLZ+ILsnpmlSRoAErxo7B6FETtM6qWk9aH0kc9XeQ1q7SpBl+kbZ9DvQloVgHT+9VEv6xFFGsi5OA+8bgvFvOdSkGaTCxWibK4ZdhRuNfkW8LNY5e53Gw6mvWBQvRYet7aVMqmQomcD9EGaZhjS3wfxp7ReXuCPD+NzjRaH+XaDSwQyhYNMimJCrDux9HgT198fWmItFCCkDKColO4Rw4FwOSH50o0qoKoTHmWbK//xInw8a+Yf3RYcLVQmLwAeu8cMlMUHM5i184ElTDccs/kbqzGNNJ/kz2yey+tlt0qyYL2gZkX675xiE9eJhqYuBN1nwb51ArS2BckO6n38eJyj4SkcZtXsJyOZpd2V9dumC7jak/6OLOANaAcrF5aIr5rAVK2lB1ULZNPkuOnZZXZp/1ukPn/cMukf9YoImyBgVzsw75iaavVZDvF95dnLFSJh95VNrBJ/yqcRrg4OvpYOOl3iohQWM8BMpj/qpncJ5DF6vQy9BT8AY8IqxO8gIvGcC3mXBrkBIDtv0EXmmayvzbkDXCftdB6ILvmKqtPygmPEHPed+mWCSJL7El8BY2fCwQd8vsRg5njwzt7ORrDE5O2o1qgGDrfEk7OYFrzwLuDSys+W1MKj2OcPXRlUp6OkrCv5+fDomoCMUY0fq0oTFGsgbpHoV6mbAqI7+7Q8eaRVWx6QGmvZtbtQ235AkQv/B4CQ0apZSSveDP5yxmbglTujkAjcYkIsibkKVU0j7QBjdIya
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9ySAmtgnpraA52xHMkfw6ozdnAvhXeMEbkRMYAMcWeXWFzcYzOwoDSKEMrc?=
 =?us-ascii?Q?XjKf59tpKcf4xU2Qeg7tDNQ2x/XpcVQJ38cBcTxSO7R6CsVL4ZMUssqQpdyD?=
 =?us-ascii?Q?nAf8C5BcN9rY/ocx2ORltay+hTDckeLw/dBBZ17zByTpMoxh8/fG0uqgO3uR?=
 =?us-ascii?Q?Wbdu3Ofax5chHXEZiL5bRqH1D33Va/r1zOXIPxtXnzekXf5anzGlSVYVOkPP?=
 =?us-ascii?Q?aEuoCqvsqUDjxtTtH08DlYHTetxm8ypG0p6uvPyqL3ZMw56pBKsPAO6OPr5g?=
 =?us-ascii?Q?m6Z2/RnbdMwLAuewVMzwTHfgHEPdipuKNHGsMqKKoPqfg3UAB/vsXO2Qj3c5?=
 =?us-ascii?Q?AEF5GKtJldgjngTTErJ/11romVdL9C8rEvG097p9mc+x0LYA82nsf5srPSwK?=
 =?us-ascii?Q?oaKBt69cGaomoB47HUlaxbxRwLwquNsalqer0+QJJmeVS2oDivtAlkMmDQ5t?=
 =?us-ascii?Q?lVVWZa6eHWCKc1f18tECRp2g/tbzBP9FPJkSdKt6M/YaTgGf97zZ5Gfby+Da?=
 =?us-ascii?Q?SrmRhlKovE2YGZjnNMM9N6NE+29i4A66udvCINKcW4kPri4rG1+yzwSm0nFR?=
 =?us-ascii?Q?zyjmQFaJ17Az5TIJasHLT9RKsH6m8jju+0rxDNKxAzbr5TYnnYZqYj57yC1y?=
 =?us-ascii?Q?JlhGRJbjy5RQORYq/Vbe9v/kzt5Kralc7ABDfiVUGUpatXztFPXtOm5fO6Nf?=
 =?us-ascii?Q?v7mhbS9rszo1i5dL4cpewa4Qe3hq1Xz0gRxDDodBKIOwe/7TP2AVBAJqaQ+C?=
 =?us-ascii?Q?6Rw8KoJYGj3L4HmbJiodMC8o6WFW2uU5O23gRaMA61JYd9d4q97R5IHVqzRi?=
 =?us-ascii?Q?1cpt5sqvrpgw19NVs/E4vCGSX/eTNJRI1rhaMuNPojl+e9hhLR0FJU0NXbxl?=
 =?us-ascii?Q?sFtZTEosq4d1yol0j2F7lvhhfeAWzGFalZwZ5XgiqYG26BNq0xvbN1Bm/hRP?=
 =?us-ascii?Q?8QOfa2kRGfeGNcDY9Q6y4CZ/m4byIyjfFEQStWktT3xEM+lq4P0Hl3+bpaMR?=
 =?us-ascii?Q?Ahd5AOQzlycrkAHabP/FnJK7RBJSCd0ohpLtXZ/1KuU4I3/dutsLB4xyOmXh?=
 =?us-ascii?Q?lp6IEUlkTYSn3RWdQtAPouxpRWxn4/nypIPmf+bF37c2BLZfSNitmPzIzIlV?=
 =?us-ascii?Q?/QC5LCgteFkh4CTAVXOL4R+/GWNLsCq0zWfywVxEUUGT+K07y7phY5coyB7D?=
 =?us-ascii?Q?Cniv2kGzLiKpUH79ptTAmKkf1JP2ARGXsI9Mpx++N/D8n5UI/NpuGDBTFeow?=
 =?us-ascii?Q?kwnCTv4kDcutkME8fiT+H4xmOyFjFs2Zss7Hzs2HuAeqTNm5FpQXEU/G56kX?=
 =?us-ascii?Q?2CjxhRloNQfS8INgGFJFuTDuWbBLDJxYH4WVvj0euvU5MmNbjyF58prWYGgt?=
 =?us-ascii?Q?CDsAP3JkR7s3aNxuNPd/+Rpz/eJz5tukHWZXyAXdh4bkPVrjiQq/oy3Rm0cH?=
 =?us-ascii?Q?x3ND0h+LXAv0vmH42C0VGBWoMXWTrhnR16kZuwsqDO5Vdy/RJkmrFaCSpfhK?=
 =?us-ascii?Q?R2vvDn2p2kT3/PPDbiQK3L9Tx39aZoDgqv7EQMfjaqquAWfS89pHo2GUeGd2?=
 =?us-ascii?Q?Fyi+i3TnSa/HJVHkDkxwnrrQWr7AIpNLakaPupzQc8x5egFS86oO1y/nwUxB?=
 =?us-ascii?Q?HhQDMwMiEaHai6s1qwISZgtFvg2LkvA0e6gZIe60r6GVJIcSUqj0umTRK9sG?=
 =?us-ascii?Q?/0/mxcoQkZz0DSAaXA0OEflPSexRd8DqlU2PQESLYANkMaqKqsvMXVy2YLEY?=
 =?us-ascii?Q?Jja84fMJfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012c1792-fbde-4ceb-468a-08de909d4071
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:50:20.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEIHekWsvKlhbxACGhtW25FdkSELqS18/xpqr8RL9Q0P23Wtc8BWBItVE0G59VVSlg6z9QmfcdQSds06HeD0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105025_083868_624C3600 
X-CRM114-Status: GOOD (  11.20  )
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

Add support for parsing Root Port child nodes in dw_pcie_host_init()
using pci_host_common_parse_ports(). This allows DWC-based drivers to
specify Root Port properties (like reset GPIOs) in individual Root Port
nodes rather than in the host bridge node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index da152c31bb2e..f6fca984fb34 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 static struct pci_ops dw_pcie_ops;
@@ -581,6 +582,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge = bridge;
 
+	/* Parse Root Port nodes if present */
+	ret = pci_host_common_parse_ports(dev, bridge);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
+		return ret;
+	}
+
 	ret = dw_pcie_host_get_resources(pp);
 	if (ret)
 		return ret;
-- 
2.37.1


