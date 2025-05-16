Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF9C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdTVoGffjyzFagv8JdKwCSwDE0uUEMHZdsY9UhP93as=; b=yTSE70bDmZlGkBByJlClUOkl6H
	6fgRD/Bxd48kf+oGuo0KE/C5XAna8HNkOxLbKyym8PYDHUh4lliqEVpaat/sFNvBi5xE7BQS5miSf
	CO1Wz8noaKi55pM4v4Hu+KXk2u6jL/9wdqCFleOKTTRjcBd+v4H2wefTzfQFFd16laTE3HGNxry+z
	MT3j3QP3Nr0UZY1rBkAE5AidNtMS6/FKnNcL9RKcdNeGEQbRqOThaQOnxLFtLoluqxt96EMZH2Shi
	9uPoVuznft+t3o6ugXYjdspY+CdvuyE9o+zxAHCiepprWyvSGktwfKdyRBTx+kWd6duntbtwN2AwG
	TphWhX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFmWs-00000002RwM-3ukS;
	Fri, 16 May 2025 04:18:38 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFmSe-00000002RUz-3vAj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 04:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6wUjt8Yw45CCq68hM3kFkcdASCkI126Ro0QJGad1idOVdXCp7ZsAGTRBEhecvizLCnar8r/ohNQh9Aeh3vdMEqhMAcPWpnq8zFTbi36v1vxLoOf1/ZJKqHJJFdgI4ZZR42W24XCRu1xS66cORj1ooybjTSIWqCKq2M6hgyBIBe32nnuaACWv2LTtdbPpxavoCjfCk8earlGvqnVTLCmMVT9Ercyj6zrXbFQwVd/UYZc5a4MAMp5R7tUPcvYK6Zi63g7IHgx/AhxKWctDXHoNqp4E9w0/8+nM3ueAWZ6M8m7Yov25vafSMbt73xXwqGr5Bo+S5h6iPHA/TvpMA/B4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdTVoGffjyzFagv8JdKwCSwDE0uUEMHZdsY9UhP93as=;
 b=yAJF3yX/4qSmtmW1PbqOIu6v6d9TqcZ3/+y74acHQUbP0UhVE41qhIr2Me4NtryCGEmMLVnC9vlOyEHbstuiQZhbMfEkC7HMRZNHb/t/rXwtdUP0X2Z4IVeJxfb9FcVu0rg0bmAhICfaTjVdfuJ0IaXn6Y9FpPF4bwkBCxpkfsrNzfm/sDfvYwqKEsiZgg2PnxEjVgqPhjjNMVTbo/ZM8sRjAyYj/4IfXf5NQOQlu1V9z5TmRhcUbdhkRJXYFEJJaqhg1L/hpSOSjPLMpH9Q28QCWcCXV2SCJfWVze1E+pkfvWk84ymeRotc2A0OjPTJOh86R0tSCWJzG98kNehb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdTVoGffjyzFagv8JdKwCSwDE0uUEMHZdsY9UhP93as=;
 b=MTT3wCjLehJDXAJ0UTJ66dMVivmjzGg8W8ZIytVqFHlVToAYkD1jhehNsVzFJ5hmxP6WIrbrF2KSqBw/7a2tw+Ssu3NN0JP10GkDYovpTTHYXibk92O4pauTUZLaVNKq2aHitu/xmadfFIzsVuChQw/3LgkGistqZuOWrUsbRt0FDphqr2Jo0UsrNHvNArSlv2Q8Km4UESixEAvL2V8vwtgT1EigsQYx8YnLxIC7HRqijRvbJaAxZs3qSqass27WyX1MkTax/Iha6pUuhquDkM4N0NlcsADpNKJtAaGKa+1+Ea5CtK+OXazbO5geSjRu6ig1SJstXVR3rVKZUL99gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 04:14:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 04:14:12 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: arm,gic-v3-its: Add quirk to support 32 bit addressable range
Date: Fri, 16 May 2025 12:13:32 +0800
Message-ID: <30a6bed1494b7bb41466f68533d40bd81f5ee4ab.1747368554.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1747368554.git.adrianhoyin.ng@altera.com>
References: <cover.1747368554.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fa2831-adcb-4c32-9e5d-08dd94301cde
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cbNLy7On8q5Jk7b9bWBt2aCzIHZW9TI3LyaIvSmygo1WIaJ7xfkQK7aBccVc?=
 =?us-ascii?Q?GCMyxm9RsaWnBcysxe+C3+GRHiOXcK6iS7smVh3r6SoP4hzDGOQe7iHaoy0S?=
 =?us-ascii?Q?hN5PIK1ApCcR7bh8/QyoPcDZ7AWnyNG37Dos+j93m3a8pkUdEN8FCoe4a6Gf?=
 =?us-ascii?Q?fiFgp6iWNjpguX4TiXSxBN/vmvSWn+B12IMnJ5Am/2Y0qHl4uAXGfVVgkQxQ?=
 =?us-ascii?Q?Qg+rvstBhsR+XNFCtwqZMKdaBs/HHy08pVB6jtTx7ZT67GrTTyxzZkBi/nA4?=
 =?us-ascii?Q?3Cg+QSQ0IfM5vq9Lr3oeckq6TmIQ9elBwZmZA+okjLOywJvUpDeezscTbDI/?=
 =?us-ascii?Q?2JbgRMxN7XjOcOjQJBVaiS5ir/Qg/fQ6I2MyfGmMDmvByAQdyhCNT42G0fkL?=
 =?us-ascii?Q?C7d9TdkLffjIwfJb8eCXBEI1F901IX5twyeNqZ4oNOrzLZfufhTs6g1Tgx4+?=
 =?us-ascii?Q?efUVZ6ff3PzSQrPnnwtsIYc63tdyygrOFMh2tNxPr/3jaqXRq59ISP/6NffD?=
 =?us-ascii?Q?dDZ03b5zUigHYz1BSJz82/SrwFyjJ7aTGF7k3XzfUTpPRiGT7SBN/6ClKUQi?=
 =?us-ascii?Q?xAU7fbJax9fESUIr9ckYpw+D+i5b7gUHFMbG8IW+0waVDQCm70eos0N4RxJf?=
 =?us-ascii?Q?Cs9i/H8uJ/LohvvK2iUpoq9klFsvESDax5SCZccbmLDB814sziXXNDFsc/vz?=
 =?us-ascii?Q?zWmAdPsDUjJOpOl17iZHdCSmQEs6GM6SAk7vntX8BfkzP18+bXLE7bufqsln?=
 =?us-ascii?Q?7r7FnAgjeHpjr7cPaTQi7yYbsWqSkLXOW23eQcBEv1J7EQUFKuIO59mzWdpD?=
 =?us-ascii?Q?dnHCo0LZK29YNd6HoyZYSDaPxJqtaOzOMwY6X2ffEyBYy9+qeW7qvnPUTk3e?=
 =?us-ascii?Q?swsNSf4flzHfG0xYB1ULk0/+xVg7Wq9qR9qTrltixxVizpNa5AYL5xuIre33?=
 =?us-ascii?Q?mMUru8C/QjX/fca47zdsGUzCcOFWefC0k3uKCWw5wQxdCzHJKG2tgKEY99dh?=
 =?us-ascii?Q?n/37OB4wdmlISlNxYZgTNsqMOMjm5C+KINy6s4D+POkz+ogp0wAl+K8T6mz6?=
 =?us-ascii?Q?Z9IF2AJVxASBGDg15+4J4IOETVxB8Z5u6zk5/lOeWYh1e5FTlMmoH2xB2WiB?=
 =?us-ascii?Q?4eQuSTHA7ArdmSFyToeEYIa/vpqCP5U4IQTJ45p8q/Ux8PMMW953l6PuWpow?=
 =?us-ascii?Q?Dwm7vGnAAX/2o5B+DPzHRsNeDTjEtFH7/821jB4MkV2MHzDMJIOfFsgXuV3l?=
 =?us-ascii?Q?hrJf8mzVP8NuHfAYymSRpknKET/n2kKUZQDWzApOuwFmKc0F8LYPAMuSs8j9?=
 =?us-ascii?Q?Ho+71sJuni9xrPu9BPRk/sH3U7OxlfiF//kCKPZUmmcCP7QobIzD+VzEuXjX?=
 =?us-ascii?Q?ZSrzzJL7nzyPW5IoFH2hX8rsMSOdZV0aaO8zNx7uyubjXMnRxk9Hz/0Z104S?=
 =?us-ascii?Q?Qx3+8/Rjwqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ko3m9D/5hGxWgIuzKdQJbtNgrWS+6I/0umIZm5tsKpVjG0xmCFSd5AVghD6w?=
 =?us-ascii?Q?xH0EupejxTNCntT5W4uHLWvnLNNwUirSQ/dg2ndWo9GNCIzg5ZN5yS5TA7Xj?=
 =?us-ascii?Q?b9Xl9+L8hrGaKvt98tU4uV314bZUD7AduA+7QzWsbNfwiAidyVTjswf3pLli?=
 =?us-ascii?Q?YV+0ZNK2Wql7XA6+6kHrxU6RIpQrSXIqtC2iZRmbatxguJgK8M7fCATmHWTP?=
 =?us-ascii?Q?oaUJcsadxuAKpFV9rPxRTsSsG8AHwDSDM8pxpBKcdQ2GNi2zyHDvBgI5spua?=
 =?us-ascii?Q?E3dyexPVthOGLM+EDb31wrOMCEfeydj+RuwGcTk7FNT1lQmYVg0m+hnv4QzI?=
 =?us-ascii?Q?0UdXDp6LiGvziBvT6iKuJsJtXIMZvxWzs2/EETlnCyMNzzBDwMN3zVw+6BmV?=
 =?us-ascii?Q?hHHGY7NWtgEqxEzm04mibajlOuJ9CsPTzl4zypnhGSxcA5KaibsxVu5g2Gky?=
 =?us-ascii?Q?iQrlrlFXDnCKzZPEMkxt4XbUsRFtgr9/b+N5ZMM53v0ekNsy09kicrFEpSwn?=
 =?us-ascii?Q?7YJIggFwmxy78SFzVSvhr7/VVxP6YAEWkBAFy59aNFlzfi2Ruy6erCJsZf+k?=
 =?us-ascii?Q?BDSsPjIxp/RXS4BiqUsdsHJR1BuhmWqM5ORmyUZnSA9IFSGPQyKtD0wPelei?=
 =?us-ascii?Q?p1BZ9wqO7u+MhFzzZhKOe58g1UJ0tC4ew3xlN4YgPgyQsAXH/1IbInfrLDTp?=
 =?us-ascii?Q?JXK4Cg3iZmL+IzGE4L/+NueFmBqj80Zk0QkkeF94gkbZTl+X1o0M9OHV1o9O?=
 =?us-ascii?Q?4odoEqoIn9Gd0yXsRPFh8J+DSJI7vMGEMr2xAw5k5hGc5N+3SohpVbzWQbMU?=
 =?us-ascii?Q?i6Xbf+kpGQIGvE65I3Bx0G72gQGR065Cq8dFz++IVslN7/E23KcBNftBKGvD?=
 =?us-ascii?Q?7CzT21vyPEmo1z2S+/4X48//sWhfjQwC3caDPglg+rf0wwBbVGDVbovzhD9Q?=
 =?us-ascii?Q?HkhgSA6ya3PQ3arXubllqH4MONfIUgyAwzNQfK5ClGo1fAxspSIJ/mf7HoeT?=
 =?us-ascii?Q?gJX+aVzcYDw5HmST2fGBzJiA9fRiU1W38Ox4p9Z2WDjoOBZBSuEpW6gSrEzw?=
 =?us-ascii?Q?/xnmECZFcynvkXjuljZ5RhtfFan65NHzd6dLcKp5OtuUUvpx5VwVjMAYV6al?=
 =?us-ascii?Q?GVv1xpgqRjkUkUowqTqNXiavIFo7i3XYMN7gYH0utddYqzeXLSxq3gSORAr/?=
 =?us-ascii?Q?fJuxaF2wkq86eTrXCgmRt3Rr7HTduyvxtcf3OyTjYcg0CBK+pZRnhZWsdV3T?=
 =?us-ascii?Q?SL9vIYV+6kbIn1Y62g3PbXP8ig/raoGLm3Um2F3S2HJELzlB/cMVlGjEqr9t?=
 =?us-ascii?Q?0oQr+maD7zvQjPmzq+qDa/8dFfdeVT6TjCTn20S8IR5buwb4ko/LnLQYMX9s?=
 =?us-ascii?Q?CWCsDdsHXXKXBhBWI0nYWKPpnS5GqV7ymAK+YNGGOfXlPXCbmdXNqjIc6PAA?=
 =?us-ascii?Q?xUaMbulIKsFknKHXAtXjUerdzHT4zDGtnkzmq4tXSIacGfqj8UqfwAnEsa5p?=
 =?us-ascii?Q?1Sem92DAsu8byftEuCOoTvjcys+qsqtaVa9r7LdsknksOHnvo8Zkbe7WD8QD?=
 =?us-ascii?Q?8BpoXOu4TjxVmzzv8YT6DHlYMdaWCg4MyFj4cMnQvyOPmiHgrC7ySl7vNUB4?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fa2831-adcb-4c32-9e5d-08dd94301cde
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 04:14:12.3791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BLmP5ulJXe+rp64qfyGPu0nao5vXyHtZlpI0f4HL3aPHSUiyk6PBJ7IeYHXzlSYns4INKTiB+4a6T1YyFGkIOo6umArdKkdVNCLbWNkfYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_211416_976207_551E6D10 
X-CRM114-Status: UNSURE (   7.75  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add quirk to configure gfp flags to only allocate buffers within 32 bit
addressable range to support devices that cannot support the full 64 bit
address range.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index f3247a47f9ee..bd20d857c96d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -225,6 +225,11 @@ patternProperties:
         minItems: 2
         maxItems: 2
 
+      dma-32bit-quirk:
+        type: boolean
+        description:
+          Set when supported addressable range is only 32 bits.
+
     required:
       - compatible
       - msi-controller
-- 
2.49.GIT


