Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576B4CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxOPE6m3XrpP1DNbo4t/csrkRcFwu3gU8cjN8Wtwkv4=; b=T6yHF/nDUMjvTMuAI14wX6yk7K
	KDpw0B8C9/4Zx17oOWvTL9Qh5HFreLIyomg46wvaDdxE2w4DgNU7rnPg3XmEWiTCLIZFN06DdKrBH
	9VS3EU215Ckmtt0314eiOreYR0OVVlg6j8HC7UJZXf9zUWMLGBciHlIZPppzG2DWmwQ4BgTfvelZ7
	5F3871Mz6oTYPOAlCSqgKdzIonD6GvRUYg2Nf2BPlNvN3K24z49QkOstZNNexgLeseoC02jsEnEe4
	zc+pCfpzHzXqMV1sdFO1PWBeDvxD4d1Wmobx6QC80vPM0NZGXyyu365HDAsFqA5rcrcJNUVX3BhB1
	uVi2/wkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjd-0000000ChBp-2pBo;
	Fri, 02 Oct 2026 23:32:13 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjZ-0000000Ch8x-36Pg;
	Fri, 02 Oct 2026 23:32:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6yYV6ypzYcRWW6TtxAz5/f/nZ06Syjn5dDzqf+6nGxJueAqe1SA01RK+xEBfOWLFb+nD1HBLm+BLCo9D/01qNKrcK0tSovredwQ9OHAPiW0GYY74n+eqCPFSVM4k4klLeIiIAOqAj7K4wT9FKBVHig41WJA1dMJl2YkJk0sH5eq+lxI4ugpkCuLAOXADq0i7cWuMNUvXKdMEIB7IDoWwdHrRZYzgTIWEpTLUXlHI77sgxVgunfzjHrjkF1cXkrUFTvhd4qaLoL+qbqsE6dQoXtgdF/c6RyMWDGPHOgDkC4T7zPEbJhzocSKbYCpxj4qfgkJq/XL0RCdXdPi1T5GoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxOPE6m3XrpP1DNbo4t/csrkRcFwu3gU8cjN8Wtwkv4=;
 b=kldGnRtheLy+/2+kN2Kj7zVV6ZT1A6doAmzT1z5D/VR/EV6wjkiHcoLhCBfsljuCzHEN8K69U5KCNx87+wwJnS47Y42AxmokVyFj8H+iDAsU+ENGETnR50vcf7VbZQzUnoY60UG5gKqeawbh8bNnN5dpGYHvoAFqx/HWxQh3mbpIvrDUxCJYMYw/FHHulQe3RGS37Gl1dJIG2HLmz6qugwTDvZs8kdTOcTuMmAI3aRVD2Ktd9qqPL/cIopjA2aLyAoXiMNWJZtHFcNfmy8i9R11KNai78z0BdKabrFrYhZKre8WZUYKcF92iejMCtKC54zSe9wUdiTGqdJmArH2hTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxOPE6m3XrpP1DNbo4t/csrkRcFwu3gU8cjN8Wtwkv4=;
 b=bx/SpZYwAvPoCxwmxzFwo+8B8+X1hy+3iJ2Hfykj60ab0xa7HDgABYprJzA1BG9UvYJ9w0zYIGXRdsR2ZLFKQyiNf6caIP3Ivqss+cdFUAPx0Y0tYU90F6EKoJnkx2/qAP+g0mLsqX+EDGtNwhlF6tlbypA60SkP/+zcPNdmDpWYn8xtVzLqvBhVqg/dQGYLjCIVMJWuKP4b2txUHB4kU2XZ1eai31XqZ+v5Ucovy75PcY1UVQnlVKCWf2bexx05R4qbqRdcuq4MlDtNExQaQgQwzksWREgp6ftK9tH9qnf9uXhb5Di0mD61vafP3LWFqpOXVL95c6OZeCd5cl43jg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by PH7PR12MB5830.namprd12.prod.outlook.com
 (2603:10b6:510:1d5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 23:31:55 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:31:55 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	patches@lists.linux.dev,
	=?utf-8?q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH v2 10/15] efi/libstub: Put the stub's writable data in unique sections for DRTM
Date: Fri,  2 Oct 2026 20:31:47 -0300
Message-ID: <10-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
In-Reply-To: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:510:f::35) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 55635f9c-98b9-4f40-1d00-08df20dd57ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|10067099003|11063799006|6133799003|921020|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DqMBJTkJx3mQ/IZmrONjkl5+kMtya+NylLZstTbwCNZQNlPy/k9i9WvhmTpEeBCTykUxN8afJ93ViIZi7ZLVM4QzhfLz5xnrWR9bdbVNG/IL6VE4dT8AlULqsisCJg1dZ1VpLzG/wY/Xqgf9ktxCpsELQtA0A5Ue6jYllotSNdS8JazJ7sil2iFY51ZIuJVPHnDh6aG5pXjYDK9355rb3vSB+ulfModMtshIdD37qxrdo/TErEAVnN3KBnImEmOMeyQg7AI7x6QqtVXIj7sX81TpflwOndKkmLCk2L2b+UbhwKD+3Igqq7aa03KEeeBC7MUhmclsn0lmbC+ah20QJSxw3cE6SpjDV8FHNvdj/fPcukqKtHNlMZapJAy+KsTZtLQr6idkV8AmN7c+hP4YkajSB0eyVlF2STy1rNqPcWeMX+CyV0+EgfiOqHIqsLJDKBVCxHXnMxMuG5m9uRe3A43iOCXL5kDPQaIdXADeuOgPmibwIWJKfR737JFVRd1RJcYGC44HV4eY6QAM5erwnJRt1e+1DT8M6h4BpzvEklZMvl1giOyAA+MVJqn+bNxYxRA7kaYAFAxSe+J3KI73lpcNsNd0DXagXpBPQxJAPmMPkuWAnJMtYFrsFDSqIvxdUlgGtYlfQ9ajSL7M+eKoIhfJVNfpAKs81KorOy1NoD0QxufUOegDQlzgTFPUERpEpbuUdT0XvNQNGlOFesApdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(6133799003)(921020)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YnTUIcYh5JjahHbjNUT/L2OECcFLPSUyBm0uu9KB3voYj0PUp6NZWvYYU8Eu?=
 =?us-ascii?Q?eIh+oIX7gLm39fzksOKm3vj+GF9BFPR9hFxeLM//XwajDQhlTFy6r4ribSoW?=
 =?us-ascii?Q?yUceMPvk3A/0HjTeD8dNymKTuXWKqloBPsCQqDa69x0ZqY5gEcCIU1KZBAtb?=
 =?us-ascii?Q?U47eOIU+uG6hNA0oqFf8rfBL09rsu6qeA2arHieAG+Z4wF31x9qJYMk8GJQZ?=
 =?us-ascii?Q?9mxwvEkIp0pviU6n8tiULbxeJG9YpYX6u9jwEKKAd+c+FPkg4xN/ltaODGD7?=
 =?us-ascii?Q?Wm9OZuqv7dHVn2RlGugnf13/j+OnW9EEoM1GZClxMKwF5otqJwUFOAIFySaW?=
 =?us-ascii?Q?cb70UjeUf95FRas4z4nvzeKR79fLVPiS0CDS+OykYnNiY0JE99w1uATtpAQe?=
 =?us-ascii?Q?1XBnKSzVrgXk8v39cWbV6jYYe5r1EMxdEgN78zzdqa2f9xAIjDq6SQluHQMB?=
 =?us-ascii?Q?EK7xiZYdKIzBt9jK5D99xT+ZquOWg+U6/3huonQq3+Ah64rNhS2uug/oTIPZ?=
 =?us-ascii?Q?7eVzWL++ht57jdsVjpnMuDsbUTB3P2ILWDMveLK5UXEERJ1ALUjozGzTCCXh?=
 =?us-ascii?Q?Q9fM99QqWjt8Qil8TK7DY1xRvwu5KaEVOEw71wt6nhXCIlKD/098fEJgwvCx?=
 =?us-ascii?Q?gm5g5Y6QAGoWrRKryb2bcubNva0vWbFE273l/+Fd89aRj8CmrWhc/2ruMa/5?=
 =?us-ascii?Q?qT9BlKNL5KL9DSK/KZi4nQYkj9ydwa+pHvAnhnn3WmtBEDRz9n3gv7cpQzlf?=
 =?us-ascii?Q?S/Fb67MX1/80u4WbKwvOpS5oqZcXsSPUEfzIfumGJsizt1szqn5GBmGc7d1M?=
 =?us-ascii?Q?vvOMu1RbbZcuTKO4cSzXcVoML5g+xM++MtxvzVjv5iOJVrj1MjMjyyJyDPAb?=
 =?us-ascii?Q?5eLrxXWstWiVGEuZtyYiZiFalS2aLXtXm0Ah2WVZCYDIkIJ7Dehls0YKvmBt?=
 =?us-ascii?Q?dRb5Wu4TEchCn83tqtrW2UDI2xtsnkeeEbYATvcVE3qwmPblok+FsQB/e+SI?=
 =?us-ascii?Q?HRTcJzeW2rtBpLmWj+2/uYMiwj1EWRn6XpJ8qpYhnQvWpg06ci/lTc3FFiby?=
 =?us-ascii?Q?XAhcfpAP3LtcLAYNjv1pw0HrpjVL3QnxWqcBkXKElqeN9xGMiygxHxX+5tC4?=
 =?us-ascii?Q?eroqqbI37I8gYVa3FtTblenaDCg2WGUiXugG/b+0r8IGKG/6DUTDSZfCQvwj?=
 =?us-ascii?Q?5gSwqhChaAczFuY6dvDeSClXc+fAsx9uWXsMLU3Pib4LK96jPZFC2QlssPyP?=
 =?us-ascii?Q?r9slSL308bA3fjxOBErXtcrWgDkxcGuzNGtvnTFieF0NZIaSwBFUI83f4xxb?=
 =?us-ascii?Q?9f1I9R2cdVvewWGjh8TY3/3H9YyslfSczAQcBR3DjNFU9iMNuGS2IZl5Gvgh?=
 =?us-ascii?Q?XZGhmDvShz1T/1LNfvUhpO3sP3xOdss5J4pLLWlSG46LFniERdeFhe+47Tyd?=
 =?us-ascii?Q?AMjt5rFCPjt7FE6GLzj8kXQe6tJntYZQSF2eyXQiRT4uwQj3Xgs2yhaszP+d?=
 =?us-ascii?Q?kx39ouUkeuoBKOS0NyXWaeqBDZMo9+c6oyYaprkZ/cO8QIOKtZqYSYMIzNHI?=
 =?us-ascii?Q?Nkufnq5+DCFJDPPwhAE5fzzwLSUFUZa+CJPz7TRu5FOhl+JdY8rcChEg1vcZ?=
 =?us-ascii?Q?LsnD2bW7p2bZ3jyvMxd1pedqaxYB4dy7KgWeOSAB0c8yT0XmVHL+zegrFnz1?=
 =?us-ascii?Q?LcwBl08Otfzx8z5qvT2N0n0HGGY08wwh5VMYBYee3UORc0Pa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55635f9c-98b9-4f40-1d00-08df20dd57ea
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 23:31:54.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqJw3RqOl0XjmlbVDmYif98RlMgmqPmdcysoXJtaotymobE2rDeWMjodLUbhnB84
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_163209_783768_3EC223E0 
X-CRM114-Status: GOOD (  11.12  )
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

Currently the EFI stub's .bss and .data are both placed in .init.data,
which allows them to be discarded after boot, but places them within the
region of memory we need to measure as part of a DRTM launch.

If the EFI stub modifies the measured data before the measurement, then we
can no longer get a predictable measurement.

Give them unique section names; the arch's linker script has to put
these sections outside the measured range.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/firmware/efi/libstub/Makefile  | 10 ++++++++++
 drivers/firmware/efi/libstub/zboot.lds |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f62..3f1921e6c334d1 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -142,6 +142,16 @@ STUBCOPY_FLAGS-$(CONFIG_ARM64)	+= --prefix-alloc-sections=.init \
 				   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_ARM64)	:= R_AARCH64_ABS
 
+# Give writable stub state a dedicated section namespace.  objcopy applies
+# section renames before section prefixes, irrespective of their command line
+# ordering, so these become .init.efidata and .init.efibss.
+#
+# The names must stay outside the .init.data.* namespace.  INIT_DATA collects
+# *(.init.data .init.data.*) into a measured kernel output section that the
+# arm64 linker script emits first.
+STUBCOPY_FLAGS-$(CONFIG_EFI_STUB_DRTM) += --rename-section .data=.efidata \
+					   --rename-section .bss=.efibss,load,alloc
+
 # For RISC-V, we don't need anything special other than arm64. Keep all the
 # symbols in .init section and make sure that no absolute symbols references
 # exist.
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 8d32be32931494..568b9ce4857f43 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -38,7 +38,7 @@ SECTIONS
 
 	.data : ALIGN(4096) {
 		_data = .;
-		*(.data* .init.data*)
+		*(.data* .init.data* .init.efidata* .init.efibss*)
 		_edata = ALIGN(512);
 		. = _edata;
 	}
-- 
2.43.0


