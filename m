Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F19D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mH915HDQ43iZzhpWYMGi2IX6tO2EeWYjzyG7aY4Zulg=; b=bKlVYJLYjZ9LeFR3WYR2cGEUpZ
	bfMzI+WgavyVpe9tm7AoZGAzmVnB34WZSHlaTEJvhduyzb5GWj3BTLJx9ETzUktCq46Gy+bQNWfY0
	zzyFBVhekRtXZGdlZKXbtgJXJDAhfI+T8sUHzl6XVNDbwO5EKgDylv4QxXL+PMfCV9q4EkzpRA77q
	OBtX+IcPgIch1Ba455cBezPPEPHUlwK2/1jGUf0NPeeM/PzVEgcR3VjEUSEQfugHkrq4BcN79u3Sh
	eRR+fma7d4Tneoh5H96Ku4NagHCSXMh3tGVOkuZYIfQ2j6HpQ8NaXo41F3lUepq4m9LTGA/aeSmyN
	TBQx5dJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYMK-00000009myf-1PDQ;
	Thu, 14 Nov 2024 11:50:00 +0000
Received: from mail-vi1eur03on2061e.outbound.protection.outlook.com ([2a01:111:f403:260c::61e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX1l-00000009WV5-3lvM;
	Thu, 14 Nov 2024 10:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXVEv3TCPV9eh9S4PWQiWE4kLz3bI6LQTMJzXkFz8hx8u0R24UfzXG6P80W4YUooM0FsCvKo7keYE+4n0HXDJNRH+oPLmuLCDJ0P0MckutojHzK+OexOS3MItP/zGAzoE8N5jcNqhFIRP7A1yxgJeJCn1WD5X7VEmEXk8xDvYgM2ZTQju3tZt4X4PTpmKErJ+I5lf9MTmXrrrfBbSC1IcIhVtWCgOG7SIjKQN3Uh7cPmoAej+J1lU9Lvnu5ZEA/Gy1yTtLe+UQ51e0dxviy4jzmKgHGYBkKaNjjWddn5tmwQZEbD2cl8z9vj8yDVmZi1Vty+uzR8/8kh2tErDDe71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH915HDQ43iZzhpWYMGi2IX6tO2EeWYjzyG7aY4Zulg=;
 b=trwJNPiUGJ3vXCC/yjHPICamE9vjHm9GES+EBy8xY09n/q0m2okPO3s0ICmh9FhNnM8UrOZlK2UucpD7/y7BcRPVRqpKkvj7eTP9z2PnB1Eo3jjSaids9056OFkVifOYAUxDjRhEDqRQdQYO+j5Gv4bueV/mDZ2gt84x+PqHp0J/LQyCLnElzwa4bi1gAHUF3t3UtyCOjlz/N4TMth0JJTFTt14NSZzSFOrlHkm60qniSLehwG+0HqvN+gaewaKnye9WJxXdtuyYNbGXzqQbKu9krioDTvpHjWQaXw63PTGL6cdBlybX3EIgJoX9ym2Ds2Jv73jRRx7hy7n9u/SDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH915HDQ43iZzhpWYMGi2IX6tO2EeWYjzyG7aY4Zulg=;
 b=XyT4sS5TfMcifY3u8ArEWW8FVdAYmVhg/G8wC3GUbSO6QVzUImAV5K+iykR2lF2LArWqZEQ7jyp9ulGYaQLhF+HDGu7u9+/Aaqw5/QmC5A6hTJFT7eVKI/LMHHSdMbFK8n5knJwRBb36xi9aBx/C1W+fsaUKUxsuMKbjcKJjyq7GMpy/u8d+E+3MQmkRspJgpmufdePwm1D81P/dSjMartBfdGt4pNVFzwim+Lw842JflHMJ3KsRNxZdGmxrp6VQg5/7DP1YaMozIkUWH/49aLrVutXlFPqjpJpgPvpxaGyAgQxAPgCfqm7bpuoeFaMaHSpfrNMg7yveTedLeMKDMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 10:24:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 10:24:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to usb-switch.yaml
Date: Thu, 14 Nov 2024 18:22:03 +0800
Message-Id: <20241114102203.4065533-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: ee022b8e-c35a-4b35-b6ef-08dd0496859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LcgrFixKDkpZxZtH6xqIOkzcxFgON+r1DPei/SzUNrb7KtuIzwTcuGCfDxlP?=
 =?us-ascii?Q?3jTuMD+ZOD7Rm2F2QReUqgT+ZzE6/IDdknZrvk2nsg0XU9Pdb53NnGyBjaqz?=
 =?us-ascii?Q?F608Fd6qa/3ahjmrvThw7hjuUyKAWrkhJ4F5Ij8Rm09pXu1M2ZinGYhvLBDK?=
 =?us-ascii?Q?XnTF+kYFPiKtErqI0Zu8J4g+iuAC4UENGFPXVcPrzQgtf+P9oI0D2O39XKwj?=
 =?us-ascii?Q?D3Oll64U8lvTBWlhMNB7DSR2y8pV0uhWIQQ3mLzthC9snPga3IEWgjoBd4YD?=
 =?us-ascii?Q?zjKKb9zKhlEHrKs8ZWuuTk4Fo9iLudqrtyczv0ReW8If7T0sbXpK7Fg37kyP?=
 =?us-ascii?Q?lxByBAj1yLEhre3UAOikKH/Hj1G8+zqgdp9xfU6CP6KKmfP+RZQ27ZVUOygC?=
 =?us-ascii?Q?toJ+AeKwWRxFXbUuKaVtQOF0uXyiptYx6FevYM5wWnu1Frmefl4hr1o9mpWd?=
 =?us-ascii?Q?fsoY+JpeaHixSWQ8iJFUMJQY35TNGfPOIRD1+MlJtyJyOXnIkSUewJ8YD0MB?=
 =?us-ascii?Q?wRyAUiqGOy+M5hKOJBbXt5djbjj6hG8qvscWWQ5H7z97vcHc2cvF+B6r83ZQ?=
 =?us-ascii?Q?PZ+0h7c2gSWWREfWrg+5MQ1XtCTTbJ99cPNkpfW0yegbBxuxB/rheWNgf9Kw?=
 =?us-ascii?Q?2HdtzeMuZFXcpfbxjOFlxtZ+HM+GAusZpoSIPLBTigzj9oWy0oieRjSx9Ovi?=
 =?us-ascii?Q?OqOsFJLjn2xtBIrVZ5B2dLUHcxpUYVsAfGtDn11F6imATuqKMwlGDUmalDZO?=
 =?us-ascii?Q?4xDwjmd2RaxYGCZ2dXoYFfC1uvGcMgbOXE5UNKpGG9SEyupwjTS6UKYr3bm5?=
 =?us-ascii?Q?OcWXIe6/YXZiEgGdfAN4pOF5/DcAV8NgbwvKxuAeyPhce8Y2wOhGEI7K8UNF?=
 =?us-ascii?Q?L/qnp6ZiCZq2mF62EC21cvRmDb8k0PB9tt7H5Fzq12jqFFaMtXfp3r1tI/ZC?=
 =?us-ascii?Q?nYCye+jxibrukrsVw3JP5sF28DlEp1yQQoVTp88pEJi5wQeFrvmmre/TzKEs?=
 =?us-ascii?Q?1ejOHIQMx8yJ+Jd9N0eYmbHqCXWwW+MC820YCxQ+q2UskHMD+OoKGLIvVQSJ?=
 =?us-ascii?Q?Zcb41FBvDKGWEzSGK+mTW1s8AGU5D/r9KBMdT5wrcsqhLTFlYVG+RSsN6ZHz?=
 =?us-ascii?Q?kSjuhZUcH4Nxb9fXd94j7iueTJyhmL6vr6csbTFMLcwtgsZXAVhLtbs+GlZL?=
 =?us-ascii?Q?a74BLsvbwoWhtytXXAfCwc5Y/G8rz9R3Bh7Efxr46UFs7VOPQf433eoRDz9C?=
 =?us-ascii?Q?Mm5qbBawhR8NSdbAr1ibkIt4rAN940tlySKXzedN/EzkuHS89vGuFgA7No05?=
 =?us-ascii?Q?tRttgGBKPwJJB0gdzKUxnmXt89eiuWNHuPZVLH7aSkjP1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2H0Q3UZSGAwVPQu6tXM5VdigjE6PhT4Ljbj+hR5lUZjdK32M1ov6j12iEFJ?=
 =?us-ascii?Q?lPHjNunWtMCsi6OKnFIOeL2Qffzjv6QHgih652r/9nYV5U51oFFupOWRWQ7U?=
 =?us-ascii?Q?8ZAyXQOnHerqz7U8/6EGy7yc0SOtxuDCfuZWyuxx+KwxKMGagprKA0AVKyzS?=
 =?us-ascii?Q?NCWhXEGjb3yijoU+n0PVUZKSEETNRA1Gdj3o3LffeWa8Jj0YUbMS+lJdiPJC?=
 =?us-ascii?Q?Tn+86tIxzZkbdnis0lsR4i4btgIow3afje6P+AHtTXkohYiOcBarJydnsHqs?=
 =?us-ascii?Q?EICbrVs5JmNeYJavM5kWdNSd/XcLojN3MSeLxh3A+cqqe2golT+gSGQbmbRX?=
 =?us-ascii?Q?ySQZpmTEd7L7xz0lN+we03Bm7zVQpQ3juiqPAm6j+JaXXXuZct5hKKAaM7H1?=
 =?us-ascii?Q?fMsLqUIT9m7vnSalsqfSLvdScUAwIf2H08Ae1VJ1mZYBJa+shgN3g4dqT63c?=
 =?us-ascii?Q?JEwzcffwURmCO301oNsv4PNmD3p0jHXI/oWSkxtXTpc7xbCEA/duy0BwXZPZ?=
 =?us-ascii?Q?2LJltyznBL19JxplIDwH5qD71yvj/idxvmApAWVLZgz3Y2piEJVmSP6tIUfX?=
 =?us-ascii?Q?V4MtQ9gOaWVqOEgtDVo+0p/mnEvuVJDXVlFxPzid4d0NIVTeot41uMJ5csNK?=
 =?us-ascii?Q?t8vbQmsFmWRIBHx0EzFuZ4v6qy7M7FUYA5O0ucUZyXygoJ5a3f1KTTj2ULBu?=
 =?us-ascii?Q?WJssTbZB/rj1r+Au4AEttRBcRJg5MozzwzuXO1jpdTo2N0J4Pks8iONvBNjB?=
 =?us-ascii?Q?OSJmH34wOsxX0077W597FlBYvHg1rkaq7PMeaUa06JnAEKnOmlWLllxMgY8d?=
 =?us-ascii?Q?5GC1Ftovg4Oo1pJ9zF+0D3CpUs6yjJA+Wd/BST3KcjrY0u+H6zHki1pmSEo7?=
 =?us-ascii?Q?zgAV28jH7BV2FnPAddNbFQ6jCPwgFghgqRxxKd36lelh5R3PmGpyW+/y97tW?=
 =?us-ascii?Q?tfYFLzQhAH3meJKhDIKi/LLX7U6BRQxL6PDD53AHH1OhB+rXmRtBZsKjeaBt?=
 =?us-ascii?Q?Ya7hsFmj0NpXJER3W8BWGi8kWm30u8+kR53DxBKF79eii7ukfdr2Y02waohH?=
 =?us-ascii?Q?6JPqBG1Zn08LzvG4gKuJQxab9jHsE1Ei2Qt1whD+YuyX5uQQtD6oesq+OJwf?=
 =?us-ascii?Q?TrgyjhXdJdJLdBJ4yUV6KiThJR8K/gRztygK6URICKDG/YYZbXXGvBsK6Ov2?=
 =?us-ascii?Q?RBF1oYWzRXrz0U0DbiJL7OFNXx4a7lwOUcSdduI6OANTQ3rTu9ZnbAT3OQx3?=
 =?us-ascii?Q?owCNngEqj8J0RorMbpqL1qXOWCSwIa4L6q3QY4einolHVo6e7XERc1Tq3Ryu?=
 =?us-ascii?Q?goRTVsXHRfwW1kaEltBFgvWkTdX2Rt5UXOSNsTe2HkZovQ8JMexozR0CM/+D?=
 =?us-ascii?Q?QO+M/b46LeLOQ24h1OSaZWd492NTy0CJNvtFBWLFBAS6vPIpMObXaSJHsQHM?=
 =?us-ascii?Q?/srxUzmH6Oh/PLhP18slnO182hwwQXlgBmOsw/fq+2qzAcRBoqnBp3lzOthZ?=
 =?us-ascii?Q?KwAZwvgDyBw8fF4vLfGxqF9f9L8g3+W+HFYFHq6MogVfts8blfxCng2qQsME?=
 =?us-ascii?Q?PHLnWuOKHYgacRT7degQLw6T5w8Ux47TehlI9mj+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee022b8e-c35a-4b35-b6ef-08dd0496859a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:24:29.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU6i9t6Q8UcR2glL7tYF2F+41zwecwz/7bp0jrutogMDqeUY+rIez3uZtxrY3XmEn76XTvCdLwDRwgUEjj/nMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_022442_025236_B000A7BD 
X-CRM114-Status: UNSURE (   8.10  )
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

The i.MX95 usb-phy can work with or without orientation-switch. With
current setting, if usb-phy works without orientation-switch, the
dt-schema check will show below error:

phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

This will add a condition to optionally refer to usb-switch.yaml.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 6d6d211883ae..1238792157f8 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -118,6 +118,8 @@ allOf:
           contains:
             enum:
               - fsl,imx95-usb-phy
+      required:
+        - orientation-switch
     then:
       $ref: /schemas/usb/usb-switch.yaml#
 
-- 
2.34.1


