Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE82C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIW68oEjsqzqKfM2hKRdDk1jxsyXR/2CWMEP6mhPkrU=; b=zQzue1jNOzTauMy2Y+i+3b1wAQ
	tvdG3jx5w0AG0Ww5Oi8g2lqMqVSlwews1t90WngAAWGs1rFfi+cUI2OHv0ufNG2kOAPz2n2UyVj2/
	t+XqsEiKDMxvsw9TZdoEtt+1P1Np3bbUdj7wX9cCbiveh1w88+biXzgePi3nZbmfcrdGDGBa/IX/Q
	M4bzoQSB1zVjdaFuqnjVcKpYw5WhCMP99dZrod5RRXV1vwuTZJHGNinYQCHeDR6nBL0mk/4cUQ3cv
	Ts8daF7SLXYghPIQNeY1O1SUKWoxlKPEupsfKdlKDSsveN6s3Lw+2pYCKr4XI2vYXOEGgg7YotQIp
	HlQHffTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyL1k-0000000FqUR-0Wje;
	Mon, 24 Aug 2026 03:07:12 +0000
Received: from mail-australiaeastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c40d::1] helo=SY8PR01CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyL1g-0000000FqTx-2oTA;
	Mon, 24 Aug 2026 03:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfHUaxQx4yI8jQnewNW1H0ABXMqWISISiNtzXp9KPhdNqxCv1Xqc2HRqpWSK0AK3BQ7FSwhIL2ZbIviA49oIU8RguynmvdTLSoy3nUbuoy3k7WFHWjsNt37xEVzVxkjW1f0MyldHZhT89V7s1GqvU2TP+BHM8+yBCu2RiGU7QI7DUWZvwRiO/BLWgkgFkUujW7TXOQYzZXIYvoVwWkh3i8wPaovpECYAueHIlXe/c9hxKpKVGGIWm8gPEYiah0lypka/zBITslMlM5a14zwr1d9NXiQO6IK6MFXVUuZhgGRLnZh2dpdYav+ceFB6LnMOVeEjZ2X/9kaFC2i7p28H3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIW68oEjsqzqKfM2hKRdDk1jxsyXR/2CWMEP6mhPkrU=;
 b=DhiTgmo+1QbDiqFqzGxKJ+S7WZmRpYwA/xA6Ykt86eLk4AvGvDS1ELpGhnxxJ2vZpJAbpyc60upeBJx5waBA+bbeYc4Ujeu+5/CyI9ySnAWvXvmNEicU7e71fKYydPhNCEeyaPU8eZ5ao21ObxgjXyFuCCsj83fafIhkfvThglzAGnfD01XM9+hDswlA2EPO4tJ+eQXNUKRz9rdQy2IF/9c2HRnVssxs4jTHbHFRdBGGlb3+mEwrdYdpZiWOKoz1bwtXJqE1ePLAM3jJuhhu6gzd7AimvuHiYlEKC57Yp7szl9mmgIGRq2IEgOZT7A3F5yHQjabsRY7JmETr7NRJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIW68oEjsqzqKfM2hKRdDk1jxsyXR/2CWMEP6mhPkrU=;
 b=J4uZo1Yl3e2I1iTCsLozHdWWFyCdaJp3x+lkHwtDJijdFCF09IqyN8OLiJxrgtC1+UDRJegX98YvdRhibN/SOHSHBokz+0JpXYUBhwaHtJ+8oJSBR9a30RN0nWG/iJJHbBH9pIGHapM5/WPpgxmA55OhoGS5AHxVMyw5TVEKC7GFtFpTka7CjPOAjVHlKjoByc3w3dFd5A5AkaLzk31ZZHTaGj4xE/HLF41/gaGbxqYa2+lSVAVj37QEQs0ilZWksWd5r99weRsBp87b6DbUCJHzeiWhbIdfuyP5Vq3UNySH8wxxMw/67VULMXObbo/nim8n3l8lZJTw0yZOsOSjvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYDP282MB263816.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:348::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 03:07:00 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 03:06:59 +0000
Date: Mon, 24 Aug 2026 03:06:43 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl
 timing
Message-ID: <aou1Q5-hdF7kRVpe@0d3a7a881997>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ME0P300CA0006.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:20f::17) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYDP282MB263816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5448a37f-a813-495b-4bda-08df018cc388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: kYIXPRmOtSEiPJr9VtkybUhMhUOEWWruI1uL04A2/4zSq95Y6FKL83RoewK8fJZ8RCqQ4pnonkc50h93MpMPWj8L36IAoW+K0HH4TM9kqDn8wsXEW2xD8O0TTm62BVmN/VPKQgc180lGjGBX4M6yq4qAkYDWFtcMiRcDrHW5rbT/9cujIBA78tCu90iv7VbJP8POZsZ7uflKH+YvWnFDA/h+49T5k6t3tRswWUKfqc4lkQyQX09oYuNayKbvHiKHLRTvq54dpP5qNMbFhycpzUHXvEUYg2NgHFCoWEJkF53XKZCEfkKveBWcYAFm46PqIUD8uVSUrg7wDSywvdT944lC1if8EhT55JLOSRnWs/UtMq6Bs6Td3ch9ztFLVHE7dCSZCQ/YBruSearf7ZfWPHwXanFEPJEHQ6trDFdHirNym13z5ZSjgaPPA+EgrFs6/xDJ5i+h/aD+VajRkx2Optl7zx5N1uX8vRj9mLJsUnGJewolVPoLsRvF9vuKc0NxN/oIIoZ7CO6bsStu3sTTJYlq2y0FuINglwKlVW5HEy+AcFrbzBjD/OL9t+DCL0yWhaLGLVGnkpyjG6SztoJsSjCrZkT9Fj6XtS82tFphWE+3f3LCoqbSIPLLGlItgRGJfiThhbdZ7HotINvMf9dAeMK5hW7QSWMcHILHZPiyrVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+VRroDDyFRtUNTBMzR7jIQ/jY4aH9oYnTK5jyal5PZPFlg5OzvaDtyFp9Zh?=
 =?us-ascii?Q?EUjjxXj20MA+qACQt2Wh2pkoW8aaARbjezsHmL8eg3GBfXqHnD1CPhrPkxar?=
 =?us-ascii?Q?dn8w2ZH0FpEZFU5CfnmgsrBdSbc/6E6L3TJWw4RSj1ystiUKzHgyeDA9wrX4?=
 =?us-ascii?Q?tCOskAW949YkUdjPL6LS+Fc0U/vN4izGFtbkPMXKPwDr9MT2qcM2ok+i4w50?=
 =?us-ascii?Q?LTNQIOCx28wty7SqSxaHsPkwS0ojw/0eBy3TF0yhHcD1U5sP7oCYtI3qI7OB?=
 =?us-ascii?Q?q1v7jVyzLve7AfHr2VPzlc3xBi0dYfO9GgoWo3jk4KympshDaSGTWqXjKchK?=
 =?us-ascii?Q?jGksu1gl5auAi+3Nwcfw2S40gzyUBgTyilY9AL+2DnYAkMJCP4+MMbKZ2/+r?=
 =?us-ascii?Q?enqlSJ+MFWUVFDkqfGBx6c5wisJwORSoeSOOqXJKjpfGsE0mTTW4KrIHIdu8?=
 =?us-ascii?Q?TzW3AfIy05zGLDJvRaFjzXkvGzTQq9s2MQxLvwI971qYVmftOtUuq1/ib+Ob?=
 =?us-ascii?Q?u8J0II3zj3SXmGIpoJnABNFyFG0TXVnCmSuzRajA7lCZo7lNxMqPFc1yJGTM?=
 =?us-ascii?Q?9J86txtH8xMhC7/+GiWXKY3GjCR+NbhYOGqsj/m4wNiGxnO9SbuILF4pye61?=
 =?us-ascii?Q?nyD0bOT1uP1ovFIr4p4Wa1tJZkuqLoAV55QFLpGhX2qF2/MXkYTnpxz89W+9?=
 =?us-ascii?Q?0VPNaJ/TbSDuNtkYlPmnI2vqFBVkLFc+5eon/1FqwAT3tDcBuLwsr19Fq080?=
 =?us-ascii?Q?6VKVOM++AAGzPKUf+qffg975wym6LIRB6+/eRXtz+DmoQC0vy3WjJCZOh+m4?=
 =?us-ascii?Q?LzmBuv9sk+thY0cUzyr84Z1lG4Vk1MUUkxjS+cLlCoiepZrjMmOk5gWYBXgm?=
 =?us-ascii?Q?78xJRq6FDsbSuERCdTlAzCJp8QMlNw5uEaoZyZMTxotbXW1CVtr61EmD6jrc?=
 =?us-ascii?Q?5wgHZgOcWAn4Vqz5thnD+ePVwa+DODTO75M7B8c0GsWj/4xuEaK/uWdL+w9r?=
 =?us-ascii?Q?ekWuTI+YKJbPZBndm0VHlXFZRBfl1NIOh3+oH3PUKPbHg0BpVG8OGhJYYwV5?=
 =?us-ascii?Q?5P0nYdxGQElxSrsGnEn2Xr77NObAfyt3CarntRfl38mS4iUSX7f24+TO0tL2?=
 =?us-ascii?Q?0iSrBaN3sv9NI+adD/h3jfQeYR7/cRvBZgMj9brKQfOHA0BjIsPPYZOMYQQz?=
 =?us-ascii?Q?BtZxBgHT8Sr4NpEBn8U+iR1daOCMb4y4MLy4WGLcxJxnjvV7mfWjXVQA2e7h?=
 =?us-ascii?Q?1FOS0APPaqRdzOuLUl0a4cve/SV0CTLQ2lbtm3K+J/IqE22eN8Xl48b+sK1I?=
 =?us-ascii?Q?J4NHaWLgtYaSLD0R/JEMOphzUBvIdZfcTVUmJyrMYtlsb6eiAGExp9SOpADv?=
 =?us-ascii?Q?xAzefLrVoAmsmVIYuWzF0ONeIPjG5+JVg5JopkmOghcuhuf7M2zbwU+yEBJx?=
 =?us-ascii?Q?OkwJC7JV2zNuDn7nY763N2vsq8CvoU/ttTHfZ65HNb13YpnA7unNdvh0ubGm?=
 =?us-ascii?Q?Qyhj+dPN6BRM+GFPMjffWmyYNrOdASo8hoef0UgXxPWHr9D5EcVdbZPa7NRP?=
 =?us-ascii?Q?5cPl4RojdcZEVmgiMeJnFp5uNFeRs6Emo6gxHLQgeKNTgDiTJqwUqgE8UqDB?=
 =?us-ascii?Q?Pd2RhpIlLoz30qEY22ChdszYGgMZXHqizccUuY/LWQmxrjCkt9SoOaQhL+CR?=
 =?us-ascii?Q?q9IHjGJEH/3gkDUAQxc0pN/ew3JK3dm1cUZmHsFcIPkZtIUC?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5448a37f-a813-495b-4bda-08df018cc388
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 03:06:59.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvLZYHjclPMmmtMW9ksGjq5twh6Kf6qAKKL5rfsbt5nju9CGcTe7nCn91T+bXzTfrhF2AM21wiRpeXVFPniieA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYDP282MB263816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_200708_714616_1716356A 
X-CRM114-Status: UNSURE (   8.89  )
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

The hym8563 on i2c2 does not ack:

  rtc-hym8563 2-0051: could not init device, -6

It is also the ext_clock for sdio-pwrseq, so wifi does not come up
either.

i2c2 runs at 400 kHz with no scl edge times. The core defaults both to
300 ns and rk3x-i2c calculates a 900 ns high period, which is short for
this bus - it acks at 100 kHz. Set the edges to the values i2c3 already
uses, giving 1050 ns at 400 kHz.

Tested on a Radxa ROCK Pi N10: rtc0 registers and keeps time across a
reboot, and wifi activates.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index 64e6ba345739..074f09c6d11c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -296,6 +296,8 @@ &i2c1 {
 
 &i2c2 {
 	clock-frequency = <400000>;
+	i2c-scl-falling-time-ns = <15>;
+	i2c-scl-rising-time-ns = <450>;
 	status = "okay";
 
 	hym8563: rtc@51 {
-- 
2.53.0


