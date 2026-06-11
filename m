Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227BCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7trRAciVdCncW/jCg7adNHCzyno7EJS++2s9o9cjvc=; b=kyYzB2Mo4Hf0L0ztijKfp1PpR8
	Mi+yng939xtDsDdX1x0aoGEzBoLOeq/7QAXTKZ84hFqQrmxPDUrHQ+bNyttXFsaO2l7NIESisqzre
	gHF686QnGhX8u3xWVLQVRj8nUE3GBAxbgVcG/rqi7osb4QqjWqdhWqUKnaoA0UxP7K1FlGGZx5vXZ
	5qDQrd9mnF46FJaoaARMfzKsAYQhG14CM+WL2NwyjoTHo/x+XT+5UMUBlPqtPaFm95LM/5/TBF4vT
	uQdnkGCKhb5v3V3wFRWb8ujc9UfvS9ZO0kJxqP6dzAq/6NYVKvZcryEktb+YfTKuJlrvR61DHgM9j
	03YHfQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjXe-00000009qwX-3E28;
	Thu, 11 Jun 2026 17:50:10 +0000
Received: from mail-southcentralusazon11013009.outbound.protection.outlook.com ([40.93.196.9] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjXc-00000009qw1-1Ks8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 17:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsbuC408quE5btQf2JJpcNZQAMQYSim9pd2DSMrqlX1S9sKxRevLqOuwnPqz0Q+WZ/AFM+xBUcfrYMd0eqVaovMZ2sgXF/CjLOw35A6Pl5CfcjrqHc0kqh+llnNhL+tepbnuLDpuRUWcN1Ri1Uvb16bFt8YBY55VeRdsbBVp78gqUgVvyFHIHl19WV9p+mIg0E3joKsBkiJOQTRlWm6hAhJuEBGGSgwBPjqca1tvCoozTPIZkdfL34XgMWE9KixEkvxZd0+an9GIekVAo7SGbHXiqd6c6nY+/cBs86aOHYIOS0C04xTNn+M6t3UIOOODy3BeTjnohWyzTR7lx31rQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7trRAciVdCncW/jCg7adNHCzyno7EJS++2s9o9cjvc=;
 b=WIbvjt0lHWxRJm3ir9KwCGObvqYVED5Qk9pNcleoQLSFpBXdvvO8w/m8MsUR7iR5+kgzzMR9r4PB/f/Vv+XO94yK4Z9k6oiHxQB/Hk+f9ZMZrun8+y54lgxh0AVIqzq6upi1Fqj7jDh3VLnA9EPnQLFW+ksyvbxaA4O94KH5x/OcIQJYDKqaqYHK9NbuLr7OOwrPp0SU9Ogq2gzNhGw2a2u26k0OAucVSZTFUy+wKQTwYU9FOZ0icIQAI2N9M3/bfZClp0kkRFSlUhxHS7vj7PWsvWj1A9ajXBWAkpUEZLsM123ixFN2LPpIW1yEnvkxSszid84p4YxAkvtIfP3DMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7trRAciVdCncW/jCg7adNHCzyno7EJS++2s9o9cjvc=;
 b=rzOY+dIIaJCL4rkavF7b8EXTBuiqq8vwV7633nJeX+vvBQsTp8siuRIQuPqQC7Dx9hADJZ3fk/nRzUvBRZDP9GItW2lsb1EJ/tbXoT1DIIREDRDecZxe9tQFPt4J9z2EQKHbddb8WxPccwdPStu1v6o45EUGhaHqbox8H3oWTzPRV7RjdPEIv9cS/iORsm/Pd67LyFaA+fasuB2diKMlZTUa04WGBUFtZ65EHiwrqSmHL5cEx0DBtUvcpEVCtSzu+DW9jopRlaac5o4DrdfTSrIKlN07WRsLXM+wj2LkzgskeQfQ090PGti4m2EbfHkN1of2VWnnHGvyUJzkVsJKog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 17:49:55 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 17:49:55 +0000
Date: Thu, 11 Jun 2026 14:49:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <20260611174954.GC1962447@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiq5VigmtZq9GlAm@willie-the-truck>
X-ClientProxiedBy: YT4P288CA0038.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a4692e-c9ce-4432-7465-08dec7e1d8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4143699003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: rS0jf/EgwjgPMV2TI1UzMUpmCijgoCTzdfYBZfdH4rZnKiiTJeQAXAL6EbgzpQx/gBL+gV1FILfkUJkhZBi4o/yMmqD3xBEBWrad+2fBAEK/CII07XDgCvQMNSGG8YGAE82blmUL29D/l4htgZdjh9ZRxpPzvhTKFCCjxCjRgqxpgJTvWRklkKYcJABpJTLWxdUsK/iVZ58kF3PX/hRamdsu+Y/T/+yIGDQ/G9g6G9BgptX9AXojGPI9z9wWDHWofDK2GkHGWbU1/PdJHYaqoTNMLxevbD/StctJp6uunY+dbIQ/HCr61FIWmTCxpuTvBUdgUwCfphQlBFmqaGHU3jcVVBKox/PuPjAGuYDsucBSdF1fSuM7MevWX1tw7eBw5b0etplgZ+pci+4msT9KvpXPKndXZmgmjBbJNWqhcU4pSz0u3BVYZfeb/LsYMYr6vXOo6Mb+p69RNsG4e3SN1RCcUZVyzL0HtUxmC+xMOkLLe++7BuUgUDJOxhsUyEuQ4XkHdeKCjFcgSwC+OVGP0g0/LuHNMWXoUK3FyjkiOFz/W4VYWmtNl0DI3ju8+We5v2vqtnmcOrZC60mKFzIxMfoR3ojLkSDB4p51H0LhVbXR6MszXu8eOu5cG23fxjN1CsjzKojbe7J36AeuMJA5fHI2ul2nlVTjuxExwBGqac801WmLAyk4RDRf6h4hLbYk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQ5MhAK8EI911y0VxUaeZYeXrHQsIpUyfnCfO1URZcO1Kufhy1sCiBoaKfoT?=
 =?us-ascii?Q?t6s0YHGniSJIjv78gqhh6v4MMePYTAbF+T2c+WQtfPVy7pbK1sMqSbgQEWWr?=
 =?us-ascii?Q?nOUz/6mbMn3zQOp786VxrYQ6xj+WE6mMN/5VdewvjHbcM6Z4zEh8KLYqcn/5?=
 =?us-ascii?Q?bFJ2+Nv3QZjcXdV34FLxGGM6pw3b62Vvu0zEV1xg7von6rp+0UmMqEqf93R2?=
 =?us-ascii?Q?Ka+Yl7mIlnKzESTvTbwhKKLbwY8RaJuHZJy+rAH6mDR9AOmB2/KypsIcTRZb?=
 =?us-ascii?Q?eG3xswGEUrWn3UkHLkEoroKTZWoKH1O01oIKvEKxuAO8vVauel5+Pgq4vLCz?=
 =?us-ascii?Q?rmciVgFUY6c6sIVeREMI4cf0aHG18nf46QXAG8QBC7HUE9kT5JG7y/6K5xHF?=
 =?us-ascii?Q?IsUpUSsQ83BgvcoSE6ygbdXrN6hLGxhqegNSHd2fWrYQ5i1MQ5dZ2JnIhe0d?=
 =?us-ascii?Q?T1irMnfo3FjOyBgZCDr407zmW/DBVzVdlrgDN5xReA0PsSKJwL4wyOwnDrnv?=
 =?us-ascii?Q?kZwMALd7kNxrYYeGYL5ZUqI7lMbbqN46r3pmqEi2bUxM/QTnwfrkLXlGOLI+?=
 =?us-ascii?Q?H+Nu7ErC9775mZ4fWpb8ayJNF66lXmjMy+760VtRwe1PK2kK6EVTSMMRPhEv?=
 =?us-ascii?Q?T0wNoKFmtQaDkSalnK2zA6xDGpLAndTnzcc5nr+c2wSFPz36gy3cDkiEjeaL?=
 =?us-ascii?Q?F/eiRWucv8Qel/S4VmMNUEza73J1WvbzvqR6LZnsrzr0TG7I5KVxgyukr9PA?=
 =?us-ascii?Q?v3ydUk/CGHCRRLwu0ymOdARoC3ZpcKloc1iz9ObJcruBmAC276lNmGSZqVLz?=
 =?us-ascii?Q?Rl+DA3vphg4foH9WAJTiFpD8bCnkVk5vuOUbyL1P23BiNd1ErSEp1cwJWxKX?=
 =?us-ascii?Q?hzrja+O+O14fJnyVR5A1T15TO7ixXjoNHMxzrqpwEV8Tvk5Ste1OUQxKavsF?=
 =?us-ascii?Q?6O19OjBajAmT7q+urLLsfLyTvYPzPRuoxGSag53VfRcgeMgUhZkopiOArukF?=
 =?us-ascii?Q?KWXDQY6ysa4bUlcAJTicf1saazdJSw+iTVUyW39fImLM92EvCvek1X/Uj67/?=
 =?us-ascii?Q?/q7fPSI51NcZ8K5s8IpRKAkqYGuCeCvHW85CcdEmJUWxOEcj2YLWD/oDBqID?=
 =?us-ascii?Q?Spjj4IR/6iDSSqGnXOXgyAlpqMlkrfiWs92LXvafjBJ/Mi4k+jMt/NBh6oDX?=
 =?us-ascii?Q?moXDmVR0cgQPB13wCp3UUGcOxx084OXRlVPp9ZsDc0ocRdkgy6hbGOyGYDX8?=
 =?us-ascii?Q?+Paa5JnYltN2DEnnF7liPMdnryFUrqBRSVNDiozKbc81flu6lO9RreFi0x49?=
 =?us-ascii?Q?gao3aV48F8tn5GXlgIY2+O4GPUbX3zgTxZ7CKmkPLPfS3w1bkOD5ypwtY6B+?=
 =?us-ascii?Q?PXWmMPGceG/6Sfo3t2dlbospXJh6cfxNNO+UwYELrXo6gJfN/5t6Rb+r8TEi?=
 =?us-ascii?Q?jM9VUUlKH7g2ilg5GirVLAysa9sPJ35wmPqlg6Uu4EUWCz95pH1jIiWB4mh7?=
 =?us-ascii?Q?Va9RZ6lb8w4F4JZxy6C6sYBVIK3sqtHJqJ0U6NKA6TE95quX6qoM5HPN4ZXE?=
 =?us-ascii?Q?9mVacixBtLGIyziNSkH0STC3ef7T2X6o3KDwUZ+x+xVjWELnLPZmjEqYoK9M?=
 =?us-ascii?Q?0J5/nuxZSQDBBdneLda1arV/rXY48r17luUWVSyGcOiNa+kB7VVkvzH6BlXM?=
 =?us-ascii?Q?1ua+cgZIxEf9xxpToz1Fk+6IXRHxTKkW9wAxqlSp00rCO7BD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a4692e-c9ce-4432-7465-08dec7e1d8ab
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 17:49:55.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJuaIsvFGCiNM8oJpz/RECSuF28vuIJAwTc1gwB1nFFYqGtlayQKxTpCo+EShC9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_105008_367293_924F38BC 
X-CRM114-Status: UNSURE (   9.79  )
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

On Thu, Jun 11, 2026 at 02:34:14PM +0100, Will Deacon wrote:
> I still reckon you should do something with the memcpy-to-io routines.
> A simple option could be to make dgh() a dmb on parts with the erratum?
> That at least moves the barrier out of the loop.

AFAIK only callers that know they are using WC memory should be
calling dgh() and in that case we know it is NORMAL-NC and we don't
need a different barrier

Other random users calling memcpy_to_io functions on real IO don't
have to do dgh(), and AFAIK it doesn't do anything on the Device
memory types?

Jason

