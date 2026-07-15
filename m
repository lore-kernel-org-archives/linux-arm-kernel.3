Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 04:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jFNoRC8aqNkItZKg7vTKAz8rNUcMgbIUy9u5avavZg=; b=Mvv88YoKjQzT7QOfQ5qddvPkGa
	/P94c4l8dbzXD8rIHY6IxvxPfbGpdpPlGhAwN4d97M0pXaRDYk1Ncbn/RPr/th51EQiD5gmsZDXf1
	sJ38/7Gn+AxV0bR3EB58x+VadQtMmqWLuK2qkG9oXr8kICCf3N3BdlwZbC2z+Cl27yXxiLGb6iJbD
	XOTiy6iYJFpCwTkJ5jeT+iCQc7lCBMKJDD/ic1lQOhLM94JR/k6x93jxLxSl1NTjbpgtLuiX202sy
	0UvwBL9H9yl8rW7voac1oq0ebcgi8PmJUhpBqTZXGWJ8sdRuo36gK8zcjuyWClfEbGfZ9iOiytdbm
	CLMK6tDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrWn-0000000Dkcn-2Rqe;
	Wed, 15 Jul 2026 04:47:25 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrWl-0000000DkbW-1aqJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 04:47:24 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66F3jf9i4062469;
	Tue, 14 Jul 2026 23:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0jFNoRC8aqNkItZKg7vTKAz8rNUcMgbIUy9u5avav
	Zg=; b=XrB5EZa17SPq2eCgs7Orn3hvs7b4pdWhC3KwfyFo4ZfKiTpjjyub0pVDa
	Xi0HcM1ATxpeeTIP1NAzCpV2S9UA2OG9wXS0ito2Z1LEOMdqsTsE013WfWgabxQD
	ALJRq80cK3vKofZoZHvRqYSKhrQQDQvjm/YZeX2yKMmX9aswaJu48nL4iD0+wiPg
	jXC3NVzIYPnHC0RI47EoTs1hghszBNG8LbGGv/UEolbzCcmKkaykw23GyF3J/eCh
	uJGfJVmP6Txx+jjRlOt8Oy0G5119netLkOi9u0W/aXGLUJhLMl166ForPnaJHbSN
	u9FQSxzyzJhEDQ6EWwCLU+8MncDxg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdmgcmtrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 23:47:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doMlIy8fAjL4/y3klZSGmKw/02tjut3xiHIrKjtYcH6SfdbwQVPZKPJxXGYIqgmPbWcWpYfy5+j97xIqfUqFZWKujPRvU4PitRdLCrjUs5a722EyI+lZMMhUzZbeqzxONSiTo3BqdGTJ4sh8PyQQE3nR1TzRW9aOQViE2t4NMUL95/KF9RMRQsMZ4d4K4NWfMM0CrwuJ8KDdYRpDupMpAn50kv+AtVJuS1ocoIIOo8DMnQglPcG6lu9qwXZfvJ5w9pG3RxSdOxFZH8vCoykqc9b26b+zr27HwF1tqHbR8zvCERI4jzxGoKyQrQF4nv1vU+gtLo24KzclPSBxI3mh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jFNoRC8aqNkItZKg7vTKAz8rNUcMgbIUy9u5avavZg=;
 b=I5stvg5WOXL9LNM01kjXjuZgrGV8UoSD7yB8MAH0MRJSDc4dq9pvUVI9nXw/8xbB3f3M6OBHn7bs1nzWArFnw7dCno6QgP4qqp8SJ/vj3W/n0IPB6f/AAbJiRJ1sx5ecDw+rlp25jh/O4MVCSKsCigHCHLCNiluEzhNH24h4uZ3JeIJyXxML37rgCAZH0s/He20DjVJgirdL3CKW4Tkf3VVm4mtTNAgW/I+55hzy71QVAMf1F6VKd46N96GRcsY4vvwSl3WPVKs+pWw9RZvMRFW96hs4V4CcXX6wG155lFpcjeTgIcHJ1DJRP2a9rLmRCfW0BCnohVQFtFPS8gyiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jFNoRC8aqNkItZKg7vTKAz8rNUcMgbIUy9u5avavZg=;
 b=siyZvLtBW91KZfz7+LSc68QoEwiE8AWF+kUX4016sQ6mrSakQIrl6sNGs8LvEk0KXJ3bZ7n7kMefZe6GgGs7cU4j5hLabMhJwDHvC6KDVsDTHFa84RwNHAwFEpx2yJKy9GOaJA/1YtW92Gxluiqq+4gtZeMyBfJNksM/mNf9JiA=
Received: from DS7P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::8) by
 CYYPR10MB7565.namprd10.prod.outlook.com (2603:10b6:930:bb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 04:47:12 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:25e:cafe::77) by DS7P221CA0036.outlook.office365.com
 (2603:10b6:8:25e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 04:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 04:47:12 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:47:11 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 23:47:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 23:47:12 -0500
Received: from [10.24.53.161] (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F4l9Ke1619988;
	Tue, 14 Jul 2026 23:47:09 -0500
Message-ID: <a90cd3e4-2215-478b-bff3-481da41e2668@ti.com>
Date: Wed, 15 Jul 2026 10:17:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/22] memory: ti-ddrss: Add MR4 temperature-driven
 refresh rate driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
CC: <krzk@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>
References: <20260714125557.3304305-1-v-mannuru@ti.com>
 <alaojVmBNqua82_t@monoceros>
Content-Language: en-US
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
In-Reply-To: <alaojVmBNqua82_t@monoceros>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CYYPR10MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 67630dd3-3ccc-4b07-56c2-08dee22c22d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: RC+shAehJXk3v68aMIjcVNMzeWBlecNd9+yVYY5vJ068lx8JRagrlCKLmuTnEdxNaPq8Di8Z2B715PvYEOETLyutXd/FM6xVqMCEeZXuyDZctx/OnRI7LMxtTZ7LT27MAjv2BVYfWKqod6Kla1J4gthvaAhIWMYkl7HSPDpok/4RxCmMwcBaTUUfAWsPZ5CHc54KyYbs1L/OFXhD1N8gb6e25bvTbmU8c99WDrPt/11aWs+mm2/PY73aD6xx4DS5QyHPhqVAW6/Cor/erkgyZwZ5V1hC4GTgFrQ88kt5cQI5ww6KT4QUmV6tOiec1D+9k2kYshg5jLJI/SzM+ysHuE7cnpqWwFPi0ZPKsMKDx7co7v2FxDITcnL1o1Pm/XlSt8rJcZDtV9ij51ZhnqmtVznaWLBPdcgVfT/MwEZ8ZXZpFBQCV9wxq6HwaY9e28yNd8J1+gfMCS5YghWSKP+3Rsbt1SsilvSh2yneG3OM4d8TzNkSQtzNP3ADY96QAyYw7RNIGOTVyuRqWwo6w9yKftDOsuYWytuY3AgisQXoX0/kGuvY97oTrqPDLyoNGJeWbxmvpFfcixVSkSrDjtEudhuR5+yBJ6gZq5OiYe1r2LGaOyzkbT1MpKYFcwjE0jk0nPX+Tm0zbQGgu811b+8hbHBOWnDQFiQCE2RVGxgfeLTYLDKpwxI9wjPWhgSycY4h5Hh4mM/TCa/aK4Qi1s9mCA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FFxhmO7VBMOPIs6TmHUnQkjt5b6ox0KvzBoEpu3hoU3l6d2JO4cPxprPeEGcdeIfLuDTLd8bGBTe1W/zbmrnqoWfMrEoq8SlgHgYCp3+Mw7rRKSpyqJHExH4+ZKKqopaYhrHvYVK+konguMFB/RTDVWYyAcROIkwPv7v/4mQXoDz7rexJjG74l5tKoLIDQU3pDZnCRONwu8B56IR6v5jDOb6jmBCWV/LJd9nabguEfIhTWb0USGIDiTcpgja38B5XXhwDULpKUyEreTeLiK/r8bOBYJTCA9TRN8eJpTbbonTQ3clijN8baaYGEogq+aHAfAtfgM3KdQ79z7FitEo1J1Uz4krtOvkhGc4qSm3RUiTPXGtIzxgX5dUdojVXlMuSDq3AERY1yfnXyiWMdMnjqT0gQoKbhj4+GM/1B4DcaXiLJQDZLd9eR0NGHoyv7nd
X-Exchange-RoutingPolicyChecked: RX4wu3XfXQ4YQTBrs1doPLYEBRb0ckrJHmjkAKnYJDZVXICk75eiH6Eb1X6m+hqD60gthj56PrSYi9UFMn8JztJaql+azl15paPeCsJyvS+0THIXeEA7kpPt+P28gUUsixA1C13qkRFHOo9dmqNQ/6OQ1nVfkrKoZngIBlnQwzx+JFnT4YhU5t/Qpyq2u1p0c60orm8WzEVlQYc7QSmbLO+qL6c6LxZNtwz5z030guuZKe/NO48+Obd2IGN6KmNyIKjTnzeHvNjgFnkER2Cj3z70u9lrqE99b0OwSjqlXE30Tbe4VnYJP7BgaU81ZReTBlZr31LTUaTM+O09vpXEXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:47:12.2845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67630dd3-3ccc-4b07-56c2-08dee22c22d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7565
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA0MCBTYWx0ZWRfX55T5p8HmEdaW
 CgVmu+Na0M5qRvzAh7ErGT308gLsuQXSmMhdUrNn/s2nfsg8bGKMPAiPGHJmZqJadhMf/K4VE44
 ncG2yNn07THJ/f4InwJkd1zfdH90AFo=
X-Proofpoint-GUID: j7qQweTvPo2TE02bsfsJWABAFxXOdzlL
X-Proofpoint-ORIG-GUID: j7qQweTvPo2TE02bsfsJWABAFxXOdzlL
X-Authority-Analysis: v=2.4 cv=GLo41ONK c=1 sm=1 tr=0 ts=6a5710d3 cx=c_pps
 a=uRIsUzfalb69z9iYDTnHFQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=WEh4LOZpqgjvpk7EXHwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA0MCBTYWx0ZWRfXxou80jBCor6q
 HqYU4lLJJdY0N03sbNpEpq+nD753kQ3WJhVkdv8Q2cjeLTxfHNnw2thGt+/3CY1bfGV6uiDkSCx
 UGj1V3rkau5NORJw3JNoBGCr4V/j/D+NuiJE3Z7gaEPiBwxGgO39TdPSUDmRK2DqCFyKbzDS/R/
 CVzipiWUm5uYAJsywTRZDJ6Rc41bd0BfFsSRQ4OKcBIXC2CtdGd5X1jeRh3acAi53m54bReRgHh
 NNvsWsJcMJPr+KSRIB3xv5wN8LqZwZuMUTw3JI8zddtpsQtH/JIxbp07fNR5tVTLrzKq0MZep66
 L4QJvgpa+D5u1szPT2TBz0RHnRljjke3/3iO603grY2/P3SDGNhkFL/9VpmYHhI6UJswTQks2Du
 rMxvEwQKo7sn7+P1M6yuHJLdVEYwFcNb3OobuZ8vJQImZ13ZsjAX6Z+3eeMiSYG5xyyMYkUJdHi
 BgwBznluf3MHn1FiDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_214723_487537_07B88334 
X-CRM114-Status: GOOD (  17.09  )
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

Hi Uwe,

Thank you for the review.

On 15/07/26 02:59, Uwe Kleine-König wrote:
> Hello,
>
> On Tue, Jul 14, 2026 at 06:25:57PM +0530, MANNURU VENKATESWARLU wrote:
>> +#include <linux/mfd/ti-ddrss.h>
>> +#include <linux/mod_devicetable.h>
> Please drop this header. platform_device_id is provided by
> <linux/platform_device.h>, so the explicit include isn't needed.
>
> The mod_devicetable.h header will go away soon.
Understood, will remove this.
>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> [...]
>> +static const struct platform_device_id k3_ddr_mr4_id[] = {
>> +	{ "ti-ddrss-mr4", 0 },
>> +	{}
>> +};
> Please make this:
>
> static const struct platform_device_id k3_ddr_mr4_id[] = {
> 	{ .name = "ti-ddrss-mr4" },
> 	{ }
> };
Okay, will make this.
>> +MODULE_DEVICE_TABLE(platform, k3_ddr_mr4_id);
>> +
>> +static struct platform_driver k3_ddr_mr4_driver = {
>> +	.driver = {
>> +		.name		= "ti-ddrss-mr4",
>> +		.dev_groups	= k3_ddr_mr4_groups,
>> +	},
>> +	.probe		= k3_ddr_mr4_probe,
>> +	.id_table	= k3_ddr_mr4_id,
> I'm not a fan of aligned `=`. These tend to diverge over time. And
> sometimes they are not even aligned from the start ...
> If you ask me, just use a single space before the `=`.
Agreed, will use a single space before `=` throughout
>
> Best regards
> Uwe

Thanks,
VENKEY


