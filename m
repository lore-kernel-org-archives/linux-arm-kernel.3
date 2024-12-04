Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EBE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4NgBUD1Jkt893EtwYHgSwHuh7SgQo5VKA/y7j4UKnTs=; b=TNBqJIm60DZoPC
	szzdAgRmf54VgN96nfZNZ5Jak+Qur8EvFgh0Len54uEgTodQMFH1LrlIn8g4jLKm3TgvIQumeBSJ+
	yoG2BSfNGjyCW0cTrK07W84hzUH/zrXIcfQArCSr7ObHgvacwVtlzA/+d8LJDoK/KX27IK1q+i3Kq
	qwb3LiZTVxeYzrmwiqiluueMb9wIi0hjg1BdgP/a9kt1p0pnfGduaTKm3T71CxEVyXwSgnTGqoGB1
	eDzdCes6TnyLut8CWH2/5OON0eyGeAE9s8o5csOjA07ZQfXvYXFErspW8Wo3FbKUZNJ9ZqS0XOGao
	e1msXOcNDvPkLW9Blxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrj4-0000000D3zc-2lYb;
	Wed, 04 Dec 2024 15:55:42 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIri4-0000000D3tf-1akX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:54:41 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4D0hwW026930;
	Wed, 4 Dec 2024 15:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=4NgBUD1Jkt893Etw
	YHgSwHuh7SgQo5VKA/y7j4UKnTs=; b=HordFJEtazGlRmJCwNAU7DM27MGXcBLz
	1Nu+JO4p3mbpJH1eFoxbq1vypsmEABd/kR+JY5V6J0k+wHhQ3OKFTHq1bqIWdheo
	nB3YbwobH1yrnSRXKypa1tm2KA+QbE5ClN7l8GUfNQ2gP696xI20wKHj++04SBgj
	mEuvYbAVMwy17loQ3lKU/Xc6cgXY0LAJQWRjzG5QAy+U+Q30DzdmUkBzXFElzbjN
	MKIZSEuXGW33j6g5zGbYcgbp0pU062s/tC2BChGwYPlnHgeIEjMqlJVTbt0fIg4e
	Pc5rLT4TGFHyxnlccRBG3iCVx73na3GM6TJ3b/WGyrNDEq4LhX6myA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg28td1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Dec 2024 15:54:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Egaje020401;
	Wed, 4 Dec 2024 15:54:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s59nmua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Dec 2024 15:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF9d02RPXGdNy8+Hk48LsUXFKPS9LunxJNW1q+JNSI6SmgxmgK8Mv2vvdQDzmBxPAUKXh6NNxD/GsKk44o4NJV3d76FdUHI0p9ZK6FBacgapNJt9YpzRwyu093mKE9IHkIzmd/dKrjkG6smATjI50iNcWrY3MJObzILtXxPlqDxH7bQF6nmOAVjZ91W/sg+/PYSTB5sXu6+WFuher/lIbmIrkfI0Kf80qVXBUrRbzYYo9i4eUoAQWCX4e7agpcUHP6Iz6kl764upNocJ84d2RrYj74gjX+cH0DYtAskixUecOt+B9OEMSFsI8DXgBQSH8mJpHZGjtGwsqYkzvNd7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NgBUD1Jkt893EtwYHgSwHuh7SgQo5VKA/y7j4UKnTs=;
 b=oYnu4mVhSYi7cXs2yO3lgcAhzEOLZcMJb6V8ZGX7X+Dxi2qlMfBQNRFdRwu5A4YYtvX4NtbPEnkO5jPL9OY9dXz+AEVf6QIRu1Lgv9CkgqA2m9Yb2Dd/ZrE/2Yd/cxn1kZ6lkh7NmQnIcaeEoCyGhneqSgREGLLW9556ImbkTTejOWxB/6jLFIfGY0ote92BbW7g7D/Uej1V9xutWs+nuMlFZYK2HR7nop7FLKpsilzechkszD25fV/cK3ajqHB7pTxT/GIxxmRs5ANRuW1AmTEob8uhjz5TtJ0og0XC86Eo0sRxpwO+n4fpvae9yCx/pqLp5RijHuuIWJe4cd92vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NgBUD1Jkt893EtwYHgSwHuh7SgQo5VKA/y7j4UKnTs=;
 b=TXYUbeiy7/VZJGqtNJR+69zrRm+PPzcok1zAb0p4AQ6/goaoWTyrJgqgQHOO5Nn9ME+g3RzFLiNh6HCmDno9c/wP3+AvE8m4iyNsuIX/6oM4Y7uj/asrp3xAdIRdhTR2c1QWh3NI3UUllFCtqyCkvGOxG0HRRcI+Msk9FNwusvE=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by MN6PR10MB8048.namprd10.prod.outlook.com (2603:10b6:208:4f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 15:54:34 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 15:54:34 +0000
Message-ID: <9950a25d-1a79-42c9-ade7-dc51ef569ad2@oracle.com>
Date: Wed, 4 Dec 2024 15:54:30 +0000
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: John Garry <john.g.garry@oracle.com>
Subject: arm allmodconfig build issue with bpf
Organization: Oracle Corporation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|MN6PR10MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: a1447eae-42fc-48d5-2eed-08dd147bf26b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3J5aXB3MkhVTEVOSkZsa2JINEFLR0NjRnYyUzVMWjFlQlJhd3h3MjNwSHUz?=
 =?utf-8?B?QTlYQTd5dUsrSngvVzN0RWl1d2RDVnJXWFEvVkxkdFZHVGVnTldUelpFWmFL?=
 =?utf-8?B?NVdFMHlmeThIbzNyZlFiZzdhNUtGc0NVTEJZQzlPdktyUzgxV0RIckRCRCtv?=
 =?utf-8?B?SVdINXdycXUwT3dUWFQ0THRJWHhEQ2xidHlKamVyUGUzZktyZSt3SXV2TFpF?=
 =?utf-8?B?SXVoRVJ2OHhxZDQrTHZmeWtFZ1hYbHh5eGw4WURTTEtEUUdubUFuek9QUVVM?=
 =?utf-8?B?Snc2MXRYQ3gvZE93dXRwd1VyNEpMeUw0OHk5MmpuQ1VGSE1TQkd1cDdLdVcz?=
 =?utf-8?B?ZVgyUyt5c2NYVDFtWG5SNlAzRWlzSE80ZUg5aFA1ZGpXYis4eU1zZzFVUHJ5?=
 =?utf-8?B?WlRxREh5UklpTXFtOU1KSGpMaFh1TG5JZ1F0TFRqRy9UekkvVHdrK0xxYnJj?=
 =?utf-8?B?dXZ5dmZaN1pCclVGdVg0S2U2K2VZdExBYms5S05acTBsdUhzWmphLzJtUFdw?=
 =?utf-8?B?YnAyRWk4Nk9vR0huYzA2L2VtWVUvTVFyK3VZcms0WDVtdlQ0cUFtRXJQMGZ1?=
 =?utf-8?B?amxLM2dqQUdBWWtUWEtIV0RGbEMyRWxRS1lnTEkzb3hBMlBQMDBmZ2dOWVJS?=
 =?utf-8?B?T01ueUxUb2JBblBNMzlYVmtsclMrcW5aWjdMQW9vRlpOTm9HSm5ueEdVOEF2?=
 =?utf-8?B?b244eFc0TEhiVjZjdXhtOGcxeFhOUW1pK3ZvbTZZVk4vSEQ3cXZrS0VsQU5z?=
 =?utf-8?B?cTZialVGeFkxa1hWSHYyOGtjeTRCaUNRMEpYTGoxUDZwNjBURDlIREhMekpr?=
 =?utf-8?B?N1ZidDI5QU13d3UweTkyWnozK1NUaitEMWJscHBPNTBsT3NwS3ZEY1pSeVhu?=
 =?utf-8?B?bWVscHlHWFc3SjQwRjR5bFZsZkZrbGRpNmNQeDNqMzFNQUlRQzhJR09FYnRL?=
 =?utf-8?B?RmNSMk14NTBDUnFJUkVhSEQxSEE1dnZESCtTUit1K2N5azF3VDc2Q00ySnpQ?=
 =?utf-8?B?K0ZoeklPNUZiazJZRS9OSSt6YjNRTExTNjlkRkE3ejEvUkN0Q0tSdlIvY2pE?=
 =?utf-8?B?V1lKd2ZHSFhmUCttRmd6Q09ZcGZJdG8yYmlka2pveUljRW01OWV5VDdHZW9r?=
 =?utf-8?B?NlFsdFpGMXMyZ1kxMHlYZ1l5bGRlOEdCcWxjQUE1aVZqdG9yY3RmZG5zSCtk?=
 =?utf-8?B?N1pvZ250YWFCenJDZXpRdTcvNGJrNW12NTlVU3NRTnhDWjlWbm44YWZyWllx?=
 =?utf-8?B?NzNINjY5Wkx6VS9ZK0t1TThOQk5tWllGeGMzUjdsUmV5dzdPeThFbHhZZkEy?=
 =?utf-8?B?WnVOdXk5TUtOaVlTSmU3ejMrdWxvSTdKVkh6YlhLK2VCaU1hNUMrcVI2aDBO?=
 =?utf-8?B?cXVDNVd5Mjd0NmFFOEE1djBZUmhjVmFseUxBd0VHTGFNYTRReTYrVzZuTzZR?=
 =?utf-8?B?cTVuVGlCSXVjV3YzOFJ1MGcvR1pCK2VBQzRVMFd5Wk8zQm9sM2ZFeWpuMytn?=
 =?utf-8?B?VzdnckFvTUlJdUNCRCtXamxWL21KMHpwcG5FRzkyaHd2YVY0U0s4RDdjK08y?=
 =?utf-8?B?azMxMU90N3Q4SWliWkpiYjAvNEhlSHZkV0lKMHZoRzBrZHA5TisvamRtME96?=
 =?utf-8?B?N2tXcmtaQkhQelIySEVVdUFSTVBpTTJYM0R5V2s4bDYzalF4eldRbmhLR3ZY?=
 =?utf-8?B?SGJqYjdXQ2xrVHZGVGpidEIrcUxDM1FVaml6MC9UUWsyaWh2YSs2eDk1SVUx?=
 =?utf-8?B?Z1c2ZU9rdTREc0lCcWpnbU41K3hudWVPMytxUVltOUFwOStoWEVRQTlmay9t?=
 =?utf-8?B?OTU1L2Zvbk1kM0JwL1hVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWlWV08wcmR0K25mb0xSRHkwczJ2bkwybnJneTUxUmZnbHpmL2VId2pneUJJ?=
 =?utf-8?B?b2N4MmFNSWZlWWVoVzVWYXZieWVVWnYzSEdrN214WlRkWDYzMUZYN1ptSzJI?=
 =?utf-8?B?UWI2VjJ1UmJXWEVvSTFwUjlsSURuQlh5WnkvWG16Uk83NllaRGdMWitqNUZB?=
 =?utf-8?B?NHc4eDJyZVZQQXlJMDRzT1dTM0FsdWM1M25aajI4TXpSMkM4R09BSHBnYXl5?=
 =?utf-8?B?d3cyNzVWYjlrNkhIUE1vRU1rczlIUk91V0VpQ29zME5vYkdGdzVWNzRiK2VI?=
 =?utf-8?B?bFFzWjNpS1NxRWIxZFlyNVFQalkvZDJwU2FmWEQ2YTA2bU4vY2JLM3ZodkxE?=
 =?utf-8?B?ZmFSK1BBcEJQa3dwTVkwTGlLUDZyUldYVlVwNWZuNHo5cG5IYXlUMWJra3VB?=
 =?utf-8?B?Y0pmdGRnNGxsck1ZNS9Ea2s0elpBSXNJUjhBTFZ3cVNxTWFIQ2hjMWcxaTNm?=
 =?utf-8?B?bkx5WHNsNW5QVWZodzRzWUM5eXlrcHdvTzhzSzRwZGN2d1IwYWlRSG1GTnZQ?=
 =?utf-8?B?cUFHUDVMQlVsQnJ4RzducWVERkFxMlJ4V3hvZWRCU3hEa3dQTk5nRitCZ3Q4?=
 =?utf-8?B?d3IzbmlxVmZsbWJ5dkdJem5yajZwNnpUaHR5YUxJQW9RbzFBS0RZV0ZGaGNp?=
 =?utf-8?B?d0dQWDkzYldmU3Y0TkFGUUNUalZzRzVnRzhkMFl3YlFVbWxBVnJaVy9xRDJU?=
 =?utf-8?B?L2w1M1h5WGQrdk9jN09ZQThOL2Z2YWpjcGdWMGJMSmJCTm04ZU5vT21QTHYx?=
 =?utf-8?B?KytZVU5CbituMkg4bmh1YndNQ2VVWHE5NWJ6NW14bmxtYjhHVWZ4a3NoU3BY?=
 =?utf-8?B?Ti9EeG5hWTNEUkdrMXNOSjJlMnhEcGRMbGNnNFo1N0g3bE9NZW8vbTEySE5U?=
 =?utf-8?B?MWZGckNCV2xINFA1MHZRNHBaVkY2cHdUckdlZDc2RmVQdGJSZGplNzNKcDdl?=
 =?utf-8?B?S2tTQ2dBWDdjWHV5VklWS25wdWpucXJsaVFuaXBYRGRuRVNNSXJkTVhIakQ5?=
 =?utf-8?B?ZktFZWdpM1hyaVI0ZGNjUGRaaWZFbnlSUVB1YzhHek9mUDlyL3FRdjBodFlZ?=
 =?utf-8?B?WGVHbjB1Qk01SmVRUnBlR2pSYnI2QXFFZUV6NjlRbDM4U0JXMUZRUU03N3RJ?=
 =?utf-8?B?L1hJd3RvYkN6S0RwbTR4OStXb2hUZEpPa21tZWp3MktEUTUrZEo2Ni8razRi?=
 =?utf-8?B?Q2pGbk5yUTVjcTdRYW81bDNmdEV4dXdVNmdDV005VXVSQ21qZU5yK1YycGQx?=
 =?utf-8?B?c21ydVRYYURZMmZyQ0ZTYlVmYm42VnVWNEplU2FMeXZPUGxaWnJOclhIRENH?=
 =?utf-8?B?L3p2d0FCejhBNVhnQUNGY0JEU0s5NlR2RzI4MTd6WHlQOG1CNGsyTTRSK2py?=
 =?utf-8?B?VGVWeFFMSnptdVJIdzh5K2Z6cDZHRXQ5R1kwU2VxL2pGdmtaRk1nWFR1VG5k?=
 =?utf-8?B?cFAvL1hFVEZWdkdIaERRaWxPWWZBWXY4M2pQZ3drcVhUa2ZKWTJUN2h1WWg0?=
 =?utf-8?B?aGpQWUVPYnJQOWlqWjBzaGhpM1k2dXI5V0xPMTBPMlc2cjVjUmRCS1p5UFhE?=
 =?utf-8?B?MTB5cFoveHNDUDI2MTlvQmkrcUdyVFo4cWpQMkZQbStra25jTlRmLzU4VXBt?=
 =?utf-8?B?UE5ZN0NMeFRWb1V2b1FJRUNDVkZ2Y1I3amc2Vng4N0xJSEpraDNmcVZVbWVn?=
 =?utf-8?B?QXpEYlBDUEhUcXJhTUNzMDRKc01xRXZEMFkzMytzOG1UUm9zeEhNNnM2M1Ex?=
 =?utf-8?B?L1ZSN1BIcGVscGxvdHA4NFhxMlBEdVR3SU9ySjNQUExkUVlqaEJpN3dxRU05?=
 =?utf-8?B?QWNrcTU5dkQwOG1CYWRFTW1DYXkwSU5QaVFva3JuYjJqM0RwMmdqUytOMEJa?=
 =?utf-8?B?R2N1aHd2VFBIaVNnWXI2UzQvYmI3ZUNUNzE3NzBrUWFtaUYrN1ZyUGZ5ME9Z?=
 =?utf-8?B?b2lnamRNN21MaXA3emVlK2I3eDBTRjRSRW5rL2JBcGRrSlZjODJBdVBraWlo?=
 =?utf-8?B?S0NpZVhqMHBXRnhUb05LMjY0YWZVYWNpaklWN1VHSVpDSXVZKzNVeU5UUXpt?=
 =?utf-8?B?anJUZS9zcWp3bFNLMStBKy9GbmJTaXVmVFZCbjl1QUpyd2FDNnpRU1hwMnZG?=
 =?utf-8?B?MEIzUXdXMUZ4cTlucExGN29IUW5JdUtPNmpnUjVSMjV1ZkJ3QUNTSk1uVkJK?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: G5E2h8MnhhZVp7wsSz6pZ4Rc74+t21P/OrqIHmlrqFyDYSuxqXOJpLYyRRcuwjP49U9bfgMGdwECclXi53GbUTgqHYoHDjNXvz7sFvslqZmCPeyuKp9Es0GbX4npfYjW+i4o0a0psu+5/g86fFJK/Tnwz6DGkJe+nkgW2PfaksdMWeN3p/vLicKyEcFLbrtofOyiINQBPxTh8GkTSSAYI5GYyfYoMp9kIEM5DRCD/LBDeUzyLZhD0K81Op75KH3k7JQTMyWnwlNAkhg+mZGiew/mjH7OkKwlTecmtUL1oh7bE6ATfg0Sw1EpzfGH09REMgxFUrP4P4HV9NJ8qznVSnLHXvUA4Hic39mMpclQqo9S5NML5mXYmiaWZIdq+KOJ2WTnJ96gGnQQ0D46Pf7itX1xbFdk56kZZ+BoOrdhYydVHUFjqMIjY/bSjg5PEzrv7E8Sd8PC2U7DrZaSzd2njj1zSXZLL3VB0QwhmGa26XNpgEBgt/8JpZfv06KG+q50u8f1vIlE21M1/WHUwzugsTIrcwLNUvDfa3i7hlBTCm9kUJqJT0lyQFWYNh4Wf4VZcutHM7/w6hXDQOb6rk0n8NuRPIeFlLlmYkHO9tGXWhE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1447eae-42fc-48d5-2eed-08dd147bf26b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 15:54:33.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bX1mADxq6Gn4xbMPl1xzLLkgrH37jNJzUBLzkKS6C4EfooSx/Bl2cDG7pQlz9AnAkO1g2/OIXn+93/MZDZCPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8048
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_12,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412040121
X-Proofpoint-ORIG-GUID: gnbB18ZAl0FL66FeuxlEkhYvOEMQervU
X-Proofpoint-GUID: gnbB18ZAl0FL66FeuxlEkhYvOEMQervU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075440_533107_D16AF7CA 
X-CRM114-Status: GOOD (  14.47  )
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

Hi all,

For some time, the arm allmodconfig build has had this following build 
issue for me:

$ make net/bpf/test_run.o
   CALL    scripts/checksyscalls.sh
   CC      net/bpf/test_run.o
net/bpf/test_run.c:522:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   522 | {
       | ^
net/bpf/test_run.c:568:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   568 | {
       | ^
net/bpf/test_run.c:577:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   577 | {
       | ^
net/bpf/test_run.c:584:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   584 | {
       | ^
net/bpf/test_run.c:590:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   590 | {
       | ^
net/bpf/test_run.c:619:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   619 | {
       | ^
net/bpf/test_run.c:624:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   624 | {
       | ^
net/bpf/test_run.c:630:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   630 | {
       | ^
net/bpf/test_run.c:634:1: error: ‘retain’ attribute ignored 
[-Werror=attributes]
   634 | {
       | ^
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:194: net/bpf/test_run.o] Error 1
make[3]: *** [scripts/Makefile.build:440: net/bpf] Error 2
make[2]: *** [scripts/Makefile.build:440: net] Error 2
make[1]: *** [/home/ubuntu/mnt/linux2/Makefile:1989: .] Error 2
make: *** [Makefile:251: __sub-make] Error 2
ubuntu@jgarry-ubuntu-bm5-instance-20230215-1843:~/mnt/linux2$

The issue comes the definition of __bpf_kfunc from include/linux/btf.h

Other files which include btf.h, like kernel/cgroup/rstat.c, have this 
same issue.

I am crossing compiling with the following:

$ /usr/bin/arm-linux-gnueabihf-gcc --version
arm-linux-gnueabihf-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Normally I bodge a fix like:

---->8----

diff --git a/include/linux/btf.h b/include/linux/btf.h
index b12c63af9e78..4214e76c9168 100644
--- a/include/linux/btf.h
+++ b/include/linux/btf.h
@@ -83,7 +83,7 @@
   * as to avoid issues such as the compiler inlining or eliding either 
a static
   * kfunc, or a global kfunc in an LTO build.
   */
-#define __bpf_kfunc
+#define __bpf_kfunc __used __retain noinline

  #define __bpf_kfunc_start_defs() 
        \
         __diag_push();


----8<----

Any proposals to properly fix this?

Thanks,
John

