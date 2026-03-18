Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7E71088E50
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=; b=R2IsLFTt4+Sx9sDaXhHvd0aAoP
	yizi7hsovcZ8JK0HA0TEdayMXn0jrMElWGENFuOiscaMAv49ZSKb/2zfbA+u6FDQ3j+MmNuDmgufo
	yTukkyibEBwh3sLu1+kcGxhUy0TXBc9oj32uRdA7lE318x22RpvUH2Z1w9GkCazTADcti0kHYa08U
	bkyYGS7pbeobq7IwJUrP8zako2NGHW0pd9HBpLgalbpQP8+LvFEpSCOYue5mHZsjMBzjFtbAKpE3Z
	8p8lIHtH48m7YT8nrYoNEAy/6Gn8bA9v3J+9pKIr2ALQW0aOy7NY9SV+EUaYajDySe9tCJ1QXRCFk
	CWKKVJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zw8-00000009Sdz-1DPI;
	Wed, 18 Mar 2026 23:04:24 +0000
Received: from mail-westeuropeazon11013067.outbound.protection.outlook.com ([52.101.72.67] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zw5-00000009Sdf-3Nhc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 23:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgUhLKwdap+gIjyQg//doplfAanPw71n/c5spBMW93nyZtrk7olzpRBDXjbQIfW6cJFvQWtMXYBCCpDhpxohvF+INSpvsvdCsfKNnhiNnEZ68y5HU5wgHOe25OXlFJtKnw57pwJz2FFvTjYVBYv3Awzri81ys5GJLpexvEzzQ7raB/++9z8nEqt6qERjPm862mtMNyMsefPu0SMsjlMr3Djw4GOTCw5v3JbUKJGdD0N7mtnc94k0O3OFgzfGKitUjrtNJpGdHySwwlbm3SvHSx+cn57vfO2mRf8j3EzrnHT7PDCl27jSDyfJvwCWRy6+blTHeOcdwGK/vzh9R9YhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=;
 b=boMLH8rdEspf14vnYFjY5TKB9dRRzftDYuQbT7DDqLr59VYDV+AmaCB/nuk/YP2+Ws/iTwZA+W3g6UC0UujLwN5QYP/g7R0BgGnPtBTTNd1sYHYZGX0wRyOgeTsos2pC83Wsra0R0EGqREXULNYa46mlrcMhofV6EWfsIMLnD0RXzgzfHVBCbZM1A6CofO7QU5MTJ3n35ecXukh8hJocqu+Vm2zjPY7vlZi11TqPyjmdJ0bTZt0IxVjRrbhhqbgA7tYDox99LNGDm3igx2fsqRvscaYVu9Zm8G5rY3qP4+mjkz2dKrOsR8kgkK3L4KU7HwwSb0wGVJFpTSOLk+QhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfOefK5wKm7ZM9Etcltk1NT0HaI+0zwm+NTuJQdhIKM=;
 b=dM2LXGG0TSUESy2f17RbsDXHax5OFNxpkQFEPr7uSgG4R5nuPRhRUV2RGMGdxZnAJAcSqgUQY1O2KyM+43e9BAsn54udvQLx4QKZ+V8hb9slcgh8st/an4SpBHHGf4uc67u4fSyMIGAzsYiSJXJInHX8RcvPWoOwelB+t4kjNl9CiDgS0qAUH0+qBQkWZZhbwAOQZfqqSbD+eL/jfML8w9U2QzUjjA/L85eWaTVU9oen+0LUmGOryp6O7vLWVTj55cCW8sZkD0+Tqej9QCPlIuQQvEudUL+rruV+OYycXRtUfUyjhwX26YNBjf1nkFk0evYugt2CdMtMfIOE7yrQZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7354.eurprd04.prod.outlook.com (2603:10a6:102:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 23:04:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 23:04:16 +0000
Date: Wed, 18 Mar 2026 19:04:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fd94b5-d176-4ff3-36e1-08de8542ad9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: hOmva4qPDeOQ6gaY7Tb84sj/AVO9lRXUMHCvdivZ3Lohjh2+JtOsZz2JRC6fQVf6IzcpNcyR5DSOsIHgddR/jldKEeSYnN88+iqBvEjMKKuY8oY5fYAoFuH5jzU6KClRQHuMzT/a6wyP/9HVi6HczrocxPYXZn26ARkCuaKFyb4k9XVw3sicotrZYBRnq1n/oWMZ1LPy2ns0IvE6dm7YnagjbuL9203SZkW/mRJF2bQB8djRGFlAbSeu69Q2wkW+/nNKsZub+HiD58C9otnXBAF+edu3FxnvoPkia1jsoeSfeSVGWRlyFfDojmXI0+7TQr80W5Q17/okgbONyaFDZoOq3sRPdKel3ttRRuTVhn8TeTo2aJdC+wE805s+xBZXKgjLlyLuMJcVjhFcSO/lSV+TrhdM54DYAoAJxKO2UEqjvxSHbaWvSPm9UCTrnctlT42kJDiWB+FkAD3SSUTpV6l8VJ5gA1BXZ/o6ymywKwIVdUULuDcbHYtWyFLZ0h9DrnSir2IDi+IImU+RIOxrcuuWeZ9FX2aj9WuZLPu3CV5lQSDaDOqq2lOox9FD9HPDyGJi7AbTi0G20VnW2bu+CtRn71sxdFBxFkyxTi7c02aEJeOU9ykYJOh03+sw/1/Hwl9P8NIBCHWrSnBRMap2LiNYZKxcoQw9RJcYq37A3e3JF7qwg4qqdOwR/AI757XzNCuFtJ6TxXCErvme1I2bgqUI7+eevypTfVfD+PG1QgAUh5/sUhqTcqqeBLJBGe5nEmnqxzdUO6+BSnto9hOxMCgUlPLl2pwi56rLDqpMP5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJhU2dEcGVCaWpRZkRnb1JCTmszOUVZTHhhT3dzbmxNS3BvNEU3OXVpdDNR?=
 =?utf-8?B?LzhqZ0R2UTd2cnl1ZFdyejhZNkFqaGZHN1psNFloOGlmaWZOcWc1TFo5bEk3?=
 =?utf-8?B?SXdCNnlYT3FVMlNUT01ETitRWjJPdGdxSVpKOERsSXBZVUVyaXhFa01oVjdP?=
 =?utf-8?B?YUVFL0dPeld0S2hpaVB4M1VCU3NRbnNjUlBKZDVtclVRbUZucVllUEpuMXRZ?=
 =?utf-8?B?WS9WR1RPOUpVR3VGd0t0RDdvczVRSUE4M2xTT2tmU0JIWnlaSnJjL0tJZmJp?=
 =?utf-8?B?bFoyM2UxaHVOb2ljeG1JbTl0ZkFGSmtETFl3a0tsbXdrNjljZFlscktyL2xo?=
 =?utf-8?B?MnhvWk9ad3FhZ0hDbHUzTWQ1Rm41blNLQmJnMjUxaThmcGk0SnFac05XdVhV?=
 =?utf-8?B?OEZEd2dBVmRtQklBUVpNYWdnNW5wZzljdGMrZzgwRFhnZUlMV3lHVnVyRTJZ?=
 =?utf-8?B?T3VPaUxLSWw1cmNsRUJpa1lXSnh1THFIWGtxdzlRcStibEZZUm1acEJFNjQ3?=
 =?utf-8?B?MUc3VlM5T3dBTVVQaW5MMnNGRFQzNVZ6N3drNmNweFJnRDJOOGNFaktqU0R2?=
 =?utf-8?B?dWcxQ01XcDR0cDc4eDhxbFFCdlcvSzB6MUhYa2ZINS8yVDRSTFVaU1k4WEsr?=
 =?utf-8?B?Z3kwUitCeFQ1Q0tHMVptOUR6dlArVmp5bG00c1k4eHExNHdKRmszNGd0VC9l?=
 =?utf-8?B?VWxvMGQ2MCtnWEVwWU50TU1xek1HZ3lualBwVDRVa2owa0lOMTA5L2F0SExP?=
 =?utf-8?B?RWM5akJOZ0xJTU5QVTJMc2NJSFhCU05uZXJwOUpSZVVSaEI5a2Z3c012WHF5?=
 =?utf-8?B?WEFEOGlDdzNoL3c3V0MvZ0MwMjZVRGJ5SHhsVE1zR0piSERFclZyR0RIUzBy?=
 =?utf-8?B?clpxQ1lwZllsZ1Q2dS9LeFdJV2ZHZXgzcWVGN0pweCt4TnZBdkMxTWhOdTJC?=
 =?utf-8?B?d2VBalFBYU11NVh1RFVpZ3o4QzJQUUEvZklQQkNETE13eFhXL1k2ZnNFU2NB?=
 =?utf-8?B?OXhlbGhVWVJPY3YwZ1JMUjNtd2hXUFJsc2s2QTh6QWkzakV5cHJQTHM0REFx?=
 =?utf-8?B?azVUa29WM1BnZyt0VVduNWt0b2IrMmtUQWZBaCsyd01LeThzcVFSSElaRlhS?=
 =?utf-8?B?Z0xDcWx2VXZjNTVueGhOekVveGRIVDZ2QUd4WU82N3JoekU0dlEzWHpxd3Fo?=
 =?utf-8?B?d0dQODFuMnpjWiswU205blFuOVpkck1OOXRVS25XQXRmTG0wdnRpOHBMN1Qx?=
 =?utf-8?B?WW9UaE8zMXQ5WHZMd2hwTVBqYUxwNEtqYlhMS0xQS1Rjb2ppWWcyc0ZVZHNO?=
 =?utf-8?B?MStCZGdlS3dqSGdNR3VPbUVaL0FUS3lRWGRMc05KVkM4Mjh3TGc0ODRWcGJm?=
 =?utf-8?B?YkkyWUE0QmtlMjd6MGtqeG02aHdZWU9CdFVWenBUTlRuT3FETWpqVDlJTk9C?=
 =?utf-8?B?ZDQrMkUxTU1ZNGVvYmUzUXZvcGpndU5Pd29tYStGSGZHdDBIdlNDWmhNWi9G?=
 =?utf-8?B?U1pzOFFYWHlObGl0N3ZDb3VWWWhrb25wT1VHWHZDc2psUUIwOWRPUzJhQ0lI?=
 =?utf-8?B?K0lLWWg3QlRLMTRPR09QS09xakRiUlNGQWV0NEM4RGxuYzNzNmhYR3FzYVBx?=
 =?utf-8?B?cGwxdmlmdTYxeUswYlF0SDA4K2JFM3ZDQ1l2Zm9SRVR4K3VWV3k2WmJBQ3VD?=
 =?utf-8?B?ajNlTk1RdVJCNWFpR0h6WCtWK05mVWRkYmxRYXltNTBvcFJ6MkppdktkTk5Q?=
 =?utf-8?B?STg1UWJCay84OHVMR0NZdktid0V3WmEwTHdlNFBTU2NVT3E0c21UQmtxNEtx?=
 =?utf-8?B?ajZ5UDR3YW80SjRrZWMvZzZuKzJ1Y3krRnpsVDMzcVUycE9iRUN1T2tkTk1O?=
 =?utf-8?B?ZDNzbFgyNTFKb1JmS1RmR2VHa2Vja2VrRGZqZWVJR2loTldGR2FIYVQxRjhB?=
 =?utf-8?B?Zi9UblZxb0ZyVUc1OVVYbUkrSkV2ODZpdU9aMUN5bmNVSmdnN1grS1ozVnlQ?=
 =?utf-8?B?bW9XWHNERXVGVVVuNFM1YUJwSUErR0xnajN4Uzl5a2p5ODB0MTFHNHRoeGM3?=
 =?utf-8?B?UVlCajBSbTlEbHE5UXZDU1MyeWh2NDcrNDRPSTQwWkdhdkFqUDRZOHJ3NDUv?=
 =?utf-8?B?NHBmN1pZdHk4amdGVmFBMjNlU1VQT1dDZUcxeTNrWGlQckxwaW4xdzQwM0tx?=
 =?utf-8?B?SW9sZW53S0VmQUJlZkFsVmtkVEMySkhmTFRRd3IrWXgyQlB2SEwrRkRESnpq?=
 =?utf-8?B?UDI3SmJZR3NqdHNFSGV5emVDMk94ZTdUY2d4MzhmNnNldGRqRzVCWkVLSDNG?=
 =?utf-8?B?L2J3dFhDYTRFQlhQdk8xc1FpRm5uWlFGZzcvaGZMMXVnQnZ0S3Bjdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fd94b5-d176-4ff3-36e1-08de8542ad9a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 23:04:16.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuDn8giKDBAV0usoLC95jc4ZwEmVcTrrPqP45CO1Oe35bFRoMJg4jS6M6Us1ai3cvBCeNBbZq+/HPxzpy96U/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160421_867461_A9E7EBB4 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 8:08 PM Frank Li <Frank.Li@nxp.com> wrote:
>
> > Introduce __pinctrl_generic_pins_function_dt_node_to_map() to allow
> > passing private data and skip_npins to pinmux_generic_add_function().
> >
> > The 'skip_npins' to skip parse pins in dts because on boards MUX control
> > chip switch the whole group together, so needn't handle each pins.
> >
> > Keep pinctrl_generic_pins_function_dt_node_to_map() as a wrapper
> > calling the new helper with a NULL argument to preserve backward
> > compatibility.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Ad attested by several reviews, the pinctrl subsystem maintainer
> strongly dislikes any use of __double_underscore_function_names().
>
> The reason I dislike it is because it is ambiguous.
>
> For example there are __compiler_intrinsics such as
> __iomem and all the stuff from <linux/compiler_types.h>.
>
> Then there are __non_atomics such as __set_bit().
>
> This means __inner_function() just adds to this mess and creates
> a big confusion for the mind.
>
> That said: in this case you're just adding a parameter, just add
> the parameter and change all of the in-tree users to pass false
> or whatever you need, these is just one (1) in-tree user anyway.

pinctrl_generic_pins_function_dt_node_to_map() directly feed to
.dt_node_to_map() callback, add parameter will impact too much.

If don't like __funciton_name(), can we use
pinctrl_generic_pins_function_dt_node_to_map_ext() or other name

Frank

>
> Yours,
> Linus Walleij

