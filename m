Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A238910F2853
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2ADv6UL6bOo/BEMG6mjybxFeVf55+SFBvgGoMGw1qw=; b=2mrTiPKn66WzNhDHI4+0O8xrRi
	wTeDIYCfmMymOPVKsJYBcwMMo1FPAxqlro/QncMYckidJ4eGkTtUUlHhoZoIVuPg8jlCBvgivriIm
	C0iTYeg3fKvVkRSt67DZQ+hRXacb6qymCzOGNv5Hl+dFwarjGtzOD5Zpg9PwfJXEj5LBxF9XDOds0
	Wn5PvnKLEiuQg/eMQMxekUScQu337gZS5kOBOaIKH78ko91GY6O9MsXTJPnFCG1GJ4dPJBV8PAI9p
	WxOnFIIwUOKksnNfl9HY5tgNBWKyZUZEfXXszUsi6eWWfKO0m89xTu9uESd5KtlbP9tA6xqLE+gbw
	bZlfff4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ASa-00000007oeu-2A2a;
	Fri, 27 Mar 2026 16:55:00 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ASV-00000007oe6-0D7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODtDIMqhMJlqagtGeIgnyy6CxZC6A0b8MvjTWJxvoIb4uv+b3JthUn8gMsOjeGZW9p6edUFiRLtwkzZZhcVRxCKJfhkjOIy8uotmstZx5EqFAR+tMlGRzzy/CrPKHZ19BVfVdPnR+llVphejF6XsImLfKNy/6ToqhJHl9DdmHUw1qX0uBOrVOZVjlaOpb/TU+m2yTrv7RTjbB3Oj2x+idifWLAbcmXPUd2ZriMmw5fssOedW22yg1t6RJyEVUmc7lrh3ecEEMbd17nLO1Xchz5QwJPCWiPgKXOmm7+NMJ/esPExFqSHTqpBMpCVRHI7y3Cg4FFQuN/LIIsNYVqDdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2ADv6UL6bOo/BEMG6mjybxFeVf55+SFBvgGoMGw1qw=;
 b=QVF/yC44/O5JMHD9Evnv7VSHQK54XQz8l79ZrDEZo9Jde5VAo1p884npacX3GdV+je9TyMnXytoBmCdPuYGZvHJdedoxPPeEcPhSugexC0K8CrI04kf9x4sDxoDA9Aw65l3BC8GuW+Lfk0kIfBh54cs+2Odx3nmnEoZVmzLQb93YbKB6hu+0xNfGgbFfwdoGcNcDyVBP9xVoU2qFwQ6K93JhQk2ZRXudESrmcVhKzs2D0TUDq4+Ui5XPXQnQAaXxHgM7SbHoOxxMuIA2dEZWJ35MO/bOhnQqcwED3yXS66kDdXRvlDPggBYTDyWGQAiG/VG1TV9M7id3mz87GKhH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2ADv6UL6bOo/BEMG6mjybxFeVf55+SFBvgGoMGw1qw=;
 b=LnBV8DQLJVKWwpclSZf2Sljk7zHP/uf30yY1LFcrSse+Eo3HVgHD90z7dicUjRy1eWhrwJ43T5lRa7hh41hUOZhdhW07FRfMDt0JHQl/l/YZfAWCCvZ88+u/B9P3tk60DExHfJPY4o7dbj9mu91naVyNEBSZvebDwjzHMV4iw4gXbAT6W0lk6U/oYZE7sFu2W6IdnXHWhpAh6S/J68d4YfJgwxEaLX0pGuG1oMfHAYxeIYWYr8N4l/UJtqgwfJFJcUSpN99aTb+4SFW4LAWjx3mtYm6b1+W5CLIK8XxPL9zVWftxZ9xH8XEyck/lvW3RU2JleIFgAjUHRvd5HOOrQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10070.eurprd04.prod.outlook.com (2603:10a6:150:11d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 16:54:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 16:54:49 +0000
Date: Fri, 27 Mar 2026 12:54:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <aca2UquiW9lFikhR@lizhi-Precision-Tower-5810>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260327-overdrawn-stretch-2311ec39aa58@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-overdrawn-stretch-2311ec39aa58@spud>
X-ClientProxiedBy: SA0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:130::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: b26e6c3b-6b9f-46e7-5df7-08de8c218ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IY5i3tMd/MX8Rzs85VhyNNg4AF7GlQQStPYFAgsGMZnfq2CvZ+1DfG9tsfqYQ6tE0H0FE8zT9mGJdWnYZrqxW8poj+sQ1goReTXZSf17NGeVEpMQqDuckdML2upNbvkDaVEIW9OqQH1op/1VqxrP0zKdxS+bnzPZP90YFrl3zP47DAH830iZycP2787rUsR7ofwowKyDxkqtJs6abOoVomyNt/ZhJ3eAlT+cPyjzHLqNpa1ttIk1CajBVJPh03tCBGkDm2skbXu+oQszwCMglvt/gCJUr8sOIfkDzyNQ8O+aI9qeJa7X2tau8PRiPmCMvYd+PaXDTXxDLzffJjS54LFa8IlIfj6tqubLtS0pcFfx4MinvHN0CR8L7MKx65f1OlfnHnWFss0PwCuQai1DAO4KqrsQ1yhZ8hkAQBSPJM17noRwa0cgQ0kh2rc596TKTioMbGGUlmgHOA1BGBNntTqYdSXLJQLczAH7ooAIEL3HDdwBFBjMjIBzX68tdZYV8SrfSiVYU74TB1JaKsL4A0+Ckxul28276yTCcuokmETtuuGyAMm7IF08WkLhrwph5x6MN4eDP910Oo2ujhXaIxLMtMSKL+FSQyUQ7iJwqPJH+L3eDrU6UQ+xjSNQyZy3OU/JBOGWJT0Sxi0OVkOf/a+mwKMVnCYGcgSW1a8HS1PqoHT3AEao+d0B6D7wqbnzhPHpidlCdJ/dtyK5toEU7IxFFhH7ynysD0PKRMH5Iu59HEE8BohTalVs3XweRC583lWrdJ0Ek0RmbUqAFSrJuc2Als3cCJoyjhwfQ3OJsIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpK5YvXWrACUe4KCE+BKS4mmlDjtE4w2z45pB9EXNEujNXeydW4/gg7z5ABU?=
 =?us-ascii?Q?mVo/Ja7z9qZ2YiVPpVM6/vT1kbTmXIecGu9zv7E2cr88ZI1nYP0JNzhziCRS?=
 =?us-ascii?Q?9W6jGD8J8P8061tnkI/dJYEJkH+Q7h84Pfz+Mt70FBAkqZOqHdJaMBJQB6Tv?=
 =?us-ascii?Q?NeksU3KDaQ+2HZ4FY0d6jdFa9Z7SmDWPk4uhddv2CTYjkV7K6/m4JrBRsX03?=
 =?us-ascii?Q?CK0jJEq8yf804tLdVRFP/W16/oocmbL5vNPhJFkDe2FGCgIttmjIe9+y9EsG?=
 =?us-ascii?Q?D7uwLp6TFo10CZXfT8DeV1l95MkElGwXETsdfm0APexbUv4UsRXk9i3IDi3q?=
 =?us-ascii?Q?p7DGlIrw+BLYWSupb8/Yc9HYhgX8YeJrfW+8fFXZOZfJyTAnsAcZLiyrHi2y?=
 =?us-ascii?Q?ZjXpGhoMJhn/3UuYo0r+fE9JiAds8B/JcI4IDrwg/ZstUR0od+rbi7ucGcC0?=
 =?us-ascii?Q?s87PHWvd1uSsuqdyKqj7sxj8SMNJh4qDlpQmbsXRUxyQMMqbZNMUDQQOTEap?=
 =?us-ascii?Q?Y6GS+c/Bz7qvqliHlSuKyCvxzA/fPeoxDP6kdQi4Zf1/pSLwmr/2hj+ZCNwC?=
 =?us-ascii?Q?2LBEDyVDfeNSdGNjX4zVppQm5sfqZaIfyyb70Okc7RGfGMwHgFCkyrAntHEN?=
 =?us-ascii?Q?Om5EF6BgenBJHU+gNamt9BvvnjsTIMCjKWEPQKF5ETHe/vuIB1B+1At4XkxI?=
 =?us-ascii?Q?fDqOIZKHtGnVSYkNdNnfHvaGHlELW+RfmDcngYrysFW8WriuQG+cvZjQmfIB?=
 =?us-ascii?Q?CHshFuxNKw+Tm/I3kPwpTg9HGPKTZiGKzZCir2MwHAYCcd52cR8eRFPa2NrV?=
 =?us-ascii?Q?YXaTpz81d0LoRhmNc/JSjNgjcYO0w29RpjQWBrt4o2iI7nwngi74OuazRj7w?=
 =?us-ascii?Q?HDLjCoonckFMadEQ3d+Mw2eIe+4LkldlHaML5NWquItIzM0QAZ6XgqUq/xeq?=
 =?us-ascii?Q?RD+4Ir8X/ZvjZ4CzG49DVZaR30WY+0sYXUHsqx9lhCR2Scjjxu+Rm2fb/OFX?=
 =?us-ascii?Q?WI6dVQ+fFf6uh/Kjzom71dhnj0KzDXXi83yU9xzNdIYMqcn0KC/aHdnqU8te?=
 =?us-ascii?Q?Ja63BDoyKavfFM8j41vDDo6fFHpf37VY/toFljdAtSh72T/nxDk9M5GwdXi+?=
 =?us-ascii?Q?hx3OL1ozYMgQPybu671NyjwpXSSccL0lk19AJrsAbjU27H+Cwa/qxX57fVkE?=
 =?us-ascii?Q?FORmAGZ3Clc+DPYjIFc26xkcLgsv9SRFh5D/WvZZa+lj+80WIFRxLtxXZG23?=
 =?us-ascii?Q?Je5v6WBCJaddfZ+456qftYozpQ3q8jCdJ1HidnJONHGfCZ6psbPqcnDrkvfn?=
 =?us-ascii?Q?QXM3Gy8dzxD5QO0HnO5Te/GObzo1huV9jlJpBsfSgLk9ywZ4WkLHuUlov7S+?=
 =?us-ascii?Q?hXd6NAL5OFO2xMsmEWeWqwae/9804h2SunjJrFAlOFupXMvi34mo3vrFrgXF?=
 =?us-ascii?Q?T/0MjGthxgckRxvBw8lF1ysscWjGV5SOyapSZS5cQklF2AIIhNuFTk/bbfL/?=
 =?us-ascii?Q?IbUjIed83TUh3T2/gDFjfEqlkVu5ptJ+NNu/gJhKJOAtS4k1ronzNKOqvpYO?=
 =?us-ascii?Q?Q1DimoiXJjtDWHN7c+uRVbw5Ni4uMBVOD0lGWquqnzp+9Npq84vJvO0qbaFs?=
 =?us-ascii?Q?G18S1j9NJHerLkWFjtIEMLkhtoiEGLGZVxrkTrEoehPlbPbvDQZrt1QTw2Ze?=
 =?us-ascii?Q?j/B1iz9GVRFY1KrHKntST2uirtA3y/uNo3lHTaE4lnUNMX5iAjySpXhMLK05?=
 =?us-ascii?Q?7UIERSKyKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26e6c3b-6b9f-46e7-5df7-08de8c218ed2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:54:49.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUOrrTW1TDNDVcH8tae06VVLRmeLgzyGiX06N7g9fuGUNZ/atiOsMJC+6B9pQKSFUyeUc8jhmFt0BtwK0aRs1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_095455_096106_FF5B1401 
X-CRM114-Status: GOOD (  23.21  )
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

On Fri, Mar 27, 2026 at 12:09:32AM +0000, Conor Dooley wrote:
> On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> > Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating DT
> > parsing logic from map creation. Introduce a new helper
> > pinctrl_generic_to_map() to handle mapping to kernel data structures, while
> > keeping DT property parsing in the subnode function.
> >
> > Improve code structure and enables easier reuse for platforms using
> > different DT properties (e.g. pinmux) without modifying the
> > dt_node_to_map-style callback API. Avoid unnecessary coupling to
> > pinctrl_generic_pins_function_dt_node_to_map(), which provides
> > functionality not needed when the phandle target is unambiguous.
> >
> > Maximize code reuse and provide a cleaner extension point for future
> > pinctrl drivers.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v4
> > - new patch
> > ---
> >  drivers/pinctrl/pinconf.h         | 18 ++++++++
> >  drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++---------------
> >  2 files changed, 74 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> > index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886a2e8dcacff7e1c6c529 100644
> > --- a/drivers/pinctrl/pinconf.h
> > +++ b/drivers/pinctrl/pinconf.h
> > @@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
> >  						 struct device_node *np,
> >  						 struct pinctrl_map **maps,
> >  						 unsigned int *num_maps);
> > +
> > +int
> > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
> > +		       struct device_node *np, struct pinctrl_map **maps,
> > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > +		       const char **group_name, unsigned int ngroups,
> > +		       const char **functions, unsigned int *pins);
> >  #else
> >  static inline int
> >  pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
> > @@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
> >  {
> >  	return -ENOTSUPP;
> >  }
> > +
> > +static inline int
> > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
> > +		       struct device_node *np, struct pinctrl_map **maps,
> > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > +		       const char **group_name, unsigned int ngroups,
> > +		       const char **functions, unsigned int *pins,
> > +		       void *function_data)
> > +{
> > +	return -ENOTSUPP;
> > +}
> >  #endif
> > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
> > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfcd0b57103c6ca950 100644
> > --- a/drivers/pinctrl/pinctrl-generic.c
> > +++ b/drivers/pinctrl/pinctrl-generic.c
> > @@ -17,29 +17,18 @@
> >  #include "pinctrl-utils.h"
> >  #include "pinmux.h"
> >
> > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> > -							   struct device_node *parent,
> > -							   struct device_node *np,
> > -							   struct pinctrl_map **maps,
> > -							   unsigned int *num_maps,
> > -							   unsigned int *num_reserved_maps,
> > -							   const char **group_names,
> > -							   unsigned int ngroups)
> > +int
> > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
> > +		       struct device_node *np, struct pinctrl_map **maps,
> > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > +		       const char **group_names, unsigned int ngroups,
> > +		       const char **functions, unsigned int *pins)
>
> npins needs to be an argument to this function also, otherwise
> pinctrl_generic_add_group() uses it uninitialised...

Is this one the root cause of then broken? I am not sure why compiler have
not report waring for it.

Frank
> >



