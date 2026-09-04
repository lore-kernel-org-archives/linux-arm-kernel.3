Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXUYqMsiAurXMyANY8YRWWT3vNEkeVvKEuDFAmhb6II=; b=mTM0uwt+5nH02+YrN6X0utO73Z
	wBQ2yNiehkApSQtRRAVcH4blpnxyA2G3Tb4Ja2/pqb56OvCK70Z9AIQF1K0f7dUqXAQNnDsxO1A5Y
	trGh6kA6ygk/kZD036izDuBqj4Arki5w1C/Fx6EKbbqpU6FwjINPvG87KaPk7ViLRyvBjTMy0x+tS
	CkGNyAvDPwyPUaVDG5liXsE10b9AE/L2o9FPz2JUVmxf12CTEJvwpNnDkoB6sFy53UtFu2afFqgFI
	tLBcXSnxPXUtgxVyO43mi9P+dUV2LLaNgcTVo+tFLXDC9kKT8Vt2x6sWiwbWhPZ4wUZYd4Pih1K4o
	c+WR+DyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Und-00000002Mtm-0LSZ;
	Fri, 04 Sep 2026 14:21:49 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Unb-00000002MsH-0Sqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qp+DX8wD34YEL3aRiX2dQJYircMsP4ZD69UuYWZr0nqpAyf8k36rFy6hPpaP9XUFaEAb82AudhLxq/kCPIkHvxcb9bGfIXTht9Se7P3vA+hQM5yTFS1DPPjJ9gIRy40YAKuCOZEzRyTEp5O3sddTyPf/MVfM50zPjNQQ5+VIEOv3Gn+KFbW0AfGU0ThVO8+CO+Q5oIqOwdcOgA/Ou2vtgDQf2wOwnkT++KnKyxEDP5Qo9LvB6jEOqkZCocJq0YLzLxSiTrGHW9gSSr8CPb66mc9qA6b4DyDbtRh46ZLEaHgfn9yP+GRByLwignRkf1ior/rsN8DPnxHBOTZa79VYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXUYqMsiAurXMyANY8YRWWT3vNEkeVvKEuDFAmhb6II=;
 b=d/BeN/SEXZgfQ5YoRrcWMoKjy1LzBuFZE4WiYb7+nSwDynLqRXfbNhmuHlXyOz/Lcmr+pZW3PgJk8p5DhedoM/58fhmXzHeY4i3lKWjUz+jVvAaOfGJMr/m5KfE7H3Dnsh2LZ4AabqvLt/IhLzsv/IDWRcYdWBRx1M5RFkmBfCTT1pMiNTA9iZyoEKXOjnigQU/CaXp3GnKhaeMndrVBIBZ0r2T0HVEVw3ttvxpqUeBN4sAI14yI9pq6j5VU+a8PHdwq0NkcDXwzDRPPbZYFrvdIZh4Cyfb36rQzizX1ziPqZ7UfnYWbrLqthuLsdSn8QGjpAy/FfsTKYNBAYgK+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.88) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXUYqMsiAurXMyANY8YRWWT3vNEkeVvKEuDFAmhb6II=;
 b=LZiGGr3a+RGjGmX4dPJFnYSfaB9NCW/v3CosEIbvRSgWtjLyFB1iKJ2pIwTqDcs1ALxO/iZAtyS+u8FpfJvT625hL74eNLnDYIOCwv1emkAgj4+PWllgq2JCQ0UffyNA6Etyleev5Kxzw/VbBaKRoX7N62Cu2HF9SLBWByveTrBHbQCAEoJ47vXBy1mnBzVIMJIBwi1JlKIQrs2nlBUyVGu1lA62+hWJYvb1JRk9dU5oc1CJRpiTYVYEsRMb7AV4BwxgPBYF/UUVa0ijkfA1l0kdcJWf4qac6eDgjlwvLFYKbFWwTEDu3c7Y6WLCGhVjOYGxsaJxxm1ZjKyeEzJ4OA==
Received: from AS4P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::7)
 by GVXPR10MB8861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:21:39 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::6) by AS4P192CA0018.outlook.office365.com
 (2603:10a6:20b:5e1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 14:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.88)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.88 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.88; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.88) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 14:21:38 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 16:18:39 +0200
Received: from [10.252.18.211] (10.252.18.211) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 16:21:22 +0200
Message-ID: <2ff59c4e-3556-44fd-9dbe-d54cd8e1cdca@foss.st.com>
Date: Fri, 4 Sep 2026 16:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Propagate errors
 from optional IRQ lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-remoteproc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260810051907.27136-1-phucduc.bui@gmail.com>
 <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
 <CAABR9nFsV2dSbw1NSeVwoEPJ9YvNCLD9-D9vin+43LrCaKqWmg@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CAABR9nFsV2dSbw1NSeVwoEPJ9YvNCLD9-D9vin+43LrCaKqWmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.18.211]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6B:EE_|GVXPR10MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c75d085-452a-4b6b-a78b-08df0a8fd58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: cEeotIKOFYm9JJ5iaq1wGzVdRt2OdpfHvrxmKi9dMmfIFfakqJqDWNof84/B1sVlGVOzxzonAkaLq8+E8YD2xAqRNq2eFfuPgKWcJJq8HFuXDmtXpWGw8E9kyoFtMLPIrvWoC4cDYhY8XzDIzEhrYnk/DVaIZ78rhQyb7dGh9NrzhrR7gR388rup6saRNwLMwrF92TFtIMGX/ItBmID7hdyeTE1v4Iv1fsn3fv+xH0wTsZpIXf+Mvl6Nk5/jTHKVGLui4eULLKy57gMLDrOPW8ts4hGBrcysp/Z6yyMA2LuCvYjJF/vTPw3vNZSWjUTlrHX5TtZNhij/4dwnx2AjuqrvWZYvN0DuHfidGfCLzE0TQnGYcEc8Ax500Q1Q+XnDCkYszopBxG0CcwFBAyYkye15oWDiOnUgNE5wvVIGNygsVE8YsGIJK9p0a3GhlgxN7mkaKks2dKptMHhe4UxXPoOHE2mgyz+hbgKgSv9JUABEyxlYHpgUU6rOfEpJ0z0xRyKVhiWxN5l9PdL382t7dq8ObC44V5faxsieUavgIaDNXuXi2zdbrZIPDC8EezVR2VTxYZhh3ll5yeZHflSAOnq99P31oA0soAFVwgJ7toKmT9PKWlA/cl+xAIIskoIkpflWdAkvap+Ubxg8xGFJLANpWC83xZQHvZsXyf7sFOM=
X-Forefront-Antispam-Report: CIP:164.130.1.88;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h4X6LKgVChSj2kfiDuMt8KnbrLh9mbrlSeDsf97hiLcQC588+HrEpvAO/Ligc+ejm5Lt6TqrzeYc4Y5Q6lzwp+Knzwiz4pA/b8VhlvpduoeZlyTu7J0pyDJNuI2RENRwgSD12Id1lUtXshCqNsKPeMeBGRsB+UrxryHiPMw3qrNuvFyNP/SSkCXOK+5uiRa67oMG3e5jR0h+eHF8qz7X9Z6mcLSMRIYxDTnBevywIbQjncX5xf0sgzXGGlKBooPBSU5wyiSyeXokkSGAlJ5R/9dLsjzX0vhE/nl1EqU91wdqbsOvw5FDAo8A3gIjQYK4spDXq6zM1XLAnFlvmB75cPflFZaD6DFojo2q4R0DcSYVpnSz3fDkXRC/oTptpWwMxc/B5motoFpuotIoAUCeE823J3v3wSoAoB5rSdgxnoQCTIHyM7QxueVdCAI56zMs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:21:38.8495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c75d085-452a-4b6b-a78b-08df0a8fd58e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.88];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_072147_481204_01B5862F 
X-CRM114-Status: UNSURE (   8.38  )
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



On 9/4/26 10:53, Bui Duc Phuc wrote:
> Hi Arnaud,
> 
> Thank you for the Acked-by tag!
> 
>>>
>>> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>>
>> Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com
>>
> 
> I noticed that the tag is missing the angle brackets around your email address.
> I'll fix that and send v2 shortly.

Thanks for correcting my copy-paste mistakes!

Arnaud

> 
> Best regards,
> Phuc


