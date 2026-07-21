Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46369C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 03:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifNlW6cOwUmxo6O010GVrpiidZBf4z7Ya+ujcNUSgfk=; b=ZE+whhQQnWSFHH+uXsq0G52zJS
	QvLAV002tGVgIZR7cW+hbGDd0Tqj630T92Q4rN16LVrrjFU11/8/RkAh/jrAyeXH+Z9MjoJvpb5Fl
	UqC/Dn4PN4IGrtFSZGNBNnCe7bDGNf8Fpu1Y47EbTzY9Itng9alah8xsySv2YdiMzVKRlQ0WmNgfv
	NTNEzRsxb1hSo+vozdWHPuAZ+xy9ittwGmia+c5Ye6esZgmrEEjuaX6StOUEtpzqLnsMalTyBvS6l
	qVxQpcsOFEzOmrdR35VIxCYSIN9egzSWlNnUKyOAnsInOiDqNuw1o88sjSmfp7Ujci+GhFrfSaU6p
	bwdxQ1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1Gz-00000008KRo-0uZw;
	Tue, 21 Jul 2026 03:36:01 +0000
Received: from mail-westusazon11022117.outbound.protection.outlook.com ([52.101.43.117] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1Gv-00000008KRF-41DO;
	Tue, 21 Jul 2026 03:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWHqiMec531km7usT3gzKusep6ekZMKGl1f432eVnNNqvfTH84q1jEeTwlbK7Frzudw8tQ1YAX0IyuCkdAGwUUot/IwbhW/8ARRbdeoDvOK6bcDinJKxrRSNh17qceoz2Bs8CzPzMdmoscmCc564wblhWFp28HfniLnoWguaQu6hvHvQjtrN9DPPlY0a/KdYysqe1QaSnENfv340BAND8bvB2iQICC3KcP4Il4zWJ2SCs/SItqx093BC0Er5VcNUgVd/psjaT5fPv5zHJuHLOR5wKS2FRyutYBzjCypdH2LrgMyVp3jR+5YYWMHi/GsEI6x0T/dJCsNnW2RxYOtqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifNlW6cOwUmxo6O010GVrpiidZBf4z7Ya+ujcNUSgfk=;
 b=jxn6yt5VK7n4H72abzyF9+6fzQa89BNr/uhrBvSuvz8MC7B8Ormbe1K8+jqhp+0Lbvn5DIlUc2zRfR0GoWnl48/qZ4jWrI3CmKKaGtmyZRpNMjw251RvVPX7EtwrMj3TlDZUkOO+25PfwZ+ZFphG5/Jt9YuH/26/FN/UYk+tGv99r/CaeYbPlZmDS3m0R+RGQr4lANcGkQyNPjtjfnpd+JgaFYFK1rKv6AhkZD+bKwHKdsFhbBFRMaRB/g4b4Z2zS244C7z0yv5TUbyMQ6UjI39fmxyPMR3qkcZS+KelXY5jrDOyp374eZ7voTwDHqGhCvYY9zE0iB+YKP4B/6x3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifNlW6cOwUmxo6O010GVrpiidZBf4z7Ya+ujcNUSgfk=;
 b=GEzQ5cP6aLetP7Fkeis5TZFSggUZL6m6hwKaDvW1zrdfSHYO4mLIvzwjgRRMgaVIeFS170+VcJIS8/UNzn1bPg430uB0Vxit6ygDIY6laJza/lRPJRJF1Uz6aT27wGmgnRDQqPfeSC/zSUD4ERXKxIuqAxO1q7yalll0emnSy26LJ8t5o/TyigOQVWFasCUhLqOn3m7OdJ2OnBlqbuBB/nnJEagGtq8nwYQPWRw0uMFedk1UBDnaAIroVRTEm+aE/mKHT9/CsKzOgHZxTB5puBqfe8AgJv6fCE5bloKyunMOvBRrXIdBm7XauQGyQcBFgi5CItI6mCNO+E2StX31ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by CH3PR18MB5643.namprd18.prod.outlook.com
 (2603:10b6:610:19f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:35:50 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 03:35:50 +0000
Message-ID: <0337442c-0278-48e7-9a69-9f11d7325f1f@axiado.com>
Date: Tue, 21 Jul 2026 11:35:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jan Kotas <jank@cadence.com>, Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
 <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0036.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::15) To BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|CH3PR18MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f47ae6c-2f39-4fb3-3acd-08dee6d92911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yIR1+Q+gBLKdbF47zlG4b1pPT9HqP5FGcf1WzV4v3HYPgE1VBO7jR53zRMK0USJxK4aUgFgvRyr6pbrFyt8UGqbfmkfpI7Qli6lrGyXAAUEXVobjwgT7WvHu8MSkpLcO7nrJBcGH3HUBfjuJ7PWwGhv13QG8vzwv0cwSbCUbCLGFuKZea08hf8i9sJTPBC7zK2lZlx7iGceGOZyu3J0PrdSTwl8piKece4XpO2MciyC83aHgwoyZDrAd2YafX3ywSRPHyTuBCGdCCSSBbYBFDOW/ghDh1zSrMt7kSWkzJTVjD0NG1nE4fjy8sQpXFue5gI1Ntsu9082wbEytVZ8dGYC9Sa7EtCcWwbQWKw+JC9Zwn3dm4A4XNjxpVN+nX20NOqjNXwoMqbdDkLRlgxEDhvpfiT/f2P65bZVpz2Uy7GkkQv98g29GOlWwv65gjb8W1qpT2/mEtoDzVg9YtNJ66/q6H3RywepW7pWUeb77vjzu7oNKAsZ5qF/k6+/Cf5BwrhsTlbCjQe0vAwm+HSvANiLedJGGz/vocCJqz78F+k+0f+wXe3iciZpnytaQat/1weqlJVm0vBtVNY5IIMeRdOECDb0zeLApIMC2q373IokPOPfKkXqke5udhymmsJQTeYuLIpp+Dghs4WxOZqb0VHG6VWdEUDlZr3NWYbidQaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldPWDV5RDNRbG96QkdOMnZCZVJUZjJ5V0VMMytuL2lIaFJ2K0E2MFI2WWY2?=
 =?utf-8?B?Z1BYSERJMUpYNU55MTk0MGV1K2hkcFhGZEhIV0NISGNkUU5wK1IwejJraUJw?=
 =?utf-8?B?dDNyTkl1VStnU3praXhjYkpmQTVyQUlxcnhhb0JiQy9PcmVDYklaNnBSajZ1?=
 =?utf-8?B?QUN6bDRwZTh4dlVJVUFjQ1FwZE1KOCtMR2loY2YxMmJjUDc5TjcwTUhObnI5?=
 =?utf-8?B?UlZUK2plM0cwQTlOL2pnUXZMcmQwNVJuVDYzVndvMjl0STRHc3dJUWxUdmV1?=
 =?utf-8?B?YVdLZXBHUjR5SkJ4dzRrWWZBRkY2eDdvWHN4aWliTXZ4S01xa2ozK2RJZHoz?=
 =?utf-8?B?bC9laTJGZmhJTytTbXFEUnZWSHdNRzhkQ0loNW5CaUJRNVNyRk9ySDcxN2k3?=
 =?utf-8?B?L0MxdjB5VXM0ZXFNeDF0ajJYdWVNOEVlVTJmQjJ3ZWtUTlpUbFhneks0VEs3?=
 =?utf-8?B?L1ltVUh0WkFJdzBxTytEd3JkU3B4UUlUa2dkVGttZmVjOW1JeHpOdjRGWkps?=
 =?utf-8?B?SkFtclhjSGVFMU5MVU5BL3hIU2xIdFYzd1g3VEphWTd3R2dJdldndWFMQnZ1?=
 =?utf-8?B?cGEzeDAxWDQ1YjBhWVFsR3UxUkRaOURtc0JINFNFTnFkTGNMc0htZkw4cVlV?=
 =?utf-8?B?cVNFUmdFZk55WmY4eEVNWDYvSUZsMUpKb3J5S2VEajMzdFc3LzB0djZaaFdp?=
 =?utf-8?B?c3dQdjYzdHFPMXlRMnhuNEhVSnhwcWNQcElBbmp4Yit2dlhaaGNkTmRCN0p4?=
 =?utf-8?B?ZVlhczBCZkVHS0c5QmRCYm1Cdi9ORlBPZmlSeUFvWWJXMy9HS3pLMUp0R2lK?=
 =?utf-8?B?cUZOV3RjQUR5amgwWU9Xam01Wk5KL0RGWkRUYklaZUI4R3FGK0xsQjMzNWdX?=
 =?utf-8?B?RGxuWUVZc2ozUGVHS04yTEgxZlVtRTFNbXZuellFd0ZOTHAvak1BcHZkcE1k?=
 =?utf-8?B?VHhaMzJDTGRyUFhrSHpDTU1HM05DMmYwWGxHR1FEejIwOVNCTllWZ3NDZmpi?=
 =?utf-8?B?alR0SFRLV1JuSEVCL0wzVGY2R3dNVlMraXgxd01vL0Z5bWZQcEE3cW9WbVl3?=
 =?utf-8?B?blRyWmJtR2ZJQUtRUW9CVVE5OWQ4TG9aT09ya0QycGZ5VU9acVZueEFlbEx2?=
 =?utf-8?B?ZHQwMkxjTnRJd05MbkhzeFZPMlBNQS93Zk9lNU15K0RyK1lkQ3UzSHdWcFA1?=
 =?utf-8?B?M2szaE9oOGhhZ2tGdjgzd1N2bVhQdjMwNlp3ZGcrRjR3V1NGL1NNeU1hOGRp?=
 =?utf-8?B?RkdQRDFncUYzNWwyUmUyNzRrNElibjNNSUViSGRkWXYxaFFYdi96bU4wcFNz?=
 =?utf-8?B?RUR1bEh2RkdFcWk1Q1pXbENtS3ZnNFJOSDJad0dJU003RDZwaTk1VVFqOWlz?=
 =?utf-8?B?Ym1SNWFCQm9UbS9uTjV0T0Jpc1JXTmxqVGFpRStObE5jclRVcGIzT1NKMW5m?=
 =?utf-8?B?UUgvOE5EazQrSmZjRjNldjZnRDRIcmM1eXhRNUIvK0ZScEN4L05GVVluYjF0?=
 =?utf-8?B?OERyc1phSTZIUjkxeERpK25jcVVOa0huYkZQTnowaGd3NW9aSENGRTExQkU5?=
 =?utf-8?B?RHF6VWtLdHUzMmg3NGtZdXRSNUxwQ25jeEpQTFZ5TFNwQ0RxMG1kL2F4UXZI?=
 =?utf-8?B?bmlNQndxQVlxNDFuYzUxYjJBZ1E0MnVKdjg1TTdIR1lUc2NtdlJLdTd3U3RP?=
 =?utf-8?B?ck1hRjNneXkwNlR6TTJUNjd5RVd1MzhJR1g4MWlBMUs2R3krRGxvMXpnc0Rx?=
 =?utf-8?B?c1I4NkJRZ2hzRStvWWlEb0VyN01FU3R0R2h6dDFRZDFnZmZubGJuWWt2Y0tF?=
 =?utf-8?B?bmVHQnJxS2JtWmlyV1B0Q00wQnVqQWR4YTFvK1ZxckFNN2c0UkowR256czQ4?=
 =?utf-8?B?MjBybVl4bUpLZDVIWXo2MTdnZHl6UEtaT3dXZGlTeHIvNjVnR0lxcWF1clZy?=
 =?utf-8?B?VEx0NzNNalYxQjYrZ1MxTENjYmJQNmlSeEQ1TloxcWJSM2lycnBSaGFJdkN0?=
 =?utf-8?B?OUV1cnJlZUpROGhNWndaYnMwT2NNRjU1L1JTSEVPSVFMMXpUb1VIczUyaXdO?=
 =?utf-8?B?MG5zTDdzVmt5eDFOdXNEMGsxTHFCcEMyMTdIRTFmYTFIWHNtem9KVVZMc1hs?=
 =?utf-8?B?ZzU1NnFrYldUUmp0d3cyL0dxNGFVL3FwY2tRazQ1amd2UmtpQ2FTaEVnRUVR?=
 =?utf-8?B?dTdSdnFEMVRjbVc0WENyRENCVUw3L3U0bXZkdUNncVlRdkYyRjVRMFNwRGhw?=
 =?utf-8?B?NUIrWG9JRkM5RGRvRnd6b0Uwb0JYdGpsaG1HcmJRQUd5Uk1ZVXdyejRLeU1r?=
 =?utf-8?Q?PTeUMkjUDaLOaHPZ9R?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f47ae6c-2f39-4fb3-3acd-08dee6d92911
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:35:50.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7/GH7SVLcLPD2pRdbBT7HqsqguhTsEFRcDEOIX7k+314QYaNw8smkjLVuoT2rALHXDLGbYe0kt3fCn4RuI1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_203558_002729_75512C42 
X-CRM114-Status: UNSURE (   9.79  )
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

On 7/17/2026 4:33 PM, Krzysztof Kozlowski wrote:
> 
> This should stay enum which would also make your diff easier to read.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Agreed on the enum, and thanks for the tags.

Since Bartosz already applied this to the GPIO tree, should I send an
incremental patch to fix the formatting, or is it fine as-is?

Thanks,
Swark

