Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2750CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgrYbxcsPAroPuIR1EfyU/ZNhRuWJWPfjiodql2m4Vg=; b=XoYJ7efbKww+OAlYyVGF7RwSvw
	UO/CCd78HjfBtAy71FYiNrgduDwR7SjusqbZ47+CnP2pa+wkkDpfD26O8FJ6yNfxVPsGzWYnxn1pa
	X5xPPUO6U0erzOOAJ4E0KGsAjbHFHL04DtNbeqBRcvqLNA+3RmTG96hNMH+xpomkZubENSMcGUp/7
	iBEnD218MKmDqe/q/oWzfOm12U1+0tr2bqXXsIHMklTa5/w6m5uzT6mshD2lnZ+pInRX+WS0sRq5A
	kz+HEfKzHkB7P5iwwwGN6wP7Y/Fb1lHg6TKVa4/n2JGgypX3z9hgs9zR+HqYMc6ZWNZe06REV8cVE
	W8VR6QDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kJA-0000000B71M-43ue;
	Mon, 22 Sep 2025 17:26:36 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kJ8-0000000B70w-32K2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAZc/bNIZ5dFPMSbrhB5r+glRxX+D7ZfhsXTLy85yTmjgZ6Ak59dsuffDWNmGUi4hsKkugu3T1aRaabICW/6EUTIt8t8AMLDeoeUieeWrtFMTipZi26XPvXraK8r3WwgKbFaTunGYkfopYo1sBYE0vUXvDZ2SLlxL85/aNjrIvW/m5VNbMsL2TMgW3q+56CI4yuOq85rt8qBcCCvMoBCPKkXjYbxDC51hLFrPCRvv/v0lmHxM5/uqBzAzkGF2OFHUA2Yp6Ic024g7eX8TK2per/c5eFoLrg0oIuS4vofv8EWbkTg8ihqHzKvfn5FPe8r47DsbifBNhtSJof6HbKwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgrYbxcsPAroPuIR1EfyU/ZNhRuWJWPfjiodql2m4Vg=;
 b=X3DjItMhDI3ChRc5vYytflqcH+saJDBo6iq6jTLReRBs+/+aWRz0goNr9ptDoM8i/3qtIPzifSKmQqw4x00FvuYt6f7svjfPM/Z+WUfqXn3KM0MfL2gtF/o4yoCUThRCg1egsSls3qoa43O0nxDpdvXkbUWieePPdO+rOAa7L1BzJYAJrnOwhp0truUB7dAKDloXrnQjF6CY3Ypn5yfdw1NCk7qLKs55R401JjwBlCUJ+QGTn3wDvMJ1qhc8CnIPNIFrqV9dSpVioIp8bfYo8mVlMP0hYKt7yutpKeSRLXdXZ1er95YivatiXhB4rVPX8PWYfLcC7kUWNGKnb+75bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgrYbxcsPAroPuIR1EfyU/ZNhRuWJWPfjiodql2m4Vg=;
 b=mNA9SFZJHHkUD0sVfUaaILsnjtGlT/+O2BVK66lI6Puhs7w15S9oJ7pADNO/zpO9bGl3KEduaJ4wBjNz3qLdnlF3wUtAWoVG0/CvyAsPP6Z9LS0elJa+QILtUgrG9kEJKbr4OjSodCq3aWXIVmsBuzYSx3XWtww9vHwgdjVGMgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 CO1PR01MB6600.prod.exchangelabs.com (2603:10b6:303:da::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.16; Mon, 22 Sep 2025 17:26:27 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9137.015; Mon, 22 Sep 2025
 17:26:27 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] coresight: replace the void pointer with
 coresight_path pointer
In-Reply-To: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:26:18 -0700
Message-ID: <877bxqo0ud.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|CO1PR01MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: fefbeb46-d89c-4f47-35a2-08ddf9fd2927
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X13/vbhvcCzCGrI2Esnuu/E2w5da1wLdVSXZi5nlFZMTIZQKzJQCGF0TMjfE?=
 =?us-ascii?Q?Kr+VH3nhMmhaBZc5AXZc3egC8WIxcAQSJ0z80HTD7pYWJtOYhtr307j+NVoY?=
 =?us-ascii?Q?V0JPmACKwOH2EiZQflS92utwt9pRuqm6Y3rNoscWfQdLWd52k2nli7vVPwsU?=
 =?us-ascii?Q?QdAo4uMnwvJb6iu/1c4P7zb06+FSPwbbgG0L/e7dlRvPz18HfGkBbG0WExNL?=
 =?us-ascii?Q?Cq4H4ucE0Kp+7Sr/6uJNJWgzOFFNkj+Kpu1ntSLeER6fduLSzFhkZOiuPfSu?=
 =?us-ascii?Q?Bfm13XYQKqgc6mf2929B3+SesXOwKa9JH+SdUHSqGPsbBncd6SdrSpiLbDlG?=
 =?us-ascii?Q?FiOWmvHVtON1VEjBqgry08Epc1QZsSzBZCAn0z1t8tgcfNokmXSMNVx5npq+?=
 =?us-ascii?Q?T2IJyKokp5pjIRxskvTo5ke6fAFJacN05388dq2qdicqXadm91dXWB7EJaqE?=
 =?us-ascii?Q?FEgDIcc2BC91OvDSMCVEBroFA/QJ/3AIm7e0yGP3efeMOwTX4h+esywyWyRL?=
 =?us-ascii?Q?rZcl7qhRHgDZIllAbXEBo/3w4TWQTfHHthpyzTD1683Vww4brlOqLwc7WJwW?=
 =?us-ascii?Q?+VMSu1YekqaEDs9JcEESg29opiU+lMcBNDh5FhFW11GLssmWQ67xKKO0xugM?=
 =?us-ascii?Q?yGaQE8z7gzICAqiOUUl/UO3ce/UxImYcOwspIVaXza+NZ4hDXGAqwaoqpDZr?=
 =?us-ascii?Q?EQuYcUSkStu76XTXZNDaRBp5YIiKveBsyJ4y74fWdBaalaFnViyYQ/g4knbn?=
 =?us-ascii?Q?HZ+BBXXyI69aMM7zGqxMFY3pXInDiCIrbVxXQLxrgVgfFgV7tgcR3VqqjPCB?=
 =?us-ascii?Q?KkeD31XT+dBRzjP25Zhilx78V8y+qcVHJG3CYkEvOPtzIl3w5Vx8zjS4OTAA?=
 =?us-ascii?Q?xGWSZj/3CL+iRDGFsMhzhROZ1TbGsBDFCgb7tvJ2XVR2HWHGxdWM1Ql19D3D?=
 =?us-ascii?Q?H8va5agtzTgDMLeW1sdIdKgcpM/vL3LwL2M/QbfKYhGTNR2ngoSVqc4bafVS?=
 =?us-ascii?Q?EQBs4+4mgJemt3XV+dNFCz3qe5d6M3Qi+9cd7NgV2T2RvglGstgjT18N/Ubf?=
 =?us-ascii?Q?rzGX91l0DdXONvlsvl0kAldmJZbl3GY1HbZoANvoVYPvMsUHSVS8Rf0ZZkCH?=
 =?us-ascii?Q?B5D0n0VJ6Q+JjFRk3Y0nF8bOFcy0VufyaS7sP6XID6wgx8tOlOUk7qIwF4zJ?=
 =?us-ascii?Q?FYInzj8/GQ5mFJmAPX5H84tk6ZIm+vIBhddKuRCagZR7mCZkRMYY0/NUv5m2?=
 =?us-ascii?Q?QjWtWkTC7LzgLg3xFN3jwQQ84IMlwj/G4slZDiluNWqbea9ehwxRbVt8jGup?=
 =?us-ascii?Q?9xYES+kCFyYVgmlP67aXi5UNKjP5HTDsumFs8blJF1FCG5kC3OT86Tb+9PZ7?=
 =?us-ascii?Q?714BFCv09tVHBwKS08UNUNmunBBby8p+UxJ9KJXtAnWGZNVDiFEIe6z2/+JR?=
 =?us-ascii?Q?+QNjS8Tfu2WZGPgAoQmB8rKzVd6Ti5UXm3l+16z/QTOc8MS21MFQ1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UV2qOc8J9hOcFRfharBIW5ZszHPPmAFRmtKxHTINSEp7nLbTO+zaZMxp3x4R?=
 =?us-ascii?Q?Pv7Ivhx2GebESkOiv2ZztdnYJ2AEED57u+n3UNgjDIPRCOiowO+fE4KeHFsa?=
 =?us-ascii?Q?D/AoZOwNV/Sv5621wYTpL6IcJtBZSg2vavtpIkjKqsXDyjUdPFQYV3aivefj?=
 =?us-ascii?Q?H87ksIQPIYkIaYzou75xf2HV45753rTcWkw7NCKI/XiQRgV7LrrfV1j8QUxu?=
 =?us-ascii?Q?bCqyPCJe8msCKLcfD9l/D1987uyz2lu2Kql2TyZxXa/abaURBoo1TlihR/Vd?=
 =?us-ascii?Q?OdBArkVkfhSqfV6XPGQt4AXYYgB10cj5AWFAqLUdboFk7P7ceZx3D4859R8b?=
 =?us-ascii?Q?Zu4oSCC71ZREGCPq0u33aWvOSF0GjJW9GBznqv/omxt9pq+OyBZsVUl5HY5A?=
 =?us-ascii?Q?h9UPMBDjA9hrwVc5PoJ8W9L04YIE0y/Bpl+E2ZzAGudC0yfCJ5YL209Q+xir?=
 =?us-ascii?Q?sUA5G1VhrsSeR30A4dGkixQVsurSxIpupyE3pHzOe4T3SqJpTvyylrneD5sF?=
 =?us-ascii?Q?n0AHT6UP9CgRbPkEx0FSM3o+A530pJOThaBxdjjn5HshjKW/khJrwXwmYntt?=
 =?us-ascii?Q?+EQHEmhCjNeiwRuXMjMM05UIjDy3XF01sTbyf56Q2FNPj/ypz9XY0ULekynb?=
 =?us-ascii?Q?EvwkrxpIohxLlDtBlvpnaqFyLkV4/HSGPwWrp4hu3ukWrty49HarLyebPxX0?=
 =?us-ascii?Q?WgFz0fiInE2dVN5SgiYHhiCXFyiYk8RLt0ba995VXLvtB4JNUY4iI7E4kgg4?=
 =?us-ascii?Q?Pp4P7MgVapdt74I27z90Eyyn1BIP0bJ6mR0lSMSyTB45Xvwq6kJ8SnplEWSp?=
 =?us-ascii?Q?BGtzh9qx4+5PbEcIVzlXzD+hmWNSxXgTyIRW79ug9jkP0U8M17rsXsg/GVPM?=
 =?us-ascii?Q?O7+SG+X09V2+mTdXYoIs32IMwX70BoeIlob+mDV8o7S7orWWJIA/dcCUphAw?=
 =?us-ascii?Q?c33pp7TFTFJMfJ4AQR54qqNs34lHCEsgPdmCQVLTrJolgOMI0tcr/fyQWJb8?=
 =?us-ascii?Q?23eSH9vHTvukRmcCA5IrlhOVDoQjVWzj8IHQrB0d108kNtHY5CwlDmZq+xZ4?=
 =?us-ascii?Q?01sbPAo8lChrzdMuMDRztvy+vp3SX9ZQr1llJFafZOnsrqjyHsEc7WIf3xMY?=
 =?us-ascii?Q?iXHYQnaLVuZR+VvXgmJ6k8hcbuExrKIdETzJZNz7i6YFbn+V6SIGOEzQLnT7?=
 =?us-ascii?Q?mdLcPY/U1VxwHhWKezEzHGbsLfcCwgfLWo9ItMF56qw/sy7+ECTUNdoSJkhe?=
 =?us-ascii?Q?f0VHmEtyN4L20XeEp8xoFe3Y4Vn4dAbgbSDFDEcJriBJJiPoXjZarmxXKVT8?=
 =?us-ascii?Q?vbPTfg9F8jPobk+biRqlsmlQJgy6Kz5h2HhbJ6pbqlkm/TCkeGQ57Uklr72z?=
 =?us-ascii?Q?39VjYfmUG4yfrGR+onZb2IvCwX3UMZjn6hOjSMDPRjMb8crS9tkStXOFW7g4?=
 =?us-ascii?Q?t1pSlM0s1bC/oV1f+q24Bd52BSF2Lx0M4d1J9sCv+m2ZIku0dYQULJUdxnko?=
 =?us-ascii?Q?e0IshRmN+k/tW+bOMlLPp44S3owm1XkytMvNZxPTF20gHXh2hcUyLVKPnEE0?=
 =?us-ascii?Q?yswaVfOCsEmTEQVWjsRqw4cR6hVdW3Fg/H6YJkA4oZ+/k+D5D/HiFaBh5AsQ?=
 =?us-ascii?Q?gXCWFKHp1XoZEzJq0WzT55U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefbeb46-d89c-4f47-35a2-08ddf9fd2927
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:26:27.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LvOs1KTB3SjhJHNkGEV8VZma2O5Nq7kSDgF4/mKjKxJppzdEvUG2rnBHcqzm1GcVHEjEbwktm1SOCCua1DMG9mmL2FTjAzh510F71/ggK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_102634_775000_58CA1509 
X-CRM114-Status: UNSURE (   9.09  )
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

Jie Gan <jie.gan@oss.qualcomm.com> writes:
> I think it's better to explain my ideas with codes, so I directly created the
> patch series for sharing my solution. Please let me know if it's
> offend you.

Thanks, Jie! I'm not offended at all. My primary goal is the improvement
of our shared code base, and this is helpful for that. And I agree with
you that code can bring a lot of clarity to the discussion.

I've tested the series and it works and fixes the bug. I'll comment
specifically on each patch separately.

-Carl

