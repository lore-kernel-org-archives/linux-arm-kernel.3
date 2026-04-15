Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1870F43828
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8p56otgLjCZlb+e888dmZ9XSwtDNUnQSwmvS0CVhV8=; b=F3QPbnQjFvKczpGeDmieTDlR4o
	qaeCudzqXmQnDyoGE5Vkna282HjS2H+MtxCzLhbfqKszH2tWKmzRFeIQmd8iY+dXV5NjXAbGyjs/I
	C+fFIdAM0sZAyeGOP4N8jBq/KNu/8QcwcuBrSE51F3cSgHmqqSYbfOFQmpqb2IIaIutah+yYaWkWL
	ix5oAIchw/99ZfB/KR4sEibIXs77yjvXdbps8nkpV20J0R4aoDIBDNIevG+1IfuqKuhxOPbhveteu
	T3eHpKDXqBV5DkVt02yfgGTbeB42kc1tEf5wNHONOFlzT59lQ8/aLBH107KpkXqELsa/0TO7rTE3Z
	47sTCWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Y6-00000001G5Q-45rX;
	Wed, 15 Apr 2026 14:49:03 +0000
Received: from mail-northeuropeazon11010046.outbound.protection.outlook.com ([52.101.84.46] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Y5-00000001G56-1Pu2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:49:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlvoT7dcXUZbjaIhkVj5uioglyPu7/MyDTaGdpuppjFTJy0/KqMaoPIRVHsFJb1o6IY28300zcs2JWCkDdGUDc3CR4CuE3MrQFrrvEW3sUX+SgYdocaoQsVYDknYp/V6KVCR+PXgZWtPnM4MtpvikqAWFhckBlxwNZGiBijcZ28s4xlMww6oT1r+qM4pJKsK5Rs7vg2lXYnvv2Rls0i1eFRt71zZ2VOMj0K11k+GmfOO3eSLzWJb6an+cFPCpOwBYBSPFAkAjBuwDTdFAFbFKK+4H+iUfdyumPNr5TlazknDhhBVvf1cUz8ERUiumK0s+1Yev63XbboSOqt7D1znPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8p56otgLjCZlb+e888dmZ9XSwtDNUnQSwmvS0CVhV8=;
 b=f2UEG4aZIXRTlkkqqoDqDiQTkNIdd2otooDeV2xQ3aS0MxuLT1NXS5SwU6HNm164Yrqdyttav5CGYnzXD/ohcdeuAt7GAps/7PUEBvVQjhhdb4RSgAnHWOD1gXo0sfCM04vd9R8Y3qFXV8P/wY4CYWkMSNy/Z03jD+0VLFvr8eHhujFjZ0nussioniWxk2+BVK7p9idfppRIXdfsNDk5PNvXpTQpCJYqbjVEEuOX7O/+FpS9rnTzmgbJv3LRxPGaYe/9zpNhlOcnMHyCIYqBzJqZvpJ0da7wvsVJHGVsExkiKfKiAKb3xJq5jxvTVn4wePLP/sUQQV26T27nHx0rjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8p56otgLjCZlb+e888dmZ9XSwtDNUnQSwmvS0CVhV8=;
 b=IpSW+m746NS2Qoh4M9edIbc4lTnyFJ1F5Nr59wOsRaoGl9Bjk8FCsmKJa9t/n/z5yIFPTlhDVR/sF90br/WwFTbdYECZxY9iXbTSx8foqGAKyYnfrSAMCKOKxn1YSYa74+BwPa0Z1C8YjqaU0bWjjbodI8fa4NWm5Sws2/frOwSP4VPCD67RHjm7fwiOyiGh3lvRgmZ3M1BGhX5buKuIuzUKsQjbiJaAsNkudFGGDYj3/NBuRZE9ICjczo97osRczyMm98aoQ2EP8tIyjyfsmg6ViTk2VS9cd5dQcccO95uWz9veb6GOizETXm+0D9H4mmK0FQXqt0PgWxbSOFua1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com (2603:10a6:102:383::17)
 by DBAPR07MB6630.eurprd07.prod.outlook.com (2603:10a6:10:181::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Wed, 15 Apr
 2026 14:48:54 +0000
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809]) by PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 14:48:54 +0000
Message-ID: <64ceb81d-68e0-498c-bcf8-1ebb83ac2d23@nokia.com>
Date: Wed, 15 Apr 2026 16:48:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Highmem on AXM and K2
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <8f104eba-6805-46e0-90da-232ce18973c5@nokia.com>
 <9ac3eb75-efac-4f3c-a3e9-6953db4babf8@app.fastmail.com>
 <f609436a-dd4a-43ac-9259-384d3695e709@nokia.com>
Content-Language: en-US
In-Reply-To: <f609436a-dd4a-43ac-9259-384d3695e709@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To PAWPR07MB9688.eurprd07.prod.outlook.com
 (2603:10a6:102:383::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR07MB9688:EE_|DBAPR07MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df7ee71-6121-4004-0576-08de9afe1d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: uNZHZJm5+4Nrzh4j/O7YgIdqCj9FIlNi9ts5/7uxLm/qF6J1Z4NHPtJjV6YBJ/aIf+Qz0NI4i246I2lAMcgNOyzku6CKNxELWd5/K12SkYocuWu/wjPi334cwL7Q7uW005mPUEoJ71RKyCFpKYXWQqdudwiKGm4dA9PNPF9KU8Ud59jCAFVWzVJizps0yyc5WhFh2QmPoZ5g1hZWUTL3m7oDVHclJFkaecs/kalzhIhi7V9p7eKvX/1NGtcyWqwAOe2K0ECTwcGLNASSIfKqgOKeEQn1ouv1MTsxFGqblRltGjIsuCrHi5r/7cuebaJDVoQ0rT/QhGq1tan39lma+W24o62Y4gvSHUGqzSPU9e1YbpkmTCWpsQhGqDbFoqPgk6NaMpVYUCLx25b7zAtwOQxtR3YG7r78Cuj7Y8t+4Pg7nI0/YtM+SC3nsT9DYMXrqr0SNuAuMw32y1c489+knNRAh+lmvBeIJ4AbMOyjE3JK5chMiOJAgxn3NFyTFOR4d8zp8JxG85vZRobZxgqeRHsnf/SYT1J6DPMg39JwTEffle8jTNoR/EtFkWbcm7L/Hs3kpFYeHJ8vCdJdyRpClbPNdBN+kOwrjmOL0BbHf1ap/KRHBxspL5Zsxso1alYuoy94OexOtz0c204Y6LZi3C/ZOMrAA1Sfq6u8z/mpNkBBT/Kd7PDAPvba6rbtGdhilEDFnt94CIIa0ngmYlMEr3n/RtvlbAvNxswsdMBXD4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR07MB9688.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZKcnV3VTcrTUQyUFhMUWJ3VXA1RXNsRzAyamxiQWR5RFZDQXBZRHBIdGhR?=
 =?utf-8?B?VEhwZ3VYZ1M1T0xIMGFvaXNpUGtFeWMrcXNueDNQWjFEb2tFRVZHOUF6WEVS?=
 =?utf-8?B?aW1obmpSV283azRyTCtKN1VyZ0c3R0VpYTVsdm5RMVgwWEZFV1c5VnI1dlVh?=
 =?utf-8?B?ZjVGc0ZTUUhhOEp4dWpOUmhndTY0aHhFbWk5MFVTR2Y5OUtsTGNod25MZ2pw?=
 =?utf-8?B?eTdaRFZDWEhpR2Z5enFySzMzNVNsT2NXRlNNaHBmWVZSWVBMTHE3ZWxhM2g3?=
 =?utf-8?B?SnlzSURXMDkvWW0wU0wydi9Ec1VhaUkrckxVWWNUUjluM0pyQU9seDY1c0dv?=
 =?utf-8?B?TFQyUmhjc3ZYWkVXZjhZVUlVcXZRdEFzZ3lMVG16enhKZ0NBZzFxc3hLYklC?=
 =?utf-8?B?OU9MMjI2Vkg0RVBUNGNncmZ2Vldudkl4VVR1N2t5c3JqbnJiWnRuWFlMVVpG?=
 =?utf-8?B?NWg2OGZWNTY4amR2L0VDTDZBTnlveVBYWEQ3OEtpdndCQURFaTdqbFJLbk92?=
 =?utf-8?B?RE1jYXRidWVoWDFBajI3bTNQcWhmU0Z4cFFybXNFZ2Z3MkF0cWNuaVMwSEY0?=
 =?utf-8?B?MzlzQlk4aXpsUzY4VDloV2F0Ujhsek1iN2dkVmoxanpSZEsybnZjRE91V2Rs?=
 =?utf-8?B?N2NLRjFPaDNjelR3OG9aeTZYTkhZODJTK3hQOWN0bVpiMDM5VWNtNkduakpo?=
 =?utf-8?B?REtnNmRYRHIxMDdKTjZhWjhwcnVsMkhnbUpWSFlVTVQ2SXVYYTByS285VFF4?=
 =?utf-8?B?TStuUFFKTGM5SFNLWkFkYlJnLytOME82ODF2dzdMMmM4b2JDVzRwNjJINW1O?=
 =?utf-8?B?djVKQjVqWnRRN3YwUThUTlArNmVYZlQzbmtveDgvdFk4UWRaZlNNWVdWYlRl?=
 =?utf-8?B?NkJQQ3JnZEs1V09TRXJpeldjT3M3YnFmaGZ1NVg0TzdLVGRiQy9HZDFwL1dn?=
 =?utf-8?B?Q1k4N3J3bTRQOFV2UzhWcEE4MjZMR1BCT0xrd2xoYkVSS0Ntck84SjZCaUtP?=
 =?utf-8?B?bUNUbENwZ3Vrb3JUUmxzdE9aRFMyRDEwTE95SFhTNlI1ZVY5SWVuL3R3NkpN?=
 =?utf-8?B?STE3dVFpUWFDdGZPZ2ZBa0hXMTJVMFQyWkNiUVdiQmJJUFZwdFozVlhZWGgv?=
 =?utf-8?B?djVVMHhQVGh1V2JMQk8rSEJLaXF3NnZ0OWJIQ1QwRkMzU0RKdXVobzNvNHFu?=
 =?utf-8?B?TXd2VlpCTUlPeis0L05nMmozNmJzV2FWY0k1dHFOZjFyZFZCRVIwY1RNekdz?=
 =?utf-8?B?TWtIOFhsUFVsQlVCYWVvZ3dDeEVYalZEMWpsbmZ5eW9vVm9WcTRVUWdYcHRB?=
 =?utf-8?B?OHFPazJ1STJGMEVEdUtnWUZUZ0JFR2lsNzhoSW4wejVNU2Z5Nnc2Y2I1bUpN?=
 =?utf-8?B?QXVzZXNWWUV0WjFIU0M5RktDNDlCaHVrbW9nSlJuL1g1cG4vRnlBR29uTmFC?=
 =?utf-8?B?RHFVODgvOGxwd0psVHBFQW05RFp2cXNJNU9IU0wvck9rMm9sOXZnR2dDcDl4?=
 =?utf-8?B?STZTZndZd0hqdi9GOGQvYzdqaDBtM2NwNGhGaHZXbU9GVjBOYVRXcVlCSnJ0?=
 =?utf-8?B?L1hDWmIwNDVyVVgzei9sTVVHRURWbWlyeUdQUlJPd1B1eUJLellLdkFJUmUx?=
 =?utf-8?B?cC9EWkMxeU5BcVhYb0k4SVRWS0o3QXNyN1EwZW9rOHhBWmlYRmUwazNCcEx1?=
 =?utf-8?B?Rlh1V0h6aHdWeGRIUXQxSmtMcmQ5NXo3L2JOUUxKN1o3VVIyWWpLSXlybmd5?=
 =?utf-8?B?Qm9aamFaN2N4RVh0UWVyNi9oWjZxaTEzZHZneThaNlNyRjdPT0tnL0RES3pO?=
 =?utf-8?B?NlNsWkJ6S2VmN3UzVEp4N2NrRkNQRjdEcjJiZ0poTWZJSlU0YUpCVjRTMGVW?=
 =?utf-8?B?MnVoVjVmUnd6R2RVVm1UUVV1bnFuQTVqa0R5K1JrM2YzOFBiVkxOQW14SGZt?=
 =?utf-8?B?TzRzZHJrbm1XYTFqQU1ndUJJbUdKaUIvN2RWWTl2L3hmbEQrVzAwelA4c0tn?=
 =?utf-8?B?VlRleUV3TnBsbldBS2EyRTBTeW0zU0k2ZFZKVDdGQUt0VGwwNHdjMk84R2xa?=
 =?utf-8?B?eFFxTkFkYTA1MjQzR0ZOekdOc2dQNTh1WmFDSGtaWnY3amtRR0FRRVJqNHlB?=
 =?utf-8?B?SVlzNE16dUxvRzkvVWtObm9JaS9Lc3RCZWg2YU4wMmFmV1lMZ2pRckNKMlc2?=
 =?utf-8?B?QmFQMEtnNFlxTmVJVWt3cVRsK1l2YWdoYWxPMTE3WlIzNWRLRUlXMVVQc0lK?=
 =?utf-8?B?Mit3QXdTR2U2VEhpb0hxeElUeTRXeWsrdE8xQ3pyamNESjVlWFA1MEZjcmpy?=
 =?utf-8?B?U2Y4QmFxVzVweWh1bDVmbnVSbG96NW5qb1hhRTVIVS9idGphRlV0NHRhcVpY?=
 =?utf-8?Q?rXxjS3flXBoq+b0k=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df7ee71-6121-4004-0576-08de9afe1d7c
X-MS-Exchange-CrossTenant-AuthSource: PAWPR07MB9688.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:48:54.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /d0taRa5FsBhoko/fq5vQPPvLds/fbxCuI9xFfW5z+PpqVMNSFa+H1dptX0XUdFWhGvBHWJxiM06G7/QrTmBlNvTqNWhoXScZ1S3jL4WsWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_074901_439502_0EADDAEB 
X-CRM114-Status: UNSURE (   8.18  )
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

Hi Arnd,

I would like to inform you that after some internal discussion, we
decided not to continue with my experiments to transition from
VMSPLIT_3G towards VMSPLIT_2G{_OPT} on the K2. The K2 is used in a
legacy product after all, and the more senior colleagues were quite
concerned about making such a major change due to various hacks that
might fall apart along the way.

Therefore, we will go the CIP path by staying with the last SLTS kernel
with full highmem support. Therefore, we would be very glad if this is
the case for at least the next SLTS kernel, supposedly to be released in
2027, as we should then be able (despite barely) to meet our projected
EOL of 2037. 

Thank you for your help so far!

Kind regards,

Stefan

