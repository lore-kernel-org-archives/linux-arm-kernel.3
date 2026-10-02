Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C57ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOmwcXedXGIt72UD40ZccH8EYZWiDHmAEOjgUeT6y14=; b=sd7jW2nA0Hv4SHrG3rfLn2O7ll
	YghV4E8YYysb7QhwcsYqciIv0YhawRHtyhLK1jRErXzUIxQ0WZWsKUWXLpgL+REDLrbNPLLXuFoUx
	BjqdOcQZ7CK8yfloxZMnRew/J5RiYq869DmPEL1ddlQnduWyWXltXa6USevB9vDpFzgn4G7WgYSpw
	eYk11gy1H/TIXxqMntUKNq6iTOH6UO+Rv1rmQ+5ywm3T7TdQJRe0ABLzD33jqE+etnEoagux5WFW9
	7CsWj2gxZ97OsW5naO6Bpz4Bl2FzHfS2tCud6SVs/HnSo8gK2hJbCifjEUf2Ix1fOPVKpoSNwbw95
	advLPEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjp-0000000ChTf-1MoR;
	Fri, 02 Oct 2026 23:32:25 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjh-0000000Ch8x-3By0;
	Fri, 02 Oct 2026 23:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/OSqByWLXCTUEogzpQZIX9UVBu/eXl5LYqpcujTajYy1d3dwttgRGrKMujCfBOeoq7if1NjrL/0/KB8xItuf+jMkuddgaQDSFc+RoWHO3zkQ5oqMxo8uk5yZQdF9Abb+46dHkZxIkpPHKseuRLQp1tPO2+HUHknZmUfnygw5wydDbETJRMZdQuOgvrxDgcrdWrzCSIE7ep6SHZ0ebHPCPam0DcM2TR/OZuQowOFACKvuz67nKJjKb7VS/cjzhnWZuEk1qyd0lbscs3cOJxYp+SLclU2/NLj6svFh8t+3KzacM5UTonXVHENY0LLwR+b7c8ukl/u8GbnVF6Eg4Y3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOmwcXedXGIt72UD40ZccH8EYZWiDHmAEOjgUeT6y14=;
 b=jZzp5e5kKhgYAzuzCJ9Kv3VyOxE0kqyY3TSKsX9XZKCGYMPiV1/Q3Tfsq/90n5sEMaajltGenqP8Qdf6jqkgvyd4ml+3iwolthQJUF6ccGN/uHsuDBa6ihFGRFXRC1BOUeglcYB5iiJbiDtZXm7XHhqrditMv6uc/dboAGn4D+j7eBKC9TVPORpKeHsSda0iciUre6TY0H7ro+5+xBzPXNUcY4qw5EVVth9KiKxlMkK4IJyaYnpFz6V6X13HC1IDbXm7mroMhXcLYwwR3PQ4WdZqCl3zXyGIOH49JXqWxywWYsnWwvPwid5wM/SbsA170oQFr1UsIP4ydmyoYqmXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOmwcXedXGIt72UD40ZccH8EYZWiDHmAEOjgUeT6y14=;
 b=n3hbo23MmbMJq5U23G+Hz21xAGDFIsMl2ujOoOB8+Efw2KYlK0+vatsUSUQDH4+91L/VwZ2KrTio73V0fS6qusMm0rh2w/opLCuhBiIInyxkpoSYnszB3RSjn3zPX4SSt9qC4AWg7wIqg9kAWheiYicaiJ3cZst7tD3TnEVEJ237yer57u+k/ZvU0NMY28c8CDJtkqg3ZBTB+yJmxmLzhjCKF/6ZuVvApnhIf7JrwMsAUQZ1BaztAOXwrkUsbzAAjqZjXGQofM9C4ErWSuJCb/C8I1G+Jrlv12DbT8NIw3dqLEVwwP/M37PjB5XYA+iEKHzrs/Kio+GImNshUiWI6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by PH7PR12MB5830.namprd12.prod.outlook.com
 (2603:10b6:510:1d5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 23:32:04 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:32:04 +0000
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
Subject: [PATCH v2 08/15] efi/libstub: Have efi_kaslr_relocate_kernel() handle extra_size
Date: Fri,  2 Oct 2026 20:31:45 -0300
Message-ID: <8-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
In-Reply-To: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::25) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e0eedf-beaf-4da7-11b8-08df20dd5929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|10067099003|11063799006|5023799004|6133799003|921020|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UGmfDSfPZbopnNzT8eBy+5C9WvF7GODrWwnXfznnkyg4C7t9TEYYlz69wtWVkO7zbeT6SL3SjKGUxzryC3sRiZwsQmjdpRqUxPfDw1vKsvlozzIWbsnRnW8CvYVGznKyzjDsfji+5NoaiTgLCvMAPt0P47YHSZ8xVFNreHcGayomk1dcR5OHTUxvpK21Qw/JrRFj3F1YssK/QLUzpo79FMwlpwGOLNdoPUu+DmgVM7GTOTlnwPKrLJorSPRzDRRMuJIPy+z/l4vSjsuZA/2lgnghKYYcQbB53Vx5MwweSrmXQPZ8Ag5HkhAIO8aNYqOYVaoyjnJOsCTEZgrvppysY4BcKLmeVgsgH+QyYozvs/qVmUU8kyqUGEyUDiChAeCS2/kCdOuT7nq5qUh9zXEP+5h+zEL+2dSSMHgsHl6oxv2zGI0ZCZRcbrUXQ/eNwAzIJZDHtpH3fR3Ofdsz7259S8wxzQbVWV6hm4zXmhlZHumqOIE5H6D0ZgJ0XmBJde6DSohCMT2ALl/1T+nfQXUyL9dJNfLZMX5KqsrseekiolRj8716DavYAWfKoJWNfvNjNtU7O1nAYM2yXMe3Gdm2YowMz5N1KlgA9wvwKeooyL21vlGr5JEfDg7O2gCkxhSmkAg6WmzMbYuoKqNo6CaAM/t6Yze12d4DsfBNIB9/lOc8gtB3l1hNMPGeGp5RKC+gs01yquia3gvhctYL5ghQXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(5023799004)(6133799003)(921020)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1CVqpylt/7QsbugTOtQayANYeWsODs0mJWlXmjQ7S2XXuZSieaJ0Q4VFXKy?=
 =?us-ascii?Q?e8fSnMg0fFBfzw1Nh93WBZj/KtkG1Dap0h8jpOAN1a+gmj/CzQnQmPvqqIvT?=
 =?us-ascii?Q?c3rLXAYcWZW1HCCrZ58+VseBX3DLEGb1eRqs8jAQNXcPM5mjSaJlWoN6PwvP?=
 =?us-ascii?Q?00Omd/AXekFTKrMrCXYDbinHMdT8JlxLoSsiJpFRXtvXArV5UpN55Y50Rdc+?=
 =?us-ascii?Q?i2QBpEuXXctZiVNCJHXng38jbZA0KAOYXgsQtlM8thheuDIOrvPBQpyUc6Em?=
 =?us-ascii?Q?s7VrJ5EuPOpYBJ0kEnWic+ltixK9ez0llTKk1MQfUu5B+GXQ6tN/jRi18g04?=
 =?us-ascii?Q?5R38yodVhoC1MzGHxcRIacED4lYhEZ+9IlJehHCxUSP8vAxnj1+KETEDqT6c?=
 =?us-ascii?Q?LL6EqArDq55YEX7ACLPb9zZJE5wevZqRrKZzpoK7+C33EnQuoWiIHRTpmHUP?=
 =?us-ascii?Q?vF71LJMBYCOkWtBn9e87A2Wv+eGMsA0LBHbv0C+ZpqseOMQnDr3/ZoSOln8O?=
 =?us-ascii?Q?/NnQ84lJ1Gt1LQkRE6kOitk2WHiJGr7eRCGgoNUou/kth/tjVLc6nP93i/6F?=
 =?us-ascii?Q?02BWTGXTMyhujLCwHVApkct9j5tgba1WE2Eogx0JYNHf7InsYj+rGQWVe/6p?=
 =?us-ascii?Q?/7E5Gl5DifrlIAe8SLwpqJKnRnkMGIfMhupdjzwJ+1yShW1AF654BtuK2plj?=
 =?us-ascii?Q?mg0GHk8Cgjiab3v0CahFEhYSXpwt4YGlvd7HNg0YGsAfSC9ZDXKwDkznQRVW?=
 =?us-ascii?Q?GMalqZcT9sgCofAsbDsGXMKVE+cFkue1g7Saywjra9PIbVtaeUwEgpXTvjlT?=
 =?us-ascii?Q?skiZiFOaznWzIJCSem1g6iJIWhNM4DFFeJmEpVBbRCzAack35HxRzCwxHZVx?=
 =?us-ascii?Q?W+IiEjWhZWZgI/ocmWMyB/azYfHm0HkFdoRlkRwwFVNsBrOz7S+p3+cMG9og?=
 =?us-ascii?Q?ETQntwDrCqKESIm4rpIp+Bj8mTUD55CDEoIsRJfYCvVQrf02huLCkchBpnwl?=
 =?us-ascii?Q?9ady0nybBSb6jkKKw3sl16DKRazaeHLAiH0zbXYXitslVP6yShD0ZT2bNOse?=
 =?us-ascii?Q?iTSAc5tR/++29Uj+48aFYDQPLyXC5K6koFrrDAkxVjNMnYysrh3WcJpUGtyf?=
 =?us-ascii?Q?ccksEhE4YCbKY9RK4otOBA15Nmd/ENyHmthFRm8Jv6fdB1moFDz6FfD+/+WV?=
 =?us-ascii?Q?rFbNiZO/xegoO0Mt0jABSnghnZbIoXdc40KiSJbZaw8xA24y454gtyp6Iwat?=
 =?us-ascii?Q?y4Ss+1bW2WN29QYTR2cDtrcNHfuKcAUKJrtXyjDVAHzn34TEeUQ6Eo6vmLDi?=
 =?us-ascii?Q?5jQEPK4y/NdIQklKYauqRT6XBR62xCYJi7Syv5bruiTEna+b4DpYjHDdH7BT?=
 =?us-ascii?Q?znTgNZ0guuHy0Iaa76ImJSCRO7/xVSNZ5YzM6QSHR2xVsANoYhtauL7CpmA9?=
 =?us-ascii?Q?3K/29hyhsxSPQGRbWGcT0RHW1D7El6UDl3d6F6OqJSFsXLBF5mMmjZJTQ1Re?=
 =?us-ascii?Q?fh+wl9x9dRv8tnVPCtegKXmf33ySFqakiGRIJHmrvXqS0BcnODPRGl9DVAYD?=
 =?us-ascii?Q?hllqM66aK9hTcHSUglR5T2WoIsuuXn+REmrAQKygwjKyUCdOqeLFWVtB72aG?=
 =?us-ascii?Q?utVrNTQqUhOVJpjOET5tGh24zgguWfGVyvol5v6Yn948OM44/sU99SeXF62Z?=
 =?us-ascii?Q?chrksg1Rxoyh5a+ZHFwdEBwgWMmWR4VWvdYJkBs+1F/eGBaY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e0eedf-beaf-4da7-11b8-08df20dd5929
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 23:31:56.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjAlIlOlv8i71At5Vu85f6XuWpKqnpGG6y/n0RhxQgB+sA7OOUTghLiTeazMa5+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_163217_830814_AA15AF49 
X-CRM114-Status: GOOD (  17.88  )
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

There are three possibilities here, each a little different:
- relocating for kaslr, just request extra_size like the zboot flow does
  when allocating from EFI
- in place, attempt to allocate from EFI precisely after Image to
  confirm nothing weird is there, failing that
- like any other error with the in place EFI location allocate
  non-randomly with extra_size included

Remove the callers' assignments of reserve_size since
efi_kaslr_relocate_kernel() now does it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/firmware/efi/libstub/arm64-stub.c |  1 -
 drivers/firmware/efi/libstub/kaslr.c      | 72 +++++++++++++++++++----
 drivers/firmware/efi/libstub/riscv-stub.c |  1 -
 3 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 1d10a166abf8d1..6226d83cfc35ea 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -38,7 +38,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	info = efi_get_image_info((unsigned long)_text);
 	kernel_codesize = info->code_size;
 	kernel_memsize = kernel_size + (_end - _edata);
-	*reserve_size = kernel_memsize;
 	*image_addr = (unsigned long)_text;
 
 	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 4bc963e999eb97..e419f3800af517 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -83,11 +83,47 @@ static bool check_image_region(u64 base, u64 size)
 	return ret;
 }
 
+/*
+ * The PE loader owns only kernel_memsize of the image.  Try to own the
+ * requested tail separately at the exact adjacent address instead of
+ * relocating the complete region.
+ */
+static efi_status_t allocate_image_tail(unsigned long image_addr,
+					unsigned long kernel_memsize,
+					unsigned long extra_size,
+					unsigned long *reserve_addr,
+					unsigned long *reserve_size)
+{
+	efi_physical_addr_t tail_addr;
+	efi_status_t status;
+
+	/*
+	 * Since we intend to use efi_free() for reserve_addr it should be
+	 * aligned to the higher alignment since efi_free() includes rounding.
+	 * For ARM64 the kernel image is already aligned up to EFI_ALLOC_ALIGN
+	 * by the linker.
+	 */
+	tail_addr = image_addr + kernel_memsize;
+	if (!IS_ALIGNED(tail_addr, EFI_ALLOC_ALIGN))
+		return EFI_OUT_OF_RESOURCES;
+
+	extra_size = round_up(extra_size, EFI_ALLOC_ALIGN);
+	status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
+			     EFI_LOADER_CODE, extra_size / EFI_PAGE_SIZE,
+			     &tail_addr);
+	if (status != EFI_SUCCESS)
+		return status;
+
+	*reserve_addr = tail_addr;
+	*reserve_size = extra_size;
+	return EFI_SUCCESS;
+}
+
 /**
  * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
  * @image_addr: Pointer to the current kernel location
- * @reserve_addr:	Pointer to the relocated kernel location
- * @reserve_size:	Size of the relocated kernel
+ * @reserve_addr:	Pointer to any allocated memory
+ * @reserve_size:	Size that was allocated
  * @kernel_size:	Size of the text + data
  * @kernel_codesize:	Size of the text
  * @kernel_memsize:	Size of the text + data + bss
@@ -109,6 +145,9 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 {
 	efi_status_t status;
 	u64 min_kimg_align = efi_get_kimg_min_align();
+	unsigned long extra_size = efi_drtm_get_extra_size();
+
+	*reserve_size = kernel_memsize + extra_size;
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && phys_seed != 0) {
 		/*
@@ -125,16 +164,29 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 	}
 
 	if (status != EFI_SUCCESS) {
-		if (!check_image_region(*image_addr, kernel_memsize)) {
+		bool image_region_ok =
+			check_image_region(*image_addr, kernel_memsize);
+
+		if (!image_region_ok) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
-			/*
-			 * Just execute from wherever we were loaded by the
-			 * UEFI PE/COFF loader if the placement is suitable.
-			 */
-			*reserve_size = 0;
-			return EFI_SUCCESS;
+			   (unsigned long)_end + extra_size < EFI_ALLOC_LIMIT) {
+			if (!extra_size) {
+				/*
+				 * Just execute from wherever we were loaded by
+				 * the UEFI PE/COFF loader if the placement is
+				 * suitable.
+				 */
+				*reserve_size = 0;
+				return EFI_SUCCESS;
+			}
+
+			status = allocate_image_tail(*image_addr,
+						     kernel_memsize, extra_size,
+						     reserve_addr,
+						     reserve_size);
+			if (status == EFI_SUCCESS)
+				return EFI_SUCCESS;
 		}
 
 		status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 725b634c517919..a88b2d275e5bb0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -37,7 +37,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	kernel_codesize = __init_text_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
-	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
 					   reserve_addr, reserve_size,
-- 
2.43.0


