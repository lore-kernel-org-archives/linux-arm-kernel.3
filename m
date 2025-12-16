Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A8D5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9q2wg+KDn1rSPE8Xkm4ICVuHhYr+oJS5uq1KZpxBfI=; b=YPFXdv6vxscpSFU8sJBAWMqLtW
	Hmy48oNECNlod07NZyiV0E2wyufVFKkppWyRUYtBODF8XYENhCn0Zmk5BjxrAJ848r16P1Lv1fDI2
	/Xc7yuDjfAkdnbb4TiNPnftORa/k05A1ZxNfLEG21Kf57qID3z/U6dVeOjT4PQkAh/GlEy4SAAfVL
	V4LCuw5NSjj2kT7X0RAY+k8rzXW9RrEMAwr1VrYQ4NTiPsyBHUoZdFUkVZus41R34cwqkRwgOhK3e
	FuU+mREF0E4ttFR1SjUxs0wTY1heVgt0t4fZGdj+7wyLzE0IGWFtQUeqTmLcA0PuX2NCvMxCW6/c0
	wMhyJmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPin-00000004sAg-2uxI;
	Tue, 16 Dec 2025 07:43:49 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPik-00000004sAG-2vOU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nd3pFv9rMwQ/JKXFq7APSetI+z49X412KJY/UNoX9mJWZvZV8FJpwVu/M/bSt/5kjeDB8KxdD5Ds6wvqyftVX/4yXJhJQIHf4pdPhOpmVJiG2s0ycriGjFzr7oglVXvC7F/a2BiLmItMeLuDpLm1gDuxE6CfELCPsIyyHtNnXlKw8BnILAcFtq3foPKM8pfexsBAvBU22qWKYvFvxQDZe9fn0v1DGrQT9PdbTY7VB2eaHA+dElmJQdOCMJx5NlemdR1Ou/tBU9S3mrqHejezClaSckXaXu6xvvtjR5N3GLjI11qUomeh3vMQS6CAf0XNx+Sov/GbZzAqtNSekRGw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9q2wg+KDn1rSPE8Xkm4ICVuHhYr+oJS5uq1KZpxBfI=;
 b=imY+jLYePdfMu7EMtAHWr5r98+WrX0rrksdn8APWKbKNwVRj2eElpi7ZqxCdVxtAepv/Q1DV7YzP8ll7rhmugq1XMNqUnl1w4Ia87tDheTrCY7hnSWf0tTmaRi3DEHNccTenhBKPDZW1zbHjDl91RM668IyZ0nRSjSkbUwU5l3ksSvP4EEoIqLzJT9aR0K0hJySQegtFr2nklp461OLqT6WyicKHOS6GlnzQ73g8S6+6aUTvuHbGZo7wtQRKBhVI7C2w1zd4MOKPqTtOFc7zGAVotquViWmdF/cXUky1TQ/rO1z+lSXIqysWzWZ2F3FimG4HD3BVWg1K3WreQU629Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9q2wg+KDn1rSPE8Xkm4ICVuHhYr+oJS5uq1KZpxBfI=;
 b=Qs6TGmL2sl/Hp71VGkXkjo/1L7RTqhrNfoAixquura4NM3Wrg4toCvm/NpCf22rO45otiaf6ffxkp4hfGfDiv3d12pRDYDCuUCIuQZ/OlGOsjaodSGGp8cvNWJg2hu+U0Vkjq69HzDlUEhfI+h3sTS5lb45GMWY/Fx6TOMkE9mlAC9/3+E+GKOJW5Pm0wEMf+0Lxk2U7aRLlznC9tzKMBi5fx78Tg9VKK0WK6SwAGC1Z4kYHg7t0gyLyAyySTFtdmSUSMsnPCNPZUKvF+9AG0rwryBiTuBG4elUvmczazrdK+dpNP9GLoP8xX8aI3tvBCW1zRK0A99H53rBRGujeSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU6PR04MB11135.eurprd04.prod.outlook.com (2603:10a6:10:5c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:43:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:43:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: imx_dsp_rproc: only reset carveout memory at RPROC_OFFLINE state
Date: Tue, 16 Dec 2025 15:42:16 +0800
Message-Id: <20251216074216.447193-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU6PR04MB11135:EE_
X-MS-Office365-Filtering-Correlation-Id: 171d6e59-0232-47b5-8433-08de3c76d3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pj492inUgDhkBCA14FMSKnOryexsEkZCcD/c+orHU5Kei0qXS9+p4nANZdu/?=
 =?us-ascii?Q?w+vwaoKGGgtkPI3S3Nmxb11UMOqIY4OMpPIjXjG8PgzceVAwi9OHCIchEqt0?=
 =?us-ascii?Q?M0cHyqTLKIolQOtQNfiqIhPqG/9Gx3A+3qBVGjafstiLRCs52DNb4CGNINNm?=
 =?us-ascii?Q?dT4ei4N7UiUrYCpxPXWo2YDYM2wZ6PQMcdE+Y6Zx8Srp2LVrGVpEm14nvTyi?=
 =?us-ascii?Q?1jOy+Qe6/mZyxcOXPSfljZUaPHcCyQp6NpUU9MMS08od3FlLpfNF+4aOauyI?=
 =?us-ascii?Q?CB6vlLBuGjIhNKgLx5nRfD1MJcG0cFH+0nRbuBDVsDwPJinRuh5bnnic/r+l?=
 =?us-ascii?Q?MPX2D7p6gloF4oOUGxkQYX4rr6i8C7Ml0RMTfdLeLx5Xdd4JW4YOaNooZLh5?=
 =?us-ascii?Q?tQydFc3TjRxkfRo/PrK85EzLfUHfL4vCaa6iaGySjts8Mhez8+XybMKvpF/a?=
 =?us-ascii?Q?tv6mPywYLUUJdamILrdaoenMBU2/LrnPBBNiYYblIoo3jBtmTGvpnwZvbeSz?=
 =?us-ascii?Q?TokgK1e5Ndx/A7O/jjOWBjRA3GJSYYFyCwV0xm5hBKN0O87D4vPoxjL8plQ1?=
 =?us-ascii?Q?mAKhE8hXueOukKWxQOQ6OgWaBOPOcyEGYtFOi4GS+A/Ml05CrMAZb9lrFC+e?=
 =?us-ascii?Q?+GP4WHRckr8ULZ3fMv6xvcCKKXUQyJTL5cH9jyrh5pUBe+8zrB9BjefwwMx2?=
 =?us-ascii?Q?JDRoHq5B3eB2hWWqe3TkKScvF0bIS7Yf6QLu+Pp+g5ylrgmRL5yIfeLfIETw?=
 =?us-ascii?Q?Nr62Yba5Rn/4LVUlv79Iw1oJfBJodATzQ0d1buQbEUXFCJuF46gI9TgLGA3C?=
 =?us-ascii?Q?zJCSCfNnS0QD/RgxUhpkZyOrsz+18fXeJK23aSGJ1aRsWrY+6PTgSh2b1XXg?=
 =?us-ascii?Q?RalxuV+hfp295YhLg5wbwYYcgcaGKKg/04naQVNndbe6c4kJv3yR0K5jStsN?=
 =?us-ascii?Q?aNclWllHENDI8neYPHCnmT+o/OFNSh9OgNatvL1ktIXYOC+8UuNCuYkNn6DC?=
 =?us-ascii?Q?tDzWXaL1H+BT04bvPa8GrCNn0PsMarC1+xCZFFkLj083gqXoSfrLgzhVoLy3?=
 =?us-ascii?Q?ODmAvsV/sDXv/GDkBjmnxGtbfj0WVH6CQCupPxtKIjknC51gTfTZxYhX2DsD?=
 =?us-ascii?Q?iEzkoW9N355ojV2U/RHkorpV9bWZM3xO8vMZIuwS36JD70nwTgz/EPQMAedC?=
 =?us-ascii?Q?pvyToHbNNfvpqOeBusr8iANh3pwsDdPDJhLoc34/l9t6XxdYksQtZ9K/+ETp?=
 =?us-ascii?Q?3XNiVc2t1I+TOoF+Zf2zQAmyAUoU3elCSgQu254GiQ/+SogS9PqvzykWpKnr?=
 =?us-ascii?Q?WTjlo6K+anip82THPJq70H300PSq/V/BzFg57JSM/SvsEsAMi3Stzu011BnF?=
 =?us-ascii?Q?zmOcfpLso8DjqKLik4/T30AaasddR4XTdCkSC9nPqpuTmjH4txUohkKoP8oi?=
 =?us-ascii?Q?ecf/TGjYL4A4+ZkavsqEvM1WDJoOndOsP1WqTOFF6+qYXYBBApj8Zb/vKjTj?=
 =?us-ascii?Q?VoGVENzmcuzLfTKDADursQ/J5kL/CbdqNbppEYsmNKhsMCCY2SY+ANyplw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9BAk698esu3K7m4m832Mp29naIT7+eWto9FkXT+oI80aCvR5dwyEGk2tTizn?=
 =?us-ascii?Q?lW4+klzr81ujYnUxkNBv0TQcf2tzOYJzRmrOq2fzzc5Yz3OdWi6kRO5dxf5N?=
 =?us-ascii?Q?+/GL+Ih2KCnbZ2cs/tKdVo9SM6b7PdVplFvDSi+4bxLegwFMusluZ5vC6EeO?=
 =?us-ascii?Q?/CE1iUYjdXmylipXWm7Kl3cazx7tE6uhCZvaNSg1XIh372rOsELsrFWyioQP?=
 =?us-ascii?Q?x2YRiszvD3rMwzBL/ZkAdORn6vNh4i9SrjMWpxV4wVtMXz5re3+hsFPXQBiV?=
 =?us-ascii?Q?OUJJeyKnXXs8YShIVdUn2y5E1A7CqiU3dzYtl+e4ITrWnJBg0Z2Yt9Z9mCeO?=
 =?us-ascii?Q?1nwT3Ap/OutXDKjsNv68Hu4y3nHsyvmt9LUbaUH11US+tOlq6XAX/mmBe74F?=
 =?us-ascii?Q?NPU76zOoaUaDMWWkBVNZTn5HGedm0QxZeq2LXDNafIbmdKMO3FhORR0HhhK2?=
 =?us-ascii?Q?gTYPMSL8Vwe09+aRLplRg/mKtODKVA6MLTFJRPEl5KLpCAID+yC6THe7mixe?=
 =?us-ascii?Q?WYK4J9y7WUTaezKFFzXOuxiZYe0CANTFd5o1tXMKnp9qcbwYJS22icNB+6MH?=
 =?us-ascii?Q?gbXNWx5Rn51OM2cCTqnjhh+kCve4KfEJ2ItZr+/aifTLZXVRy9bOBhj131CE?=
 =?us-ascii?Q?44fHg8dZHJ4hEUcaqqaJNu0o7GMpWLkh+0blHi9S0MmZea9lvHeS37b1e1H5?=
 =?us-ascii?Q?mQo/euLLU8Umzw4oQxwkB3SWpgY3JZzFpuRK8Gz/5IdcsI1DodWySETUUtff?=
 =?us-ascii?Q?TiCVG0Cun8gECBzPa1aNa1gkXG+wvTjkEpFLgVKENYIEHFktRNgW2LAXMIK6?=
 =?us-ascii?Q?h4/LlYjKXzfPWiVTbPm5uxmhXCn8mxjV91fdwy2YS9RFUvLMmEnD5tiBYn3C?=
 =?us-ascii?Q?V10Z4ew1Khnun96FUlUYMWKIOBV9zQCnSkmLMh4VHUzDNvxa6mnObZT/ZimQ?=
 =?us-ascii?Q?X1RxnNSBHjv3EPQXwTaqHSZ8r837TDkePi7nSB1G9KCjZzzFXA8QKzFEqGvM?=
 =?us-ascii?Q?LFtZzeF7+hSu6tQmlT0NTkQX4DR+gdRaIa8lJbeXJyld6dMnStqi/7gcjT25?=
 =?us-ascii?Q?HrM17KX6tRySV0SI7mwucPFkyapgXl0bIInCWx3NFls0oqcqFQw0syo9Aj9o?=
 =?us-ascii?Q?Uf4IC2B0T1qCMwBsFKYuo4ZwnWzNXjKCqHWL3e9L4qtGuCnsCLR2xtPCEJ9e?=
 =?us-ascii?Q?2s5JrhDzjB9Ts7JS0/y3X2Vlzi0nYzMLBx0vOPgzIPgzuNb6Nw8qsBgMnC/7?=
 =?us-ascii?Q?JKYIu9Xvni3Zw+PXN1uptXhXvIvayXDG6Rck0SRLbZSrRAuWUF9uBm9k63Ba?=
 =?us-ascii?Q?mC/+hWWbm9cpt7L33bCq19Riex/y3DWPGr2hTI0Mbp32dRThvScTDuonWrFs?=
 =?us-ascii?Q?V9hSEeookLFazG8xMfsDhhLmW9RmNh1am9VzYoTDmNDVfafl8Xd9WqPjF0KE?=
 =?us-ascii?Q?q7WVe5Bw7015+tR1ZRkvr61iWiVIaS0moWj0gGPKdL6vJkrHGh4ao8GSARtO?=
 =?us-ascii?Q?FiIXZmKmTXKdughowJpuugDt5DHwoBR6oT3/VX0+y44D3LuYRK+tvhvy/FcJ?=
 =?us-ascii?Q?0+lhP7Gv9PR8nDeg+K0iCMgKAnuQfHF4/98K+PuD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171d6e59-0232-47b5-8433-08de3c76d3a7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:43:39.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJEcLhPHQ0HTUgs9z9KZmffmby+CfHYmEeq0kp6L+/X5zaALa3XFbTOblvt1G6Hyh/UnU5EMQQndJfNuYLgzjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_234346_740452_88945C09 
X-CRM114-Status: GOOD (  12.42  )
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

Don't need to reset memory at suspend and resume stage, because some
memory is used to save the software state for resume, if it is cleared,
the resume operation can fail.

Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index d03017d6b214..ac8aa71aa56c 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	 * Clear buffers after pm rumtime for internal ocram is not
 	 * accessible if power and clock are not enabled.
 	 */
-	list_for_each_entry(carveout, &rproc->carveouts, node) {
-		if (carveout->va)
-			memset(carveout->va, 0, carveout->len);
+	if (rproc->state == RPROC_OFFLINE) {
+		list_for_each_entry(carveout, &rproc->carveouts, node) {
+			if (carveout->va)
+				memset(carveout->va, 0, carveout->len);
+		}
 	}
 
 	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-- 
2.34.1


