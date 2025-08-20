Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547FFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0POp/c1KOeqzO/GprTJ0OTlzQ3hXFKiLpUB0jM+6XiQ=; b=HNXY2WE7EF5A2GZDkuJOb5iwOC
	LLYJpbhURf2DjCfFgPSULRnLXqPc3/P16jrTZ5aXEFc02EvHeW1CEqa7SijUltAhcb7hGrSQhyQcJ
	iTNoZr1LURhFRQSz0c0GlN/tbmHOlTdJ2QdspJvqBb4KamMzOSFFN3R6TWqnqFLRVAeen5MwsgC6p
	ua+Z8UqOk7/jfYl75OMQejdOZgGP6yqu/TIcu4GdOjogSJswV/FDNx+EvkpALEKDTjXoxaNWSn4Qs
	SKWEKvDaFQGI/e4ZPZcOp3PW9aFNngcNEb3S3jyBxeG08dEMqY82+KhZRyY4c4dgX0v9Qn+qMlGTC
	tnW4imjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorrp-0000000F9FB-14uJ;
	Wed, 20 Aug 2025 23:05:17 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoniQ-0000000Eha0-49d5;
	Wed, 20 Aug 2025 18:39:19 +0000
Message-ID: <4b691bb8-c047-4546-9ab2-c9a183a10dc8@infradead.org>
Date: Wed, 20 Aug 2025 11:39:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Oleg Nesterov <oleg@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 David Spickett <david.spickett@arm.com>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Luis Machado <luis.machado.foss@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
 <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/20/25 11:29 AM, Mark Brown wrote:
> diff --git a/Documentation/arch/arm64/sve.rst b/Documentation/arch/arm64/sve.rst
> index 28152492c29c..a61c9d0efe4d 100644
> --- a/Documentation/arch/arm64/sve.rst
> +++ b/Documentation/arch/arm64/sve.rst
> @@ -402,6 +402,11 @@ The regset data starts with struct user_sve_header, containing:
>    streaming mode and any SETREGSET of NT_ARM_SSVE will enter streaming mode
>    if the target was not in streaming mode.
>  
> +* On systems that do not support SVE it is permitted to use SETREGSET to
> +  write SVE_PT_REGS_FPSIMD formatted data via NT_ARM_SVE, in this case the

s/,/;/
or
                                                 NT_ARM_SVE. In this case

> +  vector length should be specified as 0. This allows streaming mode to be
> +  disabled on systems with SME but not SVE.
> +
>  * If any register data is provided along with SVE_PT_VL_ONEXEC then the
>    registers data will be interpreted with the current vector length, not
>    the vector length configured for use on exec.

-- 
~Randy


