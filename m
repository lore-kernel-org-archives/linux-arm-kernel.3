Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EACED262AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2zOLBHfrVC8ou9WOBlArJwZ3mjvYW/7+dkBJs5oNHI=; b=pJckvsqLOIfTnKSgPpnd0OAI/l
	iAZ5tqZ5snkoEE6f/8G8oy6cXAEKfeKDDw7uGOrptLSV6S3oelOmDcEYKekXjmH7hDFCZKo6Hx9XR
	izgqNzGrAc+yZsSkS0lTyCrLqXjH1yoCB4vWfONlGUB3R3qyPjKNEKIjjcm0Q61IYSqdHB+QuG+2n
	QAbRNwxdzuyx/puO/UdAF+HbWQSBPZK5UxMdhkeLcexhhczmJEmHj4ctSQ4tbrTWIl54EVMdqDI0/
	gZf8IZw16ONNnOGBuLRB/7EfrWveMiDXomRua/nbTmj6u9ljiHMJDEC9Iv+RClHPEXWtdhXPgsrhy
	Q9UUPXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNK5-00000004jGe-2Mrx;
	Wed, 21 Jan 2026 01:47:53 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNK2-00000004jFo-1xGu;
	Wed, 21 Jan 2026 01:47:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFZ1EiNQKtNEvGkYdqWLK3zIQFNA2ZfbvOBaGTZJfnsQqhPEe3yhhnMvR64R388qwiWzcf95LCiFHcbytHqtIRbmvaVQgBtv0ZrCpsakT/BonGQp6puK82d6niXaEt5upFcj47/iEJabN8TbuE8h+ZQJIJM0tuGlPbFj+rjvTevB+qMQp0Q87Z1hYkXn45mV5kLSfJ6UoZHW7fkFMq7PNlMiSawrIKm9eanSy+Vm62VkrkiuER0JCE6VCTOGg9zIinDVs/JHn51CQOJTFfQQraVQ+McsI+mFaxX7hCyI4xs4A7h1Klp6IL3euZzDTQxp0ZiKcnzvU4w3trZk7hu1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2zOLBHfrVC8ou9WOBlArJwZ3mjvYW/7+dkBJs5oNHI=;
 b=RtM0zPZ70HbTNVCHhY9DoA5qTkI/UA5UTjNDXH781mroxEfVkeiQXoiJ8QJh0vv0FEMnG7VPnbiHjKS5jSEojp9Y0Bk3GifcW0IxGhFnIJAEqoUf5Qjqlh+flC0QI/lDP/+pzeX2i+DbI4lWxgJN15wHKCpeTE2+WkqQO0gZfDtogoQfp/7wRrgFlwSqF3NnFG6UuJdW3pGIQR73zJIrhli2d4M0kfhp0vvsj7CVr+VW3YcwLPMwNDOmZKpdoHo5ZSqVQsN/REj8mXCWx1G3P/G3CFwWmbtFt9a7cEHm7VUvDmAhs1hghBx7h8hAbzvmPWI5h0hVO3OOKYb80r4G4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEZPR03MB7513.apcprd03.prod.outlook.com (2603:1096:101:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 01:47:38 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 01:47:38 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface
Date: Wed, 21 Jan 2026 09:47:25 +0800
Message-Id: <20260121014725.122722-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEZPR03MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab0cfa4-f451-45c4-0b30-08de588f0ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PLoCpvV2ZT+zNPYNsLR7P/wr+sFmRzuJCpZH2gojv0nt9K3xghHE6SBLeFYD?=
 =?us-ascii?Q?mIeChaJ0oMqmBK1bcHE05cN6oJLulHfuCo03hfXKzSmGUtyGFciWRz1hhrHN?=
 =?us-ascii?Q?FY5T5oAcmI08gl8n+lvWhcNLO8yLbOwyXUvLFafi9jxhsMcdte7gPoWWGQ+W?=
 =?us-ascii?Q?PXvsmQJXrTaoG3uWpct6xk1I6Kj+WNuHrGZBrIE9SGyNoZ4zUmnFlXPcbVeQ?=
 =?us-ascii?Q?/513pQ0F0kinvCyi3X44J7jp/AKkXz4OpraecKx1l95XrDOEQys/H8qt+usT?=
 =?us-ascii?Q?weOGBSdUjoItByf3orChj6uCR0ifHeFYT58gw0derFuVNUVTD/kRjudEKVW3?=
 =?us-ascii?Q?AeWbULkX+vxQhSggpVnMABc+nC1KTJ9bXLohUTK78Qq4ssszVwfZPImapco9?=
 =?us-ascii?Q?1nTYI1LXuq47T/a0njvTI6FNnmJRRKq2vKNLptiOZOEMGnvw51z/1Q5IOGE+?=
 =?us-ascii?Q?HXPgSXr9X8d7asGDYkFiCXgqGI5a33ytm7DKa86IF8wP/6YsKnmiJdJXlRJm?=
 =?us-ascii?Q?npgS0TUe5WmXSyJqVyqSoOWT1QFIA7Di8vE8Z+mrErLsUpKSugSQZp/LrWQs?=
 =?us-ascii?Q?WF+NQLcha5KSsqs7WVW9TYL5LWH8t/VaRhVBU0l/8q7wVdNq4LW1LiB3FO+P?=
 =?us-ascii?Q?bzw51byjkDWFcXZkVqGj6k0Uy191OMWOjZ5dVsycty33Dm67rvXbIfBHjw11?=
 =?us-ascii?Q?6V9jFDhYpeRApp7oV0QPXb1SKEfwvBIxpesE/n/XDqhmvUoc9AJCYG8cMWUK?=
 =?us-ascii?Q?MbKmPpi2TIV0SC0T1Csv0bn7mCEhaFrQ2zJ6lDhmu7TsBtC1q+OXX6FjybFz?=
 =?us-ascii?Q?Bt6DJB+f+z0H8ze/h35YDUZwBrlnJj5mAv7IabpwBYtoK1YlYJ3yRboYm6VH?=
 =?us-ascii?Q?B0P1EuWjb14Bm4mtYZpD6wbLMIF7vu0IffFAZ2tz1QKVH12M5859vdjX1RRA?=
 =?us-ascii?Q?Nj4KKU6FSWJgvyrZdsCgaY80mnmnszZnSBRHSGrfZxMvmLyD5lsbjGIiMSa3?=
 =?us-ascii?Q?rC5dSthBVAQodPGwHtPk2HkjBJ2dnGKgbgp5xDZ1dfuWf9sJbDWaZIMgII+K?=
 =?us-ascii?Q?fXUdo5Mq9Hk14xrM0y4Ec+JuxNOBirEg8nzebbslCixjOqXWU3lR76h/Xzzr?=
 =?us-ascii?Q?0t+QU+nD48lIZ6yjPFBY4/8BlfFgjQczzuRxkwtoLp5UYhVV1IeZz7WXzb6m?=
 =?us-ascii?Q?n0HbaX9yvFYqK/wfpyGs7CY4MwYMUkqV8MR+3hxDi0Ku4ZDjWZel1AJHo2nz?=
 =?us-ascii?Q?JvSJ5SNfDuAnBp1ndchKX1Y/58ImcSk35puPnFg45Zc+xJr6hSiyPyxly0Pc?=
 =?us-ascii?Q?bREc2w3yjq4JxpblWs3/skoLwXqdAvCiB3Kicdxr6o/7m+Urn4AwJZ640Rdf?=
 =?us-ascii?Q?XZA5dkA10HBkcRrZ3JWMSQAfYBk8gDuiwC6H6hTcdeFQ86Inya0GqxB6xELU?=
 =?us-ascii?Q?quRigIcvW5c1z599/McSeA+nAsO8a67IjgFSizoqk6XIelOMuaBQ8DQfBgDX?=
 =?us-ascii?Q?e6VecVfT4iaFa3ni8Y/TdnjwU6cLmoH5XrOlRBfkea8zro31C1txH7LEruTG?=
 =?us-ascii?Q?1gbr3Fy/37mwY1f9dTpu8SU9ehhs3KmqH/SLShMHugOVWV8SvxQj1IcMNq/+?=
 =?us-ascii?Q?HEYWRUfhseHXwjf9RhSZ5/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTE76nvwAHO/VpFL5cO+Ajw4oQQgSvKhKJhDqOg6NrDbHoxnJkSgM0rTwbeX?=
 =?us-ascii?Q?D3CSkKzhyXsr8HSTtzigoFPvpAdQcq5UdsWMjEUmYJu6qzI9aV3F21qTLWoI?=
 =?us-ascii?Q?UUE080s5baEGo4PkY0Gd8dB4M8FfEPXkvPxqr93a4F8uLizSncxTQOUCA4bg?=
 =?us-ascii?Q?xTVvcqr3R0t8PMsuNt2kAk9mKjdXYN3Eo2mQlfgqbaiXqcsfSgtQSJxyBtbK?=
 =?us-ascii?Q?JbrwFPosVxeoipmqN96qjyGsPRPPTtLYAJCIHdCpVI8QYRu1cSDGRxg76vnb?=
 =?us-ascii?Q?cPJCmB//8X74NWpWg5VlVGMIlPb4XS3JbjsU9AGukVSgZ8XUbeXc8CXQZ1Ga?=
 =?us-ascii?Q?zT0d9Eq3EK5TW5oRjSPmKiz2b/cw9eVPf4G4vN3GDNW7qJmkeqvYR2BcJW8O?=
 =?us-ascii?Q?FTy+JSwg/4uYVduoopAurkRsiCdmknfVMMeF6PnYNCE2o+rYRcLhOd0bRuvS?=
 =?us-ascii?Q?DkFqoAsI5DllPgs2RWJv51sZChxbs/JcviSCoC+PcXk8T3VdS7EhnX3woQFw?=
 =?us-ascii?Q?6NYu7YjXOZJWy88HW148xaqIo/bLq30ZrqUolrXhleFMjdlijfikUBF8Hwzl?=
 =?us-ascii?Q?h9+zQb8f8+acIg5FAcb9TQ5LyTd9YBEF/Sh106VQ5EhEOYnOFaw5Z3kmW1Ou?=
 =?us-ascii?Q?crITT+9LGogqdEvNMRHI38/2TS+k1UOktQ+u51hXpNWG+G2EuOmwbb8IzEIo?=
 =?us-ascii?Q?EVRxfsqo91JKhO0lMNnYzxB0oCVQZ75WZI6qIAPMxc4xXO6ySam5hLZm5BGF?=
 =?us-ascii?Q?H6J+udQ0fFUiExeNNkXYnYvpiqgRizSFtw+aWdop/JVPYZ57PNbATGqo67XC?=
 =?us-ascii?Q?k5Yd1h6w+HH285P7zBeOQHShU8zNvc1S3EN/F/PYwUal0zOuiMQzshgiKH/7?=
 =?us-ascii?Q?G22cMPHHqmjC4HoPRw+cLR9AB3XdrQWmTkyhYJHTZNs/g23aF6HGHqIvKxnx?=
 =?us-ascii?Q?oENYq2pdIUIgqFBg3j5HhcM/HLYYQWrJU3vsIrhBfLYdzJQdWSF4OXvJBpTz?=
 =?us-ascii?Q?7G4LLAJYqUbTN0AUgomrk7arAJRKuB5HV8Ox/rUezoVuVllW5B98QPTv/xVV?=
 =?us-ascii?Q?xGowT+hIQnAFXBS8xLUcOLlOr0RTf4YgfgvaWYC7ykj7besdTUXlKjhjx4hI?=
 =?us-ascii?Q?xhRbPMS+co+wjheG3hlLkUI6CjqruHtpmN93TpbXM/etIYmfaYuuyGJsMyqs?=
 =?us-ascii?Q?F0k71kxkKlHBPYyUdZJ84+vKxwUy1hsWDQlmaM3aemOqBkL1F1H/KB3TenGS?=
 =?us-ascii?Q?Td1p52Hv1IhNq5Ji/XXODTEuRrKNzjlc1vsUC57xMvUbtztNBmPKNIAz9NkJ?=
 =?us-ascii?Q?cVNnWwxMlcBFgKAUvEAM+PO/B0dOcXF+jcGZKgVw/VsxuM9FB7GothNhZYAI?=
 =?us-ascii?Q?2YKDGl3XzHdP97JtVLSjE8aVtNeDUPPx3CASI1QaksOe0pqo8tPXPkAQvroU?=
 =?us-ascii?Q?fgctszUPK6vbRM0vc0b9CrBGRIonv6fCEuc7j7TyAOxH/amPyHfow3OXI+yI?=
 =?us-ascii?Q?IyjNFbtHkyFup1XCHQietcd8ybKDv3MutSrKL03uD3XoOhB7DgFvuis/oa5T?=
 =?us-ascii?Q?BzoI7cG3YTN8fBs7sWZNBjDd7ejD9ijtjtsbni70JMykfUg6BbtgH6cCv8kU?=
 =?us-ascii?Q?lxvnUkR2VbFArG9Bq0jTDAdOkLLdIgvwoisCJVoMOsWSVwH1WQ91fce6AkQs?=
 =?us-ascii?Q?xsmW4Qb62jwNzyrgd/XOaT0qs+0BFmLB+BufKdCuGFHMK9jb?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab0cfa4-f451-45c4-0b30-08de588f0ed5
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 01:47:38.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaVQ96R23cdCWUZHTGRB7ZyJ82Wy8b0WwBfo+nbVh2DmIdzJtGYav6Z6DKACo5mK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_174750_509458_1B6B0F8C 
X-CRM114-Status: UNSURE (   9.10  )
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

Enable the SDIO controller interface connected to the on-board
AP6256 WiFi/BT module.

Signed-off-by: Nick Xie <nick@khadas.com>
---
Changes in v2:
- Dropped 'amlogic,dram-access-quirk' property as it is not required for S905Y4.
- Updated compatible string to specific "brcm,bcm43456-fmac".
- Link to v1: https://lore.kernel.org/all/20260116023900.2036657-1-nick@khadas.com/

 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 4a66c1bec965e..27d0f6134ea9d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -220,6 +220,33 @@ &sd {
 	vqmmc-supply = <&vddio_sd>;
 };
 
+&sdio {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <50000000>;
+	non-removable;
+	disable-wp;
+
+	no-sd;
+	no-mmc;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+	};
+};
+
 &spicc0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1


