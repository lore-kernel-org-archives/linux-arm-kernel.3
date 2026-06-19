Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC39ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/+YsbJpYkrCvr0FTXF39M9vumFWlbzYSpzrCHpedgE=; b=hcMdaCtR6uaPmQW2vS8GQeOC+u
	ccandVMvK3ySKYsN3tcgzfeoSW2MMDBoHCaMfU36XUQ4ADcPo1UDCLSLb453FegQdrZPZxO7dfRvr
	w27W0JO8LTKmpT8bWV/ft1Z2yuOzK+iIzkqpcinRRKQF6ocYTgicrTFcA8FsoAp8ddbvIUIY2DG1T
	TNsynQ9GXLCqR0BlosV3M47E25icf7cjaZckdsUnXW/QsuR3ButkbLK5E1t7jCCZCwjKRWHRzMTAv
	5pD8+9m5tBXfklFlvw2JzqAA42Ut5+nYLL7i/lluHTjuogoXxc8VM73+jqL4AC998UHdkq/Bpq8fp
	Xxep+4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWN8-00000002H5r-3czK;
	Fri, 19 Jun 2026 10:22:50 +0000
Received: from mail-australiaeastazolkn19012069.outbound.protection.outlook.com ([52.103.72.69] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWN6-00000002H5A-1EmV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:22:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJTYC5aic2CFB0o/a3d7CClF9VrSZijr0evtaPe5EkmicTkbMiz+fudsmEcXt8thoe7eTgK2rUZTn8a0bUEyar8GgjIdyY4uC0gEf5Z+SiTKHZUh2kZgkMt/ScUrhPQgw41xVxs6+4L3F14ruBzDnA1Br+g4FOba1IMNLlQJKj1gqlai++SWlZFuDkU+lX8+uzqUGoIJ8mkk8Bn1gUjtSFlfxvGaeU4oyNX8G7YWGg7luMgR9B2phA8Q4fX85WuYqrvAg+1JhRj9b807CFSXa6mS37S54L6H9Ws95H8ZZzcvcTKgi+ZKEeYUsOkbyguegeStLQboo3k/6jxk0ZFAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/+YsbJpYkrCvr0FTXF39M9vumFWlbzYSpzrCHpedgE=;
 b=C+I8i42Vj0lWIBomxn3u7aQZYe1I0uq0x/erzyTuGcHw4stECoPhIpQHIuh433zeun5BIY9qiENbwnMlp+XHrpjkwR6JIx0+vO/Hgr+KDk95xpFSVT3GxnVd6pL1agu/OlFQjGbqei+sP8BTa1VScjoCFHFUds1ypeEFirXklrq1GfWOYV1OzVVZPBjvocW15edqGT4p/4MVfetMYcFzgiTgmub+QT4/u5fw9hdw5eX4ruoRZHpIyIfZMIrVV+E1NrP0VsA6KhAKFZ9ObCy63IhAmY21aFkHkVUa1axfe5sVMUQ/ObuwZHWyWpCR47wG3guVVEYWoZe458anlzlMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/+YsbJpYkrCvr0FTXF39M9vumFWlbzYSpzrCHpedgE=;
 b=bNZ5jC7oCwuCzgh9z1h04Khwtk6rLJ/ZVFiLhZSzQPoPUXs3PvmVWtouLGErjyZoID8hbb8SPQT6F10ogmke+ZnZUNSXt9ewFNap3BmfscCbeAFzc/CqqB+5dOkxIKli404+2xQXIqB2mENMRzzgiyLnT3sNlGqkp4SX7GoHPDfZgl0GPogKnSKjLL/pVoagGOywCop3n1WD7hkZKeJmUpJnRw3nib8oVj3oXdErRh2t6xOuy23mYFaFvSVKrWBaV70xjPeQR7P7FEVK9Ni0xCI0OysOv0Cxm4au3+6ZFosQ0vZMI0+6dYnmG/2mgoBYnXqyIpuj2bw4frTpR+eVAg==
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM (2603:10c6:18::488) by
 SY0P300MB1571.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2cf::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Fri, 19 Jun 2026 10:22:35 +0000
Received: from SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a]) by SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 ([fe80::4853:f60:ab7c:d57a%7]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:22:34 +0000
From: Liu Yu <f78fk@live.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liu Yu <f78fk@live.com>
Subject: [PATCH 0/2] arm: dts: xilinx: Add MYIR MYS-7Z020-V2 board support
Date: Fri, 19 Jun 2026 18:22:12 +0800
Message-ID: <SY3PPF19552C6075204B694D18A0F47206BC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:18::488)
X-Microsoft-Original-Message-ID: <20260619102214.223121-1-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY3PPF19552C607:EE_|SY0P300MB1571:EE_
X-MS-Office365-Filtering-Correlation-Id: df8b17b2-e114-4db5-adc0-08decdecadab
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CI5zB1SQEkdH9JtS1lQ/k7pIHaacUGYqQpH8+3T0yjlHwV5wdNQvSHvEozbsLpTGYdcAAx4EU0SQ6YO7aoaw67vHita/pH1pLpMakguH2G9kF92sk6FVuy5s3XHTZENL+TeoNp5SUEXXpp77J5P4cYILKGmAlrmTT1MC/PWyBWQO4FpQ1ezsKYPJwIkcnQF5zF1yfw1d4of4hL4r+2OlaSHpPqWL6MJZpuhkYtGq+7laKUWAKe2/qr4UxIUSvWnV7U91UDUbiFatWXOrlrshLPDDBnty9q+rA5zEmveubr7dAdPwwAZOOj1YcA0L9eoce0vpMJ6dSnx2wpXbKHTSzOgrv2jcQeX8jrRe//JqBi6HijP50b/XX9adECc/Bbou9Icxgz1nu9MAS5lQTUJZvTjtPY+OVZFH82dR+MAzpdzsMVbxQzvNd7E1BmFrCWilMseMjJi2E28BT0OoH/SrgEXlyBohbjyz+xDW17mq2rG1+xvpImGVOAVkWyweZPiYv9CWIRnmJHw0XMRsz8qjqbfWWP1JJ3d4M6zya7Bjnq76SgL3Yq3x7cNSh+mh8Wd2a6VLIwyujGeMR/92knSze8O8VjnS8HeovZ2Yat+r86gWG5kAzODc6jmXShv7uYBTlhquKeDhxloqUjMUGTxH7sR0kOGBHU6Kooa2mZ+i3C0SHUHk3MjkA9S5krTouL/Mxm7aQHGA1FjleuEKrBeZ0U3uYkhvtKWC4W4p6B0PZi2/Y=
X-Microsoft-Antispam: BCL:0;ARA:14566002|25031999004|15080799012|22141099003|23021999003|4140399003|19110799012|24021099003|39105399006|5072599009|8060799015|25010399006|26104999009|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DWUx07yKdV+OeCJbc9TVmeVCVT3FMgAF4ot18WIi24SeG93Amv1sTx6LC+52?=
 =?us-ascii?Q?I/lXrBAjm7BqU1PsHJXepVm/4xvGArkROTsR69x5DBr2xityuSzxMDX1Jaeq?=
 =?us-ascii?Q?RfCnUhUmaW7pbTUT+DWI+cqSyyvNMAIw5axmfNGKcKkKtY7gdHyM4KkFs30u?=
 =?us-ascii?Q?ym/UZ0rucWZWZHCv7x9QV25WDeEj2tehk8uI60slvJHTsAfHiefLU+l2v7so?=
 =?us-ascii?Q?BEBWruFWmsJfiUbm9DKBJRHQVGOccz5GIPnU+1Xz6IAbeizBPdIKVq9T5kWm?=
 =?us-ascii?Q?OjOipaN74k93czq47Ldmw0ZdxsulsGXYblwQ+zK24g+CXeehL9OXGB6F55BA?=
 =?us-ascii?Q?b/qJ/PL31dQ7ObG0sHIVGnW9D+dHAt7OC+EhenDUlgALb/p3p/5IxbfjVXZU?=
 =?us-ascii?Q?yueBwt0ZhJUvXjAG2U+t5tJRi8cbCk8tmX8WOl7dy8oj37QgKX3SHE0cEX+y?=
 =?us-ascii?Q?CXRxe0PBZxfpgcds4YK8f/h8gP7O+z5gfMd4cAZWOUcgmvuo5HN7Fm0rqrlP?=
 =?us-ascii?Q?Q9ZTRZqqqN0gupE0mxZqP8yBW8mawfUD3ShlcKZQkdaa6ROdm3DDDHhqlMKj?=
 =?us-ascii?Q?JEwaSvPINSN2Gftt51p0wfhdYHYCH0/2bNT9PkgSD4PGDpHpZbKao6XoJy7g?=
 =?us-ascii?Q?MbtCJ+kHa3erCLx39HdMHj9c1RD6PhvUt/+PB7g1NlFdRQdxwQ3r/3w8lsbq?=
 =?us-ascii?Q?sdONeB7XnzhXIWxvldXWZV3fAHlFHGr2WKEwkfDE4HUzpYh2BnWrPlMIhuL6?=
 =?us-ascii?Q?VyvW3T9wKOWDy3V+j/QH4YTzivFstr/kvhvd1uWeUdqowLb57T5ZEI/vzboE?=
 =?us-ascii?Q?MDuQ67kUulTIzCijmDK20Zql3YF0e+nYBDOlfWeEPDhoYSdF3Qrqd9mpcofm?=
 =?us-ascii?Q?eSM1cEGlPPTISwETEajnvouj8bHhrFHVdbD3kqiE2tz6joEEXvF+3mE5HPrC?=
 =?us-ascii?Q?Ejku0bzJNcq/huBx55r6Bc1c9elSI6dKEwrayErZ8Hpw2CLNifThR8GRfWGV?=
 =?us-ascii?Q?lsz/FYnhFrwzC67Z/82WZ2oA4n1eD33z+UxiL9oTIdUXzFQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4AapV2KCaRxFncZTYI0BCIutiQjC5X6EtgGxVd6xuPPydTpUmuDLNB+jDniE?=
 =?us-ascii?Q?aAj2KAmx0CIgQ0IXHh/80Yafvr0j2bEpZJiU/6wDTSWI/Zh//Ik64NEA/oNn?=
 =?us-ascii?Q?ypXhnHlWGP4z8ZaalP4MJMjIhh3LFJEz+Suna6LMKMfLcgv0GcqJ7NK1ew3V?=
 =?us-ascii?Q?kPz675yt2sJpMigUYUDMmDd0hd2MgD6SijV9wB4BJ24JARcjhhogX863Ehut?=
 =?us-ascii?Q?5hfiM1MYzegAjR9po9c6dYil/r667ZjDsMQzwZDk0HxReRBlYubrS+3d8BLi?=
 =?us-ascii?Q?liVDlLmq92kq3ZmS5edO0WWmVfg3LPEnprPaq6qWWsaShM4Dfz/gqO7RgLt6?=
 =?us-ascii?Q?wkR4bdJdr779wyZ2BqnxwJhQxs6MaoGZsd/kEZ2oEgkdclrXLt/Xs3gZYbjx?=
 =?us-ascii?Q?JWEdE4pQEwQZJK/bMdVz2YqPm6Pgtb93VepremXbxsXxVlGlT0iJXaNahZtQ?=
 =?us-ascii?Q?88eCDmom7nuKkH1lbeyNY6fmNlXiqsuM7SQNEFRVjhFUGylu2Bu/1f7815Ea?=
 =?us-ascii?Q?Op9qOeyLwkMSITh2J4th33b2R6OBXskKQMNqLTR/6WWyB2mD7aiv39wku9Dm?=
 =?us-ascii?Q?irDkAETuHyI18ksG92geV7p3oPAuXkqblN9xEQFyJc3uxRz4o/t4PA7TK2XL?=
 =?us-ascii?Q?YTOqVdAilqeYtCoW+FH3nOj3SvTCYRnF98KW36FN1OmDIZBQbvY8G6kS0WN+?=
 =?us-ascii?Q?nHbyO2A6lP988YXMh3N0U+Sc3yCmdErIaEp22yzXmLWYzxpJcv+dl6nbFU1k?=
 =?us-ascii?Q?CKheX5sUDcTHCOtJZbioDmvQDGtJT43am2QfaldJqHd42wSUGaC05jzPUD10?=
 =?us-ascii?Q?ah+9GAUY3jJygfk8FC8jDngcTW5vB/7DjNxBnMiFCH0dppiyWIsrfvIcwBVO?=
 =?us-ascii?Q?xH4NKyWyKY59ji0qWeOZZTdtAqQvjDvoHqLc51Qcr3ZjkBl6DkJ1sGQZso+l?=
 =?us-ascii?Q?TTuKnFPPNO0LbumHPeqSm/3rCzUEwwqwGvfyYIRH2wyaysMGwphqrgGlLXPd?=
 =?us-ascii?Q?XYUuleOgl4/oZR0xUBV3hMCD5a3uhTpdh3MPzX6SCXp0QVDwaUpfu5J8z3CO?=
 =?us-ascii?Q?nmtMRFMZ3EMZORlgQmPTMhZJLF2ajkfN1X5PP7ITb1sgePiDsWKOn/8f6FqC?=
 =?us-ascii?Q?I19nakj5fMFNdVREtD/0iyVTNEdTO6amdBY0+fxyqX5SYMdPqekbFAW5fQFm?=
 =?us-ascii?Q?Kdr35tGblwiKHijBL/ldjjh+j6gUIy4qiRGij0udhbF/AXNC029TQnlk5bDP?=
 =?us-ascii?Q?KQiw0PK9apDDWJn6/Om2CO0vCxhumcCW/hwDd5CVkLX7CS7xwqVpgFGfPy36?=
 =?us-ascii?Q?NHa22xvftVsPNkxCGW9BWkgXo5fuzYRR1yyoF7TxSplUA+4+nKTVK2x5VdJ/?=
 =?us-ascii?Q?+4YO9u0=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: df8b17b2-e114-4db5-adc0-08decdecadab
X-MS-Exchange-CrossTenant-AuthSource: SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:22:34.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB1571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_032248_345416_B9228E64 
X-CRM114-Status: GOOD (  10.16  )
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

This series adds basic device tree and binding documentation support
for the MYIR MYS-7Z020-V2 development board, which is based on the
Xilinx Zynq-7000 (XC7Z020) SoC.

The first patch introduces the device tree file enabling essential
hardware support such as the serial console, MicroSD, Gigabit Ethernet,
QSPI flash, and user LEDs/buttons. The second patch adds the corresponding
compatible string to the Xilinx SoC bindings documentation.

Liu Yu (2):
  dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2 board
  arm: dts: xilinx: Add support for MYIR MYS-7Z020-V2 board

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mys-7z020-v2.dts

-- 
2.43.0


