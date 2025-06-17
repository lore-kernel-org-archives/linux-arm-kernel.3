Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C64AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jR3TVxMTeNnhDPkkC9axyS8JDcxIv9wCok0CsNdO8gk=; b=2THg9aBY60SPyYMaIELGZamEpd
	K5yn6TfiNPTGJi3YcD+JZQCjk/HMQ+bhw/1mmIQebYhUeMmOEkmGRyetJC0KMrtQkdi3bznIZac5C
	+nxJhKsk4YFY8G3svxRPGobLpaeIyQ6Jfa4R0R1X0eog8F3qakqACdQZO2b4K9A30H0phit0T2lpj
	3H6QOadHQiFLMoiMrgs+MIv12ltyQje2dSkmBegh1pubBCe4VV4MhPx/YF1T6lq8roN+5VvvoQcrk
	koP6xgegVpZLAenbkR6pYo/AyEHgXgTkZRFCe1pfTsTFvavJ1ppzhcuLeFCB1D514UmstmwUrDdrN
	Hc6Lz8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK05-00000005sCW-186W;
	Tue, 17 Jun 2025 00:16:29 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJqn-00000005rW7-0VFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYtJNszG1cnj1Ra1dluiwEigHIMKFenWITQFbRLnh3sF3AZAKSHHnRt3V8bV05uKbaD53i5dhso9I9GKvrn9d0qY69WmYPvke8qwuleul5+gQ2DPKes7Du5zdctZVawis+aYpUGQ6DVaUAxauoGx9dQODBezvUaLI53VhS5wXZNwpGzxJShFZvJ2uFa7/M0uCOhKEF8bazvBgmyKjsjKOTQHrm2rM2er9v0HLoUF3+mBSzjvq/QSk+qTLvj4LzV5deCZKiVzoj6/HJlWdjYzMb6j5L3UpBL0DnnxC8ZTDb3AU4xP0xsCq0SyklPRieKKk8Ci++3g6r0tYku69lxaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR3TVxMTeNnhDPkkC9axyS8JDcxIv9wCok0CsNdO8gk=;
 b=S9N2yPOskk67eHBi1gC0/zGTXOZujIzgCs1PEqCIRoQ9Olk+ZqGAHPsQzRs5vOISx2kiIGWoWmj0MX85obomR/jDj7V6EjQWRf+nOWiYrZ4GNsV7TdURXrEG0UyUrBgBwUFptooRrv37rONgehRupn3eEp2Be/Wf2wgdYwB8gM9ydPfUidyOEXWv1/w1XnwxeYGG8BHEWNm5d8st1BUrCF/Eh6+j6zFanzQ2kR3+UzDXwnHkTtnGjtz3oCvXIvixeXYfP/b3VjIDmvYKG25dVrUn5FOEgcQBjjFDmAqAxyCfzmYGp9rNKHU1CX06+nr5qVprMPVohDT6GG40HemCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR3TVxMTeNnhDPkkC9axyS8JDcxIv9wCok0CsNdO8gk=;
 b=eyYzw8TFOCpx0EHw92kCPNIbvp0lSv3EaAbb6aIIhXc7xJxwLrraMFhR0JZjnAm1DQ1IBHnlQGmFNtG3jwAPa4bOkgwyVJEl5vLv9f4IJw5JypZfCy+OeybJDQXemcIjvNJKJH/zGdYfVru52Q7K2/6TbEHlIVARm0Vt0XFvMDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:06:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:06:51 +0000
Message-ID: <87plf3nsdh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: omap1: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:06:51 +0000
X-ClientProxiedBy: TY4PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 978b8e1d-9df1-485c-e395-08ddad32dc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ecwvalVBgLdP7B1Nt8iekM2ONEKiujo/SfCWpE0b/OvJyI5+xOPOqYnVuRX?=
 =?us-ascii?Q?fw0aL44Bz/3UQgC+h+LR1nbXI61bG0XiM9YexLVgO4dGUVt4+aI2BYqAGrq8?=
 =?us-ascii?Q?bbNaTKq4Yc2OGXSaZgvzH5r1RwMHENA+QKsSyGTDljq+3Zw7D4HXA3J0765k?=
 =?us-ascii?Q?schftP6pqYk7Zt0f1XJqRBzC0GVkWwZ0G/J6try6JDVKYwKufEoMD3vVdlPj?=
 =?us-ascii?Q?QjgPk9mL0ls4cPWLG6HNcWHplj9wDQDExcVYPdYRMhXQU2IOZdDmwIzip70D?=
 =?us-ascii?Q?mjWEd03JYLno1jj4dit3s2k/x/VMY13UYG8vVpwWf2ujRlwwSevKE4xe2Tkw?=
 =?us-ascii?Q?5+ZFpwZbwRhl8/KlZSaRPkw0mmQ0WItDOm3g01ocx4XvFJLIgNqUgYTILvhW?=
 =?us-ascii?Q?+RJDC9bM3FefJ37X3XC2T+OOaQRCaAdGdsl95mHXCpjUVzPmTKagMf83+5Vh?=
 =?us-ascii?Q?Sii6VRL5V8KD5gQJabbjKY9zS9jnuWr9fgiZNenh6ieBcZ/y4n2HMDNqyI6i?=
 =?us-ascii?Q?xnhBM7Ggi2x1zoHj4YFfIaBYWUEGEiRZf/drHM/wwPwQULT4ARNoqqCg8fYX?=
 =?us-ascii?Q?euOsybEk2YWBIywaPykf5Dg1n+VjNt/03/hvxlrywhv8xJLCfc9WbFzV7vEd?=
 =?us-ascii?Q?c7N5ACUQgGjI/9E8bvrZlcg/CIwk2WHpAj2+lqvx9QSTEIFNJU1uKsB+ildq?=
 =?us-ascii?Q?tACasvGg22nD8z6EegoI+j6OlZ/5ASWMWkRVnVSyCdpHzOh9CbLylGwCyEcq?=
 =?us-ascii?Q?ZRfMTA9SabpGW8Nl4K3iXmxlz7KNI5uGV5tfoyKfzmm2hxUTeOUSoOP+Dk7s?=
 =?us-ascii?Q?zG4kyOOuwHpJc4JGgVTmLcruTTkX8WOVOi9+sHa999Rbjlmj2MA7knErtI/b?=
 =?us-ascii?Q?jIFhcHrR130bjrKI90hD0cOvYgEYvKlNqURWQFXtzBLjFkkgV6iU/4RS9n2t?=
 =?us-ascii?Q?viCrjqHgxP9O0CYgSj2D7XjeyTxjirZYo5NbcnxRFjXfsK0oIkKjLBaTVBjV?=
 =?us-ascii?Q?2L8FCfuj17pGzo72b3YDOnCMpdKV+e4LJNiNs03p5rMjstrxqrh6v/RHmz1V?=
 =?us-ascii?Q?bnzxaPqqVdfM5k/WiBGL/VR+asR6qM75McL2maspBq9+J+pxc4rGT00TO5hj?=
 =?us-ascii?Q?a3Z9vgb2O+jGnTRd5OhTAb3cwsCwuCS21Ap1I30VVgim7jJnMgTVLCHDMTax?=
 =?us-ascii?Q?xFC/9YZdNDG4TTCSA1mq+wOdxDCJDwLCQjECTr9NbpAQPq3aDWj8ESCLlixd?=
 =?us-ascii?Q?DrNiuOCvFzw/AyG/WkqfYnm0Zb25JOSEQrwXsjLZ7RGRHBoaOtkpFvMnqUiR?=
 =?us-ascii?Q?6qjqnoYYVvsUS3wrDk0rte/6ZBr3LIp4LlA/ClW6GqKu0zC2vBqhOmphpN6A?=
 =?us-ascii?Q?NLJwJPgP7GGG3niavbrjiFJaYV3wtbq/ua+TbkecFX/NfwtLP9eevM+ga6DX?=
 =?us-ascii?Q?+YfTatfKfUUD24XKo8o1PPi26/Sc0EIBPdmFz1iehLCicdqeAQCvRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cPbNtjzRGi5QoN3LPB4Bt7GhO8hub8XJ4pBY9ZqjaWJyDNsm64zETOEHiIx+?=
 =?us-ascii?Q?Pp9LyG8xLU1yPh4PBXuok5XsIqMbkZc0Gey84o4UbhmYkwCpgfjPKlh1x+Yf?=
 =?us-ascii?Q?y1NnTOUbK1yx2DavlzdX1hkeTGu6Kx3LM8TA/fx4x5Qe6F/QLKbw6Eb+NTkG?=
 =?us-ascii?Q?hgNK+Nj34n5PPlUC8M1ziNY/NZOVmbbfHg5r04n18Ojk2+lsRY+EBC+fuwX1?=
 =?us-ascii?Q?pZhQderJiLSFOdc7ZmNX8xOR1Iun8tZM2k2C0xwMhHxdoJ4wcTnvHwu8CoI0?=
 =?us-ascii?Q?Xx9ToQ2UCB53lE0Zq6hDFll6AhIYbV7939wJF9kQC7p9hLBIGEFR2MM8s5I4?=
 =?us-ascii?Q?EuGKtv/f5S2Quo/syCsxWk/HPss3LrNu+wsOKetUOlVOkLjounSiaS67M5Hj?=
 =?us-ascii?Q?0vMTEcTumYySMTmp82x9I22vlVUXs3aydsF9fs4Vq8qjKpMzjA+2NT6Z/yvU?=
 =?us-ascii?Q?LF45ZO2LwyXcssacUbBGyjnv8LZ2YQLpZETcfN9bd4jgTvEl2ZK87uytGAwA?=
 =?us-ascii?Q?zwEUMf8zBpHhr3cWsbc9v0VjD/PchpFNPgSubBo9RxGmwa6APUAv8M57Gx6X?=
 =?us-ascii?Q?A22B87m8AmwPegU818MiYyyX+/ELjpj8xfh9qAgXJVMt1Kc5hN93lvQwDzrY?=
 =?us-ascii?Q?kmKZfA1rW3E9eEaHerFoXGpc4PbutlouICagyfdv52g8R0dwDe0/PKIBhpHR?=
 =?us-ascii?Q?n5QfYBKTGrpMHoZf+29wXmEIyV+jFauGtH564THunDpkjWrvsjLsptlsE9+m?=
 =?us-ascii?Q?pefbwv4c8AWf3TEoBiKGJWBit/Eax1rzi00B84UvrjT+yRnc/3eAk2rRME0i?=
 =?us-ascii?Q?sWW+GuKBBtcLXZAhEekgNHiJuddN6imggzAIaQ0TBQoXZOjqkUKaZM9SZjz0?=
 =?us-ascii?Q?f78kKLw9xresR/P/pts+H9hAoxlqHZSsySIT0KaB/wmxFvzcNb3LJU6BDgoC?=
 =?us-ascii?Q?+uRcdZkrWmHGwxHNR6jUDy9DNUqBFO9M8DOm/lnyrZm7TzCpFkeC52dPOw00?=
 =?us-ascii?Q?pwrBRnFU+se0a5d71bKWPBCbAqwrZXBqQKFAprEw3A522wZqI5AQE8JH5Wnz?=
 =?us-ascii?Q?UZoH+5ze6fB56FLdmqcbe7updGw2SmUQZaf7l7SE4afXJXtBuSShq9eUU9U8?=
 =?us-ascii?Q?cGRupqeGoZAEGL9IH7fChjVQpxXVkGvfuST8iEGRnK852Ike/XqcWCzfgMGZ?=
 =?us-ascii?Q?fuh4nMSZ/3Q+MosycMeBUZgJowessWoQLwqsb2jOiLIDlU55WTuFWs6jmwp7?=
 =?us-ascii?Q?GyjAX7ZsxI0R2JhrVrYGvUKmVIqQOR6c/SiuCVRRi7GKKtgnENnjklwJGePv?=
 =?us-ascii?Q?h3zIVobeoYK69/fMjbUwK59EQdF6qWqNeAYBvLK3Yi75V2PYRwTClJ9Q7Dz7?=
 =?us-ascii?Q?zZDjccBmfT3Y/0xTPctVULlPctV/yM08174wJ2MdBwE7H0DJw86lGU3N3nmJ?=
 =?us-ascii?Q?hanwREPAIpL0900VQni/WFK5RE+jC03N397aaKbOqAYp2y8+CPqkLPaZIXKh?=
 =?us-ascii?Q?KWqslNUlhAK3i2uFhkgk77ldic8eu6Axbl86nbNUaQEld3h41RsKl6m5ZbaP?=
 =?us-ascii?Q?hzamhmM6nuyGbtnQz4WmmfBQRvfH8NUobMxg1Cm5ntytKkAbHwL6pLlHIHxD?=
 =?us-ascii?Q?FHLyH0WPOxJ6SjulTUC9i28=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978b8e1d-9df1-485c-e395-08ddad32dc52
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:06:51.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DJWnH9CWtD4EOXIrDkYz4UPa6FykKADnZSfh0xRC/rVJWHqwP9pPze0T28phJOI5a2T+vr84RFgYyD0k2lLguYSCZ70Q+QmxRoMuHnamaouf4YaEN9lnZDHGgxCmegt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170653_867906_981ECD19 
X-CRM114-Status: GOOD (  10.13  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1c..2e1c235303e5 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -761,8 +761,8 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 
 	if (ret)
 		dev_warn(port->dev,
-			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
-			 state ? "dis" : "en", ret);
+			 "ams_delta modem_pm: failed to %s regulator: %d\n",
+			 str_disable_enable(state), ret);
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
-- 
2.43.0


