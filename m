Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C8C36014
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q4efpXk7KFX4KmKI5bo6B8dXs0E5vLBarHAkpl2waY=; b=OtN8BnEQMb0GidZhqikdcBqHAw
	ZDb7c8oDk2jmYIZPXeLH2gNAuhdRlOVVm1rkk672ZmuKx6KT80vEhBKxFtshd4E8A6xxd3e4SgxpZ
	+BAHB+hKUp+KttYZ3OUeyHfohxcQ14snju+jhROb+9Gnbgjg/DYbEQ/cIQAyfLZZSVsOaqaOCr85d
	1bCzywVkeMK837HFdVS9EpMybVVZKcnjW1tnaZQH1mM0p7uvOO2+c354HHWDmlTQrzUN0rCjgq2Nr
	M/3fJOuMKcGGfgrg9EzQX8uCXoO8Rj3uQlV288YXxTBAia+SIv2Py3L1t4LHW5/JcqtafQnsAvgbW
	lvAkduyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFZC-0000000EBkB-2XGw;
	Fri, 28 Mar 2025 19:40:34 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFXG-0000000EBLM-1NKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 19:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7Pxs7sw4e6CHQ6hr3ozWvQ0EK1v4nJB79Y2KEEhIcVyxcfQBgPS2DJY41fE30/nM4PIp9nRJsl7udwx5Qy0yMr0vkJdI1iZFR7zZ31/b0TJMLlQciHNKGq5VPPizwlMd2rVdLhCNKNl39ZRbe7QY/fRrVj5B13+fuTg5QAJeohwX7/C2WYrKtfWRAaTjk/8N6iaCMAWkdXpLrfagIW3K60J6B36v9hIVGmtCP8djrlCV6CxSvLntp3kRjGlROq8d2TGllk3g8F0SCjXlJNyPoZzs+tHUWj/9jrSOHuu4WUuMiABoIvUp3IPNHgmguQlSKXa/IhXsEUScpC4Q2UTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q4efpXk7KFX4KmKI5bo6B8dXs0E5vLBarHAkpl2waY=;
 b=hW2kdHQH/sSYJAoV+RLDqG7/NbKoe6YYlLj1TQNgrCIkPZeq0G5FWBSoliPqp6ihOvHT3PTaGCdM3CQ2jBCsH1pfcPxoO3zuO3RrkSiwLCYQgzMBd4zE/gcLL8HPQqEjl7kw92LTAFWJv0VmoyafWUrgfBwtzAqshUSy2tqYfh7bwimiHnLH6Dh6uKMIuCXueiBrFkzfVtJVEr7rbtGgdCv474KSKsFCCvrEKYSLrLfhJUnq341LFsNvIYFjTWwieWn/VMOxXWgETVO+yvcLpcbOIs588OkCt4/riwzK2LSPX4wJHSK8luP2+ULakLuecGX8SgBmhHbEKPccbD9zEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q4efpXk7KFX4KmKI5bo6B8dXs0E5vLBarHAkpl2waY=;
 b=Mvt2q0uJ2zCoUpry+fvAYmaDhB97qQbrYNK2ADX+VLhP2dYiaT4pOyPoOQIkBubYqHl3vgkphjxsGCABQx03l0sdBKMT1gZ62T9kUE0aS99EDK0ewG8fjUUaGpNg9kBkcVXuqJgvFF8/DIEyG7ZcsuLJbqjKIDR500gDzFVKs6nDAC6xBrUnDPKk5pkEICmoFpv7eWKkKT2Ud5PwTkfXU0ue6knzv3msyJjGXZ0YDgxyhpvC+nVNufAnf5YXD0Cbg1pivH7SuYcHDFFARGxMw9/H4Iy96R28YCsHJjMnDd/DkHBBeI4VQ5mlppZrzFROMh3LgTL1wprb9IJ71xmxqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 19:38:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 19:38:24 +0000
Date: Fri, 28 Mar 2025 15:38:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Message-ID: <Z+b6qrgXz/NTOs5r@lizhi-Precision-Tower-5810>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
X-ClientProxiedBy: PH8PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f63b6d-3961-42c4-0f77-08dd6e301af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qKVhiDtfyKz4KkTqyevDIYQIkdknetw4WeGIUOXWw67O5FgDAdySLgad73WP?=
 =?us-ascii?Q?zzAFSziZ1f5zSSvSs5zz7jTCokrRLbV7UChNTnXMvnBnF5Znq40kmooNGf03?=
 =?us-ascii?Q?alliamppE1mljLN3p6VhggyDapYlYSUnglZ5G3QnSZrEsK+5ndl+Yqe1qS5N?=
 =?us-ascii?Q?RafC0YnTFO0LdffcNfPturmvDmUP7Vjv24aJVfPfpvPjNcJzsvNJVlm1e47P?=
 =?us-ascii?Q?Wzwr1F3nUwIAHw0svHe44tK0xnxAWUN6qCQf2BQCFjcrOmFjC0x1AIK9AVId?=
 =?us-ascii?Q?EPSz7lygOR/Y2yQqoafdsXBEAddWSq0aMCKB3osiJpVDPInTiBXeSmlmy0ly?=
 =?us-ascii?Q?SQE1tym6s0FUcSRJjkvnvroZWIWoAbAbTKpUzP6WfwRaFCEJ4BlepcvsO6jb?=
 =?us-ascii?Q?BOnNG+YQYh7I1ZtqvnMkao2P0jlXJYfWil0bJ3xoJOQBjNPx8LtygnhAoN3A?=
 =?us-ascii?Q?hYjw6JOElcAcRgrCpXwkhRt3jVNWL95OWFvtFmUj4mgsabRPonIz8VTizNGh?=
 =?us-ascii?Q?eOLqtfsvSwD60jVa72xdvmQ/aljiLS0Gp5Wfm75Z1Znr20FuRGs6V59nM0it?=
 =?us-ascii?Q?FbTWX3Gn03YRlC/mZ9vtmIj4tGyq5AJP7MjBhZr68IZ4wRi+74ZL28+2cHh8?=
 =?us-ascii?Q?CJ1LbOaAF3+T3eKejMtYPhSC2Muyh6jJ3jdSs63P2MMvig7xQ3/sBvtzTWaH?=
 =?us-ascii?Q?Dbdyv4SRdvuqfbq/gcD2yuQTeS/UVXAAPOCgQGzntkRW3bnlNQd6rf7JtU+U?=
 =?us-ascii?Q?FIh2qmW7RYh+NqM5U9tDQwkGkF1EW2jV4VM75Cb8T07ApyRY5qU3wYC2ndJo?=
 =?us-ascii?Q?N4rkPCl7ZstP5eUyFVOyc9SKw7kmxINoTQZ0FhwOXg8wOFx3n1YC/j5bnRv6?=
 =?us-ascii?Q?J0Da2AbOXIGtYGCaJL4EPqofBpFk6NIOu9+kiaFB+NKPCNskKOMEaN2MqD4T?=
 =?us-ascii?Q?BvKcRjIV3Sk08Mga5sCIfAZbsWz0Tk44Uku04rZaTczmU8fAmLIgOxhzQkm0?=
 =?us-ascii?Q?rT5pOQIX8ERU8Ulrq0jiTg9+uXyxbIBX+kh7LQT1RFk3i0yXuTTC7W8TduDV?=
 =?us-ascii?Q?1ltdQDsqsPuIWqSUt6WjzVTTanxf5xvv+DvjgPs7j//cZg0ht9tWApQIkw94?=
 =?us-ascii?Q?iYTzf0pZWaLPg9kxtRpJFYtJpU96r1HMPrZ69F/br5hvie7HOPC153fU3fS4?=
 =?us-ascii?Q?2oUMlCJn605yOYYAOGMSyNKzSrv9VucyQ2LsAyoXGsnw8e6SiCzdAvYyoxjG?=
 =?us-ascii?Q?XQUTMjN2C9AudaAwXhHU8h1UG4bJ6j7ROPTp3iOJ1xn4WqdR7c3vTSXL/R1z?=
 =?us-ascii?Q?xfC1nd2hWQBuQVLEcPnKfERi4FSZFhJH9uqEya+TucT+uADFNsnzBH0gLoep?=
 =?us-ascii?Q?OI9asWbT6Hr/yFmlg2gFGjW4H/yCsT34uws7l5JtuETr2LNTww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wc9ABGaZQLs2TjFMnIQBxPy6O5i2r5mAv1FM9ZnakxTiHyii15qxaoemfQH4?=
 =?us-ascii?Q?j5qzrzSl1VeiQ9C8v562x4A4CXrFvCgp3fa6hnry0545NfkekQ/M39jRQDGf?=
 =?us-ascii?Q?YKum33k2fMfaXqIPV/KkBfOIeImxTgEKf3sDJEzHmBhgCDmdJpK1wq1xuc7z?=
 =?us-ascii?Q?bqEesEQy66nvweUX2RNaiwy8x1xhmAngWJNff3yRp+q5OhyvA+puKgkEj4z2?=
 =?us-ascii?Q?WoKeaY4Ct2Wok0arK8Tt3YjbRIt652WA0C//M40OH8ZAbD4CrS1mYIQrpeTg?=
 =?us-ascii?Q?X3ZkpE/1+CozT/G8phxND2KHC39iatMtcAByW9eAR3YobASwXhYIal5dzxpg?=
 =?us-ascii?Q?VEQB/cVAanPKxvn5k1ZhLBZajTczueYSrXXr1lX4sY0K2Se4zOMBklxGhy8H?=
 =?us-ascii?Q?gRJxsJR7XFDe1yYZThRgWuJFjyWIe+S+vD5HpCorXEA6KFlV1wVVlpVsm9sI?=
 =?us-ascii?Q?oex4N2qBIjUV6WAxW0x6Kdc8iMLLgWpxvTwXfklIlSBDtFU7hdfke43qaare?=
 =?us-ascii?Q?ekQENYOvuhJSNZdIObDMGkDum7gO+hL+ECAShIC87iuyv4f0uDSHKtcU67ua?=
 =?us-ascii?Q?GJYFvntUrlzKCL2mHcpZMCmaLOGMwiQcKHibQdmHw3++MdVrKM0eN7oRnb30?=
 =?us-ascii?Q?9+8qrPfXzyqV95c4KAgFR7cDlPCE+eyQ/8mwAZpEVeehZ+gFen8dn9S60wCd?=
 =?us-ascii?Q?zawVb4viAC/qaU6yCDJeZaJ6b2i1Lqr3x0WrLhHvJ3ZftTS6OrJkbdJ7+4iN?=
 =?us-ascii?Q?sX2Nn+WQm76J+2xbqGQ2OqqT/gGijitiEklIW7tdWbNrN9d941jGwsnDPkqQ?=
 =?us-ascii?Q?Jpo6roryNlkPOwDdt/XklaWxda7KmVsJtF1G9ipoaBytPGkPi3xCmMWKo0Bt?=
 =?us-ascii?Q?UDPGp9R+y70tkzLiA/blyZPWb9KgT2ihkIiP6316vOj6GEvIvL7qTVnWPqQN?=
 =?us-ascii?Q?Py3LZ4AoCJwsSV7ELml4guxGyHu0V9k+rTBmGrLy3cZwJBK0/iautpqRYwUh?=
 =?us-ascii?Q?E2fDGX6/pJ86Zy8Q5bNk91q4rz6XMgyCI8O3m7JzBpWSyF4bYIgDw0pG7A6G?=
 =?us-ascii?Q?iFjoQLbHuntzG+WeFoJ1jKxAEgCdGL6ZvE0cIk1qof/u5DgMFS4mt35PkVs3?=
 =?us-ascii?Q?2oxZkvXgz7j+7LPEY7GJQaQd/53RAk01ziOY2iQPXw2j6GJacyXraPJ06nZu?=
 =?us-ascii?Q?hRlX29KFNEEqW7dA/E61I29HpvAnX2lrrtCHV1eirw3UVt+jF/MMlaXCXeVV?=
 =?us-ascii?Q?T56Xkr0XjwJOhYLZ9HisCtfsJKMxIwhcR8KkJuGTCDJd808bGQvSRYFI3GHf?=
 =?us-ascii?Q?a7SkPHJKYV421fLxhxmx5uk5reEoeljvIrRE6tUcBCXBTjPXdFa2sUd9dALj?=
 =?us-ascii?Q?290bcDus3ANJXsI+GCyEWJ9wnFoi4cwyXHs/WIAGCPf+fFsyJeRT95oeH/OE?=
 =?us-ascii?Q?TKL3KeJ6WXcdBwM+KhpS2sEQwLxfIXWbhgPRSjeJVFB+hheD5kT3se5yESGu?=
 =?us-ascii?Q?dnX63i9jBmcwP1/dVSJvixhZXeNNXxVUVfvPbSUd5Gh9TMkG7XFCPbYUWAO0?=
 =?us-ascii?Q?/n5ErZqlsEE9DQQGVTU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f63b6d-3961-42c4-0f77-08dd6e301af0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:38:24.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsFwU0+S5TlSjdDQ5MEwQ0lQPZMWMItCiR03nax/nRfQWQ60WKobZeLLUCxFjsBFeExkq519Z8ZoTWWyK4hNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_123834_361733_CBD37709 
X-CRM114-Status: GOOD (  41.64  )
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

On Fri, Mar 28, 2025 at 04:41:05PM +0000, John Ernberg wrote:
> On 6/12/23 5:31 PM, Catalin Marinas wrote:
> > Hi,
> >
> > That's v7 of the series reducing the kmalloc() minimum alignment on
> > arm64 to 8 (from 128). There's no new/different functionality, mostly
> > cosmetic changes and acks/tested-bys.
> >
> > Andrew, if there are no further comments or objections to this version,
> > are you ok to take the series through the mm tree? The arm64 changes are
> > fairly small. Alternatively, I can push it into linux-next now to give
> > it some wider exposure and decide whether to upstream it when the
> > merging window opens. Thanks.
> >
> > The updated patches are also available on this branch:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/kmalloc-minalign
> >
>
> (I trimmed the recipients and added linux-usb and imx mailing list, +
> cdns3 maintainers)
>
> Hi Catalin, lists,
>
> Seen on Linux 6.12.20, it is not trivial for us to test later kernels so
> if the issue is potentially fixed we are more than happy to cherry-pick
> the potential fixes and give them a go.
>
> Having an SMSC9512 (smsc95xx) USB Ethernet/Hub chip attached to the armv8
> SoC iMX8QXP over the Cadence USB3 USB2 interface (cdns3-imx) will since
> the patch set at [0] cause random interrupt storms over the SMSC9512 INT
> EP.

Do you know where buy SMSC9512 USB Ethernet/Hub?

>
> The reason for the storm is that the async URBs queued at [1] right before
> the interrupt configuration [2] in the driver.
> With [0] applied, those async URBs are likely clobbering any URB located
> after them in memory somewhere in the xhci memory space.
> The memory corruption only happens if there is more than one URB in the
> queue at the same time, making these async URBs a good trigger of the
> problem.
> If we force those URBs to be sync or use the hack inlined below, the
> problem goes away.
>
> The content of read_buf in the interrupt configuration read at [2] looks
> to be the lo-part of a pointer +-20 bytes distance from the pointers
> present in the async URBs queued from [1] when we dumped the URB structures
> instead of the expected register contents.
>
> Attached are 3 usbmon captures, with some annotations, which we thought
> might contain useful hints.
>
> * usb-annotated-bad.pcapng shows the URB that will get clobbered is queued
>    at position 280, and completes at 282.
>
> * usb-annotated-good.pcapng shows the URB that gets clobbered in the bad
>    case is queued at position 282 and completes at 283.
>
> The above captures are from a kernel where the hack has not been applied.
>
> * usb-annotated-hackfix.pcapng shows the URB that gets clobbered in the
>    bad case is queued at position 238 and completes at 240.

Maillist have not attachment. Can you send it to me directly?

Frank

>
> This was captured after the hack fix inlined below was applied.
>
> We have no reason to believe [0] is actually causing this, but rather
> the improvements uncovered a pre-existing issue with the Cadence 3
> integration in the iMX8QXP, as otherwise USB would be some level of broken
> for absolutely everyone on ARM64 since 2+ years.
>
> The reason we did not notice the issue earlier is that until very recently
> we have been stuck on the NXP vendoring of 6.1 which pre-dates [0].
>
> We determined [0] uncovers the breakage by replacing the host/ and cdns3/
> code with the NXP 6.1 vendor kernel code in a Frankenstein fashion and
> still ending up with the same USB breakage.
>
> Running KASAN on this doesn't trigger anything, so it's not a KASAN
> detectable issue.
>
> Our knowledge on how to progress on debugging this has unfortunately come
> to an end. We'd deeply appreciate any suggestion or possible patches to
> test.
>
> Best regards // John Ernberg
>
> [0]:
> https://lore.kernel.org/linux-mm/20230612153201.554742-1-catalin.marinas@arm.com/
> [1]:
> https://elixir.bootlin.com/linux/v6.12.19/source/drivers/net/usb/smsc95xx.c#L525
> [2]:
> https://elixir.bootlin.com/linux/v6.12.19/source/drivers/net/usb/smsc95xx.c#L1045
>
> ------------------->8-----------
> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> index 06a4670bdb0b..7356801faa52 100644
> --- a/arch/arm64/include/asm/cache.h
> +++ b/arch/arm64/include/asm/cache.h
> @@ -33,7 +33,7 @@
>    * the CPU.
>    */
>   #define ARCH_DMA_MINALIGN      (128)
> -#define ARCH_KMALLOC_MINALIGN  (8)
> +#define ARCH_KMALLOC_MINALIGN  (128)
>
>   #ifndef __ASSEMBLY__





