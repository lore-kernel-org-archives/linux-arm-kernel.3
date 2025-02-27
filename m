Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C979C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7G8oAH/Ew6gLeT9TcrpZ2QKWMwxr9IDnpJF8qnubCAc=; b=lmfWb3SHjO85isHM24zavXP0xt
	L7e9cv5+rSOdhVKbGU+ih/GapAFzaiegFM0ZcUFeT+uMvS966El2dl3jz5cXT2uxwa/qRw2oMDfUL
	ZgzEXQXhj0TPa2dx0P+wDv1TseVe7po0VWQP59JPvZkw9axY19ChDxvFKmvE7c18HpiBIEFfPK8Ox
	DgPOqFy3GwgKZsmU3w3eGdIs1xLQB7lH0jK5NtJXn3CVxsAqgpUqwF8MF32/nDgWa6XoRBBtnPOvp
	vFMUT2+PpfnDgDhmkgX3BfQCawIx9lEkbwh1K3bWB5+z+RbkhRaHiV9l//fivCSDHYevJDq4ypYbr
	Y19T/CPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYtj-00000006doS-31rF;
	Thu, 27 Feb 2025 08:05:35 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYr4-00000006cui-2o6k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3Ho67NT1GGHYegZR53ey/yX0FU6wuOhlnptfN7e6uEYb2xmHGx/7Mxiop4URttsjFYnR7id2mnBMcUkVWjDsyVIbek8pKzPyBDe/wW8f4sv7uVbyNwRE3AAg9Pg/qMWnm0IDmHrooPYoPT2gmk4rVirif7viTsUiaw54vk/t/Od9a/v7Lmj3G/UmtbiktfabtNGq1++VS85WwnhF0zV4LAWHnW+OP9W4lFrLesfETsZ2RfSPtntpGPV/OXuyTFE/m+9csz3t6/ws7dcwrDCwWVvB2gnmGI6SsEWO03LK8nzQVT2AmWW4nfmq1Sz+uEHibEAtFPk6AxFvq3xWzGFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7G8oAH/Ew6gLeT9TcrpZ2QKWMwxr9IDnpJF8qnubCAc=;
 b=py6XJVbPUSi0DIqFi6ihw3j10QRxSKiVnAskXVFx1g+h9oRMHOj6kuqk0LtChV4JLY5C2Q96LGNN+4HjYMLgpf1hIrCZkbFRn84b8Ii7sz9SRlaiK4aei8kgw2nufQ2bcQfYDjDkA6fIscW5xt9oLrlpH1A9tCl0oe2toCUcnhm3VNI+nCn7TXcU7H54rN76VgFgrmKr9EJYDYjapUYSQoYQKG7ZweAz6UMoYnrgC6pMdmWlRsrC2cUC0V3mWIJVU5qHq/l97K4zP3a2H3hvFjcMCuxoMlA6n2DBqijZF2bhGDF6snXGjjaUJUhv6+qV09Z+LbeY6+71dkazUJln/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::36) by KL1PR0601MB5726.apcprd06.prod.outlook.com
 (2603:1096:820:bc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 08:02:37 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::99) by PS2PR01CA0072.outlook.office365.com
 (2603:1096:300:57::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 08:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 08:02:36 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B602A41604E4;
	Thu, 27 Feb 2025 16:02:35 +0800 (CST)
Date: Thu, 27 Feb 2025 16:02:30 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: arnd@arndb.de, catalin.marinas@arm.com, cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	marcin@juszkiewicz.com.pl, robh@kernel.org, will@kernel.org
Subject: Re: [PATCH v2 0/6] arm64: Introduce CIX P1 (SKY1) SoC
Message-ID: <Z8AcFq9bDuW0oiD5@nchen-desktop>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
 <20250227045236.2830419-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227045236.2830419-1-liujianfeng1994@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|KL1PR0601MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 86aff9b7-7882-4f7d-c66a-08dd5705197e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3WRHRP5kyJdhSG1LfbekWqssubqtz/2zKmel4f11ZmXSVfazHXvMOcbOe6+2?=
 =?us-ascii?Q?IqZvNjryLKw2/S5AbR6vNmzE3O9UPy4TQGhh5cGLc6dnHkoiMTXVVpG9+hth?=
 =?us-ascii?Q?cNhwRKfcXD0Eb72K8MYzVRbKsCU4zBxudzbi4gYIjmt+gEiW12SXhsDS13xh?=
 =?us-ascii?Q?geEpsK1N09mnIZPBQKGz4qAG7XkJ4Wn0I/9qzXy9QVK/fEaWmOhmYvAUafSF?=
 =?us-ascii?Q?d3Pf35xTDPKccmsq2JyebOEmK/OeNn2yhHb4LnfS2URMchsizqZMf9d+AAZu?=
 =?us-ascii?Q?tAlNkWkh4DVxLj6EAa0wZKANugiBNAJmOa4VJfxwm33QIZEDDbrqo97McD0z?=
 =?us-ascii?Q?CyrktcLD2ntLcFkDJmbHy9RAHrdiLJSniJvk7QsR+7kpwvQjHmOZNrQJFOOs?=
 =?us-ascii?Q?srB2BI1Bua6FtC40SXPvXjzoboVAIvPqQK09D/DoFeuOXJI1qr2uH1SxIQjd?=
 =?us-ascii?Q?HHIH1bProNEFtZmJXecF5FuQ2YLFbZxj8Ppq2314j04cag0b5ThqLukMy5Nu?=
 =?us-ascii?Q?I36RbpXVDltCnaEYC6ER0kh3QVo/bX3zVHD/vZ5lw9fT1H1R8ZrUFWyd6gty?=
 =?us-ascii?Q?URHSEsbZiCPc4eDs9GJKz4XGO1eLb5oZrFNGKhYnx+OR8hfBoyDE/pE2tDWV?=
 =?us-ascii?Q?+IRfYyvGWFiZ6dFytli6TW2K9LBZcAgSSSp9MwF5uh85sCQeoPI7JnC886OB?=
 =?us-ascii?Q?l49VwhB0AGGOuEjcYZR6+xYfeCBkaEJZlKal4ipXlbWqK+6TsJN1mQutcTnL?=
 =?us-ascii?Q?pZ1Xsix/XvRXhYSWqnfCnf7qrtxuFo3Z8Cx6OwdbeHhQgbscQ4B0Q1j0RNM8?=
 =?us-ascii?Q?NGL+x09MhJXIXOHLWv6p8jx5d5t7NgF5F96nubHfFYPPrvGLhlWBJJIvw341?=
 =?us-ascii?Q?zj1qnuZNRgsqk2zBbf64xAOZLQCJakyYGCN7i68HGzMIl93FU7DT20N0o+u9?=
 =?us-ascii?Q?PN7HHbbWF+Ct1HbkE74Hrxa7k6V2yIGnXZmO/hyAU6LUZmzWv2BpMORv5brO?=
 =?us-ascii?Q?vfbaMVZ2uYuetwzpOwPn77li75Qgjs1kydQJnw9yxCb7QmBN224S8s0x0xJc?=
 =?us-ascii?Q?Zqasr9wMaG/Y4OdiE8SGHOuhDTCYZukY1QQ1///yoCmc0QTYc0u/5bTAMgbP?=
 =?us-ascii?Q?rpYn9UtB1ZKylaeTr6eqB8duQ3iMxZiNGy/Icvw4Qs4EqNy7lEbDoefc6F2r?=
 =?us-ascii?Q?uHE/HfPj5hmuCKxmGrrz0Iz0Vfzb6Bu+PNBFo/vyXE85ANURiv6Q7H7hr0SM?=
 =?us-ascii?Q?VSL4h3Po7rqtfeftc4nciIEmckN1HDR+2zz4u/ETx6Yg6nPV3Vj/b15Rtlzp?=
 =?us-ascii?Q?xwmWfDAImeJVaWfSTgxpjT4uBjiWMQEBjfiMk6V+9m4P7yAdTNksnUoQuT/i?=
 =?us-ascii?Q?UnJ7wmm8DYjI2sBR6NiJZjj4TB3bp8ATjIjAlrFBGXREbSQDpEzLXxV5Y2fp?=
 =?us-ascii?Q?oChS16f+uN3SPs/inne2sSODsuuq4WjriDfwDUJqUh8Kz3f3sSy9rCw9fqYa?=
 =?us-ascii?Q?sp/RK4r0mEKsexc=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 08:02:36.7545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aff9b7-7882-4f7d-c66a-08dd5705197e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000250_708757_09EFEC61 
X-CRM114-Status: GOOD (  17.72  )
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

On 25-02-27 12:52:36, Jianfeng Liu wrote:
> Hi Peter,
> 
> I'm really happy to see the linux mainline upstream work sent. And I have
> also reveived radxa orion o6 before the Chinese new year. I have heard
> that CIX is testing vendor kernel with ACPI. And now the mainline upstream
> work is based on devicetree. I want to know what the upstream work of CIX
> would go in the future, are we going to toggle to ACPI instead of
> devicetree?
> 
> And it would be good to let outsiders know the plan/roadmap of upstream.
> For example collaboara is doing good job on upstreaming rockchip[1][2] and
> mediatek[3] socs.
> 
> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md
> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3576/-/blob/main/mainline-status.md?ref_type=heads
> [3] https://gitlab.collabora.com/mediatek/aiot/wiki/-/blob/main/mainline-status.md
> 

Hi Jianfeng,

Thanks for your interesting of our hardware. Radxa will open our
v6.1 device tree vendor kernel source code at the beginning of next month.
For ACPI vendor kernel source code based on v6.6, it has planned to open
at Q2 of this year.

For upstream, we will submit support based on device tree first, since
some common code changes are needed for supporting ACPI well at Arm,
it may involve lots of discussion. After most of IP drivers are
supported by upstream kernel, we will start ACPI upstream work.

For upstream status record for CIX SoC, we will find some public place
for it.

-- 

Best regards,
Peter

