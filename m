Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7611D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZWFGJqWgrVel6JN18jUrwFa5tPXehQ9H5adeRXcoT0=; b=O9CtR0EYqXCGEhoFmZEMYkEssw
	HcLdVxyjO+c1hgIBD5DcSJQXnnu56mgvY29CBQmThtQlmUZwGMsUtl9wTe+tzK2DZ/4SDCANpBXd3
	dl+e/F5TDdhtAgaMrFFiHQ16W60XpGeCpW9jBl1wBc6fLwZhFGbCkQyQ4pgQzDdqbuMSNXz2IV8iF
	LfCXsfikApRvZ3p3EWLkHmKzbfLu7JkDl8/EYXtBPGOxKaANOeFg4vjE7FyVkNCjdUhIvTjDiEHOx
	g7A07xi1qzGinOZZTZ4DJC3JtxPed/jHibQzAIxlOmFdgygofiL329nYXyv4s18LB6PEqEgz5/9Ot
	jfVhs7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lBG-0000000GGlY-2W65;
	Wed, 23 Oct 2024 23:54:22 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l9C-0000000GGNg-2sbP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 23:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4I2lHP403eHu6zF860F89jZtJkiSsJ0AutPptPUWBS3H61o/oZGzCkUvnv/r4SsLmA+UkQTxODuTejh1H4IqZw17IvrMTt2QuDBCCmVhIElaaDLQG5kkNs485tzxcSdyUgfvwIvywf2axJoAUi/nnHAesL31+NyG7gUJBMJe7odSz3iYX/jgZjEhaFfJr8o8tdKtYXIRx7unyXCSt+uTf54UqCh+o4CDnaH1j8OKkHGJVS8J1BPt8KrMgmJ8raN4s4VKB7bdrkb/NJI3pE3CxNea6L+UTF3m1xV8JpTmcP3JsoMduSAq87umwD3VBI/iL/rFldeEjcTTwpFwrlugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZWFGJqWgrVel6JN18jUrwFa5tPXehQ9H5adeRXcoT0=;
 b=GIbrMKibDH36o/SSyKKCRHOoyxh2HUpmmfaq/ZjG0QsAuHyospeD+kM7+Jjaoubbxi5MawZ/cYFqiUYJ2UzaWnNimkzbqeYMj+74b49vcdmUl9HrYFDofCpXaqOd+YQdcHKulUWtA8KaLIQ3rk2PwyDcI0qGm9T1Cmta8a92Jsy3d2rFlsIqfBFMOeKgyLOgX7FNzwTD3429nPTcXvekHA8mP3pehYS/+FMeTlG6TM9ejEf2MCiG8h1/lfBVSu8yb8eTKD5zP5yB6GE12TeEoYNc6ADD3fEzRzFzhiz5KrEzYKE8OzTg/+upYvSZx9bOCsnXhuIDE24J2GIPm9mNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZWFGJqWgrVel6JN18jUrwFa5tPXehQ9H5adeRXcoT0=;
 b=Qp6MtApKhrdm+XPJw1GDnll8kJ29KYWUONuREB3oBytYf2l5mhOh1+EVsqCyhxleClj6M8lmJ0xpFAOj1A1Fw9rSVMw2/6AWsCwACtRBCWMdWCc+bXvEaW66Ld5hSjTP6VSJnkKKAdUnVSnl8DCw14UaKFBwhtW0zuOz8IqwVPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSOPR01MB12217.jpnprd01.prod.outlook.com
 (2603:1096:604:2da::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 23:52:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 23:52:01 +0000
Message-ID: <87a5eucr8e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
In-Reply-To: <Zxk9Vq0jtws/DNAb@lizhi-Precision-Tower-5810>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
	<20241023162114.3354-3-laurentiumihalcea111@gmail.com>
	<Zxk9Vq0jtws/DNAb@lizhi-Precision-Tower-5810>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 23 Oct 2024 23:52:01 +0000
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSOPR01MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: ab957132-8f55-40f2-f8cd-08dcf3bdb07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fIQP/0lX6daPuz/9UvRu4lt0PKgWIuPQAIxvKAdk3IhK4B62plYQOuOvBwCu?=
 =?us-ascii?Q?FTR61T6FQnVSLDJbiXNou80OtaqZMNhjC5dab7JPCNCOktFJYtyHkAuiFcEK?=
 =?us-ascii?Q?bWYcyGLw1+xvZk60JbGQGtEXgy03vQBmfngO7Y2BI+f6sZSBucE4zwLSbLzs?=
 =?us-ascii?Q?cS7hcJeybJ7MiP+BDpUO7WoF08WDPx4jBdsbATKc465E7C4Up5JlAGuMI0cA?=
 =?us-ascii?Q?E/cnMkajsd6Yss2fpz2z1F/MIcPjDPMhYq6VftryPCgyrf8UCWy6lJM5Kcrh?=
 =?us-ascii?Q?6KYUE/QtiEVI64KdQ/dv11gwjFeX2DE0foQEOoifUU+XjmpiR2uUwsilw74f?=
 =?us-ascii?Q?9IucIt2C6h96NzTd0w8vApR8A8PjWTic8qulsnIsN5cZf3/VzTiPCM2YRe0f?=
 =?us-ascii?Q?CDjtU6cpNlOypWUDvJrBA3mswWE97RllklSa0820XaEeY7sn+BZuWsIAThID?=
 =?us-ascii?Q?OFplEC3BzfIB/Ixipmiv1MR/bqtTVKmaCNn1ns85LmVm0kNqTP+7Gr8Ihy6u?=
 =?us-ascii?Q?/rLz3YfjY0pSw/1ZV/4Ot/C/uFO6+vw8myg0zkx70hKau73yG8Q5OL5zY9g+?=
 =?us-ascii?Q?tKBSBKBUnOpF2PXe8Wsuogho6E0ul8CPE7SVSjY8QkEn+ZezqVBlwLZtEdqn?=
 =?us-ascii?Q?CgpBlm7RXSiG1Ifz6hHZ+9i3Xo5GbdGRcKm2rGkHKOcmHrZHoDD7h1U6D4tX?=
 =?us-ascii?Q?BY+ukY7xRoZZ2H/96Maui9OdP4LXxdF/ld4VtwAEsfXjjutZPJyffXEGWWUG?=
 =?us-ascii?Q?RWmUcMcqarcTw/51tUSpsUFrXpZHSF+hM1Bq03a0vD5JV8TodgUDq8iH6gaP?=
 =?us-ascii?Q?HVdUiCIkH1rdPQx1XxypA6A+jFah0m1DSIhSO4HspJ2aK8cP+DD3Hy8sK0ub?=
 =?us-ascii?Q?wrAZHFdlrByx99j9iiR4sfv5E3uztAq4Mndooz0PT+i6EMG2TDXRbF5bYGpn?=
 =?us-ascii?Q?by5o1MffLKmah/xsHg9S67CTrcUdt4Z2v88fmE+jHJ+MARNymBS460ZsTph2?=
 =?us-ascii?Q?xMbYyiTuL0DVabeAoedT4mgas+g9MvttAacS0Kwi6dE38DrOJPLMe+7cHzUk?=
 =?us-ascii?Q?nrKjT6ZtK6iGiPWxX3LXnd3ULmejNewubKkVADRnBYQ7Lc5mRVBOrueph+Fm?=
 =?us-ascii?Q?Yh3KbNMEYGoZZlP/rcekpW8MX3jxCLeahFwubnjB5O/GbFmRvXgfQLuR13Ji?=
 =?us-ascii?Q?f00m0LHVBtZPdlGtCh/kL0Hux5Zdl/gLRbx7ailrMYDZTYnz/6V2v4TWYCIu?=
 =?us-ascii?Q?GaiSV4MSewKJuH5oPU51AzRHPntfl35GRHEKW5NPfEta8S6JeK9SOu2k/SOy?=
 =?us-ascii?Q?ZXKEK+HUydGfzIUvAWmEfsNo449+m6qd+yO0I1X48b2rx1ximhc76ajLAQmp?=
 =?us-ascii?Q?73MGR7w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MiXfoLGasGQMg7OWv+ES+EAy0CaqFKvl0l4hTIR+Y7f+xtRLpJW5TpZwtGKs?=
 =?us-ascii?Q?RxNcHPyKQ/j/FlGBjvReIgnvsyEyCdlHOt+KBzPKqIqoMn3ydfVUmzHhsXhi?=
 =?us-ascii?Q?p8BVEJ8Gm0spu8Sftm2JzOfuvrMN37zO/3hpxGwKCzuNZX64Ymw05+uB5nWZ?=
 =?us-ascii?Q?Aprx8qHVFfGekJGwy17TsjBe+JnpWudZs/UxrFq97jy3yOBhOHDSHml4fLnE?=
 =?us-ascii?Q?zlZMxyH4cqexi4tWnGa5v+VKXmT+7wKRaSaJYQUewc+7v1EPXz6/NL8gHXo4?=
 =?us-ascii?Q?9P4/mUYEu4usk8HGQHOtcsbNruMR56mZfB6QF+GJ7SoBYl3HlSF6OTSXACrw?=
 =?us-ascii?Q?GKLfBbTQSUFL39ShO6HDQ3pkGtEagheBVUL/zypRitHqjYcM9iWF96T17s3q?=
 =?us-ascii?Q?OMoVl2K51cD9DVwIutIXvQOjGft1ndKbAJTNBL5MYDNe2x4nResP4g0+lUmS?=
 =?us-ascii?Q?RdISrYLO4HMseeModlelkle9AbU4rv+JZFgZQQq94HSpg/CS70IGPSS4auLT?=
 =?us-ascii?Q?hQyQAXVyXCR2382mjlB1CCoPgadPvm0oWJQ0iLd6nx2iXj5EDNIn1skA6AWy?=
 =?us-ascii?Q?Prkx/ILPocbT+mfbJ1yz5XtWTWz/evbDUyq1qpucPWxst/Xx5Gfs8wdmZuAO?=
 =?us-ascii?Q?0ALIuQNuSBncqSwBPsUrN2ds+f+Al+Xz/kt2gYErQm/4DzZghEfrQDlAbypw?=
 =?us-ascii?Q?F2pEAvejUlF1On65MqRjsB5ytg3RgttgUiQTxjoOXqh5FZAJxYRF9Ppg/Qiq?=
 =?us-ascii?Q?Wto0TSgcC52N67+yV8YJhM5pNCrqXAfQ0cGasnGCrDN59+ZbAbGnct0cr4Jl?=
 =?us-ascii?Q?uR/plJhSkZ9378Ece6iRG0z68N1190ncJI+uoLcN8RH5sI8a/qBLuX+BP3jC?=
 =?us-ascii?Q?3p3HHVKw91dfyjmVNT2Dz7mxu01hwHVeWQIQB12B2UzZHIBjM7UdKHwoxpdC?=
 =?us-ascii?Q?wA0XelZGs7iYj2v+6gaShNZSSt58CN2bMbt0VmHUdNpWPQ3llNqVY8UGXaWQ?=
 =?us-ascii?Q?PDINpG5TtwtT1HaxTSz3FiGNV/moUgSCSiqkpb0jXmuSA5MP3TvtFaPzJn78?=
 =?us-ascii?Q?hytWx1wuWhAqLdwaKgvdLJdOq5OB6K3Xj0rIU5FTYhZyi47IqVphyx3C9Pv3?=
 =?us-ascii?Q?k7K5rv3ZYFT987+ozjm2pBMjSTcwN0dUwf8kwes54MaObIJObLoocbI87ueD?=
 =?us-ascii?Q?PtQaM6bgViyqgYManXS+69GmMPiuvRjLnkPXbqKVDQLaqJFj78Qh+7DnWN3W?=
 =?us-ascii?Q?YXV+emgXylqJ9aByNws5T0qAQk8ZA3R/dnnW2sDEpuoCpahQ7jAteAyjmS2l?=
 =?us-ascii?Q?NY3sak4ew9Wlc+D82QOG0acJOXEXqgqo9vH3fAzlWVnpO9nqP7TfMrFlTBoe?=
 =?us-ascii?Q?heQJUpn7N6JNoRKH8YWd7FVvEmjGO1cRz0e149DEXOf4DvgBrrX3O5Lg3zeL?=
 =?us-ascii?Q?Ndi3sm5mgSbUP5fdfYJKp5GxfUGHGh5VL09Lb1gEIOatbbMyAdaK2RGoMVQr?=
 =?us-ascii?Q?ST+HXXzYry4UeasdDLqA19dnjG20BZAR803V/2Bl5Cg/+DYFUn7lSR+J53Xa?=
 =?us-ascii?Q?wx0U96tcquXio8yYyu+htqAhS4DEfo3ERKVrQrKEdAgKjZu+X74cnQQTLL9J?=
 =?us-ascii?Q?yA3fmIU4E0OVS1oEJYUR9Fk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab957132-8f55-40f2-f8cd-08dcf3bdb07c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 23:52:01.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AfcE9UL18qpbg7PJ2q+CRTKBPZl8f9X8WtFqgALjIaHSwjaBQjgdIvjDg//9geUtuvBRdlvALpEkZUwuuH5dlbMxfNk8Yf8IV9jIM/lNR3e/RfjmINK0VMDDSlWGUm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_165214_864857_03756B16 
X-CRM114-Status: GOOD (  15.70  )
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


Hi

> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Introduce the 'widgets' property, allowing the creation of widgets from
> > 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
> > introduce the 'hp-det-gpios' property, which allows using headphone
> > detection using the specified GPIO.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/audio-graph-card2.yaml     | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> > index f943f90d8b15..f0300a08f7fe 100644
> > --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> > +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> > @@ -37,6 +37,15 @@ properties:
> >    codec2codec:
> >      type: object
> >      description: Codec to Codec node
> > +  hp-det-gpios:
> > +    maxItems: 1
> > +  widgets:
> > +    description:
> > +      User specified audio sound widgets.
> > +      Each entry is a pair of strings, the first being the type of
> > +      widget ("Microphone", "Line", "Headphone", "Speaker"), the
> > +      second being the machine specific name for the widget.
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> 
> Is it possible $ref: /schemas/sound/audio-graph.yaml to avoid duplicate
> these properties like audio-graph-card.yaml

You can find both "hp-det-gpios" and "widget" already exist in audio-graph.yaml

Thank you for your help !!

Best regards
---
Kuninori Morimoto

