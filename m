Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFBBCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+idNlqcAGbMoo3CQDK4SQZ7yrzN7w+FLH/16+j578k=; b=JUPqp5GFp9gRmFkpMoRuEgHs+M
	thZdr0QReY6O3riahV7WFh2Mmspsn63pgYF3MCi229F2HpDVJ8EDGFDBQ/7N1JWv7c9YRrLk447vk
	6J1eYZRXwwZ2OVB4SaEvgJ+U4k0N+YmI3sfVZpcW/PPYbxicVU8hNaXmMOC6yoLMTOL9RPaQCGD0u
	KQa/gnh2im+XI/8+I743bH84WWjDpk3EnSFjMk1kYO1TYDjwHrO8VQCfQ7M9ajdJBTCopMZBM3m/F
	hXXJ0AUPs+zD7xN7baf/WzLVX2zILiCz3Jo1kgMdAmloFYWXkTeBEWIqIre00Dn+ccG5mh8Ia82Cr
	xOqFCKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlCF-00000003TR3-0qQ2;
	Fri, 16 Oct 2026 16:54:19 +0000
Received: from mail-southcentralusazon11013008.outbound.protection.outlook.com ([40.93.196.8] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlCC-00000003TQW-419a;
	Fri, 16 Oct 2026 16:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt0WQzP+cDQABQM4Kn4ut3QLMDntSP0WAzUsZUtQ6nScJ7SjVejlP94jglp3XOniYxoQik1ORKyA4l6WbmYWOHsAGH7HmhZLP5baO33qgbknlwdhW6oPIy0KWYUqziWls6vGMKoyKoYbRCDuSV+kWk2oUOzHYPW247E5mG+wkudlug0XUqdIJ0JalxfjDEBwJZWnTCIIejffaFWjr965uaUMksr6Z3naYzFLYjWj1omR4iHify2++qTR4B4lss0m8rOZSppR8m/NaU+GAIHZLuOgjx4ZfxN1BKVXIOXLWSlI9aADN1Ws1EDUTGc2AIRZo2oPbwD21kpmZVlchqM3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+idNlqcAGbMoo3CQDK4SQZ7yrzN7w+FLH/16+j578k=;
 b=BSNkhceOzZPadk9V4ftGrAeYkvMtRI7sIVnESnIJdc/ZL778w/4P3voz2erjMMepFlb6fpdJIQGveAsmSZ2LGs3DWbz+7vqd9gjrU3nf0dAw21xZe8r9mnUJ4TcioXe+uxSszUduAp99te6XveMSg9tamvMDEHejppbzT7aU9V/dsJFDiVBT7fy2JS4sRXyEElcnZZExFHClvkzgMU630c0Q1WrSEtBDJ6l0w+Zre8GE7cIKT5k1xxLkjy3takeSjgJgRIZuSUshYb/G8tt9mSgRiYZRdJD9WBwp+i5bNVZwjovUyEqojTbUw+TTXQM+QaWjIdAG+v7ksBKoELslGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+idNlqcAGbMoo3CQDK4SQZ7yrzN7w+FLH/16+j578k=;
 b=hpIC53TBADFZkxW/Whg28yqcNEvN4CFz8nImTgGVst0tZRLTcpnzqH4bxwC93qZbKK8CKx6THDD/SIIiLI93Eq+NebGsHiNYQCRtMavpjtysp8IFA0PppLVSTLH8nNvT1dFYe3QL9eBhNJvdJclJepchy5n7NHAlnbmwwTPaTDLDJMJwTyMC7cvHMy7FuoMdTqndnhHSD8AzF9C6r7pT8Bmlj/om/ZPMgOfhs+mE+un42A2A7TycR6N6acwYupfK+elNfqc9wCxq4980dmrMyFIPewlxTFKMyrwtY4aGl1MRl+rIczAexLW2bFFu6Awa1Kgn0aftfoq1ZfJt3fM8AQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CH2PR12MB4165.namprd12.prod.outlook.com
 (2603:10b6:610:a4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:54:04 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:54:04 +0000
Date: Fri, 16 Oct 2026 13:54:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>, patches@lists.linux.dev,
	Piotr =?utf-8?B?S3LDs2w=?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261016165403.GA503225@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
X-ClientProxiedBy: BLAP220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::26) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5ec9ae-d639-4d45-6986-08df2ba615ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|921020|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: vyI8zSyIm4k8XZhp7n4MVPqQQBU/Ch2U2xf/qt8bc6dlvGIyTIdDlezVdJUZdZyPX72znxM/K/CCuKvhEsUbQpDliv4WXkBTm4/8CTmseZlChZnoo0nmZXcvbSqIfkLZzmGR2UleJn7mUzd4rOJ936YkQXbuyFiUjgoz0x9Dsyo2N+ab2nzfDnsVIcbMVaBoanqkYkYoOAROO1nJMk4ndvERxehA7ELPhsw9oB5KlL1MYGXvCZXRlYne7D7wTPoxrp4hjfXxP8a3Oq/rIlMq9i9P139ZhfWf+CW2aioZayVqXdkXSqpSC5luDDBaFlSmv8nsVKWTrJdBO1CJo+BI/t2/VDqzZwyevMaLkPjpvGRsMXyWn7kuuRpYr7lu2LcWK8fE+m6kpZslk2oHrgdNhKB6HRSzNIQWyYAzoOKV8aVpQh1eP0UiQpAvq5ZeKdU4Cw4KwD0/jSUGKx8G5njDGTlLx4gChMFBoqbbvkXwRbkbWPmS2xgEw1O0iZ1Xd3+6oYpprSfyK9cmFeoONywapvKWBZqos2KeRNK0XAAoKRJ6wuhQZO/F4yUhLPfBCMOqR6dTBmO0vLWWWJlwpfdBzP+BQDy0CyGXQqRwfpyVZ42gjyI4S+iqjC+ypkt06wmqUCsne2wzCzTzWsFufJVil07IyY3GqNqmQnpSFYj+/XW6MEFjdXXlmBsRFSwX9vdUMAubhJu7vhsuzY4be6cl7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sl8cWOobVfWulWC5LserYRmzRpgwGZrgoFWMDrFAMVxLzC36I4A03l6sfuri?=
 =?us-ascii?Q?r+i56ozJlLsilcb0I4llCpfUDE4B6vuLbISa4e1vfSaFm1mCeXTSkXpI1o4l?=
 =?us-ascii?Q?GV7D5NtL+sEXXV2zsVSIsRgXVfzG49FwDSwC5kbXpoKQTVp5rXQHTCRgQSy6?=
 =?us-ascii?Q?lOun31crKdy1I5S/TpxGcArXFabtfTh9e2beC2n7x/8XHdWgMxjbtPHD5dte?=
 =?us-ascii?Q?Zo+2UwLlwHRq0b0T+4w9I/fFqj9ctwFERkXn2fk/yZ7EV4r430BXH49RFdIi?=
 =?us-ascii?Q?AHRPyBmKwx+8Rgn8jqXXiMdCN9o5psPYionf40J3h06ViKfpb65gwUrXOGKz?=
 =?us-ascii?Q?7zUHF65/5D1956GzAQVXfpYZ+kiYIdDpoGhP9gdg7I/qLlyVxKKk1ETdJH+5?=
 =?us-ascii?Q?9nHJDgeGUpoOaBIng8F8jnOnA6gmeN3XNMMI3/+316L5ifP0W5OueI27AmHu?=
 =?us-ascii?Q?PjqavIt7eGXSzgFt3FvXR8vM/Iwgp0WitWXwO2glC+cvzWcc5GXhKrLgV9gH?=
 =?us-ascii?Q?yxKJYnAWOIhfqWFsbYmA1qM4CDVGHNQuEILsl/W0UeveRMsqPEoAJfQTnTpi?=
 =?us-ascii?Q?9+dLYrWK4vZOhhC5jI6zNda1SAA8Lq6BhOUPe97Hw5antUkcz7s3qArlAXBW?=
 =?us-ascii?Q?gCAXnyBICrs2I+IceefwZM7krnB6ua20ZjpXi/p6pIgmXmdhEDrPz/T8TbDC?=
 =?us-ascii?Q?WhhkaTaoVHxv1gPth3rIbezpPvMO8fVt2UkgJYtYnLE0Ra81PJhrUJRWjRiY?=
 =?us-ascii?Q?fS7izEXjl283SIRsNpsEnn7yEmDXjvXhwey3g8qhZ3mHZ1ahTcL+tSxwcLx8?=
 =?us-ascii?Q?hREPKvsaUyqZrAlpMMYAUu+AkoNhJ38k1aWsS4t5t5U9sdJ9LlJEPKBT279O?=
 =?us-ascii?Q?75j1u0FqOv4r+z1q/pYwqwFHla8YaLm4wS6OEDzIdKSfSLdBpZp+fK43+M2U?=
 =?us-ascii?Q?9AN2CxnXQ9kDmX8QCKqO4cucD0bEYDdwrgOJArhXsaK4+l5EQbFooEPQSo8w?=
 =?us-ascii?Q?4tjAMXHTYYIkI6cEf2rhCxLD0r2cxpXBHptuKNPbuKTHLMRpGKxQB2MlBK3P?=
 =?us-ascii?Q?nX4AWNe6n8S1wpuXPAfM7rSm7IE8xt4a65s2mJVYIhF2JlVALB5hyrQQ/eFq?=
 =?us-ascii?Q?maT3wTIOseDrkOT7c5o0ubcUjW5bkbm/IKhvt8VS+HbgKswEUiyGV66RoXAb?=
 =?us-ascii?Q?E4Fh9ETYHgrpVJeaO8levKj5xwmwNvDDLrRvsHUrDwGQg3HF09a43eNZT82k?=
 =?us-ascii?Q?A4K35xvYiCYkuFXBjFo49tu7D4h6ZcCuuH4Sb8OpLexB0B+sqHAWdd9+dll6?=
 =?us-ascii?Q?gRjm4phpIPyaaKUkU5ol7nSfN7S4Z8eGRfeh3QB6P/dZxq8PvDqzMOUYjBj0?=
 =?us-ascii?Q?t4No/BYD1nvrMgbE7PteedWMsmos9wyHc28Cx9ef/gUS3wd3ZDujWUyzGTtH?=
 =?us-ascii?Q?DUacqnZwBNXn/aZQaS8SUVzPiTbafPRU/xlGLHUpT8lwxp27yZjMJduMEJi7?=
 =?us-ascii?Q?2K3vd2kUSWOJzyknbpkbCGDt4F+c4x9TPZAAwr+djWEkgO7GtSXiXN5L4mGw?=
 =?us-ascii?Q?qhEXAp0xO/B/phraAiRzjp6pv4UWKA+B0wCBCyQgfK583tgcb1ka90/1JXdh?=
 =?us-ascii?Q?gBO1+2c+CpScH0mmkoxc+gHMOcJc9CqVeDKCFO1x4AHC07YNCvTEpMgHSVRv?=
 =?us-ascii?Q?L49Oqt6mrV1hWFaRalVRgUqAh10j7VXlKrCPRmkuUSlV+GwK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5ec9ae-d639-4d45-6986-08df2ba615ff
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:54:04.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtOCklqy5zPgujMF+vKP1en6w9/UtYIJWSsiOToDhNNXJ6blRA5yKPjHpqRyAB7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095417_022327_C39A0A87 
X-CRM114-Status: GOOD (  12.25  )
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

On Fri, Oct 02, 2026 at 08:31:52PM -0300, Jason Gunthorpe wrote:
> +efi_status_t efi_drtm_prepare_launch(unsigned long image_base,
> +				     unsigned long fdt_addr)
> +{
> +	const struct arm64_image_header *header = (const void *)image_base;
> +	const struct efi_image_info *info = efi_get_image_info(image_base);
> +	struct arm64_drtm_handoff *handoff =
> +		efi_get_image_symbol(image_base, arm64_drtm_handoff);
> +	struct arm_drtm_parameters *params;
> +	unsigned long measured_offset;
> +	unsigned long measured_size;
> +	unsigned long image_size;
> +	unsigned long dlme_start;
> +	unsigned long dlme_end;
> +	unsigned long dce_end;
> +	unsigned long entry;
> +
> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return EFI_SUCCESS;
> +
> +	image_size = le64_to_cpu(header->image_size);

We've been able to do some testing with UKIs now and this line doesn't
work with systemd's PE loader, it discards the PE headers. The stub
already has a comment about this:

	/*
	 * When built as part of the kernel, the EFI stub cannot branch to the
	 * kernel proper via the image header, as the PE/COFF header is
	 * strictly not part of the in-memory presentation of the image, only
	 * of the file representation. So instead, we need to jump to the
	 * actual entrypoint in the .text region of the image.
	 */

I will fix this by passing the image_size through the efi_image_info
instead.

Jason

