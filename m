Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078E7D4A5EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8m9V0xIJ/LIwxUU1rjhYjoCxe+NVfPAs7E2ZCOp2ENg=; b=sgoP4azBtNoBoKMf53xINFCLvK
	/gceswN4YVFEAWnLTz0chAfSzNHl6Pu1LIZlwc7h6r85t2VkfwWkgyZ5rj4zN4NCVwmchJqWmId+k
	oDIV180Eg3tbR0lwcT9dxgpJdqQbVqVV4zIyXi6L5nrBxkP60RITcSrqK8v2ukKeEL3/bT1TEUSau
	8MyY7JbgCyrk7rVj8WE6KN3FuHVyZUJRZvbu7OXEm/7XN77C5yXjoLfwHfl1qxH6Ye5+LXfcYtKSQ
	DguYIlafE0CokH3pI8BNHaf+poxerkSYPTW2SW02vKLQZo1P8/MSAgUWD7vLFit7GRKKIS22HFgFs
	AqNp6uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZkD-0000000DTvq-1L5K;
	Fri, 16 Jan 2026 02:39:25 +0000
Received: from mail-japanwestazon11022134.outbound.protection.outlook.com ([40.107.75.134] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZkB-0000000DTvT-1wxw;
	Fri, 16 Jan 2026 02:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDiwt7WyrepK6BH06UrlYoYf6wFzPKtQyQsfl5SJLHGfNSqAI7lH1wLHl1MEFDDqxo//JfOlO1DKln5A9M9QkhAcGyJgp+ptHGKejvItbJspLZB4bnBgHUTWe+f3E2SX9Ai78febmaJ3ax4UVJ5OiO9zdylTpNEA5/Q7wuGSHrUzRVDiPM/IPkEzSKYHdZVFpPjteloIseVF+PQslR6Eb3bF60LwrRUbrVTCinBsnhMtKcr6CrrLiXPItfD5X2vtA8WHgYxbC/KzDGD78CEyXV/ApXl9Y7fdGKTxdm1XiceD16xzN3hpyFY58UihpjivSy4Yj5Oc7rMoFb27axvJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m9V0xIJ/LIwxUU1rjhYjoCxe+NVfPAs7E2ZCOp2ENg=;
 b=x8gzB8WUfELUWHZJTQ4hJ22av2ZnLQr0QEOacc4BlocNRmcIinkOi9wp88f4UqqVMpk+idc7U2qAG8ccTXA5BSEzKigWkDicT/rPjt25QAV1McDWfEHMh06sJgu8n3iw+Dh8m2kVbslpUjrkLeihU/Yd4cJt6L1KU+XkfOvzR0Vx+SCwHu0+Suk2Bb2T/SAg9J777MeMD26rG7v7up263FWgxyiAtpsOSwBK4o2UyFtEafbJqQYxwCbWx8zb+8P8aPtPxojo4wj+qXppu7cOmB9Xb/6x+XROvN6rM+Ngwytgq5zpR5YNvpLdP1GPyzqNBZieCyVq5U3YcF2KLW3sWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by KUZPR03MB9414.apcprd03.prod.outlook.com (2603:1096:d10:46::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 02:39:16 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 02:39:16 +0000
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
Subject: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface
Date: Fri, 16 Jan 2026 10:39:00 +0800
Message-Id: <20260116023900.2036657-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|KUZPR03MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: 4508ed44-43f0-44c8-6b12-08de54a870f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?535BW0j3LuCSoJ3LozgKcgEcVzaywnEgoLxjPXfGsbOftkRKrW2Laye3kDGt?=
 =?us-ascii?Q?iW8K6kfbB0NMrU+gUEJ2S9enQvnk1qsRvXhZauYkdmAXCL/Jj/eeqbVW2FnY?=
 =?us-ascii?Q?e8wjJILTvRhLaCqQQkMIK42FNNrPiPEuk/VUNcvad6LPKhO8dnBxaCrfxu7B?=
 =?us-ascii?Q?+f7+pz440zMfdxvroKXF+8zuIDRFgMVEZpkEh8YwGEI4hfW4KhAIgZ2nmytu?=
 =?us-ascii?Q?AefODxSHzYVxDcPEnMy25XAAGOZo5KNSgJPzh6fHG4dYmXBZ+Xgvxvz8tI+6?=
 =?us-ascii?Q?1JfZp3KYO2vBBJrNRoEuRtag0dnc5Dx0ggBauxSYtzx3JxDA9xzh2B4+KI/e?=
 =?us-ascii?Q?+gm7lb65zwMa8s5mjJbmT2OK4XU+sM/UmvVQ4EtTRkBbOtkvPS4Lj/okCRZU?=
 =?us-ascii?Q?7dQTkmS+E013fZTctl0QJqSorVfvA9zG4CDRaCdTWiku33JJBC9qvMEqfK7s?=
 =?us-ascii?Q?1+m/wBTTZtP8GAWUui0EY30Uw7xBp21yRCWMXrozp0DNHG5xhdi8cm2xq7wl?=
 =?us-ascii?Q?e7ndmgWnvNkdm0cHSxWeSqUR1hb3ziNJA13/SS44JH+2hYkbjxhzeB3c7eIQ?=
 =?us-ascii?Q?Zgt07wR9R04pn0bX5HKJEP1x6wXpIo0jBEah1f831Z+isd0KeaQFPuDngWYd?=
 =?us-ascii?Q?argEb6lzx8JJDcm76fue0vP27t2/CJoeYJTk78qnJzsiZfIoEm1cTYEBmmhJ?=
 =?us-ascii?Q?KZQCFer4MLa1WqkGdPP5UP+0BOjjONVCkANCud8CFjeHXsp2yqIQ4jvHZTF/?=
 =?us-ascii?Q?QAi7gI7QEK6YstwmrLRvNDjlnVrMygdwBbfUu23xb+RjiuRMBcuDV2sOJf1k?=
 =?us-ascii?Q?nfUcNC54i36DQkksyIJZzJpT2WXWgX3XrqYgioamKGAU7iG9UHFILj6WX3Z2?=
 =?us-ascii?Q?/IZFLMi+0b6VUvFMAvReGtYGGt0SRxt6/GRXAFoOPbKhEZFadzn9sP3+nSKl?=
 =?us-ascii?Q?CwiR4m/RbKejVoqVBGnbO5+Zf6OEErPOU0aAf5CDHrBn7g+J/3wLSs69QBAm?=
 =?us-ascii?Q?cL3TiysVqm6v+M4mgrCuyxR7hoSYy+NvPlXJiyTuOMP7on3+amWd3tda3c45?=
 =?us-ascii?Q?CWipgM4scY/sOEEUBAwRtfjlnovNAV98vT+g/UZ84RRWtozAO3S+KlkKkHZd?=
 =?us-ascii?Q?pVdb9H5Ei4QAqUBP2v8vvFUezM6VkmPifdNzRpVjW9plqGTqyFoWuFBxaDaO?=
 =?us-ascii?Q?moKw6JBa6xWm5hgaKwW13UQZGRHXbQEfvyjouomAhtHrdqlGUSJsXKO0g94Q?=
 =?us-ascii?Q?Kd/qo8+34ciNU6O13dypsEUQHiviS8lMWQQWjEqhdlV41pc1Uhx3msolerOT?=
 =?us-ascii?Q?uw4nX8fbZNZ00PRV74ATjUZNzTzQS4TRf3VkuJo5WiR98xXHp0mTtC5YfyTW?=
 =?us-ascii?Q?az373s7tMJ6LlwHJFxAAhdQaljVMARUKJdU7DblY8emgMsty3MrWIj1/lZi7?=
 =?us-ascii?Q?Ear1Fnma0nSb3RjeCpL8t6Mf0jbTiKSg2iW+Kuvjc2ndfY/rzN/L/jTFZXOz?=
 =?us-ascii?Q?VzfioS6s1J+HLPljXMpboPfU4Yo0pyCgau9sse1yJYIqj8bVaTDpas1GAF1q?=
 =?us-ascii?Q?pw2g8+fKxgJdM7wdibYxoj739pacKQ4dPF3ZJpdCvzvosT29+uf7FcruaCJG?=
 =?us-ascii?Q?q46IwK8Pr9wX7dFu4ti1xpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aSQhjETmMoHivT66m8Xz6H/T7WvvqIlAyMwDUd3EhuSkbRc/LU8e3Us1oXrb?=
 =?us-ascii?Q?Eo55SGiZgjdnJ+SjpcQQXM9sfOaqmly5XmvJjnfjksALMI23fErado/INuxD?=
 =?us-ascii?Q?gnGe7484KasuYljPzhEjZCEuNnh9Fk3ZAzRNtScHeOydjdsehrYgmBSWfJCW?=
 =?us-ascii?Q?m67jdyCUV5NSbx4qVOZDUoCghUeqJQtJP/RrdW6iF9qu9kXZvIRouCKPk4MZ?=
 =?us-ascii?Q?QGYYouxDn0MwefK2S+Xcowv7fNfTnaSFfhYSF+cDtjJmsx2ReeKHnA1wphPQ?=
 =?us-ascii?Q?Bcheu9bqmmcFBJ7j+xGD2tmRC8JigrpWX4nT94rtvoZmfN/1Hp7KkgRjBhSN?=
 =?us-ascii?Q?xUSi26jOvmejFaoeyTMl1LKC5qvRe12YxkV6K4+aC6gnSfhfeVQz5Gh6TdB9?=
 =?us-ascii?Q?An2CGlCRhnGAQYchGSlBR5v6ktIkI8hlfenWjpZ56dfxx4sWXyTqff/MMHmG?=
 =?us-ascii?Q?7EkS1nhw8aza7tYHPdMO6AiTZSv7spVgR1oK4cj7E1Em1asFrfRFlu+gBwmw?=
 =?us-ascii?Q?sRjy0kv+KEOA7Cvw/JrELzmVAx61hn9ZLXS7sUzsf4aBNtekESkvL0dteoY3?=
 =?us-ascii?Q?Wuvny1qtkEZDdOoK7b77Swzb5llawQd8/GcXaiVSdfAv/6C8cgWOgK1SJi1E?=
 =?us-ascii?Q?BNVzAL/dCab+ZkW7dlkRZNSrN1pQTfzUoKHnsWa6rW49ISwz5i6MEXhYnFK9?=
 =?us-ascii?Q?lrlKxm6XhmWQICrdMnEwuP5S5pNAJmU8bFWUdXMb+uGMZGf60J80JV2PFUw0?=
 =?us-ascii?Q?JjW1qZ2moW/D37G/3oiNFtZa3vJnt898vBJmu4ZHNzfsh8fEDFSJHIzPDpeH?=
 =?us-ascii?Q?jp7mwq812HCrzSQsVQYsDMDHYXrM1lW01iSh72OqqUwlvLbI3MaB30LAH+Gf?=
 =?us-ascii?Q?FUXsfW6VlJ8akpEtgwbujkbCQkVbUvgUn8CGyXGli+AH1f+TZSU9Gx9n2oYx?=
 =?us-ascii?Q?+5KqrLyZcpQQjvsXOivq0nj1rPfc5VotN7hIV1d67/nSWYeNtdfZyw/TCh+X?=
 =?us-ascii?Q?xEVI9aG3R5fJxUC0wjDlNsSOAXOt9/g037VBGAtzPOtwHjXS5uqG+08tBjXc?=
 =?us-ascii?Q?HvBWl5QoHHW0pDiaaJOrC+AddP56wNNqPMQOpScNzqjg0E+ar0m9WZm8AdVE?=
 =?us-ascii?Q?0DTWaXb+gNZkUKYcap0lvoXzDfbSe+mJxgiqlSMiLuRicQrzBcgPKAr+AD8q?=
 =?us-ascii?Q?gNNQcg2kUXDJwEvS4Ddxx9jRDKxADzCodsihb6ML/A5yHignnqdHgEj8V3aG?=
 =?us-ascii?Q?K23GoJPgjjxIRZjIK7nVGoCkx2bPXlMIAP98jvN6pyzqhinaI5di5nXE2DtY?=
 =?us-ascii?Q?uESpnJgLv2qq6DBXzNhuUwnj/hhumYfPGKIwp4PIVUicNIALsz5i0hhNnyja?=
 =?us-ascii?Q?kvTPzaX5J2I1NVpKCV0Hwb607GvNtY4eBKFEeoEGpi9RkXe2Hg5J8EFJUOiZ?=
 =?us-ascii?Q?Sv2S5vlVCtYz4M8OhO/p5TjNZd75qNySHzyBiEjCEeEuye19TdUX1gNhk0wm?=
 =?us-ascii?Q?BajzpGf/eJe/pDwY/rQhB3x6E7rZXhIzHOqvemhA9afydKEPj2Tg/iNz47Kk?=
 =?us-ascii?Q?xt91woAGuOlcXNDd7XXTuye8+oJvLKh7wxfXpvK9ha8FjILOYw/43IJC0V0c?=
 =?us-ascii?Q?opXPxMw+PrVaXMtxQyJ1rpqbfaQbDyX2b0C26NwWR1DxLUp4HmvFXjFH20Op?=
 =?us-ascii?Q?UcaMv/aPDnegg7f/alrjxryz2qq8NPwYw3t6++O3d94qMaIf?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4508ed44-43f0-44c8-6b12-08de54a870f5
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 02:39:16.1445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTpLvEIianaoMKzfBKjUYGwxgPmQcjxEGENgncEOOjmqOVICY1C1ZlPbeNWJUcrp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_183923_508348_07E6A381 
X-CRM114-Status: UNSURE (   7.58  )
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
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 4a66c1bec965e..74ef02c713207 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -220,6 +220,35 @@ &sd {
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
+	amlogic,dram-access-quirk;
+
+	no-sd;
+	no-mmc;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
 &spicc0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1


