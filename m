Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E19ED3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+6Kz6BptYm8Ytsr18PTi7yuk2FKfEirwl2BdX48T4/o=; b=A558OLsJaLUL6AmkxmctZPrbzv
	J4+CtJifdCLLNJuejfKazYOdOCL+CEx3I/q+Z7CebfvPsYUiQP0hRe2o59XxWBzOcZQF+77ID5alY
	YF4Tz36saw2pcdArjYER+enUKgaCZK1NU4058q3jdjUK/+0TnP4Y2CaSmSeWfL8GliG4h+7x2Dqz1
	zTGXzEb8uJh5ZBrSYVUvXjz5fu3+LuI8SVRwwlStxPlzUZSRqHRkyR572Ve+HdLmP17a6OJelTjGs
	WFcfZ9u2WUPJJHTpu0SGQzyAP141VHuY6XBETt9nVi9aZvnxpp284Mz/vI9ZmsSlEQKBWW+bJZh/a
	aNgOECJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDc6-0000000BcNn-2bwc;
	Thu, 15 Jan 2026 03:01:34 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDc4-0000000BcNA-165Z;
	Thu, 15 Jan 2026 03:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTbz5P7qx0//G7dzTZaPtpuOOWUYIskkO+sIGRnIs8UP4X+bYkNwwKHkzf7VRH78OkyASpGeZc59N2FW1QxUtlXUqaaMjlFV3x5qAsFldMvwkaE6+lMfJrrgLCyXe13m32dHB3TCJtq8kiegBRxzLxR5vlRXhEsvnZuKgbJjwf2YLKjtJ64urD9P2gUJE9OVlQaJw5bBiXnyOz35awE86r2KIJRU5hQnk5k5WlFb0/EJ2A7YRs0aM7UBou2AbZzfxNWN7MNXYfRiD8aA91lsgD/z4r0ReDvUm6C2jRDpRcYnNcaCU+VHsZRxHS8tNU5Lhdxn4sA7PYiVF8AQS6E+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Kz6BptYm8Ytsr18PTi7yuk2FKfEirwl2BdX48T4/o=;
 b=auzZpw9pUtQ8IHbt4tfS8hGkuSq2AHu/kOg/fG8N+MdnlkhpvbsjHd169F2oFhMnMmY70SpF2fiK9hJ2f8wkmimIxGliuPi3Uoqo8eUyfHNHl00U3LShEG2bXLWE70HlrvP/7QP2t0Qahtl8N4EnD+f+Z1az98xvP+PBzD49T2zC9TlXtRdM/ApVH4eGadbosPw0mr6345PyzPwdqXPisYCfsmyqXY2Kt16JbCvoW01ObZG6ysVov8mCtgrivM3CSD0o41JWusCEDtGYo+4zVvjqL9ef5A5xgcJTerPYmCBWYO4yvzCNRobrUS98s1HDhGBy7YQP5xLLu0LxZPOB7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB8614.apcprd03.prod.outlook.com (2603:1096:405:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:01:18 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 03:01:18 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@xieqinick.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v3 0/3] arm64: dts: meson-s4: add support for Khadas VIM1S
Date: Thu, 15 Jan 2026 11:00:12 +0800
Message-Id: <20260115030015.1334517-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: eb89d63f-bf37-4818-046e-08de53e25a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zAXsM0wgvb+dSwTY7HtAcJlPyXE9wBe4SQkw8M5VHJZ5H9VTEWG2xvw5EH/B?=
 =?us-ascii?Q?/skyOsnRn3FakUnubC9+JVkqvcAxT14LAdFsWmYTHIWjmRBSsb2b+hPY4EZK?=
 =?us-ascii?Q?iBldaTGM+dOB9u3g6/xLPt3M8b1GEqON9I2LMQSpUDS3/YK8UVJEFnWEm2o9?=
 =?us-ascii?Q?TAQrlLY19znvD2xkJgMtcnTXZan2DWFhvfegNiKDgkNPwu+IE/gquce0eivI?=
 =?us-ascii?Q?KhWlzT4F4FBvHSz9LAuzhhpcu4BKXuuzaIuKuCrm18DsGsILoDffVHZ7gQH8?=
 =?us-ascii?Q?9ZAx6ItXDbhmV/negL7ZJYkUQFCeeEJJa8EZGdaeM0SGoc6yDC30jKRxSng0?=
 =?us-ascii?Q?1jwe5sgqYCGUAUuEpDEMtJZJN6NSX6uSfFdni61Bn7+qSpDKFanZFwMCKrfF?=
 =?us-ascii?Q?+cqTVs5NHyTiufAgoNc2u5NMM/hMSl/4tZFPS1tuxPRHQHAXR2G5fh8kwl+S?=
 =?us-ascii?Q?kD4CugupyEHY09IKSP/7n5m8tl75MXCgzGVWJzHZmcuqWawnFiE1sX8SFYNv?=
 =?us-ascii?Q?kUtwVEFf6SsM904fBP86kwrRy4rR+4VFeJm9W9fl+wArfcu+kFEmwOdr5vq7?=
 =?us-ascii?Q?Vh9GdBPh0BVajagUrLmwDWTONAGlYJsj/pjvPIHUgPz27htJkIBe3WqhabWr?=
 =?us-ascii?Q?IUdc8tS9dFCDDspQ5LQVXZhNpTjUJVpYPpg0IC0trr35pbNwUTaY6ythvqDb?=
 =?us-ascii?Q?V34lGrnwXrCAMEZcr9kcKU+tsxGlBhXd7wE9XRhFnmNQCUt+3qaQtQSib93M?=
 =?us-ascii?Q?5RTGK5CLHLwGxKTD2kbZqs/3XmmmKvMEX+Puo9v78BfTE+5zduVbDftUnGJ+?=
 =?us-ascii?Q?zJCoQ68osTvvD/i4xWT2kXSK2HOWssnt7rhV6ucWq3pu9tHns/7bW1OTNQfC?=
 =?us-ascii?Q?dTQrqyL5aPP8WZGjvGsjo0MIpnZa65QT4SAo6BkIKbV/xCgRBubjjCXbvRCr?=
 =?us-ascii?Q?hpEL42dSRIAemzzcQisC1lTcd20pUzUzk5Y/VZZC8LwvQDcJUNAFeM2x81X3?=
 =?us-ascii?Q?5DQlszMHQvkAMZm8Z6npGic8q1FOik39VjXGwo03/ToRK5lMehSY653pi8Be?=
 =?us-ascii?Q?ivgt5JGF5Ivwx5egiaVgHONH1eG6mIS/wZ7Y5/XOfErwgUuBvx9fv8+j197p?=
 =?us-ascii?Q?/2V5N2VmjCjjxB7bCR3C9NmH+5x57CWfU3UQahjO7B5ghGiDy+sMt+yQkxqy?=
 =?us-ascii?Q?6ce3FwhoYMyZ893b+C1ec4AfjpCPc03OpKsrg1PLNM5Up9upeRchC2kOJKdB?=
 =?us-ascii?Q?XWbCw54j4JLT226v6vAektP+LgerHbtH/cCptStp2CXDSddsO2tGxh7zVJIP?=
 =?us-ascii?Q?la95DKMUjnuyqrdLsvIcme1HRH0BDmUsG3Rgh/J7HUC9NAclSBP+ipuf9JMD?=
 =?us-ascii?Q?cfN1MC1FcYI6ZMqpxOYSBDdwz+qaw5czYURYm5JVoHMThWoMHwJKUCxJ5Lf6?=
 =?us-ascii?Q?aL1rVQJGfEijwet0FtjMsqy/05V7S04yWTX7DTZokemkLXlZWs6uk3nZZ9O2?=
 =?us-ascii?Q?cv1VPKqSRnPmfYP592ivNrwoEAJvzRM08vlEKGhPyFFk/qEjooqMMusqjLv9?=
 =?us-ascii?Q?aBjqCY8n5eoTiE08S11sz6BFzzbchqy7Z0zRKPgYn81i+FvpqB1jLSo/oEmd?=
 =?us-ascii?Q?ODUxlg28oI7WPRW+afoB2Pc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sl6tz/G6bFJTyzTmsDFfaC87wTrOrNGz1PgRtamSACWkidakwkV0ex19S9GA?=
 =?us-ascii?Q?VKtce/RXQBQmUAmL4/D3jZmSfaB9KoJ5rB7pvG+PPVTh+4EIJOFQYuCELsFn?=
 =?us-ascii?Q?kLDHXoHsUfA47mwg7I13o6Xct5yGXgpAVH3/3Jqoh2+KhFcWIU1wrvFui6fk?=
 =?us-ascii?Q?mBWmkdFcVDetK7+Bg4fqB6akfxX9bSpAaKWJKhFBn0W1d9qfHJcPFm0aAU24?=
 =?us-ascii?Q?YpObh4zQwJwhS7mH+MUDQx6ChExXzYhuu7/iOFhKouPgSg/zIaQBlaN+AFfV?=
 =?us-ascii?Q?V02FssQTsx68CZ+rMSvvjEeo4gjJk7BI93t+SyOBpbnwEJsAFPcTqbHrJ50e?=
 =?us-ascii?Q?rhmkL41GA1CoH84X/pc2WeWfiUil/WpWizztHw5CI5Mmb4zX7n1yZec0zjYp?=
 =?us-ascii?Q?wuTJ43qWNwatico8LyL+EGhhJFCf6khA2iPxM2D6Ogf+i1yG2/E8R/2fkdkf?=
 =?us-ascii?Q?Dnpd6xyLCS7HDmmnJYwZ3QK+lwJpL60IZWsb1myFOB803agyH5Z0OwZhVhyo?=
 =?us-ascii?Q?enA05GMWNoj4+LWlGB4JRqwDZqqB40abDAfV/oOEtrPAj1a2pjPx4uCY9Zqy?=
 =?us-ascii?Q?APf+8XyCwjeALxMlFSt5b5gWENXengOqQZ5SidKCRpyrrkMaoX+tQYI/+MKe?=
 =?us-ascii?Q?Wloaq6/vWgDQ826AOgUqhdNcMzCAqWHQ7f5l/U/6IDMB0JHZMIvuObbdNAPu?=
 =?us-ascii?Q?Mxu/eJdxY7wPqdTC3ofkpBObrJcFvzvmlRsyLg8hPlaBUWubCK4BStTHdW02?=
 =?us-ascii?Q?+NlFtzBenxHgAptKyvjShydwclQ6AszSCtxTQk6y+AfU4DZvPY4wUNV/3Q61?=
 =?us-ascii?Q?vRZM1AYyzsSLz0y93GDkdsbz8YIUJmB6ViPKAbIvoPHGEwGUT7JCW3xKLkxt?=
 =?us-ascii?Q?LgKlJD0lPEMtFuZWAsxULqdgssX6YxxWKNp3NvanyN4smtg/HL7YknUBGk+Y?=
 =?us-ascii?Q?rWhyb7NiCVAMmj5LlzPk8TX1eHrW1yAgRwKbA3qZaknl2tVmF7QKJfoOzTRv?=
 =?us-ascii?Q?CuZ81iRJqdMY6708LUYMcVM1g3DzBYRQfBIrKHwmhh8BxRZC2FQc2479QGuM?=
 =?us-ascii?Q?tVVRLtLghl9caazAwpPraCdTDBLArZxVQkASUPHLu7ellmD5r8zdlBClwxlb?=
 =?us-ascii?Q?udJYmm5sGrpu6ifPbbsafRWUc/9hFu0KMfrZicLblzxhP/b8JuVFPW0z1y0n?=
 =?us-ascii?Q?aGxQHaSyw+4dWX+JXAASlH3oQfCEK27xvQu41xwQNPr30WGlJ/Ib4FazWjMF?=
 =?us-ascii?Q?zsqpcW08EgcloEGXHSrbyrpo4f3n0LdgOYM3nwM7ALd2dlIxZSde2c7kq1kW?=
 =?us-ascii?Q?2kXqy4K6mOVme2ojY0L3b46x3QagDIba2vXzcBzq1PU23ruyvc9C9HaZzRUe?=
 =?us-ascii?Q?AfKfFAvzgPTnF/3kNmGn0IkxaMgJVxQZLVFHWN7DKvif5481RZoXipxxlBND?=
 =?us-ascii?Q?wnGZCSm4+K55ZGezyucNKj7tLIazeIQjtopKnycSXYK8H5ZcIxRM8o6ZYro/?=
 =?us-ascii?Q?Pm4rHrL09AK5T5lOBS7vLTFlr5++nlQytvZeww8ZJkYjScpPNBMZKcIr+pmV?=
 =?us-ascii?Q?zD5tm/XAb4EICt8lql6jM+uUShK63/8xQnftXfhuX/Dp6bMHsS3yhlH3YoSe?=
 =?us-ascii?Q?5ZBLkjta09+OUcVW6TU8L+/oLt30lI9XJY2dAvnX+62OKKpufyBiI2iYmvPs?=
 =?us-ascii?Q?ahVEusIwSbKrtpnUDLwLd4y5ZP9EOMZYE/ixju/4DmPC1QQM?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb89d63f-bf37-4818-046e-08de53e25a6b
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:01:17.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DT0dpdNy7y84vhL660qRubTMtpjUkuvLIyZvXOCogbJqPf8EEyUHPj035NYCh1k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_190132_329761_F343D94C 
X-CRM114-Status: UNSURE (   9.95  )
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

This series adds initial support for the Khadas VIM1S single board computer.

The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100M Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

Changes in v3:
- Split the patch series to properly distinguish between S805X2 and
  S905Y4 SoCs in dt-bindings and compatible strings.
- Patch 1: Updated bindings to use specific compatibles (s805x2/s905y4)
  instead of just generic s4.
- Patch 2: (New) Updated existing AQ222 dts to use the new s805x2 compatible.
- Patch 3: Updated compatible string to use s905y4.
- Fixed Author/SoB mismatch in all patches.
- Link to v2: https://lore.kernel.org/linux-amlogic/20260114062549.68954-1-nick@khadas.com/

Changes in v2:
- dts: fixed dtbs_check warning: removed unsupported 'enable-active-low' property
  from regulator-sd-3v3 node
- Link to v1: https://lore.kernel.org/linux-amlogic/20260113090951.35928-1-nick@khadas.com/

Nick Xie (3):
  dt-bindings: arm: amlogic: introduce specific compatibles for S4
    family
  arm64: dts: meson-s4-aq222: update compatible string with s805x2
  arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree

 .../devicetree/bindings/arm/amlogic.yaml      |   8 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   2 +-
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 4 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

-- 
2.34.1


