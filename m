Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91439105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=; b=qukRXqd+P2TMu7o7LtabGRYGeY
	lF4p7bcfhBocP0LhrMs5VzjmoSP1oQTbhyVosdRzBRuuQH0heOpI1YAEzIJ9tkvKtB2XkfSlHbk46
	X27xs2ensn6lEEMWsX0Z/5zyql/QiPpz/3TYDOIXZkhkAOJK4iwEFWDELnJO7LG5Ed9iSdC98l1ZQ
	dKxhNeSoTp8iFG+QYXJtD7rWz+04wpTqlzu2bSpqYNBvBDg9wZ5OQMBIBLF3gFxBRLVEVuDDeSZon
	X/32rwClaBmdHSiTvcUtUhEhRwR/bZ/lmVZ4PNkqzBHisj56Ba+N93ctknm9vRu0TKmqw4G1cAxzO
	FqDnmgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eos-0000000DzyE-43wW;
	Thu, 12 Mar 2026 12:07:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eoo-0000000Dzva-06k7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJohdoKINcs57WfwnYj7OkN0Js9g5q92Zd80t3uhhY/h/RKUW/K/cIq3hCmDNd6jPLigD1XSa0QOkJqSjrck02U3Yqog+BM2MSqT5B1YEpFuGTjiyt58LvkoPOMrQOHKIoY5sC2rQczDIP3QbwXXGVuWLFldyqgLpGK+iTUzaHu5aIQtam/y8J6U+QWIYZm6fRn4h/6hclhIEVMc7xUuT2mUtopyPUqcuykCiRjUtibiaTp76RNCyZLX8qDTHYm2THjXs54PpiCnOdkuN4yxpssm57HBeEJKrNwXx31aAVHZZT+I4ycbjQsf9cJypkaOBMljaL65LC1CdwiLK549sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=IjD6m/kOgEHIAZ+q/FCequdVG5yHOQBJrABsuLXeFtQR0uuTa3JqmjfXMOutdZsLyw0ylsle0Qw4AdvqVVEj5+6FSuerSJEb/LPhR10K2+MWWdy/p5CSuTz0y8syCyAXy3qExcbRZNFd4erLMi0OP/VwH4B/pWE8IQXfDwgSZvT22kQ2S3wCFjkt5QbpqDJR2c0udau58akGTZV0rGC4QtEt4lIesyBp1xvHx47IdgN7qXd9GKPJNVTLbPL8c+OcziPyWnLQTqdVEkIJH1NcjKrA3OU1iIvI64LtUJb718hczgEJaNLM8eh5S4IN5ND3oNOsWYGi+pzxNKKe/mrPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=T7sFxJSZ4k0GBy0fOLiTmIaNwzXS5fO2+LC0YauAQcGMFRQ3nRjUUXbx4kx98RJlvfl6/LIi7dvavIABJAxyXvmbvDCC3o5CoHOAVWmHDnCaXTftfZ0Y+0FQvRSyKp9hwNHpAnKEOd1qvVCSLR+oUKbwSXfVjjUaEJPvU3qNl3xmbnSMKpRmTQOK0ipuRYLxIGMynz/bd1EUqjU/xbQrI1KEOmckOs9m5PVAVquQkGtRnzqf8KZA/TQwkBZz0Yc5yzrkfiLqS0WgpNMVrhnIr8+mBN74gaBqz5e/7cjlrVLKqDdNDzYxsFf4wFPdHOR6ia/Kucvh4j0siFBgJ06KGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:06:57 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 12:06:59 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Thu, 12 Mar 2026 14:22:47 +0200
Message-Id: <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::10) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e322a5-0196-4af3-2d79-08de802fdcb0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1SnDMhxVsJPpWes43HW0iGe+/m7Tfjpu76fxOEMKOhxxBkor6TNCK3FfE9RyMtS4uml5sHEo47zH/duOlcseMSoMASQNknFeqSgeyf5v5wvREJWtWw8XOz5+y0ryLPkGzGOG0aPZKSvKjVZhitegyMWER6OLDU9Rxt+q1sTx2+uLcFOWvU/d8OBTjzxR7O/Cn8bKGrIi6j34N6kAI/vO2/h9cYIijZYnxdFwsX4X+YQt1cJ2xInEivxQ+6QFu5TUULoin7fTlJVl6QdfwyoPlSCYB/1O9gZC9NSwRgRxlgkag1O5c91pGOnHJkcFkDFajXRjBBMBEM2KN/MWJpxHbYMvpwOuZyaML1nt+HLe7uKGf8fr8BeN0tQaHJguxUVyBgb2v5PO/FmS+IBHHQrv7Yfw1QyJxD8wfiJHAICYjEEchnJ9loN6nPT1bIB/YQA0RFZuVNyLnaGh8iUrK1p5GaSU3QHdHnIbsX1FQXSLI1H/JIay9Xw8DxWMkXODebcP/HZSjiIBewkL6pnnSO5KbPx0PANdkHR1aZ8TGq3yOiIDBZ/on/VH/NswRlXk5NW6w8lr/Eoc00vpcJukP/YlymI1rUzXIAjhQBTGeqLq7xQgnlT7EoKqOR8A63vanzTLg8xvyZFwWGqy7DBdZW72kKAPvNHxtAtcQaNDD05bEskBdY1dve28BKA2531e9i3d32zuEG72F1IBtxgmso7EFf2Xwel0QPVTCtGXwa6NurI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?94+KbgS0+R7/6XyxGG/9DcrsG71csLiuAN9LQS6D2UgCb5ViAQ+Q8Redan?=
 =?iso-8859-1?Q?xWwuKS5qh9ClH96qQzDa8rTQsQlyvjUaOdtGHQE+DIn9PA9nZZxqyH2t9v?=
 =?iso-8859-1?Q?/oa2e0qwo5B23Ti6xwIIc+uacpcVe7UKktV8HSnAhClO4gRFNnQvjsz3i+?=
 =?iso-8859-1?Q?zukkbVtLtryzgyuATYXUyXivJv9ouOlYZnJSVEMP6dtXOLYZbD4mDWvG6I?=
 =?iso-8859-1?Q?0eqPaoWZb2udlKlSp632c2zP0cL8JEI3p21pfKZRZsxHybNmTZLBLP0EL7?=
 =?iso-8859-1?Q?cAlHWkQCdDmCXWAxXWjPjFNzAroWQ1pWBGcOTJuPmwQekbknTgwE718/bP?=
 =?iso-8859-1?Q?UjbWjXR3mhkwfoKBbY/w+lq1DjR4tm8b5eXvgzf0+1j/JVH4dVWbPySuAj?=
 =?iso-8859-1?Q?oiDHG++2EY8HaOMnPwNWCpnJvvDv9rkTH69xf0ymw+HoX7M6cU8QCDULGc?=
 =?iso-8859-1?Q?ax3FBAxx7MJnda6p9DLDqXEhlM8xRLDEbn3ZT4SiEkC+v/JK9kNuVqwDqO?=
 =?iso-8859-1?Q?2fs9BC5UXwpAwPzEWsCEOY7eot4QyvIgb9GIofS+/pq9YJFy6sKXBAz1U3?=
 =?iso-8859-1?Q?Sj2RccrdFwMThhiCZIKwPjbO3fUzDgqmIfi5Q6hdBWvUaJBe2zL12n2U38?=
 =?iso-8859-1?Q?BuU1aoKCUgJMyxCeRib4m+CUvIEiLGgVqs3JEQsP6pDmMROn4yWkP12ETd?=
 =?iso-8859-1?Q?TNTlb96bFRnQcSwd9MW5BLasM22F8MPkauktW9qWU9PESmbjmwKrWIu947?=
 =?iso-8859-1?Q?IhCS9+Y6C2qdCw5UPHH7UTrn+neehnCbDh11+m4k6oTkoD/8ByowT6EPoG?=
 =?iso-8859-1?Q?8H75Ju+o0Uuha65uCOqBm2S9uAMa8O89MHng7uw0iQ7qFoZbHTKi/m8/Pu?=
 =?iso-8859-1?Q?shW5FneLO6zJwRZLFv1mI1jVgSlWguQ1l7OjP+8VQBNhMlMgBbVCfsMdWC?=
 =?iso-8859-1?Q?l1HeZFhlRTvwIZAL1qt2Jj9K+IT7kGv+AdiscnBs0g2JFNReAuE/+3Zx92?=
 =?iso-8859-1?Q?YeXUXcZxQ3Ps5/kP66zN0ULM2XC2RUDncox5BKNPPIvw4HZMUw0sIPQ4or?=
 =?iso-8859-1?Q?5uU4V5i1IDZHo0l/YNEdWdlYjf4m6kJR7CI6u+epDr4cEU3sI2BuZySJeC?=
 =?iso-8859-1?Q?yY/53WOqVozlMZLITDVkwGV3w2gbLDotQOq1FjZf7X7rJvCkJqjXz6VZEu?=
 =?iso-8859-1?Q?ZZ6+3eEAmxrZsQwtVkqWRLFXJIqq5JS2qz/h65r7qMsfykKD60OM9OJVwX?=
 =?iso-8859-1?Q?x2Man+d3EAnwhOpEHrdxBbwNwUMlJFSjXmxV4T7629AZSlqTJqZSN0gNLi?=
 =?iso-8859-1?Q?lkbvLm9iMGUmRJHxyfgMWVYukruZCmZgq8M0/71Jhs4EsMaC4QoHtThlHZ?=
 =?iso-8859-1?Q?SdZMHMPNdKerMSIFYtjU8nXkg+yzM91L0N5QuOpf2MoJlb3LQ4Rcs5jwhA?=
 =?iso-8859-1?Q?2QdsAcUJoGjeLoCezt3cN6S8n0CHRi95J3E7rNhr/vO9rPa8k61yVisd7N?=
 =?iso-8859-1?Q?+OIYG0vdNNr2u/3ve4VhbOc9VVIWHD+K5EUPR2MYNVQVQeIhkyU/S4AtTG?=
 =?iso-8859-1?Q?IzjS79zDcp6RlvkGfqfHe5h3cETIMAuDdnfxPflQa+NEjtaAC+grVOQJSx?=
 =?iso-8859-1?Q?vLz2AW1vBQ9huHIufQ7qeJBwLgRjvueporY3NqOiQx/TeoYsdg0lPmea5l?=
 =?iso-8859-1?Q?aRVzdgPWzP6WuETMDZLjX/A56tdPTNK0DsLxdKhr9OqVSQH9mhe50hpoof?=
 =?iso-8859-1?Q?sarbDYZHyv00DpN0c7RQfz4qDzk/+g/D+ZxC8LaXJ6G+aX7+rNm46f07v3?=
 =?iso-8859-1?Q?0Atx3qhbhA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e322a5-0196-4af3-2d79-08de802fdcb0
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:06:59.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZCJYjXUq4aT5Cy3GC5NbFr8UF8t0L60UeOHh6gKFs2/cNQ/Cly0Ms8a11EXl5HXUyYJDVV5ph6X57WEbH8Ltg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_050710_068465_755AB901 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff, until firmware or the next
boot stage reconfigures the controller.

Add an optional "fan-shutdown-percent" property to fan child nodes
allowing the shutdown fan speed to be configured per fan output.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
index d3f06ebc19fa..7bcadfab9fc4 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -54,6 +54,12 @@ patternProperties:
           The fan number used to determine the associated PWM channel.
         maxItems: 1
 
+      fan-shutdown-percent:
+        description:
+          Fan RPM in percent set during shutdown.
+        minimum: 0
+        maximum: 100
+
     required:
       - reg
 
@@ -80,12 +86,14 @@ examples:
             fan@0 {
                 reg = <0x0>;
                 pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+                fan-shutdown-percent = <100>;
                 #cooling-cells = <2>;
             };
 
             fan@1 {
                 reg = <0x1>;
                 pwms = <&fan_controller 26000 0 1>;
+                fan-shutdown-percent = <50>;
                 #cooling-cells = <2>;
             };
 
-- 
2.34.1


