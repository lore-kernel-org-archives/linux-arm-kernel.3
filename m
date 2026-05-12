Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E1CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWYPH0/9LvofXZDCigxuyU0iBvvlApgKd1KISS2kmyA=; b=BeSGlphhFScRgJht4NqVIGFpxQ
	6UV4repHCmXarVo/K3ItVxDFg+094B9sGhKh+uOkrQPWzFdEZeeuQO7xOUWLUN8RwJbBxXql7yA27
	a0wnBkVnONm40TKnHpt+hLEpE5JhQomuxhZX3fjsco88O9eDb6CnNkpYsPy93vZJsSIeFGu9I6sx4
	94fQyVdTT0/XeT3a/XzxxyojsstTnSs6YGRrxdZifCCAZ27wL4tSUEEt4Q4AMoZCwCXAd6npbFfbB
	daQByWSa46bnKCThCwmiRTSUeAZxIrCG6qI7a8TZy7txK3LTeMQ1HSa9sMt2Xn+9wnNA2nUzyLyBO
	KoYLxZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjKH-0000000GFO9-1f4G;
	Tue, 12 May 2026 09:22:53 +0000
Received: from mail-norwayeastazon11013018.outbound.protection.outlook.com ([40.107.159.18] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjKE-0000000GFN8-1erJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPKMnPpHBC11zIUXj2AQsU/SQoHS4DmI8YGxN99S7G2rfLjclW4jA8gY2/IRkI9ft67IiIKB5sONyR9k3epnA87xiX9Ca1N5WYU8SW/KU/aEyVBzRt+kVSvSL/7K+7vlgMyLvpgRrrvdD/mvJC7ALp4am4chM8F/g65/RxTNEviKo9B5SQsoSWQ4VWSyjZW5nFharpPgb7VIEf/Ibn5MVbto+dcjdRyGgZrCDgf1I4F8Jvb1vj6KS4l0R059zMZ83kar7QtKsOOZ5YRqPO42ZjR2i80Mgjqw/DwhkHkhJixvjtStWapXx7ardctoFLiGvrk2DJKp5v1qFSklzjdZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWYPH0/9LvofXZDCigxuyU0iBvvlApgKd1KISS2kmyA=;
 b=kA4F21Pj5b3cuHCN+5M8pL4EW9TW/d0z+IFodkoP+mAVp9CT4j6U99QjVXyMRQaCzPCSul2yxRGE9rs/fn7dAzRY3W9PLco9GJc9p+4L3tJSrEW6IuSoTKajLkpWrzUlLEMhYoD69m8JWZkbeecgmSSZVC6PFMRt6p8qCgOzQH6ZCqSRxPcTahbv6QBAfOc7gPj89ynKl1ik7TqJss8KnnNKMfVzTiQNLWfedy7eo50f8Hx4/sgGsmfG+d/uhlBXyYS1f2ObZFr/FqbJJP0Hga9a9WaKzNNJXvSJe25rb3Ne4YR5ogIbV4R6V/eVciKdeynH3z0sATZ3X43r73ctcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWYPH0/9LvofXZDCigxuyU0iBvvlApgKd1KISS2kmyA=;
 b=BfHssJiITDdgPmW4uLhc/mVxWbAoX3+hJaEjUraLKa5wc/dNiWXWD7aqjnZWJjcgPoZMZwRJUP8zqw8qISI+Tgie9+EZbobbBeVueEXvTDahNsc7pGDyF/J3h3lNgMxdP7mq2aT/J2208kr2TD77c07VxHBOFvPIchk/H+uWOlSYHwl7oI6Zy7zaAbFlV9T+lMfT/kWKLp7GdQhHuuD5FNWiVeAbjBGAjUewXV4JCFXmuBehZy0SHTf1gsSh+hBxB2K4/MtpiNXVpqYsO/ayzLQCLVK6xFwSH/ISr/aqLfZH5p6biZxMgQfnzoZXZupxNEfeVHOW3t+OoNTYCT+yMw==
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by DB4PR10MB6096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 09:22:43 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::32) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 09:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 09:22:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:26:08 +0200
Received: from [10.252.13.51] (10.252.13.51) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:22:41 +0200
Message-ID: <1fb7f68d-7843-4b24-bfbe-71046ee1541d@foss.st.com>
Date: Tue, 12 May 2026 11:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Ben Levinsky
	<ben.levinsky@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <tanmay.shah@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.13.51]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|DB4PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: a459a153-032e-4a70-5dfa-08deb0080555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|7416014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: cwKaAR5oy0b+UY9pwj7hiWZzXY1W97JpmvmG+fo0r5ZTs2DOzyLqJzk4Ab4CA0CRw8RcLRULAfYF4IuYvP38hBpbBXBqdxf6gDWUmWyO4d0cTh1UXYIXhESNwXd51Bc2Th0Y61A3mj7QhoGxFomHbgcyJpSrL6zLRqLnoPCYDvID4/KzVskmfDcI3FfdVkaVKL+ZkWTXEPLHyhP/neXyOU1ThUw/43aMPMc8EIWYpS4lylIREFZMb5X52fv75HLd2icoANWmlYJJfOLEbYZXdl/t3/0ZiJ+2acFOjjLsR9yEObkoZEQUT8FIkgBmUrubtY7hPwcECcecv6ju2S5rMUlMCDRi703wkGmkFgwFvLE9WZimql/0W0bbUqGw8bLFEkA0KB7TrM2a1yXqsxgAUVbQHgV2Fnn9VZ9VdeEb8ORsSm1bq7+/i9gvVZM84/IeJWnodbhEoTOGNTXckI+AOQIFVoTLB1B4NlUJkmel0vlz5aFkWgDYLPFjzDQxcFx/fVJUhwJ9U/Cey/EvhaK/Cts0P6AD2XIvOQmpFZeKToZv0IGy8+sKQimt4gBVmAt/xefSCCEplkpAJP1vXQKc7FUcALDUf9OTtF3wUOCr4BAHgRHGHQCVz5B2XvFFNvsIh4fiu10Hh7wPabcvSNUvTpz15UO2h+i66QtoRjotWVi09OTZZIliEqeIP908aXhXcOXYGUXfg2tkRFINPROv6WfBpzVpxHtmttz2XzdEByE=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7416014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8BStKz9DkWDkVcSJi05KH9EkYfW9XKcdu4TrBifDSLptEps7NlFt2d4VU+j+z9SDbQT/Sq+UUCSwNZmtjcFn8MF8QEaZd4M7rRpGgvqCe0bZkjOGjYVfZu1T32HQ7sunerip4f+3PI75lM7QJzCJw+QDmmi5hUocOivOCr6xX5P0DlL5116rAmBJf9x12wuxd3yakLli3tMDL/3Yyu4VKUBbo/LN2Gncs56Xwo+HDm7GEh2XwcnOT6STWz2JZE+LDKRJ2OvgEXMUPjrqiIq7eLawCwhAaL7T6G/ibOWRI91/54PIlmg1wZGjQtY0z5gHtekz7ZNCbUcxwZ1iVLit4pZvB32Z9s60+eAmYFEVoxio2LGD+p+NnM9OiliopJHMrAOJnmzr/uU9aXnox4GGjVK/ngljUlaFoETXnrFMsJpF8f+BF9vpnTnJKop5oRKL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:22:42.7776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a459a153-032e-4a70-5dfa-08deb0080555
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_022250_739553_A1172FD6 
X-CRM114-Status: GOOD (  14.60  )
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



On 5/12/26 09:55, Daniel Baluta wrote:
> On 5/12/26 00:18, Ben Levinsky wrote:
>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>> drivers that treat a missing ELF resource table as optional. The helper
>> returns success on -EINVAL and propagates other failures unchanged.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>   drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 3724a47a9748..dff87e468837 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>          return 0;
>>   }
>>
>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>> +                                                   const struct firmware *fw)
>> +{
>> +       int ret;
>> +
>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>> +       if (ret == -EINVAL)
>> +               dev_dbg(&rproc->dev, "no resource table found\n");
> 
> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
> with seeing this messages in the logs.
> 
> So, what do you think on adding at least dev_info to this instead of dev_dbg?

+1 for dev_info (dev_warn is used in  stm32_rproc_parse_fw(), but ok to 
move to dev_info)

Regards,
Arnaud

> 
>> +
>> +       return ret == -EINVAL ? 0 : ret;
>> +}
>> +
>>   static inline int rproc_prepare_device(struct rproc *rproc)
>>   {
>>          if (rproc->ops->prepare)
>> --
>> 2.34.1
>>
>>
> 
> 


