Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF70F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jvLS2ygBQGjCdIIG8Rqd4CbdjKfnr4NaiE/9uc9pHnE=; b=BGpDZEFM762QNzkcek77v9jzlz
	hh+2dHynnprZJVAzE4LFMSdFb2kokH+wu2BmyliXZNTmh+B673WbHcJnMAAs/P8lklcX0xQbRrLih
	0kcxvpxAaUUpeUDgY2HDdikSKpK+S5oXqnma0x+3XiK+aA67KcXmSuRJmkwBwn1ut+KbNVYliOGJb
	8ykGveJIGYSNiqgNJvbTMS4gMjKPsi9MON2AiYE5dobz/1s22FMpiRhAls0zcaibFmmYGBEU5bYmK
	6o9IbESA1g0hFxgLByeVQqsipeYufvWMX/DI8/Sx8jc1ZuNTmJZBkCRJu4CKs2CRhjXdk8Ncfk6Zi
	MLfwNHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLaF-00000002w7E-2OoX;
	Fri, 06 Mar 2026 03:10:35 +0000
Received: from mail-japaneastazon11023124.outbound.protection.outlook.com ([52.101.127.124] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLaD-00000002w6c-3Kma;
	Fri, 06 Mar 2026 03:10:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrFR4Nv1AaT61ThbrqHta2+3ogvy0IIGkiFr0SJMOo1DHI1G9jJX7sehxWfI8Sd0hSj43p639FxazO1W8l88Kex2XYJ4EUEfVkzjAccnbwQriINOaQDkkFC/9dCTRQZ/Mvyd/3CIvCGR9zv3Z25JGyeJ9pFy4Rw+nM0pKKChJHloXP4sjofvTkxyIPqeb/TSVE+Lz4cpHEL7UjK1wAwFqYkJ0MtG8OZGs5tUhdRAdAfgKF1WTLsqcVKuJrGifI0Oky45tg/RkrX2MDQm9Xd1SyAqiyRi7pkDfjmXk0AFiS7FRESgjst0zvP6DVOmPiEExH6CpFJUeuH8PGGmgcYCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvLS2ygBQGjCdIIG8Rqd4CbdjKfnr4NaiE/9uc9pHnE=;
 b=Lo/lydVr0gYgzi42CFHcmtWLA8jR+zhkphL8Z78Fa18GQptcD5S2XGjxQlz8EU6FXEj0Q8lYh6vxxgFTle3DFoip3EJgMb1Q01SL8KwPK/gRYvpzKhF/IqQd70wQvxXTCkUbI1vfyznqTfia+69/+MUqE/Kw6p9oYxedkaBKfdymv+DDpmzmOUxCWT8t8d6fHTvGY13GhT1K04jtuseQx6I7yTN3IevhkT3hZ0TUBaVEVMA835Hl8fm89V1M7636GHDl/wuL4Ubg/zvNsDWxh+A45MQx8SxQcL1rTXpYVp7YBwd24x4oHHSmseJ7sDshiU/zdBhlgdgULkzkzxozcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB6819.apcprd03.prod.outlook.com (2603:1096:400:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 03:10:24 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 03:10:24 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
Date: Fri,  6 Mar 2026 11:10:14 +0800
Message-Id: <20260306031014.2421875-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::16) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 573d2a12-57c3-43dc-513f-08de7b2de8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: iYSjpM+sdc6EoMR7DvdITw06Dp+DHc0GNxWkgyJNiji2df2a1hDO288Ny2XgBBybqxQ9EP6uwrkDH4lzuZ6iaLOICYhe/qMpMAfGfW3LYkGHlroz6FatOuiQN27IBfGXjQ5NmA9FoG3pL/6ou8JrS81nlyCt2B76VWcwB9G/IqMlwFaePu8I24toW4fPZX2Z+SxW9saKfcsUMr9VSuceNLSdFmchYMDUT8W3lLw4RbRW+fHmseJwWVYcNgmw5+2x8QwCPdOc2pmxOqS1JA2OT698XmWHfPLdPqtJmv/wPIMldoR3OqOSP9FnRN2GZxN+ApBR8HXyn83BnR0/QruMvdJV4ekBZ4GgqLvySEnHi4v0GzGUoTiExwugU6UynOxc7Az5Rm9xq0HAyvbdIJBLWQE4NTi0+rQ2hVB/pxgtKrsggCu3QEym2UFET1g1vC8/yEjcyEuolBa7uzs6m4L8lxGwjVgKbHrGUy4mIugwb3f34NuZmntkiUJDbmR2o3lJOoyypTM9xMVQlaHYce2pfBbsN5DbSOE/V90zsKL31ZDbOQLOGwfaIoXo4PxnlLF2A29QtYOAmFN5Sd0qId41SbF0bTJ6SwRDdIpBP1ARObInmxhxrNR8jhluLd0L5nx/tDdjYu2fYTidCf9iAnbM3D/c9VS4L58Fs3zLTfPRdrOHevxbRcIs1zSBrXdHLzd1PYX9J6Hs+viKoh/OlqR8VehKG8LtHaq1lMVUhLz6X8ndENAcHbh0xG1Uqrb8l9+YTiqwUXQ42YbMMbPg2CAdxz3TpWocyqK4j3DvZH2QkrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bm+AHV73NaINhLWZtMaVqwM0wJ+WfBZ7IKu2peKjsFDK5quiWotqtsFjWBFf?=
 =?us-ascii?Q?kDGwqIFRP3u8iH0yghI3xy1Yu2vk+JEaf8Z9O5mOQI8ZLOeLsqJMVhdepdRd?=
 =?us-ascii?Q?oKiTf5GckliAStUEBi4BBB5dCkNEWhAjFNxHCtr7ZpBjgse7YcwXNh53fY8M?=
 =?us-ascii?Q?SxygS7MBb2leAi4/DmhcVRUgiSK7LGuuquJnw4k23wVnXpJmIBAG7W2XgRzZ?=
 =?us-ascii?Q?mtYD1vXdtDn9PrutBfsP/OAFlLO8fA0OU1fQxRilXzbXKK6RG948t7B5VSP4?=
 =?us-ascii?Q?GwERNagBOxNoD0+mXtdKF4sJdv3N7FvrKXg2KCj2WKuw7DVsRcPvrHbONdv/?=
 =?us-ascii?Q?0+zvgTwWmP12v4DlRDeBnIzhNHb/FWu+hpPE+ehTMD7U9ZsABUtEBa7Ybdbr?=
 =?us-ascii?Q?8ijobB9GggHst81xiwTdQz6tt2/7IvRHAlWKbrKAHfb9qnusBCtFa23lwmZD?=
 =?us-ascii?Q?wRxiaFH4mIMFK88/Fh5BcX544Nd4CR0+b/waIUCy8Vz57vhhjTCKPvtHgnv/?=
 =?us-ascii?Q?yFrY9dmEGvoUrfwlytlsZ4jPCHoap8U26Xrlzey2XBsV3yU7sbGEIs5QV66C?=
 =?us-ascii?Q?l7leKg8uPyqGQZbgwZBklV5hXZr9cF9PIRarC1FCNV7+2iyfRpF/re++DZL+?=
 =?us-ascii?Q?eNfgtG+/sjvsBDEzPLCrKcbbixcNitwrf+ZHi94CivL/Rfdp7x7Gs2A7QCyw?=
 =?us-ascii?Q?+ONETzynK2aY3HGJS9m7SxWZOlxqJPiS6ElI342MgsOraKLLEfi/n1PDWUOo?=
 =?us-ascii?Q?2brWb0AUSd5bI7BmNlm8DoWK3iaor3SGvpmgt1KypAjIKqkQQeHGqKSZjjLa?=
 =?us-ascii?Q?UUPMeUWoEWd3r8WAU/XGd7l1nvy+dbc7jszdrUD5ahn6RZvPR5wtkWMHqWfP?=
 =?us-ascii?Q?fNmd/9aJBOMS+0uxy6EHusNbsI0vLvXqRlGD3vuOfFW/GND/R1IZigl8hxLT?=
 =?us-ascii?Q?Vnh/jMktX2toyo8IPhMPA2NH3iIxHCSTb3iIstxe5eT4RTohBcnQWKWYWTNg?=
 =?us-ascii?Q?x1dFQdpqxA4sC91DaW+PGTomVjCPmKwGbZFp4jlSGhzvS21M/ZlwatOZbMrw?=
 =?us-ascii?Q?uFpuk7jr7RmLgqxNBGSZk/UbCYtRstZPNiXDqEiq6xXLpzcpB91XLsR18Dua?=
 =?us-ascii?Q?EhMnnMg6TOCgffVnXQld8zWJFquHae3evCpIBziBd050VZoYjV1XouGJsUEj?=
 =?us-ascii?Q?0HskWhKq9m1OGkwrTw1xO0X9NHFPN/qCkY2eKkw74Gzyh0lK+/OmrdquDNm4?=
 =?us-ascii?Q?jbmXn5klXmZJ4aV43+4aS3QILcziTR6OnXbLnp17A9eaJ9m9d0AlLuoKLjf6?=
 =?us-ascii?Q?2G3sPNRd96F9UiFIxjWw7xDNu5wFUWftvWsmsWFADVwDGznuoxhAdtmYKInq?=
 =?us-ascii?Q?OzV49hozBAzFjRFTxQrO2eyvZERTTOIj5ifEdqpjiAmsboCcyS6rAgVXtC06?=
 =?us-ascii?Q?8NVrHbyN/qTdnSB40m0dkviRgo8MkydB43BuethacWepF+t/gRT2CVM8Zvuy?=
 =?us-ascii?Q?pcCxMZN/4WTvUGyVYKprVbRvnzvUUxDyDgg0OtzXOoIDc7Mh3JToMtKSV4bY?=
 =?us-ascii?Q?+rbb5UiMue/KzeQ6vWIgQfqwm+jvqV2yBZ/5CJdqwCx8uc1vEp5LlqK6hXuj?=
 =?us-ascii?Q?1Irc2dllYcrzGNEqxLtmBTlWZc5wl/v/KKhXxL8Q+a0WidW/uQyak4VLx8tm?=
 =?us-ascii?Q?ocgxtoYDkGgE68I95RynsBFWl4w6O8ZA1X6NPPP1wNrkRe4T?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573d2a12-57c3-43dc-513f-08de7b2de8bd
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:10:24.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8LGKM1X2sM2U/iQnLmqeTwT6uiQyU5JdZ//YVTT3WdA7mPw+1RVe9d4uDUQGuB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_191033_843534_9BF27A2D 
X-CRM114-Status: UNSURE (   8.72  )
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

The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
mapped a single incorrect region. This caused the kernel to map MMIO
and secure firmware (ATF/TrustZone) memory holes as standard RAM,
leading to an Asynchronous SError Interrupt during early boot
(paging_init) when the kernel attempted to clear those pages.

Fix this by splitting the 8GB memory layout into three separate
regions to properly avoid the memory holes (e.g., 0xe0000000 -
0xffffffff):
- 3.5GB @ 0x000000000
- 3.5GB @ 0x100000000
- 1.0GB @ 0x200000000

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 25b478e106451..106eab2b4c2e2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -17,7 +17,9 @@ aliases {
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
+		reg = <0x00000000 0x00000000 0x00000000 0xE0000000
+			0x00000001 0x00000000 0x00000000 0xE0000000
+			0x00000002 0x00000000 0x00000000 0x40000000>;
 	};
 
 	reserved-memory {
-- 
2.34.1


