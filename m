Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FFFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq0lxpdGrjX9AWCJahC0iERrTVH9tVPMpyME/8OvAvc=; b=4sSLLN4fGrXyCArje3NenEHMit
	Q5pz7iC3rNgJw1rJZdKVGIbiQ6sNAkmcfFNmU/qgQHti9gE37tUnx/flf0v3+cP7vNUqpogzGmiU7
	SJnXvkFm2MbGANPR7O2ikdjx92goq15fW4s5++o60qGuw4om9VTcYo51DE7AvPj+hiuM43ioPa82e
	sCFS7238IOavP645krAo7cAxGQIdhd4gqWkr+igQj4JyMdVK5TNMli45glw/dFLUrCUFez8wuWVk8
	V/p/+xZnaJFdux7KsA0QLdOMXw7ZJVAXkfdPk8OTxmchn/wnxRzagpsEKT1l9FbZfDxmczDG671qa
	kKdl9kMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJry-00000002cEN-36Uw;
	Mon, 27 Jul 2026 11:51:42 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJrv-00000002cDZ-1MOh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:51:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzrx0JUAe0JP8uOKQ8EpstUc4pPFvZuVPK7bcf2ED47C1H4Uy/vRMy75z8/euqdqruV07qH7bv1iTiRN9i9w3yeVUbN6Eshsn6da6ArOumnzWWZ61urhCb30Z+sBnrK0M+LDP+64iLXu2frid+WRuMCKeJ99YQ1ho8E0sSLCRRGgscjtaws+E+6Ur6pGx/yQt0jiATztVoGbfdyn4eusoLPDZiSaOk1qGHIQW4t1HQGzcdtVAy1bhJuitzV7YYQy8fhgJaaHYnU2ucIQhEDolG176vGiVr1VX9OKlUTQj5tXjGWLHQBqUhBC7TVr8vWbL2bPaGLoCzf7u1FN4qytQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq0lxpdGrjX9AWCJahC0iERrTVH9tVPMpyME/8OvAvc=;
 b=D/heg601EBGruOichZSwZbEn7MbIWEkbZ6oNNrekB+u6F5sLgZrWasHO+Krt3rx8fvm/sYYk5coztbVQwaUwBziCiEVXDIM4t9jIB6ql9XpWK+pfRQge7nPaKSUNZWlVYKPiIR51EziXon3tGU7ul2MwjthICujRgwJNHAqKUU0VSW77k5x2XADuXsQ8WODTYR1/8iMHwlzzY6zRneiihDUEqRYsK2UcnK8jK0+8MsdmV2oO5tRQHkpqzbckHi2AxDnexZovnt10kdZpZuej6+Rnirtp+n6TD3IQnowzBlcIqdKLmD9qqKhW1sCVHclBUMdN5UO3tGPUmF/x648JGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq0lxpdGrjX9AWCJahC0iERrTVH9tVPMpyME/8OvAvc=;
 b=MhBCfdMGbvs8aV53ktb5DvzkLmN5z8o8Oxv4ww87onBX4uAm5X2/yHnZhsDAvwgka3LBb5pqriIKivn0uiNYC8chj4XmMmGHiOLSNvNh3frh06dkwi4iXgzQ1Y9DB+Ri/l1BpBfrSYq1ogh3vUQegtlOgXAAr1KZxaKLDBMEpYIwGHLUvHQDDAQCcaHcnHVq7Y4h5tlILJRmqiUyonxU3RzEDPG2INI962jpTLnV77AYTHedlU+lXH3n6xGyW9sSewXB1DA01LA6eyiD9BYYyU52vDaFrtppX4bAewlrgzucWcRwbvZcyXOcR+m1Pi41YfrFTlW2MHREKYkcZnMFRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS8PR10MB7730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 11:51:28 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 11:51:28 +0000
Message-ID: <37e17ae8-c71e-4679-8597-3d04bd981c54@kontron.de>
Date: Mon, 27 Jul 2026 13:51:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] nvmem: imx-ocotp-ele: Use __free(kfree) in
 imx_ocotp_reg_read()
To: Frank Li <Frank.li@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-6-e26930345b4c@kontron.de>
 <amJglJGsfw3rjNPL@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <amJglJGsfw3rjNPL@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS8PR10MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f7ddab-8a27-4848-4f47-08deebd564b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qfTXZae+gAmkTfJu20/lcNv0qTakEarnRFjB2Dr20F31HqcEvdVOJKJNMKDk0Fmlchzdty6wowaYX4DvF69w93PbC8qFJEV4KSMx12lSi6vXlxJRJF6ZP3hMnxoqF0ZsFYH/A3ta3oB18rf5TAvwQogvBIUaZdDJsPtpdE4q1Lq1g45DwaT/mjZNYaJTkVA/jvTouzxY7j4UQvcI7MMR3DpnsQSVrJSxr5Ym/dvCaAM4NBeEIizkqqzBmoiK//2hSHfHWWp+eXhmucy0jX6omiifX1GDjnUCCtaRhLpjBhi7wxH4VXOsYcHGWeCFhI35c4UFMkOqCaIZ1Pw6nPRaWl6mKFaVcC4B5Jy5nnyHLFx2t7sCdkH+B32l3/lJ0PvKepjxBMJzM621BxQbrFM7c4sA1yA3LFH7SQf1i7hoeMCz2miNT1o8oTAmIt0q8pLNC8LzFyEFUQYF8IaDyFB8xrXhM6ZBQgyQtc4iKY7LRGmB0zzE87VJrqlcvpB9WnOm6iPKiqzhDjDtIP0I1NISEYaLdwOLIo+JyOZLme5qCX5c5hnUP6DPe92nP0E0/z//TXCjNAwVckJ1y17jGrru4ML9Vp4g+bDxVCLXY/wN3cH3K3PHRx4yR2q88K30aEpnvSziPC9H3QHjr1ACwJYOu7ahxtnnMisrf4JO04e/hho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWlXMVUrMHFrQUZnaEhvSTRaQ2tDb1hRTG1sTkhOTWErUXo3a2E2Vys5VUdz?=
 =?utf-8?B?Yk5mWUU3d2l0cHczUFQrWkFoWDZiSkt5NmZWOVgxRWZLTDkyWWpPaG16aklX?=
 =?utf-8?B?K2hqNTNYWVc3YzdHVWhRNjNONm1YQWpoRC9LMEQxMzJkaUZxOUV1T2JBUG9o?=
 =?utf-8?B?Sms5bVRYYW9mVzVhWVM5SzVrSzFRUTk4STdWS3pjQkJzZURDQURVaSsrUkdy?=
 =?utf-8?B?K0VKQlM4T00rME9CL01HaU9uZ24rdURIS1A0OW1RQ2hPenZGZUVWQ3E1ZnZP?=
 =?utf-8?B?RlhEQUN1aThSQ2tjZFhnY21RTG9Qb1hMSUhjaGg4NlgydVN0VkQ3eDgwVU1E?=
 =?utf-8?B?cWZKMEJUbTVxM3ZwUGdaMmV1cVVYOUNPZ1g2ZFpTREUxaFVqUmVzMDZhd1hW?=
 =?utf-8?B?djNaK1NPY3BmUVIxRGtpNnFhWGFJUFVYZERqc3dyRkFKSHlmemJtS2g0UGdM?=
 =?utf-8?B?VEZsN3I5QVdjdm1nd0pIVno4UmRRNHhEUTFEZ1QrZWNrZ2UySkJQa25FeHBB?=
 =?utf-8?B?VXFwbnl2bHJWYjNqM0JkcDFrbzk0WGdUL3JJaHhuTFBhZWYwVGgyTmJDSGQ2?=
 =?utf-8?B?T2x3U2dFMHllUnY2Q2VlTkZucG5ldU83UFhUSWZRcmpUYlZYOG1lN0NQRURF?=
 =?utf-8?B?M3RRV2ovL29rSlFMYTIrZDI5QmZRL0hoTlFTd1BIcDlyL3FIdGpqOWRRR2Na?=
 =?utf-8?B?eW8rdjRCdUhyb21NOFd5QWF3aXJTQjh3Q09paHRSV0JZSXN4ZW9zWjNoNnJv?=
 =?utf-8?B?S2FRUnpPQS80ZkJDcWFvUW53eUY3LzhsZ3dib3ZYNEhaMlBYUVJiaDUzZEVw?=
 =?utf-8?B?czlzenJDN05ZZ3FUNTNuYW1aSEFSdWFXUWtTMnBXVUlMOVZhN3UrRkVRamFW?=
 =?utf-8?B?bXNjT1Z1TnNEY0lLNWZBRVFHRmQrMVliL2lTL3laeUNOZlN2THFXeWJLQit1?=
 =?utf-8?B?TGhDdGU0YVpjT2lBUGpkZU9oTks3NTFTT1NvYkNiblJScm1iR2VFckNDRFNS?=
 =?utf-8?B?bzl1RXFxb2cyazN3N1YzcisrRGo1RDhKTmswajh6QVY0MXJNY3R0VGtsUGt2?=
 =?utf-8?B?WlFWdEJ2a3dWcVBTV3lZS05mOXNDUVhReFdXNWJsRTBtWWFkYTVsVVQ3UjE1?=
 =?utf-8?B?ZU12MWpyYWtDMW45THg1aURXZFhuMU5MTUJWeEZZREdCZHdsT0hHR2F6cUdG?=
 =?utf-8?B?Y0dDRWhBMDVqUXdFaEtQUUZjZ0o4ZlltYVJ5ZFFsU0pSSnFHaC9JNVNGaG1G?=
 =?utf-8?B?M3NkZWNaZTFteHhxdnp1WnZGNCtPOEx1M3ZCRjhuVFVoTUxvdjY0QjJTVFpD?=
 =?utf-8?B?bHlwbE4yUXRLNHpramVmRDBvNWNNOGNiRDdaSHFuT0dOTUcvU0ZJS2RSdjBG?=
 =?utf-8?B?Q2tEd3JWQWVDNG90Qnh4VFdpUUhVMGRpM2RKVkFRQ2FWUkFIMzlxc1RXZWZG?=
 =?utf-8?B?RkUxZWtZZ3cwNGthM29kcTJscmk5YVRmUm0zb2E2bEhvbjFxdCtvQk1YbTVL?=
 =?utf-8?B?ZlMwaHEyRGp0TDdodC9CZzRTaTVnTkJhZWdGQk1KOGJnYkxuWDZSRXd4bkcv?=
 =?utf-8?B?NHd0YzBZWDZvWGZwTk1kSW52SHN0QTFYSmpqZWs0WjZ4ZTNvc1M0dmROOVZT?=
 =?utf-8?B?Z0NpMUt5blVRRStpakpKYU52bWZkRzNZK0lGUXREWG9Cd1oxKzBpNnVkcmJE?=
 =?utf-8?B?ZGU5QmdUL3lCVU92Ri9HdFdycEJPWVMzSFovQVJGVm9vNlNDSDVXRzJzYmJv?=
 =?utf-8?B?ZWwzcjBnNUUyc2JVVW5rNUJ4OHJZK2lxNGlkUDRqcFgyOGdvZFRxQVViQ2pN?=
 =?utf-8?B?YitpR0pncG03YzFqWWh4dlNZUEFhNnhnMUx3U3ZKSnc2b1lidEhlTU5oNVVn?=
 =?utf-8?B?UTdTSThJUW1zSGRJK0xFaHQ2K3RsOTMxOWhmUk9QeEp4V0pjNkM4QTZPNG0y?=
 =?utf-8?B?WmtienZWM3B1UkZCQzJJdkFSUTJnbk9xaGhPWWhzVWNFdVIxb2w1bitrbU1p?=
 =?utf-8?B?VjdsRm9icWd0SVBibWhhalZ4UHBkOFpvdm1ZUGc4RG9FM3l4aHhYYjFvYWRk?=
 =?utf-8?B?TTR0TWIybUlhY1pCNjYrQ1JZWHZ6ZERCcGJsbGo4WmZOTUVaUktad2hQS3J4?=
 =?utf-8?B?eHBoMUJPb1h1R21WUUFwdm4wendwM0haSVhZdFc3ZTM3dXpQNVk4ZDZsTXJQ?=
 =?utf-8?B?N1dVZ1lxU1NsRUwyVk9BalpDSjRhS25RcGZOdEJBc2RkZlZMcEpnTTdWVzYw?=
 =?utf-8?B?R0RVaWFibGVXcUVBUG5qYWthQU1oV0pTanpYcTF2S1poSTNxd2VvZ005REpZ?=
 =?utf-8?B?SEV4M0dXUWJ6WkI4dHY3MXM5d1d3ODZMSHQvd0daN1ZoZnVLcGFIY3dRZFNC?=
 =?utf-8?Q?PVLn01zSBvl48jog=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f7ddab-8a27-4848-4f47-08deebd564b2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:51:28.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2cu+RmNsm5Gud41dxg87sE6G9UbynaBpUovKJqaN7DpQJ4QaEiq7Z5QLATVo5enBMocx6RhuZEMteGpHJrNW+Wfe2C9nwfCI6IAc+uXwzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_045139_676536_09F28349 
X-CRM114-Status: GOOD (  15.27  )
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

On 23.07.26 20:42, Frank Li wrote:
> On Thu, Jul 23, 2026 at 09:27:28AM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> This is useful to make sure the buffer is always freed when
>> its scope ends and makes the code slightly easier to read.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  drivers/nvmem/imx-ocotp-ele.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
>> index 9d3f94e35508..47ee6bd176a3 100644
>> --- a/drivers/nvmem/imx-ocotp-ele.c
>> +++ b/drivers/nvmem/imx-ocotp-ele.c
>> @@ -5,6 +5,7 @@
>>   * Copyright 2023 NXP
>>   */
>>
>> +#include <linux/cleanup.h>
>>  #include <linux/device.h>
>>  #include <linux/io.h>
>>  #include <linux/module.h>
>> @@ -68,10 +69,10 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>>  {
>>  	struct imx_ocotp_priv *priv = context;
>>  	void __iomem *reg = priv->base + priv->data->reg_off;
>> +	void *p __free(kfree) = NULL;
> 
> according to cleanup.h, it should declare at where assign
> 
> void *p __free(free) =  kzalloc(num_bytes, GFP_KERNEL);
> 

As far as I can see, NULL should be perfectly fine as an initializer, as
we need to calculate num_bytes first.

> 
>>  	u32 count, index, num_bytes;
>>  	enum fuse_type type;
>>  	u32 *buf;
>> -	void *p;
>>  	int i;
>>  	u8 skipbytes;
>>
>> @@ -108,8 +109,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>>
>>  	mutex_unlock(&priv->lock);
>>
>> -	kfree(p);
>> -
>>  	return 0;
>>  };
>>
>>
>> --
>> 2.55.0
>>
>>


