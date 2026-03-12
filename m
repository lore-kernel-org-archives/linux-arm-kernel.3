Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D8EFED2D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trtJCS4tb+jtBOY7jGAkJCu1RqS1a5qweNbsRh9yTOw=; b=18hsz4QOcmvRIFZg0AuYc1ELhe
	DS4VNowi4uIcDcmo/NXfM88PRfRzbotcVqqR7+UsYVJHApSLJABaXDileedHtWbEEfvu/EmRoDoDJ
	DI+N0oCq8J/pEVI8BxoLAz/KNcO9iqIl2ikcsm+DWMQce/dz6xN1XzGUfdml9VG5mtJByHyd7Zo8h
	K5eM8n5eIOFnGONCZ7XUcEN+stwGQvdtBYoQHxKfobP4cJoqWT9t8LdCSbXJskZ7+CNUvN02HlOur
	gdkWha0Q3t+LvfqECV1w+ATIxz2W3AxNDRl+aAoxsrkGOTE4X4mE76BM5+7H+aQLhWKJw2ekAYJWw
	UeZ+caaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Zrk-0000000DUgP-3o51;
	Thu, 12 Mar 2026 06:49:52 +0000
Received: from mail-norwayeastazon11013039.outbound.protection.outlook.com ([40.107.159.39] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Zrh-0000000DUfq-0vDr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 06:49:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k9jPPzXEQBrquNyxadsbWzCnwqWNBvYlDv89CH6PP0BjyiXVCFuGNdSS18M9646gXnesvlajns5/TtU+kTY+9przWWj+LxxWJ9s1jL1keOyyU7rl5d/8xwaQeJy4ejmdlZrIElQtIGyWwRUVavpgJ6au4jjEP/gAzwc2RwzZwLMTjp0ICHI/C6xnK3lXbNw31rIfJccZ0+VbQpi6VIi7WGafyc9tTlVPF6s2Pzk8bVZU9sjFhTtrYEwI9/+HhJUc+MGcQ6HFQtH1CWMAGW4Obrr3v7iQKYGGuB3JZCTS2n2zq2kHtiIhhlW/ON/HAy+1gVGxs/FarwNrlncZK7N/FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trtJCS4tb+jtBOY7jGAkJCu1RqS1a5qweNbsRh9yTOw=;
 b=NCZC81R5notNIbHjoRXu8rM//LcYm9qNQyMud757sxcJqnUTx/fITZ7wR/GkZ3IUTqByUdRzIKKYgSvHDNM83NpTkXzFoRAGp1SfTyBqFNUYMshu+mfC09TxKnIEu5x03F6NgT2uAEWYx2UM5x+Ut2kML9avN25chBLdrEv2fYWSCkx6KlSa7Sduu9QnDKBClsaOWHhQHMtE0b41u5wa7dVnJuZC8xy6OweLRJDmR7bZk2k3N/sZTlKvF2RorVFjL1ccEhlwsMoFaTde35cgV9wmeXmfwC5nkN6G3SJ+ivLks1yULMUtgn55OREggmTGmEkRgbjecLPS/AziTjf8jQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trtJCS4tb+jtBOY7jGAkJCu1RqS1a5qweNbsRh9yTOw=;
 b=SJAQv+QItELM78XhOBv6HOALCr/J/Ua3FGSk6CMXquyo43bSENjTHUFHXgzhckFCOPg2A+jXeblt4d0OU5TGNZo9C/WkSd6Z2/eg+L7AncCL6bdicpZ/do3eUg062Ra7FXebdpXbMbatnwY3sdS7a8PZ+dFY0eqe4VX8jdS8m00=
Received: from AM9P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::12)
 by VI0PR08MB10941.eurprd08.prod.outlook.com (2603:10a6:800:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:49:39 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::62) by AM9P192CA0007.outlook.office365.com
 (2603:10a6:20b:21d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Thu,
 12 Mar 2026 06:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 12 Mar 2026 06:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a67bq7R+i+JHQQWBQqCdmKtuMACdxumw0as0EeJnyGsY2ShdEP7xKSwK/jwapfcU2UQdyIp9Tprg7Opqaf8lbZon3IQdxdrbtOR5jFwaUC3J2tPGCaiJQeN3glt3R70lfctGe+TPQWPzpICFsmhDCN4nnv5f65hBi21W8ROir8Y6hYf0L2VjNLpQeAMTE8oE8EeinFji2TPFutzxgF7R0XKnp+/9eJClMT3Rxb0n1Q/+hjj0UEiSREfvCBBMfXYKPwH2gQVYOfjtO7PxiMQnOP4S5feLJ28vGOn96zCB1sXA1Ztw4dCeLfzm54MqN7jX2gUexOfPnIVe1Twnc7pR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trtJCS4tb+jtBOY7jGAkJCu1RqS1a5qweNbsRh9yTOw=;
 b=OJ59aowTk3nWZq7+/xJTGPkZK9Uqb+HqmPPykuoZycGlRBg57HsMIB7wcNruYvX2eMaiOvkEw1b27xTauPdNjbisxms5GsUMUSYitg6wIh1EW2tvwlGkXptZ1/O8o+KTecseOBAUg1Guk/yuUdtKnUcjcp9BpYprwW++Uv7ZcguHZgeFtep5vZE6kFHcYR83apjnC3l3qhIHkyf4absrzSTz6mw4DYd+euAZHgeG2ql6tIOX29lLzrO6cskOi5GVYpbUpLOIdueLtnhVImFXBMZRrw7l+tvaRKEzY1w5UTODI5cYMNOEiOanxbVE8phLGp3vw7PNXjJAQFK4NDo+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trtJCS4tb+jtBOY7jGAkJCu1RqS1a5qweNbsRh9yTOw=;
 b=SJAQv+QItELM78XhOBv6HOALCr/J/Ua3FGSk6CMXquyo43bSENjTHUFHXgzhckFCOPg2A+jXeblt4d0OU5TGNZo9C/WkSd6Z2/eg+L7AncCL6bdicpZ/do3eUg062Ra7FXebdpXbMbatnwY3sdS7a8PZ+dFY0eqe4VX8jdS8m00=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DBAPR08MB5846.eurprd08.prod.outlook.com
 (2603:10a6:10:1b0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 06:48:35 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:48:34 +0000
Date: Thu, 12 Mar 2026 06:48:31 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Thomas Huth <thuth@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in
 synchronous tag check mode
Message-ID: <abJhv8BtfiwVPn7+@e129823.arm.com>
References: <20260311175054.3889093-1-usama.anjum@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311175054.3889093-1-usama.anjum@arm.com>
X-ClientProxiedBy: PR3P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::33) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DBAPR08MB5846:EE_|AM4PEPF00027A5D:EE_|VI0PR08MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 017b8da7-58cc-4679-276f-08de80038844
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: lCo7fDcqwJuAGwhTJBO0km0Ks9hZkf8Ue7LhsrxF7ZqAn/iwNLgd70zPvacqEw9H5G1VOLYl0++t1APhp6woEg+gETvdSMJwYjSEu02XGTkn1OMZ1k8cdJULVvD4mVw0opqi/FWnOt/GORuHszOXSMHTJr+Wng3rLD4LSYHEZAoQGNZvC+PjAPoGjkc5gmWZro9V9zzbxTQJ6K547WtPEXfvId6iQ2w8Nu6EqvC7Ie8hUeNV5VeT1gssbTiH6iCarMFeBe/gyWSnm20YaKfoSQE7lbTwChuaVUk3YdZ4bbl/1TzN6408m3n+p+Pel7AWxVworfZ2gN3mYcPGm1J3M/q4kX2MCy/oUpwS6V4ZGy03bKG6O3Xg9X40NMHuspeHfe6G8Yz3OJtTnJee+01YMiE40F7rH+fJX34HywIPuaGbJ9ElA5dGACsL4+huOdraZS95ST17xNtT7nskFG30oXrI24X4AqG1FbOEXw1Ws53iuVxpqmd2N+r8LdTR8HwWWw7E9bPbcjoIkJBVRblSDp9UT5WAnss7EhK8ZsdWygsIJEopKSBlSl1/lJV+egfv9IVbsBmI+wagFlUSllNj10eFAJ6YiZbYc64F4oyvubQEnMp9mTpJ4gWouu3UYIGjfcL9C7me8eXXtGOMeSzNT+23iAGr/3iU1bh+SpgilBWDB8E6lNRFhdH1AFo3FpeG
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: O8Gq7pQ4U3EBhfONt1BCdikFu3HifFgVcVJgx3PGoZG0gjxPmuY5iPnrQ2iclT/WCRB6VEzaqTczk9JlFs3pHEGvrXmPLFC3D7U5jBFhLUDVBnzScZhO3qaCIEwrHgWxW0QUEGC5fk25kOang3Ua6pz+MsvhY+JEsvcvOSgk8XmCS1rV+nq1+f05OlBqZRRs6J6ONPez9rz4TCENQExdfzIisnsaHfwYIL9m/1qmSdnHAbiKnbCM+jRrDDVtgzeIJgBaJmBn4MME2dhQ1OscNrY1pp+G7EvKzxCnOhXL4csSRfRbNooEMcVKE9cs6ahrqR4H0oItNh8oCN/SA1qoqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5846
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bdb84150-d8b5-4439-3494-08de80036172
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|376014|35042699022|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JWM9TLD+eJcOJWMCfjz0nm2nzXOtoA9GK0zoNW79/GiH9BdMG9+1kJKXGnppvUY2rxdWutJtdDDXzfj56YHRsBnGmxlcaY61KlsQNORfHXcmPU7/huiFgcO8VtXLp4iYR4BPUoLVI0BQQzJ3tc92kE+V0Mtgalk+RHEPvPZYOkkpxBOl+TtUL1R86NiLY24BW+iXkIiFgkLxI8cPtJs4uGwumi7uX7bRtfurcIdcX/F38MPuYLgFlM7bPEsHYefl6JqGHmU0JvOv7gT3ViybslOfKLHtG8ip/L4Wr5njRInMBDpw3UAoATs9EOwLz4jnt4UMTHKR3YtIi69926FoLWsOLGTniK62LkXyOpdZK+e49bu/FDYKIwhnPPixxYXYccC7Fw5DXZFwqvX6OcXPBSaCzCZu0f4Cz9XX6Vy3Z0Tp9Pl090RObTXaQ7/TleRuApi/bD3mBgIejaR/G1zk++gKaXFNnhsH64C9nNVBM73eJNDdSs5KoAaoMUcErQGPc+v9Nw/2dSEwa5ms6UMGm/9v4tDotmLeuR3Xs6oPN5qH/a6rsECrsvTvbSv/9nKgtCh3UxiQR4F3ndHpRYgBqeK6UQZWdd8ZZQaq6YVQ4dQvY5DzU2JuVd3wtyHvOAsbLjL7gCssX3sVYLteMCSUoGYLxZTLF4Bu+bsX+ks3q8bVqkhALQNIqQMnJpzYualaAazhdT0mUB1Ei5tRYOOAjcleF2Fll/sOmYgeDHo2cpw=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(376014)(35042699022)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: umd6Ng4DzideMngE6r7TjA56VPu7DSW1T5Ys0iXwHQyXHAqTgIeOBQ6tG6fWGW0k5d1Ob72cBLTSy9u2P52NPjG5/CYaDJriUqNezO9ixdJZWfvu0C29u18rPuBd31nWm/jGZqyMIoGFOHhCCbvfav7p3E+3u1NoWY3qQ6kzqYl082mcj9MvzPl/DlCVaLwEKv/23srDCEBkGOVOdaZdmlQfj0o7n0T90YgTAs3RbTYm7HljW44s1BZQPFIzoyL5bpQfn47cXNo8ccdW8aeWAdBY5kjwDdFHbX9XRYAajgvwV80g5FrhAa2u3fza7tsn7WRJuHvY5R/Z9i+jKkwety4+a6xXfrTSOVIt2V5QPWoFa0DoH0q38gG014swYY3iGbgVfEfKRIWRwhvZmAD0Hy7hdNt/dFurQ+4yo3epXJ33belvJVFjmA+nmP48RFuA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:49:39.1556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017b8da7-58cc-4679-276f-08de80038844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_234949_364723_0B0AF86A 
X-CRM114-Status: GOOD (  11.14  )
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

Look good to me. Feel free to add:
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Wed, Mar 11, 2026 at 05:50:50PM +0000, Muhammad Usama Anjum wrote:
> In MTE synchronous mode, tag check faults are reported as immediate
> Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
> never go through the asynchronous path. Therefore, reading TFSR_EL1
> and executing data and instruction barriers on kernel entry, exit,
> context switch, and suspend is unnecessary overhead in sync mode.
>
> The exit path (mte_check_tfsr_exit) and the assembly paths
> (check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
> check. Extend the same optimization on kernel entry/exit, context
> switch and suspend.
>
> All mte kselftests pass. The kunit before and after the patch show same
> results.
>
> A selection of test_vmalloc benchmarks running on a arm64 machine.
> v6.19 is the baseline. (>0 is faster, <0 is slower, (R)/(I) =
> statistically significant Regression/Improvement). Based on significance
> and ignoring the noise, the benchmarks improved.
>
> * 77 result classes were considered, with 9 wins, 0 losses and 68 ties
>
> Results of fastpath [1] on v6.19 vs this patch:
>
> +----------------------------+----------------------------------------------------------+------------+
> | Benchmark                  | Result Class                                             |   barriers |
> +============================+==========================================================+============+
> | micromm/fork               | fork: p:1, d:10 (seconds)                                |  (I) 2.75% |
> |                            | fork: p:512, d:10 (seconds)                              |      0.96% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/munmap             | munmap: p:1, d:10 (seconds)                              |     -1.78% |
> |                            | munmap: p:512, d:10 (seconds)                            |      5.02% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/vmalloc            | fix_align_alloc_test: p:1, h:0, l:500000 (usec)          |     -0.56% |
> |                            | fix_size_alloc_test: p:1, h:0, l:500000 (usec)           |      0.70% |
> |                            | fix_size_alloc_test: p:4, h:0, l:500000 (usec)           |      1.18% |
> |                            | fix_size_alloc_test: p:16, h:0, l:500000 (usec)          |     -5.01% |
> |                            | fix_size_alloc_test: p:16, h:1, l:500000 (usec)          |     13.81% |
> |                            | fix_size_alloc_test: p:64, h:0, l:100000 (usec)          |      6.51% |
> |                            | fix_size_alloc_test: p:64, h:1, l:100000 (usec)          |     32.87% |
> |                            | fix_size_alloc_test: p:256, h:0, l:100000 (usec)         |      4.17% |
> |                            | fix_size_alloc_test: p:256, h:1, l:100000 (usec)         |      8.40% |
> |                            | fix_size_alloc_test: p:512, h:0, l:100000 (usec)         |     -0.48% |
> |                            | fix_size_alloc_test: p:512, h:1, l:100000 (usec)         |     -0.74% |
> |                            | full_fit_alloc_test: p:1, h:0, l:500000 (usec)           |      0.53% |
> |                            | kvfree_rcu_1_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.81% |
> |                            | kvfree_rcu_2_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.06% |
> |                            | long_busy_list_alloc_test: p:1, h:0, l:500000 (usec)     |     -0.56% |
> |                            | pcpu_alloc_test: p:1, h:0, l:500000 (usec)               |     -0.41% |
> |                            | random_size_align_alloc_test: p:1, h:0, l:500000 (usec)  |      0.89% |
> |                            | random_size_alloc_test: p:1, h:0, l:500000 (usec)        |      1.71% |
> |                            | vm_map_ram_test: p:1, h:0, l:500000 (usec)               |      0.83% |
> +----------------------------+----------------------------------------------------------+------------+
> | schbench/thread-contention | -m 16 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |      0.05% |
> |                            | -m 16 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.60% |
> |                            | -m 16 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 16 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 16 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.58% |
> |                            | -m 16 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      9.09% |
> |                            | -m 16 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.74% |
> |                            | -m 16 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |     -1.40% |
> |                            | -m 16 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.00% |
> |                            | -m 16 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |     -0.78% |
> |                            | -m 16 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |     -0.11% |
> |                            | -m 16 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 16 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.64% |
> |                            | -m 16 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      3.15% |
> |                            | -m 16 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     17.54% |
> |                            | -m 32 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -1.22% |
> |                            | -m 32 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.85% |
> |                            | -m 32 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 32 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      1.05% |
> |                            | -m 32 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.41% |
> |                            | -m 32 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.58% |
> |                            | -m 32 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      2.13% |
> |                            | -m 32 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.67% |
> |                            | -m 32 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      2.07% |
> |                            | -m 32 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -1.28% |
> |                            | -m 32 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      1.01% |
> |                            | -m 32 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      0.69% |
> |                            | -m 32 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     13.12% |
> |                            | -m 64 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -0.25% |
> |                            | -m 64 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.48% |
> |                            | -m 64 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |     10.53% |
> |                            | -m 64 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.06% |
> |                            | -m 64 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      0.00% |
> |                            | -m 64 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 64 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.36% |
> |                            | -m 64 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.52% |
> |                            | -m 64 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 64 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.52% |
> |                            | -m 64 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      3.53% |
> |                            | -m 64 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -0.10% |
> |                            | -m 64 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.53% |
> |                            | -m 64 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      1.82% |
> |                            | -m 64 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     -5.80% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getpid             | mean (ns)                                                | (I) 15.98% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               | (I) 16.13% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getppid            | mean (ns)                                                | (I) 14.82% |
> |                            | p99 (ns)                                                 | (I) 17.86% |
> |                            | p99.9 (ns)                                               |  (I) 9.09% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/invalid            | mean (ns)                                                | (I) 17.78% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               |     13.33% |
> +----------------------------+----------------------------------------------------------+------------+
>
> [1] https://gitlab.arm.com/tooling/fastpath
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> The patch applies on v6.19 and next-20260309.
> ---
>  arch/arm64/include/asm/mte.h | 6 +++++-
>  arch/arm64/kernel/mte.c      | 5 +++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 6d4a78b9dc3e6..0e05d20cf2583 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -252,7 +252,8 @@ static inline void mte_check_tfsr_entry(void)
>  	if (!kasan_hw_tags_enabled())
>  		return;
>
> -	mte_check_tfsr_el1();
> +	if (system_uses_mte_async_or_asymm_mode())
> +		mte_check_tfsr_el1();
>  }
>
>  static inline void mte_check_tfsr_exit(void)
> @@ -260,6 +261,9 @@ static inline void mte_check_tfsr_exit(void)
>  	if (!kasan_hw_tags_enabled())
>  		return;
>
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
> +
>  	/*
>  	 * The asynchronous faults are sync'ed automatically with
>  	 * TFSR_EL1 on kernel entry but for exit an explicit dsb()
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 32148bf09c1dc..8da2891b834d7 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -291,6 +291,8 @@ void mte_thread_switch(struct task_struct *next)
>  	/* TCO may not have been disabled on exception entry for the current task. */
>  	mte_disable_tco_entry(next);
>
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
>  	/*
>  	 * Check if an async tag exception occurred at EL1.
>  	 *
> @@ -350,6 +352,9 @@ void mte_suspend_enter(void)
>  	if (!system_supports_mte())
>  		return;
>
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
> +
>  	/*
>  	 * The barriers are required to guarantee that the indirect writes
>  	 * to TFSR_EL1 are synchronized before we report the state.
> --
> 2.47.3
>

--
Sincerely,
Yeoreum Yun

