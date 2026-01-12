Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7A2D26D97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La7vhpckIi/SspWsyQr/fK+xaQkNATBhPhAGpbbOW0E=; b=J1241GT01cZuJPzz5rTMzWG5YO
	IqOIP9DmcXy1AMQ3+VKX7kKq9DolB+t9z7m2bfcwbVWZrpR12QOISqs6aADJ7CBsvxKCAkY8OOgt1
	57BJ5yPsGcWpB1lN7p4/Y4HtD5h3pE1RA7YqLcsOqNpTUukVXCzWEQjhKFwI73xp6E3WF0lF7lNsx
	GK0AlwxIG60InSPu//T2Jepky9UUqpcQiVkrWS8cVVUd3/JqiU0+imvKWbxkvUIsts/ec7qzBJJ8v
	03bGeF0w0oKtl0Q5OyVuM5abHE7dEIfi1Sk0kHw6MOwNiyGeoEdgZbf1uYHmOVIFq8TD5hp0Z0G05
	V4uF2KNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF0n-000000059iz-28fM;
	Mon, 12 Jan 2026 10:19:01 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF0k-000000059iO-31bB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa7BNtV+ZfcU5+F7ZH98DKiC1mqVnU0e7OK/SM1ScUcOl3yalxhzcOYkaqhtyeTAKKsMkrBJnT33Sqph3xP18V7ViSFiGrVWJiUOMmj5AnQXp68zR/tz9N58InqPFIZQ1DF83XjC2YrplQWkb5GGLLlZbFaEQfd5O2m6mULCYx74hHdtcbp7UIAAvPVRVUp6adIt3OO0E64tnQS+vkTFmMguru+7UzsWJav2cWrDmJ+kxWJOR/j/X7/Nub9pw0lrm8WEBi104jpKOFzibBbh0yPkQWCwSncBjr9vgP5HaBSfKV6sPBgcX+tIT/cz+audXq6WBxcrjp72CFmiR8Pdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La7vhpckIi/SspWsyQr/fK+xaQkNATBhPhAGpbbOW0E=;
 b=u4F9btoox5pXeMwZrl0Djwx2H2T4XAwIUfrayFJ6lO3GsohmXdaObYQg6XsdO/N1v0GG/eUZyYVV9ahGw4OhAvAX4NplPOzhXMTkq+xFDiuH7Qsm06ojCqjtMLyi9RFfLfDIPgm3xwbky0Hmc1Tgbsmx+gW8vdYeIsSdkDWZVbByEpHU7tjspJyytfzMq57PDao6kng0lu17gmHIq0ExUZVTIq1wV4SAYc1wg0IV/Jyl+mK9Iwu2naJXBRTkpIBduS06YzDu9pf1oclEFwab7rxjmq2MgdWwKRLK2xdiMB8R3DymT163Sk1VvtC7WljziVbN5JyN5xeqViQmOu/Mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La7vhpckIi/SspWsyQr/fK+xaQkNATBhPhAGpbbOW0E=;
 b=g2Kpz+0yWgCzBNPgetLny4D2wgsAeNu/KcQN4al0ucc9JGvZYlh7ng+TQLL07z2IPN369mEKOIfDcuJJmm59uvqpxopEcLP7Kx8szCrMF6wM4DqQKzy5sKSIzq/jTQ3GGKtfaRiaYDa3idlt8KUvcjztXJ3y6IxHwCKzYvQU3jZue/qpdHbdtAHX6PgQA3HcIQ6Szc/XztsduygLKR6qNEpZdSnViY2+sWCexSQgoxuvMZnzkRvBMyYgl3pEyAUqIjxspfqcxc4IeWStc2R5wy3p+colGPhh5wkUSNOB6kqGBc46udvfXUsfmrbZcXoENXKBpSkypo68mmwhtFhCvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:18:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 10:18:50 +0000
Date: Mon, 12 Jan 2026 18:11:35 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <gmesaz5t7wmkj4n2pyauluznowkzatazn2hnwm3uwim3kx62uz@jlgk2aum6llt>
References: <20260108103521.2139824-1-xu.yang_2@nxp.com>
 <aV/RLEJQ0PX6DCAn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV/RLEJQ0PX6DCAn@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c85385-0c80-4228-1ffc-08de51c3fad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZPPkMuO3F5YsC7V6oLvDoCiC5z7MbRDGCh3QciLbOKmz1eIv03kTiptycIy?=
 =?us-ascii?Q?xsA3gt6mvq5t701tGaV/qkgsdbH5iR6mk1R2EAQ7BG57G4jKl9nPbooIHqVy?=
 =?us-ascii?Q?KvSXZ6suwcH9wsyVPrY9nCMYvDwgXH/eh/2yiTPrWs380ULKRJEqDl/pnO0p?=
 =?us-ascii?Q?fB2L3f7jAS2GG5nkeUkgQy7TmgEecNbK9tYxS9+yRk6g+cQlGCzewHrZzvxI?=
 =?us-ascii?Q?m0GklvzE2Wk8hmCRl76a82WnBsHcUHPB5RMNqHaEhNQ1Qm4JEWlqjSzeXS/K?=
 =?us-ascii?Q?hQCdcvsw1kbluwqteLb4H/Qu972DauTKqmYv2FS+z5uwKhLEPl6+YxT0wpWn?=
 =?us-ascii?Q?Evy+Uo7NTlG1Xrzrje5anSOyQDhLi73EHVAcKf6Qt8WNwvBebdGgWgjpYpdo?=
 =?us-ascii?Q?6vZlVdLgjADlXzkPkCuKMP0ATitWjXvw/jtF9mOcgcCR5hKO4g0+QsPd1nb9?=
 =?us-ascii?Q?481PR2m3sl09uv0ZtgnispFjnmCoA7LOhOeqeoSZwF9Z0FTBlRsDtq5u9WwP?=
 =?us-ascii?Q?mzScv668t9Amdq3/nLYq8TUl2vPPXQW1gKO/Gme7ydAsMeale8sUU0+LJtRa?=
 =?us-ascii?Q?ufpKj9cfDrHg04ZO70WP6OUhF0fuOXPHEXLUb4ZvOYWIbxZFVqOWUxXnrIwb?=
 =?us-ascii?Q?YZLsgvCeKFg42odYEc2YXDWAdglsmFYdGdWWyGwzgBHQDnuA73uI+8lE+H3r?=
 =?us-ascii?Q?BWeSEgEkf3TdJqX/pJiT+3iLwBe9W14CvXckBOU6LUF++r0T0Up1edZ+fthE?=
 =?us-ascii?Q?N8Md0aOQr5cLHcGGnqLApUexoEgoVqVaTU+JSQ8XScqdz9O2RY2tFWJ7sQ/h?=
 =?us-ascii?Q?GQ/Eo5A9Zz71K3pje5ED2CIlvCckSlRIvOKKK55BVvpXUm2lJn5hwqWoGZKl?=
 =?us-ascii?Q?tefWKzXj3YTtAyVpM0zJAsTv0HB3iwvrQ3eiP49anDVCv3pdo5NyTKiCKPw6?=
 =?us-ascii?Q?Md3he1fukQYcTR9mK9dS8p9aHPP1qpWJ6kC6QxMW7LfzETNyvj8Ong/SQkr+?=
 =?us-ascii?Q?+lvWSOWBzPaBhAwsxkcKPW8keK/y8LJYzBrPNj8PNHJl6A9RZwSUMDf33o2R?=
 =?us-ascii?Q?FGN5QUzuSf5NsMzW39V197yl7NHkpFFjxkGga6MJADmNSiJUKgGxaQwrHrjy?=
 =?us-ascii?Q?78LxX4arTCTLNXWY1o/OFLPuv7c2uliWFQmBz/5N73w0ewadvKReq2KNWSsh?=
 =?us-ascii?Q?9CybnK2Pu3mrZ31FU2U51V3DIFhBWIxFggDd519atP5pQQcI3IYBjG8rz4zA?=
 =?us-ascii?Q?5mXQXTWztFLPS+pUngYdHiaDTrg16Vr0bH5/sRYce1EDe6hOarj0rV1khCmc?=
 =?us-ascii?Q?/W5vO5iGi02DpNxT4q3adcIG5yFKs27DvoRWO/DjVw9hWroNuRfjhHxhNYWK?=
 =?us-ascii?Q?GnjEE9houcOHVJ18soXEQ7HA4AuCVXoybEQm2VEkVUjXHaui/BeTo5xK2jvr?=
 =?us-ascii?Q?5j/G01QHQlJFN9LcNoVHQi28kcgi7ENTM97nh816ovEeky3dEr5qfoTv06WQ?=
 =?us-ascii?Q?aHCHdJuERr/8nCOlrcU6VVve53mMtZwSAuNN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qL4bFLM2QGPolW3vcsvmje3mvSNPOVBcNbaSqwluEyOCwIV696veg6rhkV4v?=
 =?us-ascii?Q?qv08msD0RVaas2D09SCR1W+ENmlIsDhAgxfvw4tvlPsejcfZTgyF2m7U7605?=
 =?us-ascii?Q?7JjptiXRQkjV3YXo3ZlaN7CFe7qWak41nBrGSHH4rU2rNZL50STO9ZvSTCY7?=
 =?us-ascii?Q?LFJ2UI7LDetyLQXw6UmWookeP6XY9MAVuh/BJBMAm55eWInwFIIzH8V17lRv?=
 =?us-ascii?Q?pVR0LFi56+nEOziGlsYuP4PqE4f8IM0OrmZ6MpyJlZgsIKiIclON1Gjr/wHZ?=
 =?us-ascii?Q?daSCYRn+meM6stxbX4/Fkq7UQ1dUHg8y3acg2muU+LII9kXk+xDszB3tzVyT?=
 =?us-ascii?Q?c8is5OIEMWdgZF/AtjbHikHWWVlw9NhuMxNDxYP2KREZmSVs6+o9S0XBfzGo?=
 =?us-ascii?Q?NpI7LL/o4HYI/xn378WbDQoy2OGmlqXLiIU6nyK42+W2d5b1vi8VuMaMDZEP?=
 =?us-ascii?Q?6FrTilHWGDEWBHdMWBfX63E3GIg/VvuupcDpcvDm04Wl/awB310Qm0J7AdIT?=
 =?us-ascii?Q?Gpn94Ic9R7QZ8P2t8vZhrvKxevabXMw7oMfgUJieJFScgRzU0a/FDGV9V3Xs?=
 =?us-ascii?Q?ik+1ExWvW2Tpm1azoZ4Ld/2yEIbgF0y1BYW4ksoBa1TbZ8w34VvG2L7qJ88Q?=
 =?us-ascii?Q?TducxtIXpNKm+/WNYT1eWfT2sqG534lYF/LOvz3D47o/lkaXyX8VapvH/OpR?=
 =?us-ascii?Q?+whha9tQraHAiRBjcEkafIsbXaSKTY6LTuVa1SzrpjXscTnveXJwcb4A4heE?=
 =?us-ascii?Q?onPQc1uJHL8Je93ryCpNANw/51OlkSof0ft1pZ/pm2/n9NcasKXIz6avf+jd?=
 =?us-ascii?Q?8Z8Cd+fA/RRXbVPWr4CPiwnv84KexkRTLkGv3FVyk2J3J38/GhVQZ9u2BOZO?=
 =?us-ascii?Q?GsNiiX9f03a1ai8k2LRLZRY0PAttvFAGPNZ2V+S+nqhdkGeQvzVBtlxlF2oZ?=
 =?us-ascii?Q?Ih+wv67m6EeCL0fgI0Zaw+NLO8hki/ixw1fw2zTg7eocjDdrfzcdmIKFN9FE?=
 =?us-ascii?Q?nNoMc4f/C/wgA6ebSDIPtaHIdzufLksITRc9rFb9tBBwXB9CdU66f7ZOVjeY?=
 =?us-ascii?Q?1bIffYCQeRbxvKu/SsD5fRWJVX7Q/C7nLBq8h3lvsy/BoIUPs96VA5d8NQCa?=
 =?us-ascii?Q?7cXpTn+Id1v3EOyfZYokYoQ5r5+528Nfat8gUDNLhHRJBviE/8zV1Uux5+gB?=
 =?us-ascii?Q?K0GVDmEDnx1sJpm88JQd0QE5U81KIBPOdqHLTgUUnJmxSgY6bNlYmMTG3JdI?=
 =?us-ascii?Q?oEXB2GWgNix6LQ0j6ApiLI1hddEOgPmkIWggWgwpO1MHpV3yISnaqW0fvMOy?=
 =?us-ascii?Q?C+8L9ofq+cVJhEQUZw0e8bo5KUzW822wT2V+Q+tks09pw2NmUb5ihNNNTQmr?=
 =?us-ascii?Q?YpnmMUKZ7pz9pEYoZ2lZgHlVciRf7ox/3kYmVY/lm2f5AFYa/yj+nHihTytU?=
 =?us-ascii?Q?+/dp/YNkpkGZaJJEUOyzmqFoJsTGP/NO/BykbyeiKP1otnzDwMS/Y/vXFHeu?=
 =?us-ascii?Q?dObEoU1upywb7XXW6pYboLGnouvcVchpPBc5qXJ1GvlC2GctubsZ2anXDSgi?=
 =?us-ascii?Q?c5FBj5h22IkfeK7vePGdyyRpXlw9tz2C7//DeEOFAjXTETV8ENhGcMRdf7on?=
 =?us-ascii?Q?H/LDglRyCBliy0fAX/ILA3tAs55jisP4S6da1PLp3DiW11ErRgnvwFQW/0lw?=
 =?us-ascii?Q?iwzpFH/cXa/BIxQ+3d/r1daKYSCpUhdf4kM96PgDOqi/EOPb4/9gsbdfbpnU?=
 =?us-ascii?Q?8P3S4ecR3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c85385-0c80-4228-1ffc-08de51c3fad5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:18:50.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBzHe+iaOgZSi9U2ghklLkTefG3RqEcyd+C0e9aM59o0n3xAdFCa0lqGbecSRTxjKY3rTzJqp4+3m/Eqy5C/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021858_761140_980D1EAC 
X-CRM114-Status: GOOD (  19.98  )
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

On Thu, Jan 08, 2026 at 10:45:48AM -0500, Frank Li wrote:
> On Thu, Jan 08, 2026 at 06:35:21PM +0800, Xu Yang wrote:
> > Currently the wakeup and controller interrupt name are same. It's not
> > easy to find the correct one in /proc/interrupt at the first glance.
> > Rename the wakeup interrupt name for better distinction.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index d4ee9e16332f..e4345e0eea59 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
> >  	struct device_node *np = pdev->dev.of_node;
> >  	struct device *dev = &pdev->dev;
> > +	const char *irq_name;
> >
> >  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
> >
> > @@ -525,10 +526,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >
> >  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> >  	if (data->wakeup_irq > 0) {
> > +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> 
> Need check irq_name

OK, will do.

Thanks,
Xu Yang

> 
> Frank
> 
> >  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> >  						NULL, ci_wakeup_irq_handler,
> >  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > -						pdata.name, data);
> > +						irq_name, data);
> >  		if (ret)
> >  			goto err_clk;
> >  	}
> > --
> > 2.34.1
> >

