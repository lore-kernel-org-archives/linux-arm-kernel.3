Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A4C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLyk3UzaLGvBhsHU8wI4wALNc+oNV8Vwedg8RKLIl2E=; b=zMxPeJ+uz2tQtByMWF3SHrr0+8
	nJt7F8246pVFjvFW62LzqPhBcOfjlC3eeB9yyLqp36KT5rmm8hQDtjFAm6F6Q7cMqviEje367XTt0
	WaXC3mdL1jLuoqoeXwhIPodFLSK8RarrSk5dCmoUC9Wgw2jS7TV6MFB2ANYFkppaJc2XNHSdSjxDq
	KdBPp9clqi4F9417vflaloVfb69z5CfcPZF3xGb7FTUHtJ6mlAt7BXZoroodX6P568RsbakjXOxfU
	yRwks1g6Qbp5doogjixhsAt+VZEv3A2I31u1f00i5Zo5kGztEi+xepJmaIj6VRZ0eVcqsOIYC+6OV
	o698jtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHS6-00000003tp0-1yYl;
	Wed, 26 Feb 2025 13:27:54 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGVJ-00000003gEC-0ocZ;
	Wed, 26 Feb 2025 12:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEnE2mH0XKtlkACf8Zwaw+3GKMBA4bJ032uGeR2szVGQRIFV82XwHUYNG6Fo4rHuE2BaxvQYezdR+n5KIsRas5rx1XMcMNQ0/NH/PGvhCKcM54MzLhZ9wAWHf3oVAvRSKACoxnfk+IOSzIgfSJxmmNNzS4+9bFYYGJlsRzfVEChyjkTkYwqDXh8Z4NtIsmJ7aLYvYgh4pemCJL+qY7FyHcAPQgJ+JbSfxjYlosxu1l7IbHoPP23QgYWEisKpseTYvqjp45xj4lJil5LLLl7MKp9o1g/4npvOOHjMMx742w/oX3OVQr9xSDxy0boN0KnfRBa7tZVBYPjAQNbxepNRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLyk3UzaLGvBhsHU8wI4wALNc+oNV8Vwedg8RKLIl2E=;
 b=hLm/nWsFNkpJq1ZY1r4LRtneEq/4LKC2Bd57YOtIJI9IL9+8W1N1Rf0V2rN87Wfsc6rq1dVCATatWKzumcw9ZK6UIR9HU0HJZ/WSqxjy1wPuIJlHdvxEzm40MKPOF/eyKkd6dpLseyKOIcSM+3uNVpuB2Pasupg3Y7fCYnRoIs+MbdYIbFnnHLicMSL+0D91poX4EHun1YjUQgBTsEDLbvdg5hVvuaBuEVMdLhRcnWP0lDOnTpGdRGlBI2aRvA6aXHpDACyRSLL3+QsQ2QKmFVyqTbmz0s8gTW7yzjjhj6Hi6y+zSpqcfgT1A8UJQeWK8T5smCgRUA2fIBS5bKry8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLyk3UzaLGvBhsHU8wI4wALNc+oNV8Vwedg8RKLIl2E=;
 b=qKw9aQBnPQ9gArEfGE6ntOMvE21hPeN6CiXTkI/+TJsaHEWqpRhWxVE6nPnUq2dtcdfT69S5IHzr4quLUwtLD7TGicITDH1ucbBSqpltd8VhRgfqFlBBzUJCaZyJEUyjNE9yYJJRMr4351dimt8BOP/Hz0e6aTcR3cFZcQev+XqfcT2I4+Xgd6QtydgvbejT92bwYWlV1O89VgvPErvwQOLMVCJvEmOKojJZ6MR6P+c9W8fkUKrXfo5N9omGZ6em2CwfbWlW3t6bOcnQBJP8VdzK0CGE7eKraOTchK1mdIlTUGnk39Waqqy7317PkdOrO01Mho1M4YWvmfCFsLaIbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS4PR08MB7507.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 12:27:02 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 12:27:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed
Date: Wed, 26 Feb 2025 15:26:54 +0300
Message-ID: <20250226122654.576636-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
References: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS4PR08MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3ce34d-32f7-4c29-a5ec-08dd5660df17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KuNP82DsyM8VfJcxAoKHEpHI8+nR6344YFt34Fpe6pmsbjsGZh3qvaLay6En?=
 =?us-ascii?Q?wb1ea3CDU/0nk5u9wqjzZ2yQhVZG3CrHH505nbq0wPXJUrAFhaqG1sXetZYA?=
 =?us-ascii?Q?8iKsGI3GFb6Gj4QSkg6KrKKwt3aHJvrrlDVYqvugjVLDU8dsBcBOBWX/49Kn?=
 =?us-ascii?Q?xeKteu+jigbV8K6y5pjdoCZchLKLAvzsQ16ZG20VPfRlipBvlJMJzLUeTVXW?=
 =?us-ascii?Q?htMBDhjNYEWUqb553NoDOUu9xyqJyBx2vYDwq+mVPZPN+PJp7BM3Uc6Etpew?=
 =?us-ascii?Q?qbVa/0J0VEbhcADGz9QzHIa1dV974d/onEEsiW52jf2X8+PyJBxVGcaVSMro?=
 =?us-ascii?Q?YyIeZLbgHQ2bBSh3n3yhG+EWCapJseOktKmoJz+6X7tu7zlRdundJDrG6HMa?=
 =?us-ascii?Q?3JKLWSLED5eqv2QHF+2RgFTpqQ+WWrUBdLsuRx1ShW1DVvQWWxYZ9mDFUG8R?=
 =?us-ascii?Q?r5vFx6IIeWAKAiZdbyxZWA1V+XEcRn/NJVDkOaMnY8+8Ag2/S75xgB9jZ/wG?=
 =?us-ascii?Q?CPVo4jLDB126sIEvx6z/QqDgft+cNCABBx5cfYfNAxgPGsEMqYsJdAQ6dKBY?=
 =?us-ascii?Q?502q3lsUrH/GjTZFmqyGU39dW7n24xCjolXJGuoUyHzS1rruwmNvhrDOfQ76?=
 =?us-ascii?Q?yHaey+epyBnO/ZjaKIjl3AX1+s3z02Gf+dS0Z+/+BwfCyw5rvLbWvwxE7/Pa?=
 =?us-ascii?Q?Nl5op837VO7Zwq4o7+b11+I/zYaFgIVainwXmFkQte1Mm/dRSar0bBSxh7SS?=
 =?us-ascii?Q?s1F2K7EKPHqrmrSKGTqfzquR1S+COnygQh6ZSduteefYYqEMcwIbeOujO+xK?=
 =?us-ascii?Q?JQOjD4bZyFvK0JMhyG0T4uDb2bdtJe5hLd/vX6rZRyGjezvZeVfXcNTJFuUE?=
 =?us-ascii?Q?a7w0VmYwz1jCvd7ePsJFdraId10wj9tM41Wgn/zVlORQMFeKG5FCM2zQhKNe?=
 =?us-ascii?Q?wJT0ea6ya7dVl8sbR77C6bXpAdDGYvzepeoxCV6Sn3/hLNGftlzUvGQos/Ip?=
 =?us-ascii?Q?FUPRlrelJQ7UrxFlvEf3MfDXFx6u7jqjgbf2j0gHcm0Z/cawO3EraSIHoTPU?=
 =?us-ascii?Q?3B3dKLNXe9fOxwwlLtni003PlWk6v2vjxx4/qDPrT15rHlCpeSLWd7JYG7th?=
 =?us-ascii?Q?bvnlJP4EnbNomq7/v991+5uypX9YAe2Con1dzZTRfaXeZW3eE7ijDowmQIBI?=
 =?us-ascii?Q?fMmOwFDYmQk25csXnQGHfgF7f3/U3lbM4PAUfm8uDfT7JOg7gYIYsMnWtBC/?=
 =?us-ascii?Q?ThiBJBjbVrCi4KtvtKM0Ju7+yvcfG1Co7DMoHU9ulO5IKYMTF3bJmPJXerxn?=
 =?us-ascii?Q?Pw6KiRHk+ZPq9xTEMurhdYptZg65I62AmQIEifXwCxixN7YjVSqpYS6d2UI4?=
 =?us-ascii?Q?JLe5mqmEzMEpeLF69PRdfhRIbp5KU0BtSWKS0JY6gf5C1IFLdcPZ2808pP3H?=
 =?us-ascii?Q?E6MbDTDGDyL1s2hj0rlH5qlczo/RoF0oI9b6gJl+GKsL4otANxkmZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytYkpB+0s0GXL2p/ioVo+UL1dkR+4CPDAp4UqyaFrZeajAIW5qwcJyCpZySP?=
 =?us-ascii?Q?+wRQbrmzYuowb8AsM8Fy84sp8YEZulaMOcx1wilpp04wHwGBu57YUK5k3+sg?=
 =?us-ascii?Q?QhChyvl3PJgAC55EEXAaV8SesxMMbzOGYKdBsQvThc//kr8ULGAIG2PiIc5V?=
 =?us-ascii?Q?u3zL242t/fUPVbUk9l6YpUht2j5qVDpGQb0b2bpUziHrcMV8KcaXGyt51NSl?=
 =?us-ascii?Q?MFccqPYCkBaqDgUTKVgWslzf8ueoEp4Kc+IB5ayd16b8Mqh50ceJxp2TFuHM?=
 =?us-ascii?Q?mxrU3LQ2kM6NnvXOOCLEhImJqiSg2ZteYQuiEY8k90mqh4mzZhr3yzvit7rg?=
 =?us-ascii?Q?jfrv0rHY9ZNspLs/GECsfh1aGNVoPEM6zbRz24GkKrm8wA2uYeAp6HBFzBd1?=
 =?us-ascii?Q?bnbfEZ97D7akhNWxm6z1uK2+h4vIfNbbg+ssHAOIsd/X29zQmWj0AOjqbtgH?=
 =?us-ascii?Q?Fp3cdExZtnvXkyEbYAxOeU6/Rgd9sQ2h0m0Y2Yq525gvtkW/Gb3GlN+7kd8z?=
 =?us-ascii?Q?NbOIbhrCd+l7vI+d0Yd28vYkk/3Xf9xSAiQUrCScj8QdLrCoYI00mqpUR1qZ?=
 =?us-ascii?Q?5OUxFudnf5vHTRFgtDvroFR0MQS2nb17yhMlqpalZTTFfKulVOXPYnYgsYSD?=
 =?us-ascii?Q?0Lb8yfkOxUNjP8sEmzIYxsBRIXy7qH/D5w93ItLOstWQmx9hNGZSGKUXJpWE?=
 =?us-ascii?Q?86XlYNDpu5ewRwdbpou0FSgrfyFSL1GPRNAYgC1DO07UVcA5H01inl9BKzf6?=
 =?us-ascii?Q?vFkKTQEEMIcEQrrPqWbvDoVDvvyXzALNLsRlGv2FJhdGHHrbQZdl8oz3fZVB?=
 =?us-ascii?Q?xcCFWVgp2dJ+mEvDbIoE3IcsllenKUbiPsHE9/gp3wC24YzwyJydrSb7zeGP?=
 =?us-ascii?Q?mUHTAbcP6fTcETinKuiIU0eQrMU4AY8HU1NcgaXpzILfQXPMzPaNva8l+IGT?=
 =?us-ascii?Q?Ff/sHmijQtosZapqcuuG0zFzheAInqTsQkqXB146PaI+yK+tlEvmLaxIX9iQ?=
 =?us-ascii?Q?cPcBiROQTRWkFx3Hn3u3CfJqwxBAKFGa1qbVEYijnpIKPLfmXPyfLIHdBufQ?=
 =?us-ascii?Q?Z4vkM0FM0ujWEqO8HVj8F8sK34ULjErOxuacj0gcwjBScH4zuVorwYrB++IY?=
 =?us-ascii?Q?Xr54TVDJsQKgpQc74lEawFJJ4Rv+uoRjNjLU2Cssk/fFFh3JRbjJVzru4IKr?=
 =?us-ascii?Q?JPd/CDwIORkLS2YGWfGkMnNyZs75IetEYpK+eFWsuZiZT6PqvkXL+RQa5rh6?=
 =?us-ascii?Q?HEgplOKq4223s574Ulp4F/qdL9nKLqMIhA4/l4P1e/82NlXarrDSXnADJaNx?=
 =?us-ascii?Q?b9zDxRjqquUtUOgMK61QfYEXf0tt1AkyaYA5PEFO4g8xPle8HaCF9u3STmct?=
 =?us-ascii?Q?D6vVI238F/zsoGqWwItgwNL55DsXfw2vvqsr2FcHUwph88+KLBJUfzxG0onR?=
 =?us-ascii?Q?vu8BD9bEgNGQw6tVE/xUfFQw+Nv4ycXiL82I6NR6HDwSqCc60sI59ifwvNHp?=
 =?us-ascii?Q?AdgkKFYvv2TcKV631DsebxRcrYz+YgrVTtDSxbSBD/3x65B75lfwVppEdcwj?=
 =?us-ascii?Q?qB32MdSl84G8GKHJ2a3bB0EAoWuAUKR2p11y0RgRnNkMS7BsnNdL2McGME3N?=
 =?us-ascii?Q?PW+01BDy2j8YbcW5IjdGZ8E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3ce34d-32f7-4c29-a5ec-08dd5660df17
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:27:01.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Zu/4dBFfbzpxEj+RfsWlGZokY82BAsHo9GG3eHVm8q/iWXoiW06fBcMVicQuOo9l1WOe0DLx+9cRMdXwEqeB2QS8UCpSyF9nQbkiFD36Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042709_523723_D367C337 
X-CRM114-Status: GOOD (  15.87  )
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

Popular cheap PWM fans for this machine, like the ones coming in
heatsink+fan combos will not work properly at the currently defined
medium speed. Trying different pwm setting using a command

  echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1

I found:

  pwm1 value     fan rotation speed   cpu temperature     notes
  -----------------------------------------------------------------
    0            maximal              31.5 Celsius        too noisy
   40            optimal              35.2 Celsius        no noise hearable
   95            minimal
   above 95      does not rotate      55.5 Celsius
  -----------------------------------------------------------------

Thus only cpu-active-high and cpu-active-low modes are usable.
I think this is wrong.

This patch fixes cpu-active-medium settings for bpi-r3 board.

I know, the patch is not ideal as it can break pwm fan for some users.
Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
available on the market.

This patch may not be enough. Users may wants to tweak their thermal_zone0
trip points, thus tuning fan rotation speed depending on cpu temperature.
That can be done on the base of the following example:

  === example =========
  # cpu temperature below 25 Celsius degrees, no rotation
  echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
  # cpu temperature in [25..32] Celsius degrees, normal rotation speed
  echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
  # cpu temperature above 50 Celsius degrees, max rotation speed
  echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
  =====================

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

---
Changes from v1 to v2:
 * improve patch description
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..b0cc0cbdff0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -42,7 +42,7 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
 		/* cooling level (0, 1, 2) - pwm inverted */
-		cooling-levels = <255 96 0>;
+		cooling-levels = <255 40 0>;
 		pwms = <&pwm 0 10000>;
 		status = "okay";
 	};
-- 
2.47.2


