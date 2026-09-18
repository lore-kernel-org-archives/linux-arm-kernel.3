Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9807FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89Poy2b6FLwtPQFEiT76AGR0/IGnlkhounJx7iktvp8=; b=XzW4CUvwbNrIptx5JEnf/q6f9T
	HcQB+U8xS3ScjqvGkCFbpmE7H/qovpcg600GGl3WsNXuW7lBZ7JHpKWSzS3qJpDOdiy1jHzrRpPWd
	kNxQdpqraYbSCJRdEAHPWYMsrBPhOu9IKjDYf40em9dnp1CkgF0vkqFGbeOZ5c34lXf7Mr4j2BcyY
	1S35/u2nFWTPRFEvKlMlC1k0gbogfnprHfRALNbbx018Fq9B1wQ+j6/aZQesD0pz9a70LhNmat4aU
	P/3IJQhI6yZ4i4wJicr6lw7A1VrATTwOyAKP5BsuoM7/IsTiVI4RFycpIgqFIZVlunB0OwcIZvheX
	yAizQa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QaG-0000000DTXb-27Qm;
	Fri, 18 Sep 2026 04:52:24 +0000
Received: from mail-westus3azolkn190110003.outbound.protection.outlook.com ([2a01:111:f403:d116::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QaE-0000000DTWq-0eaI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hanFKj5imq99nwyDULfseJ2SOoHd3EQJV18MqYm0iabLbZhl5WjZbRNzXb9ouJvkeN8ag3w0gHAfT5h54ihQYSS9tc6jD6Feb/LZ7NEhQKZr45g66usV30C80bFqKD5cwUSfGtb+87LbowjFUzzlQRPetjDSm1hacIrzHWwVvvio5hib5VMiuGKqpCTDqQK0K6ghInMr1toGME9ddroYHzK+Yl+xS6gn96ou3RadimtwhH+ATurddKnSY17HLRaU5D3MIeucdhnkenQR/W/P/Lna14nnfqtUb6+SThg6UqGGxrND/uOkDom7XHWsEFwZ4tVyBBeSHQJvsWklqMB4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89Poy2b6FLwtPQFEiT76AGR0/IGnlkhounJx7iktvp8=;
 b=Af2KNTWEYQWc1E71r5VPxeTWUJI5z/acnhBD64zeiurNyHes1PtYu9CBa0uiOloa678fzchMonHTjRPohl6n1tqkWlL5vmiNvyglU+ymyb3p25XbF4jiiJpDhQL7HXMSGeHWPWagkvtLNvrP/wX3AZh6sEraZ0DcexSPtdvsi0B8RU9i4csCc1pT/G7Gtfl/tccvalzYa0HUcv3AoRFSEnFwuf8ldzRGBmSwr10zdPJ48PUXdyuAm8PTRHVgfzveEbtgezpDn6z0lrGg/A6c8YJTE9heoPnS/NaBPZusen5jxPTOtffvx8fKASLE8XmCy4dbmRJft67I1Cx9qVvM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89Poy2b6FLwtPQFEiT76AGR0/IGnlkhounJx7iktvp8=;
 b=pnuBrFo0oR3X2n8BBq4xDknhOu+y7BwZIWkYgZnSj7sv8ZPJa8wffygXmGYMYpUtJ6VJvQeiC6/EMUkAAWueCU1J6leVWl4LskPXZmqa1kaoKCFKHETHVoElMy0zcomuDOxCCvX4i+VNKQVDLyHoGoo4E31wi2ATvnY5bPmv5S9viv8OztYqxqvi5BCJQT7Byhk0N47eXVMm7maR6MJJZHSmcnxMzNGahJjnZPhpqRRW282RdHj8cj3IAzlNmb0Byn8Y87uTBdX+sAdOvncq7LAWD1cWyHM4/ZMimZNVvXLi5bfTHuYEzFcOlny4LBUuPKEwYOx3QrSzTpLBNxWSzA==
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 04:51:33 +0000
Received: from SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65]) by SJ2PR11MB8401.namprd11.prod.outlook.com
 ([fe80::ccc8:68f:2e82:ab65%5]) with mapi id 15.21.0406.014; Fri, 18 Sep 2026
 04:51:33 +0000
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
Subject: [PATCH net v2 2/3] net: stmmac: advertise integrated PCS interfaces to phylink
Date: Fri, 18 Sep 2026 14:50:55 +1000
Message-ID: <SJ2PR11MB8401D53F5519472525156BA9E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MEWP282CA0188.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d6::16) To SJ2PR11MB8401.namprd11.prod.outlook.com
 (2603:10b6:a03:539::19)
X-Microsoft-Original-Message-ID: <20260918045056.4294-3-tom.karpiniec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8401:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f12c347-b375-4c32-d94e-08df154082be
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5072599009|15080799012|16051099003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qQ9VS6NvahxCBI0fKDANANy+jOgH9gJ7FxRB7cbAMui7Ec2bi7to+DrAULJV?=
 =?us-ascii?Q?/lHvp6EbDVbN6/qaMG5mKMLPZbL0U9VpZrX2kmpdmr45CJ6FiymJyceHarJZ?=
 =?us-ascii?Q?zpxwjhRIPLgXO3ppKOWKSLlzshlqHFP9AHpY73FIwsBmu3has3IXiOpCOtf6?=
 =?us-ascii?Q?ApRqQHzcn6z0ryYyndq6mgDmuNBqzkaV+8m9Z+wL2R+NSwlsc482FDJU1DfL?=
 =?us-ascii?Q?CxFCdQZKRaJ65WSUHB2x2w0/p/cTbp8erCcW5qiVxkPl1N6FTbitQ5bsedJx?=
 =?us-ascii?Q?agsrH766604n6vwjwxt5kuGviQM5AqgwBg6ysFl5lun2cVXDP3GFAphO5fHg?=
 =?us-ascii?Q?+rYhi9kusQ6yWY2stqOnP0Cy9FNyspC713ShXVZD+6RaNm6dj90ZqVB+iWyF?=
 =?us-ascii?Q?zeEm6GHt0wiiKyXz+K30PTL+ggLWa1WLUUl0O+N3UJRtPNEVKDDMM95jHfFr?=
 =?us-ascii?Q?oRZMzoBYT3QPAs+GCMEqXWJG8gqrqkCAC49zuPlc1zBsfDUvcrHKUBrFuw79?=
 =?us-ascii?Q?V5KQCbXGUO9iu9t4wg8idbibqey0jQBvP8dwrA4+SNAPRtPrILiqOe6yo73c?=
 =?us-ascii?Q?ptwlMto5GJt0fKe64YCARooLmNz5mKVE5+v0qbLzxl2Klx40KB/VDCvVxPOy?=
 =?us-ascii?Q?MRFpc55z2urGIbCygTuXV4A51jRl5MfznHuhCMSihSiSF+7m4tDKpOCq+pe7?=
 =?us-ascii?Q?ZH7m8klC9hJzF8G0mffToSTQO6waYIXWBP1O/09iTgd6yhZqCrd2Xl0l0t7j?=
 =?us-ascii?Q?SjAhGPc8SJ43i9a1KSwdx75RiY4KiSlRPFMPb5tRpHpJhB1s9rQffTHVX5bu?=
 =?us-ascii?Q?nPXfsj7nuDNvWFuyT4iK94w0ZZxYQHwNs/FjV3ydffQ7BaTWdQblLDwBneWn?=
 =?us-ascii?Q?Its1JJ/wyueQj6TAm9LSeELaUd5XyoLsjYABO6/PHOMiMBY75/kQUUwSCP8s?=
 =?us-ascii?Q?a/9nIKo8z4b8iiQgQO0ztSbPg+1GT8omFvjtKVcxpEaxRwI5sNekrJPVu4JT?=
 =?us-ascii?Q?xuap?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJ0vJvZ3JRIdhZ0ZZ4BzTR6J/PjdN3gy43pY7nDPgt2QNmWurDXG/AAgKNPv?=
 =?us-ascii?Q?hxqDcWZaSw9urZJ3TiGMoZgFZpsuT3Oaoj6IJq0jDjpNf8zLo22b/dRNtwXx?=
 =?us-ascii?Q?MUCP1d7D56dX0mmlbttwQDhLh6+6j+FCZVGH4gGeAXp7sZP8pP5cIVrlLCVB?=
 =?us-ascii?Q?x2syDitNl4csBH88N9zlL6dO1zYslbeQAoN3NGE9C/Az6l8am/oxk+JJ+Z/z?=
 =?us-ascii?Q?eq4CFR9owqBpRWju1o6XtygyTsiIi4s9wRe0gkesLF1Lt4Xsker04scolpum?=
 =?us-ascii?Q?gZD8jEzNnYdzFDNUTGrfuHaow5ObUG7NolzbzglhggDS6ow+Z3GP7rwytW2j?=
 =?us-ascii?Q?+nPcLWtkTTpc4z8f8C9DqWkrzw82BiDggPhyyj3lIvWcUnuhOgGWFVBHJaIQ?=
 =?us-ascii?Q?oVAJNkRTmXXc+fBzmAoZVVwqN9Godf+R9RxRdK3Z4yOwQ/teEZo6+g29gSmB?=
 =?us-ascii?Q?e0CB7FP7JVmxUxDXO9QEsGyJSgVAMiMIhWpxULMIY8foYsWEp0Txm0LNNTR7?=
 =?us-ascii?Q?WuqT3LIf2MrAaw0aH2/qFaTuvNsCSv3d62BytRVwyX6EMTv5ltF0xgFvN86z?=
 =?us-ascii?Q?sMnR5Dku3PMaSL3ElnS+raeBiCB6c0/EVKWcvRUNMGDWb09pYjhw/4Hb3GjK?=
 =?us-ascii?Q?Y2wEFsQw//ZFN9+Ixe7gtKxwVg3XUOFwGsjgMNdcG5hveDBTrncF7NJ70R5V?=
 =?us-ascii?Q?J9GuODx21ly8VJ/sc+HuWhkEcQXuRNlfga0tixBKlt3XOAMCwLAcVi3sSU1+?=
 =?us-ascii?Q?KSrbCnVLdYAQBVGXuv8sj7Ne6bOxPa/utX9qQ759wBqmql2uTkpT6f2ids/4?=
 =?us-ascii?Q?1SqHDRmcKn+4eZoUBu9fh/9h9+dwLBf6bUDdkcKHyytFAAi+n4t5kOByb9Gt?=
 =?us-ascii?Q?BVOht9d5T2tgafwLQRVaZ+xr/BjzlIrObuWTcwuTijc4fR/4+zuYk8DoC+1z?=
 =?us-ascii?Q?j3eiCPOcCudhb3dimqOg+DNZlJVVHjwTqvdEj4RhLtRtZUZbdSDpdqwtoXw7?=
 =?us-ascii?Q?cvxJ+WzcGb1ZNECdw0+9koRObk2q5VmTkNBe1AWDJyhc8B7ixZlqtXsrwk7v?=
 =?us-ascii?Q?f0suk5m+3NLaR2+0zEQe7I/3i0U3DhzCCNm7zmS/7yqQhwzk4yJYEW2/nZdh?=
 =?us-ascii?Q?WdJjkm5ms60NBTlakxFNgTejLl/fAQfVdQfJyTHgztK2UehU0yxyuUmz9zGr?=
 =?us-ascii?Q?7Kqk84SejMrrb09Z0UlL+d6ncJstUUjOkcPE/yjn9Etp78GDYVJkSbH46ZbR?=
 =?us-ascii?Q?yaFKsxaP0i7k1uDYWnEi1pAdGFB0Jk9OBlf6XDCIr+t+HxZMpj8QItjjS3/c?=
 =?us-ascii?Q?95u0oLxRYRPr444cTD+RDs8Nvrf05dfkOOH4VFDTImSfcmy4/LiDUDM7LSpz?=
 =?us-ascii?Q?5XgNLKFkH4st2K7oNg/DcBfI4XwzLafDiNjsB3dw13NLhfSnFnrUUP/BWf1I?=
 =?us-ascii?Q?9a8N9jsdFOkN0XtfJZfciUFePf2q2cMk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f12c347-b375-4c32-d94e-08df154082be
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 04:51:33.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215222_199142_7935CF19 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Thomas Karpiniec <tom@wendy.sh>

stmmac_phylink_setup() adds interfaces reported by platform
get_interfaces() and non-integrated PCS instances to
config->supported_interfaces, but omits the integrated PCS.

On qcom-ethqos with 2500BASE-X selected by firmware, this leaves SGMII
out of the supported interface bitmap, causing phylink to remove the
lower-speed modes of a switching PHY such as QCA8081.

Add the integrated PCS interface bitmap to config->supported_interfaces.

Fixes: 68cff4fff61f ("net: stmmac: add BASE-X support to integrated PCS")
Cc: stable@vger.kernel.org # 7.0+
Assisted-by: LLM sparse
Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1350e92943ac..f956e0d2ec64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1414,6 +1414,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		__set_bit(priv->plat->phy_interface,
 			  config->supported_interfaces);
 
+	/* If we have an integrated PCS, add the interfaces it supports. */
+	if (priv->integrated_pcs)
+		phy_interface_or(config->supported_interfaces,
+				 config->supported_interfaces,
+				 priv->integrated_pcs->pcs.supported_interfaces);
+
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
 		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
-- 
2.54.0 (Apple Git-157)


