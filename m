Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtJjtnRwP31UjdXPK2TP+QfBl5nintPQet2YsbMXzvk=; b=P31B5AI4mQ05IIFrgb5tuDnuK9
	jxxr5VKPeJY7ZkVQ+rffdfOp54el8mLtihNNU1YQ8f7I1G1mbgYC0rb5alZ3UjCEnivitmGfHhJGj
	0QFHtgOasx40HZulJyl7VS3JoxMBPO8wGAJw8BFPXuk6chngRNqjJEQltu4MfJaUaM2y7Q1f4Qa7W
	I4gnzHVfcGupoR/81N6x8rKNrkaOV68jiIuJTck0m76uvQAr+qMtVristOaZh4tzM4zEv2w3peAcZ
	lzOnWgDpKOmmwZkAE31Iv/cvjNNNuilfjW9asIeg/N3wNiT4AgcZ+n2I8wMVYAWbltbNB4gN7bunf
	2QulmqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttco8-0000000H5Jn-0idS;
	Sun, 16 Mar 2025 01:28:52 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttcmS-0000000H59l-0z0S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 01:27:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzrYgpF+G+QdZO24qzu9GIG5/4F6jTTG7pllv2AEIGZ94NmZBCMNNXv51m2yEupePfdU3/JUZil0f4ioLObfmghVbkXvqUgb7QQAeOKk+JUzejdpL88TP5u/NkkdfTTIJXhmNg+Mmm86NxMJ1UG8ThA4S252u0dvYyBVth52sc9Y8tuY4e23gFLk0ZV2lAVXQmHdCsMnTWgEkYjhq8s2Ff2qCB96l40Ngc7495XHriqJXsZpw1+8DG/E110Y2k9HkvejyxsCGtrYaBtWlA429qH/Ef5ExsbQXsWSUzj2t7UpBnFd7l11Cb6T8QT8a/43+ntitStJOC7/S588dKi7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtJjtnRwP31UjdXPK2TP+QfBl5nintPQet2YsbMXzvk=;
 b=LFmUhG4AV6Po1xP/m9KCgwzlpCYnqOT3gihOK7yFDA5zXUwK0xSapy0GVJshuE/M0TSmUQZQctNXiiDc6AR06PGDvmc7ixqMlam9sAGGhOrgdAMXopUVYr5yFJAf5QRyGA9eo60AqssfxWOFRBNlJ/iTy9qOGh7KxDy5dH6pASeCe8QEg1FSBpcPdmM/ylCZjDrAvv7bI8uiLoagcgaVarQNJ80laS/bLUweJZ6aXPnSjr9KRY1awVczWlOAZv0s/hZFhVdlIySIr9bK1fqgueRsH5sKmqy3Cn41nxsSWRJ9rjwy1BIFkuUdBVJOLlZILeqp+R3K5cqfJ9CfXP0O5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtJjtnRwP31UjdXPK2TP+QfBl5nintPQet2YsbMXzvk=;
 b=Gp1rjIzKOB66CYIJ9czxeT4og5x7d8lLSJkXPDp8QCEF/oOWqK+WSSRtM0aGgcbYy1kR5XR3QAPk2Rcr4KWWBjLkIU0XTPxOMJG1xUOriFLkn0O0eX7nqfD+46kXRicfmuj6crxsQFbwockIbqZ+YUT8Q0UNSRKLlRzNd/MqbsY2/BnBLny/XamAuAfV8PXDaU/v3BQsoucidel0U9n7ZJK/PrM90x6fvtRBOfYmCGyyJEZF8Kw9oueK6THtr5TxcwlFtJRnSjtwD3bTqEDQ2ico8D1I6BOGz5wJ+1Vd+BZbO0tqqlc8uBsqCMoy7hjQZoAP1nqGEFlOB6ZbF8Vnsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB10020.eurprd04.prod.outlook.com (2603:10a6:20b:682::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Sun, 16 Mar
 2025 01:27:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8511.026; Sun, 16 Mar 2025
 01:27:05 +0000
Date: Sat, 15 Mar 2025 21:26:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 09/13] PCI: dwc: ep: Consolidate devicetree handling
 in dw_pcie_ep_get_resources()
Message-ID: <Z9Yo4PeBH49EXPkg@lizhi-Precision-Tower-5810>
References: <20250315201548.858189-1-helgaas@kernel.org>
 <20250315201548.858189-10-helgaas@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315201548.858189-10-helgaas@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9140afcd-0e0b-4814-8800-08dd6429a934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VyW0wZbv7ajUuCJgErTiBcudNUEH+6E19/SPi7Gp41646f5Pb88RAr6N1dCv?=
 =?us-ascii?Q?6vfV142Xc07+i0m2NAtgZvl2G7+k1ukHwHSwvGkwzeaIEDcLBjGDeA89zwMz?=
 =?us-ascii?Q?xSzrZ5dCE7kZdm788k8W1NgFyQzXxb0IKzIFgWvmrVlmhzAFjzOyeMUMZ1i0?=
 =?us-ascii?Q?xhaPMpydsMZS5+dHiPmZQDAfRU6euFFo3S45dedqlfK0Sm7Sg8CcsVOk9SBO?=
 =?us-ascii?Q?QySr8tC0+INDT3baXQVrmROylCjWInmCyT3AfsI7jHveK3/DZsbODNlq1eUD?=
 =?us-ascii?Q?sHiHHHHAY9gh+q3p4YXxt5YP88fzqHfONrz/mJyQ/qDVqaShqrMMBugv7Z5Z?=
 =?us-ascii?Q?0XGfx3MOi2hq8hFM8qlw9hEMd+Ihsa12lsnxkVN/pTrWo0yj2ezoXo9Q5JpU?=
 =?us-ascii?Q?2pgXysXZWE05Kh4bF+52Q7NpUds83pguoMirObNCOzEFjYs1N4SwnulnVgtT?=
 =?us-ascii?Q?xfc89Tz5NdSpVJGKOfYA3MCQQx4jcYNAh6qE1s1A8OJAn597xKwuZvhIcNwd?=
 =?us-ascii?Q?qeKF7lHn2j5yDa7MTljULvflwea44IaLTt5AeoK09hain8KVJIE2iF2KX+si?=
 =?us-ascii?Q?lvObKSUBGCihfuBXyFpJyV/Ebxe4aVxgg6+Z9YNS5aJbHgYKCGtPpnZNOeB6?=
 =?us-ascii?Q?uxXypZ1VKJNHRZtVOStDsLPEsgQ3vsfaO0Zy9SMXMXOUlUzELvUBNgzdRmCf?=
 =?us-ascii?Q?FgG/2YklhOVrkSId0AG5CiNgmU1+bfxNPNEVWRWmPkuXbAIiFH30/ysuNK5t?=
 =?us-ascii?Q?cvPaZCEoUXPZpG48JkwY/V+xOAH0CimYY+sx8+jOdbJNzIraQ8tjRVcGms0a?=
 =?us-ascii?Q?NWso0EXh4eTFdRbyqm4Dazo99QO6dGKIp0N6huTIvS9w28AfJnZaiZ1uVbjD?=
 =?us-ascii?Q?yp7B+bwK6jXviWuxhVuwNzwnTHlZKsJ7a7yuH71pG/lbr2XDqbyWHLNCvIwS?=
 =?us-ascii?Q?XGRiULIT6PibILQefTSh31QhIDM/sVb9OzSZ0+oRW8xzIfLSiZIfleiiBWlj?=
 =?us-ascii?Q?6BA8mjb/DhcU2daEPoYYtKNQW/OwNFwSXQNUfMiJxKpPvsvEOEgejjUk+1Zs?=
 =?us-ascii?Q?JWOthysO2pNB/BM/BEH/Fqw3tkQPuLoOU24Z+8sKiIkO0plUWOAF4mvuZb3m?=
 =?us-ascii?Q?jf6gJ3j8FUnGjBcnUjLVtVVMvCP7Tca5earLo0IjSWm9sfPS5O/CbkP6nsF3?=
 =?us-ascii?Q?nVZH4pk5qSBby//MjaZTDcX87AUvhCnmw6l8i8ssHFwvLPVAfHVZNnUFgzFM?=
 =?us-ascii?Q?VHipGkSY/Sn/b3z2TW+X6zwXv4Oj69zlivTXkaCDM6y9m5Lw/g/ADWI0/bjn?=
 =?us-ascii?Q?fc4CgQ41fcFXvflrAtCiJRK7E4p8T9rN3dqMnaHAq2BQ8Urn4r1o0Le0Bw68?=
 =?us-ascii?Q?s/s91MriD/w5MioBdCXJKjsiNA9b8D9VxJG2qYWFOlMk+SD0ye8jUPy4PUDp?=
 =?us-ascii?Q?uNYVAX7W3YUZSK+jqvuiE3s0ueK2IEIP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4MEd4tTOo8On1ubKnNiHgz8NUEJhMS2nLG5lhx/XfSxZYtwOkG7hKv014a6?=
 =?us-ascii?Q?3po+SAJRVzpXbEp/nyxUAbE9UMSpPhTwHMO/A+zl44G4EXerkKqVUAEArbCk?=
 =?us-ascii?Q?lmGVfYOATxQv+birtZBhmy3TCk51s6G8Auv4f5RjSym82/9XWfEzrU5xIZdw?=
 =?us-ascii?Q?2dIFr3ecs9AtVUecaDSEmQ0Ns4SWnqLKHIyAV3je0gnI//MZD+0VQ3A6aew0?=
 =?us-ascii?Q?sOutZoGpmBsABRRJWFbWSheWIBbICQYG5gbL/Y9HKQPmE/2+1UXx2vujWxpv?=
 =?us-ascii?Q?cJrfV/QeSlicp2jeew2nD62WAarX6H1fFJZ6N4bMoZwF27eZqkZDwxvXpy0y?=
 =?us-ascii?Q?dBqY0ENbFjpoJ8OkggK7vwcNDiwzdfdQJKzoDmOHUO6TOvVepZFbragpZZ+r?=
 =?us-ascii?Q?FI72k1Ar65LtSH8sOSsgUt2u5Hppiq8hhgvvXOuK3pchvTaLY4nx9d5DEwjP?=
 =?us-ascii?Q?cb10JmT3Ni/y3aqgFH+vYgXJUAXKxtT5xcJxxbZ+rvFgiqCuc2rPmxpCGw/d?=
 =?us-ascii?Q?L1s5Q8m9QHP8ayYr6L/xof150NA/0H0Hz5aNhpLt9EN9rWh+PRIpjbK7/+oF?=
 =?us-ascii?Q?eEIA3sJtru5LAxLLge+Wywp8o/Nx1rlJ2EIdKvYhMS2jgZbKcXwOY6X6BHdT?=
 =?us-ascii?Q?p/enL+ktgthZO2kTI3Xt85khbTf3Tqu2D4P9iqjRKHRpzDs4QtuBQGzfo0TD?=
 =?us-ascii?Q?g41W878ZxI+4V45laExW3mYAQxbT1jbMvJZFQjCF8iMWmxbXz9VzN480YP98?=
 =?us-ascii?Q?WyPlX9lDTJ2r0Yb2+VpdPH77g+F9IClpddno8U7y++I/a5ao+RLvKX8dfD37?=
 =?us-ascii?Q?O4vsyoQ759TYy6OlNZZTs3juxUx9G5G9jNuFM49BunfBNhhtWU/UXFCT036Z?=
 =?us-ascii?Q?GJaVJaWmk1oW5/KskObF5UOBoJyrgzBu11dNh7duhZncKavt0Hyk3ah9X/uM?=
 =?us-ascii?Q?QTn6lMTmZx8eMq5/7KMpxMn5iVqauJbjog4kJZnsICVlNvivhSdqdAjP+LWx?=
 =?us-ascii?Q?eckFIhtP6NK9hIJSqnMcWx6opsaZ5rZ8tsdQ3sDGx9+ZZJjIY7K/E3l8rYmj?=
 =?us-ascii?Q?Ik0X2dcdCVgQqa9VKiZk5EdlH3od8+CTjpPYHX6TB+KDdZYnD3bOcEltkiSZ?=
 =?us-ascii?Q?SNW+8M7IShc6FTbtkSI9yqso5Y/vpxzQ5Wu7TYOCSe/aaljpzAtCsG/4NeB6?=
 =?us-ascii?Q?YpBiBa/GbhoAynccsNL0UrNjaAEhJgi5TTsL5/r/ouP1DW4ewScdxdfdFz3P?=
 =?us-ascii?Q?libCB3UP5ASgmesluYc7SMy1QJ2ggHRr/WG8eOGoc2YoWMn5WlZqhA2UEQ2K?=
 =?us-ascii?Q?fdUVm6LUVpcnLhVa2e0QosJb3UIHRgkvK1WkQeIHCcxfcA5LlVma2V6biZcT?=
 =?us-ascii?Q?cItjMP51kqtiiGkxX4ubc8kuQnLC2nrRWdpshFYOIiEIBTP9pqpgifVNd+Mm?=
 =?us-ascii?Q?Q9+mLmWjAHc9YyZwsdcVFvvniryX2Chlklf+u3Mysun+3UoM2sxLU4RFBhu9?=
 =?us-ascii?Q?qb/tU8MgXHnXrtwKE9x8foeQuZsPk2yi3clc+pTJyHSZ9+tCBPwZYsNVfrr0?=
 =?us-ascii?Q?7DqbqlIx6qR+S7TQ8YI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9140afcd-0e0b-4814-8800-08dd6429a934
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2025 01:27:05.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40DNhikRXmCGArarzhKG5mV0DQwcPVIzy7sMxBlu3lF89wQEsTr9DGLRHfMuF+AxcAGqmsTuKTyIV+KUN+vvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_182708_279067_71344AD5 
X-CRM114-Status: GOOD (  21.89  )
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

On Sat, Mar 15, 2025 at 03:15:44PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Consolidate devicetree resource handling in dw_pcie_ep_get_resources().
> No functional change intended.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../pci/controller/dwc/pcie-designware-ep.c   | 68 +++++++++++--------
>  1 file changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 100d26466f05..2db834345ec2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -883,35 +883,15 @@ void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
>
> -/**
> - * dw_pcie_ep_init - Initialize the endpoint device
> - * @ep: DWC EP device
> - *
> - * Initialize the endpoint device. Allocate resources and create the EPC
> - * device with the endpoint framework.
> - *
> - * Return: 0 if success, errno otherwise.
> - */
> -int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> +static int dw_pcie_ep_get_resources(struct dw_pcie_ep *ep)
>  {
> -	int ret;
> -	struct resource *res;
> -	struct pci_epc *epc;
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct device *dev = pci->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
> -
> -	INIT_LIST_HEAD(&ep->func_list);
> -
> -	epc = devm_pci_epc_create(dev, &epc_ops);
> -	if (IS_ERR(epc)) {
> -		dev_err(dev, "Failed to create epc device\n");
> -		return PTR_ERR(epc);
> -	}
> -
> -	ep->epc = epc;
> -	epc_set_drvdata(epc, ep);
> +	struct pci_epc *epc = ep->epc;
> +	struct resource *res;
> +	int ret;
>
>  	ret = dw_pcie_get_resources(pci);
>  	if (ret)
> @@ -924,13 +904,47 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	ep->phys_base = res->start;
>  	ep->addr_size = resource_size(res);
>
> -	if (ep->ops->pre_init)
> -		ep->ops->pre_init(ep);
> -
>  	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
>  	if (ret < 0)
>  		epc->max_functions = 1;
>
> +	return 0;
> +}
> +
> +/**
> + * dw_pcie_ep_init - Initialize the endpoint device
> + * @ep: DWC EP device
> + *
> + * Initialize the endpoint device. Allocate resources and create the EPC
> + * device with the endpoint framework.
> + *
> + * Return: 0 if success, errno otherwise.
> + */
> +int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> +{
> +	int ret;
> +	struct pci_epc *epc;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct device *dev = pci->dev;
> +
> +	INIT_LIST_HEAD(&ep->func_list);
> +
> +	epc = devm_pci_epc_create(dev, &epc_ops);
> +	if (IS_ERR(epc)) {
> +		dev_err(dev, "Failed to create epc device\n");
> +		return PTR_ERR(epc);
> +	}
> +
> +	ep->epc = epc;
> +	epc_set_drvdata(epc, ep);
> +
> +	ret = dw_pcie_ep_get_resources(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (ep->ops->pre_init)
> +		ep->ops->pre_init(ep);
> +
>  	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  			       ep->page_size);
>  	if (ret < 0) {
> --
> 2.34.1
>

