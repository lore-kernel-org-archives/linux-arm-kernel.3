Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A43D3CCA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FMxSu1zXZHGcKbg4JXjEyrWRQyr6AEj5dmbrmp/YPE=; b=iInMbgCp5aru+hoX9DDs8lReyC
	BU9kRwAwmLlgiMGWeEessIuPkoabOd2HNEvlSuZiEPy5dyB3qZWQyXxSExJZgyF757sm9NclZUas3
	ic1QdcrYPFrXFl0LiJ/Dewbo2iaG8cAvvWGkRf2GhmoMLDk1cBOmgfpOgWyy23y13TIP5GGumM9Tr
	tiq5VlplKAo2Z4mgeVOV/zdyf0jNNuGf0A7MF49uootIBxjnHK3m5X9g0gMmRew5IxX8nsPIQJxbd
	M+gQlrCL79tWLxQA7SNDM1u6RbxaX5by+5dP60fGebjfwMKbqpOGJoICIQfSlODOKUX67+JCnxvIL
	RclZiKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDc9-0000000BcPv-2sDc;
	Thu, 15 Jan 2026 03:01:37 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDc6-0000000BcNA-32QU;
	Thu, 15 Jan 2026 03:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8Xm3FXf+q52dbP1f+hfO/v01lFAeoaz8jUA4UnBLLTzfoi1xx0Iqvpv+93RVEzo4hCiCOo44CE0rd/12AYu+O4DWowmGzN/sQf0uxEsQb1msL0+xkYVrXFzItHFKOPWJjGxDPWvLzAdjGmdVwMSpz2TGTYuvFAElxcbpTw3/NpkMep3EWfBHpznmFh9URk5/Cr76OjH5HmOV9yX8UcMAsiuUx1BT39LRt5orVH2HKBfg5+Wgb10flJy3D8DqZTEz5RmBG1j1VprwPxr/PLpJ4ErLM+6pFGH8NH4PkmYH5WXGf0ZWceecej/WYheJv0f0z9cZXnT8AcOD4oDxsDgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FMxSu1zXZHGcKbg4JXjEyrWRQyr6AEj5dmbrmp/YPE=;
 b=fRh9ZWJ0UQcfB8WANFwtVKsnBnvIzlEDlfSf+ZLbvMnQG8LskCSL1YKuhwykh2GCXUG+k2ZIrD0eztrmOIl5wfAF2SqceVYjLzKiK2J8y5VbA9Jt2VVVMcdOhFHQPjoX06/rnnxcITgV+viPNwWT06w3D2soNH6hXcR1HgxWt5v+zYtz2X2srfWZ3OJ/LzIQshNc1ZCr8M3rM/kjdS6Ub4x9ZECVodq7YIEj/4TFB1edsowm38aFxTmrthY8C67/JxUDoD19d1gwQXjdf4vE4kqmOA9CqYIZi//VHBUMKZ/j+aK7eQKi4kGnu2np5hHLOCvD9JhHTDoUn0egrA+27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB8614.apcprd03.prod.outlook.com (2603:1096:405:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:01:20 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 03:01:20 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@xieqinick.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
Date: Thu, 15 Jan 2026 11:00:13 +0800
Message-Id: <20260115030015.1334517-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115030015.1334517-1-nick@khadas.com>
References: <20260115030015.1334517-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bc4d8d-fcc5-4abe-d364-08de53e25c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUy118o02YQ2LElnpkuodiYRKjGDf5KclAbReDL7/lkPOBC+KPrI/DwgM9P2?=
 =?us-ascii?Q?JN/lHHWvFmCuemUqJpa757tm6BtNdh1+VDWIkVlqUP3fFrljleSPMA4VH1Ju?=
 =?us-ascii?Q?cNAK4Rc0CPUMoiVwXn0EYdyi7btlv0OyYljI/n4cwICO7XzjJcYla3mfO5Kt?=
 =?us-ascii?Q?KB5F7tFRJJImrr0qng+H0wPQvQU1G8pdKZAdjDgC5/RlA1IF6CdG5KAdqX+2?=
 =?us-ascii?Q?pSM/IYUcwe+HFmYZkm0qkah/4Z9J8YPklJjh839ICQfOKnQeqYTeU9eaATQI?=
 =?us-ascii?Q?Rv5bKzr8pj/INQM7rYhVDH90aC/Daavl3Kj5/DeJ+chOCPBkWbPfED7kesEc?=
 =?us-ascii?Q?Z3Hx096KjVJm9jizHI0+q2NokBIBHq3RC3qZ6fPlKPsvn8ClgCILQDZlBMjp?=
 =?us-ascii?Q?6/5iFV0Zb6AOm0+ejIqbfT5o+/9ozc+pttOcrKhv4v4tEJpuHiY+ZgNDJuqk?=
 =?us-ascii?Q?lBgf6Dw3JSlksVAKfxE3CtlmIv+8YFRJSkFzCKiNTz1LYcT3pzhwFU1H7wWM?=
 =?us-ascii?Q?7ipeeGoCmowXNo5R27p68AUa2D4bH78rNK8oSgr1WkEnrLhTIyDlLoiy6GKo?=
 =?us-ascii?Q?+8MovB9lxokdINL/2wZ4KNOgrG4MgnWmDok/yth3hthjTVqUc9EGL+vK7TKK?=
 =?us-ascii?Q?yK9qmIhX+PLcFCF9ED8/MfjCjEI2vemuk8r9JPB9WMyruBmugvCVAl9wkEYr?=
 =?us-ascii?Q?JHUMXQPyC2wWr2mncnU6vb99T2rUUMRLLCx7Yn/kPsLifJ1F1dXpbc7Mxkj4?=
 =?us-ascii?Q?iixbqSMzpD3CsqAnUMLMCWYZr2V/lbI+etgXEUbFo6vR3hBj2iINcZboEQ/E?=
 =?us-ascii?Q?C6sF27WaSxgtVzj2E0P14K5hzq3I2zQcZS8X/IMEjHQNI7PXiAfISaqZdIlW?=
 =?us-ascii?Q?ybu4IM4mQYMmR9iq2ThYt4BKmJRjrJ11DJ+TdRP6gZ1tqGk1OvsWk2N9QnIC?=
 =?us-ascii?Q?pDJVvB5ukZ3048bwFE5T18mVyKZi3s52cJMIqM24QL7i5gIwRS81rShIEpMQ?=
 =?us-ascii?Q?zQ2fsivIN66EAUgN7sCyaN7xIRin5m+8CbSQY9I/c5blWzGyKVQ3FbT3O/5N?=
 =?us-ascii?Q?JFEIVg5S4lwNnlnfGhKjJg6SVmnPS8K6ZLkkz/XDZ5vGH/GPzpfunFXBTGQy?=
 =?us-ascii?Q?40BMekoi7YtbTYjI/T36qvgBnrvi7ca5nEmILC5jwc9E/7Az91UykkNJx3eT?=
 =?us-ascii?Q?937tFpeN9VQoPnxVLLwUzgcRdzi+gxuRP96jrHQMK2OHia+xWRRB1tXRq+QV?=
 =?us-ascii?Q?NW7P4yJ8Pv7xyrx0GCnUc2ZQU631KaPMaxb5CgIDOD8to/iie4f2jwF99iPs?=
 =?us-ascii?Q?8mi7o+V2dJtMbIVKIzIEp78CLEDSShdt3oD6k3YMv5n4VKPsEDpO4/BxeVPJ?=
 =?us-ascii?Q?qCl503HNsfKAu/D1+bLfTaAPfZuyCxFRyEWVaOxCn1pTK2W4dHF5W+jizwXA?=
 =?us-ascii?Q?3xcxyjm1y0YXGUVOye8ZU+44PGFs6qs/g/KIjl7++DibUqnskCsVbnEvgaxT?=
 =?us-ascii?Q?WkzibsUTsn1nNdD8QpUacOyW+BO2oK63v8xvLSE+yAOQuuLCDevz5RAi/0kz?=
 =?us-ascii?Q?LlNgQavREnPaMRxIT6SLVnrTrnOc1gKfjltfqaimD1DNUVJmp+k+1nITB3nn?=
 =?us-ascii?Q?sjtZmZOPnfUBrJspMgt5tM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGiVRlqRY/RcVBa89dqpJxJUTqOcLd8hGy+hg45RB+qwMhulSGoLhKqgx/cm?=
 =?us-ascii?Q?Fsj+oQizivBk9TQh1Esq+iHwrxVOC+xZEmZJOwyYnr1typJewcXGZEVp+sFA?=
 =?us-ascii?Q?X6mFkkYJ0YoWGefru5VNSZtWy5rocuCc9awMKUxm1UQLQmQa6q8QqDN1/RH3?=
 =?us-ascii?Q?lqLB2Dqhr0KcGXivtMpOIResizA7wBgYZVRWQV6rT0HiPp+I3fYbkaaNhmOT?=
 =?us-ascii?Q?xabjPGbXTrLVzl7hDYd9yC40WVg4rHSxHQHu/mkqGSGwaDP8dQ8KZ52mJqvl?=
 =?us-ascii?Q?sIyNhlB865G2FedfmxadH6HqzqvUVVnpfUyGZ9oDKUVx/qK8iIyudh3AT6Gy?=
 =?us-ascii?Q?H2yIE8IoJG0SeiGXRtI0iDJSu3rkhz1g06wsD+HekLXXP7ZllbkSttA/4o1u?=
 =?us-ascii?Q?kFT2ybEAFpld4plPTCh+RTITRY8pXKSKESdeVaiY0wY+ykpQ4SHNzr3tykb3?=
 =?us-ascii?Q?+M1QXMYeEqro1z0XQMe9Pe7F4wMxils7331vezDXkRai8Omg1XsoD/AEGTwF?=
 =?us-ascii?Q?2ee3ZWbUI8Xx001VN0iaoWDFyCjKRRiNE+o4gUVLWBpZcrxYwWfyvxpiA5o3?=
 =?us-ascii?Q?2SWmLZHdTBIz3JqM9ExDJ36Y3PuYRmWBTlGVKQA6HNybCKg/EEY1U2XpASYy?=
 =?us-ascii?Q?aFPHf4fvAyWayIc2GqTLQ3PIzp1kH9s/8c+TV/1dUgvTByGgKi6pFOhD3hkA?=
 =?us-ascii?Q?3cT8gqpMVEHh5GmMSnxozRQ2QV6+j5FSxF3//EN0nVw8cXQO4q7YDKYJJM3C?=
 =?us-ascii?Q?usYqoCsjHjXJE4XdnHR7xkkl0iimXDfdXUH+raxFeAHtMCEHs2oJzQFnJ+sL?=
 =?us-ascii?Q?NLYfG/Y+MqigN8N5ncpP/Ll0uQul6uAc77b6A6vSL3cQGKvC9yRa8t4O6lyK?=
 =?us-ascii?Q?lyhn979Bl2je9TCXAhf64iHm+vuA87XUMDs9NeTQGeYEOvODIOx1gwFYlh9r?=
 =?us-ascii?Q?E+RHopIcMramFwjTBfG54M5OCwD2JH/tuED4NjNY+AUeWzOMLhviPgDgmjeo?=
 =?us-ascii?Q?fUMwuOzZOLciGJUYC5xoXXm97CPrjvEaXwrczR8vHtobvd12MaiaboUGeYxH?=
 =?us-ascii?Q?YIMz9kONqsyVR1WL5D64KEw+YkcbSCKQVDi+4Xap6/VO+dvddLun1yYC+Xlf?=
 =?us-ascii?Q?ETOURXDjfAuSo9tH8zoHEVFS//XnKGPwcSG8tVuSjzJparK+3I25EASVWJJH?=
 =?us-ascii?Q?nbCXdMVb6b7aiX8vbQobgSf+sTKI18qww52RQtyR5e6OFPXrWct0YBPXumUf?=
 =?us-ascii?Q?YvkEYbLTlXqQ5UrIfRN5H82t9W7uh43MZ21iPQ6WS5lYYFkZc8k9zrt5YjZo?=
 =?us-ascii?Q?2f+OHUb20vjEM7Ht/Q1I8qho8fmVJyxtnA6Pj3Q914HBBe3UD637o4bw29jL?=
 =?us-ascii?Q?YuI62Sffix72RkyGW7q93rRP17HRnB9c7iaNlMUyX/mc7XbLhNsoLeYvOwnU?=
 =?us-ascii?Q?34oqbxdeaPTCRlfoKqGNBW2hluP4HS//f1ZAPjgQCBtQy1idaKhk1djOOSLy?=
 =?us-ascii?Q?EV6u+smsT68Atl4yI2kYfU9XGU5Q/Z2dNr0Fat/qwGguOXpZ7kieugTB3xEp?=
 =?us-ascii?Q?BQHwNEFuoJjKdzAUERQLaCpqytJ4xUU4PTS9HCnz42wjKaezUEWnGyJ1gesS?=
 =?us-ascii?Q?hS3k0wbzLeMukFPCMBdXT7Gm8LmyxqAHxb6qX0AvIqBk6a2MyAT0wiubp/45?=
 =?us-ascii?Q?G9W5LcorxBQtJ/0v6cW8/G0ig9qzLZ5IZXN+r44aiLucudgl?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bc4d8d-fcc5-4abe-d364-08de53e25c01
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:01:20.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pqn2W1/8WXFgIKk/bRBWQ18JB2j4PCNPRZAA3Rm9JWEozU84U8aFb86JbWOYgJmU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_190134_770089_D62E9596 
X-CRM114-Status: UNSURE (   7.20  )
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

The Amlogic S4 SoC family includes multiple variants, such as the S805X2
and S905Y4. Currently, the bindings only define the generic "amlogic,s4"
compatible.

This patch introduces specific compatibles "amlogic,s805x2" and
"amlogic,s905y4" to properly differentiate these SoCs while keeping
"amlogic,s4" as the family fallback.

This allows for more precise hardware description and future-proofing
if SoC-specific quirks arise.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d9963fe9259..a885278bc4e2e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -245,6 +245,14 @@ properties:
         items:
           - enum:
               - amlogic,aq222
+          - const: amlogic,s805x2
+          - const: amlogic,s4
+
+      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
+        items:
+          - enum:
+              - khadas,vim1s
+          - const: amlogic,s905y4
           - const: amlogic,s4
 
       - description: Boards with the Amlogic S6 S905X5 SoC
-- 
2.34.1


