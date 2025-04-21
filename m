Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nLnSTS1+RYL5zAKFh6wtyrw55gewGxtJWuuTvwwSaaw=; b=g85EE1F0MbGtZBTbV0VEyHDG8w
	buvL+c3xd8Td4IR7V6MTnOm41UoO2PuNCmHZBlj9PaW41eRx4+n69AFeQJYKB6/QQMb6UDtaiqNcK
	f4jYLuLHKE7njyOu6fhcGwtOZ/NmRhDG3AkFAY3UI7HqIe+5l00bgE06YXoTfSEagzSG50QgURifE
	9UWg8nS4u9ZJHNq0fOgvwmyGZxVcaxqTcDRRjW4FEG6enp4alz2LUrxCkUY71M+fCcgaQswNGNFPL
	C1NA50i0ykEX08vU6xh/6eixWLBRyTwYpgGQLUZuax209+ILYdSL/sxbrIQnNrLkN3cW6p37duxFK
	iRhE612g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6reT-00000004On4-3HzN;
	Mon, 21 Apr 2025 13:57:37 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rcb-00000004OTR-0EX9;
	Mon, 21 Apr 2025 13:55:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYjtgYLW+HlnwKv6A0uOkyigv+5IC87JBG1PjP9KRdiEKbYbh15kosudhd5BPYRxegp3bUOWTm80bcnZ/0NtMB0iq+Q0LDL/45Hz26hSFdJzUTOSOwQuBo2QAjj4wjMS4yHjDUd4wuaf/63Z/HoaEaAwtk8BAthGVtcH2j+X9X6IN6dEEz2KaBzVkugKlCMkUcCHYM2Wg80E0KUgP8p5HaeHH0TORr7+sANWBQT3bj7zb9ogXrxlgydCD2dgUjKo5HL5Al9Ty3pU92opVx6vtP5SoNzmQoIhu8jE38VAg2Xlr2QncASnqnYX2k7TAVM6/AW1W9sX6R4HTX0PKwGMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLnSTS1+RYL5zAKFh6wtyrw55gewGxtJWuuTvwwSaaw=;
 b=iledgcIridMZXx641L79THUW+W9uMVejRMtKNqpZS5ahdcwH9297imTtvzZveQdfM7BifOM2Zd0hj4wHYNBAflzmkXgAr29bdOMPkVEqNKW5PzCAONuCexcN3RDfsXN7utf8q0kO+2DPEJL+6XiHtGDkdQjYZ/sK14qquYz6Ka2jraI2LgGfQ5V8ucpoLcjd6/vScoYdSHnNRE6GELv8JtTw5lr3AVzgBNmld618VYVjLYR3g2oX/dqUP+kLsliy2YAPDUjuAyxwSArzDYX0U+GO5YY7mP+3KKfLLO1ftOybVTpe77nclkn2gJBJJQ6XOLbMwliPur27tjTAHvFGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLnSTS1+RYL5zAKFh6wtyrw55gewGxtJWuuTvwwSaaw=;
 b=GqE+IbCDUj/Cv8tMCTWqe2hG+OxSi4oH+3We+sdv8zViRcBwsbELOu6PW3Qe2d8rhcKHI1VAoOu7MsREylWFi6v1RqsiY94K/CMX4XrzxeT4KKpnY3YRbI74G8uAhLx0/3qocJsKgj1yvOSjRkwQrpwVY03h81CjBUf8APFhj11NMd1+jZJO8DaDt8ru/8ztiap1VtiKknM0xpILsFBqixkQ3xXtki/xWeb9QHpOlLhf4GDCAQbqylRLnW4WEjae6n2MNMOCHMd2kmJk0xHvoawfwRy0tI1PowTEyFYW+roUei4+ZnI30vYsx72cWp93SWgsOqB1uN3qz74JOF9anA==
Received: from OSZPR01MB8434.jpnprd01.prod.outlook.com (2603:1096:604:183::12)
 by TY4PR01MB14781.jpnprd01.prod.outlook.com (2603:1096:405:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 13:55:27 +0000
Received: from OSZPR01MB8434.jpnprd01.prod.outlook.com
 ([fe80::7c3f:73bc:3c62:fe7]) by OSZPR01MB8434.jpnprd01.prod.outlook.com
 ([fe80::7c3f:73bc:3c62:fe7%5]) with mapi id 15.20.8655.022; Mon, 21 Apr 2025
 13:55:27 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: nbd@nbd.name,
	pkshih@realtek.com,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Shengyu Qu <wiagn233@outlook.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v3 RESEND] mt76: mt7915: wed: find rx token by physical address
Date: Mon, 21 Apr 2025 21:55:15 +0800
Message-ID: <OSZPR01MB84343FD3E9B6594643B426A098B82@OSZPR01MB8434.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To OSZPR01MB8434.jpnprd01.prod.outlook.com
 (2603:1096:604:183::12)
X-Microsoft-Original-Message-ID: <20250421135515.1120-1-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZPR01MB8434:EE_|TY4PR01MB14781:EE_
X-MS-Office365-Filtering-Correlation-Id: a69c30b8-b754-4796-a8c0-08dd80dc2b84
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQA0FA2wMw7ykrjEzak0iSdAZHaYfB6e3k1c9vd5xdgobsGMxNHQ+MbZv4IK1acXUaH1TKo2HFPQqE2YMvirSkKpSJNnyhyGvh5dwyms05O/RwMkSuTThu6irQfKc0rFOSgeTRldao/ofsp+0Drk/8ypim9t/IyWH2uSTyRbfG3wUrS/1ru+FsbQ22/IKHs00ZHEweHdk/0J5uwTPd0ByWmT6YVuDEE6gWTve7j9JAwYAmZxuumpvi7sxzqIFyeKZeXOQFyNthfC44DBMjot/ky0BhAc7pinqhz1glhNSY8tbnxWAYgmVtBuZEp1i+4vjdL0ZP8lzkTBpwGoEhNkaZ7tfTpOuC95w11Ur1vsCQQ7k2zdyVCwZMfxFkrvWYLpdCSX/uC62SmhtmMunq1MHHT5+n7U33T2fHN3E3wpeC+88swNJdqn8qqY87Ua7t5CjrCrJxDIDwMhRfh790dOIJfcxN2Z6cSBeF5OwhJe7QOQ94kUVYwPdDNBt4LabXB98rXrk7+plxpf9hNCkDvCwBMZW7l/7ieja2ELi+xMBibby69vyG545i9qnkfj8dodyf0ZRVQ89dLhuTI0C25afr8BMhP9rGQlu6DYqIN/UXswZInx48bMWhciNZ1+hPHv3imqBwHNFnPBa/NYCTGhc+EuISHP1u+d03okLGK3++6SRfSGLX7wBj7ffUKpXpkKxuI1ohIJS07JJ9E1CSMvA50xHE0zdfg0KKedWstpLb0Q91/qw4TsDBnBEALxTqC+PfviQBCwqRsEk3KHfi04GKCFgnWdIqOPh1X+VdSq2yuTiILcdEf4I8ct
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|461199028|5072599009|7092599003|15080799006|8060799006|5062599005|1602099012|4302099013|10035399004|13041999003|440099028|3412199025|26104999006|41001999003|14041999003|19111999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LN7Zn0wo4TdasPdpXtYU62/Xh268oeIlwkwA6jTZMUmk/lz0XSEb+2KEFgcY?=
 =?us-ascii?Q?ut+n4b2jJbH4FgHQzFtOngicOu4fNZ8WJFoI4jSML9ysCB8shOZQoKD2pIbY?=
 =?us-ascii?Q?Zzm20hu+ByDHjrRG2BhqNyvkP9HFTJ5OYLw3Ox6WIC2wfDUhlXJ5OYNOOBBI?=
 =?us-ascii?Q?BJVOUZmgcDjQjQflkExCtbgAALUHL6Hr/89PN9f5i1KrTaUAnVwtzQJd/Hgx?=
 =?us-ascii?Q?PvgD0IqzHKZDvpKv65C5KQgkv3W1ytyzKhoff1KXpNB1RWTUVz2Xd0H5TEIf?=
 =?us-ascii?Q?hMPYAnn52FH3djtQJJVHVyJhMI6fwny4fBHxttar6CR5u6RGkFM8h4WFuerr?=
 =?us-ascii?Q?LXo88qJIQChdW389A3csf9lNtLHV3JJrVcJwPYPdzKLsR1qBX508Bf3PFjhc?=
 =?us-ascii?Q?FAsyr8FE830eRc5CiW6HWJ8JWT49n93aJ2TkVTk4LVi/9iVu/xhrVKt80vBu?=
 =?us-ascii?Q?zIuq3Uk0PlUFGesl3j6MKFsxAZTIDVNeA0w2Xo4EStr+k4Ujm6oBvyWIH+fC?=
 =?us-ascii?Q?hOdE2oB28BbNnCUt9mnpJjJm2H6tuwnWrdvOtcnGv64O0n1w3oHGfQ977JFd?=
 =?us-ascii?Q?RXnv+LFPm4H5N5pIbpSA9UvrNvp8CPSE2gDMDxHkEcUgB9wYFOnoqGCSjIgu?=
 =?us-ascii?Q?qONZg7jeID1QzcJ15FnTFWJdFeJdAgBM35EizRi/5tnspG853YagRzF3fXqn?=
 =?us-ascii?Q?C4grJJYml1lJxHvbMFJb+rJeuRAqgubxWO5WFgQzEaoiYGuwk2HCQ4kbhnjI?=
 =?us-ascii?Q?KR/ZOU5SpnqWyE4tX+mo1q9oyNqBJ+saqdBKXz7V8+iVJbtPaGF9AqTk2co7?=
 =?us-ascii?Q?XVGn9QYL6vYld3JhCYG7JAXa39KvDP/ZYIV7U7PfvHIAm9T+AmhCIbVT83v4?=
 =?us-ascii?Q?itgIsmDvZtQx4Jw9Akmj7GaQ4kUoYq0qvKHz8ZsAOLyjx6VPKU4gaX88a3+o?=
 =?us-ascii?Q?imRhN8z++AGPgkq81mrvzjS7Z9UczEUmXXSvGPZCcF7vTo0yR8j87ni17cSW?=
 =?us-ascii?Q?ZSHxu4sBIT/HodviGAo0h2m6W0V42wBTozwMYksxQ8+enoDD203cHCe7HR6x?=
 =?us-ascii?Q?P7SmX/FIjVWp1ER2jSDKZSrtQ1X+0wE3qN6t5jfApu2PIBLqb4Gv1j0lsPjE?=
 =?us-ascii?Q?7O3LhqybnOj7FyphDUPiBMCNE4cBIfpJJxUrq7DVHbfiHyMw20DAPN7LgAfg?=
 =?us-ascii?Q?9mtIluKoJxbhP+gPt7bcxmlT7CxmHJNOe+ttyjFeHvtnj4vDcxeeLJYdMthR?=
 =?us-ascii?Q?LoLPYczb9iIbh5qCdjQNsGcTE3mbuwzMEv0yN36vBmUaYCRQ0NWOP9ydo7fU?=
 =?us-ascii?Q?97lL8uNaOMFc0AuxVoKJtfszSKBXJnNYrtrH9R1hC12TRPooS+DYiw+k3tJT?=
 =?us-ascii?Q?/rmRImrFuCscWjgUUDuGDJ8/3iMkLI9vG9A+oA69F3B04t6xABwhrio1MBhf?=
 =?us-ascii?Q?6EsOzUSzNOrdNl5Osm+Ki0rrErfNmJwv?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JThb/6j1LVwSaDp/6004FHkMioAWvy5X/JOgO76prcLZi+EjYdqW2cJCfLJQ?=
 =?us-ascii?Q?XBx7oKLARCoYny6GScbsDVOJp2HhBA/qRLaJNTgoFKL4xFD3zo0XqeN7oLGO?=
 =?us-ascii?Q?8QppoUw7SZeP/mwS1VrOZGUUSQb1HOv2wZxcWYFK3Gqek+xCgZK5bfyWPNg4?=
 =?us-ascii?Q?Q7+S7pnlQVlmGpI63dxJWSbXORx1LLH+NimTgtsF52Ka3sMh2I/dTAXKeDzg?=
 =?us-ascii?Q?D+GmMvPTBwGBTANq7zV0IifmDy75lVBMKhPqksNv/o9Y/g4q7HB7/fTMHkt+?=
 =?us-ascii?Q?qs8vXKR0wV3T65GtNWbwMPfB/mmTqliW14vlcX0Wk03O2UYpsjYeJT7xiHdg?=
 =?us-ascii?Q?tf5izue1eQnRywPfYRkXvRBmml0PNFbWBVNceFzxkMYC6JcWA1TO6tQuIjr8?=
 =?us-ascii?Q?kgCPqeR0kmZHMVzIudsI/OYpEB+giP3bUgNRexTVwVz/ZtsZ5yt3Eu9K24lq?=
 =?us-ascii?Q?iTyspHT9FH837MqYs+akOMjsGVUXwndGcl4DElepSBsID/4JYAqrz2Eaujwy?=
 =?us-ascii?Q?lyCj+sLwYCrIerEXmFCF/j/uZrmP0VcUhJbh0BxFc8RWeBUxyVqupyHmC0le?=
 =?us-ascii?Q?inFgF4cgsm/+j5kGDhwiX4+wHtSRP36sVYMfH2Vm6mKC7WXYn6KBkHjmhqiQ?=
 =?us-ascii?Q?UEXuI7mGM3+9GIH+FyVYxRWeA8TrssHbamny1aqlWmdrt08b1CyH9xnQLHLW?=
 =?us-ascii?Q?mQH3WH2P8UDX/jBvqFRCsLwxUK9Oh755Z1cULrDE8e8eWqQTZIKKD0u5GC0f?=
 =?us-ascii?Q?hgkQHOoMxV46g5qcOrdpSf6FJwehqF5ByslRwjOKuBuCgxA9hGbRJMGoFhHt?=
 =?us-ascii?Q?Ysi50wnvVMEesz+iMm+MbIUtOqOeas6EUwigNoqSHsxstlJjVVGZ3I27Gn/H?=
 =?us-ascii?Q?odXaNPonfoiQoO6PVtabaQ2GN89f6sxJaDdV2zqSBembQaGoLjM1EKFYFZDU?=
 =?us-ascii?Q?osJN12O8X/42cgVfeUWoih1/6ywliHRfoXSU5nH7EtruW0r5PataVumLTnub?=
 =?us-ascii?Q?oVNfLeUnvb9CJw89HCkqJw18sOvypkDdKi5axc7MWYjTwYzKkbAU5zTW11Ta?=
 =?us-ascii?Q?31T4l71uIY8GeOqzj3OUFl6RgrTaPaeosKrFQhKParmPGZ6eGe0ELwlBV68h?=
 =?us-ascii?Q?C9P3fj7ZO2HVJX1d5lz0tehY8EKs7EvCyEc5L/VMmVfsXyaChXNHU78Hjm1W?=
 =?us-ascii?Q?3gDccohDUbr20CQbbP5aS+WXDxESev6nYViN/ZFby0U0A8NHCGoGLmrFGAM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69c30b8-b754-4796-a8c0-08dd80dc2b84
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8434.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:55:27.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_065541_104190_0395F16E 
X-CRM114-Status: GOOD (  11.05  )
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

The token id in RxDMAD may be incorrect when it is not the last frame
due to WED HW bug. Lookup correct token id by physical address in sdp0.

Downstream patch link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/737340322ab22b138fd200e020d61ffdbe3e36a9/autobuild/autobuild_5.4_mac80211_release/mt7988_wifi7_mac80211_mlo/package/kernel/mt76/patches/0062-mtk-wifi-mt76-mt7915-wed-find-rx-token-by-physical-a.patch

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
Changes since v1:
 - Reordered code sequence to reversed Xmas tree order
 - Renamed some variables
Changes since v2:
 - Assigning true to variable "found" instead of 1
---
 drivers/net/wireless/mediatek/mt76/dma.c | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 844af16ee551..d5649c52c669 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -445,8 +445,32 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
 
 	if (mt76_queue_is_wed_rx(q)) {
 		u32 token = FIELD_GET(MT_DMA_CTL_TOKEN, buf1);
-		struct mt76_txwi_cache *t = mt76_rx_token_release(dev, token);
+		struct mt76_txwi_cache *t;
+		bool found = false;
+		u32 id;
+
+		if (*more) {
+			spin_lock_bh(&dev->rx_token_lock);
+
+			idr_for_each_entry(&dev->rx_token, t, id) {
+				if (t->dma_addr == le32_to_cpu(desc->buf0)) {
+					token = id;
+					found = true;
+
+					/* Write correct id back to DMA*/
+					u32p_replace_bits(&buf1, id,
+							  MT_DMA_CTL_TOKEN);
+					WRITE_ONCE(desc->buf1, cpu_to_le32(buf1));
+					break;
+				}
+			}
+
+			spin_unlock_bh(&dev->rx_token_lock);
+			if (!found)
+				return NULL;
+		}
 
+		t = mt76_rx_token_release(dev, token);
 		if (!t)
 			return NULL;
 
-- 
2.43.0


