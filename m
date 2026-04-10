Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80AF36B96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 00:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jzNH63cXzi64+81zKlydL78snXftsVwG9dQtRTRqjk=; b=pdEuMKZ6OwN+DwHcgM+U4ceJvE
	XIa7K2KwK6kucTZOLwLmormAztHGyP+ktPNUCSLQfiO++k1bs+QEegSxrv/b8iwjPbgcyeKhQEZ3c
	pCPLREvXcgjp1pAQEnc9qdLEQpSdSf8BEqgSBvU0pgIPv3ZPDz3SDLGcfJ6SivRCaru0+ylblm2lb
	8vXAOBtQQ6CBUOXsATfKX0/cUzcc3KtKlch0AkGZyeTA8j++fFtj/leYC63TcjnDnlv3+RjsINqYT
	XmcNDs06iA+bGBxvE9yNqmfCDa1r4sDB91OoOmyqtsa0J4QRCSdEkU2HCbyUvmZ7lNM0Ynxo75X0G
	M6GJS/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAzMt-0000000BLp7-2beW;
	Fri, 10 Apr 2026 00:05:03 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAzMr-0000000BLoU-0g2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 00:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce8XRyujtHZ53NvsYlv6L0m6X7DJn0t6SMIY0zIxcyzGlncHUs1Mo6NYbuoM4p5OJP8kfU9KNCaN2LlMxIvHQ3rODsu0MuNxgVQdU5p38suJdPy5AZrVkKMYyGK4lvIuwmnQVEJCyyZDhY5xg+ulQEWqb7IvS2qw3OvDLrBQ7Bq83LVC12+YKp58wRy6GB1JU90ofRXnvhmcVypsIiXmvq9GAG3GAGpS8ldio7qy0akahFUXja1mF6pGaDkSQHdykYd/g3j7b7nRFtydkKpLHhs291Jo5b0pqbtDqC5rmHn2z0uuDxhFr7iM324aPnS4hYyKza9X3k5rBc9mPGYFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jzNH63cXzi64+81zKlydL78snXftsVwG9dQtRTRqjk=;
 b=OiROGmOLduHoK1FLkwWLxQ9zwk7PVU7voY4h7UkAbJOQzyXGtsBDMzWX+Jj7FLanW4qCcndXa3/YHc6lOEiP9hmodNCg2wRUSSgU3nAXaa8ayz6Vztbw9Fn0jooqulfVf7Smm9hmv1M7p68PMbQ6HLyZEwW3GDNQaxKEzIlEczzFEhR5Wm0IGgpygYluU+ATy14ds9FCHk0Cthn12JXPSZn/16QIksEBE3xUOOEqp3jbPbu19mxgrOvg/6UZS9xsc0Olou7TLFEiIfbV3QcF6pOPSYlvBRpWx8oYxWFjMbCS6d3ElC8B6/J4d/OtLzGYzXKs6WWo+ralVR0mIHSaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jzNH63cXzi64+81zKlydL78snXftsVwG9dQtRTRqjk=;
 b=KQ81Nq9EdnhYwCOkCQSUYNnmhZUZwMy7f/OBYWQk3y3VdAxuvXOp/sJQe4OxI3dJUOyFrTUU6tKPAV3Ybv0L0uZw/LVcSz9ZTAcIsvA9BiSIpLi6qUJGbbRQyfhe+dVKmpugs1uAtiFrVgHvjH5jxQBHX4c3lUMrx9n8iNJfthACGJRJ9H95T9xrrfqUUVmrFG4iZJxq+zNW/YtF4fw+pvB2Z3FWnljt+Is4opMLVtVizwhJKrbClHys7mG+dv6h8UAIhme3urTzH68tFgFK6MSb63m1kNtfBRRSJh0pvF5ORCJXuOtA2L2Zbmda9vK0K/lNGiil/JUGQt0DoImZlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 10 Apr
 2026 00:04:51 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 00:04:51 +0000
Date: Thu, 9 Apr 2026 21:04:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v4 07/10] iommu/arm-smmu-v3: Allocate IOTLB cache tag if
 no id to reuse
Message-ID: <20260410000450.GA3357077@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
 <aea51cbf226d90436918dc09df5cf8f5c64ef8bb.1773949042.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aea51cbf226d90436918dc09df5cf8f5c64ef8bb.1773949042.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0472.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 60870588-0805-4290-9673-08de9694c990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: //DW6RTxJJsKooNXmMsXR3vPdYt5CaxIJWhJDwSyGtZZJNflGdx0r3Teud5vb+g/M0xICk878EfSPYn/5POxNFACAdIR9dwjHI5wCIkyvL55NKkI2j8YCSOGTz7kv7Q3ELkXieRL2nVvWOhB/EycwFc8/2uHaBQ7RtidFZGDvsnyb7ISMETyaI4/DknKox2cynhPmLpFKpsYvQs4lP+QEv+jo0VeAvtYA1R+Td8Dfl0rnpxSPwbf1mwgzRQNtsxCfMeFgSGutuIbWmeDegprlQd7TixIZPt6pYhU14Po3AMH+cEZHZEFFU6Qjkexsg2HHrf3us03up+BLpij+e9h05MBUCGhsLthCTDF3kpA5qhAPV2YQGjnUZe7WJ9ZdGpR0t6J2KPSak/AjI5H25KYq6N2jLQM74vdAmuEciy8SOiZwutNWZWZlspG5TB+3dQPWvcnviNx7CNRJ3KjBIV6ufc+oeinRB1HehMhhQRoCK8JWZEMh46xe7DJTWyAP3lvVgx2ZwKL26I2o4gwa/+1Ym/luzDB76waF0NF/vm10NbMLRoNl3+DjR6rdNanwxTeZ3uWd+SVIscjYUHwN5b20Vb+gnRbmB3vNrDjy2C3YaDjlTda7boGipsi5ax69mLPaL6gO0yqH5oxH0h28HdoYD8y9YpO5lObnEQoaHIJXIK13pj3Zsns3OU/N8XTmLyEpQwKqWSeb/6hXqTrtcjce9GQHBMmPYIWWE1Kcm00bE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkSI6bgpKXg1ZDt8MYTIovvl7o3keBVL3IRoettFyNt3cgDiKOqDpaeMFddL?=
 =?us-ascii?Q?S7krNHFN6cAdaGe9fYqF1AXk0N11ofdWgn2149w5V5zAYoEahYsKIfuWkTcQ?=
 =?us-ascii?Q?oLJAySiAeozftEspLpacQbkIzoZlyk4gmb78T4JT1Q+r8y51KVzKkoVbKKu0?=
 =?us-ascii?Q?He7muk88iwM6r2k18aeY/tMvHmtG8pUk5MN8JbhKEQcoJezdktwUimHQq1C6?=
 =?us-ascii?Q?ZW65ITJNp8+/kstnq9TFX8SXhX9IxFVBg3l6LmwWZnttI+9palGl18douY/I?=
 =?us-ascii?Q?sshBsmRS77ODhRp687MvffZadjJQP1I2kuPe7Rgf4QIOmb6aJahGZ+VzPySm?=
 =?us-ascii?Q?SLelRr2fpT0IYNul93tW3sYSGmXC3htwK9WmAR3BQFtKYnh+cnd1bXxyfklU?=
 =?us-ascii?Q?679R3A17L7nciptliZqyd53tAWALK02Q10maBpJzgKL/bf1koVu6CEnu1tbp?=
 =?us-ascii?Q?C1PLdr8qrzZv03M5zHiEBwbFXNWXZEYo3XjTymU8+0YX9MZ5+Qkt4ksnFkIE?=
 =?us-ascii?Q?DiLL3XJmqTWiF5PoRsbx3HovtXnKolIf1+cRgrr2qpoQhRmLk8IUEAIqIkmr?=
 =?us-ascii?Q?RMzHGXbaHV14Y/ZpcqLHF5/agDVjH6Ee+8d+EvWljRqcRb6dW4lpyXNxEXgJ?=
 =?us-ascii?Q?u5gMIERZELdrLd1to606VFPKcwO/7C8vIvubdldwYX/XF0n2PNcoyz82m4mb?=
 =?us-ascii?Q?uanG84Ea3idmWIM7SNj+bjKbTMeJ1nzrURx5gu8/c6jEyXPm6XmxVlCucRf8?=
 =?us-ascii?Q?833XyGQ+EtmQZY6qEIMQk5exyO5V1oQsH/PIGqdDz1Kzl18nU1x70Y48vsLb?=
 =?us-ascii?Q?/oropjxepCh6EV6tgNYIW+1rh6WtAR7taTs7TBDZ/VHbmYQrYF6tpkcRaVyk?=
 =?us-ascii?Q?dF2gXVkTcV2kv+FSieEHvw1+2tH/GsYrxU91Ro/3Z8p3a1AhWYrBC9GVL848?=
 =?us-ascii?Q?7VWVIsBEkOEEIdmJyGuiZj2KjzNZzeUK+yE06ZhZVPuFrrRaD1deirltZoYG?=
 =?us-ascii?Q?3GDHrwXNXriO+bFqYSZsZPJjgi3RUP68WkO4VSIXE+EYD7Ro2DCJQlZInNPA?=
 =?us-ascii?Q?izUZ37Uedb8SqQUWJ2GlRHxhvLL3QJ4CvlkxXKpspj/ueO0aXrbOYUwSfL86?=
 =?us-ascii?Q?8Xn3eRC0UX/pxnAra99r0ryA/HGcUAeUxVW86ub1RtN9jiTpRpASOdwlaiKl?=
 =?us-ascii?Q?ZG9wbB9VrNMaXEgghn1WgfLS2hXEftRyirQNO0h/WyytqeOX1/KYjqBttlqY?=
 =?us-ascii?Q?MUHOBjGLpUeGy6evmeV9ftKGdfR+imMho2qbUVKko2G6SXzjNLJe20qY4V23?=
 =?us-ascii?Q?DDfk2EG0BxpyLIdF+siB8YuzWu0Q0sqxKZfSc+57QDZDYfykUz+83LZdVpDR?=
 =?us-ascii?Q?7+PHeT/MR6dANPHeFLUOSb2/lF3z1em6RT7kCXccN0VKEAxikG0m6WRI/Dtq?=
 =?us-ascii?Q?kkaSOdOSw36AbIqdam+6qNXtgakXg1CFVrzYuMwPrgv4m0ZYMwAOyeOV20+e?=
 =?us-ascii?Q?EVms7clKFwmFNEtKcEa3MeN553eBPuW8vLW7gyePG6Rj5vLmoYNUXycduOmz?=
 =?us-ascii?Q?JXvxS293kQ7CI4xtDus17AlOz2sYUUHybzER3pRxf9bh8o9zshQEsn5lbfYY?=
 =?us-ascii?Q?ygGScmxXlvBb8FUZ8o1SgjpFh9xyZJCTjeJal972w0OMq0viYaX9EltKfVrp?=
 =?us-ascii?Q?HAbPriAjVez62yZMAYmPo60LTPh1y4ENlowHE342Dhi76eGR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60870588-0805-4290-9673-08de9694c990
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 00:04:51.7036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyUW0q1kerYHRxTXPkZwMMFPkDatNQuQjl1X2GYTtCOZYaftDOwCXmrpCKnQeikw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_170501_204275_15DD5B13 
X-CRM114-Status: GOOD (  11.78  )
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

On Thu, Mar 19, 2026 at 12:51:53PM -0700, Nicolin Chen wrote:
> An IOTLB tag now is forwarded from arm_smmu_domain_get_iotlb_tag() to its
> final destination (a CD or STE entry).
> 
> Thus, arm_smmu_domain_get_iotlb_tag() can safely delink its references to
> the cd->asid and s2_cfg->vmid in the smmu_domain. Instead, allocate a new
> IOTLB cache tag from the xarray/ida.
> 
> The old ASID and VMID in the smmu_domain will be deprecated, once VMID is
> decoupled in the vSMMU use case too.
> 
> Since invst->new_invs->inv[0] and invst->tag are basically the same thing,
> merge arm_smmu_inv_flush_iotlb_tag() into arm_smmu_iotlb_tag_free().
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 63 +++++++++++++--------
>  1 file changed, 38 insertions(+), 25 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

