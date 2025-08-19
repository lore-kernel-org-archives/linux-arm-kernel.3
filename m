Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jgb0T5/sO3mo5x29rZy4+PMegBIQOHKFjIaTLXkAy/c=; b=hSrkCIwnq4NHhRhd63xGM+I9TQ
	Sj0451XHS2f0wH7Wmi+l5BLHfe1c1Vv719LUiUdVATttiLBGa3+/gZVp8m9PdPpjv1rhH2/5FKd+E
	bxI2wz1VzDAnMPcIR9DTeqbAASbzJ/Y06JKjYrM1Dij5XGen59lFw/XBsbLzbCSCA37Q0Zu5+ZeZ1
	4WV5ZBTzi09pZM/6Qo5Gm3QsD8xITcd8U355F91w+J6Eh8s3B67IBHazrY6hF652m3DND5T6ft4Ps
	iocPM/eoRmVSRdP8sCGKzeGGwFKN25skO/EZdVKRThpI6qiwOm/n84DodGwwt9iasCaEBOVwqMUoT
	5HmFyCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNXy-0000000Amnz-0VVJ;
	Tue, 19 Aug 2025 14:42:46 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoL6J-0000000ANhU-0gO6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:06:05 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J9sWkN016271;
	Tue, 19 Aug 2025 05:05:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2099.outbound.protection.outlook.com [40.107.94.99])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 48mq1yg6y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 05:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXzfF02wzuMb9FLOQqgwvnLemYAdSAFP77hWFBKBZI9qnMJ1qgEznR1O8oohdFBpyR7m/V42BD8RiAG6eKc3C/EUBAnFV/7RcGPOFJx4+IFn4DJ9UyFvc2wRG/nLEUexrGI/DQhvw1kfRNmbfUhBoDs+E5BYJ4w0MoKYLW1Hg2J5WJhUoavOrYtdvMSjOdOGzesNb2HCjwwqJYUVgJh8TpNdl3ocw/VIEqt4HyC+Cz52ptz5mhwYkFOYgZ/QC/DMfcfs0WSDDN08O1AetvR2L0/piNoJmDRiR9w9icVle1PHr/ilV0zvIMzW5kFBBef+Lr4y3x+LYwlnCTVL5n+Kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgb0T5/sO3mo5x29rZy4+PMegBIQOHKFjIaTLXkAy/c=;
 b=XPzaXeBxvAj4muCI0z4ZmVM06aMODtCRtvY0jfi6Nd6Tg0keMKk7wW2faUMbPt7FgX0balt73BlEzc8jvbdWvViOBeu46AE14VYSVtjB5NsEc7NGdrLJxI4vgk19xzNsDLlj1UUCAPVP7r/HSgq6/xd4/lNmS8XRGLTxhzaDqKVCTT4WTTenpW7Am4hy24tINFFzy51QcCLA9Fss0ybUIYAiKKSB1VBrshT8id1czDUxfDEw11XXrcDLVmsZB03zotCDOC2Chct+/J4a9zSvAPo7w1KIxzAtYFJG/x3ac64d1hRc3JGsK2NEo3keNzuVlpbCm0uaNKSH6CcLdt8Q9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgb0T5/sO3mo5x29rZy4+PMegBIQOHKFjIaTLXkAy/c=;
 b=FeyTh2rD6JsMyDGGPBj5lqf79Cd/TmPZHFvcNM7T478KKwPu6BiJWWFoTEORmKlueZxF5Z2KDNHulOpG5CqkrWT7U06NdwDS+LgOrXzk/KErt1mvvdX6+NMZm/CA+3x+H2KI1Ca9c+yddin7pevMG7lDHaz1LkqqUV1x4PBDn/A=
Received: from BN9PR18MB4251.namprd18.prod.outlook.com (2603:10b6:408:11c::10)
 by BL1PPF4D94AC0DC.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d96) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 19 Aug
 2025 12:05:27 +0000
Received: from BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::e57a:28c:76f6:2623]) by BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::e57a:28c:76f6:2623%5]) with mapi id 15.20.9031.019; Tue, 19 Aug 2025
 12:05:27 +0000
From: Elad Nachman <enachman@marvell.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement
	<gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: [EXTERNAL] [PATCH] irqchip/mvebu-gicp: Fix an IS_ERR() vs NULL check
 in probe()The ioremap() function never returns error pointers, it returns
 NULLd
Thread-Topic: [EXTERNAL] [PATCH] irqchip/mvebu-gicp: Fix an IS_ERR() vs NULL
 check in probe()The ioremap() function never returns error pointers, it
 returns NULLd
Thread-Index: AdwRAV2kZMQtD2qRSZSG1g2az5ZRmw==
Date: Tue, 19 Aug 2025 12:05:27 +0000
Message-ID: <BN9PR18MB4251D8CDC437668CD774C651DB30A@BN9PR18MB4251.namprd18.prod.outlook.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR18MB4251:EE_|BL1PPF4D94AC0DC:EE_
x-ms-office365-filtering-correlation-id: 112e7513-b1f0-496e-18a3-08dddf18af8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/1tNigekxCW/z3ga2Ow4eORITf3IENwPkWbfLt6BBxlgRtjkXzQlPnJvDG1e?=
 =?us-ascii?Q?Nm2NpPH2uiyaKK+9DtwwA1Irv3NQjQb727I2emPeN4RwqrAXSjxv87jngY3W?=
 =?us-ascii?Q?RHj0+gehp+UgwKru8p+nZXZcQRR177Yf9Jeaz5NEJ414jqoWlcP7mVOmq/FX?=
 =?us-ascii?Q?AUAFWnLHEuJv0/7XJTBRXdMlSRcv84L3gHW4BmzZj1iMHHky3AzUidvTw9Rw?=
 =?us-ascii?Q?bnk2D3CQx9El093oe9iTjODBSQtsM6TKGC8wI+P8rRxMZIr0y9MUgWv4Y1uG?=
 =?us-ascii?Q?bj9HyQLSM+hNJGz5kqYXaaj/GKcONFVLKIEPu1LLWs7eIU53oC9IVs/VeXua?=
 =?us-ascii?Q?CWuGThh/6POjiClR1aBIJsAWD48dsUH5ODBe4wFNW67yTmHlBZxJxW1R57ba?=
 =?us-ascii?Q?kTpcRmXMWb+yhYjczVqC/BSTK5tk0GYGqMRLK9Vpg9E1w8TUDC77QPyLjwCX?=
 =?us-ascii?Q?BG7hZ/w18e3564o0WDYHk75mRbVDue3AkvOdv+dburDL1DGNyziCBkElqrz9?=
 =?us-ascii?Q?9S2CffjaiK2d4zbh0MSbyKoNNG/1vNLs1zGeLiwfIpSJoAuJxXqQhjnMfhLi?=
 =?us-ascii?Q?mV4iMhaerG7/YTYsAdIYOsEA0U4HNzuPe5Z026NBnrymeWCx7NvVUecIvSl1?=
 =?us-ascii?Q?9OigX1C5r7gFPwXgV41KeszqF87aQrcimP9Efj2lD/VrgVvr7csUACYEuVZ3?=
 =?us-ascii?Q?fxljG6Ul+FE6HibSOguza69AxZahcA94w404LjAxdjbNN62ch9MfqcKWI7G+?=
 =?us-ascii?Q?4eN/xBii8nIIfXBpKpQx0q+l/hTyuk3P56JIsuMr/SCopMwuYzghaOjB9nYK?=
 =?us-ascii?Q?WH+PAb+boWrI5reRpnTQlSGtto7NrRTZZWvv2ZyKeJar/hcTSSCFIfvthfPM?=
 =?us-ascii?Q?+L1Bzqbmb0zSCh/WVvBsautzI2Nfog1wQCkLxJze0DZDk/x5Yo3l2h6DIbZh?=
 =?us-ascii?Q?at0el5MmzWjFtAGt11gjONSYqLpqvETv3ghtFU6xN4cSrtqDT2tzB0FewEcQ?=
 =?us-ascii?Q?zJ/IoMo51HRyOM2aDwcdmiYEe6wbNp4QYCd7F3mTmDSM4Htvt3zWp++/l3dy?=
 =?us-ascii?Q?rNZbxnhPnqZjQckJGLTnITf7+V7LiE2pYziw9EhnFpPQrJOBswEpfBfCqMxr?=
 =?us-ascii?Q?hoWmyXbWSvUjGwhC5Rs6Pjj6AcS4JYi/Yg8Uue0STthH5sfi+j4nl9DJHsDX?=
 =?us-ascii?Q?3r7GL3XpRp2un6tvlw7Ltv5mX4GapVrdfKfWahgL4RvJh1a5zb0WkrfgaC2C?=
 =?us-ascii?Q?AKIKZz2n+UbiY3ID1yTfJCRK/wHPdLJ8sBFh3jI3cIRHwcGZEc+wSVieJvHX?=
 =?us-ascii?Q?K0oS6owa+hbgYhVc2BUAsg/q1qS/wZKDE2a75UxUFlS7lCkZEbW/E428WP3V?=
 =?us-ascii?Q?6B/0Gyrke+f3iVu5txOWza1MdZ4OWpcXwuj2I6p3b44p0wx4LmQkwR36WHLg?=
 =?us-ascii?Q?OMZVu2a70f9/Jv1JE/jp9Btm5r4a3JOanRTPu0UIA9YL0NNMcCmOBg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR18MB4251.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9T1kMpA5lesUCc3+VzHtuslXXJLp0BRJXPjZ7DomkSQclUX0GEjw2HEiqBcC?=
 =?us-ascii?Q?lLk1ZQ1jDN5Q6/sI/QPTay+QnKVu0LcP+3ZCioyjg5Ma9PtmxAMDO4aipkDK?=
 =?us-ascii?Q?SZh5pVoYv6tM6vkLBD5rELc34liYSilPQNk/2bFfzw8hKPn05ORKcezxx7Md?=
 =?us-ascii?Q?WRU2g70mluHRZygYVoTvVDCDqu1H0+Y9eqOyTcY/1lAE0b1jYa4nfiKHIWP3?=
 =?us-ascii?Q?UvLSGUhj3wAoSw0ZU9P3uBehSJe/7B0DCNiClzC+q1DNLtE74dJu9ZCmfJOc?=
 =?us-ascii?Q?O2NzRu588sGbd0DodSuzNd8dRx+frppuhjl1+K5LXheN/pS8GLph4yAXv9BF?=
 =?us-ascii?Q?Q2oM3glUbpD0EGt1yNKq2CwX4KWwmr201+xsEhKRcQxh8/adAzE8p75j82QC?=
 =?us-ascii?Q?aDTnEZMDO722lcquUUNEC7jN8FKyKyrKPgINiSEk/SAxGNQC77XKk6MTJf14?=
 =?us-ascii?Q?ONrGMjkiJykmtjh93CWWbWQ7UCyJhyh42Z7P3kmcAlt89RBAy9hczHIJCi8Z?=
 =?us-ascii?Q?cM3VTdnBnjih47uScfYzoHNgalyNEvKPxmN4ISH7cKl9Tc/wymKWDFwXQk4D?=
 =?us-ascii?Q?sNZWG81s/AG2wJIwRzcDg+OAsE9kj7Pfa7Lw5nwe8VycQMANutw+WoQZ1/Ga?=
 =?us-ascii?Q?pIc72XJU8tPYkoYygT6bPXrxrlyyqUNP90k9iVnJeWtMEhMP7kk/txhRq9oI?=
 =?us-ascii?Q?2Hp9hzKlUjVK1yPch7IwZP7cyTHGVSPYMU+uuFG+echYIx6qWmsexdh1Y8YT?=
 =?us-ascii?Q?utU1PbL0Gwy69x1AGICyT53OXQEi4KqFyzS8lhcTdOZzHFMo0rFyxeMdyd2X?=
 =?us-ascii?Q?Heoxb3xWmV1CnhY/6DDewvOoZsw6kJ+bJ3wwOcuV0Z5yIVwJMsFQ9XXpv3Yj?=
 =?us-ascii?Q?bgLikZ/4zkthDHNaNvcxyhmly6q5N4F+wTuwiSoMhR8FaITkff+/I/B3evpy?=
 =?us-ascii?Q?R5H67XgfkU34ryRXFMo6hu6bkJ9NKKoVEchPwyVsY01A1rR2r7e4L7yRVIOw?=
 =?us-ascii?Q?VdFLLVGCJG1dLufcFpUNP8M+t9HijjKDRSAZpaGKr0Pgzcs5fQZ5l3G41zRO?=
 =?us-ascii?Q?toIMFiIjz5usGL+/GciHt0RIBo20WkjzAmtpateIPCai4J+U4xVe5FTg9Tmg?=
 =?us-ascii?Q?46qwFC26RgpZ3AtJr6az8KsFQAHYVyQU4HPfW+bXEWAh6YyiidbsswyaxGCJ?=
 =?us-ascii?Q?JKpZdoAuMMy6EYzjhxhi8fw1e0wNkvznaePKVoPkwFWbspEH4mJd9Nmdl8nA?=
 =?us-ascii?Q?VX9PgtJgTvteRqejXmavzIyrVd/bFT6+8cNUz6rQp7YuNPe33Nb+6LW5770G?=
 =?us-ascii?Q?kJcaSSC6CiffnEtdBXNIHCe4HJerbdzSPwlTJQNtOB3Qd/zWiAhdtfFy16Vx?=
 =?us-ascii?Q?33adxH/LTaZ0aZWV3GAO+EhiGNdhRfdkvyQngC+DwskfjAgl7kd/CVzZrfIW?=
 =?us-ascii?Q?L1UMQ7bx4O++pkLz2+yCr2s0vFZzcergGSSmDi1Gaz8wpWvjFiKXIpQKEWqQ?=
 =?us-ascii?Q?NrD7sg9fFO25edVFyXWEzyjGK8lRYbiBp06hNIDnBNlKqsIBOh9tKDqPgzRZ?=
 =?us-ascii?Q?9tRjUYfD5ld0Q5QWOoOqrRYYE6qGTdGpHX+LeuVL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR18MB4251.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112e7513-b1f0-496e-18a3-08dddf18af8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 12:05:27.3422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cix5yEvSUxsoKsQg8VsNktvjVnVO6pNN5bGXAL1Mmm9GfmJ+W5fSsRkn5OVQ8i3TfPY0TIwNlCcKKlqtHXEb6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF4D94AC0DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDExNCBTYWx0ZWRfX8xBP9b9c9SC+ pfBVDFxopJJPDC8POCNbOiMRaXhpOUoA9fG693lJPXAulXlaqLo8Ag1A8aovXXwhnvBLqPo9vEI 1U7vkSgc/cSNac0XHn4EH2zGEvTFEOT/tI3eDAKOKUpfmNHKf9zpf/3F/mmC92PPODtBRKOinKE
 kCphVk5uoF5kLFcMgqP07XA6EtEANlK9ICSTR9MLiSz9cKguvWEVYjHlm39DRpOjPIOJDDA1Tzo VamLuDgSOD5wJi01dVl2GtBLV6qgrpTTyTUB/XzQVBEEfCZRdaXgfXkmilbfVHrvw3Q8dbk7hTm SW0vU4RAhlqNUbswmVNBnnMDgh1XxV4l84AwCktoqCU2MIk36igPv5IdNgd2z5jijCIyPnZTUPn
 vviKqTXP9zeElNGzcOOPNQ8DOUAf3bJYEnQkFM5ioDWhFFa1b0FevqWYLnYwbmBN7zu8y39W
X-Proofpoint-ORIG-GUID: 4ICIBBSkOiFVnTwSXGT3ySmC-zOgc82Z
X-Proofpoint-GUID: 4ICIBBSkOiFVnTwSXGT3ySmC-zOgc82Z
X-Authority-Analysis: v=2.4 cv=LeY86ifi c=1 sm=1 tr=0 ts=68a4688c cx=c_pps a=mWgAwXS4gBELfCztqCwhwA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=-AAbraWEqlQA:10 a=M5GUcnROAAAA:8 a=KKAkSRfTAAAA:8 a=xaBrW4Ooh9wQ9QMDE_cA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_050603_669752_3B8A075F 
X-CRM114-Status: GOOD (  12.81  )
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

Acked-by: Elad Nachman <enachman@marvell.com>

>The ioremap() function never returns error pointers, it returns NULL
>on error.  Fix the checking to match.
>
>Fixes: 3c3d7dbab2c7 ("irqchip/mvebu-gicp: Clear pending interrupts on init=
")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>---
> drivers/irqchip/irq-mvebu-gicp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-=
gicp.c
>index 54833717f8a7..667bde3c651f 100644
>--- a/drivers/irqchip/irq-mvebu-gicp.c
>+++ b/drivers/irqchip/irq-mvebu-gicp.c
>@@ -238,7 +238,7 @@ static int mvebu_gicp_probe(struct platform_device *pd=
ev)
> 	}
>
> 	base =3D ioremap(gicp->res->start, resource_size(gicp->res));
>-	if (IS_ERR(base)) {
>+	if (!base) {
> 		dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending interrup=
ts.\n");
> 	} else {
> 		for (i =3D 0; i < 64; i++)
>--=20
>2.47.2


