Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0lfeRv40hGvSA/L7+lEkD1nDrijNNCabAYESQVVe7g=; b=uQKgc+fOTPhhhdeil00wc3hpit
	eMji2DVECqK83CtobRql0fj4xbBah86xtRgijGzz+OT4G0z3aQmzWw+3cfDWTK1+ustLPa9+1IsoP
	HfQh16ORiBbiy2lAp0xy86L3Fu/0sbRvRhMX6BzQYcxVt2exnGliwsMdMFukBl0XYtqf6OIlk6BrP
	gyDGZfywUkyNnqplrqe6LUfki1D0hWASFeEqUpsihXKrRgzx03RQSOC5lDlgB0laOdNoFWi1/37e0
	HcFDX5lDxNnI/L2C5vH3Yylz9P6EDxLkUYUJUFEvrbKzGg/k4Iy0Ag2YVsg9tfMg4K+z+zSD4ZiI5
	GA37y84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lma-000000008Pb-3V0j;
	Mon, 06 Oct 2025 14:01:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lmY-000000008PD-3hJC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 14:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A38440976;
	Mon,  6 Oct 2025 14:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA26C4CEF5;
	Mon,  6 Oct 2025 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759759301;
	bh=ABqqFmeqDAlhbrH9IOkJtThyT+fAKJdIn7eBS7vRYtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEXSwoYf4qRnBAkMtgQ/WrvDQxF2P+QFIIzlcZLavupMDnUa9ljFpQpxuR8+/asD5
	 ymxOrUWXdPwxg7ttW9tvVRG436dUgBPCUd/Z4VbUFmrtDCjYw/Y4N+jKjQWVfq/yUK
	 51pLaCwKCeotgyLPi3Sl7uNkOaWWy9b6NxnZFO54z0ztiAd2dyc5430uChhX+3n4/1
	 vttPwceFL+gxEuc4i3fklR/MpJzYxZ18R/Q8vewECgzzN3HjU4Jxg+roONgiJq8/H7
	 7EWSQ988UP385MTWmI6gMLdB9RyXREhm6OSjN99CGm+aPWbT13QaDzH3qlVr7mrnUu
	 RBl/CaIY/Md6w==
Date: Mon, 6 Oct 2025 15:01:35 +0100
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ardb@kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
Message-ID: <aOPLv_-f5sNGtG4e@willie-the-truck>
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_070142_961357_AD31E61D 
X-CRM114-Status: GOOD (  23.54  )
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

[+Ard and Mark]

On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Historically arm64 kernel contained (almost fixed) value of 0x8000 at

0x8000 or 0x80000?

> the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> in preparation for removing it entirely") and then commit 120dc60d0bdb
> ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.

Given that we made the initial change over five years ago, I'm struggling
to see why we should start caring about old broken bootloaders _now_.

In fact, I'm far more concerned about changing this to a non-zero value
and having more recent bootloaders misbehave.

> This caused no problems so far, because nobody seemed to be playing with
> the extremely picky Qualcomm bootloader as used on some of Google Pixel
> phones. Current attempting to boot the Linux kernel on those devices
> will fail to load on those phones with the following message:
> 
> KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> Error calling BootPrepareAsync Invalid Parameter
> 
> Since the kernel ignores the field, set it to the expected value of
> 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.

(same typo)

> Note: I purposedly didn't add Fixes tags, since those commits didn't
> break any of devices that were supported at that time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index ca04b338cb0d173f6d9f5bcee52f6d3d06552599..05e874977de376835625f52bfdda78305dca28b5 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -60,7 +60,7 @@
>  	 */
>  	efi_signature_nop			// special NOP to identity as PE/COFF executable
>  	b	primary_entry			// branch to kernel start, magic
> -	.quad	0				// Image load offset from start of RAM, little-endian
> +	.quad	0x80000				// Image load offset from start of RAM, little-endian
>  	le64sym	_kernel_size_le			// Effective size of kernel image, little-endian
>  	le64sym	_kernel_flags_le		// Informative flags, little-endian
>  	.quad	0				// reserved

Could you wrap the kernel Image in your own header to workaround the
issue?

Will

