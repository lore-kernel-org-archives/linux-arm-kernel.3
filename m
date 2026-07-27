Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C21C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jx15Okrd43p/TUo9rjmm/KdXY7T4xzPUNy0xx5nsKl0=; b=naMcvp79UcNHWxvvq9nh2RO10N
	UsMdvcBVg6KlxY9EFXPBpgHLCUnF4A0vzM1Qk8lBd+EteEVxdU8CWuK16mqd3ZC7UoqlEWCScjPKA
	zqUBM4ArGuvPF324I9pRuAB/zdIQQnBN+qO1+Ep+v+7u44TcGdY6/VhYhvS1n31MebhmnM7ZFxp+7
	xx71tgh7PQqxhWHWMoxCpAzOPtbJbZ9ZyhzmUWBnuIzxw7p4kpCf0sKK4JKLOON4fLL42Gtd4KsZ4
	kSRzezWc9QruZOCGbOSC7p15rUJGouNhNPr5jtGNBpASQhCsKbbe7i8+RTZApiwENXnYW6yrZI49e
	rks/n8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woODE-00000003LJX-1TOZ;
	Mon, 27 Jul 2026 16:29:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woODD-00000003LIZ-00Pw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llVK0cCi5cs6rsI6PUWzK2w9FsBGxkUimgF9BF0kLp5nzT+w77G0sAEBn/HEndH6f+D4c/nzFMpfnC5jCg3nQV3tubmZ3yuNOueMIC83JkLbi45QsFC/JyEol5eb+XTdgrHgJmcxie6KE4N3XLSAVhy805TWmMpnbmssAnuvkO/o37fpctuxBDvntcsNiwLUaStU4iIdxUbS/srzDBgxCNTiad/AT/nsWL99QfwkQ6IjWgWuxVHodVnII8heubgbfZBPbjRJRXHv4DYltwtPltqqQdR4q7zdLUelYEg+6qZEDH66HVHDjBwVLPtb/ZYdmvxwpWxvImnROiCPophiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx15Okrd43p/TUo9rjmm/KdXY7T4xzPUNy0xx5nsKl0=;
 b=T+3n7DJHChL0p5CUbfnT/hi6Y4siXBorunRXKkHz7pvHoaSj/Di5D96pojAp5bjgALCtBZ3dMWtN0hghzK/c7UH9FilpH5qmxHmXrLlgdX434gqSxp77xKqq9k2ZIOoRgriyC4OG+z/MSdND3ovPkP6aNJPLoRXVYvBVTfMTcP7KVTi5GycKIlchgozj7a+jFwuW1DHArGA/4GywynVQE1Wc3skw24E3qD4zjY5A/km9RNMsJcEPHnmVXyQhX+lZyFunfjfmBDhI7phk2ihtwcSbL+E+6/cC/mcT7IRakMW0tPXHzdtg0VNSWT+Q7aHZ7L3GK08UlqsZYQ67gMnDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx15Okrd43p/TUo9rjmm/KdXY7T4xzPUNy0xx5nsKl0=;
 b=vVpisUacAG9K7HLTUH3GdQeStljMYJTRVUW7If1mgKQcb7HflfjzrNsuAOeHZt6pC5y/uUVrycaJJ99JzGZIh2K19ZFL5U6Tt4RcNc6uCh5Xc67LsPLeYB1da/K03E5ivYGlpwhOfGiScTMG9lvaDWo76E3KeMeHP6uMF6Ltm+YSZiLjFQmESbRbxFpE6aLeHh58JCZqlt8IBF/+yFok4srBYmskZyKQJW0KRnDL5sp2+TsGjNJ1uIeq7e0fYHp7gV1FZnruNImV8DYGZ3YkkVqbJsU+NUBCl0EKhJ+C4J13AuIP2P92e8eIn4U18GBcKADqA+awTBO4VP1JOkbtTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:29:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:29:49 +0000
From: Frank.Li@oss.nxp.com
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jared Kangas <jkangas@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Date: Mon, 27 Jul 2026 12:29:41 -0400
Message-ID: <178516977239.2517575.14455944558041826088.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
References: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3052e4a2-a33b-497c-06db-08deebfc471d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|18002099003|56012099006|22082099003|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: z3iYvSGuBnJKV581giLQXoSUMuMTQSMt2qR5xb46/JbC68/6s3UZH5AXkdLZNuxHAdsbfqUotmerw84/Y9QsnOqOlekAIZtBJMu35MUrZkRjNqBoK46AIh9qaPepzg2xF95LIFtOI39ZcoRNhy7paKKN7LdSY4XiW0eSgtBr7396KOa++FOtVKxORS4oYwZoMugOApuKzwzvwRhDQqWNfjr1L3s40uPd/HUJhj9s9yFuuk8nfxO7PP9yxqwBCkVLaRGE7f3NQv/3B0F0vgkHPkVLUJDg2T5L7loU7IqVukFlTqRD9ZyvmqfESMYCWOJ7sHw+OzmIAFBJ57yXDI8Ebup3glg6NCIvHLsBVcB9JaNvDCagh0kR2JbOyiz3ZYcnxgppG4KlcEgf31YeMDm6OibL34hv2i5RyjZ+F2NpQA3Byy9KaPwlYQGt01RzzZiaxzlK+X9z5qTt7d+8v92Z23AzAtgJ21aiOvuzeR8CF2AkV8kuDoyDBycAvhlW9Ihtz96vZspQ8nznQ2MQ9xd+2XofwO5rL3e4LWbNtmQieDeAT+7TjjJHeQciKohUaKP79L63s2XeEvqzUi0RlGzxAoLIAdakhF+K9MQSGNaQabKYmQqKkHtpzsMp0iqvdQ+cla/CGoQ5maB60bPguIa/jHzjg0NCwlr0tzkymbn1TPEqje7Eh4AyBwa8Ti7LOnxp6apYMRpTd4ZUB1BBhZUz9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNrTEExc0RvcEltYXliODlIZlk4SS9zNWxVNVorSzRNcS8zMHoraVZSZVF4?=
 =?utf-8?B?VmEvOE1RS3BTeWRnL1RFN0FlYkIxakdXNlFBa3ViR040c2xrNEw3Z09rQTYx?=
 =?utf-8?B?M2ZXYjdQbHFTM2FMd1F1Ym41ZmZFY2N2MkRKRnp3Mk5saXQ5dHlzdS95b21L?=
 =?utf-8?B?b21wV3NWbmloQVYwcldLRWs4c29yeXR5YmxiTnZPa1hibzlzV0F1djlBbXBE?=
 =?utf-8?B?VkZpVjhVSHM3SlZkdXpveE1aY2V3UGZYMDVFcHlPa1BMa2lwSlZYblQrQUxF?=
 =?utf-8?B?dWc2NVRHSEdUMTdoSy85QkVxMFhMdXRlUUYzb0dibWc1SERYZnVFK20vUWNH?=
 =?utf-8?B?WjV1NlhEOXNDb0c0MFRhbXhWaGw1N3hrdElaK09RUjhsRlJMMkJnUlczclo2?=
 =?utf-8?B?cTB2UlB6U1BzdUEwamlSa1kwRDJxZ3V4RmxEckhBVithWGpuRE8wb3FHU29L?=
 =?utf-8?B?YVNNdFdLcmNQOG5tanZ6NElrVTdoVFhsSlBuTFpNY0gyVmhQUHJ3NDk2a21N?=
 =?utf-8?B?VlU2dmdjbFdxb0NVa1QzOFNIWjRwWWN4TDF2ZFBPWlhwK0s1ZnJzUFdIWlRB?=
 =?utf-8?B?MnBDTHlTZTNJQUpvSVRjbXNQdXJsVEFZMWk3Z2htbXVCc01JVi9adnpvMWtN?=
 =?utf-8?B?SURlQW9qWUE5NXBlUGYxRVVyTUlkODdNeFJJVXVWNDF6QmlseGo2dmhxZFc4?=
 =?utf-8?B?aEJVdkdJR0N0ckEzd3g2UEZpU3dnb3BRZXFEOTMxQ1JKTDg2dUh6eEc4dXk1?=
 =?utf-8?B?d01RMms4eDJCYktqYVBNWGFRTWlQQVFpNzkrSis5MHdzOHBmdjFTZUxFTjNk?=
 =?utf-8?B?T3ZWcjY0SmJocUNBanU1TkJycHB2eE9HZkJhWm1BN2ZXT0tMb3VIT1ExYkZS?=
 =?utf-8?B?WGZZZTR2dHJqKy9NV2Vyc0JKTDZjODVSWThKcVpFaXB1bklKZmxxanNtZ0FW?=
 =?utf-8?B?UzlOVzJxRlk2VkkvM0FYQzI1TmdRa1dlMzk2WEZWaUFmRlZZMWo2SkZlSktD?=
 =?utf-8?B?UFFhTjlVVHk0Ty9vblBnZzJCWDl4N1lkeGI4aW9aSmp5dlFBZmVOa3ZuMnlR?=
 =?utf-8?B?VnhvWlNZalJPZjdYdERJbUQ5b2F4bzNEbnI0VTVmMlNmdTRFVU5ONWRQcTZO?=
 =?utf-8?B?Znl2UU5MbnNaZEx6OUF5UFNMeEJlaCtmQkFaL0hKUHMrMWU3TmVMU1RMc2RM?=
 =?utf-8?B?YjdocllLZ1h1OWpEMGhjOUtCMjQrVUZkMWRXM0xuQkxjeHk5N1FYVEVyRU1z?=
 =?utf-8?B?M0N3bnhpTXFXTGVuMGt1WnZIU3pKQWFZdlFZSjF6TG9hSDU5a0JycUVvb2t0?=
 =?utf-8?B?MHZLSVJFL3BHQmViZFhSZWhlMng3WmpldERSdW1HVTllRi80QjMxaHI0MEZm?=
 =?utf-8?B?N0FjNnBmcXJOc3Z4SHp3RjRuKzg3RFh0S3JWNEpJeFVhZTdSaXVvclFoY2ZM?=
 =?utf-8?B?RCtBWExxZDQ5RGFNZzhMN2tlQWFUNlE3K0xBcFNoVTlHQmVvTEZIS0xrTzgy?=
 =?utf-8?B?N0dDU3VibGN5Z3JUTXI3UlVUeTN5SzNDUHZ3cWNESTJXYTNRRElIakFXaWVW?=
 =?utf-8?B?T3ZobmNKdHBBeDQ5cDB5cFdCRTRZSjNnZ0Evbi84Y2Q1akhDakVNWlJML0wz?=
 =?utf-8?B?bEo5c3ppZmJDYU5RYWZMUlBIM0JhM2lSdHd3SVg5UlNIZDVoTHovL3NzeGkv?=
 =?utf-8?B?eDhUcmhLVGVxUHVPenJxRlArcVN3MGM4QTFEVFdwbjY3RWNSbEhoZ0JLMVZp?=
 =?utf-8?B?aXBuaWpQcVV1WE80RE1oOVM2ZkJJYnkra3FyT3Z1eDQyUTgwTHFaWENGbmZS?=
 =?utf-8?B?QnUwd25LY1h2aCsvRTVwTU90RlRnMEhTbFJ1VDlGOGlMdU9wbXZyYUJ1bEo0?=
 =?utf-8?B?ck9xa0tWRnJwbDNsellBOUxNakNaOFRTOGpFU2RVVU11NnY0eTNNL3JoN3pz?=
 =?utf-8?B?L2MrWXNveXZ1NnZCWTRjb0JSdEMvOG5XUGxhMjh4OFJka3lSRm44blFuVWxx?=
 =?utf-8?B?bVZVWWdFMnBZY0NVWVZKV2sva0VFZlpaVVNORlp0YzBPaWFyMms4MCtGdTE4?=
 =?utf-8?B?Mm9vNGR5Q0tZZzVRazdlbE9wRkJ3ZWl6TTQ0WWE1aGRBZ3lUY2ZNY3JMR0dy?=
 =?utf-8?B?ZjM4RW9PdDRpcG5udjVrTnU0aWdtM1pJQjRDWmM4VEpsZHZucjJCSUZmMHFo?=
 =?utf-8?B?RlJ5TGxyT0xkRXJqNy9UKzZleDhQYUtQQXhWd3J5bDEwTDVJSXpxMTM2aFJM?=
 =?utf-8?B?MFJDSk5Wcjhrc2hOK2QzcUpIRThlL1BTbzBtSUtuRjUyNzEwak5zWUg1NS94?=
 =?utf-8?B?cThEUTdtUjNmUWVFVG1KYm9pS3hiQjMyM0NGSE15dS9WdmlkM0UwcDBHNHFT?=
 =?utf-8?Q?qgEBot5Tn9dt2sQ0wbxLM7JeJ79trbIyZ+kXJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3052e4a2-a33b-497c-06db-08deebfc471d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:29:49.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/WTHtBEBEzQqgTzM4SESEl6bXYzJa01MldMFlvqdX/SecQ0N+G55ImjMkvEmwN/Ly+FNt/sT184D3CKTJqX4VNkJiUB84zODG+IMaqFTWeAlRxfo6VHUuTffz6djf01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092955_049778_876A55BA 
X-CRM114-Status: UNSURE (   6.04  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 21 Jul 2026 09:12:41 -0700, Jared Kangas wrote:
> Add the GPR syscon region for the s32 chipset.

Applied, thanks!

[1/1] arm64: dts: s32g: Add GPR syscon region
      commit: 853d77cc0c06e686d0214a015fe88c1047ba6302

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

