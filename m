Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE5C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=NofbxW4aL/O54lLqO4V2rx8Ykr
	osXS6ORDW4R7XZNkTasFUjxVl1iOgnZ8H+KC2SLO3XzhiqjB/bJ95cdvxF6ao19k3rjaepBCd+Q3Y
	djPZ+fTujvAjYaTh8sukjY8npckzoPAhrS6qoxyefqZpiHyvKYnp2odyPa2+BhsgCoTQq23phyhow
	tjjM9ZZNDYx45nxGO7VshyrAL9/BFz3KtTLWPzL0Of6MI7nvG4i6HCMB1shmcqWEFojhSCX/RzI01
	tUxQlh8ZCrtSmDiw/iLoN6OfaB4s6tt9lheFYghiyNn5VzHEZSmyTO57nLsnrnvfh455ZeCJHOnqY
	XNX4oX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaue-0000000Af3p-3Tnd;
	Mon, 05 Jan 2026 03:05:44 +0000
Received: from mail-swedencentralazon11023117.outbound.protection.outlook.com ([52.101.83.117] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaua-0000000Af2N-2WfZ;
	Mon, 05 Jan 2026 03:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRDz2zuZtaBStIvErLhzfLG4aaK6218eGGgVMe3y7jt++pxlvIcKcPhftEY7+XAE5lT2xxdJaxScNOuwBQXxHOr+XcYtYp1VVcNNnyyPa6mPdjHCP9obmbKLUSXICu3hiAGx8+kuM2RaIR+wS4VUbWMw+dIWNZ4pQjauAvBQMuW+18BWDSM5uXMvS0xhhqIodsMPZojcMu6jwG0TU2tA/Xfa1WJkjSMpug3nULOWWsVnytlkRr+i8Qc3ZUmU05qhVUWv+FH1uKYuFXHbE2oUETxggYXr7KAOt8q9IlltIR4m6MjZv18KxjMKBuCFrSQrpcvmyTdZUgSUzHD8zCJteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=tTPAalZS5zsY4VsluyptOC3KpCUV8DYOnp2Y1N9QkrEWwRHcEhFoCPcwyOvhK1NQskztwLzfzGR617IE8r0+k4vkYHcJBLp7tHopdCuY6po55Iar4uN9WfGKvkaYgigqlezj4OasDh8YFuh+Cm8G4WMUxhqDlhh9JgtRRDpTA26yO8k6OuI9p/LRVzN2TWFITOYBMwbHO0mIqa2pE5rfV1CLJtsZv0vY9zlyFtQVcH4Q7nyrxcct4KorshGvAG7tRjCNL22ZjkfzuzS3+omvl2Xu2LEPCSlA80NQgfQnswg6IaJREsbI3JQNJuM3UOix7dV0BxPDlz+uUZbxQdJHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=AghNQs1ivgV6hlebnZf2dpEuG1u4Zq9MEsB2zGC8jJ7SZCnW+M5fQ+RQuoA0ur1LTnxQcXHWOLiOJmfJdI+kVZPYjoYLU3vtmdhK/7ws7ZV36IfrK/rfymzAuA1gNGluk2jN5QP6grgckjTUF5uzpgaMNglb2j64tad9shvKHpEqVyJ0tLzpPhXfUyf5lGigBkei5CjdvUtNPoAwgHY3IE836YI+wtd0egWPkvoGlrqPFmn5TSp09TNI4YtBcJvizM4edzSBCpCeIYwT5rXaUFTU8Z5npAfmKLcuQMScfCtZ0GpcqdLa6kgjyzxD78IDx7ay9wwafx77F3qplB55Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS8PR08MB8492.eurprd08.prod.outlook.com (2603:10a6:20b:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 03:05:32 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 03:05:32 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v2 1/2] ARM: dts: airoha: en7523: add node to support spinand flashes
Date: Mon,  5 Jan 2026 06:05:18 +0300
Message-ID: <20260105030519.4101456-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105030519.4101456-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260105030519.4101456-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS8PR08MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2557a273-c78a-4c86-7446-08de4c0749b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CGK++haoncLAaS9mRwzF6rHUoDgM6ruc1bB8G0WZFf9s2T78yp9ZdGbKKmDL?=
 =?us-ascii?Q?aUfHSIMw7HU2LXN68iWhy0g+vZgeApLWMPWI383le9IIbUQggQFyL2hhwU3v?=
 =?us-ascii?Q?gca8UUuWOTWPIkIe0esx+nghGiSi8QK1q/BKQfMk4fJKd25dkUW37TOQdHVR?=
 =?us-ascii?Q?Gdobb17/0I8lVayM67+aAPkpYPx2SbPp3TqinmDueIh71sLVCFMpWiV0f2aE?=
 =?us-ascii?Q?wAFtPoept2bKQoR44H9mENtED+B6q6zln6gVQ1ZecYa4BiZZZUF95UTBnSp8?=
 =?us-ascii?Q?2D5XvGLyBVl7X6v+wvOJgMGxpz9f3lSWiJgsBp68Y5qYaGT4D3yL8vDHn+Yq?=
 =?us-ascii?Q?HSNVZHXpGkwZRolxeQSSvQIgl8tJY/C2I58TDIPxvpcYwV5UQI0lUXeGkgrm?=
 =?us-ascii?Q?1eXQ1/sdWnaweysG9zrwwPAJE//ySV47bYg3jICEIpLL75fMsb/bSUunDEnb?=
 =?us-ascii?Q?dE48sk2rc9FCnuybSbi9wnE7tlglxV5z9FYEg969pXnqY2p/bCHCn6gzkgRr?=
 =?us-ascii?Q?6qBp3Np5oT1ddwv12FC3gNG0l8xHLv4S2f/pInE8R4BKdO5B2qdOArTdOlg9?=
 =?us-ascii?Q?fatKCEGNUO6yLzg74gWUENWFVyjL7he8IykdzzG59T4fsVi8ZwugHaxIokA+?=
 =?us-ascii?Q?61RQNJJ6JEmmsiXuLevD+kvfJlyBaa+ML2IvKGfgxr8v3/7dOoISH7M1+EFw?=
 =?us-ascii?Q?nYhXeIGsg56ZajxItzA+fMxc4mrO1lQhf180GtQScckdmLbZkjZDv2l3MX/J?=
 =?us-ascii?Q?OhBou7h0b3JjrcdbdoKg8FHyM46TXFGDpA702ayB01wuGUy2T0KwlXvyL/zB?=
 =?us-ascii?Q?KOnMejvrSpseTu5bDZXcjKs955IqqapyYivRoCM3EkuHNVKN2Px01qzbtRli?=
 =?us-ascii?Q?SJiLXbmZdzlS81E8idqxjGU49tpG97jyBj4XgiN8ZwolPA2/YOAZ2Zu9CCpE?=
 =?us-ascii?Q?do5JvsmthWoobCDDV7WWDM3uTvPPHnKoSzB4ejPmRQUqWA7MIW6cU057wNu8?=
 =?us-ascii?Q?CgFMXLZ+fWyRtcethPNRXBPL+m6tF6ddCCXABXn6NXb31vgOxkw6JuFQlVvi?=
 =?us-ascii?Q?Mpv2kIhj+JhiDsn5d4mZMQK+WehENAOlhHdgG9CQAygTvKORGUpFCVHGlOB8?=
 =?us-ascii?Q?hDixXBRTj7pVO0jIOXTw685Cxr3JjoLnip4PUgEsyySnRIaTcXh8vDJ0nouu?=
 =?us-ascii?Q?hZbZWOOGQWhtopxl4cfnfLZaJuhJEq5yCtU8vDsSGcJkzClOe6/545W/zneS?=
 =?us-ascii?Q?xvwfFjt7Vnpf697xl3Gx19H4b1NYbpgu/bDppRhOSIbBinT0GbV6btRzMAXK?=
 =?us-ascii?Q?Odk0CjiZHHxyrF3WQK59qX8B7G0qCHxU7rdiveEJDaZvOO95AmzJdOnaJim6?=
 =?us-ascii?Q?eVcccaJNz1Euy2DJloaHbxrvpW3N4lvOc1XT9SI8PCKfeoSY2M45RjLacrel?=
 =?us-ascii?Q?+UoDTvXPwnaRkrNHUNqk/0Ga0iUQy4Ornp6kdK0Hy826C/DNZHfBCTHTENMu?=
 =?us-ascii?Q?fg70hKULXS/YIMhEgyqY5+Gn3dxPYSwsEAfM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEcyYm3qikTzcfdaC+epTY9G0SjDPLcRkPZKCvhxmk2YelOcgN2Ob8vEX3eO?=
 =?us-ascii?Q?MYxpBlTwkD/0qrtGRyOTJrrvqkkSI6U8R1O8baETnO6eAy+RQF3wOV9ZPLuY?=
 =?us-ascii?Q?zo9RjgxibIFPOguJWhXhAUWNNQrfyuPgYG1ptJB8lhSKTBMbO2wvt/rU+NMY?=
 =?us-ascii?Q?QCKJyQzMHvIGqAzPdS2y2dWO1c200GQc8Ots568AoyOCV8QqmNhnMkewU/+z?=
 =?us-ascii?Q?qIkBToCfZT5SrICNqTcKhut2lgsmcYw8TiQc59otQyUYwSp+32qUqquskdKn?=
 =?us-ascii?Q?9IcMkuDxxJUZMO/WU+dPv6VlWDH9KVtWszn5janrv/QxETltxi4CR8bXRYnl?=
 =?us-ascii?Q?BuRoOkvcH4L8duIWJl1n8Bryek6mo5jBMH8LfH/c3k6lDTd1qF6EU0F9iJ4u?=
 =?us-ascii?Q?8XmBb9sbvmHg1a+A10WH/2xoEixuU5yWIu3bDrjJUyV7J1erLAwsouYULdTo?=
 =?us-ascii?Q?hoFtbgZQjg7KdbQ+pCxq1sulupSdlA/1R/NvHkmtmDVRpP0/5lo8LFeHRB4j?=
 =?us-ascii?Q?3vNqEbjJuA1s6z0Xn2uqu6eFtQEGqFklZKo8QdFrKjEvVPRx1cJeunQSIe/C?=
 =?us-ascii?Q?KqYkxOSmPcnjTtMwXkh+3A9rYDRIkZBt8ocGNwqiiXS8gw6gDNCcodeRC6n6?=
 =?us-ascii?Q?gfLe+3SK9RZMnHhrZFnPdQKV7PXnjQFyiPfJ80zqsweeSSe3+8Kzd34ksipv?=
 =?us-ascii?Q?szznH45Y2+fBySr/bCcykLYuSHnF9rXjaHD7pWy4ze+wo5HAXSOORlrxfWf5?=
 =?us-ascii?Q?8ZpsEQMwptYF4g4rW2pq3H5E/VQ0MjKb5atrrh2rXV+vR3ZqzQJrs1cPtLzK?=
 =?us-ascii?Q?prhT7NDodEmn63+hxSy7rXsUq0oF7DLcyOaQjGrqeJuQyG8Gxomic1nd0/dT?=
 =?us-ascii?Q?PcXen1kZJSqJvqtuZ1QwLyVlQ+0d100OqoR4EToI9GxrEJJehyw/hxC7/b59?=
 =?us-ascii?Q?d+T5X/ZHmJmMwPBrNgFyL0kEQPsWKs1ghqfblnbTzqXWn19UJolGXdpfDIjh?=
 =?us-ascii?Q?JAx+CjrSJkn9/La9tYvKy69L/7JyDKi7WkhIjDp2fPOzvkjyNCYKox/TgSjq?=
 =?us-ascii?Q?ICtSwgGSjCWMvl/9zj0QLNEir23BSevaUTNvIYLRfParKlBP1EoGJr86fdid?=
 =?us-ascii?Q?7U/BqcoxQgxGxdt5/0G6EFOKaT8zuG/5nrKpO/RjDtj4dUjKbw3L9g9cI204?=
 =?us-ascii?Q?NQIRn+HZEEzY/B/5Rw94YRcImucRyOV5GQ+iULu/UEeOI4Ofxj7wpwGf399B?=
 =?us-ascii?Q?8rKfeebFLXRDRjSRLGZha3RMBhg7hXq7dOGtVd6kXX025cgEY272wmFKpj/e?=
 =?us-ascii?Q?Woze0Ne2Pdd7gM1gw/107AnoQS0Gn4nheY8jUHcZzkKuKErKbbWafpbwfNNJ?=
 =?us-ascii?Q?V2HmXgma+Kq+VDof1ckQ4t+3We8P9sf5hEhd5D8l/g85CCx9znvnMKQgazrf?=
 =?us-ascii?Q?AkeGIunVRnGAz7En4QxXyHh64ez5vMYIAqPQI0Ifu9OsDz1zgvqZZZ+pOMlh?=
 =?us-ascii?Q?4sBjHi32jF5qJPBIdd5cIETw7188b6DFjqADl4bU+Rfl3E2/zeQeurM77RF7?=
 =?us-ascii?Q?Gzu7YrEWwLp9jKTbD9Okwff9P2/kZTxnrZq0kw/L8JuSI7p7JaZLqY/rbVZp?=
 =?us-ascii?Q?n8SAK5pH90FosfVo0yIZyHMX0UlOEiz+zKUnIYME70WUwreZxwCdo5LfULTz?=
 =?us-ascii?Q?pbuw+2r3hfWqpeA0JjVaALch8NkjpFxRIaU3yg8ZWRdB4z9HlwzN93BoJvLz?=
 =?us-ascii?Q?b9r1WJadqTEexJhgRyQewIlh6Ny29f8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2557a273-c78a-4c86-7446-08de4c0749b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 03:05:32.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jdui7m3GfKZ4QjtubGnw6V0G3/k3ZWiuShd5oLboYDSRvhDmcGjV8XVjCDNQQscRzTPFVuTDNpj1qHTIZdAiYrh4jhTn7Jy7KjiYct4b2MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_190540_664683_DAF7477E 
X-CRM114-Status: UNSURE (   8.94  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


