Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDFBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgNhDb7pganZFSFej9TswCT9+YNC8OADivwFLEvo2lo=; b=Sv6JwFse27oXLDra3KkBORMGXa
	CbTcmP5V68q3ZnqlX0DZStP24WVOOlB/tU1apOeNcYeVDri6vJVZNstdnuujArmC742MQBXTsoP7h
	M4VkZQAq77tHs4/yDO7+0KJoKvb3kfyCJ3pdnn0bnGF1uum/GzXcYZL5w8mxflpw2y+jDS9tKlwae
	bgebOzPDjR8pzsYzEHjMAci7vgFzuTXK6PnCSXvrr1vn2nefkRtD4WbEjpM+1W8f38ftl18UBe0CT
	PvbvRj3p7m0P3zsvEHGrlu6EZcOsVPNEhTg6Is7MUJKNlGqsymbJZ7/U9Wb0/ng+y4KrNXG7tdlga
	sAU3V7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJpI-0000000E4n3-23L8;
	Wed, 10 Sep 2025 12:21:28 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJpG-0000000E4lD-0Vv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epYam/dzdNpNVNL8DOtyIhjqx6xI2/xddUMdX6mSKyWJ4sY29L3bG2GVSNAUfD2U5QhjM+/BxULeNJXb8FJ+myRvfnl3ktN4FXNA6tc4gOjQOl+Z7huUKlrpqmgy3ZxXP6ZM9ND/sZzyuY8AybvInekAOoqDOmsCXi0y5jGTSbKwbCG+A/YTJkNVctKXcyNmbG8fHR90MNEvAG68k6rfYs21NntZi7lXYnQ+J57LcUq9UlVqN1GHSk9ct3ZQKu/q+gwYURL5vW0uO61B3FpoKsUDxUKctp0+XcptT2KyWrgmSmSfS78Hp98Eyp0ylsbRuEGMDIIDeHXhDzz6ySOncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgNhDb7pganZFSFej9TswCT9+YNC8OADivwFLEvo2lo=;
 b=Swcw9JfxY+uhE9jDqMnY2MdSBjlYxrD+Ja7IuAe2qNFOc7sHgxcFZxNDDc0LLOmOf3s76a3I0VkyN/A6GxBo3FvyZzTFZz5nRk5CPN5/OBgeRwyFbqL6rS0AKMVToc+4yYOHzDHnB6fXDUVTAQssaKb5EyzGGuEZRP1R8gRF1pjuDQ+/ThpDnII2ZM+eFcQRB/gdFy0VaGX31TUb2kyOEKnHeJVhbGMqKDbte9WmO/iwrm/sxxljOf9bAimyedcKEccTZSYh/kEc8S6YakRtEw/rRk4DXa4K0YmQdAl4kelWcE9BfBXjjgp5lpSe39Wx6m4vuQL7dhNkXSz2Ls/tKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgNhDb7pganZFSFej9TswCT9+YNC8OADivwFLEvo2lo=;
 b=EetgiS/dsNWtXAq2sEnwDRQpt6yVNXIunuol1Sf1aDEUh0of6pm7WSwhatXDc+s5oc8jHsLz4VlfSONdWWka0hYRAY/4T/cnSdpCS5SRv+MWihWKE2Fmt5UGadV0JJPLOWAFx4JpeSDKm8wAzxWreRcEH38j+xeopxV3Kw9BdaH0dm5Zohg8nUYP47v2+gjEC51y0Cbbtz76JjLsy6R5Hxh81U/AOaA+mstUcz6LAJQwllcBp0f4vv6R/ACbEQykTLV6L93amVbugJbraM4lVJ4y8GsAO+J7Pkq7fVj6o2Iw5PNycgc1f4kQxPpTroiW2owrM7dPQ+KSo8v8BlSevw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB11662.eurprd04.prod.outlook.com (2603:10a6:10:60e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 12:21:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 12:21:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..."
	<arm-scmi@vger.kernel.org>, "open list:SYSTEM CONTROL MANAGEMENT INTERFACE
 (SCMI) i.MX..." <imx@lists.linux.dev>, "moderated list:SYSTEM CONTROL
 MANAGEMENT INTERFACE (SCMI) i.MX..." <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: RE: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Thread-Topic: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Thread-Index: AQHb98kBWQQZFuR6ckSibDYWVbPYKrRzQw8AgBkrYYCAADxogA==
Date: Wed, 10 Sep 2025 12:21:20 +0000
Message-ID: <PAXPR04MB84597E55332F318889A8BE92880EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250718094723.3680482-1-peng.fan@nxp.com>
 <20250825082154.GA26152@nxa18884-linux.ap.freescale.net>
 <aME6O29QxvU_PcRx@dragon>
In-Reply-To: <aME6O29QxvU_PcRx@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB11662:EE_
x-ms-office365-filtering-correlation-id: 433be5f5-fcd2-4745-c119-08ddf0648ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?AZ5IYtXZPIi51ApobVwxyzg2C0O+55RtoCj6m2ZHEhnuQNnHlJ6tQEwHjoiX?=
 =?us-ascii?Q?KiUMjOgOxzOvnSCNFpqL83m3zuWHpg686WqUMugSl7213KhgEkKCZ+FOm06Q?=
 =?us-ascii?Q?L59Fn9dDr6IOnTn/hXdCEJgXmzKZCGzCUXx4rxfQLCMfCvP3YSFbAPpb+8Xt?=
 =?us-ascii?Q?OrBc8u+G9TT3Z0jZr+CW9KId3MRXvAOe/LdSj+FOkvAYQd+Z5Mwt8vFk3kG6?=
 =?us-ascii?Q?cS78lA26xxNcbli3XAwf3lNY4gaS3IE3vbu/W95Thm+gvDPm6QwRK3mDhM61?=
 =?us-ascii?Q?S1QiKb5UJpytiYbndYZjZ5aaeyZLCPUVdd0G1kT4XVbIWIZKPamUMNkxW9mZ?=
 =?us-ascii?Q?ErH4JIblcueaQRgeUh6r9tnsA8zPTYyotLZ4ihj8VUcaZfIdAVM5gL23aEr2?=
 =?us-ascii?Q?+A9oqLiSRv3fuV3ek8WDUq+0E1xX4hKanwWgAatxUI7m8ytt2sfxMZ85MJlM?=
 =?us-ascii?Q?phBYNmzIJeF80etDPfcoWdFaO64CRnCGuJ16/lSkUUpHgxhXxfX/+sogV+ww?=
 =?us-ascii?Q?i7Y621HVmzfAgMt5BFeQHeKKXuzQA4lMjgMoNcgIvngOzkPtTZ9k9a6oK5FE?=
 =?us-ascii?Q?kvEETYQq6AW8ZHSn1MgLmYR1Lb4tsnyzOi1BEr/K8eYUfEY53urBCqJLICdL?=
 =?us-ascii?Q?R/G5QInJkTklN82YS305fxcl6jPBRZ9YG+97MJWIbMahmAg4XWbTQcGRpXlT?=
 =?us-ascii?Q?ZTtpgweO0FeD6RHCHEteymgZyRRTIUQe//hqtebfxL4b8EpK960DpUtLtzpf?=
 =?us-ascii?Q?0UpOrMjZkwG6WvU+3KKBkR9CP/M/fCPtoib+VnfUOlC/HInfde8akxP241Zc?=
 =?us-ascii?Q?ZwNpG9a47USadZuJ7y/N1S9fF2xuM/cBdYgy4hhlr9qBCb5G3EkUBPmRgt+f?=
 =?us-ascii?Q?je2bF0BbNnRsMsI4Pw6UMf1TLHe58tZ4Q5q+18vqTHXo5UsKtP7zMwl2/2l6?=
 =?us-ascii?Q?6zJc4mQLmdQHI7i9rZZ1Zb79IhJpLdxi0Cxf5MkHSit22xupE0IwkgAvf7Sj?=
 =?us-ascii?Q?Z/Kut5Mk+XSNSkdeBB4i5ygbvup11xk6YKI3o7FEaLLE6qkQhgYyLAyMpAUD?=
 =?us-ascii?Q?CDWUafTxgzr7P7UVstb1a2YSkX7u6+dGKts/p8XBOYvyflLbfFFaGO6KeoLH?=
 =?us-ascii?Q?dGN6M6Atieuk5hU5VmwpinK4vHdZucc54sXlMgBDaeu44YVH40HfDUoAd6Dc?=
 =?us-ascii?Q?HckFXWwvs2tJZeep3ICi2ue7/U7RH7h1S+4NZOBl5F6uMm8z0Op5IhTw5a9n?=
 =?us-ascii?Q?jsPkMmDePtTYsBHt3xgNOtC7sZ4Dd0vlfb/OZgFxpSlOaDnXjb2oWi/vnm1u?=
 =?us-ascii?Q?ixWV98T2ryIbGKK4rSG+zYR6RTtPxd+Kj3eEyrD3JMCDs2fWhYSEqXaO05Ty?=
 =?us-ascii?Q?grcS/xxY1ys4MArbgm6K+52xtE0jiMFAx5r9EeX9iF9dPE7RQQ5OENtuIjdq?=
 =?us-ascii?Q?MjP1MaykfCc8PKunbpxgrZsz/XlG7lVh/LmEuYPNB8yvJCvbr35fQ4czn5Bn?=
 =?us-ascii?Q?PFZKM0ztZFCZLtI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SQsv03dgLsSlENEBfP08T7ay7IFMcS4l250ZN97DetT9Qp9NrorRvB5nLTVO?=
 =?us-ascii?Q?am4IMsMML1PiJGlIpl/7T4pa/QWeScAx+44+1MV6q6hfddonLLa1iUFe6h9x?=
 =?us-ascii?Q?a0L6hqsN7GrbuKlvvskIoJH+sXVJyubDRTdRunCPluzPZ1Kj9bmXJMpG+0rY?=
 =?us-ascii?Q?1+A3UfFkEVd8xtWPJof9IqGvhu6JyXdbQTnYkY83DIpwmxy8ktWE4ffpjdMm?=
 =?us-ascii?Q?9r6tXfKSA2Jqwi7SSiXafgy+P6wR2XcYjZceryx4ZzFfU+4adWM3EXjGmH6m?=
 =?us-ascii?Q?kJ8gzOvHawTJ9H/XA8UF1LMdoxX8gzuK8My1fvjli4My7/hEh27auNJstfeS?=
 =?us-ascii?Q?8IFTxJ6pV3bF0NOxSgbHXv6iPOv9+Ba9/GnluMRKZh1eypKNdbmRBocp1lvZ?=
 =?us-ascii?Q?VThWiMyGvmKGx6a1v4COqbYjLcN1W/VmgQNzAEcyEccg+MTeeLL/kRNhDMxK?=
 =?us-ascii?Q?AGfvJaLwo9ctlkTpBV35Ud235GfDSNfBa+0jQFA8kpAZNbWJA3iZZD9wrXUh?=
 =?us-ascii?Q?6pnTpRoYpm2WhkzoQCoFFr7fn6WX646Q8q/WgqQBWEHm1C/FX6kARc4nd5ny?=
 =?us-ascii?Q?J8pVbxrLDuw+SqHbwshqTp1hhBj6KqhWcljUzQec+YfCiHesdRBk7Yznege4?=
 =?us-ascii?Q?FEA2EtjOJFJzs+XBRzpAMlsevCG3dVOYMDVs7cSuRzMEzXT196KWSOyArLvV?=
 =?us-ascii?Q?q6tPOW/afG4eerFYyeyKvEM1GDVCpuw02cPnEu42sgcDMnXsU5PwRMEcBH2b?=
 =?us-ascii?Q?+b2hQ+SinDrNe7zeMfsBHZS/c4gM2x6zQ0H3mfJ+M1+IjCyJvohFEzUzrADL?=
 =?us-ascii?Q?DH/9BAx8ZMS31b7T8NOIDaENPTwaJ/Tv39itJ+D8NggnHtuLwfLpGTJAXhcO?=
 =?us-ascii?Q?81HmCHWuuh6jMTRnsqwct/1a+U/eaDIZbrmx3qW6wZjr6gHB2yIKp6ksl9HE?=
 =?us-ascii?Q?uGepHxa8KuB5CIdb7lTYvbwUNbWy0C4grj9ILYTuZBtbuenpskvsFiiWImQN?=
 =?us-ascii?Q?0mRzQ6ucmVr+yS8i1vvrZ5d64PLcjHBsOQ3yNSm15MOXkI7+hx2cbJBWH3ca?=
 =?us-ascii?Q?Tw4e/wFwp3gs0BEa9eX3o07vWvIzMo250VWxh+v046IQp02vwplWcFcC8fpX?=
 =?us-ascii?Q?flbBCEZd3iodnm50JtjCPyLPD50/iTMU8sMgXw+aXcfMaYMoyNK4e9fK/XVC?=
 =?us-ascii?Q?tl0u+VZP7ID+me6XtzZeX2EoDARs5ce9i9pr4GqEIb2uNeB9aQGg++M4STt3?=
 =?us-ascii?Q?Aq+2uUbjZ3QOqjM76pFtupcpl9m8Cgh0ZO98XMerUCDK6GSyYHyPzz1Otj1Q?=
 =?us-ascii?Q?QKcltJMuRnPDCRtsfexJH/7a8zJGmSc36mb572BS8zvrPRiizKiY9hhPd5l+?=
 =?us-ascii?Q?7ECAidmA5i3qNVKU+8BnpBm2CA9w4DO7Atie17JNcx9Xy55eqzZ+a1nCm+WI?=
 =?us-ascii?Q?XenrQEE840VQlWVDi/08PZoVzOVBk8dezV1SyUIPi4PlotkOLiS/1zHGS0hq?=
 =?us-ascii?Q?oW/lOqQltjs8zh7tojMxRAffgu6MBcNXUbBCilBVoWvgvb49dVCE7P2BSDFY?=
 =?us-ascii?Q?TZb0h1Bgq7P/XbwJpZ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433be5f5-fcd2-4745-c119-08ddf0648ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 12:21:20.2587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XS5S8Gt3S7c7D3SDqEMIBAnCoF/yl5uVB5wAEtWp8t2aI9oGbzwdAHiaSPfgMjLFViRLb6330rXHX0cX5C7TEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_052126_174326_DB911F23 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Shawn,

> Subject: Re: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi:
> Allow linux,code for protocol@81
[...]
> I do not see the patch in next-20250910, nor reply from Sudeep
> indicating it's been applied, so I just picked it up.

Thanks for picking it up.

Thanks,
Peng.

> Shawn
>=20


