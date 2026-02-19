Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB83E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFkRJEhyorroWVPya5e0lxWSZ+WD+FEgOB3YCF+C0Ek=; b=kzmuIZAol1PGPwUT801+IrxRGx
	YFTurXoaX7vgv2wwdl8tnSVbYybHPGFZSbHS+/Ii1jdy14Wyhpim/2rjyDITMZKRfKE2vWmXzdH6e
	RhKc/5Xm/XCwkZWA93XJE237k5O9+cnQrqpF8YfCUTjE1+8xaUGSIVSmIss4G2pZiW6t7zxVgSC+V
	q5F09+tiZRkhWOptjr6E+t7SqhBJSlDJJqH1UrNdwtqIqoaGnNOGDK61btEFlgTwVM2Nh5yMAZXRG
	DAlHHPd34K706c+28BEGTGwKfrCDsDanESaAMASy2RrbkBtaDxfPryAedpd2rf01qG/Ty98G7WkjX
	Z3pv79Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3Xw-0000000BMyO-0X0N;
	Thu, 19 Feb 2026 12:54:20 +0000
Received: from mail-japaneastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3Xt-0000000BMxh-1Aeg;
	Thu, 19 Feb 2026 12:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcm/stA3EHn2iurLaJ5HISHwdfj3Iyblsn+7vRR1wykG3wloAuMHb/QMR6i0Tn3zzwgyRivNU8E5OWqTZUDjHrhj6pIu140n7aVZRDeCy+hCXA0w2YJ6K1KepmYRb3gIV8W0DlvdL4XL3KcZKD6IfsBiTzxFxCo2fx1fgX4EHEYKxGblymd8x41H7cPjNoNH3vu5W1dX9RClIYv8OlsHo9jFkF0Fy7zFydAnl25o5FQtCLb6tHWJN16aVKnUymRjJdoyQBjcpUdeOYL1YYzxtbWAHMZk4vaM43jXsoM4pV8+9EF3ndPJOaROsnS3cfXgMtt7n2Mm2zWOgPUcIn3xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFkRJEhyorroWVPya5e0lxWSZ+WD+FEgOB3YCF+C0Ek=;
 b=qXIYL7zLDZg6jCTqgjKFQhfaYZIXZ8ma7f1Mpa0OZ3uBcBPy7oXJlf5JAGpt/zxK5X0MhzdlGXncp1DDghVx1NytguDkIJ93aMB3sGH/lLqfRtxhMFwZUrsv7n/NwyGIg3bXtyFbDwu6pNU9cKyNAQigggoMzP/1g/FO0QL1FhPoPxTbReoLC6lRs0tOIhn9JAS0B+waeZ/wyebVbeZ8tc6ThgYwtZZOBi2MYGVNf3HBhWQMlz+wOhgMvfT00b/61RE1o9ZMIyqyMlxzFEKUva9D1I+9wGdgGKgqLsviwD7DzWZf5SRAFKwqwffgko1iAWwuIQUMquHZBL7NIdFBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFkRJEhyorroWVPya5e0lxWSZ+WD+FEgOB3YCF+C0Ek=;
 b=JLMadmKT+OIkIkkxkHbOw6W//nQt/hbFuc6P93IT++VIh+HjqdbYTPlcFuedsZvNL8sDJm7e3WOReEfkSZWm24LCTpg/cVV15AWadxjix7ueFLeydojX3mkNjwtQvCBAVsmrKMRmoAg6niG8b8f11jnny7VpfyCiK6dwU+yr3jW/IUhI6h55KG8iQ7xDqcAPY3KGbVU5XMWvk7o/SlYxaY4REF1HjqyS06WJkumziJHoWW1sNgKECvwMHav/k6Sl0c8SrPzzmZ4nR94LFBvOoPongAVLtHg5Bri+YPTi0dke+GqnYmbcPXS2QUq0kYR7VVRJeOTjcXAFlCvhhcSrQQ==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by TYCPR01MB10890.jpnprd01.prod.outlook.com (2603:1096:400:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 12:53:54 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 12:53:54 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] phy: mediatek: allow building T-PHY driver for MT7621 MIPS SoC
Date: Thu, 19 Feb 2026 20:53:29 +0800
Message-ID: <OS7PR01MB136023DAF6E893E8110CEF777BC6BA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID: <20260219125329.3207544-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|TYCPR01MB10890:EE_
X-MS-Office365-Filtering-Correlation-Id: d66e8efa-bcd1-44b1-d192-08de6fb5ef9e
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/UenRl/0t64WZSp7t0uncMHDatk9cmecZXE8WGT3Vb6sq73meADKJ+z14qnzFsOgOCDBU84LRtZidqvwjvIz4lUttCAxK9vWmpKOgp2qR/LV3u77/5uYJPvdcS9RI9jx86hgOApZMfniUvCPmolTojrv10sHcnEaJoxur6HDL+Esiojodwiio1To/zSCtHh+UxtmPa+RO694npCV7mvuxPZalMdSp9WE9qhAV1zuYNe9Tmsgw2PgZHHNzR6OmidAc9WsftfFnSjgn8quedOaHuCZ7FUtcDfefFCz2JRmIWLI5jnZX2UjOs8yeaKbz7a2R2QmIf/fnPxGQ5YsEGuhI9U9OujiYBiDLKuUyEhxjACQZ++8ZwUzrY45ywXsjcOUfuhEr4G7YCBQoXu2FTgojiL1544ksXETijKg/MEz7aTowk8jDh0bVDSjGlkcDclgTgLytOkZeAsVHRWdJBX0ezomHKAl6eMWHRFTqEYpmeZILDa9TVli9bFJ8G3UKH9BydgJbly9NuTZxSX2y3PaG5+SZq8IxJ4YX96RapCSTHiLiSF9o1GlbMewVEovFHIalwVYZjJdhSnRpqItrqqqF+LXqTxhfex6wD0ER82ohfFEuzqEFhVC+pdFCvaLh5K1DBL0ksb4BeE78Wss4Cya6I37m7Kh1LKdwbjdCS7+lFC4Hl1FvfvN4/0jQ++mF8FFcBvV6eRZCNE2YMIcBl9yCJo4tRv049of3pYIZt0aaBek8MaJwmXKEOBwlmIdD3xFcN3meTQAd8Fk=
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|41001999006|19110799012|15080799012|5062599005|23021999003|461199028|5072599009|39105399006|3412199025|440099028|40105399003|53005399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PfeuAZZ11sgorpCoIMq7tf53PiFQHu6YBknTa8EJikmCATp7uaW3A3smXj3O?=
 =?us-ascii?Q?s9zcXDSfhPbLqX2RL+fSgu/YcTrzIlgY2NX9eOY9/JoWARNIMZzzl3FoDAi0?=
 =?us-ascii?Q?TzdBxqaOFjGXzvX8Vwp7BYZ148aY0Ybq6+bjhtaV3/kIXOl7AW8a6/nB+b/a?=
 =?us-ascii?Q?j1xMy0dEXxnIz8drJETAKKHrj1N4h/H0cDfwD3cMMArgszTPKQsMnitO8DMP?=
 =?us-ascii?Q?b37qtxE4xb0nm18HXEqA2SYj4AlS11z6pWthYq6bBmP9Hgv1kPdLkdez3dvE?=
 =?us-ascii?Q?80R2IfWMhRxmM8shSwzykloApbhiMa6weY/Nd536O+OvlQqn6rtnC+CBL+Yv?=
 =?us-ascii?Q?ryvOu+4kxWkwXvef1iLWT4rPq/BROyAbd48tqnzwv66U5HWSysK0V3w0uEWQ?=
 =?us-ascii?Q?cS6AOBXfw6YmD6jUBoWhP2ZQU9uVm/EM/Y3iUameBJtc3VMQQdfidFnEjKTa?=
 =?us-ascii?Q?g3zQWmVH9etZ4oVw5VEwr7IKnQrnQmtS8eyd4nyWeGC4/834QN8ye30cJ9Ln?=
 =?us-ascii?Q?sEOAigcT6Lo71A3Dnc7pDdo0NmftNB+wjdzGQwwSTlgbVhVfEf5HpLEdklnK?=
 =?us-ascii?Q?FJjXkoVVby43sGF63qcxqGNJrG8P8q/wINQBzQilLf7NIr0172wgXr++OTFS?=
 =?us-ascii?Q?4WoB9QmUdD/EU8jLU+qv9Fr+TVlXrqld4j0U/dhAJkC3VmA7SROEZBxmF1+1?=
 =?us-ascii?Q?tSivXUk6azJAFmlW2/VLBhIqvqC3tTDLcE3YxbYTb2/6LNCO6o1DAlUs6Kxn?=
 =?us-ascii?Q?nkOLSmqyHfUNj1KbIxln1c4x6jivAwPm0WMXS6FyxenjBmqn0kXQyRf4q0Zi?=
 =?us-ascii?Q?SUMd1uUsWlZjYhhbvzf61sH3VPHMVr4JQg9m3et2ouRKt7wqEGJlO3UIi6CB?=
 =?us-ascii?Q?nX2LzX1tGamM3VWKCKQr7rowhMPbfAp0i7E5frDPpbFI/Fj8YwdJqohcVDdI?=
 =?us-ascii?Q?TNMVfXzST+d+OiUpwIKOyZlSPtwr1uBSmYOIRVzizHpfgFSNiu1GIL19EKbH?=
 =?us-ascii?Q?zGXYRSRgoNwG9bogHcN6lCgITSS7W9A9ChcE/sJHMLsx2Bt8rtsu9RkKmhve?=
 =?us-ascii?Q?uB1HY3FjrgfU3rr1bb+Q/ELKVYISoSsHQiVOTjxWaFeooXV95UdAZ8rylCRE?=
 =?us-ascii?Q?FYucyqbfVXs71587MQcJTI8OCE54CBOHv8DBoCKfAj1AHg84iek32FJoLxUW?=
 =?us-ascii?Q?JTzds4nIz+vKPhzwfTFrRXUq3jqvWbCnjIlD8/99boZTG8YaxE0nR65lAdnI?=
 =?us-ascii?Q?x2qptXdKVI0+QagTsEeQ7nHRgjRXcJgcIbMBcvFS5QSB0c+Odr/1XyRuCluC?=
 =?us-ascii?Q?zZI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06oVOSXMgWxUnWuD0W1r86haHjSzkA+o0r3kSPiG8aqBflcEG+QRQkmExMw8?=
 =?us-ascii?Q?WKk+uImewp5skXgDV0dR/841c3hyhDQMPxrjpKT260BascboIFt6+Y+K3kkn?=
 =?us-ascii?Q?SBg84vaoAQLTDWDmpjmfShBT8eW+RKKhOM+wSgmg30dnVRjMPaUqgcOpKwpv?=
 =?us-ascii?Q?Lbkb6ipveB5un7VWwKA85PB9n1sEEHtKup+gDj//MijKl08KJ2Y2lKUrfDJT?=
 =?us-ascii?Q?tCeD5qbP3jklLhLcMfqhMPRo5+BgYK1P8hxhCFc4SZ/JTPieRFYS5p/mus42?=
 =?us-ascii?Q?+XyNx4FofwxcpLBcBtifThYCU5P1iFfaE74xNh0DYUUu+H1T4LIq1A3CFCjH?=
 =?us-ascii?Q?2+0YL9I50eRO913ow3CPJcTIokCYNvFEBT/0boODtAgWmlucT4OKQCHk+gze?=
 =?us-ascii?Q?CyhQJj1FUhkhXCj/fzxC4k2R3zK/bV8KkGvHSm5wasaxZg81XKWQzTqgB+Sx?=
 =?us-ascii?Q?OPGW/hilUH16SkJd7REEH13aEddi0p+BxQmwhOxmIaftyDAHQ8DBcVdmzTS5?=
 =?us-ascii?Q?puhyf32HLqyB3zOvXtwiSNX86e4OJ+UT2/YLpyEF6s0uQztpxE2mB1xt6l7x?=
 =?us-ascii?Q?Gko1TyL00D/mIIZcQfpMg5zv4hlNevb9q34nl5jL2p+0dLu9aMQ7g1WLhhbh?=
 =?us-ascii?Q?20Fi3KIGouey4JP7K61sgTOZVkUeDNT1DFgi5CW7URisKHJpwLT/txjWQZQM?=
 =?us-ascii?Q?vFUlRDfe2MFTyyuKN+HnIfC+P7MUn4/LOYoJ99RJsKM9S7g8OvNYV34SWLXp?=
 =?us-ascii?Q?Gha9dmVq99u0HzcLJYa+rRXGxgxZAMmI4hnXR93qDW2cI1zAcg9xVWom08+t?=
 =?us-ascii?Q?2KNDGBci9O9NcWooS4C/FjioYMPtNQ6PU1ib9MJ0wwI5FgWCS4hzlNw1airn?=
 =?us-ascii?Q?w1ru3hy2qDvLJWbZhk2D8CB8R01hp1LHFRDBd2JkUWsEG4S8XbLDC9XIh6Mo?=
 =?us-ascii?Q?sibLpG/oP2W7BITW8L7cd7vFZSWWeg6L/cD5UTkupuwZa1pAf8GfcefB+UB2?=
 =?us-ascii?Q?7FcUg+fLTtWi+2JuY2EHnthikYwEkyMJgwS8oSV3dHoQpH2zUJrqbEXhXXOa?=
 =?us-ascii?Q?qR7xzfJ+6Hm9+EJmZlg1jx6NAfqoMmTbZLHsmd4PtwmQAbZC+RWRts79shF1?=
 =?us-ascii?Q?B3H8476FxJFHqpgH8HfbAQblQYlixMASFYky4woTvlOMBcW5uoADJYGiMOwP?=
 =?us-ascii?Q?/yrmLT1PkR4irw7EzovC/MUZB1kMmEHnr0p8XmkdNBlceHGv/x6niWKx+sya?=
 =?us-ascii?Q?+A143KQi/j4B/plNhz5L8WPmvlPpZEV78kVOIeSXldd+oJ3N5u34N9xkjK7Z?=
 =?us-ascii?Q?vz+DsE65yQCVveuTG7hMIZjTmrdDf0s9GXGVTkRUdFyCUs1u/e4HhR6I/Lmw?=
 =?us-ascii?Q?8MkUMZO4ULzGnciJfPJl1UQhFuFJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66e8efa-bcd1-44b1-d192-08de6fb5ef9e
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 12:53:53.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_045417_330820_203586D8 
X-CRM114-Status: UNSURE (   8.69  )
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

MT7621 also has compatible T-PHY which attached to the XHCI interface.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/phy/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index ba6461350..fa69df3f1 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -26,7 +26,7 @@ config PHY_MTK_XFI_TPHY
 
 config PHY_MTK_TPHY
 	tristate "MediaTek T-PHY Driver"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || SOC_MT7621 || COMPILE_TEST
 	depends on OF && OF_ADDRESS
 	depends on HAS_IOMEM
 	select GENERIC_PHY
-- 
2.51.0


