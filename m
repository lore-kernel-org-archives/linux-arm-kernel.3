Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD221C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XcpXhDPJ3vr77JyXNLw8QAHH8FMknZp5jQHbcBjyy0=; b=lc6wqF57K7ewFicsB1OsqxIIfb
	433tlSB9ucG5NnFB13qV1JmIGPbAm7PjMiVJ2OYNRhY4qhMgDym3TlVB/9E+ZhZRFbyDQhBTgxLnE
	YHHsnl5hsRLa8QQWjRDaVEMbezT7HJn0M9a66ac20HQO3qn/jXTuNkry6gli7AWViSCaa+oAZLoaf
	Cc7Aqe/6DkMov3HHG+tMhT9ZU4BvAutR8q9eOTNc1bsZAvhcSu1IUjnwolvm33KMq0qQg/1DS9f2U
	zwdeXN73jvK2rdD/Q3NbbL6/WAF74p66r4m2/M4sC93QqF5zzMBPEBvjeu0QOBIM0lUn+wRsd8G34
	i609Xn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o4h-0000000FI6E-2AIQ;
	Wed, 02 Sep 2026 16:44:35 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o4e-0000000FI3b-17jP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2YoyvoSMhJq8t19NCq2cNtzUSqSh/YjmSxEX2vOVKHt9mQenFr0LrQwYiV1NRd3AxRGbtDeSDUc+5SzjXf6/plHceS2sykoCRHkzITlKpsCsYoAGIBv43kfItCueDW7TY77AauFlKCoA6IKedPVgbzuDRc/rEL7tKM8bx8WDKu/5yHzElne3Sr2F+Izi2n7t+ddfhFkH7ruxZ/5U4e4F7/iLtgfxdkHeQXKpk5jHwXutsbdo2CDAosEHQ+cfh3c8PSiedLYWKHkDvIo0xEXLrTL1P4qDibpswsaoKC8FdDxZMZGMzqcYtTPS8rYkEBJIhdAaD7lBblIEGN4pbiCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XcpXhDPJ3vr77JyXNLw8QAHH8FMknZp5jQHbcBjyy0=;
 b=VU3N/l5Hkr4zub47UYibEEsGNvhrL5b5FBqom9YXN60SydW3HOEQkKQgLw9H887ZavuOB2pIwRihhM8P9KWv9JSWor45EKYDZZRncMyWgdcC1tp8+9qQTWmrWjiFSP1B9PzZrOaZoi3RPQC13JxEUsNogbMrlsJpwvxhvCDravnIoeFHX8wx1OREwCAMX57WrUrGusBZWCUsiMfnqZfjtJhjVHvkyTlE08PHvgKavvso3ntuPAVpjJ5Y75+2cnJxSdVcJ/8iG2GbRDH1eB2azjYHKIGqk6DCrgXSb3Al67CYYVqxrpVwNAS1wMAU3uIuLjwwGEadtr1VWbFQvLbT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XcpXhDPJ3vr77JyXNLw8QAHH8FMknZp5jQHbcBjyy0=;
 b=HtLSCZkIA3ehbl5HqOKmJy7pUceMAdi2vZgjfhnzuuZPcg4uJlto23+LR5mZRI9WwazUTk5jTqUAIezOTS4sGhxL/lply4bzosa1Wgxnlfix7FWKddSErKdsIF7Au/doMbxHg9LlBW7eWegIFRzhPYaSRy8fpkRY2G7lJ51PG4y3ZwRjzxW9ukEUW9ST5n464hN/Vbvs3/guibYTj4+X+ZLoWGmM60gS2SP1gdF2WUSdMmMnsLkyB1UiKpZWWQc9TEl5dCaiZx3Z5bcbLQJsrILEGrwmW0E17x3hZiWJILTAh812/NMZouqkbsTIQz6M9gtpV3237YX8nCS+QvkgRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUYPR04MB12644.eurprd04.prod.outlook.com (2603:10a6:10:660::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 16:44:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:44:27 +0000
Date: Wed, 2 Sep 2026 11:44:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Yo'av Moshe <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
Message-ID: <aphSYUS7xGJjj2gT@SMW015318>
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
 <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
X-ClientProxiedBy: CY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:930:10::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUYPR04MB12644:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f25d33-f4d0-4be5-8289-08df091173ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BqBHYKkdb1t1xJlpdpSLiqfq6tJCy388AX/3t9KccAtpFrqy+GA8Rht0rz7PKKDChk+gMGLCCv+YlWjrAMYyHLdyh1GdLE6JA27ngbMwlAAX49DFb5V3h2I47WpJ6XC2R0oIK/Hggkq1PgbAPElwdq66tZqjJMRIixllBUa7rukjF+NR7dnGN/CmhoxR3A+A+ck/0lees6PKKja3i8uYx7yjyXmR3lL3VvNusMZ6/Qe+AQD/a9ky4lO2Tp65VhazVgzXTNrmzcOhdDqdcUz3RXYOeYwWiIM3ayTMy0OBDlArdgr1VXFZ0iqKa8J6N3ufNQfsAttHc43CZsXXyEqkw94ixIY6+K0Uh7kq3qslPD45Z/6vh/nZr07M08MeLIVEU0qr6wzpO0eL8XAFjNEbIrC3jFLK3on0NKsthGG8oCifK5eY5zZ+ZuTrD/tsDAvtrdbqbjQzj06kMRJutz7B/E4btZouvWNdwPzhFAiTQLc7w1AmiLi5RiOyIHocmxQbok1L+wXY26bVFXon9o4TJOytFl3QUeItqdea3i6yaE533/fvGfizJR4mt69r+apdiUuV7e00tIiluX5g7T56m96lRr2hSfByRo098Hc20Jcoo7Ija1VuYckNExbfJSlixdOqmTnKSrm/SDyMiF4iJmCfjovjsz8VbDz+FdZIZ+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFlHWnRWL2t5S2lMMmtHMzJYWVovS0c2eHJwWnQvN05uaHFTemlGc1VqZ1ho?=
 =?utf-8?B?ZDVTMVhRcWpjb0V4RzVVMkdrUGNteVRmZlFPYjNvSkZNQlErWHJwaENnb1hO?=
 =?utf-8?B?ZXB6bng4K0FvQm02Umd4bkRzdWpXVjVXVTIzL1NqOFZMaE1NamRPL0RSaGMz?=
 =?utf-8?B?WTdmYWpIY0NsZmhRNVBVTjZub0NhOTl2SE1qcmRDNmNzTmNMb0lpdlVJa2Vu?=
 =?utf-8?B?NXplYXhoeVVma0ZkRytBNWVsZThOM1BiRjF0b1hTY21kdzBXOVVRLzhmZFpD?=
 =?utf-8?B?SnVvWXE2NGFOMCtRUWhUN1VzMEEzdG9kSGRWMWdhZEdJc0hTcElDY3pMally?=
 =?utf-8?B?ZVdWaDQ3UEVsc0pPb093K3pRUDd4WElPYUQ3SGtlYjhzdGFtWG5ZUE5zZmFm?=
 =?utf-8?B?WnUxVDRqOGxBSGx1cE9DY0tRRTdWSTVzYVprQmdiWjdCVU1PMHVUb2NWMGd2?=
 =?utf-8?B?UmlmUWN1WlZ3blAwZmttUUNHdUNXeFlHZTFKM0kwcnRpbjVCR2h5VkRnVnNN?=
 =?utf-8?B?ckk5NDV6MTkrK2xpQ2RxVEUxam91eUlkZmxVM2FBeE00bTU4SUFIekJGU3Zn?=
 =?utf-8?B?cVN4REtlT3Uzcmszam04UER4OTFmUTJNZVBaWjlsd0dIaWY0Z3NzRnI0UExq?=
 =?utf-8?B?dXhTM0lDcjNNRnB3SW9sdUk2WmxjdlYrUTVBcGVveTJUYjV3NzYvbGtjVUNt?=
 =?utf-8?B?bjRxN0x3a2NYZ3ZCdVdMaXIwejE3TFhqR3BETVE2djhqRUR3Kzl4NmRlNHNz?=
 =?utf-8?B?MUcySHpjbllveTFDOXVqc1RiU2htdGE4WDhvbVJiNUJlaUlMaXpPbTBtUWYz?=
 =?utf-8?B?c0J5b2JTSkNIQ1NIRmxIdFlsS25EYkh2dzZmNGRZeHhDL3VlS0luSnRBNHlF?=
 =?utf-8?B?VUxsd250M204ZjlaOCswemtJZVc0c081TnVVbHlTdFVsclJJQzJQTFh6QjQ0?=
 =?utf-8?B?WENkQklxaVErVGdqYkFqOThvWUFoVDY3U3cralQvYWZqOGowQjJsbTZLVHRz?=
 =?utf-8?B?VXJCaGptUFM4VzRoUUFrYWZxNjFNbGZ6bGRsRlhZTkVZZ1Jka090Z1JuZGpM?=
 =?utf-8?B?b0VkdDgyK1g4V2NXSHVRc0o5M1VvQ2dUUTM3cVZTbUV3VHl0Z0llQUJtRThz?=
 =?utf-8?B?SUNFS0Zya0ZpL0IzeW4yVW1SaGNTSXBvdU1FeXdpNXZ1SmRud2ZJbVpwS25y?=
 =?utf-8?B?MVBpWUZJRmVLQjV2dUVDOTFEZVh3dEhmY1U3b2kxaC9lbUVkY0dZcUtMcm94?=
 =?utf-8?B?aUwwcXhxc2pVbnpTRjlFN3NhT0tmYTlvakZ4TEt3L3k0UTEzSVd5MmFkclNN?=
 =?utf-8?B?ekNsV0RsajZoMDdMY1p0cklPSmFXNDM5L0hWZU5USjNocFZzUmJlODRoOEdM?=
 =?utf-8?B?VGgzL00xK01ZdkJ3Um93S3ZuTmRXUEdSTHNKWS9laGZGY1RncHRXUDJVeUNU?=
 =?utf-8?B?MmpqYktKV281VEFlNlhoc01nTWdnMkcxbFNjQUdGS3I5VHFXWUFOVE1YYXFW?=
 =?utf-8?B?VW9Ba3IwZEVrZktMTGZoMWhwS1FhZXNHWlZodGhaTDczdHd6NVlXeCs4ZXF4?=
 =?utf-8?B?ZEdzd1lQMTdSSTI2L0sySXBDKzFFYlhNSkNWSEJjY2Zob2d6d2tHMFQyN0RU?=
 =?utf-8?B?TWlmellERnAyZ3FTQ2hDaEt1SjRNRUoyNFhFbFYvRFNNRStGcVFhVVNDSmQ3?=
 =?utf-8?B?Z1hwR1lXemViamJ3QW5xZkxxSmxVSnR1dkpudVM2SktqTW1FQ3JWdUd0aWZY?=
 =?utf-8?B?YnB4dDdITUFQa3F1TXl0WmJIWlhJN1NldnQzVTBkN1BDcGxyK3hXVGlWSDhk?=
 =?utf-8?B?MXBkZkhqaVRCVUgweVIxVjNqdHNER1d0USt0dUs2dXBzK0Q0YXpydWhXVmZ5?=
 =?utf-8?B?d3ZJaDhpTW56enEvc2dFNFdqd2grekRCRFpaWkRkbFdkL05RdE12cFQ3aHlk?=
 =?utf-8?B?WkZENWhPOGVoQm01ZlBCQWZZSm05aEtFNmZCZGY4T0t0eVlyVU5QdDl3NE1I?=
 =?utf-8?B?djFTRUlUaSs5NHhGL0NaanpiNHRqMHhqQk93cXAzQ1dWR3dKWlM0d2pKUnVN?=
 =?utf-8?B?OXVJTTgrcEVGdjRFRSthdzdmSjNDOU8zSkJ6cVlDRjZDWTJUaFBheVpYNkRD?=
 =?utf-8?B?RmtIWGFPeDlMSkd3czlCTDBpZDliaTVKVDhYNjZmTi8wWlY3VXlDTytJS24x?=
 =?utf-8?B?SHhrdzIraFVuVjlGOUxWTnZnVk82U2psMlpHVjF4UnRvQW5sUEtGM2FQY2Ji?=
 =?utf-8?B?SFp4SjU5K010b0hkUk1lV3lwUk1QZExJcmxadlhJT1JBNGZBRlZoSFN5K3A5?=
 =?utf-8?B?T3dOT2VmdWxqeVl2WHVxdUIvQ2VOd2p4ek1VYk5ZTVR3L1pxZ0VSNXFCd3BG?=
 =?utf-8?Q?L/1nS60ufQbnlbmrWV2TB0I7Px9xW64suYn2a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f25d33-f4d0-4be5-8289-08df091173ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:44:27.4884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpTfdt0cO/R57Gday7Fi5mkC+nQDYh+8KjNyfIj9aJnaze6MFM+DHg/wcsKaoYFQ2CCpKCSnq2LP2bKOptkVxmg1YiBJ9iWzB6rIiwisY839xaUV7br/P+Cs0N1sWA2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094432_310950_6714BFF9 
X-CRM114-Status: GOOD (  22.77  )
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

On Tue, Sep 01, 2026 at 01:36:15PM -0700, Nick Desaulniers wrote:
> On Tue, Sep 1, 2026 at 12:46 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > On Sun, Aug 30, 2026 at 9:24 AM Yo'av Moshe <linux@yoavmoshe.com> wrote:
> > >
> > > The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> > > omap1 might suffer from the same bug: their suspend routines are also
> > > fncpy()'d into SRAM without a type hash and called indirectly. They're
> > > all ARM, so asm/linkage.h still seems like the right place for the
> > > macro.
> > >
> > > Do you think these need to be fixed as part of this patch, or as
> > > follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm not
> > > sure how to test the fixes for the others.
> >
> > I think separate patches for the others should be fine.
>
> Without devices in hand to test on, I'd be hesitant to claim 100%
> confidence. Maybe reach out to the MAINTAINERS of those, and see if
> they have cycles to help test potential patches, before
> writing/sending patches that potentially don't get tested?

Nick Desaulniers:

	Is this patch good to pickup?

Frank

>
> --
> Thanks,
> ~Nick Desaulniers
>

