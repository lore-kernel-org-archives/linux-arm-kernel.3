Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r94BeHOce8DTr81Gl+BgbzS46aKR8WB4LOn0YG+AOtQ=; b=P9SYwYsLStWqW09ZiJBxfPIO11
	K5qtNpHJ/oVNPZvVsabtfgTNXSLUbMmweqWbPtpUjuWaFmkh9pKDW/7qc2q221brYvVdwdxJZWBU1
	JH/DEMgpBvJk+vOnwAJSQomHiyvg0Mi+y0jaLbU2gsE9ydfR9G8WtNRwYitpQsChaeKnOt3bhZX2R
	vlQmqnNNKqdqNu6zNRKTelesAw7zfQ3Vwn5a6ULjTE0+OfnoJw0PAbCD2TrDSAWupgFcRpZJsrcln
	tAUiQtlcfilAUxzHntNBRpXJZ1/gcjxnfYp2mp1hRJFp8lrjiTiN1gHNq9WFogzFuryfej19gJqWy
	/5VcQ7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXINv-00000007fdA-3erV;
	Wed, 10 Jun 2026 12:50:19 +0000
Received: from mail-centralusazon11011007.outbound.protection.outlook.com ([52.101.62.7] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXINt-00000007fcP-3oHs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwcYrhW46+xA+n062VQYWIl77oCQfPKS+ts7LWr0IwNY7jbiH9EbdlDKzs7zUyWsRTYU9t/GQszx++lhNs1lZo3xe93MUMWR3bzr7rmVL6iLt6fq3m9tGwDl9PmTpQOgTLzX03hQukfsuMDByRzu6b2jSzE2piEAEkTh4x0PwFA0rO2yc9PWLDdCZMS5O/aCpj6UngCEKjJy7+AXfFz0tZBMblLODCnf5cWIauKrLyij0YBeq9ej3NLBB8DMxR+2FNa2P5CftSyHC2PZtxLu0CZh2Q5Cx/E2yFoYxjPB/Dn0byzc1NzhQPw39JgbVsWVOjEDOBkplM0P/dbTziA3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r94BeHOce8DTr81Gl+BgbzS46aKR8WB4LOn0YG+AOtQ=;
 b=PBqte2Z4yMCKrapPxHLd0g/UxZN7gfBcw10GGP7YG8Ksi4V9eQz/p3x94Sx99PUEYX0PI+39CixJ2Rz5F4jZBSDthtftBo4zO85H+UM6R5oc+trEYY4QNOG1a4zh9KTlmUEJCnxYgRy+P6PqW8/DWCoKFwwF9+tq4zUZzYiDfF09JW60A+gohKoAV23uy/PRJIu8MNTSYEcW9OnXp0Fvz+/VBznfpmWBIq/O1ps36GqjsPfB791HXT8ZwT+SxJdYXry+ViiajKNwWqSYr5y/pRyzYHEWvrHf1psOnKYPTq0dNsRvWSU/Ag4incea0p/xV+9ZNXM4psqlnvIId0zmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r94BeHOce8DTr81Gl+BgbzS46aKR8WB4LOn0YG+AOtQ=;
 b=AV63dc3CcOfmZeDrO71PXcppVWymCe/xuyIBmZHbYEnHYTCcllN8H3TRa66YNDCjqSLfJUMVpONmtGioI7wbLtuGNPKKXDQDH4jy1z0XP9fb48h2fkJEM0WTD2h3ahUhRXZvmJO+cVCwoCAcHucoEnD3ktVPBT91HoAfFsMhixuDZACWNXUjrmgrnE9aP/EzM4ciz1U/s0wdhSKSnfWzq4tFE7HqSPJUavex3OVXarw2c2DSzlqrba5CJtI7VuC41OxiHv/SSrRdGXzqGAmq6ky66uaI4TTAyARAqUbQqxb+GDmPLFVbTMeJTxsMFILugayg5mLpvvDKEjfQ+IvQfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS2PR12MB9776.namprd12.prod.outlook.com (2603:10b6:8:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 12:50:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:50:11 +0000
Date: Wed, 10 Jun 2026 09:50:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <20260610125010.GS1962447@nvidia.com>
References: <20260605144551.2004391-1-sdonthineni@nvidia.com>
 <ailKYTOX23EMnJsK@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ailKYTOX23EMnJsK@willie-the-truck>
X-ClientProxiedBy: MN0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:52f::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS2PR12MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adc22e7-50f9-4189-b8c5-08dec6eecf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: vJ3jkc6BNcKHSrGmet7pAfdBI+ZUiSDGoaDqGYE7eXyqFMH3aKJq7GQ/cZGPVZnQAI1/y51R3JpZFwfFxstRPONmmdiKUqUpRbnQB2gRe2FohUzKRqZ9Ba2dgaW3wctW06+EZ7kvrqPkk/p2GVknqQV00NQMcmEMAF+au6aU5bAD4a3HWjOfFlMa99CxDCXH9QKW46zCjBUkJOgH0+hsS7Bvnsa9MGEpQV6LtAhYVzXvQTNPU0i40c1AE9mYgLthbdfZPXz/xGUz3KUfitYujLFkp557K28NN89LZUwnh5ambGDVpLTiFM53jF/aB4C+DaJd3/vwta6RJFnfhAbCn21jw6SZIhiEZ89XP7ufGO+NSwtgj2z8mxgf+BpstfwtKvygcWVv8C50l5ZhctWmchHQ9sFq6b9wzVksvLPUMz4oUNlMCYEqyLigld3KcBdxiKfNU9j80b+Tubm5gVdG6gmE5JRRxUBGSDVy3WhvYaPqqfH2JQjKsihkax8LpF0NQcmJGIDD283MOG9UjN/A7HgprQuW7/X4NHLfk2VEop1afNsLSdZhkiwy+AS0rPDS32DmuCm9X6EUmtRoIV+70lQX9avI6T3BvaIXU6bJO8+LpsYUDJMfamg3Aiy4Hc2/EiQJPEtW417hxDG3IVmooYmkrR1birbqmK1Mt9EIzxorNkqTjpRfRQIRt5Fdhsip
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tAZJE/hBFb7jm43hJb1Yo/KGbL5BZ/QnWXxWERsridEMuAwpq0zcGQuy4pQf?=
 =?us-ascii?Q?dkTtir9BvnrBvI/FdGeEgI10Ap9YpqxpNk/dC058eR2m8iDvMLHZs4xv/i3r?=
 =?us-ascii?Q?V3bGjA2NNPT3DIsNM14NO1kMmcXd9goQyBq/0IySNI/c+B9tUrUrqzYpmZqJ?=
 =?us-ascii?Q?pY9Sul2xCgv8EheuxENbrmUT7HelU0OKQB13fzK5JrF0nbsu14CoUPGQO2JD?=
 =?us-ascii?Q?xTswn3NaOjBggO77KrECWB1oSDistoS4YZ/oDsCqiYad0Pxkx65hrCck2zuI?=
 =?us-ascii?Q?ucSKWnWDJCZt+JEIwtqmLCfeopKOgk3vBsryygza2T2sU/QD7rwaUUO+uUqp?=
 =?us-ascii?Q?wmTDInvhVs8CIF+ByZoHgbWEyz+2hqyJVx21xFA+s7lsecPKI6I18+7eyRks?=
 =?us-ascii?Q?tcMP4moKN/gcP7s8ztnhEbgoCQjB0NJXZWk4H6LIlYY4HeqNIDx5LC0DMvkp?=
 =?us-ascii?Q?aJtWfWMirNS8+8CZyqH3joByyv40djupkg5jTH9/nmdglfpJYbxznEvHq7j7?=
 =?us-ascii?Q?M3NbXtyQHEZi0WWdXLk7+O7ykBqGVd28+qmy/oDkOpJEByvPCXa9EvTemhat?=
 =?us-ascii?Q?pxYPBI7kzDqnI27jTXgn+SYfoi8NdZ2LJUvSEhqmBYCXhItslAFX0ZefK9mH?=
 =?us-ascii?Q?QVyaiPdn5v3KRvLHvK6glBZZ2NgQ9EYg4MR91gMsmbfF1CYOxS//bAJXJJwh?=
 =?us-ascii?Q?ULEcR32JuIsSHk6BQPeEDQbfZMnxl6wWIx6Iju5OKXMjGT3ezqnThEV/e3a7?=
 =?us-ascii?Q?lKz8OBV7s46lcVsX8U4PVT5azbzk1/+tGr7aU4nldYsBT1upn3urxBOOLfAY?=
 =?us-ascii?Q?q7X2RIwVYUxyoq5Y0lBhM1glpVliukruzjiIw8JMv81bkA7Ej+GWOW5wV4T+?=
 =?us-ascii?Q?K+91VJx2vDB/nfl83o0FlF3HblDfDakjg+bsv/3NdS0Tupj549cxcPaxVsmj?=
 =?us-ascii?Q?V47NhGbXmVT1om6eVi1R/AOfhuq/+e766NxBvT7IMS8iUPWeQws3+ofH0y4M?=
 =?us-ascii?Q?PtRuqWpZpWXoZ8++xDiiDhMyXBFaMvzKTIP3ynedaMcyt09e7vxNa5tz5RtZ?=
 =?us-ascii?Q?fdjgJ8/VQD/GB4fZMqKXPKGv+igjUIRNlLBSYD90i5e88yNXuNRjye2ANFY3?=
 =?us-ascii?Q?p/draOXpFhUaAwQs+eU/ewX3u6sHhnu+kPTB2kVVDBRY5mkLle4Ilb2xKbuz?=
 =?us-ascii?Q?/+5cbKtQzlrXIZSCLsrgOD3qxbVjN1dAATpQqATv7VFR3Aip7L9sQO8MtO3u?=
 =?us-ascii?Q?cg7Gqldvysznx9ZVLsFzn909jZOPbaHEFLC/0U4HfBpCWs/GEfAy6Xxfd5d4?=
 =?us-ascii?Q?lFV8debU/pr8BJDmSND7uqqhj48kTZoAXrEMheF6tB1kK4FIoB4EonScN6xG?=
 =?us-ascii?Q?R+TXOV0ZL+gCl9EGQORbaszxVmHJizdTMvkuzBUGr07T84Xb3Y+kbrks0sMy?=
 =?us-ascii?Q?1i74MpRHeam95qwffCfk5w69BPpyF9Z3CbN63+6lrNF9fhTBHRJT0KUjo+8J?=
 =?us-ascii?Q?M+zsPEt0U05VIMigf3Y/phPJGeangKmL3O2HM9u4vqIf73mti2BoE8Z5/aEC?=
 =?us-ascii?Q?kWSix8WjM4CrN0jH//XshWDH0/54Y9VeeZK+ORxgPx23KXswFi3nleUt7+no?=
 =?us-ascii?Q?8FndL8P1wjF1E/PYNjjdBmKIPkDH9wToRLdsfV8+x1mck/00uVC7GM+wU0/9?=
 =?us-ascii?Q?f5Ajkltv8cltADy15U9Gb3UMkCO4Nyjt0IEGyu61IDUcnYUa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adc22e7-50f9-4189-b8c5-08dec6eecf24
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:50:11.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOPV/EBi/3mSp08ZA8zy6gP0stWJntdrEZhwCg0rwY4OrDG9wWz2cQB21BP5C+Pp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055017_948540_D4F4C175 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Jun 10, 2026 at 12:28:33PM +0100, Will Deacon wrote:
> > Note: stlr* only supports base-register addressing, so the raw accessors
> > can no longer use the offset addressing introduced by commit d044d6ba6f02
> > ("arm64: io: permit offset addressing"). The str* and stlr* alternates
> > share a single inline-asm operand and the sequence is selected at boot,
> > so the operand form is fixed at compile time; unaffected CPUs keep using
> > str* but also revert to base-register addressing. This keeps the store
> > side as simple as the existing load-side patching (load-acquire) and
> > avoids adding complexity to the device write path; retaining offset
> > addressing only for str* would otherwise require a runtime branch on
> > every write.
> 
> I seem to remember Jason caring about that, possibly because some CPUs
> are very picky about write-combining?

I think it was more a fall out of the work there, after looking at the
assembly this minor edit to the constraint made a nice codegen
impact. It is certainly a shame to loose it for this bug.

If we care about write combining we can't have a branch anyhow, but
that is most important for the specific memcpy operations (which will
need a branch)

Jason

