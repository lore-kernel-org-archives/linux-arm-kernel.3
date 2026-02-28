Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10125FEE4CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3m+KEqDf1bZe1ik6+L5xQS95nGu9rMfyBpB26OszPY=; b=30TAzekIyudlJZH9h9iZc7A0cr
	xvFt30D7J+ykCFS6o0nyKMxyeKGJj6r0ZDyd9V3usf5hdQujKw1crdE/lwIYM+j5N9PZwwyYh2w+i
	QNzoOVZHqmcPfGXKY/yT+EkBv7FDRiQ/lbLfTWra2dHCzigD0aCtmxhcMdx5nzqurg3r9QxW4QvGK
	ergrG4F+XusMxlLQC2HLBgP6n+paVlqc3b4HyH1gdCkvWXH4Nm5O6xdDuOXulBq5DDSZzMez3xUxo
	8va7UFSy2X8kUsYPuMXq1LsXKTh8H086Dhns3bfJ3rlrMDbBPZyIyRWnnhFQEI7vAPs3ueFBhWpeM
	hDsAO/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyI-00000009YQN-3zQS;
	Sat, 28 Feb 2026 06:38:38 +0000
Received: from mail-japanwestazon11022088.outbound.protection.outlook.com ([40.107.75.88] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDyB-00000009YNo-32MO;
	Sat, 28 Feb 2026 06:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMwQLeIsN5W/ZC6LQBKW5QVKVB637vbhvaEmkKyGqXDKWX3NsN2weBivJ2UsvZA7IYjsyRgfrCb0Sz0v+kFU+r7UnaXblKUpbhuaZzMRjG5ELIVN+CAzHn9A5uJDzbRwOcm/+oz3MyTcAzIq63AwQVgdvcHlvOfo0EMIaG5I5Qjf8Fp2kNMNTZziMot+9n9NbwdFH/mJs/gBI3xBvqFxXTNBVAlonyMA5GA2Rb6NR7qUc4rk6tVh6yfg3iMGcymp2ek0zNlO4uuAk7NsZIHvDYFvU/sVWrxVvE8ugEz5euXNHrsTP5QqzPMREed24S7MBs1lKD6/fK3ebKNWCLmUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3m+KEqDf1bZe1ik6+L5xQS95nGu9rMfyBpB26OszPY=;
 b=ssTunLg2H4+/SJl123ZFckc+jnaXG0w3xrGBJvgFB5YkWoZxwFW5CJwCy09w7AhePwQKzIr0yb2bjMzoS7gywzSGq3Ts/K9S56syQxdlAfUZ+vvIm09t0Q30t5TdBBLLJci2tWCDF03YccQ5acVeozGwX4QhI289jsyy7Z4ib+X3ifRgA2kuNltW8Bq8MWbJcSc2BPMw/iYlskA1nAIeUYi46Uvm/vhnSzo/8OZsPJJrrCjg3GIc1/duBPxqs3yKqQwfOTKQzMHT6TV1/D2TtL3b4Fu5S5FskRuJmaQ7IYU7Rk8CaEJj5EYID+b2nw7I6Bzy1kje0Zm4duSDTf/LmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEZPR03MB8441.apcprd03.prod.outlook.com (2603:1096:101:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sat, 28 Feb
 2026 06:38:22 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:38:21 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v2 0/4] arm64: dts: amlogic: meson-s4-khadas-vim1s: enable LEDs, Keys and Bluetooth
Date: Sat, 28 Feb 2026 14:37:46 +0800
Message-Id: <20260228063750.701887-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEZPR03MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: da1face1-dfa9-464a-7650-08de7693f755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: a1ndZVTi3hdvMmtK1o21dOJJJbzfwYFdmoCFT0qAwcDzrPMpoLvpmAyZjrEkkYO8eSG1gxijrLgr6U5RmAh1uKrYFsvzsZF3mWhZWzfIpKcOVBjDbi/VuUnzj7Bf/kI1lWaED0xo543KdSNYqqlD4R8GiLf4VAdo0rab6ukbm3nIfigOSh40bEBnzV5JuKlzE2JJTzJyYnIvaw1APthhlZK761V4XYdVasjzru5fi5eg9oaqCuCTj6CNgYTdCZkgzWOLYeVikUaMDCqyY63A29v0CKnH1qw+ubKlGHVT54DMb6p+1PtWx1fISFURh9iGgmD3PNZ9vBKxoh6AGYjQ+RFWOxCkif+kwcJZ4GiBkA4BBOifIi1dNjqPJnqNyEt67suz91ZghGY+oQk01vJen1xfhbabXAEfucpxbJySrFm3xPMPkCERxx1TfsvaLObmN0Qv2xF++NVr/EQBaJlB/v6CVYX1dtxtpAXPFhR1nA+oiAFvn+KG6NFCZjRxiJ+pdu9TZKenvolHAjOrSiDPbwYjQWsCaC5TW4geNEzvL14L387yCRm6E0Q9AM5YnAmRG+OFFNc+TVOALsMSQXKYc/vQa2ALy0TtiRk8RQSnwW9NcGuCCKoS23tE+C5XOkf+oYsx9jMGNaSAVeBqg75t7JnBLEwHlI48C0r9vo+8TfliagmLA97YTG+otqVU4S/cWYBZf/AT65acA8ZPTpWf/hZDDhP9Q64kFw/1l7FyCjelOzpZChp0Vk0rTRFlm9g/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZAsao2DN5DLj0neUYjMpa1NYgrT3rai2bCO7vzAF3GnnWIaDUBtYWI9x867?=
 =?us-ascii?Q?C6EWmgsF+Z1d6u1s9hgpslagHoAJdhFOwSHm7XN36LQ9IYnc9TRcoCaRTN7n?=
 =?us-ascii?Q?v/xc+IOychAdKf30KcvDRwmr9mUEPSYgIkJbsCabxlKWazST/TPvAzh8L5Hy?=
 =?us-ascii?Q?7hzoeDFIMp2FEKmPtCmYshL1Fq6maW8Z4xo+rF39UikvOXQZErv87aIjPV5r?=
 =?us-ascii?Q?iahjWLXQxxDr6n+dDXcSqAEVWs1dnWjfFdQAcRTpFTAGSUoVavMsHKhALUEP?=
 =?us-ascii?Q?igjBC3pynay27GzopKe6JmKI5v6qjMbNWgIoNbAuoFz39gkSW/6SUn4yE1QO?=
 =?us-ascii?Q?wiEnwIRUN5pim9ACGTHBwmWvqClErTa4M1gFiCH9ZLwiMMR6chTvr6ihNhAp?=
 =?us-ascii?Q?OOhhmydExG4sVtNFB4QsIrcfn2Dyn3kx+PMHV7PqmiAChTa+OZnewpec2CPB?=
 =?us-ascii?Q?qXWcAwKWfGzKAYeuuq1FaWAOQcvMbFbe2Y3aMnaGW6Bksq8/bilhpTVD+ycA?=
 =?us-ascii?Q?QAEWs6rJ8g9fe+2Cy3XUauFw+DOpNcag84xS4/39fSy3Pixd41RPAq2qjqZl?=
 =?us-ascii?Q?FhPCxv74lwJQK5yAw9mE54BvttMloZ2ZXDke1oQHtpenqf0w5e7s7oRQXTA+?=
 =?us-ascii?Q?87qQnxdnkVAh/YqppP3dn0j1thShotlKGBhK8KobW5cU+siBw+j9swHD+SVf?=
 =?us-ascii?Q?ir2L0/Ii4QrE0lxzC7QdSeyyO3qLo+m4hTfu0WTdpIvWKVUZCz69GCaHJULW?=
 =?us-ascii?Q?FAlQt8GUgatRJ8auAK7ukBYgoDuLjpDdNq92FdOo3oPh5ZKrLWtW/91QM9w5?=
 =?us-ascii?Q?vc7Dq3+unTk1I54cJeA8AT3veo0+kf4wH6Sh62sYEKO5FVyJPjVUvYK4gEtg?=
 =?us-ascii?Q?764UcDW5YIgoYMMuwqcO/+Gwn7uyfMyI8SqFltAFx2wrkKuUFLfQyLDF3tjY?=
 =?us-ascii?Q?KoZu84qbmNMgYlkouYaGc+mhw0GI+CShbQGZWIE+JtyjLVs17edYtgZfU01z?=
 =?us-ascii?Q?D0NXSn4j8yGd8dXpAQT/KnMKIJi49l6t2g+K2vdktYek2mQkYu9C9KZgq8M7?=
 =?us-ascii?Q?8grC8LUo55PtGCDM0pHQPs56nSSdKvwsgeOpbGn86LznkeUHhsVWKeqLI65m?=
 =?us-ascii?Q?21mpWPoCIjHFRaX5oMkkoWN56o8Z16mm3QtAFWzrcnV0eqwJP0KFk1l2LoCx?=
 =?us-ascii?Q?NfRBG/fQwmovpqusP0iL3YJ8WEPrie6my253wz5s95IC8+bbm6eGOTJD+0DR?=
 =?us-ascii?Q?fkg6a67sAZa1T8/5UgQTmhE4I+MFIG3gMAQCFsRi0PuwwRYOY6E53E9+/AWk?=
 =?us-ascii?Q?we9g5oMrYl77WpY+85U1ZqIqlSwUZYITnrWfmKECZUn8FXFlzb9Z9Je3a/uC?=
 =?us-ascii?Q?rHJY+Ifd0zgteilMYV0Lsk2AuGq0VuvBtNZjN5U7xDGjSXZhMHCpuLcsFrhi?=
 =?us-ascii?Q?WFrrqTag8ysaC0PYR57hHeUNiEzAm3TMiEweqakJy+8Dq85HsEmOq9IHk2iS?=
 =?us-ascii?Q?ze9NCU7TvTzSZLdNMFWvWyKJWog9lpwG/khmGn2i5fi382A6++8r0OdtwH6z?=
 =?us-ascii?Q?QlmkYuPz7Xsw2s74bNJg8tixfswvvVt4iXCX8K7j9hKf3aginx9Sjljuy+vX?=
 =?us-ascii?Q?Io4CTdn6zh/5XFPUhvSiCC8+gPIyLBfbTJppPofUgZ2OpOS9vDCnGt6orMhC?=
 =?us-ascii?Q?jjJTfHVNUptVJmxFV75ELnDMUppDTFlDGrLFl8TyA7zaQaD0?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1face1-dfa9-464a-7650-08de7693f755
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:38:21.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuORfSWpjM8h5gtsNvS+s1Pz6LvyljPSHaFAs21C00pjv3lc3jVZYw1T8d0+QQqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223831_786502_5A531575 
X-CRM114-Status: UNSURE (   6.76  )
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

This series enables various user interfaces and the Bluetooth module
for the Khadas VIM1S board (Amlogic S905Y4).

This builds upon the existing board support to fully enable the
user-facing peripherals.

Changes in v2:
- Dropped the SARADC and Function Key patches from this series. As
  suggested by Martin Blumenstingl, a dedicated compatible string and
  driver update for the S4 SARADC will be submitted in a separate series
  to ensure forward compatibility.
- Patch 1: Split the UART_A pinctrl definitions in meson-s4.dtsi into
  separate rx/tx and rts/cts groups to keep the SoC dtsi generic
  (Martin Blumenstingl).
- Patch 2: Assigned the UART_A pinctrl groups directly in the board dts.
- Added Martin's 'Reviewed-by' tags to Patches 2, 3, and 4.
- Link to v1: https://lore.kernel.org/linux-amlogic/20260123022258.136448-1-nick@khadas.com/

Nick Xie (4):
  arm64: dts: amlogic: meson-s4: add UART_A node
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key
    support

 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 46 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 26 +++++++++++
 2 files changed, 72 insertions(+)

-- 
2.34.1


