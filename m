Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170F8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqcSiBH4pkeGKky5Id0/CG8eCf9/BbqR6+sQjWAWajQ=; b=q1+ISJv/6raBgFC9DI1kLQ2kw8
	IAWMlJuIBiIVtvROf+H52eOvv+/WXHGlJniLtr4ErLzvNQgdDE7pKEsegyjLOwwqGb/gTk+C+H4G1
	1vgr1I1d0KAvA0/7V/DGvTc7wYyyLSGiqNfaW5mL8jpUDtfuetgF5eOD8dLolmo/nQBfpaACGDNRv
	3vzYQqj4/8j/Q0Y4GLPGQbTgyRN+D4WonbuWYFvD64/RoJb7/2Ar7+x6FzrI2tq+WbOguD9++R4pY
	nPSeiHzQCOTxAKw3lXuaeI5evrmBHK5MNYoKbEF5nBwM4Ow0NIRv58JvvxY1RFvM9mZTCQM+X8Etv
	OK0JoOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRm2w-000000099IK-0Nzy;
	Wed, 18 Jun 2025 06:13:18 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRm0g-0000000998R-34m8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo0SH1QyP3NV+hSeZFCCp6ZioWvIp2X37jY0vf8X3470qJTvinsZLX2ST+uMuO008G/Cl6nvps6SQQVsbX4bHKwW84gQIsI4X2/arOyZfpH2+Fw1NUyDTa3WXpf5W1PbdicCd3ei7NspOlmpqK7DZVV56E0kDPTCQkl6mN6IDfTvmA6fLajFGHAiNDjKX/8wO0kpyjcAqoo3UMBMfHp1kukESLFFaGEV5ZpW4sagymzg6c/pXmCVWMBV+yiZ4OYdwqnhyKjKP9rwcVD0konO5OwYFi9XDqAIJTFrnh1J+DpFtSe/6PFlZaoBjWXTY1f42T9MT/zRPJt5i5J6HSXcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqcSiBH4pkeGKky5Id0/CG8eCf9/BbqR6+sQjWAWajQ=;
 b=ftgtpYO4StJlJVK6dJtyGvc7aVpUdmccn9vhGXuZ84K8p0Fiw83GSzhzullmP+H7x7OH2Cu0alUCTkNzjp2s3T+MnBC2Ii2rf5H2VJnXDkDp4E0aYHfpnL3DK9i9MLCnNQ4S8uvmNGyA4BKohAyXzhexImGxOJkw+Bmdk4TGTLEMUqdIimsF2Kry9IZAz+sLv6gLb8jvG03846dinPWwDTl9ZVxVwRe7hmqOorwPHmVjvOfYCKW1hpoD8MTY+fYyJDN+afqToPBhgNTXnQN3yub2tIR5eJtBg5tkXd0UcpeM7wh/qQ0bafB9QIiRgV0Sb4E4w/mPSqYFuPIoXDa81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqcSiBH4pkeGKky5Id0/CG8eCf9/BbqR6+sQjWAWajQ=;
 b=fsHYui3TmhKnMuROO4ZUuQKvwKc+dXIYVp5LStnXWp6I6zIpKAcQTzbOEdM30CqH8MBqouC/8RUPniqq1DULEuWJpS+P/CX9icUi3+qg6lExxFjjrizzZnbI2uxaw3b9wan8gQ9aBYa/P1FxfFEhe1a10nl/1zCpMjQdwEGfBIAXPsNuHIAIVOmzkX3LoszsM0xMvlfXLMeSPAq4st1Ir+lL07LyFQ5z2WdRpmLqyyQYYK7k4pyp79lRqVgTipVIAg3DnEJPKzPkKZFoQTPrKSMzoLfRvaHlYkcjS8RSX5qZeJVzK+6hTihUaehg2RuC24bAlr3tiUxhj/9JgLFW5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7777.eurprd04.prod.outlook.com (2603:10a6:20b:236::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 06:10:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 06:10:47 +0000
Date: Wed, 18 Jun 2025 14:06:06 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] implement workaround for ERR051725
Message-ID: <qosv6ca5ewtel6whmmlnwfxw4j4pbd6ccldp2vlqkrwh4klta6@wpjjzovgq2ge>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250617081945.GA1716298@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617081945.GA1716298@nchen-desktop>
X-ClientProxiedBy: AM0PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::49) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e897b4-583b-4eb8-2477-08ddae2eddfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jXlSZFOq/t920uv8CR/w7LlUQ7CswgarqaxQB7Kwqqp0OkfkWqDGZ0MjNj6J?=
 =?us-ascii?Q?iZ5NMGKQoeH5WwbX2znaHA6CRqNbtRFkIo8B6xLMTSyicJMPAiy5fivtZ7w5?=
 =?us-ascii?Q?pV4CTpuNqC57qerk7E01LVBbQPJLnfNu7fqv0rnGTghMbeP1oDcC/2GKnIqS?=
 =?us-ascii?Q?a0pxmhu0OxQa5HqdAqLYeBuahlSsuRvbe+BGKBnTALZ/BilHSO6m2/5BFih9?=
 =?us-ascii?Q?cfW0dAWtrHB/bW9+Fwl7DjFZKKANxPlBLHdQraYLzI62wMliz4aRGDQqf3l7?=
 =?us-ascii?Q?HxAyopozgg+K4PI+MwdFFZWsu9a4cfGVahY6kJuQ/SLu8oWOOvpgLtl9xP84?=
 =?us-ascii?Q?eQtpRg6rG4hytHdq+yLB/Yl0JDUT57+GIdSe39+tTzRoFQ1K6+U1nd5bz+BC?=
 =?us-ascii?Q?whAwzD/MAezxa/1wzJ5RJEjjJ+uihJP0e/O3b9n8A8MRrQVAOnpMrD+X++rx?=
 =?us-ascii?Q?gRLRA+mlupxq31BDyUI/hRYjew1Lo90fLt5t1odC0hyXdR0eXeV2VDzEfAnB?=
 =?us-ascii?Q?1TvSvx9B8bk8zvsScymgXTsPqXszVwOtwR1k+lZvw6jI4hqiTxALZMV8xXrR?=
 =?us-ascii?Q?WMTfRm3b0YYTnJmMgnsn/r81mlUnTMSYa8Gaukf+sqrraKGpz5oDtLvgxTXN?=
 =?us-ascii?Q?KvRd89ttlTLD6nHTd1ZQN7pbNoR++buYdqflDsa5Lxxlvae+A0/1rofivLzD?=
 =?us-ascii?Q?NIm2VOYGFaE7LWCPSFKwJwpwZ7+xoLoqPuzBMBOCM0SkQzjm8xPAVMINMpcD?=
 =?us-ascii?Q?pekJFQNvIAUrXU9Vp4kZqiE1dHEslCBL7tyLfL2coYTI0BkhJLjIkWZ+R9Fa?=
 =?us-ascii?Q?dqpUGt1u1SOIOmwkY2AoAWZWUskz+Mir1B22QBTwde1qWQKEOjIgcR7qWfym?=
 =?us-ascii?Q?guN93buETRvBpntFmc6/bRuBgfsUNmS8oeEzhnWtcFKLi5UXfVbrMr5xjSpb?=
 =?us-ascii?Q?3AYupE6/VQoeeVKR4jkSzYqPRgHDe7bqmZOl+2ZVTcTP5RPwx95LMVaIOD7J?=
 =?us-ascii?Q?UEdWPXQ/11nlrlLknBDP71kK6pZhdnTAIu179jlvvVfK7YFwueffUhimbdlE?=
 =?us-ascii?Q?5H71CbLU7VMZgEFvSkVzOhCh7PfVr8eUr5lmbRmjYlI5uTtaz9ufuI9omdrR?=
 =?us-ascii?Q?+zyxPLg6A6ZPiWVLp2E8CTxyNo7lUl1kxA89nAtkhsXrT3fYVYarPpi+SAD7?=
 =?us-ascii?Q?P9DVZ4pqlSJSbGCzkA+Ds3Ho7IfgWdcId5EOw4uf8BVAzyxOZtjN+FlKyQr+?=
 =?us-ascii?Q?GrHjSY/LfkksEjaQ5PwNqQ8KTuOgD/+j3BSorgNHBnm3gCT1Kna+x8FmQAQR?=
 =?us-ascii?Q?nRai/jwI3IZjgOdvpLoIeYJkyVNMGPuC0VGOyh2bGhC+L0eQecrayX0upbRe?=
 =?us-ascii?Q?j7GOU/ChB73kC6M2m04VpSQjkQlP4xNnlaDJ2vaF8ZIOyAApeetWHaMVcg0t?=
 =?us-ascii?Q?9rz6em2fqwOGBistzZr3QyFYPjAyMiJjq2QE/K6VRdxdBaWegxM5KQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AAg/k6pbG3rzDAmPh8La1HqsJjXR8I0KTBiTTtXUzBdUPlIP8uDw6kOU3n8+?=
 =?us-ascii?Q?s+GS1Hkq95f+BV4kHAMz9PdMObv9i772t6csiv4wPDnaORPNN6clWm90LrFO?=
 =?us-ascii?Q?5Vi36Mcv/gwULt2m1rjMgPbHhekmtaqFj1utH/3YovgZKxe7bIG0AuWPn751?=
 =?us-ascii?Q?KOVK5kxz4ifHm0AeeIBDFA582U/Tc5I9aZtKFnIMqvEtjG6N86Am3XP/Aqa/?=
 =?us-ascii?Q?RBvIT1NW6kCyr+yJ35Nxq+DBWa0uNNbi3ayoX5+OBkOI+Zuu/4RZLn4txjtA?=
 =?us-ascii?Q?oTa8muhA/+Eog9QVDGtI146O2z7agjrU3zLTeIyAVtdZyj+k4Ga1TXfin3k1?=
 =?us-ascii?Q?AaAakfAdKvbm1MCfHNqsj3Sauu+vVHQA+1dLzoCi5gGSuKEUDGEgrt29NBm6?=
 =?us-ascii?Q?s7VrQpmg9/VtnwE/KhPdqJY/ci+kSvg1FQSSt6EeVmqS7XBF7Cx95SqO03ry?=
 =?us-ascii?Q?AsXCf7LT2FgdSgMZ3w1fl7OVX4PO8pc0xg5iPE0IZ+WrJh4ZSc9z5OllMu4r?=
 =?us-ascii?Q?aefAxS0NDe7LTichiRbFZlEZMOZhgWdz2FzYdpRCOVtxsX8QRMNvIk47kf51?=
 =?us-ascii?Q?bYJYluAZSNoNwXw0LiEZ8+gRMvVR1xaCQknMnsAI67G82K2MIYgnilmPZdY2?=
 =?us-ascii?Q?8bvc/HkZnUkVOGL6GycBfC13y5ktksuWNCceNAHeldtID7sWka++ogkQV2xM?=
 =?us-ascii?Q?dxOvfGUeBlcurD90rwUM0K8UCCwEJnigxGRhguJgn5d77L7dDJUJyITFWiO9?=
 =?us-ascii?Q?Ket87R7/OFCFVHYeJ9SB7x0DE+Qi3h0a0P0eOQn6/e6XitZQRBKBkiNGe5Fh?=
 =?us-ascii?Q?ON9iyWKY0sSUJky9wSTdwmHvYnWCusSvthmZBz/IGBAMoSamRYgtPSVps3oW?=
 =?us-ascii?Q?52VRKsnY8pgT/IgMj4nAu2JXknfsMAgFiqefY/g+iHMSqmj6+d7M1MgEMIcx?=
 =?us-ascii?Q?NlzN9k2xhMSvbV859OxHqlVCPu1vm0f1jv9PxHAihIsR7RSCR5QyrZzUM5aZ?=
 =?us-ascii?Q?2aBsanqiKGSaffOGk2cm78l850x86fdAGvnoFBktJVKObnHoVq7DDwN5j0zd?=
 =?us-ascii?Q?q8mXTfslHAfjnl/c+GcLkoCA5WAq0jPNENa8wO6RBkWXwq6qdiGPXQunLlqZ?=
 =?us-ascii?Q?T7ksBL5Rx77ZvC/4w7i7vBCKLHQt+swa8tELZW2iLvy3r57A7WeAdZW3/3LL?=
 =?us-ascii?Q?WpynYtSPUBc9OQncY48ggGen6gfERanaHXVOeh0DII+Q3GMf3VUKU+5rjz4L?=
 =?us-ascii?Q?jILSjqHCBjzgbSfu7VYJGjY5yydTpZ6ugm4XVYyF0xzXvdyOnVBHp1QOAR2U?=
 =?us-ascii?Q?eb2hewNHJ8tOt8+z5fgX4K4dPdZ2V4cgwmK84t7YnxUd4Qv+qpOZmhiKNg5b?=
 =?us-ascii?Q?/bFtjOESJibSwQlQtrBMUD0EAMSxr2iAkiXGOISCJ/MUu1AITIQKb7YgirXJ?=
 =?us-ascii?Q?z17WUcE8ZdGfMpb9jXiv1MTA7a1PdFNBOjMdOihaaKhvBAFx1BgS/rEOhUac?=
 =?us-ascii?Q?GgqdH8U73iKSQ15m71QHIi8+rlJBFj2wTYmlQNobjNSIGYj7cjfLrddmi3sI?=
 =?us-ascii?Q?ZSlgbTh7YdN5U7hNuNaLXpuWYysIMKU3b3cxHBud?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e897b4-583b-4eb8-2477-08ddae2eddfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:10:47.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVZ9mUUo2TlkKVpWMhQSwDdV7IFn0oENcnLQy+sRzEl2Y5y5P2KFuPwPElXfK/PGzOEvPx3goOVMyE4oZwoM4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_231058_778586_6F43089A 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, Jun 17, 2025 at 04:19:45PM +0800, Peter Chen (CIX) wrote:
> On 25-06-14 20:56:42, Xu Yang wrote:
> > Currently, the USB2.0 phy on some imx7d compliant Soc has below issue.
> > 
> > ERR051725:
> > USB: With the USB controller configured as device mode, Clearing the RS
> > bit of USBCMD register fails to cause USB device to be detached
> > 
> > Description
> > 1. USB controller working as high speed device mode with USB gadget
> >    function enabled
> > 2. Cable plugged into USB host
> > 3. Use case is software-controlled detach from USB device side
> > 
> > The expected result is device side terminations removed, increase in USB
> > signal amplitude, USB host detect device is detached. But the issue is
> > that the clear RS bit of USBCMD register cannot cause device detach event.
> > 
> > Workaround
> >   - Use the below steps to detach from the host:
> >       write USBCMD.RS = 0b
> >       write CTRL2[7:6] = 01b
> >       write CTRL2[8] = 1b
> >   - As CTRL2[8] is set at detach case, so attach the steps should add clear
> >     CTRL2[8]:
> >       write USBCMD.RS = 1b
> >       write CTRL2[8] = 0b
> > 
> > This will add workaround for it.
> 
> Is it imx7d specific PHY issue, since other i.mx SoCs which use chipidea
> IP don't have such issue?

Only SNPS USB PHY combined with ChipIdea USB controller has such issue,
such as imx7d/8mm/93/95, if it's NXP USB PHY then no such issue, such
as imx7ulp/8ulp.

Therefore, patch #3 add ".pullup = usbmisc_imx7d_pullup" for imx7d and
imx95.

Thanks,
Xu Yang

> 
> Peter
> > 
> > Xu Yang (3):
> >   usb: chipidea: udc: add CI_HDRC_CONTROLLER_PULLUP_EVENT event
> >   usb: chipidea: imx: add imx_usbmisc_pullup() hook
> >   usb: chipidea: imx: implement workaround for ERR051725
> > 
> >  drivers/usb/chipidea/ci_hdrc_imx.c |  5 ++++
> >  drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
> >  drivers/usb/chipidea/udc.c         |  5 ++++
> >  drivers/usb/chipidea/usbmisc_imx.c | 39 ++++++++++++++++++++++++++++++
> >  include/linux/usb/chipidea.h       |  1 +
> >  5 files changed, 51 insertions(+)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> 
> Best regards,
> Peter

