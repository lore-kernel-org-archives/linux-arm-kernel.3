Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5589CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B02Ax93Z1yuHpqEb94Gq3NGS0+VHotmpGOnzFWTGwjU=; b=149FTKri9ng8RZRAs4zeoLhj8U
	g6mjYnhbVztRwwO21wlokZ45nyFBeXdOaB6icmCWVrSGqBn/5XEmVygspmX5lfcLe5s/nzd+q7Wje
	Ielwlu+DnSpN3dH9mifZ52pL0fo6FGIj5W47iD4EMxcpvDuFPkjW4ITZ+jnXTlOBhAObg3yWuxfSS
	vv7rjcUGAutGVf/tT7j7juj+kVZcKd0ykMjhT2DNK4TeeWXHPwJOunWhY6mgt9ulcigytVpfMscDd
	EwTobkE8Jre+zlSViQu95H8ngKkve3i0Y/FLJd//Fiv/pKupDw0fPbqkAc+nnYTzm2SQ9zdEkDTFG
	N4hQl22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSf0-0000000DYsJ-2NHX;
	Tue, 02 Jun 2026 17:12:14 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSey-0000000DYra-1CB2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+pnM1DX3Fj7zQdHeffYmXUKxwABsNRsz44H1NC9UYT0ALwoDESAPsnzrRPNT/C69ebJv+JxGNrelg8dq6Ll8x6e/1luTfA4hmtzfV8UraNl8vBAIHdxNSfCKh2ypluvJ5gccfo29xBCr1vDBLxnFqoRkbsdHW8/xnNtKKstvXxZuvzOk9IR8iom7+g7iytbHEQPFyadaB5bsBytZXgsHeJ7aLCAjWsvkIVsDUmDsrWQ0xuODxLc3sgmln1JL6l0n0zm2oT8Ap9xIw7nfz0aUlS/asi2GAVYSeyj5rAZ9vpe4mh1xBZ3TtJaaCTAm86T7Jmi9dQACRgH7WtLlN2Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B02Ax93Z1yuHpqEb94Gq3NGS0+VHotmpGOnzFWTGwjU=;
 b=r1Zv8dDjmgBHcDVYC/egInngD/4rZn7qBrarpErtVutXADbO5uNpJ0iBVTk2LcvzvyqQoOhNWh6Rwn8tvT2Mm6G7L9fz0iykB4AYgYzUgUcqHfwclDbQ8sOoOszQsle4lT1Ss4kRmuu1Myxs8GK8EZZJ7bu8/LKubA8tqJs8FRFAQRH6854TnPuUm+UIgeq+A3j6Nib4Cy/p9P6/vpTI73/lbkJWOuhmFQmTfJn3iugNdZSOCFSYmBDOZm3ZE10EsL1Ifnu9Rq4XV3z5Me8RG6tBu3JAqQJLtsWNT5gvZj/0LKGpI+QemzZElKI8ZH2WYwc2NxUAo5p6OTfNW9t/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B02Ax93Z1yuHpqEb94Gq3NGS0+VHotmpGOnzFWTGwjU=;
 b=skxhpUow4mOIK0VCJWHISQopPoMUGruB8w8PW5f6EwPnvST8OqB+yqWqsy6idj5MDUxtmOaNyuyW8t5+U30HELRnANmE8CEji7mdKmvDpaARe/UImdWTP8xVaANhD5CzK/JvXi/G2wZUE3kFPAV2B3iOe294f+JnOD+h+3z/bvYzFIVeB5AKk83emS9N/yvZKV9RObXCSNxdm3YUhW6VcpGNPd0+iECO8PiR8FqKdfekT+N3eSY1BJ5ks/lqVO8ec06FPTa3W7mcYWgnZ7NuuqPt8limnrNuhGNO/VJ4KeOnqEN+5k6E554BVpav+6dlXmmXvg3FsbQxvLNqE34BKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 17:12:07 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 17:12:06 +0000
Date: Tue, 2 Jun 2026 12:12:05 -0500
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_ffa: Fall back to minimum buffer size
 if RXTX_MAP fails
Message-ID: <ah8O5cwJQ11u1qA4@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
 <20260602-defiant-perfect-bustard-cbf22e@sudeepholla>
 <ah8DDVyxO0vNH-nb@omni-lfn-logwh>
 <20260602-original-ocelot-of-witchcraft-dcdb96@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-original-ocelot-of-witchcraft-dcdb96@sudeepholla>
X-ClientProxiedBy: DS7PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:8:2a::13) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 358c0e6e-2a34-449e-c57a-08dec0ca12f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: PUBo3kWTYpfAH8vvY+carO0wTnDwDRg8Dd79f+a+x0Qs1MqID2IG/RNbietwGZp8I2DsZSIvtn4/WLYat+qT9GKiSNWzt114Fut3Tv9IdmBjaa0OpPhSZjDqHeCyUnGnDLAKyK7MxbOVb2oJWvxxqrFssdbkgUH1ZgeO+UKyV9lxdfHLTpgJaWu+Fr8dvSfRGLHRDJcbNcSYjpaRPw5HzItxY9o7lh5R/L7j8OiaUTslC0s3JgtybMFycksh28DzUP4GuMiQrhYL4IljwSk/TgqCxfbCWiNpn/8/U+M7Y3BbcHtCyAEed4u8z7p8P4t0Oho8+YCcjSoYDEVjxQHtWlsl952/nCS1oiBcv2hc3AdU8FSuRIh5ySbdHvYVaiCwsq/76VG2MHjWS5Uols8zUGTitb/w3yAwWcNsuSwjolsQJ+eEujeCvKpp0QY1DWka3hYLMbgN8wPBYz+HEXt2iFIXlFj2di5gQxApR6lZgKUrXrwElFVFdFlP2tliYVH6Ia7Ko6i1wHK+5xXDT2My60EjzkEK7oFeZLSt2+CCmcacCXGxmd5VH1RwOPQ7o7YZMwYQCkMWE7yf3yyylxdps+0ipsh7fZbAuslmNl5mBgRd8BwVQ1ldixE/VmAztd/r+Q6JdZZ5m2l5gx6+7YMhE0zA78gaHxxFmQvHEVGwpuyHwNJuO5KZFn5ia9x2sldp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hRgMNJpfx7xhRdhQ7cZBZLYw0eEATGW5lQnZzUqevb9v5E8byvQzjafOHUAG?=
 =?us-ascii?Q?Bx99gcITzRSNmWKccVoQv7A7JGIwq06gCFueF/+EyadDZclcZfRzgp2bFgx+?=
 =?us-ascii?Q?zsiTFybEHH9CQLxxsgA1cyyxSvh+KJn/Da6vdd9JQ6+VxCBJSiPrToyxKEfu?=
 =?us-ascii?Q?a3GZmzip6hrpqfke3zyoDZ4Annfvlpp5FvH1LaEo1Yfn+NGqJpHFXJCCAw1v?=
 =?us-ascii?Q?uz1A028/s9Y+U4VpV6riAg/ZULLGCdIRFI81HMuA3ObpgC1HVtxzR+7kgrro?=
 =?us-ascii?Q?EQO1uxaexaIirY1wjxXg5wqi8WxpWZ4jta/MAKgKUmBTDEdR6gtYqiajjrZ+?=
 =?us-ascii?Q?Yg2rB1YVzEb2P0QKXhCfO/yVP7dlScOT95dMwpRA3GeUXQSVFKFL1O7Df8zJ?=
 =?us-ascii?Q?1D3fNRbZcfkiiRSGK85ACWC4PQia705rlKHU6Ol2pYz1J/Xy6uQgXd8bFTP0?=
 =?us-ascii?Q?gNAXtTt12ynJ6lF7NRGmzKtCLSdo6zflRpONoNTzrKvXJQivRrw4aXtTzLJH?=
 =?us-ascii?Q?+N0qCA79PUYXJz3Gt0BU1y2DwUI+762iMnIy8dkZT39uJsHUHstl1aKfYs4c?=
 =?us-ascii?Q?3FJxeZUpWZP42709hWITIqPsaAKP80KfGrlSzsnN3B+VFiD2ickBUjM8QnjC?=
 =?us-ascii?Q?DhJK9JMO6KCBdrebJDSTER7Kc1Hliv7X7kJicQnV5YTb7jzqif9m4HcWzehY?=
 =?us-ascii?Q?vlQa3UcIvVTxWrGr2QY86Yvgg8axUKeeSA6B7QwQ4la7vCyycK6OqF56HwRT?=
 =?us-ascii?Q?mme+s7/eV/ix9Z/q3k3JufWt4+Y+7qjhPA1idKBIPyXu8NqVZkiHtvNg/Tjr?=
 =?us-ascii?Q?xN1rvbBvzaY+OQjgVQBXS8dJTH/Ut3tEKw2Nl41UxgizE5KzmUHlfWT/si/c?=
 =?us-ascii?Q?6CxohSgxT9U4hyGcV0OS9afFMgJOAVyNZAXnI+EDacN2BSOrCVJ4JnU6VkJi?=
 =?us-ascii?Q?nM6AA+lOZS7fXPs2p8NRhTCl2boEQ3y+tYVZ/1JGuxd9YR4d6Tpg0GFs2Fno?=
 =?us-ascii?Q?aTyiv44jYR54jDu6drKNX/ZHpVQAmd31K2DC9pEYcTvCDbXhk6I8R8zHoebD?=
 =?us-ascii?Q?ea7UbuoMDwjt9apUSgnEjyUsLDXplC4RinmF5mgNGNQJLcsSaQ+qah28QORZ?=
 =?us-ascii?Q?zjWFzxTGqpZZRoZHrZYxrvGqa9XbZX657f12ySe3hyobxmvTrEq6I5wBDQNs?=
 =?us-ascii?Q?pgUouAPLj9h0hP1LjyWmTbfe5NgypA/RDuxzUS1V1vHZMaCfDx6N1mm+TBp1?=
 =?us-ascii?Q?13hh1474LAmt3sMLZjnr1Q+NQRjsgbZi2dQHmO3R3bS6FIL2f1431LXfAOmo?=
 =?us-ascii?Q?UfnTgYIo07OMcLRw+cO8XyKlc8L0vDVpYQw/H3nj4NCxBV3hukRMaJkc0iqH?=
 =?us-ascii?Q?tv/uNwJiHgAeuKjNrG1wQL+yWbxkQnZWxXs/I23iGVbu2tbaggcpaIIvWAXi?=
 =?us-ascii?Q?rZXQQly+kAZOWc8D5TqSobWvO6XHE/NHcOWVssiMqzWXy2+PJlzo/U8eW6zG?=
 =?us-ascii?Q?nn0vRD+8PfVIpb2peZa4+edjXF4T43A2/pMfTiUNU5bv5GOAI6Vv+6i1g/Sp?=
 =?us-ascii?Q?wUDtKdnHW8yQ6TwdRQx/vHjFMmqgs2qQYLKoW75/0y+hCULMGnsIUhZG+9TS?=
 =?us-ascii?Q?PYShJ4RX171nMaTFNh7IKsu1tX7uw6SybYG1oA9gjLsy6roYKX+2GxoatgXi?=
 =?us-ascii?Q?KTf+cEg8ylENncbv2Tb+EfAxncvIxdyO0OTzCNqsZk5GDMDg7AV48MtU/wwB?=
 =?us-ascii?Q?9Xm2w5mDWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358c0e6e-2a34-449e-c57a-08dec0ca12f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:12:06.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi5y/p3comW7ZLDHUyisKyzSmD8Ynb3xRYE3cHFwBmm+nrCW5hnkR13sXHPkk4+NTOotAykP1g1R9iO1SgjqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_101212_330277_23C2D27B 
X-CRM114-Status: GOOD (  25.34  )
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

On Tue, Jun 02, 2026 at 05:29:37PM +0100, Sudeep Holla wrote:
> On Tue, Jun 02, 2026 at 11:21:33AM -0500, Seth Forshee wrote:
> > On Tue, Jun 02, 2026 at 04:48:11PM +0100, Sudeep Holla wrote:
> > > On Mon, Jun 01, 2026 at 03:45:12PM -0500, Seth Forshee wrote:
> > > > FFA_FEATURES only supports a maximum size value for RXTX_MAP in v1.2+.
> > > > Older implementations may still reject larger sizes, which can happen
> > > > when the minimum size is rounded up to the page size when PAGE_SIZE >
> > > > 4K.
> > > > 
> > > > Fall back to the minimum size when RXTX_MAP fails with
> > > > INVALID_PARAMETERS to fix the regression on these platforms. This also
> > > > has the side effect of falling back for v1.2+ with a maximum of 0 (i.e.
> > > > no maximum), where the rounded-up value isn't expected to be rejected,
> > > > but there's no harm in retrying with a smaller size and it might even be
> > > > of benefit for a non-compliant SPMC.
> > > > 
> > > 
> > > Is this needed on any of your platforms ? I don't want to push a solution
> > > or fallback/workaround if there are no users for it.
> > 
> > Yes, we have platforms for which commit 83210251fd70 causes RXTX_MAP
> > failures with page sizes larger than 4K.
> >
> 
> And they are FF-A v1.1 or doesn't set max_buf size ? Sorry for being
> pedantic, just want to be sure it is useful on real platforms before
> pushing it as fix/workaround.

Yes, sorry, that's information I should have included. Some were v1.1,
don't set max buf size, and did fail with 64K pages. While I tested the
fix with 16K pages for thoroughness, I did not try to reproduce the
problem with that page size, so I can't say whether or not that would
succeed. But either way there's still a problem, and I figure that going
with the minimum size in that case is the surest bet.

Seth

