Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6240CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/TNSDK51KEaNBTo1DMLY4DHz1Ol2XIRRHRNeKhH6vs=; b=CYb+ddZNHUkRFHgpYgrKy8UajV
	03uILKQopPnn8y8TCh8qMJQ6dM11+QVPhF0tv6xMewoOYxKmUCcwAbHEoWCCZb40LGleqUaNE4c4K
	CozQovq8MAbF807XejDyUDjxt+sHy6fwHD/+lGPew229Vx8r5e9wFbY2LzlwVC7KrRFGV7LkkjMeS
	lFeq8n4xtnYJPeux0xp63AbdsEq8CJna+bztZDxJhXHgTmxk/D/nVv9ar8cuDbOuWt+5b1xyu0QhT
	7hkDbxdqdXSQOpRPAMloZIkJtz+IIhrg1NPf3zmWwv3Fg8FbXtS83kpr3nhysM4/wO3Dif/xRaCZb
	Ul0Zyf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC9l-00000008zHe-1yQz;
	Wed, 12 Nov 2025 14:49:09 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC9j-00000008zHC-19me
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=Y/TNSDK51KEaNBTo1DMLY4DHz1Ol2XIRRHRNeKhH6vs=; b=zPH4iuqJDw0VV3v+
	PBLlhleuXAl8nce9Lh9Hes0xKWiYiqRKLEL5zxcWj29as152Gv4stb5+hDnC2CjZAsQ2CAtYI98Nn
	u7JbtvAacN7Zag/hZo8vWpgRPr1w5H1ckhz4haUGOtcEynXp0DgwpivTVXYYIwCrQRnS7Lv+faHFF
	eRW/Gd113OvPW681OPDA1LmChdig2M8q9kSFX6nj0D4G9pSWaMd+T8bHUrPsM17bYQed902RtmjQZ
	fB5994qHjw0GmdKAIlJxP/qGOxwYVqcRo55ZoA1Sgn+2xAjCukuA/qLHtt09Ry+gx5ajo+HvRzazc
	YDFebkVPkCi+F0+mjA==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vJC94-004DRg-5j; Wed, 12 Nov 2025 14:48:26 +0000
Message-ID: <59f8bc30-c1c6-4f07-87dd-cd2893ae87f7@codethink.co.uk>
Date: Wed, 12 Nov 2025 14:48:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] io-128-nonatomic: introduce
 io{read|write}128_{lo_hi|hi_lo}
To: Chenghai Huang <huangchenghai2@huawei.com>, arnd@arndb.de,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, ryan.roberts@arm.com,
 andriy.shevchenko@linux.intel.com, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-api@vger.kernel.org
Cc: fanghao11@huawei.com, shenyang39@huawei.com, liulongfang@huawei.com,
 qianweili@huawei.com
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
 <20251112015846.1842207-4-huangchenghai2@huawei.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20251112015846.1842207-4-huangchenghai2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_064907_404639_370683EC 
X-CRM114-Status: GOOD (  16.80  )
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

On 12/11/2025 01:58, Chenghai Huang wrote:
> From: Weili Qian <qianweili@huawei.com>
> 
> In order to provide non-atomic functions for io{read|write}128.
> We define a number of variants of these functions in the generic
> iomap that will do non-atomic operations.
> 
> These functions are only defined if io{read|write}128 are defined.
> If they are not, then the wrappers that always use non-atomic operations
> from include/linux/io-128-nonatomic*.h will be used.
> 
> Signed-off-by: Weili Qian <qianweili@huawei.com>
> Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
> ---
>   include/linux/io-128-nonatomic-hi-lo.h | 35 ++++++++++++++++++++++++++
>   include/linux/io-128-nonatomic-lo-hi.h | 34 +++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
>   create mode 100644 include/linux/io-128-nonatomic-hi-lo.h
>   create mode 100644 include/linux/io-128-nonatomic-lo-hi.h
> 
> diff --git a/include/linux/io-128-nonatomic-hi-lo.h b/include/linux/io-128-nonatomic-hi-lo.h
> new file mode 100644
> index 000000000000..b5b083a9e81b
> --- /dev/null
> +++ b/include/linux/io-128-nonatomic-hi-lo.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_IO_128_NONATOMIC_HI_LO_H_
> +#define _LINUX_IO_128_NONATOMIC_HI_LO_H_
> +
> +#include <linux/io.h>
> +#include <asm-generic/int-ll64.h>
> +
> +static inline u128 ioread128_hi_lo(const void __iomem *addr)
> +{
> +	u32 low, high;

did you mean u64 here?

> +	high = ioread64(addr + sizeof(u64));
> +	low = ioread64(addr);
> +
> +	return low + ((u128)high << 64);
> +}
> +
> +static inline void iowrite128_hi_lo(u128 val, void __iomem *addr)
> +{
> +	iowrite64(val >> 64, addr + sizeof(u64));
> +	iowrite64(val, addr);
> +}
> +

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

