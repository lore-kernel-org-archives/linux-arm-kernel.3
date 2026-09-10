Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39015C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc5cJ6QhiXRh9jg+HRoNsg2f4n7bNS49Lx7RwhOsiDc=; b=VE9K/UBtai9IEvPLl1gCQ2xj0r
	Ui4FApM368Vxf/8hWzc16S9YOAzJSwS36auY3Y7wV38yeJVf4iX9ijwZuShI7kthb+dLN5wslqv9F
	kJGEnWwPzVdTbn45IXkMJ3nyvWNUnzYzzr3hRDeBhpCuq4dHpQyYZuk3W1bBgq9V3OeG8ji1unfgY
	UUm5b9jc4TSPVQEPemtqixJdnmcOtDsBxzzY2omZyPZRqgjRCSeMBUHKFDi7pJiWPiUSz0/bnOvfB
	pAFBPkZ9sMoBPrZ9ecsGhnvOGmD5d915XQmrzLJuzUqdomkVsfgLiuDQd5S+K3q77dISQbykY619B
	JMpNx8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a2n-0000000Dj6Z-3OuI;
	Thu, 10 Sep 2026 08:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4a2l-0000000Dj55-2DS5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 08:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uc5cJ6QhiXRh9jg+HRoNsg2f4n7bNS49Lx7RwhOsiDc=; b=njY2ujQDTfQD/a/4DCYaLgJ8Nx
	R/GNdHqITekCmhA+GAO2yE7i4FaBl7KoGYkc0QKJh4mChfULYRJYd6E4gg5cp+R96Bh66iXfxYoXJ
	o3UMcArPsAr2vug/NQrn/ZL9ppFWVahXcl3C4O75mZoQ2GjoM535ovez4ei5BvewHPz8L/udQAfd+
	nbJytvpNW0YzaXOOalaaT+Om0OCcAx84sqa0986HCSa2NYBVJ0thOXhQiP5K1LhaSWFv9/NRWZuF1
	UhU4+jZBb6NdqlbYqdR2hM5ySo7zu1rA+LEw4a/jFUD8XRUcDcU3RIQN1YNgUe5N2aKDSUVfqghfO
	9KAFaHeQ==;
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4a2i-00000002Bey-2fgq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqdsTRXAqil2HHVJwV9TEqmBF0EGxbDeFkT70UoUEsLkMkHxT5p46rQW6Qct+Mkb2dsbI8qAXxRUKh2vZZaM28bvisKuJlzgWtEfSbJ/SfNerNi4MKlAvmk8A2pfoRF12db8SyZnOoWAq8SxJ1Ij0HfLqBNg5gpg6pp+eNhIjGZm4djfU9zX1CDL+LSDz+F/r1zq3kJo/b7eybhpI7qSWAPOsExZYwNuFFM0jvu6bZS9ZX/Qzb7aiVoVIAoWkBQyu0hceTfBC+8ZP7DcLK4jYRUJJmOjyiWhlp2LxDAPhOcBq5uv6aOXEePvPtDYkaTnTC/UfVGTENYPSaXPCKVYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc5cJ6QhiXRh9jg+HRoNsg2f4n7bNS49Lx7RwhOsiDc=;
 b=WYscbv/DuDATkIpxu+vvfFY3EjjR+B9cEzTtmUvyZ1yYLHV8mWIsrQ1DTy2jurGHLadmAhYwIIoTERsgRYdxyLq5/44vH13Vh13JVGKiHfpxIZBtv1qbwkEJ1uqoV05WGnzWa6b6SS1H6075VyHkOLhMbGj6UCk891tJNBI1WONfyTrqnqtPoHko7Piimpjhu7dVkqk12bghjyKlsrOzrs6/AbTgmbwuuOkrhI0u4gEqJwCjTR2j6Z8wMGek7oyyxwMIBRLQrMpky0rbGUGHObwWZutF2boLWz7M5bU1N/wd3gqAtZDVpy0n5FRxVto8lzyCySqMBP170LD+pLIowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uc5cJ6QhiXRh9jg+HRoNsg2f4n7bNS49Lx7RwhOsiDc=;
 b=Tkpra/j6uhI/scW8MX3O2yzAxq4jwHn14IPFX2qA+UryD0GzhFjyItxCRQEO34qoUgkKpeWYZzp8yxbbWJPzo8wBCXLPF1wM5XrExT2sExaxAyZ9LdcavuX+Sh05IfsdiRY9G7aeZY2vi/NrfobtH3wjlI6V2tTVjZjJpd7C31LQIJbPqhSJPPWh6WWPloAI3UkW53uvBTtM/mx8zj4/bpWVrzPM0AuT6KMBNUtYylfmGX746KrsXd+sImDJgNXkyC0sFyBnufm++vlNF/3l40zWW51slEucjnw0trU/hkWqW5j1uWizVlFmVD7wxKlU9Xagsek42N/S8sxlQ9lgSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:21:53 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:21:53 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate provider
Date: Thu, 10 Sep 2026 08:21:42 +0000
Message-ID: <20260910082142.1522865-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910082142.1522865-1-smadhavan@nvidia.com>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 794db1a8-4180-4ca1-946d-08df0f1491b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nqApU0oZY4rnCpwJH1LVXtYiGldJC7fH4lGF3s0TYsCJ/OKoDtD0/MliGkU2qp/yb1yETe8N0rY1W8WOKKdIjjDxYvXFHJzJfqqVEX65oraQbYYAnqXa6uGHnbHtt4HbvwJi8VJNk4wkuG9zpJs7Jn6a8Ec3nKhBWNa+aPFfFkiNrBpNU0x3ZdbVB7QPJxQ9caqqBRQZwB/BbZiQgtUxAIdTW1fqAN30OUZK9PFFa7Eb1ecnAcmEiyekkqHBsnB7Fp0BnscxBwvRZeaKGs6wSUN7p8pgWuLopIiNxwZTQ/UdVwdkZT6xCr3R0TfU5TkpFMcfZ5bArx3alY6SQiXngHFebUq2TlVHig4agDQ2EiEe7NbtiXi2eWx8JvysiOUOhOizu2PExuz8UliS+PV/NEPGIjm5Pzty/tBtormQ5K3/U6LuigLEwThjJRDMDvDtBHrrq4+hm74vve3vd3Qui/yxRGycI1wrlX8lHP5IGDOxgrtCGEzGtRun505BaydxevRNHS9wAAm8nn5YLq5uXqhINRlEDusqpu7Wcs3IvuXpKZtXnHY2nOwfpl4jzV6XZeOW0RvqBHw/p7rpS3G+LgfC5UMc5x0GJv0QPIcezldkLXZp0IrMFdoKysJRnCcpDR9BSNBoz9P4+mY9Ow4nHiQaorXjKVdZ0YRoztPo2ZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1VCC0okd4kRNvrC0nDaRepBPlEVQJdu1WL1BqwP3sr04p01SHbwbvpR0Jk6?=
 =?us-ascii?Q?sR9qgRZQuQY4ehO5sfAej0pa7i11X1FbOlt3QkxwcA3BfofrHgx4fvQpX9rg?=
 =?us-ascii?Q?g4ygLlUnBNGoggHp36t9M1S2syauFsRZyBxSQ9JmZq/JXR6vTasUYoi90wIn?=
 =?us-ascii?Q?87u/vIvIvsmgTcipbFAlidT48n467reQfdZ8wVe4XrxEPdnMpyBbcibnYcdx?=
 =?us-ascii?Q?eSts7jAvnEFBApL57vl9BC/23qTtDBXJ53cFfABnoZw2VyANZsbmhSSGe/R3?=
 =?us-ascii?Q?hAxdRGbGqrgyUUk0sieiFyIiX/cJmIiXLrRcXGJoDVtEXEwHFx6vWI4IghdX?=
 =?us-ascii?Q?BhKIzXa6g+JarVnCmJzMEeuZb10SyHxtYJ7UeAjDQRfXEtRvLEZcTw8+IOZU?=
 =?us-ascii?Q?yFzVFLOtPrHAVJ1JWPidD4qwPJRfrNEHc+X8KBWxdtdjP7RPVsKBvqrDjV+r?=
 =?us-ascii?Q?6fVgZd0rw6tNSXbpzbIhyMLEHkKKfaPCwzwcDBn9XweB7XUs9+PiRvr3kgKs?=
 =?us-ascii?Q?f6XdXJWNjcbtrOfO0rMKu1yg48AH7Mv5vpFHYQqmmORNgQE+EikftW2KVtxK?=
 =?us-ascii?Q?QkgyeEQpiDL9fQ4CknuuaaDTDBrACrph+qRU/ez/cbUTIMIoc0B5OldGZ+sR?=
 =?us-ascii?Q?ws5ZkYcZkYBRArncb0aI5EAh3f9rtJfwRAjRVsqheSSewdUh1Y5KXlArtiCD?=
 =?us-ascii?Q?d6db7luhS8dUH6NAG+slYrvGLL1jDhdJIEoCyu1RxEoE+b2u7wlvIKE3wwIg?=
 =?us-ascii?Q?GClEH9aiUT66p0Wo9090xRo16HfO64wonyl7qOpsorOfuQsa5sdeObQ1Qybx?=
 =?us-ascii?Q?Z5Lcj4btn9fFhx2c+5lfv7H7jav/0lSvdJyyEj2o4Fvi/jvXB3ssKAbsx+Ax?=
 =?us-ascii?Q?zd+erFgyh9/T9dsOlzUDWndWVR/5iAH1frg0bhaW+wffH/5pHq6746gJcBF3?=
 =?us-ascii?Q?G4Tx2aO4ImwHK7hg4DsraRGWbHbjDgv/JeZ5QXMOB/kycEfl3kMToYd6YBcM?=
 =?us-ascii?Q?4CDGgrQjgVd8NaSSExvAKdkFWZ2jaadsU6maBv8HJAk1Q9tnziZa4vm3Are9?=
 =?us-ascii?Q?qhaDnU/nq7HOzhkRWBytnTQdyitAM2KIuGUgvTFIn+qVD5MPlYwiEXJbdJso?=
 =?us-ascii?Q?C5Y+dG3h6Bk1fb3tZj9LmOuu97ksazf4lcxqVgVJsJ3FSyyj+tu+yqrq0bKE?=
 =?us-ascii?Q?qyKp0QByPeFeYg9FUHV0lMC5ShjdMwUZXNCXudRxxw7I84K681mD9kVOAzpt?=
 =?us-ascii?Q?yMUeWXCp6DYZAKnP5pdkXcHyWiIZ5Ff2jXGjEkv9Bt9Pcazjgf+0rpY9J7uC?=
 =?us-ascii?Q?mxgFzm0grPMMIVJhpmkuJdzQ2YX6GX2hnUcJ634Cp6sH6lEQ/1MXPe+Ah7q/?=
 =?us-ascii?Q?v+nvuC+Tsgt4GoCHz+i1vAqmMyeCofqh15X11r02yt0YFAmC5hXVl+DnTGd0?=
 =?us-ascii?Q?QLUeiT7cDjCw9/Xxzk7twlJYcWiBCR8rklbe1EepXRYDTZGdYrazgGDi1sRa?=
 =?us-ascii?Q?buzwI1q2dK8j9XFxHwjDO+S9i9ZmlUQDPr4LM1IlWvjL7fb3GP+TRFxRxmJa?=
 =?us-ascii?Q?9QGZofaUhYiBhitKSYT0WuxfBGfzljcYDweemBS3anAV+1fgW4yy5CZRBmlq?=
 =?us-ascii?Q?BoNmyfaS/2VWvHLSzpXWXxPt7/TLMvYCdXHEoG8G3iFZ3e2U5LJ59kH9QjUs?=
 =?us-ascii?Q?vS9uDt0mDY0Jk20t8BXDqQUfYzaEdZXn0rk6K0cyPj+xwT2TB32uuPY4LNv9?=
 =?us-ascii?Q?gxfRaukcXg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794db1a8-4180-4ca1-946d-08df0f1491b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:21:52.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INFuxT3nPl6xkfINYP/uzVDnv7UCrCRwx1D6JRUbslurVnbHn2WAeG7DwjAOSiNQo7CYQ1r32ObJVTYpRtta3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_092200_814270_A751F95F 
X-CRM114-Status: GOOD (  21.10  )
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

Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
interface.

The provider discovers SMCCC support and attributes at init time,
serializes firmware calls, handles transient BUSY and RATE_LIMITED
responses with bounded retries, and registers with the generic cache
coherency framework used by memregion callers.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 149 ++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/cache/arm_smccc_cache.c

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..57fd1823dec5 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
 
 if CACHEMAINT_FOR_HOTPLUG
 
+config ARM_SMCCC_CACHE
+	bool "Arm SMCCC cache maintenance provider"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	help
+	  Enable support for the Arm SMCCC cache clean+invalidate
+	  interface as a provider for memory hotplug-like cache
+	  maintenance operations.
+	  The provider registers only when firmware advertises the
+	  SMCCC calls and attributes, so systems without firmware support
+	  continue without this registered provider.
+
 config HISI_SOC_HHA
 	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
 	depends on (ARM64 && ACPI) || COMPILE_TEST
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..55736a032d6f 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
+# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
+obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
 obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
new file mode 100644
index 000000000000..1cfa8f8809d0
--- /dev/null
+++ b/drivers/cache/arm_smccc_cache.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/nmi.h>
+
+#define SMCCC_CACHE_MAX_RETRIES		5
+#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
+#define SMCCC_CACHE_MAX_DELAY_US	20000UL
+
+struct smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u64 rate_limit;
+	u32 latency_us;
+};
+
+static int smccc_cache_status_to_errno(s32 status)
+{
+	switch (status) {
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_INVALID_PARAMETER:
+		return -EINVAL;
+	case SMCCC_RET_RATE_LIMITED:
+		return -EAGAIN;
+	case SMCCC_RET_BUSY:
+		return -EBUSY;
+	default:
+		return -EIO;
+	}
+}
+
+static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
+{
+	unsigned long delay_us = 0;
+
+	if (cache->rate_limit)
+		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
+
+	if (cache->latency_us)
+		delay_us = max(delay_us, (unsigned long)cache->latency_us);
+
+	/*
+	 * Firmware may advertise neither a rate limit nor a latency hint; use
+	 * a small bounded backoff instead of retrying in a tight loop.
+	 */
+	if (!delay_us)
+		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
+
+	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
+}
+
+static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
+			     struct cc_inval_params *invp)
+{
+	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
+	unsigned long delay_us = smccc_cache_delay_us(cache);
+	struct arm_smccc_res res = {};
+	int ret;
+
+	if (!invp->size)
+		return -EINVAL;
+
+	/*
+	 * Serialize the full retry sequence. With the default bounds, a caller
+	 * may hold the mutex across up to five 20ms backoff sleeps.
+	 */
+	guard(mutex)(&cache->lock);
+
+	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
+		/* Long firmware operations can trigger watchdog checks. */
+		touch_nmi_watchdog();
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
+				     invp->addr, invp->size, 0UL, &res);
+
+		ret = smccc_cache_status_to_errno((s32)res.a0);
+		if (!ret)
+			return 0;
+
+		if (ret != -EBUSY && ret != -EAGAIN)
+			return ret;
+
+		fsleep(delay_us);
+	}
+
+	return ret;
+}
+
+static const struct cache_coherency_ops smccc_cache_ops = {
+	.wbinv = smccc_cache_wbinv,
+};
+
+static int __init smccc_cache_init(void)
+{
+	struct arm_smccc_res res = {};
+	struct smccc_cache *cache;
+	int ret;
+
+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_1)
+		return -ENODEV;
+
+	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION, &res);
+	if ((s32)res.a0 < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
+	if ((s32)res.a0)
+		return -ENODEV;
+
+	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
+						   struct smccc_cache, cci);
+	if (!cache)
+		return -ENOMEM;
+
+	mutex_init(&cache->lock);
+	cache->latency_us = lower_32_bits(res.a2);
+	cache->rate_limit = res.a3;
+
+	ret = cache_coherency_ops_instance_register(&cache->cci);
+	if (ret) {
+		mutex_destroy(&cache->lock);
+		cache_coherency_ops_instance_put(&cache->cci);
+		return ret;
+	}
+
+	return 0;
+}
+arch_initcall(smccc_cache_init);
-- 
2.43.0


