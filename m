Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60362C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBF2BJqBc3V2e8iPrU0/CT75U+Jq432tyV7+R63LwCs=; b=zLP/0YSTbrAtw8+Nean0t9s2xf
	3mgUDpz8ThuHAL2kCXHn6fzyhLHp0fFnMHK15JOdRGdj5EQC2s8tJFCiVNVhBObQiqY9nOJpFLVym
	xB3KdVEMCHKeHTbqv5pNUS4KS4opeccMj2D7ycUXW/FK9d2YZ+ytoJCbnC/J8skDcS6WCZTQevRs1
	vKR2K3mf9ZKFOW4TlSgDZt7t0T2Exgtj3bfbHoPB3E8J5ZscvQRCytGGoqzhYHYcTvZwRuHKoallM
	sojpS3aUb2JpAwyOcrEW1DYf2DOp0ddjRSfZ3vH5h4atTDI9Q4WegqgKDE17zU3s3tpSuSW1ezDTt
	jgdO+wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8pO-00000003fqk-3UGR;
	Sat, 03 May 2025 09:06:34 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8nT-00000003fjt-31Vm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 09:04:36 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5437WCwn008088;
	Sat, 3 May 2025 09:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vBF2BJqBc3V2e8iPrU0/CT75U+Jq432tyV7+R63LwCs=; b=
	dZAsw/Iw//zlTZSxHBvcjq1hqzSjG32LTu7Xn2u5+GEZKXAkbo7vnFSjWXD6yK8b
	8JLikFfop7MxhrLiwMsfyy4Ex9+96hmlo7dvSeceusSfGHi4WLvbhxBsLDwuwvxN
	Y1libTK0OPy079T/a4Fy+SBu8t5pPGESR3xzde+G2b3cPAGVrJ9E8sdT8+EMBsfF
	BW3LUVFEb/P1LWTOsOiZvgv2nM3BmLKjRIUr6X1JBAj3hrRhC56GqOUz7I4/TC+u
	7zLobAz3/VKt28zKqzDTamrLPuYzB94tX1tWt8MRH67WdgSkLwTADotvAsc9vjUk
	eqPovHkdcOzYJJhU8E4gkA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46deu6g2s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:02:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5436FJtS011302;
	Sat, 3 May 2025 09:02:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kce4bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cacjRcxRdyE390vWienf2xDrrTAwrwB5PVkocmIfPVq5XwR7toeSRjIjV8k2EXcZKO1lToOdn/m3eVgFf3nldmPS+CL2CsJGXgzr4fq+U7iXBrcMryAtlCl/BxLg5OSlCmwzeKINyG86hNoBDF6k+JHAxuhmsLx6H1y4NhHhZHcgC5gRnWRnJafRoc+0VzmIVhnszgMQ4EdadE/pTDMoA01pOXtbxz5J2R8wIoeuJa4obrqCAdOe5JPis6HuV0cB5y1xwpE4GOvt4kIJ+eGQu9/CTl8418Bfa43aDAxgf6EQKMVbYfdqMJFIDvmZHhFpY+k3JTHe8gy9chOXhH/Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBF2BJqBc3V2e8iPrU0/CT75U+Jq432tyV7+R63LwCs=;
 b=fZoYtN28MccSI43XPTX0+biZKOhLC7G6zW9V8nEUPK1AHd3kNbs4Jiqpw/zE1slFqBQ98ms2B50uib+KwUb2/ChPyz9njxmSSiOmxmzUt1Q4MfzcOyG/jlQ1I21W1MINkFmh+bCSy7XDlo+9UHCxd/3MurS4AwR+fFq3mxWizDODmvROYYWqo2Qgf1yl72czMT9Loh0hJ4mLYtG8tavxe8nm2pBe/B5WCXsHAmuC0ul9VcSAgBGpPg9wKjHw2t0n5pN5cCNHiZoFD9ID1ncEjetA6xTBnPbgFcESwSlUaSzGA7PrC7LHVPx1WuHUsATCJ+v+U76LKikl/v5QYrPMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBF2BJqBc3V2e8iPrU0/CT75U+Jq432tyV7+R63LwCs=;
 b=ji8Ep8L6aPJmo9Z3BiupftCJNBX5TJvyoSfdVR84dlOil8sW3vL3CMSNH7z6DNuR3lZhz73NILRg0lt6USCLbTXx1t62B7OzdzjsJN4F8kHPpGwspqbdUfJCaccmZqQJtQZnGn3LQvSA/DnoJYlsTaN549cj29+C6h7li7fp1sM=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS0PR10MB6894.namprd10.prod.outlook.com (2603:10b6:8:134::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Sat, 3 May
 2025 09:02:09 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 09:02:08 +0000
Message-ID: <6851d9ce-63d3-4c8f-bf43-935348998963@oracle.com>
Date: Sat, 3 May 2025 14:31:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
        rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
        ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com,
        glaroque@baylibre.com, schnelle@linux.ibm.com, m-karicheri2@ti.com,
        s.hauer@pengutronix.de, rdunlap@infradead.org, diogo.ivo@siemens.com,
        basharath@couthit.com, horms@kernel.org, jacob.e.keller@intel.com,
        m-malladi@ti.com, javier.carrasco.cruz@gmail.com, afd@ti.com,
        s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, praneeth@ti.com,
        srk@ti.com, rogerq@ti.com, krishna@couthit.com, pmohan@couthit.com,
        mohan@couthit.com
References: <20250423060707.145166-1-parvathi@couthit.com>
 <20250423072356.146726-5-parvathi@couthit.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250423072356.146726-5-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::9) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS0PR10MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 817b0e14-7710-433f-61ee-08dd8a212ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG5RUWQxSTE0ZjMyTmJ6cnkvSTJOL0ZiWUZJa3VBUzN4Wmt4UHJoS3NTTStF?=
 =?utf-8?B?UWZuZjlYTUtDTHYxNDhYYUh4ckIrOFpoSkovWGQwV1Fkd1JNRkw2VGxMVjFG?=
 =?utf-8?B?R0hUN3hteDRUSExyWkM1cGd3RXBCODNua0lNRkpCOG5uMytXdXlOV3NxUENK?=
 =?utf-8?B?UXoyamVxMEJyQmRZbE10YUtvMDRkYTlKaWdTeC85L0Q1WjZVUnQyL0F1Q3Vy?=
 =?utf-8?B?SDFxNFlwSW5XVHlaYXAzUFF4WjR3dnZsSU1MR01HK3hkeEtxNEcwZEc5U0g4?=
 =?utf-8?B?WE5ZZFhZZHFJTVNnVmUzY1NHK0l0VDRaaDBDeDhINEZRQVcvVHpwMDlBd3A4?=
 =?utf-8?B?TEJVOWR1VUhGdUgzblZDR01EREQ4MW5TNGlQZEpqckpxTzBja1N1VGMxa1ln?=
 =?utf-8?B?NWF0ZnNhd21YeExzTkx0cHVMbVhzMW5BOW5TKzMyUW1VZFhFU3BjeGhFc09q?=
 =?utf-8?B?ZkFQQWk3WERHa0dlZU1CQVQvS2xkQzczbUM0L3czT1psMmJTN0x1bFRNWkxw?=
 =?utf-8?B?N2p4VVl2MEZUeWdwR2lXV2ZmQjdIbG0zRmFuNjNjRjJMUmttWDQrZzhHNDdK?=
 =?utf-8?B?YmU1M09GcXBPcXMzSnFSQ0p2L20rSTRXL05yL1dJdEh4d1NvcGpoSTM5dXNQ?=
 =?utf-8?B?VlNkY2REU21FNFNCZFhlNHdGdjdFb2RjVmo0QU9VdnhBTi9QTm92WUFFejRo?=
 =?utf-8?B?UytDS3dvYnZRMnVOaFdoVUluU0MzZFAwVllGWG0zQW4renBsM0ZJM2FRQmhp?=
 =?utf-8?B?a2RWcDBKQTBxLzJVYTIvMzBzdTVaUHhWeVdMQXZXQ3pVcHdPQmlmVGl4cXQw?=
 =?utf-8?B?L0tJRWp2eDRDT0I5Q09xZWt2VW9uN1pZL1pkSERYd21DVlNoWUN6a1dORy8w?=
 =?utf-8?B?L2JTUk1ZZE1UWGswQnhta0JEcE1mamNoYkpITWJqMlZQVmdneTZmRmFYUFpF?=
 =?utf-8?B?T1hnN2lDNmIwc0dONjNqZStoa1JuY2RpbEhqREhKODZTQW1ldDMwajRsa2px?=
 =?utf-8?B?RDRINHc1cUhjbHo0c1I5bk9RZ3V4Z0dkY1crc3FHUEZEV2s1eEFZTUJRLzUr?=
 =?utf-8?B?L2wwYkNmcmdtTTc2Y3l3TERFaWpXVjBHaHhGUi95dHdrWWFwOGZWNUllbCtU?=
 =?utf-8?B?eldaU0M3RTM1a1hUZ3BFSEJ3b29BWVlnNSt5TUpYT3Z3N3NBZ1F6VnRyVGF2?=
 =?utf-8?B?YzUxWTQ4eFlNand2ellhSmI0L2oxdlZ3Vy9TTXE0dGFTa09hR3lZd2pPczNV?=
 =?utf-8?B?Q0JBRXFwdDhBT2dabU5mQm1qUmhHd1c5aWwxVnJoank5V0JtZk4zcHBVZkFz?=
 =?utf-8?B?c1NaN0lmaHliRFVnYk84MHhPZ2FZNHFkOGJpdTdHOUhJTFBORkhaZWFnMHBS?=
 =?utf-8?B?Zzlzei9tbWQ3bWpaMWV3d3I2L3dVRkxOQU1qbHZWWHRUakNLQlBlTEpIamYy?=
 =?utf-8?B?ajBuRWFNL3V6SmZIRkFULzBydDcxRXh3bFFnNk9Dd3ZOcDdkNkdOaHRHd3pv?=
 =?utf-8?B?L0JZZW1raktFaHRFVGREc3RWdXhCYjdPZVRvM1RtWHNMb0JwTmVFS2dCLy9u?=
 =?utf-8?B?UGxkQXRRbVFWb1lodDd3aVZGRTl2bFFTSjRZbTZ0ejc3aElZcnJ2dFVyckJu?=
 =?utf-8?B?TkI2SzdZV3Zsd0xMdGhTUE5JenNJaGEwL0JWRmFrbCs1a3ZCb1U4RHpqTDRV?=
 =?utf-8?B?U1BSZG5yVndFcGMwcEowMUswQUVkSnk0NlRlTEhIMnRBYjJFL1c4T0dQUWpn?=
 =?utf-8?B?WTBObmxyNzEzeEd5VFJ5K3RETjU5eCs3anNOZ25UbEpsZUJwcHpoTlVMTU1l?=
 =?utf-8?B?NnJPOC9QQm1teFhMVDNFc1JxMGJMS3BLSk1SOCtueDF2RmVzV0hwODgvZ3BV?=
 =?utf-8?B?dENsS2JxT2FOcWxGMUFYQTF4TzRmSWtnT1lCTGQyK2MvWGFNVGEvZ3hQdGc3?=
 =?utf-8?B?L1kyTVFTU1ROMERJelNVQlFZQ3oxM1NxMFl0ZDJ4VFhtUW8xVzFVZThrL0l2?=
 =?utf-8?B?dmFGWTlpMzlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1cvaGhHTVRkaDhrU1hkSUFRSU9nOVgzbzNKMWh3T0lZQ0hid3MxYWZCQVhw?=
 =?utf-8?B?eVVWQUhESGxrOFJ5ZkRleGFJVml4akVxL0NBTkZ4a2RRakYyYXYzMW1YWjBU?=
 =?utf-8?B?NjFWK1lvdjdwUzREVEIxWTZEN3M2QUNqeEFRdysvTTVUZGtJMVE3WWNBQk9Y?=
 =?utf-8?B?UlZTYzJVa2s1RkRGeW41Z1c3eW1IUndmQlI1YnZkYU9uWGRhSVNaUzAwQ29t?=
 =?utf-8?B?NGlHWUhoZktWclVHUkdhWmUyZDhSRndyb1dzZXdLOE1jZHkzdDdhcktTeXlY?=
 =?utf-8?B?NWVlcEQ2K0FYTXZmejJ6N2hDeTFGZmgzQ0lxR3YvTHZBUWtrWDU5SlZtWHh0?=
 =?utf-8?B?elEveWxSK3h1Zzkranh0eTkxaWZPSjNDT0ExRVJpcGQ2c1Z4aWlESDRGais3?=
 =?utf-8?B?T0s3cXhyTkVONWlIZC9BNlBZZUNyL0VtVk1PdWdBR3V5QTdnUHh1dkIvYkQ4?=
 =?utf-8?B?akhJUysrRWcyWUJSS2FQOEJnbmErVlI5M0trMkhaWlVBc1ZGU2t1T3lIY21K?=
 =?utf-8?B?Q1BtYUZURHpZODNtMk1wYUs5SWgyTW1rWW5va3dHK0lZcERkM0VKRUVXK09T?=
 =?utf-8?B?Rnc1Vk4zVWszMjFKMk9iN2c0QzQzRHB2WndLemtmZ29tcHdsUElMQ0FqVHgz?=
 =?utf-8?B?WHNURURpbnkwUk1MMENCZ0RFd0ZWUVg4eXptMERWY0dyWkZaQjJ5YkFTcDYy?=
 =?utf-8?B?aG96U3ZXSDV0Z21vYWFidy9wMnZXYlJkbDZNby90OWxmVXBBZW4yUFFVME5v?=
 =?utf-8?B?cXB3OWQzVlZVSE1kdG1rSUo0MHEyMWJhM21yakorQ2Fhbkg3TUJYOVoxUTUv?=
 =?utf-8?B?YlcwMmZacnFNNSt2aGlQdkM0WDFKVGJlY2JRT29rZ2Yvd3YzVGV3T0grekJS?=
 =?utf-8?B?aXhHOWFtV0RGQXBqa0t5aXl6Wk0yUlVkM1lhc2trdWJCSk5mVlhCZ1RGL29y?=
 =?utf-8?B?K1pxK2F2VFFpSmhGYy83c2ROKzB3TVlrblZNWGdGZ0ZuTnRaOUNNbGdudC9w?=
 =?utf-8?B?ck1PNEgrZnFHMjEveE9WSjhJQzNjYVhxMkQ5T3dNVjl0Z25MUlo2V0FvTWVp?=
 =?utf-8?B?YW0vZU9wSGgwaDk1cGdoNEZuRnZZR2lsQUJHNnlhdkJFeXo4M05xcUVkb3V4?=
 =?utf-8?B?NnNiWE95SGhaZ05KbmVCaDRwNWMwMzBDZHJ2QmdKeG9pWmxXNGNydVl3V2Nv?=
 =?utf-8?B?WVYzOEJ1eXNiZFhRT2ZQL2VHSjBhOFdvMlNrZlc4VHMvWm51bTV3Zi9tZjNE?=
 =?utf-8?B?dDVXOWNuMUJ3NWhpK2dpemo5eVZqS2FDRTdWQXdCTkF6MUZoRG1SWm1CakFy?=
 =?utf-8?B?bVZHbXN6QndjZTFRUlVKanRwU29HREhWaldqOTkyNStscG4wSkNOemp3RTNx?=
 =?utf-8?B?WUlLeE44a2tIOWlid2hIbDhucGNLZktCQ0pXQjBOeXpLVGY1ci9oamlBUUE5?=
 =?utf-8?B?Q0xPSGIzNlRVb0FQK3J5Z3FPRUM4QVpnajJBcUZOendLaDVQTDZ0T1k1b0JB?=
 =?utf-8?B?MHdtUTlWRThXanAzMlhRV3VyWFBxNHdtUmt4dnZYTWhLOU1IUUowd0VyWFZa?=
 =?utf-8?B?MkI5bHVzRmZ1cWJnM2dOZnhjZENrQlhPanRjZ21sVzA0dWZpTUpoNjhieldK?=
 =?utf-8?B?OGFvb0RQMFFmMkFNaFdwRTFkZ3ZlUTNPL2h2YU1vN0FDcnRpRlVQNi8rK2o1?=
 =?utf-8?B?Zmo1bFJoL21TUzhsNnNkZkoyQ2p2UVBsbGtwNkFXVFFhZDhGM1JtajRjbHJJ?=
 =?utf-8?B?bHlxZzFYK04yVm9IaGhPdXhOZ2J0SGcyRGJXSUZUaFUzZjM4VG4vMFYvaGl4?=
 =?utf-8?B?MzJYQ3o3SE9JMVhLcnN1WlVXZ0Ria3RGZFdmSnpQYWVYdm5kNEtoVStxTkJZ?=
 =?utf-8?B?ekVwWGJ0bHpUVlRVaVJob2dvWnk4KzNNbFJObTF3ZmU3WFczWjhmd1lnY1Iw?=
 =?utf-8?B?bWg4MHBSTWJDSlEralVPNy9yZ1daNEVqYzd3Z09Ha0h1THFRUzRHNjNOMmlQ?=
 =?utf-8?B?MWRXNzFnd2ZWV2JDOFk2RldkQm52Rk8rTllteFRxMGlkOXhNMHJHZlFVL3BQ?=
 =?utf-8?B?SStHaCsrTTJrTE1lbDhsdFNLVzZJUWFhei9ySWNhN3pLOFV6NFNEdVhJWS9R?=
 =?utf-8?B?V0VSazg2Uzd3Tjl5a1NFdDFTbHJHdldCZnZzWlQ3QnB5SGNmUHpyQVdDOEtG?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Y1duWdMeCTzuzsz6hVyCvvUAraslu03UpgHaRJq0nOt71TUuwJCG9d0amH9Np/sB1sPHoGYoNiwKZD/9Eqv0HB5T4sRSzxSPEmNtbQNGPrBjAALNsiw36KOA4bF1nbjdp7bp6+d36A57lv7Oh/4DJvbAa3CIUljkaGJpIlx8sABgSo6R6kQJyIZtt23OeJNZHWcGHvOI7uePUN6jHUmGNpowWlruAO9XJBmqqc8EHphSr3yy72qEjZyEo4JqTsgS7EXhiC/tS4meMg8HREk7ruLcT2elzyubHN+9fbPoZUyWV2eQcr5A/1alTi7KIblYR4Pzb4mYD+cTm6gw3DdTQBIJYt7d9rpZGDg2DvvycTmR2UixaH+0NJw7YbnCiVeN5RMZHWHGl3Se4i/ANjoDTYgjtNqsWKM1CcfsY+J7VlQVCvfITzDcvnlz3AnCCmSoj/KOtBSJkD3uqf4edhaOVmwH5XL6GElRP8+llO2/C/XfcVZ1oy7FreGDCBTr5ydpfk/030HWA82WTGWvtN2GbHzNJ9IBTThoMPc1eW36stPx/1H654LX4Lxg5i/sortT0K8L9umbrBapuL0my9SpUfmYaYD4e0IPUDkse2eXoXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817b0e14-7710-433f-61ee-08dd8a212ee2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 09:02:08.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2Yn+nR8zNO1g1emkrwohbXVZCxNaHnwYi755p6VXJ1Fzkh9vkS/OxkEAehpFjJhy85n/rCr9Ktgss8bsSCbLBae+HTekqyen3ROkAp/HUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6894
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030078
X-Proofpoint-GUID: _6pK1p56o0Og6RgMZVtn_1eWawp-G3_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA3OSBTYWx0ZWRfX9IX8dnZrKaA6 MnO5/CPhskmgMiq4eqiI4V2chG0dXDA2SYPFoJnPZnDSN/+g91TfBEh86M99h5RJ32emxl4Zk6R cxF9CYdXBHmZMHGZs+kF/2khxP1RErX/zaQoFWYmjcIUjYxC55upgmkwSus/SKPf+YPzgztmyzR
 3GDSHr73mD37ykZVKbHQA3kZ/xSMsPlIEVrCzZAnqTxz0uScaYqU3jmxEXlkc1DCBdPmkpAFdwY GOtZU8zr89j2dergVx5LCITRcJE6Nvv2UAjNe1lcjZ2AP3X50hCh80cIIW74v4U/a3DE0Vho3o/ RB+GZcDWhH5agvekMcPIlt3JP4rSx7fi0tA1VEku+U5WGYsSbiMlVyHcrEVSvrTA5cu1y8su+d6
 uqcxxfTDYX8U/7+9rabVPGr+Ct5FkxsOFbNQnhDB7LYHYhppSIxRu9F5YTuQsm2E9RnbF5J9
X-Proofpoint-ORIG-GUID: _6pK1p56o0Og6RgMZVtn_1eWawp-G3_R
X-Authority-Analysis: v=2.4 cv=CIcqXQrD c=1 sm=1 tr=0 ts=6815db95 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=sozttTNsAAAA:8 a=uMrLXzhIAAAA:8 a=XIpbXEzip4Lxohy8xW8A:9 a=QEXdDO2ut3YA:10 a=jlbCQfFxfIo9zxDJvpnn:22 cc=ntf awl=host:14638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_020435_878519_5E5EAE7E 
X-CRM114-Status: GOOD (  13.90  )
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



On 23-04-2025 12:53, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes corresponding to link configuration such as speed and duplexity.
> IRQ and handler initializations are performed for packet reception.Firmware
> receives the packet from the wire and stores it into OCMC queue. Next, it
> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
> service the IRQ and packet will be processed by pushing the newly allocated
> SKB to upper layers.
> 
> When the user application want to transmit a packet, it will invoke
> sys_send() which will inturn invoke the PRUETH driver, then it will write

typo in turn

> the packet into OCMC queues. PRU firmware will pick up the packet and
> transmit it on to the wire.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
[clip]
> +}
> +
> +/**
> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
> + * @skb: SKB pointer
> + * @ndev: EMAC network adapter
> + *
> + * Called by the system to transmit a packet  - we queue the packet in

remove extra ' ' after packet

> + * EMAC hardware transmit queue
> + *
> + * Return: enum netdev_tx
> + */
> +static enum netdev_tx icssm_emac_ndo_start_xmit(struct sk_buff *skb,
> +						struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret;


Thanks,
Alok


