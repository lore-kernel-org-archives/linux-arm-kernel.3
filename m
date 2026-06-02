Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A6DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHDh/1teh01YHBtC4emTW7NUNGZ0uKoW88eWYN7bKTI=; b=XkHaWnNY3fxLtJhjNSygKtsKkR
	I5vPaEkMoqJ7tUBV3p4GWVzhV0N/45dNtyxlSWRIqVdkrnVneDll7LR0y4g3SScHyTVTz89A0lgbZ
	JsossTqhXDuVgqa72UC4bkkibnYTqVRO6R8RBAxKs6Hh0LkX+cEjqmnMZz4D1d9iTHZP7+6CF5xZ2
	YeH+QSJxk06GhsXcm1XX6uz4lbMy7J2iyl3G7/WvFQkD5I547VOVzdJP6H8j3Eogqj71RVQDCHQaB
	WoIRPeEQ5KQQpUI305cCAVQja6uPzt4wGSWCeADFE/+XwpmlTp4O6+zpidS+vB/UvhhVY86KxOiRB
	53NRE6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURsA-0000000DQZH-0Gi0;
	Tue, 02 Jun 2026 16:21:46 +0000
Received: from mail-westusazon11010004.outbound.protection.outlook.com ([52.101.85.4] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURs7-0000000DQYi-3dKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qs7MOR+canGp5y2k/nKdk1dWHF+c4I6kHWoEpXRDWjLTS60QJa+BWm2leJL7ZtOKAxajBNCeAHucO/lKCPox1v8Wtd5rfcGeslHYeONFp/Rq/iqHzVYXqJFyupiJp35o+AsyPTJBgP2LvgDe1p9TFleMKw8aZuNMXszG+HRJhZqvKoH7CyzW3QuXA24xKgQvvxwGBs3OS2C8EfsPcfIPwPsRIL0dxT0z0tudOIw9OfDyjU9oa0sR8Qzu5FBJFoR4lENRIaAjdL8fpWqQhUWZQaON52b8fVzvjPmvPDbnkfq0ie3kHtJAKm4uHFmprIym9mRIm9v/Fp6eBMOPxGOeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHDh/1teh01YHBtC4emTW7NUNGZ0uKoW88eWYN7bKTI=;
 b=etXn9dG8xbqX780UzuhSGTcRayyDphExUo2kFFZwYFWeaFxuBtpVHku13m1mqKDFmSbcogyolEwJgNRaU5agwmZaTcNzYgP7GJbmm51hm3eu42dEofsBygK/d0TkcJgfhlLe1k8Pj4JZY2iim6KyPznItpLQeAcGCnJm4kb/heeI+N5c+N3Ca1ey7ZafcTIqoIS6ucm6VULBpiJwDthpSOH3UEOfQHbpmmO7VTREX1aJo1xL1ciKakLKeHacW98qfjznaCNkdGWvDLsQkhlfriVWdGDSij1j2XlNcOhw8N/ULG9KyFS9hDJkfzHPHKBE4HIDjr/Yu9O15TAwAiYDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHDh/1teh01YHBtC4emTW7NUNGZ0uKoW88eWYN7bKTI=;
 b=uDP90ny95qnxqHcSiagxNLgY91n/i5ygbXF7wGMX1lvbcooftBG266yP1l3oh4XLFVa8sk29NiweuGYgfv9UJ/4OWzOEBim7U1E2diBf1qlqqA0y17NXZ0IHet91oecL3XkM177glAKdAhjmSrOD8ioj741x0TVrHhySyhOLoHxEeuerH18jc/KH6tmo08AlhZ/E063RJ0UvQ/CeqyVp+eiTOrTOoIVNrRUpd6lA7EwssfWqPNHfW1/JLuJFqPS5wmWF+apn0QhiMpJj6Aiu73Mip4YpV67qsu67mndbg4U+KFTnWCxTc5ArwRBchF9qLzenYp0MXShz1gIGSY9nOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:21:35 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 16:21:35 +0000
Date: Tue, 2 Jun 2026 11:21:33 -0500
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_ffa: Fall back to minimum buffer size
 if RXTX_MAP fails
Message-ID: <ah8DDVyxO0vNH-nb@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
 <20260602-defiant-perfect-bustard-cbf22e@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-defiant-perfect-bustard-cbf22e@sudeepholla>
X-ClientProxiedBy: CYZPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:930:89::10) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|CY5PR12MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 417b59b8-4b7c-4c7e-1770-08dec0c303c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ICaeuqLqxxmNzpUpNC6VCsFz5Gy7OldDkWVjy5+Sh9uH6FoyM2zfFr4k9EeOC2SXzugFDoTY3ejc67n1DZdpZdNgDoFVtNbNpJoCGLe7Hk8O7JGzVRkU/hMP4FO2ZNXe+nBnCsmI8rRF92XdR5yDch3lYLOa1CHG6LUUP/pV2tIdDfalN+SDd0R5Hl6AC1Tn2k7u2UyqqtP4E6fjM+aExhL9jFV/bRMSN1gA0OW6h3rYswAm0ZQO1z7Srpnf0glz6MfS8OM0olbrloriLtX5xt3CLXjgPpYCsfAFoeDpUYwcBn/eHnfzqkncO0yoL1U6coCMXnUwA+9VI/mFTSVBhKP2Hb6I/99N0f4uwBMvgK5ETjuIOmkT/18lLOyfxGHx7zHqJBHnxk3aqJkLl7pdRGQyL+dXPQiKEOBpunfP9rPEi9Khv2WyoX/dI9sVDmHKp3PC6hyyaVNjTQpWuLp8pmgREjBNJQ19KBmXa2NZjZZTXB/GIVvYDqzuSYTJYw78g5s1tw3mVJRppbsXrYA4zc2GCCulAjVnEww8KtrVe4zFA+rZKo9AGojxRXP83xDinN4z6ge+dHoUAkhoS7QflPeXGqNiXVGDSe81g0AOKyutAGrivFZW4sxmLd85g8RlTaFvH3zux/H1dQJcqNworFQkMgAn1KJs/nOldKxbq+J7mM84YRdggIAb/SslEcQA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/k+A4MVP4FODD0Nz5BnIwfqYK5k/+/kU6ZUXj3A/6wZUFHeNw09MO+LHIrg7?=
 =?us-ascii?Q?1Xgif/BnrP9ZjPue2SxSTH2eLqxhn5PgNReA0gdw3k6RWG6cCpNLtBSgUQiT?=
 =?us-ascii?Q?wsFZFVjzioCPjn1wO1XlLAFiI3o+7Zjr5I4P/lPHulbe7iwv72hbyswHdteX?=
 =?us-ascii?Q?kmEleKHZy1IedgVQM8G3MQAlhYABMPGJU9oo32jM5W5Okj+Wnfus3djnE/49?=
 =?us-ascii?Q?GmZvA//6+YSDH4ng9Y0zBiTtdHX9bY0d7njxm/kpuZUnEI5Rpj/osTBCwWnK?=
 =?us-ascii?Q?x336cppe1YJxWXQlLfUBfezAkI2G1kPL0fZUYe9TPOCjPwGsoCmzo9RVFYTm?=
 =?us-ascii?Q?NQWiSFvNV3QEB/6tRP69oss/GHyR2hENvSOKPdHtc5CBB7jmLP7ae5FLDT5+?=
 =?us-ascii?Q?cy70FpYBdRzCmUSE9PhE5By2q55UcC8brb8l6LhRnWDbwHDxkDLBFtEO8yzk?=
 =?us-ascii?Q?mzd71jnc0XMuCk50xV25Ea5jj9GfxfXKg2Q8MJfMzhlD1T6rtM+xHr3nBF4G?=
 =?us-ascii?Q?1AJiMy90upTjdYRBSdfvdMiOsk+TW0Nj2jWz4aQ99WilX91pC4qaTZ4ly3Qk?=
 =?us-ascii?Q?3UksURy1ICLTpC866UJR9zUcE4hmWFYIg9jtmbFiKzAR8w5n4B6kkoYE/EDy?=
 =?us-ascii?Q?hSl1EHgnmnX4opXOe+nvTwmFj3t8+mYCZpLLBBOdP/cHQwMVH79zm8HHjZQ3?=
 =?us-ascii?Q?J0eDRCtRLvLzEPAsU4mCuHH7IFNIiBTJWepOMaJY8Hma7nCME2cgc7RvGRPy?=
 =?us-ascii?Q?4AXhxUm4pdcEnYcNVQkKzDFHces9smN454y3mCoj+QY2nUCBFCJF4JfTzBw3?=
 =?us-ascii?Q?ydyDTrxBJjFWkR2WNd3BB26urKzl3EEw9JuAf8o0fAl8aVquWv5RI90yG4Au?=
 =?us-ascii?Q?V9e9HW8Bjd3PMsZ8wO8SX+LPuuvAATbk3GCV5vR+u6l2WOeRa9q2rirr0er6?=
 =?us-ascii?Q?JsjH1gCthuMBnEkdhPK6QBTUeIIeO/3UXBerrBklruWygrB/TPhihoNXHxI9?=
 =?us-ascii?Q?MOUH8atqf/VMupdkUAVveASggTd9fsT8QzgY/BbrBq+WZ2Yyg+7N8wA+NWU2?=
 =?us-ascii?Q?gi6paTRJs8dUmar7pS2VNBB9uOZ7NQZ4BaRwzo6tkRnNtCZl5Ke99ThNLsol?=
 =?us-ascii?Q?albxX9PoG5jqZgQRVZn9le+omLBvTEvnX8btnBR+FouG2DUofSbgmo9DrBrZ?=
 =?us-ascii?Q?7MTIFp6LwJSjiwtphlNIz/OeaYsBeB/dACoyjA5yo+/q/cZ5s5NX2thDET/q?=
 =?us-ascii?Q?9bqQb2/GvU+cAtkVMYtWLOseGxQ6EmY9tHYBkg3ObSTAT43VJwdobEHwNSMk?=
 =?us-ascii?Q?RyRUEvV4ixZ4szbza2YfbKO8sQ5gvycxQFW2wLws5Kp9G4HY32HuemZ0jE3O?=
 =?us-ascii?Q?Q5UgjVikYQ1W1s/7NEix9L/dsdicKxQQEXnOZGXU7h+/JLupVLsdULeIR/pM?=
 =?us-ascii?Q?rvEMRPSlCbeXSLOalzq6wOmjVGOnZ5dMUAgZPEBW54lvExI24LMG0x4V4u9b?=
 =?us-ascii?Q?NEyy8UpOJ1Z2qru6kfs3U3neITXEa+ohlwixVzA0Gq9MMsJvMKwxyuEOLGPg?=
 =?us-ascii?Q?SLCld57OE+eKifabaGilyM1akQA9lQR2GusQsROo8Vl+IXhoDDwnj0g8vWbX?=
 =?us-ascii?Q?2LowZqZztPJfP2v7AVA46LvxCzV2NpZqb39zhbbIxH0G/TRogNVxhzvzEBCV?=
 =?us-ascii?Q?2LjyopOgnC6hpEcMlLONrYOnALVpaLGx6DUEuTooZ74FjNy2VIDt4bLrHXnC?=
 =?us-ascii?Q?uA8vPftxgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417b59b8-4b7c-4c7e-1770-08dec0c303c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:21:34.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+T39m41Vgfs8tuJRwr309A0An+OcAWpZFHVNZX27vUk9htygcAyOrpzgcUd452dROoS6idYsdrG77jI1MwGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_092143_905944_F2CB7291 
X-CRM114-Status: GOOD (  16.50  )
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

On Tue, Jun 02, 2026 at 04:48:11PM +0100, Sudeep Holla wrote:
> On Mon, Jun 01, 2026 at 03:45:12PM -0500, Seth Forshee wrote:
> > FFA_FEATURES only supports a maximum size value for RXTX_MAP in v1.2+.
> > Older implementations may still reject larger sizes, which can happen
> > when the minimum size is rounded up to the page size when PAGE_SIZE >
> > 4K.
> > 
> > Fall back to the minimum size when RXTX_MAP fails with
> > INVALID_PARAMETERS to fix the regression on these platforms. This also
> > has the side effect of falling back for v1.2+ with a maximum of 0 (i.e.
> > no maximum), where the rounded-up value isn't expected to be rejected,
> > but there's no harm in retrying with a smaller size and it might even be
> > of benefit for a non-compliant SPMC.
> > 
> 
> Is this needed on any of your platforms ? I don't want to push a solution
> or fallback/workaround if there are no users for it.

Yes, we have platforms for which commit 83210251fd70 causes RXTX_MAP
failures with page sizes larger than 4K.

Thanks,
Seth

