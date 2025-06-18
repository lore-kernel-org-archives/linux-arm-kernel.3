Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA38C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWLkuQYs3KD6qkM8FJMRYjYNBygpwe/hKbN0xM5hVyc=; b=pWcIZLdElt8/1dimj5ImTX0j80
	UdiAsCNv/4RMlsVR04liDsz1vqeGjM1Lakn/VCGE1AC577ubO8xSweZVrE1S2BUv83EvdBLPIj3Mp
	+5SKtD0lqqD8Bs4pKurxUqWgwPUG8GJXoxv5J/VZbi9sF58DdUNwFyMOQt8b0I7BVOx4JqZJz5vB+
	HYxbSVITJHFzmIjMAdOe4tqKk5n+tOFdibmh0WJTgSN0JAcIVh1WaEVlZqJbTMmO8gIOTIdaBcTuj
	kD/pUpEND1YF+Kr8w2DV3MkxSqRcmG2vpmfuNkVkPixl6BEHp9blyfBW7KhZc+jlm/K54CcZj0M6i
	iPuDcRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1gY-0000000BXWr-1faI;
	Wed, 18 Jun 2025 22:55:14 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1eK-0000000BXSB-2AjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 22:52:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNFR/zNTfRqJ/OCwjT9oZ50bnXsi7K/7nnUDi91Fv+IwvreotsDn2CFGc+qz0Qjd2JbkgvZ8My6F7hzlktHCj+XCuupRRhQr82+QOeQIqM1t5RI2zMXrxcRvY8PCMJPOqeZaPclnseOc4uHENnkCJEVO6Q9UbSiloiEy04Ybw3T+r6uEkV4pVHwH4nH0a8TiWmvvNDfWhh5kMijUhXbARDg84va/OcOvmr+B50A5/E9PkS4BsiT2FzSir2AJ2gtfNkJwLlTaeGzFuAnV8teBtVqUjSH6A5OpmcVQ16XtR3R/qC8ayf+deCVYu5kBTaDaHKJNjoPcVH8gdWnJcQZfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWLkuQYs3KD6qkM8FJMRYjYNBygpwe/hKbN0xM5hVyc=;
 b=UNq1zS6GR8Lm1eSEiVReF89DndqskbqnZcTX4CJA1Gy4E7u8BxKo7ZcJQ8fV0UjfoVLQoeuavgCUk9aEa0x4OVGBSzoxa4N/mQWa13vr0B2oN+HbZT1b3BGzGG+5126Y24g12tUkqtPsfOYXQgC5PoHZ7n9IhmKExYGQn7AEIRSw1CIHNv9W7mWxDaQ1kj+zEAiKgtJgYRRFxkWJIuGRkGQPxlRoJGNJbY6o8Z1+lUqQK79SYjy13NDIJDZ6roz+tBqTLvbN2ByLmiEk48z7UzcZmRFUW6u9PWtYGNGdiov80r/AS3GH22ELPOm7ir7tDCMlStczj0RYgx2fjd/T+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWLkuQYs3KD6qkM8FJMRYjYNBygpwe/hKbN0xM5hVyc=;
 b=WO/3MMU8l0F1C/pMsdgYiSHMFFBW/XbXBu7rMRoHeFvwEVTke6remvNuO+o90vf0Kvze4jBskA+gOQ6ZFvXZipzgqlQ9WTB0WH7MCEZ3VZAofBdfhqeHzvAu9M5Nhlr7IHTwmPsofu5biqofEY3mu5f6GVZNvGxnI3MDp6J+xaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9952.jpnprd01.prod.outlook.com
 (2603:1096:400:1d5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 22:52:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 22:52:25 +0000
Message-ID: <87jz58mzmn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm: s3c: use string choices helper
In-Reply-To: <27de316b-b756-4982-85f5-6c37cc5189e2@kernel.org>
References: <8734byndhd.wl-kuninori.morimoto.gx@renesas.com>
	<27de316b-b756-4982-85f5-6c37cc5189e2@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Jun 2025 22:52:25 +0000
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9952:EE_
X-MS-Office365-Filtering-Correlation-Id: a879ecd0-d0c9-4475-fb7e-08ddaebacb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wQdRlBouPWaPxYtng7u4PPoupwpkVd9z8BmImTmkd9VU0lJwodaBAy1P1lLh?=
 =?us-ascii?Q?6TEAauVgwqXS/30yvq0A7435Tv69dNrKjgvRF+CFwqfbeIXgXqyTDcgnArLA?=
 =?us-ascii?Q?1khClM8+8CiCvFG8GjcM5qZS0cv+4+K5vTztz+rZPOiSko56icy0hQCye1uG?=
 =?us-ascii?Q?8qWZp8SP8KlRWa3Wq4Bf7geRGWFAljXxUXIkQRi1gyF0sP2EOad3OEfc6KTg?=
 =?us-ascii?Q?2aKXhoW4IVv8c5fQmI6+bhitFyXjx8gQDrMnwFeVMpVBBS6cERmC/wib+Z24?=
 =?us-ascii?Q?rcQu2KLolPaz0fjsSdCY56IBA29XAQYAsx5/7uSSC2uYLsbt1DOsMwvkGRzt?=
 =?us-ascii?Q?zKIo7U2zxafVrKaTAqweCQDTceu7OKA3knxR9oMRHfDA8UQmGdF+V2ExRpHA?=
 =?us-ascii?Q?S3tUpGQcz5kOtFrHcF2g2XJ4ojfyQm47ggqI8oblDm42sWF7/8K8W3QQosWN?=
 =?us-ascii?Q?X1UMMgTnqH0nYG4Ozt0Jt8kveyPtczTBGM0NMCh+mOCZ47wPf8E5Vljorddg?=
 =?us-ascii?Q?hSQBEEcIhociwMBoAEfMkcNgstXO9yDzRd3K+5jmpZor6Ccpa/w4WQlNRjxg?=
 =?us-ascii?Q?lTpgeCTJQUCOT/U4n5lV81WbWXdZtpUH8d+0awU+juu5fa73BVN7X/yZmyLG?=
 =?us-ascii?Q?GLa+oh01mRG82Ek+v5BQD7lwgXUvw1ztcXPfYrRz4GPBK/rcg9FAuYPeIzpL?=
 =?us-ascii?Q?JD+4yBNj1I8CO9rYq7DxOL6ksh5oZZrKGb9qpCnkXgx3pkGDiLveUy0yHj3Q?=
 =?us-ascii?Q?zWs9tTu8aUntho/blh/TXa2WUTQsAKYbdcPXOYF2PljF0UHFW5YgIMj2FCAP?=
 =?us-ascii?Q?W+yhlS+2jfzNF19uU6Jmi1aRM1B9+CW8QA/bTQ6/IhWX3PknK16UolFbQQ+T?=
 =?us-ascii?Q?0ueX30tJht4r5V+dCKJRRFzIGbvygiaz2h76wGbaGslk4cSfXg50TiAER01G?=
 =?us-ascii?Q?4WPy8xBjVHZFENSgkQIo/LWS3AxxO6bKDz16M1r5E0UKY8cRG9N3o4bf0v0c?=
 =?us-ascii?Q?GEI7/PScpSOksyiqn2Ge4vbiUuM36OlHawPvorpYuRiAwb/SvC7cw5E+k0yi?=
 =?us-ascii?Q?xh3UmlAi57Pbgx2SSENKIJHCPR9qLbgaQbqrwdUbl7O8IuT7L2AyTGRpJRZW?=
 =?us-ascii?Q?2kWvS39P5G9oC8PC/ebtoKLbM1A/S4nJC0nIHhHG/vyuC+pLDHY+utscSiAW?=
 =?us-ascii?Q?GY7l7jVNfqhixX0kKWUtjnFKZe/ziPV3Hen7QpQ6SDmJUzDYj4ktYkROLZDl?=
 =?us-ascii?Q?ii2Kq7YZamw20s8vB/CvyUJtIynEbIa/Kn1hC9RswwlIfornxNVc/XNOQnLH?=
 =?us-ascii?Q?Kji1aZjYtqWPbkDn/7Xhdq3+ciNu78DZXYy1JC4iAZDWyB0j6WQhAi9jjc9b?=
 =?us-ascii?Q?nQs6uBUjv+mm2H87NnKLAuq86ONU9t9I4IoLdYtyWrYi3nTF42g6Q0cJbdTI?=
 =?us-ascii?Q?YnxsaL1IZ2Th8k5/DFQY+2h/xNJeluI0a8P6JoYVrou9icYoX5b/rQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+acBISkqDonKL7X99iEDSl0LNBsx8BAoXfakJPLpRvJC4mIRHtqzqlfxvQ+h?=
 =?us-ascii?Q?ugLK4FoHfTjup2voLOKZvgnGyQazw3tgrOHAEuzAoZSUotv0Zgpzy8teUWaj?=
 =?us-ascii?Q?/0PUlAmq9u1v8utOQvjaFRqIqcTVTNbSxioTTsEfkikskWpXg6yWfc3Lc01h?=
 =?us-ascii?Q?CrxIiSpupcG/ov1Ehrse5uBzagC+buf2AjK6M9WdAkHklQYSdokxeg1XxEtt?=
 =?us-ascii?Q?U8o2kyMosZnKMGttAhQLNs1jyh2ihaOeqFJPA/SW1/Gj7Ui2zuJQjBi38eiT?=
 =?us-ascii?Q?x7HJ+eqIpd5bdml8+XisUZu60vXG3JM1DiSEVcxybpupnlFF++x2mW7A02oS?=
 =?us-ascii?Q?ksoDN127s4hUA6rvbiw5HeicUuxXAInWMGP4el4hGHCY9hKnJFH3arLh42EK?=
 =?us-ascii?Q?EMzHL3GYrwsdVomRWIGEvHYbPXnyuw9dZPO8eehiJVblbWQTXqXcXsN77BPW?=
 =?us-ascii?Q?2ap7Bto0ibzGZUErp8cX0Qy7ib81isWIhyVgBYFkajg6LZlnaigym748rCFe?=
 =?us-ascii?Q?qxRtyduWFAdhKs+JwNUGl8IzO5OxLUCd9lLWy833T8ltg/0S4aqDgmjXkNGx?=
 =?us-ascii?Q?es8a7eFI5ek03CFYaQk9onF+h0nUUh/DqtMFV7NCWn7AQRLbZtTTknKzziJA?=
 =?us-ascii?Q?amW28Zl3iJ6Q/LpdYTUoKpfqauHTXZs4+ELnZWudcCTMr/79Xn6FMNwgwaqr?=
 =?us-ascii?Q?5piG/fEsghZ1m+8xl72gaisTLWDwUeO7fG6bzQRgyckLzc8I1Ua3Et8im85Y?=
 =?us-ascii?Q?503hP65mb1C3/wtnx7jxRcsmdgHwg5FPDCNcIAXQOhdrp+KqaplHEzUwSdl5?=
 =?us-ascii?Q?nXIhBUCd4DnbazTRVEGi8btnvwsTf55HCRMLj53798GBtpdMIu7rs6T9WLOA?=
 =?us-ascii?Q?/bnIfxITWKf+lublAikX01rq6YvPn9dqY5wET12Wr5UWS7pRZk3mnNtAS8TY?=
 =?us-ascii?Q?EZH2i85kO1uh5oq4LnzhqPpCbsBK4D/yC9D9wETsOadPNlNkDuPPZS6wQ3FW?=
 =?us-ascii?Q?OnHeQ1PGLgnXJKh3YMvrS/ZHiFJ3S+8EH8URUsjhwKNrGX96x335FsOzsnLz?=
 =?us-ascii?Q?c5jW+bLyxTtYRR3R/1mBZu1jkUDfUIjMG3+ahEtCcHTz9z083o81Usjgkz+f?=
 =?us-ascii?Q?2xI59rIyywt06OAiMBNGfMkf1uC2WE+jyTVdHCCd52ld0hBvnqWQ3JbdXYVr?=
 =?us-ascii?Q?JPxpYq7JAdcAz6JRy/Oh3f5KC4Hf7ziwGTFyORrOyeWMabTh0yT1DX1o6lRt?=
 =?us-ascii?Q?uR6T8vXWGYdzH5Hhwki05tG4ggVlupNkB759W1MwS4//Dp/8vac36rogZp/5?=
 =?us-ascii?Q?PlF94+SskLKebIxcHEKEOLXGeIZDqw/USpj4LWAyI3mvi8oW/R9qmX6EJmBY?=
 =?us-ascii?Q?U3sUrGC016guaXkQHY4HBU4DuXN9YuYps1Et0Aon5ODG2oYkLULmVmWHh7vQ?=
 =?us-ascii?Q?qVb67F26OplTSIbfb5XHUN5mXdMmJw5WO62uAORBXkwEPi1t5+bJ+6mM/12e?=
 =?us-ascii?Q?bHwiDmUkwCYcVFLeyaEbay1hOlCx4hrma5StGYfb60Us53JfFW63gF5W9NSm?=
 =?us-ascii?Q?DerujGXDO7LUPNUBsH1XpO3cmvwxEJ6GIUuMHXpxme9rMrmHduOdPSRplgCG?=
 =?us-ascii?Q?2AXan2fnk72WVPoHhfJGXO8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a879ecd0-d0c9-4475-fb7e-08ddaebacb7d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 22:52:25.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZZ/idwormMwwTQmS6TKJdG31AnAZLJxRgROYOLKG/nlGtQu8g1uHILkS0b8ujW1ofVDCFKjn7qTykvJ9pUYewCMDkOcBlCI3H5B8Y3ATTey2TYhq7a7WKps/O5QeReZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_155256_796894_8E5145D7 
X-CRM114-Status: UNSURE (   8.85  )
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


Hi Krzysztof

Thank you for your review

> > We can use string choices helper, let's use it.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > v1 -> v2
> > 	- add commit message
> Did you read the feedback? Not much improved.

Ah, I have been mis-understood. Will post v3

Thank you for your help !!

Best regards
---
Kuninori Morimoto

