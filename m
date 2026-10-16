Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9531ACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16VuPbBInvczasafzch0DBBdbDfpVwRuiiTTgN0hJEY=; b=kpao9O4tEibMIXuAegvNJx1FYF
	/GW1QmeqBZSvfbvjaHq5UTS/OOCjP6GRqfXILYtk6LDeOgXcCBshYC/LmNxiUDRyjJ2IqjUE5O28o
	Pn2X0v6YRsC9nDU+lLRZp53nJlusi/4AA+25EyunoydjenmDi5I1oGYvEu3QCXhCSHHlgVqnqRuWq
	rWBU6MQGdQvbUeHbzgEBq3kpvit+QkF4GDQREraTwpqnMLl13e2T4phk4iCIP3KBzp8vXUYSmsqDJ
	wQvgzNETzvNFM2IgpZVWfoJK+9jrTS0RhEGV0S50osqL8ymQa325K3OIcSrtdf9L+clgZqkBRFWHV
	2n45hCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc4e-00000002By3-3Wiv;
	Fri, 16 Oct 2026 07:09:52 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHc4Y-00000002Btg-3trJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:09:48 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FN83GB1815445;
	Fri, 16 Oct 2026 07:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=16VuPbBInvczasafzch0DBBdbDfpVwRuiiTTgN0hJEY=; b=
	mTUnP4MPqh4DJ2q4JPh8Pxk73iUdybZ8+m2GFwCIZ5EiSpa0P9wdE/3sL0sQG873
	UwCVVLC0dPtbyQ7Y8REZub2zSHudpMSGAdb1NIp0rXsyQEvPwBPXwfxT83bH9dOT
	SJxf1cfZmCKWuPHLKTfg9qtq/APKtXtLj5wwzgrdfCBy9iQuCdk9jDH6laK5FMpI
	8whHf6VJEaDIwaVSdiIeeR/QYRaf9ITO+dkb+W2UVyq6haSyXR4WG7UiDB3t1pQ8
	9ksTVbCgTYK9hm/yaOWEq6bthzkFwMzw9KEGf9MeoB2BfCMijNSpgZv52mDLdoV7
	n+p/vzeATIGNg2VRGFcqZg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h7demsfu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2026 07:09:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 69G76hct021015;
	Fri, 16 Oct 2026 07:09:22 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h7btss14b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Oct 2026 07:09:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMyhqzjYv0RcqxKGmpbv47mGftciX7suKqb/mARWHo+J6EacuuW7qinFCA/qHp+LWLUmmwcqCVvg5wRczv63mtn2NZkDMwOENvBJm5+eVf/S80MA0+h7WQwTs4NyaKyu+Te+9FJXlkfP/WenssS3yxWWUstE5ZyFsJevurx1zE4ISdq87D5D7KCUij9K3U6D0vr4J/iZmV2PlUptwi/5uwz/MR2/RmxjnnH8xzYPyvDYf5knFty171WIZD36W3OoGha40MESVhsiL7KLtGxduwQXDHisixJaJCYDzhWTDokz314D741jKVFyg0IjauRaZYny6YElS6uEKqQZ6VBj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16VuPbBInvczasafzch0DBBdbDfpVwRuiiTTgN0hJEY=;
 b=AZLwnO9rAampzF3JVh4RgHKRcRiVa3P/SR+uIHbgnX+Nbx+V6xZcOs1qCjo9L3qU72+qGPY4S3suxhXYg2Z/uPgBbXGGFh1WHVhjbFxhOsnS8kQ1w6oR31f6vetSedF/Ey9gXJUhSuay0GtLvuS1aTgvxhUiIA27gWSWKUK85D0bBF6NaMLYx8b17ViyhzgckhPj8G6JGA7zeDfR2k0ctFomjfEcXumSsjO3Nn41Hb1EOcwNH3iizCghlH0SR84G1/tx/ybJPyaa+Dyvstak81/1H9rbtI2gCWwWKQ0HxQ+F4T+4S7Y7y9GpTb6zKmx9Pom3BZOLrJUlnKOZq6Svxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16VuPbBInvczasafzch0DBBdbDfpVwRuiiTTgN0hJEY=;
 b=p8My79aEgUwWQrDIhaMMNn4ww2iwfWizgyEEs2Rj05EFwJ8Sexm82jlgV/6UHm4UASq00S9zJ1sWw5mxu6ihvInhFRrPPNCrmzyzh8uuVCvw2aeqRosyeC/v4zv1VLvibT3HdKKpk/b1dTlBIjnrAfaY35Zr3HqcgLjOisyRZZI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by MW5PR10MB5668.namprd10.prod.outlook.com (2603:10b6:303:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Fri, 16 Oct
 2026 07:09:18 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%5]) with mapi id 15.21.0546.010; Fri, 16 Oct 2026
 07:09:18 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
        daniel.lezcano@kernel.org, memxor@gmail.com, zhenglifeng1@huawei.com,
        xueshuai@linux.alibaba.com, rdunlap@infradead.org,
        david.laight.linux@gmail.com, broonie@kernel.org,
        boris.ostrovsky@oracle.com, ashok.bhat@arm.com,
        Ankur Arora <ankur.a.arora@oracle.com>
Subject: [PATCH v16 09/16] bpf/rqspinlock: switch check_timeout() to a clock interface
Date: Fri, 16 Oct 2026 00:08:30 -0700
Message-Id: <20261016070837.440748-10-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20261016070837.440748-1-ankur.a.arora@oracle.com>
References: <20261016070837.440748-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0411.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::28) To DM8PR10MB5416.namprd10.prod.outlook.com
 (2603:10b6:8:3f::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|MW5PR10MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 98471300-ce2f-475f-1212-08df2b5464ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|56012099006|261009223027099003|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: GbMQ0Jgipgbv2lvoDJtNfHaXaNmKpX2keQ+p19dA1yU2Sm45FSaX1h91JHdUMYNxZUqxfeK2RWtYTPMGiTFti/GG6mPr9xkRq8dynVc+2ZxUxZsXwh9x7H7487vHnMsnwPVn4sxFKJ2oNzyKYroStwy8ge1/w23Ps+ROFujXtgvrwg2AbMausafGoym5nQ3nkUH3CMk55IOKVMxQwJZtoGME6nJDvH0c4OHCNBoWHk8Jq3vO4qDXBlYi6xav7XUfzrFhvBSzxW4raQdeT3Md8kU71QVkBUF/38LHru22CkNFku71DH2kVFHjih8+HwRBboLJq4ERtIw15w4NPaP8u9kg9u35KnVBPin1+5BQhlHK86NUmuAlKgX/mpN9Tve0dwziip3pX2xPcH0nubrnt6NQSDxhPFGVaeIIN1SThoMis37a/QUNjbHsqyIiyh9IyZbvo0RDgFgzeqSU7xL9YmbLKhKC86ZGBMLkmQ7DhroDt1BsHe2yZdfDfwqN0zuHPsdCJtnZ9o8KOayXp8hAm16ujM61FL7LSsTMhZj2slfCWgl/ZuKBHknDoyk7jafw/reBf4+QSvNNO/IAweFJfsrwpNjKaaNcBcSU7dRTr7b+psQebq8DaX+czVweZ5VTapDMgnWUYOPCvP9prITgc4Qc3cE+FXv1F7gc1oHzh/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(56012099006)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eJcEBUQsTb+tdQIbq9SN26NhRJon4c5vvvejRy1Wjwgbi4u4ccLqVgmSXMBM?=
 =?us-ascii?Q?nBOU3nqH0E4bC5dJ7hEVBB/5FOIOHizREh6nDk2/7xkwoI2WWAHZXULXnfw8?=
 =?us-ascii?Q?NDLvW/lwPaxXdmGkSGgxagumxX+NngdjECGENLMo5nP9yKXRScZ+KEejS05j?=
 =?us-ascii?Q?2syTevmhUPWkYYUtF3hnxsv7Y3f9/ussqKnJAF7X5nf5czd1ocsmx7IoZ97h?=
 =?us-ascii?Q?+OqgEvyd5fdakL0WXdCiCGevjQ83Mg1M9w+8sDBk2a9cjvBId5jzaOp48KGA?=
 =?us-ascii?Q?OY/CdAqvKLIiycAeD/B1mjgR0tE0Tu9oXOgeHXsJ27hqoPj06C4K6ae/M06E?=
 =?us-ascii?Q?4BpSpELZBmMQkYjxr4pegB+m4ISaNl4uIaXRKgyLxTTmBZd2yYQQ8YApf6US?=
 =?us-ascii?Q?UHxUP8Ya3kkXFb+ickaOm7BgGHtcrUf83YW/yL/SVGvuwqq7UKgY3awD+sZg?=
 =?us-ascii?Q?lI1RPJG4L+ePOWuyVR6QbJWFmZ6BVoLVock4+88f3oGz07vupBqlTDOvpXoo?=
 =?us-ascii?Q?PmT0+QwT+8tQx3iYvnSPfpIshpg7WgjQ/0CJ/uySTE2T1lYHFXAWSbPGWz0c?=
 =?us-ascii?Q?uQ6CM+UqnhFjaCLmrBFuO7pBvnkgCgvfYY5z5XdTW9SUGRzDExNFG+3u3K7U?=
 =?us-ascii?Q?/8S2dMTkfTQytbo8uLD+rZUpVXdVB62DQMAnA0ge0whIxoxFB+mOA38a0YOc?=
 =?us-ascii?Q?ZNuL2rLEqoI505+fgkOGxhcXOgZB0TuzuhVycQQGYm0HnZhtJ7o3CWBibeBZ?=
 =?us-ascii?Q?I+MoIcb7yp1GplI+Xt143RALlxhR/kKFXFhBzTJG0BG0pM5hYpzRUPgBEYoy?=
 =?us-ascii?Q?KyHVchokq/P+Pp62uCLzvo8VXm4YYA4oyfBbxS9lXisuodHbLhM7jkjMYZcI?=
 =?us-ascii?Q?KSxBljwX7EanIG+npIiX6DIZuFz9O5fOwg2voaa62qMUsSgz4M+CaVuoAnYP?=
 =?us-ascii?Q?luWt6YMJfmz7lLM3iMowpnNbkI2CUVhfiMCtyHssOMDWYtNTZ/kaAq8xRvrq?=
 =?us-ascii?Q?TcDfur7CRr4dgC8adD9narVXYXa5unZ4hquRDLbnXiFVVB69uAWuUMA5wylG?=
 =?us-ascii?Q?98DilHyzaxxFLx37b1b+s9KVcIxyp6XFaab2uD4zaezZI39THbhH0jfQGMAt?=
 =?us-ascii?Q?dxbT34kl2ywzfURcmJcaaU2pdvkiwH5Dj2p/Pt+NSQ8NTVwC8QQOSLNIo3Aq?=
 =?us-ascii?Q?RF+mC9keX846jne5Sl9fD3212TJsXsSCKV+UPxYgKUty0cBWN5ltPD/It9jc?=
 =?us-ascii?Q?ZXXBx9OcdVK1f511GtR/neqGpV/crm/UsXj1AqDSR/2pcSoxwL3SaS/gWVdM?=
 =?us-ascii?Q?UGIEDLXjcXkM6tUNTcfJxWsIgnNk9rGG+Hn2qNtLy8+JZ/kiGFMyNzCloQx0?=
 =?us-ascii?Q?5GdX+ldKF7Mj+q3iYK4ijWgnCrfXE1x4g6COgJFMgknhYgzQJ0tOonHARwBD?=
 =?us-ascii?Q?U/ijTyaAwnC6RJJWuOJm0dgZ8VE9RXDJ8h6+dFGK3W3ZENVbyAkyQdHydT8s?=
 =?us-ascii?Q?g9rrwnsukKpBI7dznISYBvUo2335wMfcZixgvi15h1uIZMwqMJaIovc6xmLA?=
 =?us-ascii?Q?3eJrAY1SI9Hmj2x3h2AZCvCmjO6NJxResXbzpuiLv/mNPnCrWxYF3MXQ1lJz?=
 =?us-ascii?Q?Pmxwvu+fF4L/DeNaaOQFHVMCHjwm72Nl2gLS34+75lEO7eUkDcovPOGIV/cV?=
 =?us-ascii?Q?bWJq/4Cu3PyuXTSxv6uOqT2TnlEwg8CJqBM+GHu6lp/j2Mb3JCfmGYH7EIwV?=
 =?us-ascii?Q?goX5OtL6SXPyJtLeDmBfun4i9G8D+c8=3D?=
X-Exchange-RoutingPolicyChecked: Yc5d9UiY/ZEPGxGK3GYXBGpdI5y2IBMFMet7tqZU2wCnNZfC3ozTfoCx1Ze1kp+dT4Ae784lnL/iI2/xksDyFbs14JoVeGrhWtXxRfsYsqlTi+ADytn5hgFwnFXN19F6uuZe5LBs+HitTDu2NBqcu3+UPlL3l2kBGOjIWTOsTIWSQK9KBVTZ1OjXXJr3dsCe135c8W3rEu5b23y18poYVDwMScSHiERDUFFGnJKZKzLjP6PRMNURaCSmOm0nKP83GUvMBC3TUVMAA/tNfae30dOP+rUbeTWN13Ghz+pQ9v5P8suMQdXOydZrBIjorU+XOsy39WPl85iwO+B9dYqJTA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xwZHHmKXO9fVKg5/4J5g4A4gpJkQRMRqzRil4J7kwTJJQdVDIAkKHDfqF+XbrcxWRXsfSd/sVAnBsLFKpYtv7G+eWaKj+XWLN/Vm71F3HG4blsrUfO1zOOJZn+CNygjpRa9HO8+yyj0nxnqlA2I+U4nirw1yZRxdrClyiqGJiYEmqc/ne3CuMQT8vFIbQwSzjGUUUPtnoBAYDjeRw8W47MZJ1T8UEAlxDYgBCH0qi2jVyN5Yp6vS7wpBXLmm0bCCdpWR51O5icLwDpgzVQAYAv/Rz6cYm+LTGGe1c8cKA6hWa2j3hU0Lscl73IRRKR3vrIBmFtGkOG5rxIHBy41QthSIPphHZA+i6Ii+1qSSRYH27EFWVAS9IJmGrgi8X5SAupFpCHHMM/EXEgfbiW2ioQ8qTdKsmnlrvu/FBFJi9nrMWOYa0s8LJmxLeaIfROY7DFlhJDdcwhjDEkFAClHytcBaGOL+T9r6zEO9hZLe73xOdwaYsa54nXopqmGl7RlSu9BHTio3cseqThWEmA4u+gY2LN1SWCiL0Ck/oi2sWSB/iIsB6kg3cRQ0dJvKoIZJyYXrgg7nE2glCtPMLiBkHaeaR1Cv2e4bUezIijJiDmg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98471300-ce2f-475f-1212-08df2b5464ea
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5416.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:09:18.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4ggkqXa3WsNeTC8rX/afcjJjLLgrr8n1TsxLvHfPtixc4pkLhVqxqKNQPPhSh8tptqEp4ycVcIMFDPm/fmjmLMjO52Pm31nuL8OW/zLPwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5668
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2610020000 definitions=main-2610160028
X-Authority-Analysis: v=2.4 cv=CoEq4X4D c=1 sm=1 tr=0 ts=6ad1cda3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8
 a=LqkqbBbWekfmbT-3qckA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:13537
X-Proofpoint-GUID: pjxGqZimr3soaZbZIHaLwqSLMVZMemn2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyOCBTYWx0ZWRfX98gWh4gNh+dJ
 7TL+LLZASrEr84Mdk/Ix6yjgp4FQARrr9+rBYsug7VZPJsD0Hm7uu4CByLLKv7FBZZLvI24s5Wt
 kKmrytqineJkZlA6G8gdGKV1YNz34UnyLk4uzzDt2AaOiiBkxcLd
X-Proofpoint-ORIG-GUID: pjxGqZimr3soaZbZIHaLwqSLMVZMemn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyOCBTYWx0ZWRfX5hm4DNGOqAep
 YREo/MS3mGZIluKJd1cDQ/8fqmjrWiIFLMqhG/Krk60cujTki7NapS1RZ2YGFNWEevxsNIjMqsU
 JjROoFY/Iu10OahF0fHEyMh+zi7WVM7zScS9R84FwEwYvLtHhQSImXZkkgqki/Tnu9i1FnMVTzC
 XexCN9BGYMDK/gytJUMHFkP4VYbdF69U2Lt6ckKh8bMkKEl9Sf/yJfRxkirCVCDbFx+qRIv/Pyn
 3d3pHYoUNCwI+Wcvee8cDth07yALlc71veSEWuZyoJY9WkQWam11FozTQPMRJoy6ykRzBG78UB7
 E6J2N5fQVKoKfAHSbe9kNnlI/2c/j1x8vmEQO3Hj/rMCHyQBHQ2nmXr0Hr0UMC+u6sEAyKzvxTX
 HYBRxz0dY8n0tlLEsh+2eqBpVny1Fv0rb4dal4XBvdvi4+wzcmae5ybh34WaK5Rxy9ywZ2CCDY1
 NinGF2GTXsihmWlxKV0aiGQbxDIiyDUE+u5gW+W4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_000947_121778_CC80F2A8 
X-CRM114-Status: GOOD (  16.26  )
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

check_timeout() gets the current time value and depending on how
much time has passed, checks for deadlock or times out, returning 0
or -errno on deadlock or timeout.

Switch this out to clock_deadlock(), a clock style interface, which
functions as a clock in the "lock-domain", returning the current time
until a deadlock or timeout occurs. Once a deadlock or timeout has
occurred, it stops functioning as a clock and returns error.

Also adjust the RES_CHECK_TIMEOUT macro to discard the clock value
when updating the explicit return status.

Cc: bpf@vger.kernel.org
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 kernel/bpf/rqspinlock.c | 45 +++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80ea958..1b249c6f0674 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -196,8 +196,12 @@ static noinline int check_deadlock_ABBA(rqspinlock_t *lock, u32 mask)
 	return 0;
 }
 
-static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
-				  struct rqspinlock_timeout *ts)
+/*
+ * Returns current monotonic time in ns on success or, negative errno
+ * value on failure due to timeout expiration or detection of deadlock.
+ */
+static noinline s64 clock_deadlock(rqspinlock_t *lock, u32 mask,
+				   struct rqspinlock_timeout *ts)
 {
 	u64 prev = ts->cur;
 	u64 time;
@@ -207,7 +211,7 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
 			return -EDEADLK;
 		ts->cur = ktime_get_mono_fast_ns();
 		ts->timeout_end = ts->cur + ts->duration;
-		return 0;
+		return (s64)ts->cur;
 	}
 
 	time = ktime_get_mono_fast_ns();
@@ -219,11 +223,15 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
 	 * checks.
 	 */
 	if (prev + NSEC_PER_MSEC < time) {
+		int ret;
 		ts->cur = time;
-		return check_deadlock_ABBA(lock, mask);
+		ret = check_deadlock_ABBA(lock, mask);
+		if (ret)
+			return ret;
+
 	}
 
-	return 0;
+	return (s64)time;
 }
 
 /*
@@ -231,15 +239,22 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
  * as the macro does internal amortization for us.
  */
 #ifndef res_smp_cond_load_acquire
-#define RES_CHECK_TIMEOUT(ts, ret, mask)                              \
-	({                                                            \
-		if (!(ts).spin++)                                     \
-			(ret) = check_timeout((lock), (mask), &(ts)); \
-		(ret);                                                \
+#define RES_CHECK_TIMEOUT(ts, ret, mask)					\
+	({									\
+		s64 __timeval_err = 0;						\
+		if (!(ts).spin++)						\
+			__timeval_err = clock_deadlock((lock), (mask), &(ts));	\
+		(ret) = __timeval_err < 0 ? __timeval_err : 0;			\
+		__timeval_err;							\
 	})
 #else
-#define RES_CHECK_TIMEOUT(ts, ret, mask)			      \
-	({ (ret) = check_timeout((lock), (mask), &(ts)); })
+#define RES_CHECK_TIMEOUT(ts, ret, mask)					\
+	({									\
+		s64 __timeval_err;						\
+		__timeval_err = clock_deadlock((lock), (mask), &(ts));		\
+		(ret) = __timeval_err < 0 ? __timeval_err : 0;			\
+		__timeval_err;							\
+	})
 #endif
 
 /*
@@ -281,7 +296,7 @@ int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock)
 	val = atomic_read(&lock->val);
 
 	if (val || !atomic_try_cmpxchg(&lock->val, &val, 1)) {
-		if (RES_CHECK_TIMEOUT(ts, ret, ~0u))
+		if (RES_CHECK_TIMEOUT(ts, ret, ~0u) < 0)
 			goto out;
 		cpu_relax();
 		goto retry;
@@ -406,7 +421,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	if (val & _Q_LOCKED_MASK) {
 		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
-		res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));
+		res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK) < 0);
 	}
 
 	if (ret) {
@@ -568,7 +583,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT * 2);
 	val = res_atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
-					   RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK));
+					   RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK) < 0);
 
 	/* Disable queue destruction when we detect deadlocks. */
 	if (ret == -EDEADLK) {
-- 
2.43.7


