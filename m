Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A267DCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdufMxQrBerxw6uliF308LAwtrH+UKJc1JvOBnQVbSM=; b=cX/Cji86mapLfQtXXhymwpB4Zq
	LZv7RHQivskeIlDFINFW76GH1DidTus25jb/cmY+zXBRb90pDvBGExc2Sc+IppFu0KoQyj1BV1xr4
	AxNulMavcWTxGogtMO9OZ3PtBGfkZI+7gDmgPR3znRMMPhRMxmtiNHnAlGRgySETcthX4su76o96g
	tlEyX8Yo6BjzEeIIj2V/cTPlclz/HS3Xq20ri0Ofe1vzQRG61CWTke+AKV78+L1tl+XkUFugwryaR
	dajGNxQoWgNpD/asSRNEuilZ339Lb/2B5rAlSnDPx6lNS/7PUKiIPAN7FoNMPgdWoL0Troao4a6aL
	/ai3S1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWybS-00000005x9C-0vFt;
	Tue, 09 Jun 2026 15:42:58 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWybO-00000005x8C-2CGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkeT04BO49J1OUAhvAsWAesZKSY6ji7tuZhIPx/xLErCrFVuzM3QxtBXWwY3saRLP0qWG+xG7k/9asjdJZcPNGhG07lJK6nIi1NvlSdPq4PmYqrYTnfIecHC2vwGy4Q36D2848NhbPynprnrtC4v+sJKX3fT+0KkamRs+OXia3m+MWyApO79NnQiq3e45zifpJDSHgNmxv73gsTMPNTews0bhV8FelycXPsZ9zAzelLhr95qYXgVVDUVABz4CwDAnzUpUksWxUldJSFGsVpa8CBuuaZ67srnFikv9LrV3eFVIvbKOJNxIlJSbLSpJ/BzA3OHjSNDwqJqfy4hlP0h/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdufMxQrBerxw6uliF308LAwtrH+UKJc1JvOBnQVbSM=;
 b=Kgmh0jjKQ5LY32xDkqJTMJwGcd8OMcnALb91s5l7ExROtjHNwnaL4BMGEetox572EJYdMXVYo8DLyW743OOrXkKlusAriwKQI5sH+TpEavrTFNbt3wZLMhtVCOfAl2Kj9aoI3XKChINXaaFPwee+vhCU0RNrI1FG1porTf+KusUhZWr6vKalciyG67ND02r0ZuOG0YV8Tf+5Tl7nHtMgZBY68j2XAh92sq7eVOug25WMWpJS//UNDCONC1TwVVunhxnqx3d3fhhVKbUSOHr2kNyClGTr5vS6Za9gkKC39q6EL7hE3l24R/eX4uQqkGPiIuIHF6g/qUpJ0j5HYv/OzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdufMxQrBerxw6uliF308LAwtrH+UKJc1JvOBnQVbSM=;
 b=EMJ4Smpvt4IgLSqK7lq0svfI8IevcHMlw2ibtVcYtrxUhArM2AiPnkszDIKj42BRy/96cTHr3VYFb9oZQbFxitL0DenE9o37rPfkDjQyEWLepw3JI8oUYTn1uqLk4ggpx7TrJStPEIHmD03P3osJ/z7PG2atvSMq4u8y5yOgmJ1yyi71jB+O9ozx/UQjEEZ6u2MB9a/YVDp2/A+H6BnmS2zw9QvO9Zmn132WBdw2zTPekULrPTLKbzIFHZ+V+0fLZ8LoXL59BzWvhMI7JHM2w278aojjOOTYsB2AE+vL11jkyEUyJxfUiVUk/Jpvf3uZplt2UUzkPpk994YJrsUMjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10492.eurprd04.prod.outlook.com (2603:10a6:150:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 15:42:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:42:48 +0000
Date: Tue, 9 Jun 2026 10:42:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/STI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: st_fdma: simplify allocation
Message-ID: <aig0b8Y3L0omYrF_@SMW015318>
References: <20260608051829.7390-1-rosenp@gmail.com>
 <aibs9gb5M4-gbCFY@SMW015318>
 <CAKxU2N9cTuhj4WAu98+6m3qb4Yy5NwZQHcnKUa4ra86+M-S-cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9cTuhj4WAu98+6m3qb4Yy5NwZQHcnKUa4ra86+M-S-cg@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10492:EE_
X-MS-Office365-Filtering-Correlation-Id: 53eb53ca-3300-4575-431c-08dec63dc1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|19092799006|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K0CRdm6SJ2ISqwHZktZsCZVN5bDOclUX7FWaa/MJlR6KokERqrUOhJltH8qpMeynQB89ViTD8K9waGhF/aGgicxi4iqhRq+PC+AUHpEtCyQfpP2Y9y90v+jyNtKmg155/cDD8MenaZcHXhnXNjk2kn0GwaChSoMFlC8og/37jjAZjD4eeMsSK5lPzKE/WyCVJTG+OYbymz71no353GWThnX0UJSLENuirqRoAf3Z/7GtV+bDqYPA48olm9ftG4vDJed4zQS01SL/I3oVQRe7MWOyE3XWn3ANxGbar9U3DtAnJu0cYehOgDzA6rXYbIqq9jlexNFY0aiHHc48cTqFneFsJfBok6FyDsNSdOswj3dTKmIsy9ezEhvMbDlEOaQuxIl+BvWG7r2ylMOGDYBdqlWIScSpNuMDmsYfqBEQl6BfblMX5ukavlUnrXBzbf0CWk77ubY8XDWLXKlYbSH9RPrwlzi8mh/sSSWvXCDno1cPBPpiEh07tIPLySFU1jw3i2FSTD8R+LSyZwh+GqpXi+ZUq4xO1M8DIvKb7PoMLRSOI6NhtjH6wnA2x7Nezq8Oz/ZbFJNnVVphe1UsNCMXi+nm9sSvgcGP+JZOi40bZPvHaX68Q3E3+wfKw2FvQyis2hgDxwH9V1PTV+APdAgM33vUigmEFMEnqWCXQiib50neTUw23cSCrLSGaCAg0Tpq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBNTFVRbWZkU2ZYT0ZHb1BvK2FQQVZacHhyZTRzc0dMdndCeEhVaERNTlpi?=
 =?utf-8?B?dXlFUWZRUHRvQ0IyaEV5d0pneUVMMTI0T25qdDdXbEZsdnVDU2kvcGY5TUhs?=
 =?utf-8?B?Mk5ZUHpvTVJ5amlOYy9rRUR5aVE4SFA3UnNnanY4ejBoN3hmWDF3SCtSTmdj?=
 =?utf-8?B?ak96R2FXVzJuNnJ2M0xVUXR6TVZtRWZlM2pVaG9VeVovWmpVZytCNzMyRVlK?=
 =?utf-8?B?d0gyVnczbjVEM2hLdEpIS0R6RjlYTW0wSUJ2V29vaDJtcEhUM29XR2tRQkVK?=
 =?utf-8?B?Z2o1aFNxSUxCVVBqMUpiRng5cE9wQzIyRHI1cjVtd0dIdFBmRUhSZXlvUHY5?=
 =?utf-8?B?Y1lmSEtzZTJ5MUVhSFROWENyTWtPZ0puaUJjajFDbFB2Nk44R0lUTmExSzcx?=
 =?utf-8?B?OFVaajhxYzV0WVlrdGxJOVV3dlFHTlBaUWJBcTVKRmMvTEFYM2lnT3R5V0Z1?=
 =?utf-8?B?UWduZ3JPdkFuSmhIY1YvU1oxSjhnY09XT21QTkIzWGFESlhtYWdaNnp5Rzhl?=
 =?utf-8?B?eHRYblJlUU5xZGdHVE9ldGptMFc4amx1NlFhOWtMMGxqNVo0by92eS9kazRl?=
 =?utf-8?B?YkVJTXlYZmRsckNEd3czVmRtVHZndW94dnFtbFp6Zy9QWkV3L000aE1kVGFy?=
 =?utf-8?B?YkNuR2k0WE9wa1JhQ0ZKMzZTeGoxWWVxZi9ZSmdBTGtmL09iRk4rcHplcTQz?=
 =?utf-8?B?ck5xbVNxMjNES29BZTJkYno5ajRuZmNRYXVxZUE2YmxpWEx5aUozeUFwbXNM?=
 =?utf-8?B?OXlSQ08vYm9laHUvU0xoV002M0hZMTVWOElxOXU4VmtEYTF6VUdIcjNVaDBK?=
 =?utf-8?B?MHlmd0huUlhYaDFaTGVSMmQ3WWhhMG9jMStuc0JDK25jYjZ3a3JBaUNuUXdj?=
 =?utf-8?B?NkU2V1RLQ1JBbTM1ZEROdEZzRi95NU9lMFVISjAxUXJtNVcrL0gyNmQ1Nzk0?=
 =?utf-8?B?MEtFS2N3WTcwbXZOcnNMdUNHYzBWbUMzMVFHOFBPTEhCc2poSTZnWWxhSlJ6?=
 =?utf-8?B?VytPci85dTdRcW5RMDNvdEt2VkNIRWRLU094MTBaT28wbGszZmtEY3FKZHhs?=
 =?utf-8?B?U2JncFJROHUreFdqcTZYbFQ4dTM1dWZWcnJ2UWNJQ1pFTGczdkJ2OUhSbmVH?=
 =?utf-8?B?S2Z4Tnh6L3NNbkUyc093cURORU9FdXQ5SUUyQVZRM0xXaEJkWUNxbW1SU293?=
 =?utf-8?B?clVBOUEzMU1KWU1UN1FISDN1aUY2Z3R2TDhXV2crcU5iQ2VLR1ZBa0hHV3JJ?=
 =?utf-8?B?YkNlbGhWODY3bkNZZjhLd21ESG9iZG1xbEJqRHpmMk9EN05La2czVG9mMDdr?=
 =?utf-8?B?VUhJcVZVTjl3WncvRUE1ZkI3ZkFxRHRvWjY5SEZwS2czOVVqSG81VlpkVDA0?=
 =?utf-8?B?TGM4dEpmeFNXcURPSm9rM0czNit1aXlmUXFEYmJySzlnaFpXUGlMRzVhTndX?=
 =?utf-8?B?NXFCM2JrVVZxM3VEK3NEY1Q0Vm9sQ0RZTjVLRGorREdxall5ZGdTOUt5Z3dr?=
 =?utf-8?B?WU56L2FYQW56Tk5Sb0lkVUpZd3dJWWZ3cnJjbXlVczMzK3h0VTY2OEw5ZE42?=
 =?utf-8?B?WmtZNVJlN3R5Qmowb3dCR2FtT0hxVVJIcFg4NkRTSWVTcXM3a2t4dzh1Tm5i?=
 =?utf-8?B?Nk05QjhRVC9nZ2pydnlKa3loYnd2akhXTVJOcGVrNk1NKzRSQzlFUVhZUDVF?=
 =?utf-8?B?dWJkdkRkdFBNNUFOOGw2UUxuVk5vQ2d5R0xxVUFoOXBhKzZBUzFIK3M0N2hU?=
 =?utf-8?B?UmtxUmtySHpDcURxMFJkSEt3R0tBV0hqUXdVdjhNTk51VTRMUjkyUHNMTHp3?=
 =?utf-8?B?LytsVG9nbjFkM1RIM0t4ZndZdmIyN1MzbzVaMmNoTkFxNUd5SkJoSHF5SjZP?=
 =?utf-8?B?ZnFDODUxTE9oemZDdWM3TkpYYzRYb2VaM0VHY2RSai9sMmhNc2xydXIydXhY?=
 =?utf-8?B?MUdZSk4yUktDcDZmdXFRbTNDbm9yY2MyL21yY1NRL1hvWXdjTmtZWlJxWU5H?=
 =?utf-8?B?NEJSeXliUlVhdzV0NTNMMGM2V1ZFV0pPeHBkWEZxN0ZjQVE0dXB1UWJCV2lM?=
 =?utf-8?B?NzZ0cGF0N2tkZGUxWnhIbUhvTy9BTW9wY1kvOFRqUzNsS1hjY1JJTkd1NjlO?=
 =?utf-8?B?ak5XK3FVbHVqVWpYYVV1L3UwMzJsZ2pNeWVQc0lNbG9Oc3NLTmUvNDZrM2Ez?=
 =?utf-8?B?QmxIeE5DU0ZsbFZyQzhENjFuOHloM3Zoc1VXZnllY0VZd2drc3VhZnppVnl1?=
 =?utf-8?B?ajVyMGdwZUFFUU9TbGtUY0ZqTDlHM2xINzJlbzdjQ1pWK0tWdEU1WDlBdWZX?=
 =?utf-8?B?NEVnTllJNTNLS2xxbnBnb3RSWk9IcGRmMklreFlnTzIyV3A1WGdVY2J0ZHBV?=
 =?utf-8?Q?CIzdOuTlOIroWuT/4pvv2jvDNvx/rDBGil0IS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eb53ca-3300-4575-431c-08dec63dc1ab
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:42:48.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Rj+JgGFf2qR+pbS/Dc92Hm0Ho8fs/QL3e2O9zU4CmwOO710YZzhnYy7Y+7IeB25PVjFurQXsG/VJ3jWtKbGLK2YRW/kpKKWPVX6g4dEKFkVQWbpQ8Uzec2ESdbFPpyo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_084254_942507_A9D838DB 
X-CRM114-Status: GOOD (  11.70  )
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

On Mon, Jun 08, 2026 at 01:52:09PM -0700, Rosen Penev wrote:
> On Mon, Jun 8, 2026 at 9:25 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Sun, Jun 07, 2026 at 10:18:29PM -0700, Rosen Penev wrote:
> >
> > Nit: dmaengine: st_fdma: simplify allocation by using flexible array
> that's in the description. Did it that was to not have it as long,
>
> flexible array member is the proper terminology.

subject should provide most important information and summary what you did.
prefer pattern is

	do what for ...

	It is too general (simplify allocation\fix wraning\....)


Frank

> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > > Use a flexible array member to combine kzalloc and kcalloc to a single
> > > allocation.
> > >
> > > Add __counted_by for extra runtime analysis. Assign counting variable
> > > after allocation before any array accesses.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >

