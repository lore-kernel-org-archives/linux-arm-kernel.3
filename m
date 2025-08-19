Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A363DCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOJtteO6D027XaqF2vc22X+2wSuzL2HR0jWjm+zrCRQ=; b=VVQITUCJfXDKmT/22hePzHHOIG
	numKkaUP0odxxtk1fPrOoSL5fcyDHjeJtxoMLthNQ5bn4edi/YhR6CCur+bXvO0s90dXKtFqiuOWv
	GUlCCL7D3VYsvOqhErm8xVlO+KZqFHvUClUC5SaUM2qrX2GOdLZFkABrnF/oeNIzNipG4iAQbqeah
	SMLiMDvHErX98+zOZN2YEd0VfAnRb1a5RMnlELc8TNZh2nK4nh2OebpCaECbHcfZgSfOtTXGW/glG
	8zvmHWzPgw//RxjppcFUoD7Zd/seQpe4tTFJubGc4i4koZrLGy7gXyFTS3vi2GYMxhi4Glx9gIW6D
	b3UqehyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvG-0000000BP0S-1dc5;
	Tue, 19 Aug 2025 19:23:06 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPae-0000000B3MS-0pre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 16:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf3Wq5L/75qM1G7CncM0t9YKQw3KM73GPG5CH6dHov9NZA/s0RzRkfHsPhUs3/JZfWvaf5i95e3UeA2KLCqCK1fa2WA01DAsTtSfLKdAh1YsC0pnvEnZf963xkNh89XgzYwBisYoznfocJsJTQIE/dMGww/VxpL9XlBUAPbJzBSOX9CEJFKyrgulf3hZdSUBwZNuNqwTPqvnUop9LYva/4pnJ8Amx4jIoHex1M7HSd2GqKK6pBtRPATPXBrYefgkQBNOXAvbvEIa9/HsZrXF9BARGMBAyiUMhUi7yh66i0i4mFi8/g5Ku7eYDK0ojFaKrCtDq95hcJntl/XP8reT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOJtteO6D027XaqF2vc22X+2wSuzL2HR0jWjm+zrCRQ=;
 b=s9w+hbIrCwVlUFwnofje+d7gdYNjd9db3D72w4PRsvlLI9of9ontBt6a6kq64ciF7P5WfMS//HHyuHJ4q2AY27MeTH+XikBPOy7XEIp5fGAmh8OkDoY2ZJ/+gqQi1fIrv/eXZB3408OS/v4VIue7Xr2lhATDip9RiO+1ABVrNbejeTkax4+9Vy3mHfoRWcVUFbyNVNHmP/xV/aM4QOzjQV/F1sEYL0hzzxEVPoOM7sKs6w5y65xNQ47e71acIlbgzFFzWB/4WZ3VyxstTzGNKHzWnAXcymZjNOTvmWVluwsAO884JG7ok3fgbRVo/hDveR/aiII4vlPvwIUiMH4GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOJtteO6D027XaqF2vc22X+2wSuzL2HR0jWjm+zrCRQ=;
 b=hwJK7XQS7t/dBzt6Ny7DtIXk7RANStbY/h0etDX8KMPyu1sJJd0qtbbi8r62B3aOgpfXkfwUociZ0dAsRx1rvsoFtNnZ55HbhG6DEdJOhM5IcaP5EjO+EgR3wTbZqstlgapn+d2SAQzlVP7uH+u0wPeCesbCjCloyQRozlTpuwcbpoKr4E4e+CDi20z3mm3N+hNA92VGt0cfHqW+w/UUw8OgGX3NHsA0TMYqv/Ss7r7t1FUPyF0CiIBsSBwgDLeZiyJfJlOP2xdIsZZr6hIkzOZ/GKa4PDVg5w82GpumesCtxylKI4p2cSBr/Ldnpdcdwa6Az+BIbegQSydvdSXAmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 16:53:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 16:53:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: soc: add vf610 reboot syscon controller
Date: Tue, 19 Aug 2025 12:53:16 -0400
Message-Id: <20250819165317.3739366-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a276a2-ac0d-4ea8-dbf6-08dddf40ee05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NgLJTNc6H6a+rjk7Crd66fmRZMiCxLS/tMnBFREu43tV4Vd5yBIX9tsaPQ//?=
 =?us-ascii?Q?Ec05JDQA2aPPEXXjPi+b4JNhlVF8QqgHWmKFiYi6vaHGN8UjHDKAhzN6Pybr?=
 =?us-ascii?Q?UXiZ9K7wb1GqGeASaqldjVcOYcpXvzkHyEgdUIv9kbp5sBCSQZB+ABCYI88Q?=
 =?us-ascii?Q?HKYg3lgjit9bcFwLuYicl38iEPStGuPWzMozKx5obBaNiUMCu73EYwIaNYz7?=
 =?us-ascii?Q?h3DfodYynxtEvskUcFcNcmbld5bCmjronKs5VOlTpoeedKNaZIu4s7j9qzOY?=
 =?us-ascii?Q?til5YTdZaH0mtOrzJY5vp5zgUqEjl9N/7rmbj4xYngiRua/v/d+08LoNPHf+?=
 =?us-ascii?Q?4d3oBEZO9Kuw7Iy2GpUzW+yE+CsY8TQHX+IQb24aSCumUd6IzvkLll+KxLS4?=
 =?us-ascii?Q?6lACeuefqvjj1gUWI3mWdHJOsEE1euZNR89oRjurhr9592NE+Kz8WUQifYbG?=
 =?us-ascii?Q?BAHvNBEtoqJnPAF8HXlIfXO5wG2+BskRXyWuEVEu6cnlSQ7SFE0ObyDWsRqT?=
 =?us-ascii?Q?ZDWX6kyvgen+RTXxjJAhlqw2JOmPumz1L4RhLYFkqFkgDZXr9rV9yKbQHIaW?=
 =?us-ascii?Q?D0C1hx/Z0cIMGp3XUBoiA6vkEcg5YRsAJe1avdQVt66hdy0nRz1o7nVslgR9?=
 =?us-ascii?Q?NvYoS5iojJFc3kOSJ5meDy9SaLenFPMzKthgXoqOD/Bx/HZ/SK/3vl4NlW48?=
 =?us-ascii?Q?493Pgqm8JGsxjg7aJ3DSQunwu3XJHnlNupkCLCQ1A1JjcE13eArjZAuOe9Mk?=
 =?us-ascii?Q?+GVkndNXGNYo5Vi4HkmEC2rWzDBZ3yKoZkprWjMv9v5IZ+vW6mktiV8Ma/6k?=
 =?us-ascii?Q?/ziSy167l7jTOA2FfRITJbez/8coNl1GxLQGtGoQIRfWDoc3wfcug+c1B6RU?=
 =?us-ascii?Q?XsKukzPlHW3KWiEdIyDjAffB/cA29arvzxsGePmSX3FJNuBlraD31pNdtDMd?=
 =?us-ascii?Q?IdgGBZrowEJ2Oe1xpcYZrb63zAfzdMVih2ODGnp/dQWsTVYnuYXbg468nGMK?=
 =?us-ascii?Q?P3BK2u62o2UeeqLEENmREFnO9/VZ1jgZT/l0Scn0OtIGFRTRfL4zKrXgM+gD?=
 =?us-ascii?Q?iwF8bE3fqMgU0HXxbMInJA2lavoWLjsna1eiP62/peqTRgglBNSWtGPRRHAi?=
 =?us-ascii?Q?/EhnVcugsc305Wr6LfYoz+SPs7MaQf/aSszakYsKQFDJEUt89ktwwsYUox81?=
 =?us-ascii?Q?HeNNFAueFku0MEnNxmP9Z+GNEmJcqCwNGQOIbUGLJRBts8XM98980ZN3Kp/2?=
 =?us-ascii?Q?odNK/uWq+8/z5jpucbjeV5fIXi08MUhxYQZ9r++iw4cObrjh0wG1deKGPfxo?=
 =?us-ascii?Q?BCsfHgQ12KGc4N+A/Aum6yRR2Ajdi8SrXiTToFL5QuUZSePka+74m+rcPVBC?=
 =?us-ascii?Q?fmToCjyjYovUXPHAGXK1KtE8soc+o/I2Ajdyp6+gMB5aqBiZk+tc3qBVzekw?=
 =?us-ascii?Q?vAJzXfhr+wnWV3r06v3Drp4famkS9D3t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Y7pFRr0zWoXeVB5oidZlXhSgRB/3ap82opJDfNc9HWM1m2x6xmTxx0Rg0eQ?=
 =?us-ascii?Q?JMGqu5yiC0QJ4XElGhV0R8RJFJ99Kk7vOgV7n1uAeTezfB+wlE92nKMwxKaS?=
 =?us-ascii?Q?UMqGGGD6RxreknQj6nS0B9jbcyu3pEmeivEmmQ5LwoNHoMgeulNOH/rEoQxL?=
 =?us-ascii?Q?oiySz9vewuBpbtjN4KdX7JI2u93hfyrX9EVxnpsk4mbUSRSUQDj9CPiq/9i0?=
 =?us-ascii?Q?UCEg7fUmrowNaS0wgfRSLj2hfV1EHBC+ssR/IpfpwMN2Wqz0v7owPHyZU5bw?=
 =?us-ascii?Q?g+uEzGExhDB0lLPww6a9L47bEshqnNI+G8zIQy8BV0dNCa17EaY/K44vTLkJ?=
 =?us-ascii?Q?V2RyUcEG8qc+3Hg5W8QpVzVj59NzYR9JNZLv/4AQxyZUqild+HBqJ+hjZNz/?=
 =?us-ascii?Q?xbywrA/w+QbFdYjq1QYr73684tWcGth3lrCSo4Y6XQWVn1SX+PP+NzhtOsvR?=
 =?us-ascii?Q?vzx60q0hHGGEIA5MQuM7NsdV4NpEKyULGmU8KP6ted6htfjf0hJAz1crBsEM?=
 =?us-ascii?Q?s3zqlZQIG3jy9xDzUmDZiyntJgKx1FPkmA1/TP3kIp75TnqUS6ub5d0PbHD3?=
 =?us-ascii?Q?CUe8+oXRrMprt3XIlh/hI5ftXV/kbuHydgtO5b15SjRBeiqUxsXi7sMWDbZ3?=
 =?us-ascii?Q?4pcYdJG1dYQbYrgAGtYJ1IHMykwMYlBXyQPdz7PfOgmwwPNOL5rG/Yk8iicg?=
 =?us-ascii?Q?olCd9ONkPuwg4+QwYC4g0V1i1u31ndssNqilqOFMpxOR5FaZRAZzlzCC1UPg?=
 =?us-ascii?Q?5HmVhfuz4xGb81FxzVIbJSzSrRzJ6K3lmRODROOgugiu2XKSz91f0fsJC/KR?=
 =?us-ascii?Q?Jvy0xOis5IDQQnAn3sJ/fMPJmdgDGn/RH4owQQ5v6WPYbOBB5fkk0o91eF4x?=
 =?us-ascii?Q?cd0YK5bimzPKIRe+8M6/ohdXuhmyAgTQYOFZR6z2gIso3ccLySJAEDFSorjk?=
 =?us-ascii?Q?n6BLogrx/wU8QvC54sfrlLUtYQAzKIgqwpSopNceULHeE5NafX1bENCqs2hn?=
 =?us-ascii?Q?05gZFVlM97akfX6eMZs+27yFHqxzmQ2wu68Rn4W8EkAHDHDPOqVij+WfUn59?=
 =?us-ascii?Q?qvZhA3TlFdNG0vj4rLKeNG0QMxEByfVskjYM3ZS6mPXHEgTT1TJ8vTtENwiv?=
 =?us-ascii?Q?8QE3rMVfZA2PwQxMgu6r1qOLmokllySQHbHxfDhGsHryArTb3ZQAJGihMWGS?=
 =?us-ascii?Q?nCOrhjO036psBTOHX0IkDrDGPNaZST5U4h+9+jhYCBNZEuuvi9jv3BWlZe8n?=
 =?us-ascii?Q?UkuTYtLnL2ljoipcV2/euc6uJx5BSVBOn8sNvyxd++awWTh13uDRfARbtsDL?=
 =?us-ascii?Q?Bgd5XNcCsUvNNTkm9czAkE6L7K3mQ/0afHoOqXtV0MiuVl1//Je7Tdx8Viq/?=
 =?us-ascii?Q?FIkpbBpqFbPGl97aBUyKZHOr/o6QrsFTQpO2o6W/lbGu2Lse0DUlopUdNwMB?=
 =?us-ascii?Q?OSGGKiZZgnp7SM/IiNzI+tPi09dCVjEiHmlNwzgwNh2btCoGs5UjQ8V5sLbR?=
 =?us-ascii?Q?6bTtR7zidybGZ0/vhTbqQIbBRKLg7xSN7egruEZu4Pm2JQrgY4mzFJtygdZV?=
 =?us-ascii?Q?s9B+ciJPlyN0Oza88ikhRYjgJvUshjCRaXnBRezr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a276a2-ac0d-4ea8-dbf6-08dddf40ee05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 16:53:32.2507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzeF9n3VXPiImapHNMxzHHoESmXf5CDMZpn/1EXJ2sPIMjxyiScDKVvMZaJprJsDI0qulGs1hPFXFe/tfAW4KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_095340_266231_B4D874BF 
X-CRM114-Status: GOOD (  14.19  )
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

Add vf610 reboot controller, which used to reboot whole system. Fix below
CHECK_DTB warnings:

arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
    failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']

IC reference manual calls it as system reset controller(SRC), but it is not
module as reset controller, which used to reset individual device. SRC
works as reboot controller, which reboots whole system. It provides a
syscon interface to syscon-reboot.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- add missed 's' at description
- remove duplicate / at path

Change in v2
- change description to avoid confuse about reset controller.
- it is legacy device, more than 10 year. So try keep existed dts as it.
---
 .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
new file mode 100644
index 0000000000000..6fb93e8be9292
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,vf610-src.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale vf610 System Reset Controller (SRC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  IC reference manual calls it as SRC, but it is not module as reset
+  controller, which used to reset individual device. SRC works as reboot
+  controller, which reboots whole system. It provides a syscon interface to
+  syscon-reboot.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-src
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    syscon@4006e000 {
+        compatible = "fsl,vf610-src", "syscon";
+        reg = <0x4006e000 0x1000>;
+        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
-- 
2.34.1


