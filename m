Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5F1088E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DRdLcmCa9Um5mwo3EDlzflBo9jnUnjU0zG4/g5NOTk=; b=YdqBKmSVVmduC44GFaUeOK+78C
	+b05j2FjuIDFYoW/iWaCL8gjtTCbLjNpcPjiSgnvCBfl4CWgPqa8dVZT2MVORCE/1/CgxrBPNvtyP
	3WbYaba/pdz5b2bR5TTXGihfAENadchWi4EWVFs6KTlOTbCwFXGsFDseICrJqQtioXrimC/cvexY+
	8Z83NMdSuIK9vapi6qpzpVpNFa3SFT7WcM7cNUABtf8I3kPSA3ngvF1GCqQ7qxA/EvcCkj/sQaaNp
	eKlh8Wr1NpuV8TGodtGroGjLvTlE/FBvkLDTSzw4rjtZuvA4OQK2izbEP490qYRvOt2SQO07Pg60i
	SSHT+qKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33EC-00000009lPT-1pUn;
	Thu, 19 Mar 2026 02:35:16 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33E8-00000009lOg-2omI;
	Thu, 19 Mar 2026 02:35:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQJwWl0op0KztuBvLRkilkTydfOsO3utAP2hrzhwOsNz/zv3y/EbyMqgO0BwGxljPC4yMfB5VIBN+RnZ+SjhwM4+ag/DP75aGmVORGwge1RBJ5APXaM9HlKFCutRiCHcPfwHazc2eV1DpNoHWvv8m/V7NkAykaItTiykaHh/K2Ap+PHsU849cueu1Et0HsLkMtobnQGeYVYXop6NhOweRywtq4eMGk57rbWPxYJUp6yrAifYUl0au+lgUC3S2kkk0BLrEiututHGOAP5VG1/tXOFjj5JS/4MirfzzT2XL11uhzRswzz3z1BX5lys2gQx1exNJfMLOJMp+MMHGj+tVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DRdLcmCa9Um5mwo3EDlzflBo9jnUnjU0zG4/g5NOTk=;
 b=DxXB/wqc1FkEejdkpiGxEIGhRmpTRqLu0uMqKp6lrVLPs9K+95dY/uIc1Xn244OOWvbhOZhZWNK3/Y6Ac1YgXxOZvWLWzKV926Bi451+bXA3efgAonWUotnnjIr6jXj6CfFCSqzNL/XL9c5VtjipTCiSnrNpiKAyMfSkGTugI0kQx0cpp4w1+rQtcSgZCpaBEhzFKWRLOwh90w22xaIaCAGB5Tx0TXnyJaj1i3EvzC9DUWZTvyFEnnGKbCjC5GTwpA4hwrM2b4CqBrHpMqhOM4KyfcBlPMCqSWjchinn8u8KMub81Fa82tRV7FjIBGsATjb2mCyOjRs/8M//h7ZMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEZPR03MB6490.apcprd03.prod.outlook.com (2603:1096:101:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 02:34:59 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 02:34:59 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
Date: Thu, 19 Mar 2026 10:34:46 +0800
Message-Id: <20260319023446.3422695-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::15) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEZPR03MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 99246c07-4219-4546-8309-08de85601d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: TGVoQE216J329Uf8mrfKfhZNitvzanjnqiOC/t1eXHMxtWG3h8dnhum747KS3/bI9HH+u2vt1VNITlw7lv1ZYO6Jzp0Hmb295y0zrkpMSRSKjvVifnbkMQZCnJU4DV1z+HmxVO2hfiui7foYQKxLhV5jAxNcaktnJsr7tbTwH8Cn+odrlsbgdytl4kLjXb2na9SGyKSe2tTAX6/hXI9o1462BQaFLF39w8Wg/EfeCnenb6xpEoCUzKf1y7ozWQXfIeFzMZFNJXUsqvGhC8TkhL0Y2tc3eldoG2EpngBDNFjfR+hsWpA1XaYgV0lXOkdywiGDFAhodVvNZhF1sCGXnc+PnhKc06FUhYbWh8pVyDDFVtRBL30mx9/nzZ538JbHbjjvWOPI/ceDVVcYOVdZ+ga8Bw+lYFBpweaMG73riWgK95sSFPm+tvsdO5Ogq6hZoc44tmMbw9WmD3LZj31C/Hye1sO9OCHXBSxcfyTqf7z2JWeBlSoXAx1xOGD0exDqv8Vz93yh9R71pI5/+0FXRVE9OpBLxSYmb3W9lHIhAxrubEoAZE68StEgWxtFLBcpSDapA5pc9wA5A5ZBHD9ODckb6IglBrrycCAiTLUdSZP9C5aTwg+AIgHY8hQyrpKEJKbPYV73m5OXdv35CxjwehHRb91BLUcW268gLADGfT9Z57rY85T2/u1oNwsCRsV+Gv/xggRGGMG5ZLtH9PJDbscu+2F4Lbnn9nzGvm23ePBZy2ZMsmR4zr3enNfcSt66xlRycfB1V3Hbeqb5Rg/UmeshgWXrvY/SIkM+mJHslmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OzAumfGlXahlBBnkoJBWy4VU7JwJ3jZEQM8N9didPlUiueKCBUDEqPWcKWqJ?=
 =?us-ascii?Q?55gkwOhNDvHAS6CBdI53fyU7BAJolL0RwioeBiwVLrdkGnkg0Vidoq0Otnf4?=
 =?us-ascii?Q?MeMcDMEgCGitq45XWfWWuN5ahSsFjdBPNZ5iZ0wbr3RqI1MMsCNDLQu1yq05?=
 =?us-ascii?Q?Qc6t92BA4e5ciHsm099kaiziOsZlMN+JxkQF6R1pu64TmWPxkh3a0GkGCKOG?=
 =?us-ascii?Q?igVn9VCvH/8qza9c4iDv0gpwlBPBPG6CkQPvs5aNuC9l+w5AN3eChU3jqkEP?=
 =?us-ascii?Q?loyx4Ik4QlLgxlgWaawiOdAqRDoTSF1Qylane6GgAg7n9RqD0Ssme/dZ3t0U?=
 =?us-ascii?Q?0iCHdD3uCfLwbs1sLxav48MrTJvG6jYNEOpZ0QmqVEqF8hrOvqZvYNjP7KFM?=
 =?us-ascii?Q?pwAe5lPM+EOfFZD6fbNUidqCanIjmIsPR8vgRl4+psONFgJ6I0PMlqhGa9Ci?=
 =?us-ascii?Q?Z9r53HlS2+wKcZEoAeXO/8dx5V3ffIj93ZxeObqopcO2vQh/ibdyB2v5RGGR?=
 =?us-ascii?Q?6i0ka3RKvIjnxpK/Nc4pgsbjhstIfTcNNrpZpAeZCOZx6QXjEPsv1Am4aaI8?=
 =?us-ascii?Q?KitV+GmYwbBtPHUFU8pyul9GUwdBJ81hnd6nekbrpToN6raD0AneEuH2l/K2?=
 =?us-ascii?Q?PtKHkP+VwP5MJDmZjmhee/hSbzr/pt03Re8lxu8OgYkIbZ+wjibajYAQHvyj?=
 =?us-ascii?Q?Jvufm15oVgh8hGdFoPLc4GedLQnKELJOPzWwdSt/kuimNWbB6c02X4OMVJx7?=
 =?us-ascii?Q?+BcP9mxAKU+Zfig5qFwKP69u5UxiQYDmrLR7OkokAZ++KMNr3n/yenONVch7?=
 =?us-ascii?Q?PLOpRJ0ieBGm9YO4zyTHyrPOYfHckVEngjE17a2EhoLyBUmu90pvF5CA6f8R?=
 =?us-ascii?Q?nr1TgXCD8jng09FYvWaqcrkxhot+Wlai02VsBjhTazHR3pszya09jic2+46y?=
 =?us-ascii?Q?skwKFBUx4ybNs/4FB1856Tlt1ecEnIR7phRmcwY7Adx37xJZ3gVvvhoFkv4q?=
 =?us-ascii?Q?LIFXBJ65qegh0QFrjOFNXc0lGEmA53bhTTMcf8c3u5cCmAhVznnxr3x7pPEG?=
 =?us-ascii?Q?GUZEVTBFUuM/bcmc/yjDLzSlR8b71SZzwO+X4CA240G9bqL0b7xWxpB0gaFx?=
 =?us-ascii?Q?a86JytrgyHSdTxauCc/Nu7xETeBQT95Kj7p2Z88HrfZREI52E2hLTXpbMLYK?=
 =?us-ascii?Q?bjs+NSrHw7JB6ofXWOKQK98Kgn/Tq+NuKr7/iLnH7HbIuY+5gayeHyJ3uANf?=
 =?us-ascii?Q?VprsPqkmggCGjVJmkT7NCO8bilsK5IhnR6/sZ3UEaag9BW/gD751B0tBszSp?=
 =?us-ascii?Q?ladDX7EAeBNpVr4bGpzUvkGslrU31+JyKMIeeeOVKKbCg/ctadgBx2+sf/hZ?=
 =?us-ascii?Q?j+VZJ0IUKVOH3fLyfRzj2tdMTxVvq0GvYiQoPLSXySFzZhvbbDC3IDPIW3QZ?=
 =?us-ascii?Q?F1Vvlmfz8FYVA/KGwtHaVNOoUkvOtqPnFWrCHc9PMWLnh3znSDwtOte8jd77?=
 =?us-ascii?Q?FpyBSPPEtolEQAL140MA03JcZiYzYTjW/yP9dZPPyjk+WbOR3ivCI0RujY1C?=
 =?us-ascii?Q?M6UNfB2sGytUitvvX2qRBat6tS+Qdx0UgTPvZCKG7FrykHwS49ODulZekkAE?=
 =?us-ascii?Q?sLe2uTfaeNePXayv1tLQBVHI3JfxizuAWH2Etv0snVryNjlHHQipGeyRVWDD?=
 =?us-ascii?Q?cjtiTprJNBoYVcszLuCXTMG2WBIJs026CJrYWEdib1wVLQ8c?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99246c07-4219-4546-8309-08de85601d64
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:34:59.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJDzt7sJvr99VyE948XSfs+FAJTYa2B5taTUOjKVhh1UJ8wapIrqIXR1wA8NjYro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_193512_732481_6E0D2B36 
X-CRM114-Status: UNSURE (   9.82  )
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

The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
mapped a single incorrect region. This caused the kernel to map MMIO
and secure firmware (ATF/TrustZone) memory holes as standard RAM,
leading to an Asynchronous SError Interrupt during early boot
(paging_init) when the kernel attempted to clear those pages.

Fix this by splitting the 8GB memory layout into three separate
regions to properly avoid the memory holes (e.g., 0xe0000000 -
0xffffffff):
- 3.5GB @ 0x000000000
- 3.5GB @ 0x100000000
- 1.0GB @ 0x200000000

Signed-off-by: Nick Xie <nick@khadas.com>
Suggested-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- Removed leading zeroes in the memory node reg property.

Link to v1: https://lore.kernel.org/all/20260306031014.2421875-1-nick@khadas.com/

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 25b478e106451..f4c953034be39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -17,7 +17,9 @@ aliases {
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
+		reg = <0x0 0x0 0x0 0xE0000000
+			0x1 0x0 0x0 0xE0000000
+			0x2 0x0 0x0 0x40000000>; /* 8 GB */
 	};
 
 	reserved-memory {
-- 
2.34.1


