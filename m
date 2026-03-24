Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94304FEC0FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Clh6eWNUZXN9C5PW6eYqSxfprgiBL92NdEwI7gy9Oo=; b=b1f+DUwm2BHvjIkREUjKJF0JmF
	T9jrZg+dxYZn3MpTT4U1nQMFxPVk9MtUKocu7/3XqK7UhRpbhAiZwR6fOXAXiy88mmkPwKLYoMNY9
	/s82BjXSxulrKeemzcDZucdlphfE7VWF7wsMb3+JyNTBmEYdIeaHmNMIVxiH6MQDpNzIAhXaF/65x
	HsyTWHGhlgGEMXrd9TeJltG1nOMwagjTy+B3PABpHttZ0ZqDMe71SX0kJqaD1v9oZaeuheDS3JbSG
	ra4Ats7uox3Q1ldJ7l9KMQb6cckv/RslAESR3e59gczzFRlr+hsYz5gHYOsoQII7ibymwoiph59c+
	toxl1xbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57k5-00000002AiV-23qw;
	Tue, 24 Mar 2026 19:48:45 +0000
Received: from mail-swedencentralazon11013001.outbound.protection.outlook.com ([52.101.83.1] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57k3-00000002Ai9-0a5U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCVHlpq6ymFsE0gFsehXkKnnbyM0kiWhMCG7k7jOJOqIl5CwzuqtDDSPoIjpLsTFdX9T/l7UikMQPevIzubDYY+25cJQRAYme9z6nmlAiDapro6m56Pjbmr8LHkhGf37jpnlrdfADAVGwSJ52ehG1oOJa5ChVcm5QOWOYQfXzqIkF7lBLja6tB8SOZkhTWFsbbzOUS5+6VhvPVXXLtRUrs/PSIWAixp0+mJXvF8J5QTDzpI3bR1LpzLli6xn5loPKJuaHZZ5hCf3Qp077DCtZFbItvo7HIaSV8JqyFKL5I38Rou1LMpWe6Uqu9iGnG1iV5RgNxqTTjsmlcHg9fgf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Clh6eWNUZXN9C5PW6eYqSxfprgiBL92NdEwI7gy9Oo=;
 b=l+5p7ZiiwRfcdV38yDHlQUNqZ+iEJ4dxzVh2Kj0XveziMlMPbA6/cIwkq+D3NfDcrBKnsl8MQi4u0eeu1YADej5rrDYJdDiGe6YnzdvIUc5M29my2LlkllbtlQjbOnbem70jT5muLYxQUhL1hjr0lgWEpXLft9D/FeXJo4X+hzzL2C6cW7AvvuBqytOkpP8e8YUoyfgomWeSwsXatZ92rdvBKIOiSIebeQNfUKZTdR0ncpOXsqul4MP8uh3Xtn8vnqpALPNydVs4KNFwQLAPesPoRi0x9+j0EteGMHsGJRS/6rWHF8BUMUwHoyU1PqFKCQQkndGZfd1OdpYZcb+92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Clh6eWNUZXN9C5PW6eYqSxfprgiBL92NdEwI7gy9Oo=;
 b=Mt4rL7xvAAyQvZMB3t8CI42bGxQBCSv8fVKL/DarVSqsn4OnI/2byNDQ3Fa7hH5Vp5lhkdosiFNBtDAEnxOhqfipEIqU8W0dKp+WjKsOBj6w52vE2uAXQJSLqE+wKCgJK89IUGFgQawG+uUhzq6THY3UI/awsAUvi18jdmp7gUKlFMVUYkPfH6P7JTQpqi6SjKOwzGDjOuwK4/wXaNNMEPbJNjSspZ/r9ULWKOrTd/v1mTrx1ey0/X6g8dLoa1KkXJ7Seep4nXIgmW7NRoxPf1c/rHoWTtviGONwYxy28iilBbwfKP5bWofdz2d+57uC+2BusP7DOQGAz6Tn4hu3mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7801.eurprd04.prod.outlook.com (2603:10a6:10:1eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:48:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 19:48:29 +0000
Date: Tue, 24 Mar 2026 15:48:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:510:324::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca5207b-29d3-4fd7-97ce-08de89de5254
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: skUq+4qvvSEr5HdE5QN/TuHYxb2aTEpHfa7XSguwAxZdkwgSifeIqkSbZHjhUXOJAuH+MSyBLLDU/9Yw0Mq1KmBaUjvzIGJYtDGUheKiO+Rji/Wv+IuP0ORipPFHVPrjgFSqED82uMZao7qFvB5pEdWgUk8skI0LxcMNHIPfjSx6QH2UN7nOk1SeNnRbouHlpFoZhkThWsk5MTp+Tnx/Tx/uGDtcNb8n5ma4uPDWkMDMcwEfSwtfTIAeTAbqPC6CzOJgFCd88LfldK22uEzr/Myz0NcxZwaZ747PUq/pS9/GOghmKUqfCr884Qcp9VUj8m5+ms6sUO6k1/IVjTJIMahHss1qZ0mxcfvN8/Hdjho8x9sRSP6kUDtub++q7E1iBxFCpmXbwKZ7npW3e1BwdlyWHpdZ1nG/9wX5lspPHJK43+YAcPujKxNii0PlTvbOPzfnMvl7M6U6Ye+C3YksvqJ5mBR77R8Rku0z7sGOC4Sz6B6xXZHs7qjOeB6worrH+dtmc0aUfHMkJ57H9dr04/GUAgBUtrKu/rGTV1sRtZ+UN93p2qVtJalpV1paFmOKPsztwSK1t2L94w4PsMgqp5iyfyBZaWT7KHVeq3Z7U6Pn2ESqGME1J2+uqWJel5VWPlp9ofAQc//wdl059lgOZWeVdH8UagU0q1aLlMMXn61saS76O53LgdOk/DGcSSQrtxQM5ulLw1U76jJTR48oIbJKgvoEPRFiyrOp51O9phRGCBJS1aAdGa7DTumg+T0aa+PKS7kOc1nQwWH2JNBC5TwiYTOPOtNwaDdLJ3QW3Cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fljq5masTWIEfDPv++s79F0LD2s6GnbI9O3Hf2g/dpL+KfqWF7Bh5pQssBNC?=
 =?us-ascii?Q?OYCNGKx8GYTzmaKvRQ6qzxxfMp/crHTTSeeyonGg8Q2Tns5EIF/N48w21o4o?=
 =?us-ascii?Q?x1pYO/YoRDbqsOtq6zrINUWP+hZpaA7NPEA3WkFXPcmSUwqB6Bd8nQyFTKDT?=
 =?us-ascii?Q?3pqENSdWxucVrzqrWEXHNxELNrbbqKlcN5Y4QXdZ3CObS4EtPsk7Y8m4Smcf?=
 =?us-ascii?Q?4F/v4G7acs8KtcERMA8LxPePQhTnvjMsRIf5gt13Pp7NLvz+xELhut24owxs?=
 =?us-ascii?Q?lbqZLui4SZwrBNvG97laYaf6HeVNqsKm29ZTvwaC4L8aQcLvTSzChQ3c+Lh6?=
 =?us-ascii?Q?03l6ZXsrEZvISTbg1kp1ROV5ugrZo/0q+rAvcCtDLRw1IveWjmE2p1F0cU1G?=
 =?us-ascii?Q?svQ8yjQ+6+KWAPJQ27WWKQam66K9cBNvguzPvJwc7iKpH4+Zqn1FIH8FcutN?=
 =?us-ascii?Q?0lBJuIPai6w8DwG570idbYBUA+Auf1Q4u7lIS/mwczm2N802nDl7zJwF3vpV?=
 =?us-ascii?Q?WxLhgfESXI+Xr4ClVlvlA/6shgVdZSB7dgvf3MFzk0Hc+Yxm97MDJF1gAf1/?=
 =?us-ascii?Q?04VbGEHKwxPqBVgM++mCgPOT5R1Lvg8GqjDEHMJ7DK5hcQhtOo5dDCMvmh36?=
 =?us-ascii?Q?j/D132tTotoVbBlewMXSFAwmFMT3kE47kTTsQ7C5vWrIgyZQx9hCCuGB/56E?=
 =?us-ascii?Q?G0CFu0Fj2a3hnNRNHjvN+AKQxwQZo4qf2Uiz35UGyZP2q79ZyH/ZQRTYKlzG?=
 =?us-ascii?Q?mdSgNv9rM2/kaY1kZq0ve2ZObMBN6dH1dZpbNTssajiUVe8XvCNSeO6hO/oo?=
 =?us-ascii?Q?C+AYJGtB5x6hlNq2DDy62LeaaDYokbM7+HdqBxeKMFH//w8VvFJQ3vpWCG8B?=
 =?us-ascii?Q?XVyc4Ow+RpzpAfBKoG1jjaCTowXTHI43/8mi0wcy+grpPn7LFa/ASMiP52Tt?=
 =?us-ascii?Q?LNjA4lTsO//iVjiEhF2oFJ0be9ENMAdxVjukktSp5vmBLuDTRTwXXl1nHtQf?=
 =?us-ascii?Q?vnP+H0lU36EzW6h08XGs7cyEXOf98TcH75COxUBkVukFiXjof7+g9FPqgYO8?=
 =?us-ascii?Q?fvr4DgPbyBYSU+x4LJ1rfi5cKB7kLbsEj58SdmYaHg/upfD4p1brTrasb0rQ?=
 =?us-ascii?Q?5Q90NDjqkz4VDVG/NDEbH9Daw3oJ+bezFF7Y7vUejDFOVAARzFeUf3D/N4O0?=
 =?us-ascii?Q?l3DP/JvWfrYiMjK8Pn2FDU75KPxFeRwrBU18c0TFHxMWrA5qbmvguwCvhfDz?=
 =?us-ascii?Q?vsInfvKg8WH2qPHtB//xrTKUCBtJI0FPel/ji1ZmAuD3XuKGc0YjyBxdI1lZ?=
 =?us-ascii?Q?LK0JNoBlGWOPcEG1gb+zZZeuuhvcKDMesIpYAcuxSp9GIzIfXEAdWdMvlLse?=
 =?us-ascii?Q?ot9NlC5QajES8O6Wjzvoc74653YdKgRCAnMzuQx7nXFCpkiE579cmx6pq6ha?=
 =?us-ascii?Q?ALrFDZijdm+nzK3jrrLeXsf1lG6foKsu3UakIcGzGp4eedZBMf9Oi/YCnCED?=
 =?us-ascii?Q?MIt7Jc1Ee4eTnMX2/oqA83lhlXmWPUeYMc2bhUzjZwtevyxOFvk3/eN+CN6B?=
 =?us-ascii?Q?791FEdlIg8lyocpqPy9YuLc+PWhiM0pmXT+OhraUmjCqFLFg662rXxW/tte3?=
 =?us-ascii?Q?LbwJS5Yw8KJ1FJo7iG1EHIR4wnqXnn/6Z8oibkRMdXwtMrNNAebN8R2M6OKa?=
 =?us-ascii?Q?nd0fMSj+nAp1PKrV+WU5EUN31IXOyPwF1JMUarTJkwaOf8Z0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca5207b-29d3-4fd7-97ce-08de89de5254
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:48:29.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnuCY/NhzrL0Y3SrPcXlLMBOIn6Y6jyDG0YZdyrAz582/p2gr7y0iH3cPv8ECWK+Y+jsbrUylcHal3QQW3cwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_124843_198571_ADD90DD4 
X-CRM114-Status: GOOD (  24.63  )
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

On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > This patch series adds support for the Variscite DART-MX95 system on
> > module and the Sonata carrier board.
> >
> > The series includes:
> > - Device tree bindings documentation for both SOM and carrier board
> > - SOM device tree with on-module peripherals
> > - Sonata carrier board device tree with board-specific features
> >
> > The implementation follows the standard SOM + carrier board pattern
> > where the SOM dtsi contains only peripherals mounted on the module,
> > while carrier-specific interfaces are enabled in the board dts.
> >
> > v7:
> > - Order nodes in symphony dts
>
> Can you run https://github.com/lznuaa/dt-format for new file to easy
> track and check by script later.

I applied with below change
- update copywrite to 2026
- move reg after compatible at ethernet phy node
- order button-n,

Next time,  run dt-format,  keep node orders, just adjust some property.
I will enhance script check graduatelly.

Frank

>
> Frank
>
> > v6:
> > - Order by node name instead of by label
> > v5:
> > - Fix newlines and nodes order
> > v4:
> > - Fix typo in spacing
> > - Remove vpu and cm7 reserved memory
> > - Add GPIO_OPEN_DRAIN to i2c gpios
> > - Move pinmux to eof
> > v3:
> > - Fix specific node names with generic ones
> > - Remove fixed-link property for SFP
> > - Audio regulator cleanup
> > v2:
> > - Add SFP cage node for enetc_port2 following sff,sfp.yaml binding
> >
> > Stefano Radaelli (2):
> >   arm64: dts: freescale: Add support for Variscite DART-MX95
> >   arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
> >
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
> >  .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
> >  3 files changed, 1017 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> >
> >
> > base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> > prerequisite-patch-id: 7ed0e453f554c70d0fafd5147d4d9b62cac6c10f
> > --
> > 2.47.3
> >

