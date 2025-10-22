Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C87CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=by99k+PYrwKdyKYUrW4JAhixiV1enCK30Q5dMG5Ypvg=; b=WTJviyIF6ZVdmrk5vzkk+t5uNp
	GFlGZC2J0/bCfFHmrsHWMgbYNttf6Xs21bMcvlfEnQhraD1VD3nDr2EUoRna6fqECd+udyhrN51eA
	RCk8XMrSwV1rfe7oUEVA1UTV9Z/1UJtd08yxuw2kLK38AWo9J7m1+xypXNaSnCIL69G6s5ru3QtOW
	nGqRqxNtV5zhlqrwyGG0wP4D3aay6KRjjyvaxz/sfzomwlFeqgI/FpoOsAIVtUU0NRXnwPYcKtYqB
	3CiX/mGY6GejgsUIYhY7xkzuK82VjisTRGkSCkr0f+hQHcKVJxG0Jwbk30cWcC6+BP1MrC4sL6WTn
	QrMGz6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeLe-000000047CF-2wMZ;
	Wed, 22 Oct 2025 19:18:14 +0000
Received: from mail-westeuropeazon11010035.outbound.protection.outlook.com ([52.101.69.35] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeLb-000000047AE-49eK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 19:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAxC4Qeq5rilg9PJkNsxGRyf5zbakX5hTT/b51+pcl2a2mAoSVEHVKqeSrgKfCT9yI4lC5J5MnNF2DjsFqr5H1aPROtKeX3DyWtIaO8ZR92F4pM61qKiOgreDBVyqeedGflgnIX8Y8ZzhTeaP3nKdm9+M2kYcTDKEQ5RAy/wXfvKSzCKYVckZcWvWaIUUKHqncgsmW+GmkN57PuokuY2ILESsdBR6c+8sHB2MQpjZnHqgun+dW/Fzc+WnFlGWo6SJsCUF0cP8hR0Df3MSAqafGs8rgncVQsYX++94NKaftpHFTFTSdilrOs8wllOrf1UqK64xS1o04AMvrsKQxs1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by99k+PYrwKdyKYUrW4JAhixiV1enCK30Q5dMG5Ypvg=;
 b=T39CgIgvt8JsiNNIuKo380jWZnS99cowO1K5UnFrZ/FqmFs4ZImskdJEwFkXHxnwG46+7AuhZftPHkz7a6YuT/+L0oB1rW7MxSBae0qZNwPp9jJmXLGiBfThGhloj3ntkgTCM977m+XhkGHAFpuAQ4m72tepiwYy4BEN7UZgwaCMWIAzFbCofmGGdGRikdgAWBR8P5/A06u2rmSEEWmwdJTJ6IBTehIsw/piPklt6yKfbmgZvBKkp/u8w0ap4qRipmZZP+MeqvgYN06rrc5Vu7Ow7AwBTEvbQvqiVKuALJo3cBigQnvC9Ww4teDbuAQOC6cj3vcVyuVdHz8Q8BPcaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by99k+PYrwKdyKYUrW4JAhixiV1enCK30Q5dMG5Ypvg=;
 b=lfX4hu2cig64pGLw0/xK3oEued4iwtRQYo2ucspdZCSGqwqTrbT6bnwxT1ZjpmsCcK+9b3tPLAOJYGumSWK1wqti8ZttJe1LDG70tk/L8dqFI9YUGz2Z9bOwVWk/+WbPnjxZcY5VM4yK1bciid/gsWuANmcMPG2S5c0T/0TWEs2t4lMjLzBpO1wNIa1alKM5hzlDGWSLy4fHTrcDtkWvb7iUIStKj0kbHhHKyvu31WXXXZqSsHPalm0WEoyaETqgJmN0SrS0aQadjqbtGhqRRYEoEgRfIMB2jLyLeRC/pVrn4JY6PW1ojt3PJgsUqJnM6aIZ/KIfZsC8aO5HGuwNqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7931.eurprd04.prod.outlook.com (2603:10a6:10:1eb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 19:18:07 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 19:18:07 +0000
Date: Wed, 22 Oct 2025 15:17:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	cassel@kernel.org
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <aPkt5sigtL/EN0A3@lizhi-Precision-Tower-5810>
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
 <20251022174309.1180931-2-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022174309.1180931-2-vincent.guittot@linaro.org>
X-ClientProxiedBy: PH7PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:510:339::32) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a4719e-d8f9-49c1-9d25-08de119fbb2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5J+pJRrgZszhksTlxPdJglII/V12WVNWv08R4L6xmUPQV4NmZWLYamPsA2GF?=
 =?us-ascii?Q?B1S7xcAEdeH+SnDtEzSB6aJRuPdgX2I+La5h3VFveoBuZuPm7Ar6fphW09L7?=
 =?us-ascii?Q?HPMkLF2WYv3XsZlQu7ssutKa+g9if5I0ajKqQ6jQmJbTuV26gPvtV37FHJoh?=
 =?us-ascii?Q?hfG+UkYhDR8l4TNW+3m4au4Ktwci1+J17qFip8XwmkedKLkWGlOkn2REQKx6?=
 =?us-ascii?Q?Ra/5BRcueI5eyS3nBreykmS8blXonh7CFosK0v0Q6UUB1D/C/3gJyuQLVb2x?=
 =?us-ascii?Q?JSSDKlSKfLN+6LhJrTFIQ0pyThEy5JTo4NAvWVp2vVhdzQULdoq5zbMOCIto?=
 =?us-ascii?Q?NO+OiEg0Qs8F4uNS85o/Z97ZnGQTo3jicuxwtnsoxOzO8cwKG25p/F2JzIiG?=
 =?us-ascii?Q?2aImKk9QNvoFGqPdbtjP6PcR6GVCtrdGrbAjsb8cF7wM2w2VypaO3dvbeN5u?=
 =?us-ascii?Q?o6nsiQP0kutr1Jmpi0lkzUgaUtVa+xLEGbP6fMuTRuTJEToKiofnp7G+O9+D?=
 =?us-ascii?Q?2AuhLfylrY3f21X5yKRAtnbPgAFagBOx9OK3SbTd0+Lw83o9kz+LB27viMln?=
 =?us-ascii?Q?vhNQmx3xeJm9BbnmUALI9nCGfuko5uachj18+QplSvzG/wfG0SgMmVxqgsh7?=
 =?us-ascii?Q?YsYleQGHPGn4xG+bP14R4+W9B3IUCgP9w/VYgqHgDqtkm9JasCpY6Zc37rr7?=
 =?us-ascii?Q?IqiEjIy01heUkk3rakdyMv5UL+mSmiW7K5nqiqlEhxHrRsURYT6hBW+RTmq/?=
 =?us-ascii?Q?tAvN0W/cbsdzw0MTcimmy1pXOYDTodej6oPTi3p6l51ym2ieSG0EDecTpFSn?=
 =?us-ascii?Q?5WVYF7L2M+/HUJ/IcrN4qcyWPW9bWrsG1OxnIXFlSUh+mUhdg2V2haT2Iowr?=
 =?us-ascii?Q?KMSMADqbkc20SpsvEer4tx1HTWypyQf+R5Eli79CUd4R9NVNyqLuDuXHw0wc?=
 =?us-ascii?Q?mUy7zPt+7pCfjtTcFcI7PgidTIgl+0KlJCvLT1cQ/Ix0BIONofxIGEAQTMGR?=
 =?us-ascii?Q?bbHcZ1krTVdYcd1T+flJqABLRFxnK6BJz0zlXgwYEUI60CLcTKjiknp4PvX9?=
 =?us-ascii?Q?wslr8yg8oAMlnADGFI+BCsgpX4Z6+R/X5UpgkoFE+ygA/jtai2LSk3gm4Zjo?=
 =?us-ascii?Q?8VFQz8xxuDtRf0SSuXuPKZT9cKHsGpOZ7ks9K91d7eKLuE2jw2kCbeaj0R8M?=
 =?us-ascii?Q?ZT2HQNT4Nl9END09SxYqNJOCI/tBpqPhIlc6escHKAzXTIYuu5QricULaIm3?=
 =?us-ascii?Q?HGF0LgD7CIJqiB97KeJz/uZl/Hi+zIkd9uQH96yS6zzAnbIUbfk9ut5s7zdt?=
 =?us-ascii?Q?op1Ss7w97H2VBUyt8RYdqfy9qa6eLma+NR4u4UoAP2KQNj33CAVFJZYTcKba?=
 =?us-ascii?Q?QMW+YHqSb+0McyhwNYd/GQDDjk/UKQ292bu4Fjdl9J1xzpomjBJmKqkTUjMC?=
 =?us-ascii?Q?+/vcaSqW+ykZBQwxm1Mkx7zvv9wb8eCboY4kiRnr4LwgTUMrhfTDBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7mbfSMmVFEloK9B8NFsodi5cEBaEweMXhtw8m0DYwDFsbx+sNjW/QBpJtzJl?=
 =?us-ascii?Q?MGqPyVEpS4c7iFc5bsUBg0mxBHbsST6mVZb5sniCwcweOkGrJH+aWK1+VYGc?=
 =?us-ascii?Q?yod+uDXBlob2kpavfbwK8owJGeqtIFeFs6usv8JenijOuqmMQOQrUNJtwkAM?=
 =?us-ascii?Q?u1iJUir+Zbm4yyKBH6hBneQyaajDQPpk2ip4Z1TwLMt10wfzw8wQv0aQpU27?=
 =?us-ascii?Q?kaYUxylagMSTxvkIDRHopdcfEUxVqpzpe+uXSGjjcbwnxkeuFAwbcufRObfT?=
 =?us-ascii?Q?bkhiML6ba5QqxQ2dcHW0/6KCyumOZmngHvsD3j8LtSjgo0G89DJtRGJwOfcV?=
 =?us-ascii?Q?Wb/FzY0RITOWexynbLbgI3OYbzuK8W7P5SNkRn6paZn7gTNE1/xSey4TIdu3?=
 =?us-ascii?Q?onQDD8GZbHUn5BzgcD7XyMSzNg1Luo7q31PVaBjmGvt6qPDxzJ2kIs/jy20R?=
 =?us-ascii?Q?WKIxXPZpHypGOdW3J2EmsW1ll7orZOxndBbhUCmwo7kYNmk5mtAggVbA8Fel?=
 =?us-ascii?Q?nBhPD5k+JIxEBhh3QgMzg23AnDzLMWbJ5Swf/bfL4W+JCl5pG5Q2GUed9TnY?=
 =?us-ascii?Q?xBu5mwx9M8xxLQmlfAtOAPJ/NhG55+boxaD4/qXWAi7m0q9DHbmksAD3rQCo?=
 =?us-ascii?Q?vO9wEmGAg/c9BcDR/SWS4WSddigV2qn35QOti9seaiwQweatvyo8IoaxP5b8?=
 =?us-ascii?Q?1xwcz1YLhvjGc34cFmWICUFRcnNYzLfdMUbCNNpkSn/QSHE2UmsBfn6EA1H6?=
 =?us-ascii?Q?eH3GDrfVKsBwUWec+HTSusne9lOrU6GNvHX7DzKDIN2rhUYs7QRhW7f2rfln?=
 =?us-ascii?Q?pC91p7tDeXKkJ2H5WmV9Tb8eXLuOXVVMngmh78kJQkMIr+e+FNeZVXPC5adZ?=
 =?us-ascii?Q?TZKXYQkz+0TE2dLlG3WfJ1tUcI1yTarQU6saDRU2qfrbU5D3/g5hPTiE3o83?=
 =?us-ascii?Q?qwyUuROauaShCOxJnrIqS+ernpiG/c6iJfjl2CNbM+xmoGAxX/gf6T34RqVZ?=
 =?us-ascii?Q?5gaGPPAmmXLMWU0BK0+tPQ4SQZoEKxqiyHVtZ3nnzxO4xeVIQ7HdFlnshtH7?=
 =?us-ascii?Q?KQaOv2SHt9KRwGFMUhBW6NgeFN31BWxNPajLNcYgItV7ZOMKX7WuXIkmgRPq?=
 =?us-ascii?Q?msD/l3uwvjMZuhvnCv3aLZmqBw/6j3xstUX6XIxF8Uhh2h3iIG975n0oyXlm?=
 =?us-ascii?Q?pyTmftgkY8gpbrr+o2JHDHttlnqbvPbC3B3n4QM7rkeydjYDIgOunMv+wTWj?=
 =?us-ascii?Q?1IGIFLwItiV6oTNtQGv5BaTfHJ7/3MPeBnQHrckMqKuuCf0CXMf3akFeOS0F?=
 =?us-ascii?Q?XgygaUmQ10AU9c3w2ObtsLDVy9LKxWHM2S87ihQmJ3L3E5vhY9UzoAbh3JT9?=
 =?us-ascii?Q?tqSgCmTRNCXFTTYxZV7o/7CB/fh5jfloisbpPUyndBghy8McrF6rfWXCMjfb?=
 =?us-ascii?Q?ppQmLxLtIeqcq9YLVsrLZ41T9OVItLzGdWqZCnWDR529ETbqeEif1gLY+yuE?=
 =?us-ascii?Q?lM7esUvZG6o9PCmy1C6ypFJNbnVXYv2dhW/OrRps5kSIXzvP+/7BBB+gxvUh?=
 =?us-ascii?Q?dCBaGXhxX4Mj6bhUkmldJKJpNfPAwh6kTO516SXF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a4719e-d8f9-49c1-9d25-08de119fbb2e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 19:18:07.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3ikyObygCX5B8W4ZDGKl3ckLJcPZp84MkwbWXAGumLLQIMsflPotpNmOr0pHh4pSDS70XDZ6lcgyvznSdpRwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_121812_216216_D9866AAD 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> Describe the PCIe host controller available on the S32G platforms.
>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
>
> diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> new file mode 100644
> index 000000000000..2d8f7ad67651
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> +
> +description:
> +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> +  The S32G SoC family has two PCIe controllers, which can be configured as
> +  either Root Complex or Endpoint.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-pcie
> +      - items:
> +          - const: nxp,s32g3-pcie
> +          - const: nxp,s32g2-pcie
> +
> +  reg:
> +    maxItems: 6
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: dbi2
> +      - const: atu
> +      - const: dma
> +      - const: ctrl
> +      - const: config
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: dma
> +      - const: msi

Most likely dma irq is optional irq, seldom use built-in edma in RC mode.
so put msi to the first.

interrupt-names:
  items:
    - const: msi
    - const: dma
  minItems: 1

missed phys

phys:
  maxItems: 1

Frank
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - ranges
> +  - phys
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@40400000 {
> +            compatible = "nxp,s32g3-pcie",
> +                         "nxp,s32g2-pcie";
> +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */
> +            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
> +            dma-coherent;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            device_type = "pci";
> +            ranges =
> +                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> +                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
> +                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
> +
> +            bus-range = <0x0 0xff>;
> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "dma", "msi";
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0x7>;
> +            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> +        };
> +    };
> --
> 2.43.0
>

