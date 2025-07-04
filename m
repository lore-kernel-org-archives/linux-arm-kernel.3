Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655B7C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mDKFalAtJD8C9sp/uDA6praXO7MUhlof2dEsdRRJsc=; b=31c3Tucb4Th+AZ1VuT3gYLeOA7
	Vy25I64uFP31aAZiFnzN61PVQ+6PyhqCZtoX0H76/IAdDCmCPfy9J1ZEor8OoD9HBkvR4FKijLK3O
	BMbB9LWiX/p3aXm/wSfILG0ZUgwtKo0z306uGZns6mdSy3ALHIA0lIvUCWrbfn0NSZmtqTh/O30N0
	5SZa+jFfpRj7OHFc31MgUxWinIEiNjr+9S0pYIjVAI5k9qzkd3CaTqnuPaZNrk9Q+inosFpZHHTDE
	Rn7XSEU+ao+F5upAzYsQxARcLDjJolrZ9txtS1LCxeupabEIqGkMTWEeoF65vGCoPprlrzZh92PUC
	grxNMJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXNK-0000000DAiU-0IBA;
	Fri, 04 Jul 2025 03:46:10 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXKx-0000000DAam-3yf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 03:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oO3xej8K35iuD2Osi8lh0QDhb4c2SdKyGa5HrIOEREruNzUEAkN54+GRMi8aTgVFN7TvI+Osey6G9XeMD1xPIfUkh+Qa9JAy7x/gliq1qc1Np3PpVArbl1xcLS47EOGY7MhwB6EO0bxTPXkfWaN4K5V8giP+JEi9KnYkV74Z8WJYLDdE4Wk/DiKzYHBC2Z9QuEK9IFLC3obzxhgT8G9trgyRK1CXvc+qlqlDxmBC1IVmsyRBMGMnOa5fHnNGuuJ8f78ZCNb6YJoR8WcsjQBRODUeTEtXWEiLQYzc6qx3g5rLaxKyy4ulKPN/mUh0K5/Xn/YrydwmOIcLDYZBTol2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mDKFalAtJD8C9sp/uDA6praXO7MUhlof2dEsdRRJsc=;
 b=usDPUSWsG92S1gm+StNl96WQvZ1uMzL7uAPZPg/IeJNzMP6jIhPWRkkzuIUhREeWTvxOEyAp2BNg9FRRu9pfbJyOzA7DOhV7Wgk6FCUzXjnd1LRB3NJgRonpTcyqfQ5kez3U/MI4z0xXj72eLsynpDgA/2ZfFevDjB9UCrNMdrqmfESP9FRIopp2lm9HRGfJzqEX3WIHG1Eg/0W6tPPQsjAeb27xV/UKuJhyuZWCE7+8/tN9E4pNFsQ07iIuDXeftu/Ve5XAn51VS30muxZS8mqQIeAykwsWh3jPQxU0TkU0jjfJhuFdj8s5itmewtSxaLJMQqELLkNQJcbclaz2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mDKFalAtJD8C9sp/uDA6praXO7MUhlof2dEsdRRJsc=;
 b=MhboNvEKnrOIfceaxAq/tpeSur04u4iTt1MZWvb8G+J+RFbIofgeQbrp0XIWLTIgDdcHsogMXpikrJlxm3hFQqNjaqsVDXketdskxMgCsehd2/EStZ2mc0+ktvMfQMzqYwqfnOHWqZKUvOISREKQuipOKy7/TLFAi1y7xibjBkw4SrfQFetj8N/SaUnDaGpl0b/n5pkOs4XBvzkpidO/hDqwI3H/jt2+Ktw3Yecr9elArwp4yvgvSQrobNEZJC5pS3oSdJKqh+oP1snQLoavQafnJz/LcEDWq8CRHHMW0Hqw6h9yAv83Fnltb7i3bbeHSaio6I/eXNkI7s5zNU6w6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB8292.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 03:43:11 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:43:11 +0000
Date: Fri, 4 Jul 2025 12:53:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <20250704045349.GA4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
 <aGVOdN6v9x7Pt-5n@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVOdN6v9x7Pt-5n@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d85038-a226-4cfd-3203-08ddbaace5ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?idsvqTyxlRAqeonZfqeg6KbpSRZoHrAgHdM3FyL/HEpReIsvCGJE22bMdA1H?=
 =?us-ascii?Q?P/HltO0RJu1q5yd2HQ6JlS1PrhtT7oPlAqsZMoKxlvyh3Rp9JgzVpgYMNkt9?=
 =?us-ascii?Q?3wzlqtMB4CabHAXN25zoebzb5tF+kdQZvTzl7rDVSq5DppZ6uGypZBSpzIxM?=
 =?us-ascii?Q?BEimp2aYREf6qdZFc4V9RNxlHUXAA6jnoCsxTwKoqXRw/Gv+A7O2qxy+LG6r?=
 =?us-ascii?Q?IFiiJ40sDcQfi6CHCdaSdWgCpN5jlGnDY6lkwDgB7ixLU61C1RPnOzUUxgbz?=
 =?us-ascii?Q?BCUfxdE8LWWMUW3ahyJ0qf1uvWxfhW8vQFlDmWbY/WySKLclrYGCyhgOjzZq?=
 =?us-ascii?Q?gGXCUplvp6mIKWIqEjhnW7QmgNUBFysIXRFMsJIV8T7m/6zd8bq7L/QP1O52?=
 =?us-ascii?Q?fgYdxyS47AI/hekza/bM/lM7n+yO75zxQARSjkDVa+rJNMytvc1CgzJzYifv?=
 =?us-ascii?Q?qPGyjZEpMDbXYy5fbHwXqe8Bf76CCIoPxMfJM/IgQpd3KoB8rM2aWeH4hUSi?=
 =?us-ascii?Q?U5SlU+0HmsevZRmztAOkuTeqjXPgQXpzTYvWMkN9R/Z5F3ZUuUdA29VVyudc?=
 =?us-ascii?Q?vzwB3PneF2aj/m0KRnPriWISlIfoH8DYrdkRaWYSbqDjwey9YrhF8f0KZVGO?=
 =?us-ascii?Q?CgG8D9BVpf3jKbiZK/nyZmnfM1yuEPbFL9bGO0tKepkDvEvC/UlHf67wyNDz?=
 =?us-ascii?Q?HP2TuIOoNQOoG86kJj+qnf5lAYShU9qTFar+1adHprzOWTxR/VjYh+eQ5QLT?=
 =?us-ascii?Q?+SP4FveoDQiMybpoPO1eJE1IFcuHtdQzvIGRF+02n7ffUYzGDJUkp7HSoTzs?=
 =?us-ascii?Q?wE0qHQQkwfdNutsb4vRdAqhP+ODjHTW6MOKdlYFch7dfGlpLdNhUqlp22RRg?=
 =?us-ascii?Q?4GNjdhF1OMDKxSt+LbMSI6hDnJ9Y9DDqMgixRAqXdlPv7kWJgd8GLYOnR6+X?=
 =?us-ascii?Q?dxpm2UR8Zl5ZYVu2HeEzLbGVvAtILrOaP7OLNpb2MwzyzN9djstWLxEfbM8Y?=
 =?us-ascii?Q?oTGJVpT2TsPxI8LSWmXlLj1mdYXWMUYKnlHvn6b9p40jPNZozsvwPXsayigo?=
 =?us-ascii?Q?LFljYxfaZD6nks6na85X5fc51h9C+HK8o0VzE/OnGDXXSVSsKjQpSCxaDKcm?=
 =?us-ascii?Q?KqVsWq2FrA+52w6GtgM0pSuy2t1jG6/9Op11fmHcchU1jYe8QNwDsBDXilJF?=
 =?us-ascii?Q?bvL7PjQ39mDcGigk6G9dlDgzfmuWn75/9kNZ7Iw7lvRqdEXqyMB4iRnrZtAV?=
 =?us-ascii?Q?LQniKNWlnXyhmhz8d4lXfHE+D3A43C4APWeVB9S4hB+goS7al2k3qAC5fUef?=
 =?us-ascii?Q?ZRJXIT0CVsolvUx40L7XZgTA5UQb00gS82DLJIzixN+5BR/sTlsIrBE9Nyb2?=
 =?us-ascii?Q?Slvc3fcNmE4o2j1ypPNRua5xUJIwSQjxvDf6rUy+03PtHwODjS2+kGg3zCL5?=
 =?us-ascii?Q?0vIXaJ/CiRERbSaRDlHk/XgezLmFYQBmnyFmLyHOAwoscwfbNZ1aJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3w09/d2Cj05x1rQqcKOZXrzcPzW5/vFF5SB7AggZeCiNH9mcPDJT04phZYr5?=
 =?us-ascii?Q?DXvomyYRV7EQY3iwb/gw98luZsHB2Ust9xm7mnWYSrgZiUYa9cSHhutvTxqE?=
 =?us-ascii?Q?a+lzMn2W+ESE4EC+c/jfWMbJ4oYjdohPs66GGLLuy3stXJx+GcnlaInhXVuu?=
 =?us-ascii?Q?ccqgYYlxmLkUQa5QtRoc0cvkhwU/ETNcWr7MMP5rH1Inqoa77lT6wndQhHRU?=
 =?us-ascii?Q?bt4mjVW8gsKV1qDkQEzYfWvock4CPbOxevKP8Pes19TkRKLb90NNEtSBlwJy?=
 =?us-ascii?Q?cK6Gf1uTS1o461WMXFJk3GduUzr7WiMZKLT+484MsMZhQ3R57TDZ77T4QiQk?=
 =?us-ascii?Q?kceockiVHnQPabk+UqeOQlXheQLmEoAZgShxPF8rhLlkt2mWKVVCvgJ5/sSg?=
 =?us-ascii?Q?eOxPu44mofivITzX8TJ0RaM8ubrR9yJk65I7MYgWKSbd5H57u2i/xGiSy227?=
 =?us-ascii?Q?EHSwbSnCgfW+ls+uBHf/qduIxQ+VIoDqVVUExlI3qjN759MlMEi3nZSrAK/w?=
 =?us-ascii?Q?8S1iOWgT1btLK+H4mcS5qi8IQdLv3xO8ZjpoYq2deSRiLgQ2Zp52DDnzenCc?=
 =?us-ascii?Q?6tJboTgyA32IFNOOXEi/GLfzdgnioP/YTkc05J6xiwumO8Hdxb7rRe9VQkNp?=
 =?us-ascii?Q?Ozx9KWqGWhcIdsSmR+Lf6nB8miicJKczEELIQFpAg5+MbxC4xTA6BlFMnKfq?=
 =?us-ascii?Q?zDsmNInucQPmyuETnA0fQL4fTsm4CXBm49SdmN9OVcJbtmka8/byw2MXP20n?=
 =?us-ascii?Q?4husc+PRdepUXBnexp6EugzNZbV8VLc6UxCWpKUWketj/L3EsvVmJRWX8FOC?=
 =?us-ascii?Q?AzOlv6+9S9/BIqTtelsbWwN+bnmI6cxDmaA1TrjdmsU/O0j8vrZvNHSUtRTa?=
 =?us-ascii?Q?b6V9o66cCLtABN5ZNiW2ypfO1WBe2/sZZ3tjB4cmkwAfq23Y5+uZlei9KSFH?=
 =?us-ascii?Q?/NDyCB6lGyI7aiyradvEGtsU8IY1JN35RQXujyrtuVdq276+KXJYW/HgiMac?=
 =?us-ascii?Q?xp5YYSGypDfemIj/YvEv/ll9sgr0cg/uzkDuaYaPh33I9rMq8aZqSPbG9rfT?=
 =?us-ascii?Q?u7JzbQPJFzmvwAkhgDvA8hQdxYLQt5OvEpeIToPxFKSbqPkC4qwtTc3HuZQl?=
 =?us-ascii?Q?p3XdU9Wa+ATF2iTjC+JNtxm1Qr92A/+lKMkuFPBE+GLU/OQAqxTblqROhf4j?=
 =?us-ascii?Q?vFNKvDhk1XmbEhJ12bcOScIunkC6ql8/nih5huyUMYhzs1O9747TKIZZl7FH?=
 =?us-ascii?Q?N20zpg0ZTfDhLtIcewbvKxBTpEtUM+wDknGb/y25dpC8bliWOY8VR8MN+sjh?=
 =?us-ascii?Q?5iBRDspXH1EMWo8GfH1yjWVGcVilugPOxtmAgA/AbeJGYeGtvD5jku0hKKLs?=
 =?us-ascii?Q?XFWB1O2lnV0wSz7sY9nA4LuO2qXT3uIgc+S6seLt04t5mjdmen7apDVpUW9I?=
 =?us-ascii?Q?y2YeWgUISqDAuyKDl0UZ944aT1cVxtXBSH3QsH5eUJBlw4meJHa7JmCRUeTW?=
 =?us-ascii?Q?gHkwBpBKf2hU4ppthWWJ8UORdbaYPew+jbQbnoHQTmIAqmoTBgOBib817I/R?=
 =?us-ascii?Q?gwGFJki+JkmXvNCcYj8GkOyTelJsWwSbda1FXbiA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d85038-a226-4cfd-3203-08ddbaace5ca
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 03:43:11.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 464CSxqwdJZIOduYe4jfL/n8NMf4z6wuZZBCokSEKZqIoRWKnZzCQG5ZCYmUdVDCFQZOTePZGnZBPTBQ1waxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_204343_989469_D56FED34 
X-CRM114-Status: GOOD (  16.85  )
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

On Wed, Jul 02, 2025 at 04:21:24PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
>> System Manager Firmware supports getting board information, add
>> documentation for this API
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>>  +--------------------+---------------------------------------------------------+
>>  
>> +MISC_BOARD_INFO
>> +~~~~~~~~~~~~~~~
>> +
>> +message_id: 0xE
>> +protocol_id: 0x84
>> +
>> ++--------------------+---------------------------------------------------------+
>> +|Return values                                                                 |
>> ++--------------------+---------------------------------------------------------+
>> +|Name                |Description                                              |
>> ++--------------------+---------------------------------------------------------+
>> +|int32 status        |SUCCESS: config name return                              |
>> +|                    |NOT_SUPPORTED: name not available                        |
>> ++--------------------+---------------------------------------------------------+
>> +|uint32 attributes   |Board specific attributes                                |
>
>As suggested, please add current definition of the values.

Per our firmware owner:
Future expansion without breaking backwards compatibility
(message size and parameters).


>
>> ++--------------------+---------------------------------------------------------+
>> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
>> +|                    |to 16 bytes in length                                    |
>
>How does this match with the information from the DT ? Will they be in sync ?
>I understand NXP being silicon vendor, wants to have vendor extensions. But
>any board information comes from the OEMs/ODMs. Do you expect them to change
>their SCMI firmware. That's not the general expectation, so I am bit puzzled
>on this whole BOARD_INFO interface. Please help me understand the motivation
>for this new interface.

For example, i.MX95 has two die size, 19x19 and 15x15. With the two variants,
there are two boards: i.MX95-19x19-EVK, i.MX95-15x15-EVK.

However we use one System Manager firmware binary to support both boards,
so System Manager reports board name "i.MX95 EVK". But in dts,
we use "fsl,imx95-19x19-evk" and "fsl,imx95-15x15-evk". So they are
different.

Our System Manager firmware is public and open-source, OEM/ODMs could
update the code as what they wanna, including board name.

Loop our firmware owner here, in case any he could help complement.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep

