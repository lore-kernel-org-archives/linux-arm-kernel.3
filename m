Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BB109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxg+n3+SEeSGuIV0fwOG1+XLqlkgb9wMmeYUHxSspTA=; b=DqJVhlli5DT/7jHdZsw7MhoMNO
	5P0em1+iRi2tuTWztemttt2Y9XUKr+fhw6xobJT2CYqK2mdlLVcmTBesLuxYgLudMTPBkPHK0Bb8f
	v7EAqZ0zoLQwuYlcpBRmkJV1u066MxYnNhbFCnwEB9GtF+QEd3NmXQAEDEKYOlKZ0+3gsJm9yaJOx
	6XepIDQI+Oif9veaKteDcWhTjjkeJXnThElCRwtCWognwedQyL5hHmloIeRoWFhTfuT5acL/JOiRq
	2PjicSCx2mr6SZa1mjdc6g9KoH9P5KWYJq31iyTnPaLH4Hrtf2nHEG4e+DEqRcLettl85x3JN00Aa
	BWG3spnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wk-000000074hs-1Kwf;
	Fri, 27 Mar 2026 09:30:50 +0000
Received: from mail-japaneastazon11023129.outbound.protection.outlook.com ([52.101.127.129] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wb-000000074dZ-23yp;
	Fri, 27 Mar 2026 09:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm0qawkx/pWyZOcsPADhBwaD07epW2IqQkgUGpIwv9YI5zZpeJ1WrwDtSJeygeKCOf99iUzwnzu2UHtS8gOVQJmZU8DJqMmRn/9wRziQBxGxeZzyQI8G9DMzdGIHkKSo190r5kCk8j/X4dssYUhcbPZz34TiMjZ4UOYY+SlbClkv+lbr0VsNRWgNjqMWEgyS7uBDhcHXMyNtL0q/Ji4NgCGEMNC2GDcOGBQ1EnYlsWuPttrGNYMyB6P8mupbvOnYIORzSdeW614RRco+uHYJZhK0ZML7IAsvd+cWTZyyJYcJ7xtLFywQi15g+tZg+F8R8ShIFMfQQ+j3J0okRS8khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxg+n3+SEeSGuIV0fwOG1+XLqlkgb9wMmeYUHxSspTA=;
 b=EoMWBBRziX5CYj4MZwUbY5wGcLIz9A8diHQQQyO9Self7sbsaq53cS0aF5DUe2M/n0g86aMoo69U/A59Wd58ay5WgG+jmWTXBWG1zMlRAsml63U8UqsKdhVyg2VEgXlxC7RKHHQBfwKdiuzt5Z37XIWm8oxuXqumyQhzLm7FY9uHigb23hqsVUmeAbjyyBZjKUGJhwqcf0jWdspBA1+1x7v3EbAMSH2BktqGpKzeRy8Zr8VdhYutYp8cXwglGY2KklX3htsJgEyPYHI+bmXi8eJ0m1//r5la5HEF0tnyfIJMvmPDiaFnAZTJQTZ2jdHYzk3PpCs8HmKugagZ1bTvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:31 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:31 +0000
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
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 1/3] arm64: dts: amlogic: meson-s4: add VRTC node
Date: Fri, 27 Mar 2026 17:30:14 +0800
Message-Id: <20260327093016.722095-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f610b6-2427-4e74-42d5-08de8be37d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: a42PFSpxFrc9Snxx5NkKLtLDnSb+FVcB66KMlUQXrbubWfE8U8P3z1keMXq4xxeyBqWrgBo3nyLcP972oq2fN1BEI2JI8zvG+TlJpfUAeQG5mOLcj8WSvAynae8J6SDCMR984pdSLpyIkTG3kHDfOoFeIrvXKnSilv/bWE8JnX0TfsAw7wwATVAKO0UO2QtacLWLy/1vVrjNQmDwfwdC/NV2uGuxQKtpkBXyDRexiS2lSnQXppX6u+MLwjIU9jxqJysJRmGMZr0r0EEpHU4rMcx3Vbi9s53DDjFaWavqDr4h3/4btNN3/wKSsBeJnV6iuY1gBuhfeH44RjVbIr/nx1v/V1HuSNjx2HlzFJlvkukWpj+8M8F2ZafGvSD5Ec1TxUZZSm4uuqzcd+IesoR6q6EU1Km2Yvb5dpVpI9DqVYErAk/xC3WutYzVw61eoarfmhpJWBRdBzTttITu37R9/EYFp8swDJ3EF6wojQ1pZriutkVJPhBinTKz/MgWqUpOtC4zBqtAKg4KWoafOgLdNW8tQOH6GEMmD9MFIobPpHCg4ZbhUQSbH4YxRk8KHlxA42FZHWCG/UF9E0kkh8JSqrsIGlBPuLI0DrbXixCCozdDYU/MHQSVYK+/m7EcUonhqV4ForA51g0j0cmgsCgi4y9R+zegyFIdVrm//+Y6Arh48mBiMljTmHu7BZaKhHWUZ99bD3pkuNzTXVhZIwCVjkXyK6MeJhlsc/fuOocym2JAUfk63OuEOKMS2UGVNvHJVu8xm+06W15B4eWxQFv63Le8xaJvYNbNjzYxCKSbN9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWwyeu6xLcRW2ouQRhrLmPQRFPjC4qu8m03wNxBuB+LWr5AfzyqggIAmSo3Q?=
 =?us-ascii?Q?Cub4PqrYZ/UmPfgtimVjRWh/r9Fnanr1REAvQUtWpUmKLelsScqJ2maOwOev?=
 =?us-ascii?Q?vqt7s2WmKYA5TKES0QkT4DZxoCbPk87EFaPm5kXDZclfuoBq+LIWnkhghXGn?=
 =?us-ascii?Q?X9MQa8bfckZD3bDtI82E1BUs6j8urN4KRyY4eQJxue07+FteEBaroRvCRS6S?=
 =?us-ascii?Q?vX9JMi7LAV3QMDvSAjY8G4OO7rkMWgYN7kmkVdBORM/qmHwTH6PnTeJcxp1x?=
 =?us-ascii?Q?jGvd0ig634qPRhetAInM/JrF6FrbXbDcQlVzvlzt5DikIBKsxQdxQ1xRtycP?=
 =?us-ascii?Q?zMA5Xbx335jyG2ix7nv9YOh7AiHeJiWt3+02ybrVIb1msbie3hKRwLEcGjGc?=
 =?us-ascii?Q?wCBYdRa+rQEGYlRF/bLWULgGYGD1IvQxKaXjmIocTpJ3HCh9RrJiAMvKJaRR?=
 =?us-ascii?Q?D2KSL8fZ7G7Pek8dT/fi4AHkqca3r3Jof+8btFZu8cDchumdab4P/sTywyKA?=
 =?us-ascii?Q?b+yY6kJpB/fIf5BO1h8Yfad5l6EiNjMCCvHcIs40fKE/dLmAo40H8Su5N7BI?=
 =?us-ascii?Q?f1NsFlrQ94usyMPQ79iCEi+YGWzdlQqooxahl+zlYm5R4O2oqiXiziHkGk/6?=
 =?us-ascii?Q?8wIS6+nbEgGqncK9PVUxcNReHxVZj1o+K9h8GK2A1ZUJ7UaEiCZUDLprJkeU?=
 =?us-ascii?Q?DF1zzyKuxBUgZRpDTZhp7nQ2kItBy9LnEB381oKst4VQoyVYOM1TT6B6QVNN?=
 =?us-ascii?Q?Jp70adgKwoqYm9s1/ebHZ+tmCY5p+n78gQsN5XbB/HT03OMZwP/vhoTVISkO?=
 =?us-ascii?Q?f+sOgy99vMTu1hLnxjcZYPkWr6j/xSW0A63UiwJh3z00FhdLJBpZqpxiqFYR?=
 =?us-ascii?Q?iDE2wS2lZw6+mtGM/4xVS2VOZuhKSW/mtJZP8UuQIBMh304EHWsMbVwfw+wd?=
 =?us-ascii?Q?yzChHGUqSoPzFqIMWc73GPA7jb1N0c6w4Kj5iahsQlTszX4+aSdaioD8QC58?=
 =?us-ascii?Q?GbW+MJBAxhdpdOw6nI+1R1SI2hPZdUSwW6YGnQLGsENs74MWVOlmm4r+D5vh?=
 =?us-ascii?Q?6SiofBsGwbVKUtku3gktoOZ9la2VxmzxlzjeLHZGyiPoGcMK/fVtX/HFKwXJ?=
 =?us-ascii?Q?0LpoLkxP5eVjQNJSVQl8ogwQ28zB+GjOcfYK7aMQgMPcfGyI7aUo0vL+tTmm?=
 =?us-ascii?Q?uhjkcSAX8z7BgcVjnZgFuROe3aWdzOBvRLP4h3r9lidr5ZUHd+VuTZNibSaP?=
 =?us-ascii?Q?0M3UfSWkuGqPoicE7eHRzqpMA4x+tEvSMcDCYJOFKdh96KbQcibkDJCBKzZK?=
 =?us-ascii?Q?zu1A+GjcF28NCgZaoZD+gTx50gIv6ViLxwiP1PF+IYrGBBLohfe6abWh2EA8?=
 =?us-ascii?Q?YuGijle07gt11639YGmDpxRL3pfXWouTkfQkhnwRjXfmy+0cb6hAE3c+eRVf?=
 =?us-ascii?Q?pLeN5nZml9a0oMhg7U4tkEFbedB3DOHMsoc23E7J1eAkzxa2waZyLmFdPIYU?=
 =?us-ascii?Q?KECukbxbynAKXrudD8NOyDtYx21YIHrUPqWz1doq7b27z4UHN3EDwGCJm2mL?=
 =?us-ascii?Q?7p7WdbqqtfH47mZH/9avKGxdVUIFKsDrA7ANPdXd70wH4h3DTaaGMJ+Gk9Du?=
 =?us-ascii?Q?CZZIVYvdxiUwu1e0yiX6+jK5V63gQrN31GtHSdJh/9IXMhkzMoAGhlAfO4r/?=
 =?us-ascii?Q?zNer/ozOU4AtPlFD3H+YvXZgIPKlGzDeH2ZjEOAbv01HlgBk?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f610b6-2427-4e74-42d5-08de8be37d9d
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:31.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlUxgMR3GV+hK5GCz0s0xbK/K74mq3FajJdU+7VNYa3hvA30NCO0/6TPcDu+75uT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023041_528457_2479D862 
X-CRM114-Status: UNSURE (   7.12  )
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

Add the Virtual RTC (VRTC) controller node to the Meson S4 SoC dtsi.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 936a5c1353d15..2a6fbd5308362 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -59,6 +59,11 @@ psci {
 		method = "smc";
 	};
 
+	vrtc: rtc@fe010288 {
+		compatible = "amlogic,meson-vrtc";
+		reg = <0x0 0xfe010288 0x0 0x4>;
+	};
+
 	xtal: xtal-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
-- 
2.34.1


