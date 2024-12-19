Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4BAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGWDX0R84XuAGEi9n7N8xM6kGbIxCeVe3g8ZonOC0kE=; b=i8kBfj0BUTVxQ6rKoCAotC1/Dc
	XuPeX3zRXjcxL604wsSOn+iTwj0eUbekJadJ+F6DgwFTO1i2679vZ6JHuuKY+gQ9jULYhA6+JyiZz
	u2ESJaanGy/0WTcEnL/jm0LliQxHYLjY3IefZkVGMO+N5zYVqJ3xRog27K39yVX1tsWOa6faI5WSX
	ziydMA1jXwUK1Zty1AJw6Cf203FfkTU8C5fI/9kETRPT0x1B+50yH2kWI3AhpCbVxhuN8gw66/kiH
	fp6n1MYQzLDC0Z9j9EsMesgwDsyhZ7ctMzr/gMz8Nx4mYxhYTG+RSLSBxhGMkvLG/vMmpJfqAuhyW
	9Uoi65ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKeN-00000002cii-3YcX;
	Thu, 19 Dec 2024 17:49:27 +0000
Received: from mail-vi1eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2613::62a] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKR7-00000002a8t-0Nfc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReV75x9X2SrpsbuDJKHVbY9OldbGvobeYJTJtNAoFVFeEnaWEMnCD6Zhkaq6+zI+0pOoH1bjPEac42ZmqTjb5xj3doFhiuMHgcKfB50W5fHJr++yVNqOq6Flw/3zELDgaJVebaVXxKACCflKzkQZRmSuIZrD6pnuJf1pMUOD5a2pkJvD1u+3EVsfWC8LOV2+VfL1VuxySs9K8f1dwLs504sB3+feCQu5Xotu7LEoMhNyQ+qHWlh41lOqQidhnhNDzS3yqZUio0NcOAVnO+4WGVRRIMTnS7mCZ3tXlYGpxvFJ4GTRIQDh4lOfO70s9TEnK7GmKLCS1nyWkcTsnu41pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGWDX0R84XuAGEi9n7N8xM6kGbIxCeVe3g8ZonOC0kE=;
 b=CREn+s479eQuBBmaLvXVjV/lGoJSINtBGSZlJNuyHVc2SkNCSr1DZuqD7ApI7RX+6/6NrM2NP+Aws7iLQQcPpKc+Rt/plIfNMQD848+peJMXmG1QWcyJA3x7hw22SYiCRTgdwOlIVjPJXVi/AVb04t9iv8dk8P6qpoMlXSRUzK1BNgpSrRBBJQeFz6EIgPeyWoeFAEQWkqOJOyupevzpbpclHYjM3WrV5cZX57gQhs2/E4Q+2ftcz7X1xFZwjvHYvkkYStkTxDmHRlGh+SC75jMoqYDAhRmxGxbJhXkSvDEAHbY3yypYR/a7rivPVwrrqcEqIOv0jGMVSaWtXd7AFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGWDX0R84XuAGEi9n7N8xM6kGbIxCeVe3g8ZonOC0kE=;
 b=SeVBcOgjH5rMgGspZ25ehhS1JdrPNY2UItR4G4tNQsJauvr92uWZBY1+GLNgea6+2VChxDaeDxLKpCsmgtY/nQTBT+BeXLK/Fnmaym/ugkONYyNifabubhmd8dPzuht1thOnFrrtaQ0zqYjT1i/ZI9RPLV38uMbnmKcxTN05fffHVUSG4PacnEBV/YY2HUBXvIN1RwrnUvbln2jSC+Ss7yzhRn98ta7w6CJHmX/mI2NENO816AWhXdgbw1hOJ+lbNuPK+C+VClTJopqpYY66Bovd6WYPl09S74d0EkHXjJ46NI4gcplEtrVCoFNKZXPoFDdU62aBbsyVM497fOw3pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 17:35:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:35:40 +0000
Date: Thu, 19 Dec 2024 12:35:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] arm64: dts: imx8mp-skov: describe HDMI display
 pipeline
Message-ID: <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: b63cefb1-3b01-456e-76d9-08dd20538e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sf0WD/i4iLBF9Qn6h59ZkuwWxQV6BjPObNzHoLmLDXcvVvFPN+2f+roBpHeP?=
 =?us-ascii?Q?0EFhPNqN+Pmd/RIoNmwRVtM3B6t1shfLQgTHmHMv0wPXBUn8SZuIcxa2+bm9?=
 =?us-ascii?Q?gwKl1APDna36awpcwQt1IIaksA7fDb/7kWrsqiwxT3c/J6ndZ11zMVngqPIX?=
 =?us-ascii?Q?VtQTb8nDKqq4nix+RGmAi5z+KyWpIR0EnsGOzdKT9u36Mrqg6iycdZMjoo3U?=
 =?us-ascii?Q?xp47g9O6VUBzu74vAVrLfPYHj/n96YzLNSsJuS9qFcImK0/d0aL+ne9AqFaV?=
 =?us-ascii?Q?3BDwqop3CUMc5Gt77EFeL41c/zNog6Xg3rUdBO3q1FHgrMEhzWK3K1pHKRU9?=
 =?us-ascii?Q?e2Iq7kbc8NZxpVYBEYGn8fbmivuOCPuy3RIzlCb/9VfggoaxVlC4BTYiJnHK?=
 =?us-ascii?Q?DZCVPreMtQvwXhAn2Mc0r5yo9gIoQcryVGNve/2dQmtBLNMGpMAsBAAt67yE?=
 =?us-ascii?Q?0cAsqgvUIqoEuWOdFw3DBoXKTXU5+DqWLYimcgTFaFlCHls9v+lB0eFjQ8Ki?=
 =?us-ascii?Q?Z/KXBhxRIlEzuVBunsd+H4aRprP3CpvV65sa5/7qiSTTBHONlKzNTiuUFemM?=
 =?us-ascii?Q?y+xExJS/0N3NVOHzStZ9r1Un9xV5gGNtYScXyfbpBMs1aEwoG8Hn4fvCEZXg?=
 =?us-ascii?Q?zXO3zowb8fJ2dcIZ0zrIZ93MnAzloaeoOew95kqxflH9w1TbcupPOOLjlZNC?=
 =?us-ascii?Q?2leBQoEb4bJHJ32NRUt01+838KoTJBhm1a7HXBV7tWN2sedAL1gy297vvpeh?=
 =?us-ascii?Q?RapTHvon0a/w1QrzLayoPX0o2V0mUuLlTb/Iyvj0TZxy/ZYafg63+7QX377p?=
 =?us-ascii?Q?redhIIXXOM9Mi9RPgbHWjJqIkEMI4tcUQ5NrotZR7SIzYg5Etj7T92l/6PW3?=
 =?us-ascii?Q?Jxi7bL2oJUrOiTPNXnqJRCDG47HVIZMZA8vYEqCFX0ZSV0MlAl6i/6FHj/Q8?=
 =?us-ascii?Q?93v05pdF2SaBrBFhnwup2lAg2wpYBlwPqKqcX9CNXs3xnBH5L1yP+1YqQPQr?=
 =?us-ascii?Q?QZU+gBBevFdaEA4E/kEb2wGwQXwI8VgrCs+MafZVrioskkwt6OVjsjcXx73F?=
 =?us-ascii?Q?Jxflch+OXVHHalvuRekf/Ph8MfZDD6AQBXxjsMOmgcZKLb2ra/nuB3XO3AdX?=
 =?us-ascii?Q?cMUrScKw2989iWoVum7yrW2D/E7ta5tg8gwGkjRNU9Kou4u6LmH/Ain9E1bN?=
 =?us-ascii?Q?GM41HtHPB5iWqO/sszBbf0X8SfroEydwaOwPVg3lMMs+3/3MHZLedTzCajyz?=
 =?us-ascii?Q?mDNyk7PnSxLrrIaKslFpco1ohYMTAVzB6BgQMG2lH5V30iquYpAYmhEhlGbQ?=
 =?us-ascii?Q?ii4aZlK36rJE4mhSrByl4P4S+FjQvQE83CwyqfDIKnEG4RAMnGWvgHipyuCd?=
 =?us-ascii?Q?hI1F612A+oNkZx6Uq3nLOoJwlMwo6CE3dcLovTL8QX9gENKlIh8bWiv1nT1w?=
 =?us-ascii?Q?7lEVc4SPTerp7OCKacfOt4Dqd8uyR5p8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXO+RJJ5dUZAqcOzFfoJyjaOiUIzI7m8452cIgK1j+zx/OdzmOVNpcy0eGFH?=
 =?us-ascii?Q?IhF4gExVwlqFuXKCj7gMI/X0BGm5Z+jznBtx0tcNP4MEPeGiWpptXh6qA8Jn?=
 =?us-ascii?Q?areqoJEMdSidNgx8zamLjnupH9mLhc76o1HtC+G/55QYj3lURIHZ1WPoCzNt?=
 =?us-ascii?Q?qPLGmkbyArAaAapvs+05f2Lr42YHd1vdpcwQ9VzWCJmX3zqzOP8TzLl6cgUS?=
 =?us-ascii?Q?cUHM6jayl/yb+uWVhsxfKfGCizAf8m5ULoCBzxJQ34kSD59TMKYAfLMkjgKo?=
 =?us-ascii?Q?3JlcyjKFgikpWvwRpylz5lShGdggU8n7mufFvfxIW+o9P+4CdhNhI6qIY2QX?=
 =?us-ascii?Q?lzxuKF3OrjVD/okEtXQPClbjmYmEBjFD5V5XP4o37BJtaW+4JLGC898+LXwj?=
 =?us-ascii?Q?WYWVopybzW0jRmJXluMkOgXdmUMvMkQpI+TJTaycFsX7YcRKbx9/X5hAxOqF?=
 =?us-ascii?Q?0ZXlkW2xsz3TFTT/Vy7Rrtbufbr/qCMMvVzqxOF1eLigy90anXn3taJGKrKy?=
 =?us-ascii?Q?qvu/SoGfcnPG7Y0OitJ6Z2pmReBET/ufdX63w/Moj64spVKeT8TaNRuq2i9k?=
 =?us-ascii?Q?AeoOvARFcBrTW3e8WNSUZNrc0VdQphtp9hJLsm7szdLQSZYZckUXfX6PvUd5?=
 =?us-ascii?Q?Q2U4Q3mJzwUUxBoZ3LfAp7SxC4u95zVtK5YAbTGfXcQxW/WGI+7HBe9//Pb/?=
 =?us-ascii?Q?ALcrz54xvDhxLO+GjUgPfFJRp0tgdzF7TPJ7RlcxgPTP8diIKCv6nUmitOX7?=
 =?us-ascii?Q?aHG9MOfyVmF2NPqYxZZyZAtK3spqGPm1GTYWq34AGpmGAyYWMQIAed9HIEb6?=
 =?us-ascii?Q?Y1AJ6xPin6Hvmn91hZ5Qh47kTzOYjGUk8ZGIzb41pHaR9TmLOf4HX/nbIqcU?=
 =?us-ascii?Q?kJrA5ItyrcdISB5BctqkgaHzq7TOKJ8cMMcyKQMEzbUpLgu+H5LMPyUMmnTG?=
 =?us-ascii?Q?8KlFsMgZdHvEx2FCpHW3sC4svcyRlnJW7e/o/MY3eJuQ5GNBplRPWcltn/Z+?=
 =?us-ascii?Q?j7T1+gFoOshyevnWB3rDHeMzlZGCoHR2plpgMPMYKD9kc46+0ngpTrJ85RQ4?=
 =?us-ascii?Q?60i8lJDycDz4ftH734JpxC+anjx1dIWsYFQLhopeSNZpRSTbwunbQ5VYE1jI?=
 =?us-ascii?Q?mG3OHmUpseC8uc/rn8oks4tNPmt5EJAwU1qSIm62Z23wRLrXzFnek++TsjiI?=
 =?us-ascii?Q?ts0WgwVn+frbFmAEMtOmftuMLv7z5u4PHA6Azln/jwFvyUY8Hk0JpPzinAsw?=
 =?us-ascii?Q?JRtEqI7SSQBNJeQbJzHenxLlbUA30OzkTMnPQWeLSiPJTW6kMyibNQHAVZvS?=
 =?us-ascii?Q?h8MYAHZlrReDmjFz1jlt68cnanuVTb12G8PSo7HsggnNpwwk2UNN4/AZaRxg?=
 =?us-ascii?Q?WUgcy6EIs7jEkbKoopXiRrEWhSngPGHTJBHA37utQu2z5NO1kwWYZKxiqejX?=
 =?us-ascii?Q?z4RzLps0f/SWoLkQvloSRjXFHhJDMN5oO1oyRbbzYxfTFQi8KcbL8kd+nuwQ?=
 =?us-ascii?Q?ukfpvZw6aivVMgrwZL4fZiivutMYxze9O92ztPrRemXHpdOsz3QwHEBrO0Ir?=
 =?us-ascii?Q?SMsNiIAtJxyykDNWeo3tpe1QtOTJCyOvLhO5iEUP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63cefb1-3b01-456e-76d9-08dd20538e43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:35:40.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEAsK5KG2yfHQQ80RgkdKPZYBP+QtuCSCSfBePuwto1ogMLJGkZj8iE8y8ksl/BspIBBjx5DffXrnhG/Exsi9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093545_128306_AD7604DE 
X-CRM114-Status: GOOD (  16.74  )
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

On Thu, Dec 19, 2024 at 08:25:28AM +0100, Ahmad Fatoum wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Back when this device tree was first added, there were no i.MX8MP
> HDMI bindings upstream yet. This has changed now, so let's use them
> to describe the HDMI on the imx8mp-skov-revb-hdmi board.

Skip your story.
Just said

Add HDMI display pipeline for imx8mp-skov-revb-hdmi board.

Frank
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> index 206116be8166..32a429437cbd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> @@ -9,6 +9,21 @@ / {
>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>  };
>
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	ddc-i2c-bus = <&i2c5>;
> +	status = "okay";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
>  &i2c5 {
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c5>;
> @@ -19,6 +34,10 @@ &i2c5 {
>  	status = "okay";
>  };
>
> +&lcdif3 {
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_hdmi: hdmigrp {
>  		fsl,pins = <
>
> --
> 2.39.5
>

