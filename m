Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C948D6CFB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMC79HnKTa2bKPiaBW6uL7GA8V01Qz2H7WB2Wa8PYlg=; b=gy2eb9P2NDbm9c3th/PbT0NfVd
	iHOTmAwzQgZy4gEtr8Q+a6GAf3cEL79tJDodCXXKinc0HIMyAziJyDgQNpER7zSEPsupfwlrMAWCL
	MCPWo7yNWo3YkvcSI8igVdQyxGYej+hb48MXcsjR+q0B4JfTVClaB4fYsHZze+pxA9y7/8Ri8ir2u
	pwaOGa18XRD2PdRL8o/+xgkgs0Sj//RXRvEx77cebyyfFPkk1QfbQt8Tzefws4ey97i6AM/sk69Jy
	Gsowdb5KwIAlNN8ctlA9IVR2xVkICreHlsjGChLGZZyzAeWZW8fj53OeTlom0zh3tHE+0YAWfUV6s
	t/FGwxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6q0-000000081p1-0K2R;
	Fri, 23 Jan 2026 02:23:52 +0000
Received: from mail-japanwestazon11022078.outbound.protection.outlook.com ([40.107.75.78] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6pr-000000081jC-1han;
	Fri, 23 Jan 2026 02:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFmqag5Ya7j/UZStX45XpLnEpzozrqHPlRno6MmV6joZwmlR6GnBM2+JR8OjqqGHFPOh5DPe4ltFN3sTKIkY3nKTZUzcAWdslQHGLsjGn1mpH65N23taygUfny28SKcWdnWmoYv+VBH4x8jjPHAvtNsbOADHm2J+9xjZmltzt495xBxvkLTRDmgrzSMapJQ6lEkIo4qgJe+dOYjye6J/ps94ez2nyEq99HbMSd4pAhlnyZI5CKMMoD3RBCipmFI0E2Qq0oeSaIpDNVFm67C8yG8iqRcRpdFl6dApb+Wwm421nW5+kRD64zG7yMIMuL4NKBPoaZ7SZ169XrDFPkwjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMC79HnKTa2bKPiaBW6uL7GA8V01Qz2H7WB2Wa8PYlg=;
 b=YjeQHjz/gO3BZ4jNpJ3hcorySsdNccsK+pwKd53d2bas8fyJ+onykZUomLfaAZtHllMja29M3QlwlZ5OdNXq7tnSBGDuXIYNFX63ZMXQ0CCjFBGDdNpwjz9rd84vIgyFRChA3uVBhFDappCn9b8ZJZcQTHsL96J8q0lBmOk20ErqSL5069/5ha/Q0P22872PPzOoYl636yhY888faW0+ryaa5SrWVCFNJvM0vol5zErzJ57JvWKgdu4SrEhXGTnd1pGjDl8KqH4BjRkZ4OzGpXGt0SBhJdzc4euZoxOUnbuvmlEIE60dI6vHzfKp57TVRC7B6PimZd4jeldEYlg/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SI2PR03MB6590.apcprd03.prod.outlook.com (2603:1096:4:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:32 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:32 +0000
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
Subject: [PATCH 6/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
Date: Fri, 23 Jan 2026 10:22:58 +0800
Message-Id: <20260123022258.136448-7-nick@khadas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0efe9aad-f4f2-4a73-7421-08de5a26672f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4gh5HweInkTHxQb4mU1tndtMjCf2UwU8Pm0S3O4pCN8ChdiUFJWaVCX4WK1J?=
 =?us-ascii?Q?gN61AiVopbdDfIQYziEqX8gmDi18+1CdmbvLexRa3bvWAJCTgJCQbShxDQzo?=
 =?us-ascii?Q?7gbyTtfj3JDVdaLhDkCIOWUV6hOapF7TCHVI91OM2zc5siU0pZrz3LD9Mrr1?=
 =?us-ascii?Q?BwN6tsL9EWuSQwfqgjU485I54r3D3bkAwTHxNPTGiiI4MqwTUBHPTB0inqvh?=
 =?us-ascii?Q?OvTT5VJWU7VSbE1u9XcWZjk5OjUmT4f8YdKbDIIag4w9LVupL1zsBuk6mlX5?=
 =?us-ascii?Q?YAJFiTryY1WmQxvn8Cjwp6NZeVU3w9hpfeutoF+8buiX8D7EQ8Wm1PMMZccK?=
 =?us-ascii?Q?PG3PhPsTToaohNDlbj3kIinhs8XZSD0RrxfsLPitnxZt5EF0nmOpyD3/8P8y?=
 =?us-ascii?Q?D+DX22Lj73j8KmRKdKSSzOQ32w9tKH6NHcqBmwRvenm/zsUR/fc7+ykTAwNP?=
 =?us-ascii?Q?FRzgclYSUMoSlk0qC+8EEwucFUFTklwjYL6qn9Dta4ymOq4lXwV9qmxQPQL7?=
 =?us-ascii?Q?mkwh9T3Lh/R6vbFC1CxBJlourmY7tcXidw4MI2lAo9anpn257ZZe0gzTv2lA?=
 =?us-ascii?Q?XgY1816UZqNI+j/+blpUeWTiNHW+5B1XDtAIgxbg6CQMLY27Ci928ZudGwHu?=
 =?us-ascii?Q?5xDRT1jFqT1f4rOleddxUTAnebu9EWlzLmE3pH/EHM2urOEgR4e2yb0lnc47?=
 =?us-ascii?Q?ERrHsIKx5st309B0TxfbSps7wvO0+fq3aBJaWs+wfd4wPXUnpVcMwxJBXGb9?=
 =?us-ascii?Q?pmkd+lkb63lwcvUzHB8hvnP7YKk0QreFpbFpxJDB89bCxMCy22SVP/p44L1f?=
 =?us-ascii?Q?BjRF5Vb626BhxIiyV7uW2VeEAnlCFmrDXLKTr84a58skGLJyl0M64NgPBIDo?=
 =?us-ascii?Q?GF9xsw6eevJfbssL0W772wtXWeii1yq5vT/Xrwej3wInSB/HyzAAsGItl2w8?=
 =?us-ascii?Q?n7f3+jbwt1VRAfox+/RRLNOTGH+vN0K6RB/mEbV1eHJItxWRtAC/75045RRC?=
 =?us-ascii?Q?uL87u7Ai3CAXM2mvHALXbUg+xvIyyXzf1U1UdoKkyKpM0WHCjT5yZcgm00bt?=
 =?us-ascii?Q?H0XMo1Fv6qLZanlkqfigucrDOG8CyN9pFnwru09cJuSANmyQQFW05Rgi7Psd?=
 =?us-ascii?Q?IE5iWB7X2o9Kxh4NoAzWw8uUXG7mp3hQOw2c1MbYhBGML3WR0hjTPO83XHv2?=
 =?us-ascii?Q?9hXHaxHMpe+ZDua13z+mm6puW67473WoaiDjIaZr2wLYR421rHDicyhkomtz?=
 =?us-ascii?Q?iwJFDER+8Zae8HssTP+QG/UEEc7zUcgTfFkEM8SduOt8/pxJqMvkYGeTJHcD?=
 =?us-ascii?Q?RuEQDUQAkq/fxrNiL5qcmgj2j/oEivh7BHSmEJqWRKagTtgbuiweHCbxvy05?=
 =?us-ascii?Q?5p/pcn72V601pLWHfF8UkN0ZbW0DCy1XKGE0gNauEA3VkXJaezhpVqCRuVMg?=
 =?us-ascii?Q?Y4WYcjdLDzbuLfb4aZ257KtNznnRyqvVz3WHY9nNr8HMMMApZt/I7AMARY3c?=
 =?us-ascii?Q?QdMzXnwre58x4VNJh7B+qzIXEtUo+E5ClJ/EbB/1WKjzWiZRc6cD2m83K6c4?=
 =?us-ascii?Q?JPmodv+P9SHVXKEkO+XOsE/+6bexWfDIOhU6XevM1IqjJRvwEo57DiLuq5yC?=
 =?us-ascii?Q?RagwldzRSxYbSiAhtyeTPEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhNOjKWbCZR1F552ETDTHmnOsCErFtnQK52weE4Na4haN+UsogEoTskbonre?=
 =?us-ascii?Q?/9BoqEp6ywpy6PC6dF+9M0dj75piJgMMEcK9csQekBd8FEPMrVBRB1cfZWVI?=
 =?us-ascii?Q?ZO8PEO/4jFMtdw/V+VyUUGYxhRQ/Wgy9vegIF+6CqZCqHhupr2pTPSk9gMMB?=
 =?us-ascii?Q?4aYKCqGbmvAei7+Qv/uZJbUgPeZrTAvK5aTqCYgrKFXpfqW7TvCRYzwHdNr0?=
 =?us-ascii?Q?tIvTaEKjPvU5rlGZ8XTwPVO6Y3TyastvajFfHq8zH79yJU803gOt7qcVDx4X?=
 =?us-ascii?Q?HBADhE1bKYooYXOuQ06ohnQg9y/zq9VWRP6ma9itJO17m0s1yw2uVM+8JdXA?=
 =?us-ascii?Q?d+rcjvFuE7M0RweIeKk4Qs18W1qHWRzivx3hiEkYAEknubRyQbxCK4JjkXvb?=
 =?us-ascii?Q?1xC40pYa/bjsNWO8s4PEl4hhFGNMyG4TTBiwbQUsMRG1ChSqhU1rI5dJLO6V?=
 =?us-ascii?Q?PwSAwxfVtTPcBW9cGfJOGX2xJvYeCerPST7r/xqrCdD08aPq5mvBAO7wCdtb?=
 =?us-ascii?Q?NGqVgSQMZPD9sw/bigvNLIZRGx3sKAxbbFNsKTw6MS+XUmCkBtiolJm2WXyU?=
 =?us-ascii?Q?TAu++XzALNKFP1yFU2rF/AtJRzCgLSrrW9yq7+M+tbMp9saRtA0I+HqpmqZS?=
 =?us-ascii?Q?1GdmKPDW5/11vLNa8NkjTXeU9FPc4X0lxV4DfweLRHrvCZL4fWsQ+ZVUfqEN?=
 =?us-ascii?Q?hQxTpJ4//iSyPYSy7GayqDwlnTfiaZb6MGSeraN6CY3qoAxrLa/mbuKfq0dl?=
 =?us-ascii?Q?PKSGD3OoTR/rgHc+YnBgqGzXkmkndtKZeHzdirgZoiVVqd0Gi3RIZqNNsjvF?=
 =?us-ascii?Q?5M8YlpgLozRX1qUXjV4YkvY+GB+yLhYR8WmDjSdRLI8GKiyW10WRIkmUMndt?=
 =?us-ascii?Q?CVU+5ttF79VOVFXC995PFxgKGjdf75OSiUlMYucTsGygV7BeTZRMb5ssakiO?=
 =?us-ascii?Q?ExYYGG81xIhpxpU8S9M7AZtwII09lAKNmqoh3ndr3GJThDvD6gEi1lIZ5YaG?=
 =?us-ascii?Q?e/4FHurP4T/36CLzB8IXlpBn4/0epnBpgGtpBUIp2cypKsKHaCy5fzuKgPaI?=
 =?us-ascii?Q?DYqhTl6ZzX2z3hK3u9l+ENElabXu74HYhO1o6sDSoD5xTMJDVRTgi+ow/7RH?=
 =?us-ascii?Q?vvkUJayBrr9P6gHrX8tdRs/ecl8hlMJPKnoizNKS2HGOWmqNsrYrMMZvb8F/?=
 =?us-ascii?Q?d11KAiVcbD66DWFkvS1G5c90+WY5gSiBdtn18R4mzUxdyW9lLbwlskoWMih6?=
 =?us-ascii?Q?2ybZ9RWKfQmNm3K/SEOTVLCYir80qlO+1BRQQcb7nboDnK/nOKFXpGNNx/ea?=
 =?us-ascii?Q?uI0g0LQ+8Pb20R5wauoZY5632OFlWfpg8OBhT+d3FOwN+u76VgfiB0/s/2Zd?=
 =?us-ascii?Q?mwpt5/n4hP5K6gVIizt1Mu+JfApcn9+sCkdE0N4frKSxCLt91tadzfOVAX3D?=
 =?us-ascii?Q?WVJs3ofQi/gIIZoCWjeMtzs8LC+0QycDBFfaKNfs9IcCkuieGJXoKCqlyJDP?=
 =?us-ascii?Q?jhSWlnaFvuo8sm7ae+26YgDP23m0a8+6S/e4oWsjSlRSRCmeFF717fQBMxlU?=
 =?us-ascii?Q?k6ZBjlGi0n5SYST5I6RTzF8YIOrjB8yBF8mAXj2cT7kKhCUE2RYtmcpi/k5R?=
 =?us-ascii?Q?zMSZbTtsFd4YlKQSDo2SbrLeG+zd80Am1E8xXQGqXSAJa0fjKfzjydaeHa7H?=
 =?us-ascii?Q?5w2fyV2zoAVUZKr1od3GcmT2QNTM7dSvtghpuzxWKRY3JkIdSnu/Ys6VdGeN?=
 =?us-ascii?Q?JZMu9v4bpA=3D=3D?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efe9aad-f4f2-4a73-7421-08de5a26672f
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:32.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GF2DoF1mrBhReOhHXm7v4W0gQnXO3UdotAQlI9XRKqTRTRgQGIk6RurBpsPmC4GE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_182343_444237_4268223D 
X-CRM114-Status: UNSURE (   8.41  )
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

Enable the SARADC controller and add the adc-keys node to support
the Function key found on the Khadas VIM1S board.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index cf65c079e675a..2fa2ed941cb98 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -40,6 +40,20 @@ secmon_reserved: secmon@5000000 {
 		};
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+		poll-interval = <100>;
+
+		button-function {
+			label = "Function";
+			linux,code = <KEY_FN>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
@@ -278,6 +292,11 @@ brcmf: wifi@1 {
 	};
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
 &spicc0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1


