Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B35ECD9B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=; b=Jgr0Lt8HAjvSyNh7ceCfRRIVF9
	ZTxpWYlB8N/I1G+7+OKgBFE4UR85XSC2UvV5E97tp5u2D0H0TsRxww0aANxcwB5vx00FuNotGIXaH
	oRn9O1lfs7GTqYuCD/7KpAv1XIdsqR9x03PJGKGO5ubg+oAVDfTfKmmbwiX2kD/lH2JoPPK5YzI2k
	Tq4yrgtj0exPzyLmSJx9ikYGnLsD+kYm0wrneWiaN/duEzJHuIPKkOccdUNs2dXry58h3AqTQDZrn
	dCJ5VXTezdnDZxdL3ZDsmEFRpy8lDIJeFtVUzbqEVI6/2A/2M6gji3uRXhWM+Ej0jGHf98jwWxMiN
	CnfbFsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAwJ-0000000Aj1y-0rtw;
	Fri, 06 Feb 2026 01:47:19 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAwG-0000000Aj0y-3pjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 01:47:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWR0pR2rNfCTL7g9sLP6Hzpz/8Xpci68/UhbdqjNBq7sit+9L0VBbf+hCwfX+yCsjfeguFZJxUtcUhRxCrDt1hcL6VSg2+leF+iKUEvRwFqqTXtRCq4x5DjfDO2xWZPFKIeUl5N8cqgAZEqAHVbY1DzH0pYB8uFaFOfiLhNgOoFgjAlg+pAXgB6y+jDgVwgELq9shSmEsRqswlq4/fURyQAgkdltNGwTL3rnVFNGUxXar9klvLmikaJ5jZyWoYPf3OYyuxRKYSfhAr+DpszbwN/dtAegNmnJTEt+t4BWnlhARJBmQ7IS26S8HgjMvUFoWsCoVGHW/LU2fsfHt9GLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=;
 b=J3h5CiSosyxbnyZ8Dx9JDMEB3RPtVMS0ywAhB22IHArrz1+pnxzInb3U6BPARdwdl5mwWZ5CYM5isCsQUCKXZ8IrtBpTTAE1I6FJAe6UJXET7Ya4WaNMCSgpdHj2m8yN4BZNeyPVOgJ3M7HQBxlr4GnBsPA+ZfMw6eWuaF8hPn/9J819w31eRcIx65y+cjCAexE//3T0DzRm2MiP4bnppG16YQkuCwlqC7bjyA5izjotRZmGGsvDppbIJ6eJGKH8A7n0mXLwMHyFfcMuA71t+LjksZ1/OUhrgR82bVpcnjzSw2vphizkLfePN9Cd+4IVY9yTChe7nsZuheCsa/U6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=;
 b=l4TB9BiNW6bVmGY3Yg4czpNfYinDRxLrTO/5J65TPd26drb6euHdOYCbpFP4gSUm/xGy9SgxOrA4wTyHPPYWX8LIBdYDiCBmjLvJqGgOZZ0TZi78M2JoQH2AnWIR21wx6RvDT60zBq7VrqQRbhEYyu1FOUHwLIVKnsL0Iw5d2GGzSbnksu/aAzyVfHxAE2Hk5XHY0fCg7rMAUpGqVcVJpNm56kXWxsLQx6SDeSkl7sqJKIDgs8kLXAG2JHrbgWbtWR2yHYeb2FnQT23qk5Vz7MgKvebm9aBf2S61fgj4EpN7t2gTSXzi7xFmoy+scoo2HrumnrEVipsTAMY7uSlqEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB12210.eurprd04.prod.outlook.com (2603:10a6:800:335::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:47:09 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 01:47:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Date: Fri,  6 Feb 2026 09:48:01 +0800
Message-Id: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB12210:EE_
X-MS-Office365-Filtering-Correlation-Id: 30131bfc-0ea5-4838-4581-08de6521a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PGNi5tpYYTsJHvD09jtGFAlYZenzaSDn+vMMxFONsiWLcCi3cijPoEyf6CEr?=
 =?us-ascii?Q?NKK/HcwNcgkvecciYvQDh2ZWFf8tgW5avVt1LQO58mio4OoPeHQJiFbaGVKq?=
 =?us-ascii?Q?BUiobBadZPhspl/jyJTSSWdoffSwIi8VdI2hY8u/sbTklKnmT+WH61Ih6eql?=
 =?us-ascii?Q?MFncCRGazd2ji5QmWcPqBQGzoa6fPo/crD/a9klgWwAqOyD8i+oQi0vJEIZa?=
 =?us-ascii?Q?NxOOnNELTG765lLo8/NkbY3OsKCYc6lgLDVDEaW9aNS7W4TFSg1c711/OQ6j?=
 =?us-ascii?Q?p0tCXseqib4IGZkH+S65GKCwn9RY2Pb60Hbb+/zOVUPRAp6asoo/wyz4fleg?=
 =?us-ascii?Q?uOWv1wBddiE7va3SotKwszdfJMYfT6n8hAUmnCwovVRHlFc77U4XXbpHcH9G?=
 =?us-ascii?Q?Wy1r35Dsd9U7jGojXPOhhh2krq3HOja5YePPQRwg1iI5aA4CA9/cRpVbI3Mn?=
 =?us-ascii?Q?C37atQBydhtfSLHfDWgHiAQIAYTa+s0hG1x9UzajmCHN4lLU9BKMkPE54gEU?=
 =?us-ascii?Q?GGnIaAOjN0+plA/oajHWfb/5EdWY9Qs4reu1MIh/X+si4uCEpKSDzU6TuJbI?=
 =?us-ascii?Q?2xgyFMQUtj6rr5+YasYFMRIBAzL5QESZqaaaGtb6eLF74tOM3Cl4Rb2LYJzg?=
 =?us-ascii?Q?vQ5/0Da5IcEZgi9TOYFmbnshLB7mhmnIYWex5HwAK7T6/uzEphz97Pr+0Jqr?=
 =?us-ascii?Q?Jadc2vJpwpAHScIDl/Nu2f7xsfuk8F4gG5cg/V9uAfLTi0KL3npZPG/hDoQo?=
 =?us-ascii?Q?7aM3sXrq9jK0bH5q+05Vc2umvYbw+kOpDKUP8kMSUupMQFjJfkaguxD5uWFt?=
 =?us-ascii?Q?oQoXSf3MYqvQfiF0mspsWPTrbQcFmnRS9cI2xjCUklozXwtWp4H2qZi3RekG?=
 =?us-ascii?Q?T2dMTiaVC7EOxxFJsdE4Je8BUXGZw/H1SIoBMRjA94pM8x1m6WSsu/+Uq6a8?=
 =?us-ascii?Q?l92LS9TpV/GJHhJpaenRGGs0HPIj5LdwZZrtsdnohcv9SzPnpeWd14CZSaUq?=
 =?us-ascii?Q?6gFfEId3R5w3wE8qtZ4xRfEwioF2l43ZkMBwUKdG0H+W7K4m8cQo5cOEI99h?=
 =?us-ascii?Q?Ou0jiqlk6T9iYSf0cwFw1qUH0hxdQavHaDxfTV3Au1k/o8gGKmv5a0myEOtD?=
 =?us-ascii?Q?k4N2XYDrpKLUV/5GDjX/OYDbiTGttm1j5Y7VzjfMyzFDV2Y8sCj/4dLJmqZu?=
 =?us-ascii?Q?hQsp382LQM89dKJZjUpGELCjaeABG5N2qpF2WGb3KEmU8oiV9idd9owa7KA7?=
 =?us-ascii?Q?nDs2tq0xUxuyhU6nxg2CMyqPPwYiOSCW5LfaiwbqxOaGRrASIQXHk2aGEgE1?=
 =?us-ascii?Q?2c/pLHjzx09BoI6YfwFZWUiwxSt/vOV742D6Qj/OZqXujgdmVLixmrShTDD2?=
 =?us-ascii?Q?kSlzMdGhe40VYnYoUhd9tmufKjsuEXu6sOzxYU27jhiLgGTgRuHTi5BjNYuQ?=
 =?us-ascii?Q?OmJzHvuQrvCL5mmIOy3dYijL45iRQWtJneyTbFfsv5/fuT1HX3T3IKrm7CsO?=
 =?us-ascii?Q?BuSC+caQbf9HsUtx8xFv8P54pRRcMncqFIN8qjZjGstmiEBCBketgl/Qbr8l?=
 =?us-ascii?Q?1ECrgBc9CBsWjBCUOC26z2rBur000Vw4CBObRL3oow3zls2rOY9muZY0gCwP?=
 =?us-ascii?Q?hz5PsqM/ZDvfPYitCe1UbqSVobWZyC/lMPrphFsAnYqg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGVUxICREMamKMNSAyPdG/+DX1XVaCNBO3scFGJD1JvoZYectVGDLJzXNtTI?=
 =?us-ascii?Q?/75ZbkEa331zJrisytXsSaP6vdi2esLFKY5f44xslY1rtgJJaEKIiCKCg4gw?=
 =?us-ascii?Q?cfUJYc9s0TpmHaGBHepfAD1R+X2g/gQBlVpyLll3kE3q9qaI7+uz9shLZX7D?=
 =?us-ascii?Q?cKrI/t2h6oer/m32gIzRNInOjCyJiS8PnbKXpDmU8BnbKzx/rW4SydFRmCGn?=
 =?us-ascii?Q?95kGRq7AkqjF8NjqvpFSv+0jUQvxBkFW8SDJrHaxF0rGRKlaqexkji5xnJqf?=
 =?us-ascii?Q?sZPhglb/+P4PmfoDcRlOQoN09ZQVNqvMywEHqq6DiRJS2KX/rlQkms8Sa/zs?=
 =?us-ascii?Q?uGpj3QqAOoAQbGRafNp6TMM85F3XKeI6ndn+wVHrT5xwIp8rveNF0H99Z6ag?=
 =?us-ascii?Q?/BQBF9pUyHUpFNJI5un29lbcX7q8APr/dfhxp8g9U7Sf7uVtxkcdP7qslgh+?=
 =?us-ascii?Q?4JmQObZ+EoUMeXsstPEEv3I+IgiXcp8Yfqia9llt+LObu5mb52paMDi78U07?=
 =?us-ascii?Q?+kAauRE7oYMtW8GjQrZM00C0jZB81PF2Zk3iw2sPG28NTiH+fBzKaIZql8NM?=
 =?us-ascii?Q?wjPex+83dwhxa4gfuECYsYPdN1/+jwf/Uf2AueNu7H8riE3pfQ3Km8BlJm9J?=
 =?us-ascii?Q?IdXQ980LVbRfLa9tihqKszDeGl6LN370Jdx0aZaSAUawIBUoy3auUCAEqCKd?=
 =?us-ascii?Q?qJHoNVx36K6IA9NLg0yCzNRP4Gdl+wK/S1W4OotS5bzm4Yw0++xWuy8n5Be3?=
 =?us-ascii?Q?OV3aVCEa4bsvp3nxeeOx1lZ+JjRUO/1tBdHshjx5Z290Wn/AIMdNEF+j5sn2?=
 =?us-ascii?Q?D4QZS/TmKq0S+dA11c9hzGflwlfgAggvUpxPRSffMHeO4AvhAMkfNwt2Brfs?=
 =?us-ascii?Q?EKl8YglmlLHRFWqHzqy0NL1CmAwAld0VTr0RgTqOSDHzELDoqI2THNNDEput?=
 =?us-ascii?Q?/at4VEjTxPiJbN6xymN8HKKEC6GN2jYfhiEnHfbLz7H1Lsp3WuuTt+HsH8EK?=
 =?us-ascii?Q?C3SIvSVmOFp6R4HdC3ACnxG3EDtdbBav+5eQB8cdCz1nphOHT9zKoesDvzA3?=
 =?us-ascii?Q?470m9sOuVBbAenjCSejNt9C6RBJK4rCFhDMpOZF2BXIJ0dtufQjjNf1Zyhqe?=
 =?us-ascii?Q?S+lJ0xlp/M22gvw2nbpkODFV/1TY7CeABDnZS+rngLpqi3c90tKqwbo+JuH2?=
 =?us-ascii?Q?88QnHw+E9vdvCL2WO4YzkCqTYytM7ETxSHdIiIJ5IjLnKSD6VjfFdSN2iC/d?=
 =?us-ascii?Q?a4VkXaKhjiJnw08d+toBSBxPjgh3K1sYvI3CL9V09llzTwa5PkE8AcYW3o2U?=
 =?us-ascii?Q?tYdug750tWW22mJ0MDhqV3cyLHDG6Sg+Jd8ibw9WPQ7vmTnK2hsBvg7ZrONx?=
 =?us-ascii?Q?AnQ3tOZrhTxz84FRpqnchNGwQ7mWsRvVIuqzxh97Fjq4oEhuG6+rQPRMNAC7?=
 =?us-ascii?Q?sde4LHhZeaSGM2QKdP2t3hhbnQUbOlZSLvczstSdTKjA6L6lZlxVVQfoQZk5?=
 =?us-ascii?Q?1ZSzUZEZtex9MsDj3V8DTBVD0CDbehyDq5EccH0jhbGMN+lV9OJmQh3x306N?=
 =?us-ascii?Q?SI1tkA4t1duA0r4aweWWtV+3Z+pE7E+LMUJFq3CazNQghiRpVbmnx3gc4LU0?=
 =?us-ascii?Q?T+hd504i+sItFK5c70oXY5l6I5Pe3jUwMcfsPQjlda9aHDj4Op3Jikdm/hFt?=
 =?us-ascii?Q?d7T9LvmmbOlcwfbyvPBM5sTEtkl1KC5hvarUaTz96BaULP8V3yssYPnQtANf?=
 =?us-ascii?Q?3Vde42RsNQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30131bfc-0ea5-4838-4581-08de6521a35a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:08.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+DJ4NoUxp/ykJu0Q8V0jl/iu7+sQNetZQv8kYTEbO/Kaag9pZvKzNUrpwvqXMqrWZElTN1UUs8yERVIY/RJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_174716_956217_5C5C7128 
X-CRM114-Status: GOOD (  11.60  )
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

Update dt binding document and update driver to suppot ASRC on i.MX952.

Changes in v4:
- add Reviewed-by from Daniel in patch 2/4, 3/4
- add Reviewed-by from Frank in patch 4/4
- update the commit message for patch 4/4
- remove 'retry' in patch 2/4, reduce the threshold for timeout.

Changes in v3:
- add Reviewed-by from Daniel in patch 1/4
- swap the patch 2/4 and patch 3/4
- use regmap_read_poll_timeout in the fsl_asrc_m2m_output_ready()
- refine the code in asrc_m2m_device_run()

Changes in v2:
- update commit message for add more infos
- split original patch 2/3 to two patches: patch 2/4 3/4
- use size_add() in patch 4/4

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
  ASoC: fsl_asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_dma: allocate memory from dma device

 .../bindings/sound/fsl,imx-asrc.yaml          |  1 +
 sound/soc/fsl/fsl_asrc.c                      | 38 +++++++++++++++
 sound/soc/fsl/fsl_asrc.h                      | 18 +++++++
 sound/soc/fsl/fsl_asrc_common.h               |  4 ++
 sound/soc/fsl/fsl_asrc_dma.c                  | 48 ++++++++++++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                  |  8 +++-
 6 files changed, 109 insertions(+), 8 deletions(-)

-- 
2.34.1


