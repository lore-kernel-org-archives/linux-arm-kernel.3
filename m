Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4792AC35FF9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=; b=D5smREhJOB90Vvi3jM4L4QQhyE
	NH/cdg8aF63k7TGmXNkcVJKiqABiFA+e//CDYKmvO+UiUw9xVLFzKcSj5rFXGNjTB9evfyrLkozrA
	24x8fEti+a1ijoK7XAMTV9E8qsLG53pfUE2BnnQBZb+Fg935+TjWk+xzG5EOpN8QByf4P0FvXBXWo
	3EGyta04crnmty8tysetpqy++dW1aFKVTwGHczOtxUp1qVserwstRvOvSsmG5pAH4DLCTHE8JC5Lo
	s6vN7Woz93d5rN4r8bCScav8FS5oYqW/hrRJBVncoBwKD5yw6w3aW9oiQz6HOvOcVWO/qPLHqkx1i
	ghOpE2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu71f-00000001zGq-2aY3;
	Mon, 17 Mar 2025 09:44:51 +0000
Received: from mail-dbaeur03on20619.outbound.protection.outlook.com ([2a01:111:f403:260d::619] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6zz-00000001ysQ-0YqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY/dXggouxNVwOT1bu2TI/cwuJfAyRW4FQ3drmLfp/272oJqtH/oa6uy3SmrKtigPRPiP7TJZZ1zq2lidAmaEJeI/5PjJM9kpEfKEYK3gJqEsAu1AUDmPLsK7wYH95OMhS7AwlbLAJh9IcmhK/ANX/KuIh8veuFsSbJsHG1Tt/Eaz+K3s015I7K/tT+oF0kx1wNnIgB8wOxCjYR8JyOHEdULx/CYIa6kEgNXsUrh/hmbTD5f5b5TM6BhHUgxOrXwMArFu+ZBrgbOJc0Sdghi3I6IZFFZtePRqnvSoBaeY5/hVkByq7Rz2notAi7a1wG2cdcfGaiEmmigTJL3PeYMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=;
 b=jvsVKFG//LPZJWBY4+Kr+vrg4aULoj4r4VLry3K2iXyd2aPd7+JfQrfSCr4m1TpARfwn7FM6p2r0F8Gp7wIfQ2SEvB4HOyag4wUoavFgHd6BD+vh/s4BQK+/68Ox955n53R85jmio5Dep2hMVuGM5HJrm+mOARhqadaAuwvamMck3a7w6YecTgKHQvk4eYmDzDWrPzfLnVjjESFtibE1oH5EBv5jSGThzouyoKwVu3/N8uL2+UbDTKSK0MsGSAxVi2Qv8ng5vCsOI4jZuZtN63QppKQTqRhWGoq1oGnNKdoxA5gzAfcp9qCCo3tdK45k8sQk/qXN/XurNOtxum+P3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=;
 b=P0yLGz4m4IEs3lyowi3Bs5+GhE4yJxu0Wg+Igj8CXGooa9T8ni9LnmDGex13kW1zLpjxvt995qgGUr1llR24A62dOMHv0jMRpnLpFd+0uR5E7iBznbcWCVB5T3POHup1UYPx9AQFgIPLrZVNHILz4E3w3WmT6s/l/VOz+BcHE74usNiLo2ro+H7C+jkm+j8S0DkizJ4ob9G2beRAb+tGQwvdPt3O2c0YV6/luTlu3LuMXQIUuI02PA6xKXRWyI+eSK+YWfNFMOObEhDORvL1rw6O+0iR0EJV+rWbjsIrSM4+JZQR2QoIdfF6rMrsOJkWqkELQq/Ejbn7/tIcVTKDKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB8060.eurprd04.prod.outlook.com (2603:10a6:10:1e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:43:03 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:43:03 +0000
Date: Mon, 17 Mar 2025 11:42:59 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 03/14] net: enetc: move generic MAC filterng
 interfaces to enetc-core
Message-ID: <20250317094259.b6mwygvr75lxgkwh@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
X-ClientProxiedBy: VI1P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::36) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 32938dbd-f18f-4324-162f-08dd65381c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AYNL2RIeYmeiaE8LNOPOJ1FVBpIktGKEIe1iVDGT5cfJ8W97etArmrXcrjuQ?=
 =?us-ascii?Q?RauNnxwo8kZMKKXBPDqGFntRxRvNIum+bl8CqpOfzEbZm/uhHjfS2KkHwNJg?=
 =?us-ascii?Q?/FsqS3KddkElD2tCvOv+ky2j4n4K9YeSgloi52jgSkhq1ERv/jxoIF3GWS7Y?=
 =?us-ascii?Q?LM68notIef92MiEKpnoKWUK9LkRlFocH3DblLU7G0wKsJMX42n91nVNFvXU1?=
 =?us-ascii?Q?Nkt20ekxDXDIzLJogwjmuALEtiUcAgSSGdjZYx2UrXvvx+Rn0VD9ATPNsjSX?=
 =?us-ascii?Q?3xl8fYtCNQ/mtkEEv/8dWCseSXkPYIZqRCaEFL9hqP7+7rkiUxs4yhjfebhm?=
 =?us-ascii?Q?5njOarpAoVCcnGbfDQM8z5pUAhx6h1jsJcnas1r7EJfzabCEMt2A8kBICiOb?=
 =?us-ascii?Q?Cze7VaAsp9xxEhQyXJSjsz4gcySNz5ucWmyyeJ1BFfSX022Ecm0xxb7pbzqg?=
 =?us-ascii?Q?eaL1Z7gRmsIbyh+XbozMYoOMsGAl4ZgJoaTvkkhwYAs6YxSwSwcgirlkQrEu?=
 =?us-ascii?Q?KSOa1I0SU/nS4X4Dz0lBizwsmavnAgfBlrUx/Q8oM4mn4xgrIV6Fbd/YTO+z?=
 =?us-ascii?Q?ejW/8I5QKHnS/HTwjTM4n5JqTF6ppGXq6u055pOsZGT64AM5pDmsqfibmhCN?=
 =?us-ascii?Q?7B4R1Ts8XQO9brRR+zovkljL35XzC/mEqDIvibcuPwmkOpP+twroC3dZIBga?=
 =?us-ascii?Q?eqivV/yyjXZ+Ehvdy7dORSoHQn6G3Yv26t1bLvyJxoLRG58pFuEic9Q6c0O0?=
 =?us-ascii?Q?9uXT3xre6WlnYT3zWbClLX8J5bFqe0iGtSNXQ++HKxRyGg3bZ6KB57htduDU?=
 =?us-ascii?Q?QJIuOs3dd7ChZVzQp3z75yP4+jAkYMDvHpzNEcDQp1Bf44MYKHYag0h6jomr?=
 =?us-ascii?Q?wvXUKrdjAx5y8WbIThxpEHXWi+a8CVu6IocXAOVw+glQx+l562mIz0wRKiSz?=
 =?us-ascii?Q?TNu1YXKgtfTwFeuyR5LA4ReaLbytmZH59Mpa//2HlsEjbaqcc7LiQD6D5qIX?=
 =?us-ascii?Q?bfJdkLLg9/fzLeoJJC23fn7NTsgKR0yqaDspnhNiBbKU+QzAzjSahUnV2a6k?=
 =?us-ascii?Q?87EdxpeOQDg/gBCKXv/4g5EEiPq6s4Rq4rzp8ptSGe1gqUhLe49aVvzbek7b?=
 =?us-ascii?Q?/i40Mo9GxS2DKusuJsNAOys61/iNTU+vf9w7io8hUWcAMbM4YcuVdDsrOHOZ?=
 =?us-ascii?Q?zBOPuxuO3nuvKTsRns3/XJeo73VH2niuCh+8JgBOvr/CUTZe4Ecq5eU4jvTw?=
 =?us-ascii?Q?mzdJ99QoSlNfTJmpW4jbsPLfCS1QqGQI5Xft8Hokc4F1Bda4Uupxz0GhlgBn?=
 =?us-ascii?Q?O0lgMFbWXSrNPseH8ZWk9Xp1YHglhWgj5hnE2cb5rNe7ScEu1H7IspPUqPP8?=
 =?us-ascii?Q?4TzP4znOfbMLmPnq+z6WHO0dcxUR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e69cWLOo7VN1suVvA9bYL2YF0rCDtDAVIiYISnrXQ9unmwle5u3FItP7i0sh?=
 =?us-ascii?Q?AjZO+zSyOQ/f85DD6FmeDj0TQppvt3HsWwrPR6QAdKadZz1ivlOt5Ej1AVOA?=
 =?us-ascii?Q?1rEDa4dZyPcrlKb9P5Vk6JBjEdpU70z6eRvJOwIoMePuVIy+ZOt8f5FLsS+v?=
 =?us-ascii?Q?XnZTAPgA8j8qnyLasiKfwGPn8RNzjGXk3YaFYtcl7xh5NTi/y4oNty7bnXGK?=
 =?us-ascii?Q?WXy2XK1fFPE5rSlXPb3ShfhC164SUT/F/KfqsBsoczCD+SQMJZ0pszgT/7+g?=
 =?us-ascii?Q?zim79PmlS2TeQj03zs/k5lsKHzkQt/CKntiXa1qR5iUR6phsgI/bfXaNf44+?=
 =?us-ascii?Q?HxWQRJ091DsAnfwOPOXkS/0Bp3YGsVgHBUG9ChLD3z8MJAJ+TFRKOoya6OIh?=
 =?us-ascii?Q?VCeu3UFaMIEiQv5/k2u1nLNp3rN/Q/2SOu1dk2NG4APadP46FjBA+gkc3/jz?=
 =?us-ascii?Q?oZq1Ns6KJvCbVg6/D3jeu1XvYgWNpYEfaCMZu6thstMXLE+bVRJu6B2dXlUW?=
 =?us-ascii?Q?1yji5Rkxv5JmvvmNy22tfLC4l/FI+JayYAsKA/iBA9rD7SJ3pDQVTeC+yx+r?=
 =?us-ascii?Q?dZoJ8aeLPADSPxjonY1W/b/3U45e78wLp4ExIpnrcuyq9MGsgeztTkQk5W1L?=
 =?us-ascii?Q?nPWmmmgpxH5VF2v2CUidgz7W69vhyb2BQyyJniUyg3my7YSJarUfVH8Ww1Lu?=
 =?us-ascii?Q?X3Uf4wsbfdXRHAjycIHzfTZluxt54SD6oksyCJ1huMhFj4QGU1aWqW29hODs?=
 =?us-ascii?Q?msu04/HIaznbT79e8KQszBi61lDmKnoWlefHiIK1glnyqz8bhORwsJoRk4Bm?=
 =?us-ascii?Q?zqkxwLB8ZW4/eDxiBUbso5SRLM+ocXFzr4QehmQ4BKxVAOZlsqGBdCpaSDa8?=
 =?us-ascii?Q?HgUb+Yknh7S5Wz6lq/N8LQrlgGWUV3y+ppcWVT81sogOIAJF9Lm9Ualmw/ac?=
 =?us-ascii?Q?6mkOWtxnidkC4A1zO2gmsgoam3Mwx+8JRJjizJ0uze63rksdvsaJTAXpaUJY?=
 =?us-ascii?Q?51yOv3oPbmVcI/b+mbPBexh0YXFFzMkxj0EbOrGG+4gZoy0E0iVors5pr677?=
 =?us-ascii?Q?OybQQaVsfjtv1vFOef6V2nCn/DNcaXG7lZIFCRmNqXyFEgOZHgL6jPPbTuFT?=
 =?us-ascii?Q?7W7qqIrUuH3Pq3w+JsbWrVEEYZB5rVwVlCYDjBBo07HfPOGp8GKy6dI5WyWZ?=
 =?us-ascii?Q?Z+Uj5pZCmXs1n/H/Qy5H6FjYv2SpqbzhjPUj9L3qBlcGKzMxOLiyH/8vrp7B?=
 =?us-ascii?Q?U++ykKVZ1/Er80wapFJDkj+jV36Fi5MsV/EzddNIR8rvLOahx/4blMm1Jc5E?=
 =?us-ascii?Q?Oul5V2ENoRpE1k8wqYySeSMMAzLxxS4NTYZEg8De5c1M0HjH025S5SF5Gmvg?=
 =?us-ascii?Q?Ok2ip/4on2po1qAfouJcYNOo96YeII6+xjIU+2bxy6fhCv+PsITix5bJigTY?=
 =?us-ascii?Q?3JmgmkNqAnk2yToUdjv7INS7Sie+7vCQMwL4A2Icqfafm+jFP/8i7bQfAVTT?=
 =?us-ascii?Q?XbnQZOE2KcBpHzRh3VhNusoedsiefiVlfb3yqsUQUYyCFgiSWsyD4Udxnm0K?=
 =?us-ascii?Q?fMOc+7Q851wdj99Ybl7VITrGp/oGQSTylvJ8QifS7/Bji299XL9v83i9vPQy?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32938dbd-f18f-4324-162f-08dd65381c8a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:43:03.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsVdy8OapEo3M1lA4WGjEKrkUc6OpqPfmmaozkU8MBJGOBYx+mBAqOVPPYw1YR7h9z+o/l5DeGKkAoxGmrGE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_024307_174675_0FEF1166 
X-CRM114-Status: GOOD (  16.21  )
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

title: s/filterng/filtering/

On Tue, Mar 11, 2025 at 01:38:19PM +0800, Wei Fang wrote:
> Although only ENETC PF can access the MAC address filter table, the table
> entries can specify MAC address filtering for one or more SIs based on
> SI_BITMAP, which means that the table also supports MAC address filtering
> for VFs.
> 
> Currently, only the ENETC v1 PF driver supports MAC address filtering. In
> order to add the MAC address filtering support for the ENETC v4 PF driver
> and VF driver in the future, the relevant generic interfaces are moved to
> the enetc-core driver. At the same time, the struct enetc_mac_filter is
> moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
> PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
> MAC address filtering.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

For this series I don't see any VF implementation of ndo_set_rx_mode().
I don't think you have to move struct enetc_mac_filter from struct enetc_pf
to struct enetc_si, so please don't do that until there is a justification
for it that is contained in the same patch set, and the two can be
evaluated together.

Moving enetc_add_mac_addr_ht_filter() and enetc_reset_mac_addr_filter()
to enetc.c seems fine.

