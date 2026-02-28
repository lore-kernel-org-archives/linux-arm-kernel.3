Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D6FEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdErLUOTxEQjro2Vq/cQmooNSjIA1+1ClgYOVqw3TYo=; b=IJI1UtGNxJs+i+cfGzOfWDhQ86
	l9gdNF4zklRnUYAydbSHa8YxsAQFEsi2XtJFPj7NXJfsfYRTC+1iVwR4j/ioQVqymILVaUzCKD2GB
	RPpor0GmAdZ6Kraxi2c95rZB3WNxUk9HSriybcFXu+etTlkhelFLOmlXJvwcDvLbcylq/X6xbPgIk
	4bkdfLcKuLXWzvsfuNLN9BXWLW9boPjaxfeVtpozBDRx3mBd3AWVBWb4ZensqnBpK3XvqC0G+7L4x
	WsQi7CjpKsU8R0ajJSgIVSH8OiL7bio/JFKYGvLjt0IYtA29QnVOgtKk+0GDZypw14/ZsyJ8ow25F
	qL/z28dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEIF-00000009a6j-1nzb;
	Sat, 28 Feb 2026 06:59:15 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEIC-00000009a47-43GF;
	Sat, 28 Feb 2026 06:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoZN1ybdnNQ7tzvz9L9yWixy88i5FzYzIa42KMyLSW3xSRadksnkJID2WzgqAatiUmf7sLcGY7iHA0g4nhiKXW3dwvflvrxqGGprJdgxkWt5OwUOQm7CwkM9KH8uLNUnU0dRL/9TtNEA9s8uOMHzRPtgUIZYSzY3EwHwthSDZrmLjU/Va7NPiFtMk7VlnGvAPe9FDRDGuz+RmreBfhjuf164U06R7XMNPFYNAGm4GHS289CscphljPbNFXKHrA9ae+F1W+C1K1UtdcaESyEJqA6FxuFTTEZbkuHZfYvDwyH/zKegEtaJS7rE7EYxtrR49/ne/d7OW4chBeCWEeTpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdErLUOTxEQjro2Vq/cQmooNSjIA1+1ClgYOVqw3TYo=;
 b=q6gtyieYagxeH8ymce7OPfQTK7CDX5CT8qs5BnkpFpiSvtv4bC/P8Jk0px2hBDVZyNQDbfKc8ISZIWCvm9jWSMy11Eog98d+wfJYV7Mt0q0MjIMLqS0J2QFB/J1be1xlT8s96NSC9Rks9JbfHSaAdKYxd5Fgm4UuzVSmTpnyLEv9467G/yzHOpFsm4GriNsawN4z4sikB5/WCUCLCtImLduZyMkkikLIDEYy9J2jEzeMY1aN2XqsA0NDzvKpQu1Pqt7WbI8IbkmsE22JhURL25s+GnxWuBVUPh5T2nuFkY5nwzgu5RZK2GZ2RX9mzJAQ94bsHz7xEcdMe7EvqGOccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEYPR03MB6722.apcprd03.prod.outlook.com (2603:1096:101:6a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Sat, 28 Feb
 2026 06:59:05 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:59:05 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: linux-iio@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
Date: Sat, 28 Feb 2026 14:58:39 +0800
Message-Id: <20260228065840.702651-4-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228065840.702651-1-nick@khadas.com>
References: <20260228065840.702651-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:405:372::11) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEYPR03MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: ace7b6b2-a870-467f-0b45-08de7696dc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: qdz2L1UJuawFe8aG3dmKWIW5LTQRv0ohEO+WVJLL2nfW3FgLhJR08Iq85bHJRhX859kGGs2S6ShIsXpgJeD9aZ95oJM1KFC1ZrNMSRx66xJ1UghGkLA/5r/6zhVAj1zwB5jtUi4v+RqD0gsqcA9RTgZfFx9MiE3JMIPoqzf1ob4KlER2lvKPnd9MLrS1Z1GQGoBStm4zShadTniOj1QlK+2iiejDZrqhQC4ecYtCuubZkB0EqU52M/AoxeUAYl5nScg71ioPcN0P2nCxdL2pqDrCRcxCyyuSol2Yp87IqqV39tB3sd2deQIrzn+vC4coDQ27ljBY/zb4ujIGznqMskxSjV1kr5gWfJRgiQ64eNtvx0o3fEz10TRR7BFnqBU/2IMts8CeeJgtxqE8gNYsAjgKpL8tWwCTYEgSKhgsJT1HE9Ans9V34RZw8SmEjfheucLOwXEaGl2deXbLs1Lt229VlpIMnmFnxVNTCZ09k1GDLgWhCcQMv1SPMWn0nVl3mQkV5qhj4ItkUeN7bODgWcxkjhmo3/OylWniOOHpXhJ6jHakL6qI3TIo3zBKhw/QpN9JLwAfrgSxA5ad+wYA2fTmTBIl3Uawvp5lNz3sCx2O7YD9AHAh5RWRdc+BcSNp8pqFdizToy03gCHNFuStbPDEvnWP4gQpQZURm4WmQSRdrZUKEl1iVnHpgXwaiCit1KtNI11XjDZkdO5EKYuIaC7WjpplafknwEoWDDlHy/sCz0p0zs75UZWX/dDtJC1pXcfnL09j3r/lhyO3n/Rvh7GBVGUO79fpyniwSsW1swg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bgWb4M6kP9ky0xua4zjPHE8GunxRh4Ktk6Ih33NVlqRp7ldnkhQdL2jAjSe+?=
 =?us-ascii?Q?OMnL8AZ90QMjMl9kGOi5QfPGbxd305hG/MR/zBFtyGuF71ElwXYnGYBkr0dh?=
 =?us-ascii?Q?HSpFjKo2JAquMhNbmPNEnnByR3AcP3V8YG/pk7L1tr1Y4DgyBzgR4o73qXMY?=
 =?us-ascii?Q?5jJ27YuSTFsD5MGjrzt5YQhqm/u2CnebDFZLEui4pZuw2piCAbhLc2Ih8o/0?=
 =?us-ascii?Q?IFUdw+jmcoPfO1dnPNGYuEvqM866GbeueW6kL7i3bEeIdrzNhacdxVZkgHhK?=
 =?us-ascii?Q?JVjp6GUpiiHEPjF1N1ACHR41pkDlcp7jGCCiUt5Ox2Xm5ujgLFEzdnetANqY?=
 =?us-ascii?Q?GXF94G19lux9UctGeX7VS9lAswTTNnNyCVgEGkZ68pXkyCacG/nPxauCtoXl?=
 =?us-ascii?Q?PTvjlOyFI1ls+SMxDwKErTi93PPtSS4RqjP6BTEMLVZ8sC6xgv8N3BDzN0gk?=
 =?us-ascii?Q?/LW2jjnkND0ULaMoQKKDFLIoTebazMPFThxA4tZgrcXvO82++H6ZgZULrMhf?=
 =?us-ascii?Q?O+vQkmWH1VWBu48SkMJgP2UhRMpNAL3laJZZUt4RsN5MWk7F2ii7HW65lxr8?=
 =?us-ascii?Q?av6J8fC7QsBLTJi9OMoKshesnDNr/+0IRTj66cY1abeFWAkNYzSFD2hJhnbf?=
 =?us-ascii?Q?EqJF/1wnyBzW/pvSJ4Xew4kkF6u9/NMDZecsOTa82oaY+We/wuewc7ifOK2k?=
 =?us-ascii?Q?Vez0ml7Y82cdPoFqV8zKEukoO/PFZ33UNM/EnTD10kxzZFk8zntIyuLUI2RZ?=
 =?us-ascii?Q?A8vJCb78Jl481btdgMQtDCygbWxROSGw0OSJ4Z5++lR7CNw4336/e0mpuJIo?=
 =?us-ascii?Q?BIyJcRl6A5qoX3swmn1ZUsKkMhh7aautj2k0QP+3GLVtm4lOj7ve9uXAxif/?=
 =?us-ascii?Q?iN43bWyZRYu5Hogv+YNhqTz6NvV7sVBUXpPUzFaNayhMPBksTvT055GEz6IM?=
 =?us-ascii?Q?6Tr2cCJKCRhJMqSHevH8DlQ7AkgROUB6ayvEk26iLnqNaF7hlsTY4ed24Dai?=
 =?us-ascii?Q?i6v3ntsNg78qvvAsCRbCI5NBk5JKXXApAwzamxHhvnAoEO4AO5B9XYqg5sA5?=
 =?us-ascii?Q?o8J+oKGToXV9IauSUKAgMysDG+P5o0FtLCRlk3xJM8IihQMsVItDuEgo61TU?=
 =?us-ascii?Q?l7DSJGNvhWIiRkD1NX20/ZLDLUAuBFOPQrfPRpLCREyI69mmD8vLKdfibiOW?=
 =?us-ascii?Q?weKkD0Ne3f0Gu+cmAboaCRyhbBo7fyLlDNac2n9MEvzcpKgPiDH6pFQUJ6SP?=
 =?us-ascii?Q?4eQL20VJY9N+vU6Qn1EW2GLeloiZIco/eYj5nQVJEhNVX82kZ32OmKcPzT5Z?=
 =?us-ascii?Q?a1KwB6IgjXlzfzTtNB/xuDbR7p3VAqQhMqCX3FduTqLdzGsScWcC8KtuHnkk?=
 =?us-ascii?Q?flgpXsqVLKckIyM8xIpfOBuzEJWeJ5OJdp+41TP6lDQq7w5Evfvih+UzKHtd?=
 =?us-ascii?Q?NcXtHt+yxfmRFFS4eb12G1EwS+uFQwUZseuqCCxDyUwQ1o3hPPkXL1+YET6K?=
 =?us-ascii?Q?ubEp73nycS2+GWkUOM1k+PMdJghRFBUC7WIohG8A6oQuU0+DZqu1jN/4+JM8?=
 =?us-ascii?Q?LOJBmeBbPhRYtGG6r7dq/GUetN79cVKFE4FIT15ygqfbxYB3Bfe0rjBKfHzl?=
 =?us-ascii?Q?sGagr0ri8pYLy7OGMhWaZvocIdn36WilPLNkHZP/n6XCXAggJCvqQYfxIJmp?=
 =?us-ascii?Q?x2QgmjWfkOVUkVe0bkHblMqesJhYCs5StLHvDbmS+HfuArPE?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace7b6b2-a870-467f-0b45-08de7696dc9b
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:59:05.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWwPUTrkoOwyz1T9nXAwoZk1eef7HR0tsvm0B+f6WcnAm9Yg+wF2kQEvmqMvAR0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_225913_007711_1E44720A 
X-CRM114-Status: UNSURE (   6.62  )
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

Add the SARADC controller node to the Meson S4 SoC dtsi.
Uses the newly introduced S4-specific compatible string.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 4a3e9ad82d280..a1c0ef91d7cfb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -77,6 +77,20 @@ pwrc: power-controller {
 		};
 	};
 
+	saradc: adc@fe026000 {
+		compatible = "amlogic,meson-s4-saradc",
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


