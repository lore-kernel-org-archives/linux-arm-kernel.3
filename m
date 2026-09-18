Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C6EC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/qNz3k/WWYHM4HwgpsZl8txOuh4grJtpZF81jSpSuQk=; b=UQH4RCA1cqsZx4w4s+WFSriD+l
	HF8nNWnVtX3HZKN6/fEnyZn40xfG/JBShOgeZzn77dAHlFa9+b6VXkOFF9zrJcSpwsGwW4KSQTjg0
	HwaG2NFUI0YFZcXx2VtQQg7jN0Fwo3flGQjrSLDOYMNiRAaDHsn2NK7UKBOnmzR/Oyj9MIq7xF6Gg
	ZmavuF4EdZejjDS0Pt0Q80SH9uzRudwTNanx63oXhDZkffltG2pegl9RI1F3CBGBd2I6xYXm4FKMe
	IvX5eEWvCQxQIR0asV1aOF5ZT3QyZN1xBye5nl+vuwDjf0SJsLldJ1s9242rEhLY7xR6/7JawT2AU
	/bzqgXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bdD-0000000F3UK-0OEB;
	Fri, 18 Sep 2026 16:40:11 +0000
Received: from mail-japaneastazolkn19011031.outbound.protection.outlook.com ([52.103.43.31] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bdA-0000000F3RQ-0CSo;
	Fri, 18 Sep 2026 16:40:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ervQvWhnHKqsTiJnC5F+zgJ3ly99hV4ojvo9KDGyAI8WWupzt4sDwjpmOnd8hSRXwVISBrQT8Sc/7cJ3vRtrD8eaJuXHjWU6AhvJ8yXEyIS1xI1fPkx5509B+f1Tbw0kIP+K5i1H3XDDcIVJnHYfQGad61bEd64dfBAN76bwYvFryAsd0a79m9N6YQw1DDybP//QCSht4kwOgFTe+PC16uv1L8BXYPOyTI73zvp1fJelsVRCKUWgXu8pAVTyIsA5/7yfaaiXKO/Zr0Qm1hkyM9MYSjiTeKSUl2OhBtRI39zKEjfiwUrjVYQx6iJDsri/PXZKWbTIbzuhEVGwUDsyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qNz3k/WWYHM4HwgpsZl8txOuh4grJtpZF81jSpSuQk=;
 b=siPzTyANjWvQibxx2GJWRvq4H5iXw3gOA4BlUTTVzRhLZKo7K5ZqDhhsk3BPJ1AXy9QMs+WXB2up77+a0X4wZTO4bSiM0AreIkztYcO0hsWQyc5Ic4nDrNVqnlV0r0EPEPVJEzs2PykCg6A/0h057SQtfYYYN8o/joHbuJiwwVkjg5KV4aC7rEMqv/yLH6IzAokS1wq1lTM+zm3kCtB1qMsC4MGfa0Q/MyCl5Eakgcc1P1TIC0sGVBSMEK/x4IlEapHDcjAihCfeCZ8KaMU9ZyiPwD8znBnj2ZSkjRVquQ4bsTJOHroHgfl3GBwJPRYIx4PBgKP0U0yuOnXWcu5ruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qNz3k/WWYHM4HwgpsZl8txOuh4grJtpZF81jSpSuQk=;
 b=Md2401vAs2YFPkQazEf8JZbuuyHcWGXbzX0obwAlF+MP08Lstqo/PKJc2PA/HSKqAQw71sDqLu/FbasCM9IoPvV2r3eEEm4x6pBw5EKcEiJ0/k5zio6gBkj/8ioow8hsrtc0d8POa0PdP6yAGLP5b+5jkEwLxXfbxF0KhyYYKaA3whdIyB71L9CEB7ci20NCgRj00YsFEUnBKaOP3OyK5d5lStDnwTNfnrKmjbguA5LCQrf7Ooxi0w9MMbfObDqbV+8/gZW+dqYA1cS4mq/3z/nGV+WwiMEH1nhdusRdv1bSFb3YFba+DTOvBzpL18Vx0KmHyTa17aE0cB7ZFRZUsg==
Received: from OSZPR01MB8140.jpnprd01.prod.outlook.com (2603:1096:604:1a5::10)
 by OS3PR01MB6965.jpnprd01.prod.outlook.com (2603:1096:604:12c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Fri, 18 Sep
 2026 16:39:27 +0000
Received: from OSZPR01MB8140.jpnprd01.prod.outlook.com
 ([fe80::91ec:49f5:d743:6d5b]) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 ([fe80::91ec:49f5:d743:6d5b%6]) with mapi id 15.21.0406.014; Fri, 18 Sep 2026
 16:39:27 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [net PATCH] net: ethernet: mediatek: only enable WED for ARM64 architecture
Date: Sat, 19 Sep 2026 00:38:30 +0800
Message-ID: <OSZPR01MB8140B889AD227E0B547F5F87BC872@OSZPR01MB8140.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10)
X-Microsoft-Original-Message-ID: <20260918163830.297803-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZPR01MB8140:EE_|OS3PR01MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 950d61ec-0455-4c92-7589-08df15a3674f
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5072599009|5062599005|15080799012|51005399006|25010399006|19110799012|8060799015|4140399003|24021099003|22091999003|24121999003|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dwbkueh3wqoiDEsDyL5+TQcn88IUhxT5bbkYNv/h3kwF7E7TJ2jmXBkeNO0f?=
 =?us-ascii?Q?BLMLyG02lAAwffyzztkDwmXCwTNTbrLC2If4LtDGPbvqFWWCRkTDg6mRlcRC?=
 =?us-ascii?Q?4FiOM530Jl8Fd9wbWrb9V7WgcR626dzYh73ganooBjFcVMs9fWEUT40anJE9?=
 =?us-ascii?Q?6kV/f4H2XDL2LTo8sC/9MbUJKEQRV2mQ/z9V3KTQjfCQHvBQznk8wFmVg3f+?=
 =?us-ascii?Q?ocJ8t00CQRChTKl++4xDYijLlIVIH4DxJKj8TDbsgSdH5sAMTtSbwVNFm80O?=
 =?us-ascii?Q?ikbcvOk1xtWXkw81gASP91UOyb8MP61p3zhvBqWRtoT1VZyouBqyxrBFRDWW?=
 =?us-ascii?Q?nl5YefBvIKe5oW7+ZTcm6lb78w5BQeyK5ZNYB7ujTHgsyA2ZtXA5nNWJdCh0?=
 =?us-ascii?Q?T4jlR+80TxHjFTHUXqyOEEfXnpYG+2mrOFmx3hvlRRLFhwCi54aUxslh3euB?=
 =?us-ascii?Q?0ZnOtIdMgmcOiUJi7PGQRL8WSMKvLpe69U3Yxwu6ghmarKuRIB38HUN5hkwe?=
 =?us-ascii?Q?e0qnpQiag1i6gJwcf9CKrT/2rJnBRmFkUaw+Thf1y3wSEwfY6zPljfxBrEiE?=
 =?us-ascii?Q?LFtFBQJckYy2aX+jkUmKZZY84dkstjlXN1vMneTCey6Lse1HuCq4+1X6xrps?=
 =?us-ascii?Q?ZimyoNdffIZSTS3I1FiUrtB6L+M78fTJ2b0ke7mcj2BeLBzV1Oc0LqPZkrst?=
 =?us-ascii?Q?BLAlxLXXVy9GnQLx7IispvU03GSYYkkMzcPTZaixOjvv1cmpW7dBJBcY8+V6?=
 =?us-ascii?Q?vD/mzGAczKL7MJUfxjYOm0mxirOIVH9a2StOF334vnmF8LR5Zkyk8hC9ngNG?=
 =?us-ascii?Q?zFFJ08rfJFcO84T+7dDZZBPk8SUX5nTQFwNzcEdDjHeASmVELLCJVn7QXJ4J?=
 =?us-ascii?Q?RpfouYiOGS9mRF2rduC9rn3VwrechluMcpupCR+DquOxxrI0KtnJF+euXKTj?=
 =?us-ascii?Q?8YYv3wOCnw3yBmBAyJEXD83rW2rh3q5Fyw2v8041LM9nQtTnaIbwp4GLCGuY?=
 =?us-ascii?Q?L+QE/7B0MaEdu0mvzz5wZBsQjgZnfurDTQ9hWrN5QTJzllAbIbD9+28bocJx?=
 =?us-ascii?Q?tdAG3WN9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sEjT1Xu4x0jMSNgEo2Maf8Xvgaz9J5WsoIZ/rSsQ97/WnPTZK3kL6CsPG03o?=
 =?us-ascii?Q?5SmTxB2stgg1yOK9gkJliAc2mdWHCckzjVsb9KmKGCNbUb97yZOaCkxwOyIQ?=
 =?us-ascii?Q?bt5+RLEmqgmIxWLCskzEtk8pjerRpfwq/JahPgaNu3FCsQrLD0hWq/aNpf6f?=
 =?us-ascii?Q?At8N0pNwc8X8JuIPos66M7zU2w895M8+HbhfHdyhy1nuhDG7U0bV101yAlNd?=
 =?us-ascii?Q?lUELN9pT9RCA6Fz1hqDXMRWKL5kzjrZybEBi6Ftfhc+HGznm1LDQrZWzprvU?=
 =?us-ascii?Q?Ea71ImUa195hzfAA0hkot9el8ZGBhHXiRmw5g8HRljZzl1zTkpbkclQ9zRR7?=
 =?us-ascii?Q?hCpg9xsQdUv7eSJShYH5UNYIIs16str3wkoT3cvczzkviwgf+z4FTWqeY5vE?=
 =?us-ascii?Q?gbhtQ1pDPnS9NWMjtXYp1p/snW2lsXo9Kav8LZkuUWLQVS5Y+ZDGCUYdwYbQ?=
 =?us-ascii?Q?6NFsD0SPIUIZfX9tbBD/WfVeqr6OUzbcN+TRJmP1xQqr6DO4StE7Ifsw4XFI?=
 =?us-ascii?Q?cVQABFXIZZt7MBmINbBLnM+SpjKolPWriZ/FYYJedJ4RkffzuqTdp52tTc0e?=
 =?us-ascii?Q?oy5qlYArNmv+mLRLsZWqQ9d+Eo50LDXq8jCJkUNLQ/P45O7MKPTMB90Abd0L?=
 =?us-ascii?Q?EnQPpbUEbQo4xeObbJQthHfKv8+zQyU273t9z57fiy2rNQlUjnhTKJ4QUNc2?=
 =?us-ascii?Q?R6uIMlzf3rO69Aj/b1wn+3wQ/ZX8753u5jpUoOZbGsIOs8rK+i+mQUz3GqZz?=
 =?us-ascii?Q?vYJA9Ytg3FZijc+yIPEkxxZHR06AfHeabasZeqfHZ6Mg2KN/zVi/xas8Fn9o?=
 =?us-ascii?Q?eHXZWZXCrdBVvG2omo2dBx/wBe5QO6m/Vl/u1y4v83kXWQMXFjB/CC0d8osQ?=
 =?us-ascii?Q?T7SzvwpgmBqiAbRp4ruSxLo2/MqFZALACqKGWgMQGb7c50D0Pr9nkZEg6MsN?=
 =?us-ascii?Q?kETbT4RArjAh1xXU0Kmn8HSjTYbqmlqqN64THbhlBgCGXMOD7TDCbvBqq/ol?=
 =?us-ascii?Q?DMvnCe/hHmFqVxFPw0qeWABv6+MLoojz+scwhLHE5bvQAhBkK1dcue3dYBc/?=
 =?us-ascii?Q?Ud2SOUT//98b7M0YFhSVr1bc6KugrTD9Jvvx5wF/fWy2y6Aox4M7nkcHtOgH?=
 =?us-ascii?Q?Qq4VZ6PSAAvE2MNJBLuwA6fgs1geOfEcBu1Kd11seqs1yAq0jtGAt/QUh00/?=
 =?us-ascii?Q?47VIbkKg8NVlxS9uTsE3VSYLgNJh/IMKHmaZ5opetzOQkC2JBg0AZgHUy7uq?=
 =?us-ascii?Q?xT4ZCYJ7sXBY6RUs8PTpulSS6c9CjTCjsOixFhPRxPeFqZpI1uCcVUKJCiLg?=
 =?us-ascii?Q?fPz8nDxhELJTkoDn+nXsyHRj7vOneCGzuxh2WuCdIvQAG5qsELrDMvfFVOuc?=
 =?us-ascii?Q?cq8nGdHGKjOeYKKcH6GjX6pR/FJQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950d61ec-0455-4c92-7589-08df15a3674f
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8140.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:39:26.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094008_103634_1C57AB9E 
X-CRM114-Status: UNSURE (   9.25  )
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

Currently, only MT7622 and MT798x SoCs support WED features. They
are all ARM64 platforms. And it is unlikely that MediaTek will
release a new net chip based on ARM32 architecture in the future.

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/net/ethernet/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 2ba361f8ce7d..7737f2f15478 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -8,7 +8,7 @@ config NET_VENDOR_MEDIATEK
 if NET_VENDOR_MEDIATEK
 
 config NET_MEDIATEK_SOC_WED
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	def_bool NET_MEDIATEK_SOC != n
 
 config NET_MEDIATEK_SOC
-- 
2.53.0


