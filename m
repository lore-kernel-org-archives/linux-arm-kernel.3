Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CDBCF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 01:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Yvaxtyl35o7SohoL990uyQhSLKN/4wm0iR3iMVBqbw=; b=N2X3/SbXkVt5mnrt2DdoASqV++
	WSd3tPyrMVwIusuXFBB/aHvBNz18GRdLjmO5/Ubo1m245ys+4qaetRBO++6XieIzKTBWNsKCX/vEL
	D8YoJO0e2Vz9YK90R6TFs0XdgcLUG/zXRJqyxrd3b20dCSOplL945dqX+sN6FAA0mu36z0bdv6qV6
	aAg5mXtZRsvIclrCIKjB/qEi55LPpkCmMifs+MBm8wUpnPdVjnItcYiirAY31F9M1jiz0R2FQBXDQ
	3AYLDiw229TdHdbR5928gmmFvTTHtYjc5S0k7GpSmYjjokGWclnm49CuCN4WB5BYo8SCdbkmFreO5
	Ku0xKS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIQN-0000000E0yA-3tjW;
	Wed, 07 Jan 2026 01:33:23 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIQL-0000000E0xn-0F0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 01:33:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCWbNKDUpCauvHuN/iqvzGogX6x7CVksLyCLsl2phuG2YZgslkOPOVCUCFxne7YfWqLqmdTk0b7974dWLmFhfKZgIp9CQLi+SyaX1VDDRqr+2RXTvEOx/syotJ/IPc77J/ciK9dm2+z2SLhdMQ4xdFxGIyC3q6fbw+f1cmIK9s2xQ7XoEBacWtjvFvW3Kd7nlItP8v+4ONZxTi5+9vDmgIYvNmySDNo6US5JlWbdbVlLp5SZqMRjVdt4pEPhWqjY97nwAKUPKDC4S3iLzuP00BxghiQr77DKJHqnRnJIpS/mFQCTDCVdEQ94T4/VrXI5G4TBiy4/M4nlcNdCVJ/Xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yvaxtyl35o7SohoL990uyQhSLKN/4wm0iR3iMVBqbw=;
 b=Gt7vzBxwMRDUQYvfYJ3tgfRhUVTs1IBKUT9LrhGS+ZKnejME6P9JUbk8RjaXgp14qSfGsKEQLTsrVuThvyqS5/n7/z9xbtbMPBy+fgiKZo9H51AhJs6R8UuIVemhHuzhnjOMQ9NWeXuguFAC+Ct306w25Lb0YIm+TE8o0C7YpAJL5l4ZMOoEEPBp2txhqopxEP3wrtyOfW0BBhwfkPMr0oO69Le/NPf0jxVqO0ky4jwbidVzyoe72KFD6Zy3YAlZJaiUN3NPaf2McycUVQzr25vo7AtcRWRpuoYKdZPno0GmfJchz2LQdLDRtX5OymcCpWSdKU45+mjXXaiRzUCHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yvaxtyl35o7SohoL990uyQhSLKN/4wm0iR3iMVBqbw=;
 b=p+CHMskXZNxI7FH7DOGSZzVSiY5awNI0Cx3hDPnY9OaoUZwBDSZFy7qnpajGn7IxQeXHd5he0wE1/6ofJepYdoRjhakyCVaACGoum9q/VpEfd5mqbtmvOFhWT4uq7bYfmNueFV6O3ixqs5I96k+aebP7o3D3+BDTfNH7QdIXZt6w/VZJe29H3RcJ3lFYySwON297QIpeTKH1O/d4QBEtBrrARSqo6+SmUCieB6PfUSYyJiOffM7vdECHvE6u4OZoSOCcuBi9xy/I767JYbYPmimCxlwUDfHtK5Ho7EIzFV1P+1O3mMK7oF7fE6SKZK2rlKrXKJmxLSmaKBdmmO9Sag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by MRWPR04MB11491.eurprd04.prod.outlook.com (2603:10a6:501:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 01:33:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 01:33:16 +0000
Date: Wed, 7 Jan 2026 09:34:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aV24N72FoGeGwgqm@shlinux89>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
 <aV0uVXXbxKQ5qzLD@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV0uVXXbxKQ5qzLD@bogus>
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|MRWPR04MB11491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2510514d-c25c-4b25-5503-08de4d8cbb27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xlUVTwNRKXijHtCfTqF8F/VSsqpzuxG+IFbixbmOqQMbVTnmttgQKjj8H2Zj?=
 =?us-ascii?Q?z0drreyWFQNCNqx952tGjOpt/z6aoViJk2qfOoxvWwjO+nqLfK+0wR4noxI0?=
 =?us-ascii?Q?/OrrOl71gg2YIpY8enoWUEGcr+zlvBhYmxxQCtoFTvBAiU7w+s30TuNrBepK?=
 =?us-ascii?Q?lcvnzPkKFtLuLsO7DZLu5kT4BQ/bu+4gQUGmMbs4eVp5sNytpXBDeL2K0BYR?=
 =?us-ascii?Q?OkdBKblSHVNqoxwlegBKFsH42YTcNzSkUOgYdgtq/Tm6G2zLJXvrxXUDcLIs?=
 =?us-ascii?Q?5IDW4jSvwd0t9h/AhBPMIe7aNTXEbk4pvH2UKt0By/tB+Dfml1bpxeemEg/x?=
 =?us-ascii?Q?7KMSp/tbeuLeNVn68J0KZ0QykzDVRMF+rb0QE5nPT3PSf/hjAtT39s4Ag/dH?=
 =?us-ascii?Q?ZwgsxgpqAJYTxZUtJx6bvb5UiWILZsuRaskG9zJSZ+q/fk9ztGbOBZbfw7yH?=
 =?us-ascii?Q?ALq/F/4UPV8kR4N+l9QbPkTxg1rM0eBTCRA06I557ShZoHUu8V29fK69Y7/D?=
 =?us-ascii?Q?zi0jS7ftSDF0nCbJms/J/7UGlF63/SgKPIfCvixd3NHhIs48s62x9rWc7BM7?=
 =?us-ascii?Q?zX8IsuQH87KPDHc0/hiqSQlIq1E26GuSX9JyUHG7o7HVVvKP0jUrwboN2jxH?=
 =?us-ascii?Q?uJk3zQVKZrn/VcQmar9bjs7xnVb64oge4vASxNGyyYmUWF1tXlpshcGmT4OF?=
 =?us-ascii?Q?xWf8onVQ2Q+nChdjCLDdWIXQO6cF16kzpU55yiqHzVLH6Hndy0pBg54aRNDk?=
 =?us-ascii?Q?g1Q8lG2ZZUG6oS8YUgn9N7Bk579kWEmf3dgDKbm/krLcHHhiaLf3FgDjSnh1?=
 =?us-ascii?Q?87+ZdI8ZFdA4kL2X9x7D8eW0rWMaHjN5Atu7Rh2UjC181UEITxBf3ofeeKPw?=
 =?us-ascii?Q?P4y3ffrYVCz9yeB9Kw3LgKoU+2WmHYnNQ8+dxeA8oDJupe7ER6fh6VfgEciI?=
 =?us-ascii?Q?/eOLr+1+IxQxNh4lVYpeMZQKEn6d1jPJFq2t9/WEgpX7BmyOSGp9gNMd35jU?=
 =?us-ascii?Q?F4ei3pKfqpSQGKrI6NFC3VsVvsQIf64dIyq5e/0dLnUbpG75rgOjxHgNy+Ah?=
 =?us-ascii?Q?Ct4vpIS499TfJLDI/Do4ZBZTR/CRszfAc8rfKM8VcM6ZEZT0umFaoW0goFG1?=
 =?us-ascii?Q?Al/deLQ/1fEXPxb948dYq9EC0IE1QP5l+mxXLavMVutaxHJxQ0E0sjQMv7Em?=
 =?us-ascii?Q?7WSaS5G4u4h1cueeoOAn2HhlgxXV5AGjRiysxNYKGk0qKcb+r21tQmF+vX2i?=
 =?us-ascii?Q?9M5Ogl+YAKqq/x0KySWzkJjwL/2MV1GZKc0eL+juciwSE6Q8NJqgbKW9hVPW?=
 =?us-ascii?Q?eXtd22Za7EkAgJz2l+VgTa1hYvOkfxi8rdYebOXDisXBsZLcP4/5VhgUU4fw?=
 =?us-ascii?Q?TkXt652Agc3tYbLaNGH/kMFQ4ihNqD218QPijvuTrDFI3fBtSP/7NZ0M58K0?=
 =?us-ascii?Q?1DWE9WLIVBUZWceoduxnnjZNBAgEiRUtD39d6IVXoRHmTmMNYsNMEyhuUar3?=
 =?us-ascii?Q?5uwoz4cVHDk5XB7OoczItVPB1SOKGXF6ycSS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ic7/ElnISWq3lOdRwGjAuTFVut98B8FLClmn4JBCclTO/CwDImCWiBMQhfxd?=
 =?us-ascii?Q?/S2FhdisoVj9n1l0/BByEoOFIyXNiKEn+8XzxraPh7FUDmeyNOf7ZIUNX+kD?=
 =?us-ascii?Q?bG47ngp/wwVTStcH/Ehp2ax8DXA7wLYQlW9vuYDKB55W2cqmsmjovYIOJtbP?=
 =?us-ascii?Q?+ITvUBdsV39C6zzDu+zKuRd89ZYhwe2W8Hf+zE87kg+cjz9Tq1GOevY6cTrC?=
 =?us-ascii?Q?mq4SOcXYeHrfXuKXcvZfKJTPIFRFdxq2RRdtDvVUT8jyYcVfFe0Bo7cmFnhQ?=
 =?us-ascii?Q?pv9iI6RKDwV6PPHe4emFFcdSnYzF0jquOEkvL2eL89vMDcCBiryY59+YODRo?=
 =?us-ascii?Q?mE31YCenLLkB0E3g2Zc9nJg82OkwiHSf7n6aqOv4OVoJ/nio//mamUO779UZ?=
 =?us-ascii?Q?H+4IzQLVNFxIZs5r9lwiy1+H1kYCX+Kvip2BekPBUcgNxlDb+HW56QLQHnP2?=
 =?us-ascii?Q?JvjtBUO5K1ehxvtURyR8Ty2XbDiVooSRULsWxUSAhM824vwPYmt5+3iXHilE?=
 =?us-ascii?Q?ZA6Dj2X1QjddIVvsfqJgskn1AYVdhnNJIWLdPHlMc+LoErRCaYxlIXKQe1Fr?=
 =?us-ascii?Q?a9DNGDN2K36c4JJZLw6BFstK6iiZtI1Z6DLPJVeOQNv0nSnGMUQZ1fd+EF1c?=
 =?us-ascii?Q?XsArQluDEwE7b44p1AGyS2iaiwOsZ0PU4tjYhOu+5c1OwQGBTcpFJe8njJ81?=
 =?us-ascii?Q?fMaCV+uTbkhCqHOpRVIhDrUv2DAWyUNuEY4yexG5NNeF7kYqe3hNHPgox5RT?=
 =?us-ascii?Q?fz5uFzG27NK6jhcBwZvZeAgzzyo1merp4Jt1w6VJnTfO3Z4dZdBnqdTrKDSr?=
 =?us-ascii?Q?G+QQt5qoz0Bz5d3snu5Ty7huGdNlAAiYkpbUSNpMB0HzSwHNl0/Amo4NaVCT?=
 =?us-ascii?Q?AVRXUwWmWAEmsuTxpWDmOWer0LIXQq+/sdguA3E5o0VhmA5KRawmsTjZ+Tmt?=
 =?us-ascii?Q?mZ08we5K/PB3U6rrKa/PqoknDhqGXxqEJDNm67sT+tdDo3+URabAFSecQKUq?=
 =?us-ascii?Q?ElO+GorR8PcrEX5lIHSxQ0rYspWG2hJuuvDAegygmaEAbetHqxKBSM48AmVr?=
 =?us-ascii?Q?Ze62XHxHMEhhrWATdyuB4QQUJda8fqqrHgMelwgVM+Gk2kMgqB8QVDYx0LFk?=
 =?us-ascii?Q?JeP7vCUJI53saJQJnPCec5wcGOS4Hu2O4EUBAJepUy8AVtJU3Pov2S9WfOtx?=
 =?us-ascii?Q?rLbViLWHfWqnsvi2ExaPfBoth4iUHWtrbdxyknkvpo/N+bwB+PKqzfGnEp9T?=
 =?us-ascii?Q?b7cJFGWY2lSyzZdgr0mTDP0d2AywENrgj+CIJLI3qsfj4dUg6MgtlqxQ888m?=
 =?us-ascii?Q?++I4P59N5/Y5j4suh8UZVzqFDmDfsUEMRCGqLWsiiEuUBLkOfELxhbVu9zND?=
 =?us-ascii?Q?TNphdNDiIo0/QpAuw/qM+I1pP1wNrIquak2XUanQskVEwCNP7928CWjfdsgr?=
 =?us-ascii?Q?VqYmIgh4OU/ptbqfGzIY7elOz6xXfqXiYPv4rI4O+1ySrbiXn8X496Qt2BbR?=
 =?us-ascii?Q?f7WRHc4Qd4/Klo2JCXE8oVUg2T1UDiZBXrnhoC7katdPf6dN7VlM8hS87L2C?=
 =?us-ascii?Q?RtTu1dm33ca2IT7V1AoIUJmS9zDGRgHc+PlmkaedTVftNOq1VJfQLbokh7Vk?=
 =?us-ascii?Q?jajlgTsb8RvrhBHplSyQY66nqOi+xPMtSCNCF5fsUVKVwrvaQ1/PTtGZElQT?=
 =?us-ascii?Q?b8qJOPVCZ5NNUd1klUp97mj4akUMv6mYcjBYEbUZ8rKmG9kbSte7afdV2KsQ?=
 =?us-ascii?Q?EdG3uKEAAQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2510514d-c25c-4b25-5503-08de4d8cbb27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:33:16.5253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCwSI5gu3thJHxKUrzMzSKN2zIMQTjlvssxkJoVLqUDKjrf091XclzG+VeKAoLvWgc1OJR42FJ6Zsjce0a/S3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_173321_119972_5D8A29E2 
X-CRM114-Status: GOOD (  12.85  )
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

On Tue, Jan 06, 2026 at 03:46:29PM +0000, Sudeep Holla wrote:
>On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
>> Hi Sudeep,
>> 
>> Hope you're doing well. Apologies for following up again, but this v3 patchset
>> has been pending for quite some time. I wanted to check if everything looks
>> good on your end.
>> 
>
>Yes overall it looks good to me.

Thanks a lot.

>
...
>> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.
>
>I think that would break build or need to wait for another cycle.
>I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.

Shawn,

Do you plan to pick the two patches with Sudeep's Ack in patch 1? Or
you prefer to route the patches via SCMI tree with your Ack?

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep

