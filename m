Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE97D6CFB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++Q37H8dRMC8MzpQy5kcTRqK9pnRtjsbzq0cWg0OXBE=; b=etgm85Am49KsX0D3wKzwHvnAsT
	e4qd0jk8XbYuKuNXo23dseGbEiQrQifJdoatxsxzSAy6w0C3ZMV/aYnkj1F87kkAdMxPxMGM16NMz
	fg5rjp1m0IEnx+WcCAk/wiP1Dhj8bC+O11nbieIwLg/uVBVNxI6bvVduJt8rBWDAhQqPipQ5xiydl
	O40I8VKJcNH1oZwRaX0PgP1gXAml+wYp+YytmxuyPF3jR48vitwMcm0pjgz2zmQPFb2O3lYKf/H2n
	1fX6FQ/10bpkq18ivp1mlh+ZXlLsM38HYerytlk+fOpBDnPgkD0E8soH9SxlJ0GAQ6MJxQqHupIt8
	D8IkLkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6pr-000000081mG-3Mwp;
	Fri, 23 Jan 2026 02:23:43 +0000
Received: from mail-japanwestazon11022078.outbound.protection.outlook.com ([40.107.75.78] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6pp-000000081jC-2O0r;
	Fri, 23 Jan 2026 02:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3qbtZHe6EALwvm5eIU2l5DORTb7SejTX9ZYJrxlrItLHbiAH4udMq/MCdOITYLugOSN+A0uilYH+HfQWZ+Td7FQ2EvAMUvZBnXOafX9aluPRxY9oPUrMWCw3SSEVlpJvKpPhjudiQ7pfAv0uyv8JqCa8C/khi0ndVQPtsU+IBpUNbiLzM5HuFwRPCvpCOM3as6SBNjg7NwgXXIVaI7kPKafEipnRATo4wRPFkzYr2UoRnsrk/x9nYo1ddvkt/zFmKZ38Qckz6kqg/Co8UW7srS7VF7HHSV/jwx1+pKVsZSPrwNUU1N7H453h3ZhW230u2PDBmSJ9SgIt7GrwmJJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++Q37H8dRMC8MzpQy5kcTRqK9pnRtjsbzq0cWg0OXBE=;
 b=V1iEtfriFrhAWUOX8aGKMBz6jRnnqr6xEn5PKoGblkytGbua2iYM7yZW1qEePlq+VEPQqASDkl7VRj2CUFpDVlEb+7XIYRWqXOd5KLiK2LEO97UHtOcuhjadFtp1Eknr3szV9fbrlrrvngkeQMHBZBRDiLZ4MoBu0ysWra67Vc1JOpF+7QZGwfxdQtW/4f2x/m05TfK9qqSNFBhRU5hKbf7MmY/mi4krgjTuihh1TiyYL/bjKGLYl7gUOVzFJclry5yBZJWJWNhdIxB10d5I73HLM5hj35xsU9nSmgojV2mcFIA7po4vztBV4mamF+dcE6Uf2bxFaNdL0cGuD94J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI2PR03MB6590.apcprd03.prod.outlook.com (2603:1096:4:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:29 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:29 +0000
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
Subject: [PATCH 5/6] arm64: dts: amlogic: meson-s4: add internal SARADC controller
Date: Fri, 23 Jan 2026 10:22:57 +0800
Message-Id: <20260123022258.136448-6-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123022258.136448-1-nick@khadas.com>
References: <20260123022258.136448-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SI2PR03MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 23029450-d2e8-498a-12ce-08de5a266571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nOqX58oC3vFkiBdgFsfdXfNaQ1/opZzFmJuLNtYN7TSQwnmY/k0xC+rUI5YB?=
 =?us-ascii?Q?7KhtAmAL87Oru3fHSnp1HZ3X+SvOJNK241HxUVBJOZpKPpsKSIGxUP3S5L4n?=
 =?us-ascii?Q?OcGxIoryCcfJFSjJR/SA7PlgnRbBm4TdykE7FPjuCcW3R22Wt6YAaILlmGSl?=
 =?us-ascii?Q?erWHLr+iVMZ8z6ncTykB5IR5reXVpnTjG8ffgPylwK2Cc+nJyBnVmGksGtNk?=
 =?us-ascii?Q?G08fQdVBUc+HQU3JlyDO+j3rNa9TstmwPGfVEN6AyvaMmIWUg9Fh7UyPuy4T?=
 =?us-ascii?Q?BzhQpWO0IGRGeQVwihu+nki+QUGnT2khnuw6oHN3PmcHLEzhvLiTI5FOgGoa?=
 =?us-ascii?Q?Xym3F/9I2uR1czWPFm97dInqkUynA1PFHwJKh+MKnIue+Jm6IOX3GzQTlG/d?=
 =?us-ascii?Q?vtugLe/tgYWMkOASaTalyzW3a7uz4rmp9bzfGj/JA7mj6/k6UObGhjexbX8l?=
 =?us-ascii?Q?KJIa0Gabnbd04orhFyjMY+j18A7q7JGAUcB0TvMRtfYC6RJFpeJpLqeHMITj?=
 =?us-ascii?Q?/alNwsTYjPMaht/A+0MBoa8Em23h472qzmRrfY5LMoJlDwU7k9Qz3vqoJxiO?=
 =?us-ascii?Q?Bahh52doPpJvK0SetKuK15JBZ9E8bq9nPx7565u/SsHwtpOjVfWxu5rsEhei?=
 =?us-ascii?Q?bHxZXaLuhbtKyzdsEStJ9JXyqptk1lSFnwX/s3su/hBUDT/J/ewGKvJv48V3?=
 =?us-ascii?Q?ce5lAnLX1Qb7jcfDRVL4duCWxoQiNJOZNMERqLlyzrPOggJL8ysA+lz1wFji?=
 =?us-ascii?Q?sCTOx8P7E41aqbw+wVa04+K4/xDTWNPMHdrTKi0xgfFeT/khCu3w16cZV7Z0?=
 =?us-ascii?Q?81xHJUqJn/NnpKlhwk9zrXbIRbHrkyd5wKY+DfQ2xPnJKaE0bA8V05R4BdHj?=
 =?us-ascii?Q?eII1cuwlFqNNZIK7CPnpRn1/I/sl0M/pPn14rCO0WnTz/8pzTKp4P3dVpfbn?=
 =?us-ascii?Q?aokVsNl4ekct4IO6z0MykxxetSYFeoFmQQkBwy6wksZI0rEuR7ce72ZH9gDN?=
 =?us-ascii?Q?QEtRmgeL4E7fLWKp/0aVr+iNmixE01YlKgikugEl69zzENAno5JB6DMPX5uF?=
 =?us-ascii?Q?sjLCPunRQeum90qdouuO50Vin+/Ml8AEB2f+IVFGY37tkE74uMKm0yVonPBF?=
 =?us-ascii?Q?6RcnoGzYinE+prUmr434bY2haJXMJ2JtAsHq2BNh8UaOMH5bowDgv5/qmyry?=
 =?us-ascii?Q?h//bEjBWxPXvodI92/rbjX2toLjTRgtbFbcQGbi7P32QaxXX2/O9GhuxuA3j?=
 =?us-ascii?Q?2GTVfD4m6yh/OBO6j6AJpf0iBBBfZACBUqFwKWuXHbTDDIGlMNWSYJyEoQrD?=
 =?us-ascii?Q?to3X3Rk85MqtsaGxT8fdQxVJ77yGgm+cy2ls3GC4fA7dWtIUmk7ucOEHLhpV?=
 =?us-ascii?Q?N8rFU/CCx/hI4IwCyZU5Z5FX9vDyIgVXjfwgKusMbOKEM+68lxrQD/wefY9n?=
 =?us-ascii?Q?SAdpKdFNXpH/uwHDKLFs2AthSSnms0t71O1TKtvgQWGLcgUgWnTnbuTOlIDQ?=
 =?us-ascii?Q?U0rM/xgZlpu/rxxu7ijoZanuB35DgGCojwKSDqC6J+y4WjAX+nLkQNc8tFIg?=
 =?us-ascii?Q?FZBrsoBOZC/io9No3BqgPpCNDmAfkpJ+k6XuI9EQ5Fz5s7yJ6TU616BhKPT2?=
 =?us-ascii?Q?SXrYobrC/bWaqhd1uvpDKl4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSGW9IIIjhSp5YHJMPBc60SYHFYyVWRFl3eHd6ShN2ON1ZLAPByciNOj0F5V?=
 =?us-ascii?Q?naZhqC28XirFXRDODZ0q3aNDOHdW9B7kkGy3wkNWuHiCODsNfVgs2ey/s2HW?=
 =?us-ascii?Q?y9w4wFkUKE6HhIwZyaffZf8D3lSuzwD5ZOrhho2n00ROO2pVCEfLvg9vnTe5?=
 =?us-ascii?Q?2WxBMBWInt6ngbbB1EBgNvrmN7KvwzKnkRBezWJsvqMepCAIkIgChWHyvYCn?=
 =?us-ascii?Q?kV9M2Unp0xPNLYlofwX9FQntYaDgU4p7N/qLf3QE3qQVdIbhDGg/OudQoIOb?=
 =?us-ascii?Q?9jNSb1XH9z1Cc5kE2Xj9T3SEJg4aa4K+SJHF6ZIzKelsODhai5qRG5J3u7kE?=
 =?us-ascii?Q?eUxeIv91wWXiJBUkSGpyz4Cw6kbD+PPNCqP5Q5wIbBMhKhptCev4t94FYdxN?=
 =?us-ascii?Q?9C58CyDuWdygBHk0JonYQNQ6H63NPzNW7vwAM5JrzlicGYNsOqp07hSyFVeg?=
 =?us-ascii?Q?Ey92TiEODbt+jAkbMhpiCX3+PuG2EgmA/3KzJrOityfM91FTiQ3xCsIeaFe2?=
 =?us-ascii?Q?S9rad7C22ur5MfFyKKdUpvMZ39hZHP/dWqtWAIC3Ib4q1vFimYCDAZsvCm1r?=
 =?us-ascii?Q?McYfXEbxSbSI91Kq2zpQFiEL/qP4DoFt6ggnLK1q0EG012VvFNLIFEMNvd63?=
 =?us-ascii?Q?cr+bQxRnJEN0yvJE8ZyY0jm01Dfb7+Y6pLSZEEHNAg15JcpDDFDDa/RvUoRx?=
 =?us-ascii?Q?hywwkcSfTxArr1qYaDnt3xMPIdIh/aZpgHdeFgcBBC2LbormAIjJvkuUnCdX?=
 =?us-ascii?Q?pBEStXgM8QXvwY5Ttm0Lx9m/lL/4BcmgAcvYkyHpa4jjYblRNXpNmuDdBqZ9?=
 =?us-ascii?Q?qhzm0iiYaWqDmes/QvZrIniAd2Pby+TBbRGNchKe9/DZCYvACpbeyFY4Ejre?=
 =?us-ascii?Q?NfL1+WE37oQ6ie7ZbzILUTGv48hbgkUcxt6QLo1mSDt7dgNgx5/ZuibMmVtA?=
 =?us-ascii?Q?B16Iv87cIM/5EL1F0LErGd2iXcOY5eplphaPcVv4lzCGo1Nxdb7IXCmDSHdu?=
 =?us-ascii?Q?GgMHEDHl3PB9rC1Mi62hAHHhUa0X7B6m/MCQtZAfQ3ToS/WpVzI/gQWPYCao?=
 =?us-ascii?Q?P5PcaBLteph7kRZqgGfxff6omm6UWxfNqdoowNVPtxtAfI/YhqsDMgLIOyC1?=
 =?us-ascii?Q?r1CSoMEmdNpCSs3h2kWXPUvvQ/UtHgfu6CVxVRdgWS2ASc88JeNsRka8GSYc?=
 =?us-ascii?Q?GrDXQg8T2vRqFYBnLFQ/QQw/Fw67cIwSwNFJhvnErjkg1ge1vAUs3ATEmbQ/?=
 =?us-ascii?Q?TUlYjMqBHhQicXqfMxJ6pWidVu25xVwU5XNZdymWJaaJyCF9iKIY6FocMjbY?=
 =?us-ascii?Q?KdM5Zf4qiLYVvokGryg2CzeClo68k7mE8cxBeQVRqbjH6O7lzSg713xR7UtU?=
 =?us-ascii?Q?EltfyCUxlU1ia5YtTte0mCLamdeBViICc/Y1FfAa/d1S365+k5fSr/bDkIiF?=
 =?us-ascii?Q?UDcAG/wRUXluWzU4GwNmCJJtGryirYEzvl7JZXle2NTMn+Q4KFygDAuzb++a?=
 =?us-ascii?Q?//C6dskILKJrEFTUY7jeXja8SjBbYu3oFo+5shZt6UeWfkP2RkH+4xQaGLmc?=
 =?us-ascii?Q?LPIvmFeF4C0arCCpkHQRtdz9sQqbiAj0FgbcNVcu4xdPQ/WgsJDx/MIRq48Q?=
 =?us-ascii?Q?7UyE6odwz3m/+TOaHEP2k+kI2IC/APo4+zKIo2b1CyMtyaGDAQOOTMzjkhK8?=
 =?us-ascii?Q?EZKfBFglOUi1jKYI/P3PZT2doXbXWDGRdNcTK2MJLxTPUdsi448rPVFXAvkx?=
 =?us-ascii?Q?4jOHLogrLg=3D=3D?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23029450-d2e8-498a-12ce-08de5a266571
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:29.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2hnnZfIBUFlH/no0/h4tBWQidKREzKz281nyStDbl1T+TnywD0uGOWrlNmFn+5o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_182341_615146_DA00E067 
X-CRM114-Status: UNSURE (   7.05  )
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

Add the SARADC (Successive Approximation Register ADC) controller
node to the Meson S4 SoC dtsi.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index b1d66054a6e87..cd768f9f4db80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -77,6 +77,20 @@ pwrc: power-controller {
 		};
 	};
 
+	saradc: adc@fe026000 {
+		compatible = "amlogic,meson-g12a-saradc",
+			     "amlogic,meson-saradc";
+		reg = <0x0 0xfe026000 0x0 0x48>;
+		#io-channel-cells = <1>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xtal>,
+			 <&clkc_periphs CLKID_SAR_ADC>,
+			 <&clkc_periphs CLKID_SARADC>,
+			 <&clkc_periphs CLKID_SARADC_SEL>;
+		clock-names = "clkin", "core", "adc_clk", "adc_sel";
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.34.1


