Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB22C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybZ3sPWA8J+vJwvsCr60f7Mstcrqgfg/D6UA9IcigTE=; b=P1qAuNfPVhW3SzvPpYLbS7+kuf
	Mh6ZI3RMNuEmmqer5gaYzvefmplxHarairRF9oSbud9ZOicZVm1wx5hBUp4mpbQX2pvnyeiTEpEs1
	GMq7iYRGw+c/HfdEK53PgsvYWa+FTLijnbPd04XW6z/oBs2Z5KKxQWE1BHyh14sMuUJHxjI81roLR
	XgEhdQ/oHsEycLo8jZxUppoQkvUC/sZoTrap4QWW1rAY27IwRkUU0y/Y/7iNnT5w57rY6FQ3/HCmS
	9Y2uzNkrgUOJ2J4vM6V0X4AXUjUHpEkJ+ixsjm37fTjlf4OFR8xJecUDfHbsOcJSRSqg2y3TMh9Gj
	kRNuFpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QaL-0000000DTYr-2sh7;
	Fri, 18 Sep 2026 04:52:29 +0000
Received: from mail-westus3azolkn190110003.outbound.protection.outlook.com ([2a01:111:f403:d116::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QaF-0000000DTWq-1pqg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:52:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxi+J8x0fFvglxw0JmG8C8eGFZTRryt1AtOR7oxG250gp+YmxQgT+27iS4HRZp1lbxClvkFJB2hhPjdf4FvYE70IBWZLf3xKKlNHzjBaTmCPZ2uzr8glVEBw/rfCWudv9lxdfZh6uoaU9sG9vmcYDKF3+ZudC+L6Jd4AnGIbyX/f9LvoGg9G4H/yjnRqz+Z/VBTC45qj+ENUCbkSmHR5KY7jvCmTqWZSvYOOKKT58xl81w73GVi977OXli21oqWBzokrfwL+ccSMeC+32f70d4VAg4Kfz/kbF5qmV/JoXUj3FcNRe67izYnl3CsCMYHW7q+IE9GVDInZLk2sEcIAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybZ3sPWA8J+vJwvsCr60f7Mstcrqgfg/D6UA9IcigTE=;
 b=NfJ1aRhwn0ycL6bz5Kzj/hte8DcnUkG0wPB0ie0c3MeUKtvjIdaiEc2tZUFSrhCnS/PqkGoUXXPB8O/NFhr7K+Ymnf2+FkDr46hAOZV90D1rjTWY2khPOV5jv2iXLUsn7uynk6zT1pcSFkRQWdLrxcIB3Oh8+ZKso1ykme7m/nYap6g9Be+xS3X2A4VqFRPTACpbT2FlG94ZZGdp/k/TOTyua8VtZaeqv4w1ct5qsqxu6hUKg3js5nGQIVeJIaQM9HimEwNws0T15BV50lDRaraxD3qPMRYWh0si3Ps+TKB3nTeUjSVcFHCHQrHS6o4rtPedfzyTwTt8Bot916QQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybZ3sPWA8J+vJwvsCr60f7Mstcrqgfg/D6UA9IcigTE=;
 b=BxsTnD6JBmakgblzqUDa7YmuC/4q5/vMRhzvt2C45xVffx+2OYO6uPGy7GDC6qCIecUYiw2xNhdD223Lz7nv76RG+6qOIKu5H7Mj1OUqIaPw8BXOogEsRnKqCTdFnf8iqbAAvbThZYFTLDfIF7n/gdBNax5uBCXdWZozIY8emJfuIuvp3J1mxlmS6rMP00ihGJDhq6yGR8xrGzT2tJpdyHd71oUpmjAJfkP1yI4AEjdj/Jd7SXdsQJy34S0m9V8RPo0+BnQPi7ZEx1md5+qw9/nf2jrsoz8sO6M3EBSVhdOlT7fogx3m0eq3G8O1tf5xCTAfjbq41ZMrrVqW1qLfkw==
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 04:51:38 +0000
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65]) by SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65%5]) with mapi id 15.21.0406.014; Fri, 18 Sep 2026
 04:51:38 +0000
From: Thomas Karpiniec <tom.karpiniec@outlook.com>
To: netdev@vger.kernel.org
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Coia Prant <coiaprant@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] net: stmmac: qcom-ethqos: enable 2500BASE-X in integrated PCS
Date: Fri, 18 Sep 2026 14:50:56 +1000
Message-ID: <SJ2PR11MB84018DBB1F18F07D79DBC5E3E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MEWP282CA0188.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d6::16) To SJ2PR11MB8401.namprd11.prod.outlook.com
 (2603:10b6:a03:539::19)
X-Microsoft-Original-Message-ID: <20260918045056.4294-4-tom.karpiniec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8401:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cfe103-90be-40a1-5f35-08df154085ac
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5072599009|15080799012|16051099003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Az/V1coEwPoBOcj38rgEteMBUnPszltvEnUdoJZeq35GdNr31Zuu1p4CajoE?=
 =?us-ascii?Q?Pv4cCqrmAT5vpNofThs5N0EwHbV3AcQpGZB7j34huLDGnk4/HF83Sb3zwpIH?=
 =?us-ascii?Q?+miinNavKBo40DsgLd2TuZxUXT/vypSh5dCLegMTVr3IPQiZn2K3Wo8nYRiU?=
 =?us-ascii?Q?OSO/Ft7DyYBMjTIW8DRDo0AFLBSe8c4hjWwTUsQ5D1Wfwf4w2CVUhRHiFSnZ?=
 =?us-ascii?Q?4XwBeRSW+sYHPHaiH720hWdosDfO9rzi3jICgjhhRKhcon5i+/7YIirnW8TL?=
 =?us-ascii?Q?qRvXyTz8zrXB9oTwWugwY8A5NBAhse45B8ewomtKv1cGVBvjBZikF5Hj1OR5?=
 =?us-ascii?Q?+/oFL0DbcXOQVhg4AMQPutNpF61R7iQHjvjGvvJK/TYaTVAPwARBgBdZlEi9?=
 =?us-ascii?Q?CRWfCDHg4jwcX9sIUm6orPFtlTrMRt4iPOmX/0j5wQTlCIqVQvMiYQaSJvoX?=
 =?us-ascii?Q?KOiaj6UKtEsLi0GhoLd5M66zOgriS//PozR1KZiUb2VvQbQ6F4f24X+CxFeM?=
 =?us-ascii?Q?VqarItVkl1LpQ3IaPAb6tj5OLxrXQriQ3WYapdt/nC8jSNUGLvn1PgzvYH1X?=
 =?us-ascii?Q?PJsRY14W3IVV2nqEREaytbalDvFRfQalUVBhJYfLI/ayYHjlcKFNyv2TxSoF?=
 =?us-ascii?Q?Xkf/JfI+yKcEFusDv7w6Af9kdFh0rQwB5+hSzoMJwxBEBx4MoHXT3WhAyqfA?=
 =?us-ascii?Q?0TAN3FS1RMDu4b3KD8UDd0hrBoQwhZsgkj4YWRLKOOWdcjHMGz3M+BlKWDtG?=
 =?us-ascii?Q?z3CgJqQDlchr1ngg0++OyTEgXwpkLqTQnnvZ75YEhtLhzKgp/ZP3pmzWkL5T?=
 =?us-ascii?Q?vibQ6iI2bG8TxSgFRT6LsZSFdjwNwTAYGCoXfWAvy36JPqEJvAQYPXSj4EE/?=
 =?us-ascii?Q?/zbQhBjNfIsUKb3k82U7nmdEZRqE5AZJeJaT2OzM10Z5iQfX/z0LN+qsIz2U?=
 =?us-ascii?Q?TzV9M6Rz7FGbrXiYcylUWq/B+KqKo1Zg1IiAhysJDTy7G53z1GEtDcQCvjrJ?=
 =?us-ascii?Q?BGhy?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+uMYk0AfzRwAaqckG8AVyN2ifY1V92Fuz6JIX8ZQqGDtjkhErERsHR2I22gQ?=
 =?us-ascii?Q?+l68ZSCaBGMzkSbCbp9368fl1m24FZQMQNr++qYUw9o0yBKcqkaiWr8Ye/Kv?=
 =?us-ascii?Q?vp6IM56X5Ki0eivuiKEVvRY7H6UqUObDkm2BXcFsi0gUY8IWisM/Wm/tWRqJ?=
 =?us-ascii?Q?awgcpfuPKG55829iheaTqcnTdFVqHJd947G1UMPWf3hUMDEU/64X/A6zB4lg?=
 =?us-ascii?Q?w5x4p1OMs3dmtCMhZYbVdxoDA+MwF3vGYUEOeMEaRqxxShFbB4kHPbD78LnC?=
 =?us-ascii?Q?TXUUHJd2c8ZUi+fq1SSzGK/Uh+WTzKFv3PrBe1g0TMq+kIauusducG2eDh5f?=
 =?us-ascii?Q?60WZfqBmRJlWUfDdk2+3ifOPKX8WqMJRGukkw/k6zfCr9gJkksxEuTMLJ+Eq?=
 =?us-ascii?Q?Tc2de797nzyGvPva0ypVuUrZHI8rIWAGvFpHD+EszVe+165LKNOeFoLVoFCn?=
 =?us-ascii?Q?fDbc9Mu2K13a3Jn3Jbyn/OBLacWfQMH9V7eY9LxdZMQdOoTzEt3hcs3C9FC7?=
 =?us-ascii?Q?9byd5h0uiFF3qF0WOf8a+U91RkguO4Gfwx++niRQfsP8A3D131IeEpU6hD/d?=
 =?us-ascii?Q?DC9EEbOlJWMiFRoj24e6yiIaMAiZu9Q/YE26NfkUPPn8aXNaMBrraln5syGo?=
 =?us-ascii?Q?o8WJoo+TYSCuoF1rxfa2xER7bUFcLLy17Ila5RY+nvpIE6vKFovYHQrp6TZz?=
 =?us-ascii?Q?b9kNyucQ8OUnoVDPo4CiBAFDxwUJfRIadRgnrxa0CSeXOfF0ALVw+W6vSjsD?=
 =?us-ascii?Q?4GnGb8jXRV8RnTpukPJggIoiGPLsP304Vy4d5PKZqcD03MNvPfk0Y6AEJLKN?=
 =?us-ascii?Q?Q3lxGMog+SrUFNtrCzziRt1mPMXorNE67MmcMywIBiV3wga6EyBjOWZMkBB6?=
 =?us-ascii?Q?GtewphqJn8XTItRsO5FMbPHRLTn78y4yMgaL96U3XSg1+kFS8WmMxOkzxQID?=
 =?us-ascii?Q?AqmIB49VyYvVPZHuy5FZhDQ+0pj01CSV+zQbDd4pC54dusZRN+4JYm0KoIWC?=
 =?us-ascii?Q?xB8zK23EcSBvbgUbRxXEf1pedQUTr5zwKYvwdQk+Dl32ryqX983mnhNZgJvs?=
 =?us-ascii?Q?MeF9ENptEQ+4JAeGej02OolhKm/SxgLtakG9Zm+ju4icRY2jGEWfHQ04JlNU?=
 =?us-ascii?Q?xvydHu/nrSyOa70ZTbEBGy3TzQLbZ0YOC2n0zzaHuRKI0X1Py+JIDD/udGdJ?=
 =?us-ascii?Q?vMpcvV5Xj+f5dTDHC+8j5n7H16nr6Sqt98AZfUI7rpU/0+5iN6bfl2j7qo4N?=
 =?us-ascii?Q?mjlkVe6g6UJkq6aF+o6BZP559TUo3nCrCgIwOCATG31/L7Q9k8sOPCwslqMk?=
 =?us-ascii?Q?F2/l4TCtgChDLoRqlIKHN1pc3qJrVRzzS4nAWMeNidXMkEye7TNry3T2KgYh?=
 =?us-ascii?Q?ZXZMag6WKaKV3l4sq6YfFkeUo1j4oOUDFM9QF+7JUcSZvDIKSwsrmQMQQBl3?=
 =?us-ascii?Q?90tMq6Lfmv9vmH9dmbV2iJfjk6M3W33I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cfe103-90be-40a1-5f35-08df154085ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 04:51:38.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215223_477640_5DBCCEF1 
X-CRM114-Status: GOOD (  10.74  )
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

From: Thomas Karpiniec <tom@wendy.sh>

The Qualcomm ETHQOS SerDes supports SGMII, 1000BASE-X and
2500BASE-X. However, the integrated PCS only includes 2500BASE-X in its
supported interface bitmap when the platform sets
STMMAC_FLAG_SERDES_SUPPORTS_2500M.

Set the flag when the optional SerDes is present. This allows stmmac to
select and configure the integrated PCS for 2500BASE-X and, once its
interface bitmap is propagated to phylink, preserves both the
lower-speed SGMII modes and 2500BASE-T.

Fixes: 61e9be0efbe8 ("net: stmmac: qcom-ethqos: add support for 2.5G BASEX mode")
Cc: stable@vger.kernel.org # 7.0+
Assisted-by: LLM sparse
Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a..0e07225a70ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -786,6 +786,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
+		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
-- 
2.54.0 (Apple Git-157)


