Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1512C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOqAdTHlwlcka7GMAt/sdsWd7AxP/XHKShGfB8pd57Y=; b=VjV5aaWYBsvoNtl4Bi01cMFqyL
	6u3qleO4H4ZI0FPqo0XHImiAFvg2s/E5tNE2TOqFIJVPl7P8yYV/D06KlTpKA/vGvO2oXCPC8uYIy
	fXsslbc/gxgjtw6Ae/VIfPqF5/PhDEjPJiIi18HvG6pbwVcV9dtIPDZL9vxVI/yyM9QB3jBHGlqRm
	DFZHmoPdWKKJh7PwZ2UT6GkR2uy5jOXy2s3ScFFwo8uXyyQ2ursDtUJMFexRcUf84pfXXGwZHxrsu
	Dq2P+H61Ed3SoH+Qam/jgc/WcwgsJ2FvgcWpdaEl3p1F3g5/FlbfwqGtgmroUYPC/m4V2ejEqukNx
	Y1JbZMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFZ7-0000000H00K-0i5g;
	Wed, 12 Aug 2026 20:28:45 +0000
Received: from mail-germanywestcentralazon11022081.outbound.protection.outlook.com ([40.107.149.81] helo=FR5P281CU006.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFZ2-0000000GzxI-0t0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:28:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsQ3ZnoQO50jIBH1vH2Rhy/XpoNw2T7hInkGbUiRWlxsfhxY7hITcv0JjeSW/YHFgyimM6ELgjny0zIF5S2si+PaAcAz8LdQKJv6T9S2Ktq4WEYFM/s2YvjyQ7tLK8BUvoDA4rCxll78S+tzE6Nw+CSqh7t0Q3eEIeNN7AByo/4ZaW55L+/JlMNWCPlFtLLTV5Mi5aFhjFQY7HOHiyFXwlGPZga/CVfi8FAkLVsD0jSiGfH3vrMCxqDUkAmmoncSY2LQKmY3PO28mhMehokPr7+qQ8uOko2gRBtgl2RrOxiIHeA/oZX+o7Y/Uez78QUiPufQHtmP+QaFVCef+8T2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOqAdTHlwlcka7GMAt/sdsWd7AxP/XHKShGfB8pd57Y=;
 b=Ab/Bo45IywFBycC7IQsRuNV4gtM7QK2oM6EUnRur7rAsadQGaCW79DFR/PvCVkHQkEZIhcuiWjNCnsgnLz1/kYycLDwUgz95jD3RPW3UXynTW0G1+p/w703g3UvFWONIB/d1usecApLELZ6ySCvPm0JhAYrhfVov7XKZLRFOO8XU09HRXwPi32GD0a+kq6Inwmy+Z9oGNt4iIXq9RqOv1u8meLVZaOH2FprInHY3Ag1IvUFKZUbxCRsr/XmsV06bHJBW3Chn+oeTDvseSRByW2PSGr8j/pnN1a69uljcEGDAjYJqnln9dU49/78knkn2C2AtEvTdXOsN8zgRA6EyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by BEUP281MB3788.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 20:28:30 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365%7]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 20:28:30 +0000
From: Tan Siewert <tan@siewert.io>
Date: Wed, 12 Aug 2026 22:28:26 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U BMC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ts-x470d4u-v3-1-c8e266f1663b@siewert.io>
References: <20260812-ts-x470d4u-v3-0-c8e266f1663b@siewert.io>
In-Reply-To: <20260812-ts-x470d4u-v3-0-c8e266f1663b@siewert.io>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan@siewert.io>, Zev Weiss <zev@bewilderbeest.net>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786566507; l=922;
 i=tan@siewert.io; s=20260731; h=from:subject:message-id;
 bh=U43XDvWcaWpTybINM0+Hs+OkECxWaBtsDb3v7QHdjzU=;
 b=zvcM66A/W21PhbJAFUXh0xwD22yt8s8p9noGEmSKVlATJIopR5TYqA7gFUhqJZxc/eTHKFI33
 3FozRXZAzvmBDcIfOjw2pidltkLzduIe7BFbHRztpwvRSwY5w8nVGxN
X-Developer-Key: i=tan@siewert.io; a=ed25519;
 pk=TXy9xEw3OCAd0QBR/ZZowx3QJfMcoe0ROFfoghqLnU4=
X-ClientProxiedBy: FR4P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::6) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|BEUP281MB3788:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f5e3e9-7583-4f9d-c243-08def8b045bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|10070799003|376014|7416014|52116014|1800799024|366016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qNbh+t8lLJ71S/rtBvxd1wXKeRRbx3bracgEnD8KRf6KREy8BbjxtqibH1Xp1D9CnAZXHuF50YOtHXJ+eYZ76F7RBxS5KRpFFd/rtHkbZUWioCJieD/lZjzhwWmtVvS/buNlt5l3XN7niroeQDjr/ddW+s+2iK4S/4GQnmGNvHSwHEtPrjH+YeCcgX4uq3JjF6ksZfwzgP3LGiW6vnhqo5tZle6rD512JISgPvS9Z1Lmh0Lq2/W08FtHcdXY/GCQIAM22/N3hQ4zXYogYGRmWQIU1Zili8nlsX2FdpX4/UqHqpbVpPd9LSDu5aNfA51lXl+D2hVTmKS4fnp67jrI/2rmAgo7UB0lXBbR6GkmgUncV6S3RMn5UAz6k6zUtXitJaPwHhZYHFoZEDFEiKLTOjGPPlUnQQA9QSqQTM8caLPb+f3TP5GBVO+iRXmzAeAt4XxI8U/eEUeCMpz5lpjMw4kpl0N8znBf2GR5RXCi8HYTqSWpRAD5smKTolK0rLurJ+fNWbX3AW7PCW7BOzAeKcpaVj8+0hXJdaz3g6j4bA2MJa250H5WiKscYAdwn2rwHG7eInkt2gSnL0M+dxNz2ornWq7/00RJ0T7Bp233uBlpZC9t3WNanbUfxXp/mG1JnaM9qLhFLkvykYGlwmlGzumiqVD8QOP760oNWoZqH5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(7416014)(52116014)(1800799024)(366016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0oxaUV2Zi9pUWxXeHZ6Y25ZcndRbGFZU3p1VFZlRDI4d0lJS0t1SXdYZ0RB?=
 =?utf-8?B?eGg2OE96TjhtOGNIcktaSVltNzR0UjZjeFJnaFNBTHFndjhjanR5cUFiVHZq?=
 =?utf-8?B?bGlmT1h1ZzV2ZkJwVjdNclhVVWZlU2NPVEVKVjc3ZlRsSDFNOVg4ZDJoblgx?=
 =?utf-8?B?NmVFUU4wQmZ5cTAyd1QyM25MeS92SGdwZ09nYkdCbW4ydXZNU2NndmJ5Zkhv?=
 =?utf-8?B?dmUxNXFKRG8zUmRkTXlGRlk3aGVINHdKQ2c3VlNLN0pYQmdHRlM2RytKZHFV?=
 =?utf-8?B?RlhtWVl6YjhBbVBiN2ZpQ2FQWG44QlBWM3krYzlFalFKcU9RaEJTQXNiWkQy?=
 =?utf-8?B?cWFud1FxSEljVnM1U3J0TjZLWElxZ2JEQURpbXN2UW00RW1MNTZsay9vMGtY?=
 =?utf-8?B?L3d0ay9PbUJFVXB4QXJWUUVrRzBnZ0RaVGNCeGxBVDJLQW1YOVFRRFlRUFpx?=
 =?utf-8?B?VFRJVndUa1RYZjJINWRrQmcyaFRpTU1sY3ZvQnVLbXRraWZJM1pLU0FibmJC?=
 =?utf-8?B?WUFNMk1BQnBLSGFjQVpJcUN3czkvdjZNSitYbS80eTZTV3hUeHdiMmxjWk5B?=
 =?utf-8?B?aEYvaEZ2RHd3RjIrOTlKcERudHFYclBlNkN6VjkrK2tPajJXemFleGlWMXdu?=
 =?utf-8?B?c09GRHJwdWZzNmx4NTlWLzl4dklEeXZ2VmE2bFBHRHl4N1ZBTGNtaE1IUDNq?=
 =?utf-8?B?SUdlM3BOd2MzeS9sWFlLa1l0YVRCTmVWVmdUS2IvdHVlTnhkYWQzVzlyQS9W?=
 =?utf-8?B?Zk0vRE9TeWFmUkxQOTIwdEkwc1lvYWcrMndDbmRZbGNZc2RDa1kzWTBKdGJE?=
 =?utf-8?B?VTlmendGOEdzbktSQkhkTkhZdGNkdUdLTXk2ZXYwS0pjWjlsU2R1K0dwVks4?=
 =?utf-8?B?TjVmamZOT3FnUXlER2hhcG8yWUJSV3NRMmNLRUpUdGt2bU5RRytOdEhNaGlN?=
 =?utf-8?B?NmN1aEEvRXdqV053RVd5VGROSS80NFY1dVFQbkVEQ05IaHVObEJ6Z2VEc3gv?=
 =?utf-8?B?VUszMUNrWEcrQzkrZGNwUEZoNmcrejd6dEhjMmx3MmNZalNBd3dXZExORm02?=
 =?utf-8?B?WmFWWmFjc1ZVTWg2V0JTb3gzUUoySXpZbHZLSjB0V2dNLytFS1NLQ0ttZVgz?=
 =?utf-8?B?TjBuR0sremFJTVR0OWlYVUo4YitLNTJMVVhURTZjOG0ycjJYTlFuMkNvUWRT?=
 =?utf-8?B?OFVrTXdLeWFRM0pLdGR4bFVCSUtCUmc5ZGRDMnhJRWZ6cmJkMExFblJ3SGhv?=
 =?utf-8?B?ZSsxNDZPb3Q2NHJkMXBCRVlOTFgyTUluNzBJdFQ0aUd5N3l4SE53aUM3TStN?=
 =?utf-8?B?WEcwcjlEQ0Fxdm5UazJwWGJHc2xPdjdxNHN6NWRBNkdmR3pnM0czTlBrNEFk?=
 =?utf-8?B?OFg4WExLaTJYM3AzdTFWUlh5dTRMaE40aVQySk5XbHFXdUxvRTIxZEdQOGxr?=
 =?utf-8?B?NUZYU2FGN0RaaVZvOVl0L0VrY0xyNFp1Q0ZPRE5WK0dWQ1J5RTN4VGFRTk8w?=
 =?utf-8?B?SUxaRWtZcVY4aWJoeEdqOWEvZXlUUHFDYWYzbnJTWmszVE5HaW80ODhmZVhF?=
 =?utf-8?B?TlBtRzQ5eHRWbG0rUEtIak1MRGhweTdiZk0vT0JJeklmOG9SejFzU0RpcDFu?=
 =?utf-8?B?UkRuRGt4TlhybTVsMmxJRFVNSFhBY3hqVEpjeFhJVlRyWWFvUTkrNDRyd2x5?=
 =?utf-8?B?NC96cVdaQkw0QlBJeVN0TTFuRjFuMUo1VS9YaTRTMTR6T0dDeGJhZmNaVlha?=
 =?utf-8?B?K3ljRlUwcFk5VCsxRjJib2lzSStGZ2xGMlVkYzB0dGJ2UmZNbjFzekFFcE1l?=
 =?utf-8?B?SjZ6Tm80SEZ0c3ZOYkR2NkF5eERHUnFUWXRUd0xoQVovWVFlM3VSYnhCdEJX?=
 =?utf-8?B?Q1RqN3VDZnpvV0ZNNm5sQkxnK1pKRkZvaE4wSVhKOU1BRXhWYVl5dkwxNm1u?=
 =?utf-8?B?Qit2VnpuUE12bmk2WWdrRnZ1b1B4dDV1NGFzVGVPak9CSHZtNTJVZFlDTmVv?=
 =?utf-8?B?MDh2SENXcGlLSmJlME5PUlhmNzdpc1RhMkxTK2RmUU9EY0loNVJUTlh1QitR?=
 =?utf-8?B?MzB5VDdoZHFaNzZoRFUxV1JZNW4xUUtndldlOWttNmlkMzlRQzJxSWNDdXFw?=
 =?utf-8?B?L1l4SVh5dEcrV0F5YTllMitjM2kyMVV5M1R4OEdJNXA3eGJRWXNkNmpScUVG?=
 =?utf-8?B?eXFzY2pWZkNoNkFSYXcyV3c5U0tDSEN3Rk1FNXBDL2xhaFYybDk0aDk5bE1L?=
 =?utf-8?B?d3pMbllVbDhLbGNGRHZuK2xlNTY5NW42UmdEc3dyTVhscTBob0lqTlFWb3Zm?=
 =?utf-8?B?NzB2VE5Ra2RWTURjNCtoakZBQmI0Z0pyTzA2cFkwelBqK0xOZmtIRkQzbDhQ?=
 =?utf-8?Q?rcCy6kmt9ovuR+oTnDeWgz8o13J9WmQpxPpt7?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f5e3e9-7583-4f9d-c243-08def8b045bf
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:28:30.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWfz3oH+dXgaAwACZtzhXQ3uKIGV7eNmyphJHEjAwwUuqeClQMiXuvw/o/A19wlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEUP281MB3788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_132840_257245_24263C1D 
X-CRM114-Status: UNSURE (   7.83  )
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

Document ASRock's X470D4U BMC board compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tan Siewert <tan@siewert.io>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..277c0e03cf48 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -40,6 +40,8 @@ properties:
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
               - asrock,spc621d8hm3-bmc
+              - asrock,x470d4u-bmc
+              - asrock,x470d4u-data64-bmc
               - asrock,x570d4u-bmc
               - bytedance,g220a-bmc
               - facebook,cmm-bmc

-- 
2.54.0


