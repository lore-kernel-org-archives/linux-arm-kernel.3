Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE234D1BDDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t29gOT00reR4nbxlcJY0aptmffhd2gSsC1GS8E2B4Hw=; b=sXqD7D/TJIMp2GyK+Q59baAGNc
	aSadpw73SSAoxkbqoMFywfqaIcHeyS4qVsVnBG3xamG/xXYMhsai1Ai0ATed85Oe9XaDeMdPUqv9Z
	K808tdGeSkwiD8f1GzlCPmP8JoL/vNDnB/ucEWzGe3RN02NhgJj1nfkzOQ0WIk0YlJVuWsLVftpB5
	Uutec6dhzl41OzQsoBqEU8UoSOLTI4S1/Ur4VRtt7UIT9YUu16TrkQqHFgJCcpFZ+NgqaZYVPXIee
	5voFzf1qM4kXdQvBnnVucqwLBCWxphO/uQCNhThs+8F2NQvbzL/OlQefxrm9/5T9IRadL8bbPsiZB
	QqjRGW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81gO-0000000EjdH-25Gl;
	Mon, 04 Nov 2024 18:20:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81X3-0000000EfWr-0nwj;
	Mon, 04 Nov 2024 18:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46F89A4251E;
	Mon,  4 Nov 2024 18:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F8FC4CECE;
	Mon,  4 Nov 2024 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730743828;
	bh=A9QEobhM0Tk66PTKUxkoy2PH75AkXVl7kAtDO3RqV40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMfO1/O0f3WTFHcevl3ZKLDtacBxMdE3BT7RFEx/b3+uCvKbbdhBTvloMt0wa0OwX
	 n90Z5gcaPjxU3VikQM87AaL+farAbSj6GceGjTrdFooAVP1M8KvLcXwQ38fUeWBv8N
	 nSueT0gGDtEoY8EFJAIpvIVUUWXl5Q+eF6EU53irRc2UnkG16rz8Z0sqp62Nd22MA5
	 VHQu3uGLJaQJEr8WHqAb0R2V4++l7ByYkHuVDtoe7B8G75lQBftyc2Y6tQRfZwmKhm
	 h8Lgj1UBc9z/xdcPqGhAJ2c/yL+WIAA6KPIsfzCpa8AVQaSz9Mv0vPpuMxziyvvJML
	 5V3YtcPfQjK/A==
Date: Mon, 4 Nov 2024 18:10:26 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 05/18] arm/crc32: expose CRC32 functions through lib
Message-ID: <20241104181026.GC1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-6-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_101029_323491_DBB94A39 
X-CRM114-Status: GOOD (  10.66  )
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

On Sun, Nov 03, 2024 at 02:31:41PM -0800, Eric Biggers wrote:
> -static int __init crc32_pmull_mod_init(void)
> -{
> -	if (elf_hwcap2 & HWCAP2_PMULL) {
> -		crc32_pmull_algs[0].update = crc32_pmull_update;
> -		crc32_pmull_algs[1].update = crc32c_pmull_update;
> -
> -		if (elf_hwcap2 & HWCAP2_CRC32) {
> -			fallback_crc32 = crc32_armv8_le;
> -			fallback_crc32c = crc32c_armv8_le;
> -		} else {
> -			fallback_crc32 = crc32_le;
> -			fallback_crc32c = __crc32c_le;
> -		}
> -	} else if (!(elf_hwcap2 & HWCAP2_CRC32)) {
> -		return -ENODEV;
> -	}
[...]
> +static u32 crc32_le_scalar(u32 crc, const u8 *p, size_t len)
> +{
> +	if (static_branch_likely(&have_crc32))
> +		return crc32_armv8_le(crc, p, len);
> +	return crc32_le_base(crc, p, len);
> +}

kernel test robot reported a build error on this patch,
"undefined symbol: __kcfi_typeid_crc32_armv8_le".  It's because crc32-core.S
uses SYM_TYPED_FUNC_START(crc32_armv8_le), and this patch makes crc32_armv8_le
be called only via direct calls, not indirect calls as it was before.  I will
fix this by replacing SYM_TYPED_FUNC_START by SYM_FUNC_START.

- Eric

