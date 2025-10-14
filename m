Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E513ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLqnukW3Q9HCWPZufTy2x/FGjoLzmib0EjVmBFzX76A=; b=KIkKC+/QIm/OFN/HyCFixD8/+k
	lNBdqTOMkGsMFKgr+aeCswgGBU7Hwn7PKJ4+UMdujihfPWcHH3lxa/Pqvi961mCY3kiAic2naQhfG
	U3pxdPBkBiXvAiIsF50viuHWVEGJWGZbNPtEM2t+nFapBUVUimc00lkUP0nja2UBfRaduWOote2Yb
	vwvkhXKXkrkn5Ns5JF7C2XAhFmz5rtOEHXnquUnHALwl5OsqeUiKs15VS/Gn1HzW0G8mEl3UjlYhI
	yS2eJf76ckPTzFbkAanAcuoLRWF3d3umY9YuVyU4e/+kXsj/ljsfqQNCydF2UqramIeeQDICTgpsL
	qlybPz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iHK-0000000H2p4-0zFX;
	Tue, 14 Oct 2025 16:53:38 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iHG-0000000H2oi-3a7k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 16:53:36 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EEfIuC001994;
	Tue, 14 Oct 2025 16:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xLqnukW3Q9HCWPZufTy2x/FGjoLzmib0EjVmBFzX76A=; b=
	jcFfAFgHaid1r+PWGCfOF8klHNDqD1/t+Lf7RlIrQ6urVvNml5sBdw63Pg7dcVv/
	s5g40e/Ousq7M6iqVF7dDjYXTdsatU5DQ57bRVQiC4GJEeKk815unKAnEiGRpLV6
	njw8GX0jR3CFLKIqfJSqDT2y7Lv8jwkCnHF2NyeEcmw4sBcC/ZzBt12KicmpsLs1
	BlZi7gXwa7WZO6fusCa24YailOXnMqdE3ZCSJ1lfZQYB6VTk2jeUMk+n6OWVoIvA
	HR+p44fYs4/t9C39c+VXv2LzzQQPnnYxvPY74pe9vWhupb2B6MhMQay4SdyMHQK/
	EGYlY+7uINOgNkWHHUxpGA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdtymv08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 16:53:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59EGANbu026317;
	Tue, 14 Oct 2025 16:53:22 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp8xpa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 16:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuDi+xom4MU9R6IxQQQR/LaZ2CZYUk1B8ncdKy6TKtTC2IkbF3CMwyN50YpJ6cU1l0G8+8aKGGak9ADYdJgsjqY1i5agcdmdmf97mz6qFHkh9VYoMnCxPTu5TukxhghFOjaciAKyyqrz08YfuA9Gqrpah4DO9hJ/5GwCOP/q3dvdWkgGBcoWUcKJ/hD69Q/sJzvxIinEBB8bghzMsQI1KsqhN87N71/jjyddJoSugeUd9mga5SGtgZgzynOkySa7U8k5ebuRZtt0YraOw9LI/RtZSM2FTTHBU/lYcDEHyw5VIhTyNTBUtu+2vUBb7HGSNbGvZ9Jc1KswO6G/p8Gzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLqnukW3Q9HCWPZufTy2x/FGjoLzmib0EjVmBFzX76A=;
 b=sTJR/xSMqfvtZZNwegi0qEljS/cKYHdA5FC9J0VixrEDDXs2TfrgGIxMgameL4IKKTqvgdV6ieUemjXH9tOC89mfeLo4jw3wSSsvAJMwl0wW5uK2hmInSj2jpgiwzxFwAriwBcRV4TzAkonva220e6aBRBVWTxeYxEtwAt1KexezgKXmgLN6gnZaMdprpte5T49MwrCD46j6bVcJweTcvaA4TyS5JBDe4LUPaaIivN6qNRdcQP7cQGRKqNs9oU4Mu9kFTBCh2D7YqnJYTfueWE6jWdtlYo01VxtZjL1LOXdcEBV+j+Mit+S5p8hj66h/qiYEuHbEGfIn7Q4QJ41h7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLqnukW3Q9HCWPZufTy2x/FGjoLzmib0EjVmBFzX76A=;
 b=Z0ibdqHLq0rcMvWS3/U6zj5Nm5Tpd/+RPH3Odgakk0llVHdYdBkSt+HMtNlTUO9oDht6hqw3iif4UJL0GvnIu8dnyOgLV9O78RzP8+UmHw3K529kdhHfktYDq2bTBrDtawefXaW0sxzQxbMCYBMM6kSnAmoSngUjYh0xgHlG/Nc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA1PR10MB7264.namprd10.prod.outlook.com (2603:10b6:208:3fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 16:53:18 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 16:53:17 +0000
Date: Tue, 14 Oct 2025 12:53:15 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [issue report] ARM: compile error of frame size
Message-ID: <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
 <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
User-Agent: NeoMutt/20250905
X-ClientProxiedBy: YT4PR01CA0439.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA1PR10MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c70bf52-0f59-4f9a-d37a-08de0b422c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azVtTGVXRVVwdE1JVmp5NHh4eWV3aXJmZkpLcUYzeFpSU0RYbjRwSEVZdFdK?=
 =?utf-8?B?dTZHVTJQd2xwbXNRc2Y3RDFVSW5BK2N5WXNySWN3RnptMWRya29MNkJscHlt?=
 =?utf-8?B?QVUwaFBpZ2Z5Qms3NTZobnpCYlNCMVM3WFg0enZncVdVcEJGZHdLaThaSkJN?=
 =?utf-8?B?SHRBOUZMc1ZBN01XNmEzTEpMUzk0SjZ4bEZ4a3d0ZERqRXFMTzBUdThmK0hB?=
 =?utf-8?B?QVpxemZwRi83VDl2dVVWK3luRyt6MnVXQXFPaEtLbnk0Ty9lZTBJd3lzNHFu?=
 =?utf-8?B?VDI3dldRQzB0M2s2SjlQVmQ0cVdNQ2VHQjMvWDladTlPRGVtL0lOdHh1ZHV2?=
 =?utf-8?B?MHRnNXlZUHI3MDJ5VWVrTGR3SzRrZ1I1YzBueHllelh2KytiUjZ5QUhXOWsx?=
 =?utf-8?B?THNNT3VtdW9OWVd2SXRDQVltSjNqbGkzSWxlSVUrZUcyL1pLcldoZ0FxNXd0?=
 =?utf-8?B?S2Zvc0tFNTNlcXloczZQT29MSG5mekNHZ0dNSjNDMEZvcS9MZlBLMGZjOFR5?=
 =?utf-8?B?WnQ2NzBnU3h0c1JPa3dBdmgvdi8xSG1yNGpUa2lWODBFQlBtNlhEZ1FEUENP?=
 =?utf-8?B?N3FiOEFDZHUvUk1rQnpHVERKSTRzeGhUSDJacUxHV0dCQmNDc3hPWmE1SG9C?=
 =?utf-8?B?SzI2QXErVnF6T053dURMZllIWE9wVUR3Mm5uMWhJdFJJTXViOWpicjhjSnBu?=
 =?utf-8?B?V09nd2JGeWRYWmVjM3lwa2VHQytXRmVLY2ZiOHFVaTVEdmNxWFY5VmdDU1FS?=
 =?utf-8?B?YzZhRldlMzl5RnMvc3RwODVoZHBNUTlQdHM2Y3ZJUHFMNUNxTWk0M2xXcFlm?=
 =?utf-8?B?NllNck96VVVGU3FleDJLK2JmOE5ncENON0Q0eXhBb2kveUM3S2IvbEVQTTF4?=
 =?utf-8?B?Z09COFJkTG5VbHljWGszT3FtNVJTMHkwTjkzeEFDV0x3ZWVZd0FHR0MySG8v?=
 =?utf-8?B?WXBkZndZb01yWW1UZ21nU0tIN3VwbEd6WHRnaGVjLzhpTDBQWUYzUTMyYU9q?=
 =?utf-8?B?RG9FVDRJYzNpdDQ0VHpOWEYxdy83aDFXNGdLbHRNUFpDclRnbHNEMWZiN0Ra?=
 =?utf-8?B?RTA2N3poMDl3dk1tV01QUWpsUy9pRDlGOTcwYWpIaTBTZWJxdDl3TkhLeWM5?=
 =?utf-8?B?bDgyZlFwQUV2dGZCLzFhcEJRcERvZVBMWlJGL2xOcXhHL0c3enMralRDQXp0?=
 =?utf-8?B?T1FUdDg1dEZxVGhUU0xWcWkxNElsOVgzd3dvelZTSlhyeHBBaTA1dE01Tkpy?=
 =?utf-8?B?eThSK1o3cmJnOWFjR3lDNitud2N5azVKV1JiRFBHTHhXRGZ5d0ZYVVA4MDk0?=
 =?utf-8?B?aStXOWo5b0RLSUFlOTFHQVJkcUFjZWRhWG96cDdkRlFDaE95ck5FRklrYjRU?=
 =?utf-8?B?VjJFYU51dTNQNFplNS84T3RwVzhqSFJwVWM3UWpFbVdLM0pUeWtPZkdFZFJS?=
 =?utf-8?B?bHptK1VRRDFWMytkYTZ6M281QWxGY0F1WUVUWWdYVGxDOHI4aWVnNDE2ZE9C?=
 =?utf-8?B?TzlVSFlKUFBWWnJBRno5L2JmVlBJZ0JjaEQyOE5UM1crSFF6YktuOUt2WDBS?=
 =?utf-8?B?ZUR3S3JDWU9vWUR1RG9NZGlGVjFBS0xlRXRmbkwyamV5WkZsQStzOC8wMTJK?=
 =?utf-8?B?Z1dtRTJwSWVCcFloNXNRMldHMUoxSXIzeG1uZHZ5TlZaajBXbWxyT0FqaGQv?=
 =?utf-8?B?U01hcmhSWDU1UGFpdUFneXlSUU5Na1dQY2dqUVN3WDN2dVlQUW1od1BvdWFj?=
 =?utf-8?B?WU1vcG42bGphZ0FSaHVRQ0FLYzVzdFNtRWFUQ1l4Y3VGcHFvNUZHNEdGL0VQ?=
 =?utf-8?B?ZXBnazdEQ1BBMnY3Y2xralBYZ21qNWFnOHJRSE84cVdSRURxRUJpZTI0dG5l?=
 =?utf-8?B?T2hyUkZzN2JxcHlLUURwM3NQK0xWM0JFQ2RZKzdSa0pqM3hKdGxIOFlRbndh?=
 =?utf-8?Q?/lu0ScVf5SetX0t6rvu4q9wsd94BxUK4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXp2QzU5RmRPWXZ2VnJJN1FkQkJCRENDZXhuVFhsYWQ5REQxVStXd1BpSytX?=
 =?utf-8?B?UFllTm9wcjVpRERUdk9lbmpSMGRrNnhMKzNDN3JyQmRVMk9COS93ZjJtZjZB?=
 =?utf-8?B?bldPSXk5S3U1cFJrSmJnVnF2azV6eU9NcG5kdXdUS005R1prRUdyNFJQY0w1?=
 =?utf-8?B?ajIyT2N5QWZDZjdtYndvQ3AxVUwrZGJ5Y2RESGptVmxJRzdDaGUwZnBuUmgr?=
 =?utf-8?B?RFFOc0dHYlc1L1Z3L3MzYXJORzRGOXRPRTEyOHpTditPY0VyME5GSmdHbUVX?=
 =?utf-8?B?VzFGRTNmUEN5eHdKUkJBVThJQ0ovZkdlUCszWmtlb1pmcG15MnVFMjNMaWRh?=
 =?utf-8?B?TDZyZDRMNUd0SGNFZldHMkxIYlN4OVhVcGRtdHdqcC9IdjV5aFYxSGVkcjh5?=
 =?utf-8?B?RzRsbk1GOG1PNStwNzVqVUpaam9lRFpjYUNwcnpyazZZMTlJT1JYM2c5c0RB?=
 =?utf-8?B?Zm9QYjZnamliWXVydkFDZTJYSDdXck9hZGNjTzh3WnRreVpJNm9nQkZiUGtT?=
 =?utf-8?B?SG90Si9ocUlDSHB6NUZRcFZrZURydk9pMXgwTHZtaWs2OS96NmRMOGwvTzhR?=
 =?utf-8?B?UUVvM1hQeDBpYVdzQjBqRTZiM0ZhY3poMWdZcG84UTVsa1Avczc5WEdacVlC?=
 =?utf-8?B?K2VxNnBoeXNQNzJ5aHkvRnNoWDlhQkllejFta2NHTkhiRFVneFZadWZTcDhr?=
 =?utf-8?B?VitkcHQ2QTJTTGlTSjdCZEVjSkJhbFRKK2ZQUEh5ck1WMnRtWi96Y1BoVmFT?=
 =?utf-8?B?OE1NNi9GbzYxQU5lTUVTYUVFTitkVkpyVlh5M3p5bGd4bmZJSyswMDhpY05s?=
 =?utf-8?B?NjB1ZGFrWXROQjdWWi9aYVZYOWw0ZnRRZ1RPYmpiUjlYT3NNb3VpaGtiOGll?=
 =?utf-8?B?V05pSENhZlVvNVZSUWVXYU96NU9QS3BXQ2pybHpwbnNXNmFLNndNY3JqbzM3?=
 =?utf-8?B?dEZ2Zkk0NGJPQ3EyMEI4TklsS0NXQ3FGeHFhSTZVYytHMjFaczZ4MWdZZFpM?=
 =?utf-8?B?Z05XVkNXK2hFd1UzT1FCYjRpZ1lWcjNJM0Y0ckJLb3lwNGdaNWw4SERMOEdr?=
 =?utf-8?B?VlIxM3dtSTBYNGM3bkdCdk9DckZoVjdkVzhlUHhVK1c0OVZZaFcwRjR1bW56?=
 =?utf-8?B?TXd5R3Z6SGdrT2RXbXFtYkx3WHg2TlhTTjVGU3J0K1pud0MrUEFYaGRTQmNw?=
 =?utf-8?B?Z3kzWjRpd1dQSW03V0luRmoybG1ndEQ3dzBkL3ptUWo4dTlnSGFWSjl5dWwx?=
 =?utf-8?B?Y0ptZnJZTUtFdi9QT0lyMmNZK1B5Z2hmazV2OHVvSFZzYmcvZHYrUmxpeDZH?=
 =?utf-8?B?V1h4QmhLK2pHQTRmNkN6QVZSelFvMmEya3pVNFV1OVFVeEVmdjNvSXNSOUlv?=
 =?utf-8?B?N0E0c25lL0VwTElPT2dQVzZxVVlmbktCamFuUkszZW1TamQrWDJIRm14WFVB?=
 =?utf-8?B?ZEhYczRqczM1YWxyVjVTTlRNcTNGNDhPNHNuZ1NqeW1EUDdLVExhbm9tc2pW?=
 =?utf-8?B?RjZtbFhUYlZSK0NmMnROcU95R3FLR0VBYUZYNnlJOTVBZnBpcGxGQ3dmL0Nq?=
 =?utf-8?B?YkZud1lUdG5HeXNha2RHL3p5a2Jaam5KTC9tLzVhZXVNTTlrVTI4YlY2dDgr?=
 =?utf-8?B?cWFwTHlsYVhYSjdZUGtFYTJnNTZSbTNrVks5b2lYT3N0UVhkZDJJZTMrVFZV?=
 =?utf-8?B?UnNuM2E5NlZRYTlrb0FjbERiOGoramxFY0JDSE51ZGdLVVBKVEN6MG5EK2Fk?=
 =?utf-8?B?cWFydTFQSmRjanFxcE13YzBHTXc2UmJOYTRkQmw1ZGNJRyt1aFh6OUt2L1JF?=
 =?utf-8?B?RDQ3QldxbWxhK1hOTTUrblNZNjdqa095Tk1UOUVMa1JOOXVIc21NNmExT1Jy?=
 =?utf-8?B?TmVFQWVTZzlYMWtyK1BFeUQ2ZTlJZDgzKzQwTzFSTXdvd3dMUlc4eUtqTFNq?=
 =?utf-8?B?L0dhdE5SUmN3MHB0Y0hqVnJkOXpCYkZ6K2R0Rk5XL3MvcG85aTBlMDBTNzcx?=
 =?utf-8?B?U3VoSXdTSERrMjYvTDdJNWZBOTkvRFdyQjNNblRGT1IwYmkwcUdCNTY1TFpk?=
 =?utf-8?B?VGNvYWVSM2xoUWNCZ3BDMWtmV0U2cHczNW1FYXlBWVJSZHV1aDMwMTdVcmxM?=
 =?utf-8?Q?PSbl9EWXQ/jxUfH/DavK64q2L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: umBWjXjGv/jlcvqpoCDMyyY4Uq1irNUuMEYbIepPAIdpfKF2Ck78p0tIt/hvFi4USRWaSFb4K95QrxaS1xxBSy9G/EIPntMrOCRmFS6WjpUVMdsqYcMhVD1oW8tw8EAhCZCoWw/fN8ysb9ZlEsArH9iN6wD5eH994dGHYNK7HAaYynVhUvMXd4M+2QC5zyACu5WC7Je4lT0nCwpXCizjaP9VhtgQjnSe/MfS3gX/RCG3ofLk2q7FDx/gkmnGxRkZr34TaMUhTn4JjovAzRTk1DWWj1EKYMTDatnm9UsjNJCxhbRl5fhfWVtNwIH+/k4m8vWmdtvONCGCEwbZNQIW2mXpFgkHlqdN5rNo7kJePeISoF4xtjtf6mxC6zIIFpdlAbT1hfW1sedsiJt39Tev88lPU+XJZN/VPuUiSfDBL7ItipILBj/KKBElj9eF4VBQHCou2LHwVTZGrFpkm8EhOXfPP6D7yf5ySV5p/Y/5o281tpivcSs388xP/YJch9L4rbgE+IKxxtP0+VbhrQ66vD3I0KaLREwvXgOeSVHrPltjwyhMgVPzrkUj39CThaqZBVPX5D6NSh10O9ddOimKF4hfOirkNCDjsl2ou14Cq0s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c70bf52-0f59-4f9a-d37a-08de0b422c99
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:53:17.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyRuK2VMlH55dlJQ11aw0e9Yl3eolQq14rOfMTXdx0/MfJs5fnXElDvlxArMbZb72+qrZ6WMAhZPcznDO4XnXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510140129
X-Proofpoint-GUID: lKh_2bI9BnnKsYFPkjsA9fR2iPwJKK2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNyBTYWx0ZWRfXy8jx2qfhEpy+
 2FFyIbxd50WrH1HtW24Y7Mc6nXuu/5ijDmNEMLOfxw5WKykvf6BvRW5QCg6Yi/AqvNlFP7gHSE0
 f5tE/PbuZdcs0EzNWrMsdtZGkC2rCUTSl8Fat3C6jz4m7Zy729YXDdyl78zlpV7MY03Ln1WopPZ
 XYfwNQHsKOD8PGgAzZ/i37n9GlUbWu+tZVozsJyt5SOONPbGdoLJ3UrRkWFKTIaU4Q/picwZexw
 g6zgay0hs5uyNgUzctwtsMXmlddV1/4TRxMOs8+dxbNZyu2s1zeJZwup0fR8onO2QTDg1XbKvK2
 IcRRA23rngYzZ5+sIC0Zp3J3kgfsjDCUhz5zTDL+xqCl9ME9w33mKc+cKHfdOhjEajReDCr9j29
 bzLfTaxZ9DPHX69yp6flrIsrFjNIkwNfWdQr3KHFx3RTeSodQkA=
X-Authority-Analysis: v=2.4 cv=OolCCi/t c=1 sm=1 tr=0 ts=68ee8004 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tBb2bbeoAAAA:8 a=yC-0_ovQAAAA:8 a=en3T4NL16hWBWLHaPtIA:9 a=QEXdDO2ut3YA:10
 a=Oj-tNtZlA1e06AYgeCfH:22 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: lKh_2bI9BnnKsYFPkjsA9fR2iPwJKK2b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_095335_351422_917AC178 
X-CRM114-Status: GOOD (  17.40  )
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

* Geert Uytterhoeven <geert@linux-m68k.org> [251014 10:47]:
> Hi Arnd,
>=20
> On Tue, 29 Jul 2025 at 09:49, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> > On Tue, 29 Jul 2025 at 09:27, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jul 29, 2025, at 09:15, Geert Uytterhoeven wrote:
> > > > On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
> > > > <kuninori.morimoto.gx@renesas.com> wrote:
> > > >> > >         > grep CONFIG_FRAME_WARN .config
> > > >> > >         CONFIG_FRAME_WARN=3D2040
> > > >> > >
> > > >> > >         > git diff
> > > >> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/=
arm/boot/compressed/Makefile
> > > >> > >         index d61369b1eabe..c5173bd82380 100644
> > > >> > >         --- a/arch/arm/boot/compressed/Makefile
> > > >> > >         +++ b/arch/arm/boot/compressed/Makefile
> > > >> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o f=
dt_wip.o fdt.o
> > > >> > >
> > > >> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> > > >> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-than=
=3D${CONFIG_FRAME_WARN}
> > > >> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D1280
> > > >> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D2040
> > > >> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
> > > >> > >          endif
> > > >> > >          ifeq ($(CONFIG_USE_OF),y)
> > > >> (snip)
> > > >> > Yes it is.  And it is hard to fix, according to the maple_tree m=
aintainer:
> > > >>
> > > >> Hmm...
> > > >> Actually I have tried to same solution (=3D remove or fix the big =
node), but
> > > >> noticed there are many such code. My suggested was very simple sol=
ution
> > > >> I guess, but I'm not sure detail of ARM limitation, and/or it can =
solve all
> > > >> cases, etc...
> > > >>
> > > >> But other CPU (like ARM64) doesn't have this issue, so we can foll=
ow same
> > > >> way (=3D allow large frame) I guess.
> > > >
> > > > I do see it in one my arm64 builds, it depends on your kernel confi=
g:
> > > >
> > > >     lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=
=80=99:
> > > >     lib/maple_tree.c:3812:1: warning: the frame size of 1040 bytes =
is
> > > > larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }
> > > >
> > > > I guess Arnd has seen it in his randconfig builds, too...
> > > >
> > > >> Does ARM has some reason which can't use large frame ? If not, do =
you think
> > > >> we can allow to use it on ARM ?
> > > >
> > > > (stacked) Large frames may cause kernel stack overflow.
> > >
> > > The version below works around the warning for arm, arm64 and x86
> > > on both gcc and clang.
> >
> > Thanks, that indeed works for my arm64 config that triggered it before.
>=20
> Unfortunately it no longer helps for my rbxt4927 build...
>=20

I've been working on fixing this for a while and am approaching a point
where I'll share my solution.

The change is non-trivial and is required for expanding node type
support.  But with the amount of change this introduces, I do not want
to backport the patch set, if possible.

Considering how close we are here (16 bytes), it may be better to find
another solution to avoid the particular troubled builds.

It is odd that this only shows up in certain cases though.  Is there a
particular config option that is needed to cause the size to grow beyond
1024?

Thanks,
Liam

